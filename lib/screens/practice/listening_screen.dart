import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../data/mcq_bank.dart';
import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../models/listening.dart';
import '../../providers/progress_provider.dart';
import '../../services/tts_service.dart';
import '../../theme.dart';
import '../../widgets/choice_card.dart';
import '../../widgets/study/pencil_progress_bar.dart';
import '../../widgets/study/quiz_result_view.dart';
import '../../widgets/study/study_background.dart';
import '../premium_screen.dart';

/// Satu soal aktif dengan urutan pilihan yang sudah diacak.
class _Round {
  final McqQuestion q;
  final List<String> options;
  const _Round(this.q, this.options);
  String get answer => q.options[q.answer];
}

/// Latihan Dengar: pilih bacaan → audio dibacakan TTS (batas putar
/// mengikuti paket untuk pengguna gratis, Premium putar bebas; ada mode
/// lambat, jeda/lanjut, dan garis progres) → jawab soal satu per satu →
/// transkrip + terjemahan dibuka di ulasan akhir.
class ListeningScreen extends StatefulWidget {
  final Course course;
  final ListeningPack pack;

  const ListeningScreen({super.key, required this.course, required this.pack});

  @override
  State<ListeningScreen> createState() => _ListeningScreenState();
}

class _ListeningScreenState extends State<ListeningScreen> {
  static const _slowRate = 0.3;
  static const _normalRate = 0.45;
  // Saat menggeser garis, mundur paling jauh sekian karakter untuk mencari
  // batas kata (teks Jepang tanpa spasi bisa panjang tanpa tanda baca).
  static const _maxSnapBack = 40;
  final _rng = Random();

  ListeningPassage? _passage;
  int _plays = 0; // pemutaran dari awal yang sudah dipakai untuk bacaan aktif
  bool _slow = false;
  bool _playing = false;
  // Posisi audio sebagai offset karakter transkrip. Setelah jeda, putar
  // berikutnya melanjutkan dari sini, bukan dari awal.
  int _pos = 0;
  int _playFrom = 0; // offset awal pemutaran yang sedang berjalan
  double _progress = 0; // 0..1 untuk garis progres
  bool _pauseRequested = false;
  // Waktu audio. TTS tidak tahu durasi, jadi waktu berjalan dihitung dari
  // timer selama memutar; total diperkirakan dari kecepatan baca yang
  // terukur, lalu dikunci ke durasi nyata setelah sekali selesai penuh.
  static const _tick = Duration(milliseconds: 250);
  Timer? _ticker;
  int _elapsedMs = 0; // waktu yang sudah didengar untuk posisi sekarang
  int _elapsedBaseMs = 0; // elapsed saat pemutaran terakhir dimulai
  int? _calibTotalMs; // perkiraan total dari progres kata (dihaluskan)
  final Map<bool, int> _measuredMs = {}; // durasi nyata per mode lambat
  bool _gotProgress = false; // engine melapor progres kata pada putar ini
  int _gen = 0; // penanda pemutaran aktif; hasil pemutaran lama diabaikan

  List<_Round> _rounds = [];
  int _index = 0;
  int _correct = 0;
  String? _picked;
  final List<_Round> _missed = [];
  bool _finished = false;
  int _earnedXp = 0;

  /// Putar bebas: paket tanpa batas, atau pengguna Premium. Batas 1x/2x
  /// (mode ujian) hanya berlaku untuk pengguna gratis.
  bool get _unlimited =>
      widget.pack.maxPlays == 0 ||
      context.read<ProgressProvider>().premiumActive;
  int get _playsLeft => _unlimited ? 1 : widget.pack.maxPlays - _plays;

  /// Melanjutkan dari jeda selalu boleh; mulai dari awal memakai jatah.
  bool get _canPlay => !_playing && (_pos > 0 || _unlimited || _playsLeft > 0);
  bool get _canRestart =>
      !_playing && _pos > 0 && (_unlimited || _playsLeft > 0);

  /// Perkiraan total durasi (ms) untuk kecepatan yang dipilih.
  int get _totalMs {
    final p = _passage;
    if (p == null) return 0;
    final measured = _measuredMs[_slow];
    if (measured != null && measured > 0) return measured;
    if (_calibTotalMs != null) return max(_calibTotalMs!, _elapsedMs);
    // Belum ada data: tebak dari panjang teks. Bahasa CJK tanpa spasi
    // dibaca lebih sedikit karakter per detik.
    final loc = widget.course.ttsLocale.toLowerCase();
    final cjk =
        loc.startsWith('ja') || loc.startsWith('zh') || loc.startsWith('ko');
    final cps = (cjk ? 5.0 : 14.0) * (_slow ? _slowRate / _normalRate : 1.0);
    return max((p.transcript.length / cps * 1000).round(), _elapsedMs);
  }

  bool get _totalIsMeasured => (_measuredMs[_slow] ?? 0) > 0;

  static String _fmtMs(int ms) {
    final s = (ms / 1000).round();
    return '${s ~/ 60}:${(s % 60).toString().padLeft(2, '0')}';
  }

  void _startTicker() {
    _ticker?.cancel();
    _elapsedBaseMs = _elapsedMs;
    _ticker = Timer.periodic(_tick, (t) {
      if (!mounted) return;
      setState(() {
        _elapsedMs = _elapsedBaseMs + t.tick * _tick.inMilliseconds;
        // Engine tidak melapor kata: gerakkan garis dari waktu saja.
        if (!_gotProgress && _totalMs > 0) {
          _progress = (_elapsedMs / _totalMs).clamp(0.0, 0.98);
        }
      });
    });
  }

  void _stopTicker() {
    _ticker?.cancel();
    _ticker = null;
  }

  @override
  void dispose() {
    _gen++;
    _stopTicker();
    TtsService.instance.stop();
    super.dispose();
  }

  void _resetAudio() {
    _gen++;
    _plays = 0;
    _playing = false;
    _pos = 0;
    _progress = 0;
    _pauseRequested = false;
    _stopTicker();
    _elapsedMs = 0;
    _calibTotalMs = null;
    _measuredMs.clear();
    _gotProgress = false;
  }

  void _open(ListeningPassage p) {
    TtsService.instance.stop();
    setState(() {
      _passage = p;
      _resetAudio();
      // Soal diambil acak dari bank bacaan (urutan & pilihan ikut diacak),
      // jadi mengulang bacaan yang sama memberi soal yang berbeda.
      _rounds = [
        for (final q in p.pickQuestions(_rng))
          _Round(q, [...q.options]..shuffle(_rng)),
      ];
      _index = 0;
      _correct = 0;
      _picked = null;
      _missed.clear();
      _finished = false;
      _earnedXp = 0;
    });
    // Putar otomatis sekali saat bacaan dibuka, seperti ujian.
    unawaited(_play());
  }

  void _backToList() {
    TtsService.instance.stop();
    setState(() {
      _passage = null;
      _resetAudio();
    });
  }

  Future<void> _play() async {
    final p = _passage;
    if (p == null || !_canPlay) return;
    HapticFeedback.selectionClick();
    final from = _pos;
    final gen = ++_gen;
    final total = p.transcript.length;
    _playFrom = from;
    setState(() {
      _playing = true;
      _pauseRequested = false;
      _gotProgress = false;
      if (from == 0) {
        _plays++;
        _progress = 0;
        _elapsedMs = 0;
      }
    });
    _startTicker();
    final completed = await TtsService.instance.speakAndWait(
      p.transcript.substring(from),
      widget.course.ttsLocale,
      rate: _slow ? _slowRate : _normalRate,
      onProgress: (start, _) {
        if (!mounted || gen != _gen || total == 0) return;
        setState(() {
          _gotProgress = true;
          _pos = from + start;
          _progress = (_pos / total).clamp(0.0, 1.0);
          // Kalibrasi total dari kecepatan nyata setelah cukup jauh
          // (>=1,5 detik dan >=10% teks), dihaluskan agar tidak loncat.
          if (!_totalIsMeasured && _elapsedMs >= 1500 && _pos * 10 >= total) {
            final est = (_elapsedMs * total / _pos).round();
            _calibTotalMs = _calibTotalMs == null
                ? est
                : (_calibTotalMs! * 0.7 + est * 0.3).round();
          }
        });
      },
    );
    if (!mounted || gen != _gen) return;
    _stopTicker();
    setState(() {
      _playing = false;
      if (_pauseRequested) return;
      if (!completed) {
        // Engine menolak/menghentikan ucapan tanpa kita minta jeda
        // (mis. masih sibuk): tahan posisi, tombol jadi "Lanjutkan".
        if (_pos == from && from == 0) {
          _plays = max(0, _plays - 1); // jatah tidak terpakai
        }
        return;
      }
      // Selesai sampai akhir: durasi nyata dikunci, putar berikutnya
      // mulai dari awal lagi.
      if (from == 0 && _elapsedMs > 0) _measuredMs[_slow] = _elapsedMs;
      _elapsedMs = _totalMs;
      _pos = 0;
      _progress = 1;
    });
  }

  /// Engine tidak melapor kata (mis. Samsung TTS): perkirakan posisi
  /// jeda dari waktu yang sudah berjalan, dibulatkan ke batas kata.
  void _estimatePosFromTime() {
    final p = _passage;
    final t = _totalMs;
    if (p == null || t <= 0 || _gotProgress) return;
    final total = p.transcript.length;
    if (total == 0) return;
    var est = (_elapsedMs / t * total).round().clamp(0, total - 1);
    est = _snapToWord(p.transcript, est);
    _pos = max(_playFrom, est);
    _progress = (_pos / total).clamp(0.0, 1.0);
  }

  /// Jeda: posisi kata terakhir disimpan, tombol berikutnya melanjutkan.
  /// Status diubah dulu agar tombol langsung merespons walau engine lambat.
  Future<void> _pause() async {
    _pauseRequested = true;
    _stopTicker();
    setState(() {
      _playing = false;
      _estimatePosFromTime();
    });
    await TtsService.instance.stop();
  }

  void _restart() {
    if (!_canRestart) return;
    setState(() {
      _pos = 0;
      _progress = 0;
      _elapsedMs = 0;
    });
    unawaited(_play());
  }

  /// Geser garis progres (hanya putar bebas): lompat ke batas kata terdekat
  /// sebelum posisi yang dipilih, lalu lanjut dari sana kalau tadi memutar.
  Future<void> _seek(double value) async {
    final p = _passage;
    if (p == null || !_unlimited) return;
    final total = p.transcript.length;
    if (total == 0) return;
    final wasPlaying = _playing;
    // speakAndWait berikutnya juga memanggil stop, jadi tak perlu ditunggu.
    if (wasPlaying) unawaited(_pause());
    final target = _snapToWord(p.transcript, (value * total).round());
    setState(() {
      if (target >= total) {
        _pos = 0;
        _progress = 1;
        _elapsedMs = _totalMs;
      } else {
        _pos = target;
        _progress = target / total;
        _elapsedMs = (_totalMs * target / total).round();
      }
    });
    if (wasPlaying && target < total) unawaited(_play());
  }

  static int _snapToWord(String text, int offset) {
    if (offset <= 0) return 0;
    if (offset >= text.length) return text.length;
    var i = offset;
    while (i > 0 && offset - i < _maxSnapBack && !_isBoundary(text[i - 1])) {
      i--;
    }
    return offset - i >= _maxSnapBack ? offset : i;
  }

  static bool _isBoundary(String ch) =>
      ch.trim().isEmpty || '。、，．,.!?！？;；:：'.contains(ch);

  Future<void> _answer(String option) async {
    if (_picked != null) return;
    final r = _rounds[_index];
    setState(() => _picked = option);
    if (option == r.answer) {
      _correct++;
    } else {
      _missed.add(r);
    }
    await Future<void>.delayed(const Duration(milliseconds: 900));
    if (!mounted) return;
    if (_index + 1 < _rounds.length) {
      setState(() {
        _index++;
        _picked = null;
      });
    } else {
      _finish();
    }
  }

  void _finish() {
    _gen++;
    TtsService.instance.stop();
    final progress = context.read<ProgressProvider>();
    // Streak + pulihkan 1 nyawa (+5 XP), plus 2 XP per jawaban benar
    // (soal dengar lebih berat daripada pilihan ganda biasa).
    final baseXp = progress.completePractice();
    final bonusXp = _correct > 0 ? progress.addXp(_correct * 2) : 0;
    setState(() {
      _earnedXp = baseXp + bonusXp;
      _finished = true;
      _playing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final premium = context.watch<ProgressProvider>().premiumActive;
    final p = _passage;
    return PopScope(
      canPop: p == null,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _backToList();
      },
      child: StudyScaffold(
        appBar: AppBar(
          title: Text(
            p == null
                ? (widget.pack.title[l.code] ?? l.t('listening_title'))
                : (p.title[l.code] ?? ''),
          ),
        ),
        body: p == null
            ? _buildPassageList(l, premium)
            : _finished
            ? QuizResultView(
                correct: _correct,
                total: _rounds.length,
                earnedXp: _earnedXp,
                review: _buildReview(l, p),
                onAgain: () => _open(p),
                onDone: _backToList,
              )
            : _buildSession(l, p),
      ),
    );
  }

  // ---------- Daftar bacaan ----------

  Widget _buildPassageList(L l, bool premium) {
    final pack = widget.pack;
    // Pengguna gratis: hanya [kFreeListeningPassages] bacaan pertama,
    // di paket apa pun; Premium membuka semua.
    final locked = !premium;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(pack.emoji, style: const TextStyle(fontSize: 44)),
                const SizedBox(height: 8),
                Text(
                  '${pack.passages.length} ${l.t('listening_passages')} · '
                  '${pack.questionCount} ${l.t('listening_questions')}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _unlimited
                      ? l.t('listening_unlimited')
                      : '${pack.maxPlays}x ${l.t('listening_plays_per_passage')}',
                  style: TextStyle(
                    fontSize: 12.5,
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (locked) ...[
          const SizedBox(height: 12),
          InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const PremiumScreen())),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: DuoColors.yellow.withValues(alpha: 0.16),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: DuoColors.yellow, width: 1.5),
              ),
              child: Row(
                children: [
                  const Text('👑', style: TextStyle(fontSize: 22)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      '${l.t('listening_free_prefix')} $kFreeListeningPassages. '
                      '${l.t('listening_unlock')}',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const Icon(Icons.chevron_right_rounded),
                ],
              ),
            ),
          ),
        ],
        const SizedBox(height: 18),
        Text(
          l.t('listening_pick_passage'),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 12),
        for (var i = 0; i < pack.passages.length; i++)
          _PassageRow(
            index: i + 1,
            passage: pack.passages[i],
            uiLang: l.code,
            locked: locked && i >= kFreeListeningPassages,
            onTap: () {
              if (locked && i >= kFreeListeningPassages) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const PremiumScreen()),
                );
              } else {
                _open(pack.passages[i]);
              }
            },
          ),
      ],
    );
  }

  // ---------- Sesi: pemutar + soal ----------

  Widget _buildSession(L l, ListeningPassage p) {
    final r = _rounds[_index];
    ChoiceState stateFor(String option) {
      if (_picked == null) return ChoiceState.idle;
      if (option == r.answer) return ChoiceState.correct;
      if (option == _picked) return ChoiceState.wrong;
      return ChoiceState.disabled;
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      children: [
        _Player(
          playing: _playing,
          canPlay: _canPlay,
          progress: _progress,
          timeLabel:
              '${_fmtMs(_elapsedMs)} / '
              '${_totalIsMeasured ? '' : '~'}${_fmtMs(_totalMs)}',
          onSeek: _unlimited ? _seek : null,
          onRestart: _canRestart ? _restart : null,
          playsLabel: _unlimited
              ? l.t('listening_unlimited')
              : (_playsLeft > 0
                    ? '$_playsLeft ${l.t('listening_plays_left')}'
                    : l.t('listening_no_plays')),
          note: _unlimited
              ? l.t('listening_seek_note')
              : l.t('listening_pause_note'),
          slow: _slow,
          onToggleSlow: _playing ? null : (v) => setState(() => _slow = v),
          onPlay: _playing ? _pause : _play,
          slowLabel: l.t('listening_slow'),
          normalLabel: l.t('listening_normal'),
          restartLabel: l.t('listening_restart'),
          playLabel: _playing
              ? l.t('listening_playing')
              : _pos > 0
              ? l.t('listening_resume')
              : (_plays == 0 ? l.t('listening_play') : l.t('listening_replay')),
        ),
        const SizedBox(height: 10),
        // Transkrip terkunci sampai semua soal dijawab.
        Row(
          children: [
            Icon(
              Icons.lock_outline_rounded,
              size: 16,
              color: Theme.of(context).hintColor,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                l.t('listening_hint'),
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          children: [
            Expanded(
              child: PencilProgressBar(
                value: (_index + (_picked == null ? 0 : 1)) / _rounds.length,
                height: 14,
                color: DuoColors.blue,
                showPencil: true,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '${_index + 1}/${_rounds.length}',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Theme.of(context).hintColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 18),
            child: Text(
              r.q.question[l.code] ?? r.q.question['id']!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                height: 1.4,
              ),
            ),
          ),
        ),
        const SizedBox(height: 14),
        for (final option in r.options)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ChoiceCard(
              label: option,
              state: stateFor(option),
              onTap: _picked == null ? () => _answer(option) : null,
            ),
          ),
      ],
    );
  }

  // ---------- Ulasan: transkrip + soal yang salah ----------

  Widget _buildReview(L l, ListeningPassage p) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final translation = p.translation[l.code] ?? p.translation['id'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        l.t('listening_transcript'),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    IconButton(
                      tooltip: l.t('listening_replay'),
                      icon: const Icon(
                        Icons.volume_up_rounded,
                        color: DuoColors.blue,
                      ),
                      onPressed: () => TtsService.instance.speak(
                        p.transcript,
                        widget.course.ttsLocale,
                      ),
                    ),
                  ],
                ),
                Text(
                  p.transcript,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.55,
                    color: isDark ? Colors.white : DuoColors.eel,
                  ),
                ),
                if (translation != null && translation != p.transcript) ...[
                  const SizedBox(height: 12),
                  Text(
                    l.t('listening_translation'),
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    translation,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.5,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        for (final r in _missed)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: _MissedRow(
              question: r.q.question[l.code] ?? r.q.question['id']!,
              answer: r.answer,
            ),
          ),
      ],
    );
  }
}

/// Kartu pemutar: tombol besar putar/berhenti, sisa putar, saklar lambat.
class _Player extends StatelessWidget {
  final bool playing;
  final bool canPlay;
  final bool slow;
  final double progress; // 0..1
  final String timeLabel; // "0:12 / ~1:05" (~ = perkiraan)
  final String playsLabel;
  final String playLabel;
  final String slowLabel;
  final String normalLabel;
  final String restartLabel;
  final String note;
  final ValueChanged<bool>? onToggleSlow;
  final VoidCallback onPlay;

  /// null = garis progres hanya tampilan (mode ujian, tidak bisa digeser).
  final ValueChanged<double>? onSeek;
  final VoidCallback? onRestart;

  const _Player({
    required this.playing,
    required this.canPlay,
    required this.slow,
    required this.progress,
    required this.timeLabel,
    required this.playsLabel,
    required this.playLabel,
    required this.slowLabel,
    required this.normalLabel,
    required this.restartLabel,
    required this.note,
    required this.onToggleSlow,
    required this.onPlay,
    required this.onSeek,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    final enabled = playing || canPlay;
    final color = enabled ? DuoColors.blue : DuoColors.gray;
    final hint = Theme.of(context).hintColor;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            InkWell(
              customBorder: const CircleBorder(),
              onTap: enabled ? onPlay : null,
              child: Container(
                width: 84,
                height: 84,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      color.withValues(alpha: 0.95),
                      color.withValues(alpha: 0.75),
                    ],
                  ),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.7),
                    width: 2.5,
                  ),
                  boxShadow: [
                    if (enabled)
                      BoxShadow(
                        color: color.withValues(alpha: 0.45),
                        blurRadius: 18,
                      ),
                  ],
                ),
                alignment: Alignment.center,
                child: Icon(
                  playing ? Icons.pause_rounded : Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 44,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              playLabel,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 2),
            Text(
              playsLabel,
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w700,
                color: hint,
              ),
            ),
            const SizedBox(height: 10),
            // Garis progres: dari awal sampai akhir bacaan. Bisa digeser
            // kalau putar bebas; hanya tampilan saat mode ujian.
            Row(
              children: [
                IconButton(
                  tooltip: restartLabel,
                  visualDensity: VisualDensity.compact,
                  iconSize: 22,
                  color: DuoColors.blue,
                  disabledColor: hint.withValues(alpha: 0.35),
                  icon: const Icon(Icons.replay_rounded),
                  onPressed: onRestart,
                ),
                Expanded(
                  child: _ProgressLine(value: progress, onSeek: onSeek),
                ),
                const SizedBox(width: 10),
                Text(
                  timeLabel,
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w800,
                    fontFeatures: const [FontFeature.tabularFigures()],
                    color: hint,
                  ),
                ),
              ],
            ),
            Text(
              note,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11, color: hint),
            ),
            const SizedBox(height: 10),
            SegmentedButton<bool>(
              showSelectedIcon: false,
              segments: [
                ButtonSegment(
                  value: false,
                  icon: const Icon(Icons.speed_rounded, size: 16),
                  label: Text(normalLabel),
                ),
                ButtonSegment(
                  value: true,
                  icon: const Icon(Icons.slow_motion_video_rounded, size: 16),
                  label: Text(slowLabel),
                ),
              ],
              selected: {slow},
              onSelectionChanged: onToggleSlow == null
                  ? null
                  : (s) => onToggleSlow!(s.first),
            ),
          ],
        ),
      ),
    );
  }
}

/// Garis progres audio. Dengan [onSeek] jadi slider tipis yang bisa
/// digeser (posisi dikirim saat jari dilepas); tanpa [onSeek] hanya bar.
class _ProgressLine extends StatefulWidget {
  final double value;
  final ValueChanged<double>? onSeek;

  const _ProgressLine({required this.value, required this.onSeek});

  @override
  State<_ProgressLine> createState() => _ProgressLineState();
}

class _ProgressLineState extends State<_ProgressLine> {
  double? _drag; // posisi jari saat menggeser, agar thumb ikut bergerak

  @override
  Widget build(BuildContext context) {
    final track = DuoColors.blue.withValues(alpha: 0.18);
    final v = (_drag ?? widget.value).clamp(0.0, 1.0);
    if (widget.onSeek == null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: LinearProgressIndicator(
          value: v,
          minHeight: 6,
          backgroundColor: track,
          color: DuoColors.blue,
        ),
      );
    }
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 6,
        activeTrackColor: DuoColors.blue,
        inactiveTrackColor: track,
        thumbColor: DuoColors.blue,
        overlayColor: DuoColors.blue.withValues(alpha: 0.15),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
        trackShape: const RoundedRectSliderTrackShape(),
      ),
      child: Slider(
        value: v,
        onChangeStart: (x) => setState(() => _drag = x),
        onChanged: (x) => setState(() => _drag = x),
        onChangeEnd: (x) {
          setState(() => _drag = null);
          widget.onSeek!(x);
        },
      ),
    );
  }
}

class _PassageRow extends StatelessWidget {
  final int index;
  final ListeningPassage passage;
  final String uiLang;
  final bool locked;
  final VoidCallback onTap;

  const _PassageRow({
    required this.index,
    required this.passage,
    required this.uiLang,
    required this.locked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = locked ? DuoColors.gray : DuoColors.blue;
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  '$index',
                  style: TextStyle(fontWeight: FontWeight.w900, color: color),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      passage.title[uiLang] ?? passage.title['id']!,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: locked ? DuoColors.gray : null,
                      ),
                    ),
                    Text(
                      '${passage.questionsPerRound} ${L.of(context).t('listening_questions')}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                locked ? Icons.lock_rounded : Icons.headphones_rounded,
                color: locked ? DuoColors.gray : DuoColors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MissedRow extends StatelessWidget {
  final String question;
  final String answer;
  const _MissedRow({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.08)
            : Colors.white.withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: DuoColors.red.withValues(alpha: 0.5),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).hintColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            answer,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
              color: DuoColors.greenDark,
            ),
          ),
        ],
      ),
    );
  }
}
