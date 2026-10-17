import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../providers/progress_provider.dart';
import '../../services/speech_scorer.dart';
import '../../services/speech_service.dart';
import '../../services/tts_service.dart';
import '../../theme.dart';
import '../../widgets/duo_button.dart';
import '../../widgets/study/pencil_progress_bar.dart';
import '../../widgets/study/quiz_result_view.dart';
import '../../widgets/study/study_background.dart';
import '../premium_screen.dart';

/// Unit pertama yang bisa dilatih pengguna gratis; Premium membuka semua.
const int kFreeSpeakingUnits = 2;

/// Isi satu sesi: beberapa kata lalu kalimat dari unit yang dipilih.
const int _wordsPerSession = 4;
const int _sentencesPerSession = 6;

/// Satu item yang harus diucapkan.
class _Item {
  final String text;
  final List<String> tokens;
  final String? reading;
  final String meaning;
  int best = -1; // skor terbaik (persen); -1 = belum dicoba
  SpeechScore? last;

  _Item({
    required this.text,
    required this.tokens,
    required this.reading,
    required this.meaning,
  });
}

/// Latihan Bicara: pilih unit → dengar contoh (TTS) → ucapkan →
/// mesin pengenal suara bawaan HP menuliskan ucapan, lalu setiap kata
/// ditandai hijau (benar) / merah (salah) dengan skor persen. Lulus kalau
/// skor ≥ [kSpeakingPassPercent]; boleh mencoba ulang sebelum lanjut.
class SpeakingScreen extends StatefulWidget {
  final Course course;

  const SpeakingScreen({super.key, required this.course});

  @override
  State<SpeakingScreen> createState() => _SpeakingScreenState();
}

enum _Mic { idle, preparing, listening }

class _SpeakingScreenState extends State<SpeakingScreen> {
  final _rng = Random();

  CourseUnit? _unit;
  List<_Item> _items = const [];
  int _index = 0;
  _Mic _mic = _Mic.idle;
  String _partial = '';
  SpeechUnavailable? _unavailable;
  bool _finished = false;
  int _earnedXp = 0;

  Course get _course => widget.course;

  @override
  void dispose() {
    SpeechService.instance.cancel();
    TtsService.instance.stop();
    super.dispose();
  }

  // ---------- Alur ----------

  void _open(CourseUnit unit, String uiLang) {
    final lessons = unit.lessons;
    final words = ([...lessons.expand((l) => l.words)]..shuffle(_rng))
        .take(_wordsPerSession)
        .map(
          (w) => _Item(
            text: w.target,
            tokens: tokensOf(w.target),
            reading: w.romaji,
            meaning: w.meaningFor(uiLang),
          ),
        );
    final sentences = ([...lessons.expand((l) => l.sentences)]..shuffle(_rng))
        .take(_sentencesPerSession)
        .map(
          (s) => _Item(
            text: s.target,
            tokens: s.tokens.isEmpty ? tokensOf(s.target) : s.tokens,
            reading: s.romaji,
            meaning: s.meaningFor(uiLang),
          ),
        );
    setState(() {
      _unit = unit;
      _items = [...words, ...sentences];
      _index = 0;
      _finished = false;
      _mic = _Mic.idle;
      _partial = '';
    });
  }

  void _backToList() {
    SpeechService.instance.cancel();
    TtsService.instance.stop();
    setState(() {
      _unit = null;
      _finished = false;
      _mic = _Mic.idle;
    });
  }

  void _listen({bool slow = false}) {
    TtsService.instance.speakAndWait(
      _items[_index].text,
      _course.ttsLocale,
      rate: slow ? 0.3 : 0.45,
    );
  }

  Future<void> _toggleMic() async {
    if (_mic == _Mic.listening) {
      await SpeechService.instance.stop();
      return;
    }
    if (_mic != _Mic.idle) return;
    await TtsService.instance.stop();
    setState(() {
      _mic = _Mic.preparing;
      _partial = '';
    });
    final problem = await SpeechService.instance.prepare(_course.ttsLocale);
    if (!mounted) return;
    if (problem != null) {
      setState(() {
        _unavailable = problem;
        _mic = _Mic.idle;
      });
      return;
    }
    HapticFeedback.lightImpact();
    setState(() {
      _unavailable = null;
      _mic = _Mic.listening;
    });
    final item = _items[_index];
    final heard = await SpeechService.instance.listenOnce(
      _course.ttsLocale,
      onPartial: (p) {
        if (mounted && _mic == _Mic.listening) setState(() => _partial = p);
      },
    );
    if (!mounted || _unit == null || !identical(item, _items[_index])) return;
    final score = scoreSpeech(
      courseId: _course.id,
      tokens: item.tokens,
      heard: heard,
    );
    if (score.passed) {
      HapticFeedback.mediumImpact();
    } else {
      HapticFeedback.heavyImpact();
    }
    setState(() {
      item.last = score;
      item.best = max(item.best, score.percent);
      _mic = _Mic.idle;
      _partial = '';
    });
  }

  void _next() {
    SpeechService.instance.cancel();
    TtsService.instance.stop();
    if (_index + 1 < _items.length) {
      setState(() {
        _index++;
        _mic = _Mic.idle;
        _partial = '';
      });
    } else {
      _finish();
    }
  }

  int get _passedCount =>
      _items.where((i) => i.best >= kSpeakingPassPercent).length;

  void _finish() {
    final progress = context.read<ProgressProvider>();
    // Streak + pulihkan 1 nyawa (+5 XP), plus 2 XP per ucapan yang lulus.
    final passed = _passedCount;
    final baseXp = progress.completePractice();
    final bonusXp = passed > 0 ? progress.addXp(passed * 2) : 0;
    setState(() {
      _earnedXp = baseXp + bonusXp;
      _finished = true;
    });
  }

  // ---------- Tampilan ----------

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final premium = context.watch<ProgressProvider>().premiumActive;
    final unit = _unit;
    return PopScope(
      canPop: unit == null,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _backToList();
      },
      child: StudyScaffold(
        appBar: AppBar(
          title: Text(
            unit == null
                ? l.t('speaking_title')
                : (unit.title[l.code] ?? unit.title.values.first),
          ),
        ),
        body: unit == null
            ? _buildUnitList(l, premium)
            : _finished
            ? QuizResultView(
                correct: _passedCount,
                total: _items.length,
                earnedXp: _earnedXp,
                review: _buildReview(l),
                onAgain: () => _open(unit, l.code),
                onDone: _backToList,
              )
            : _buildSession(l),
      ),
    );
  }

  Widget _buildUnitList(L l, bool premium) {
    final units = _course.units;
    final hint = Theme.of(context).hintColor;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                const Text('🎙️', style: TextStyle(fontSize: 44)),
                const SizedBox(height: 8),
                Text(
                  l.t('speaking_intro'),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13.5, height: 1.45, color: hint),
                ),
              ],
            ),
          ),
        ),
        if (!premium) ...[
          const SizedBox(height: 12),
          InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: _openPremium,
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
                      l
                          .t('speaking_free_note')
                          .replaceFirst('{n}', '$kFreeSpeakingUnits'),
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
          l.t('speaking_pick_unit'),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 12),
        for (var i = 0; i < units.length; i++)
          _UnitRow(
            index: i + 1,
            unit: units[i],
            uiLang: l.code,
            locked: !premium && i >= kFreeSpeakingUnits,
            onTap: () => !premium && i >= kFreeSpeakingUnits
                ? _openPremium()
                : _open(units[i], l.code),
          ),
      ],
    );
  }

  void _openPremium() => Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (_) => const PremiumScreen()));

  Widget _buildSession(L l) {
    final item = _items[_index];
    final score = item.last;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hint = Theme.of(context).hintColor;
    final baseColor = isDark ? Colors.white : DuoColors.eel;

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      children: [
        Row(
          children: [
            Expanded(
              child: PencilProgressBar(
                value: (_index + (score == null ? 0 : 1)) / _items.length,
                height: 14,
                color: DuoColors.orange,
                showPencil: true,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '${_index + 1}/${_items.length}',
              style: TextStyle(fontWeight: FontWeight.w800, color: hint),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          l.t('speaking_say_this'),
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w800, color: hint),
        ),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 22, 18, 14),
            child: Column(
              children: [
                // Teks target; setelah dicoba, token diwarnai benar/salah.
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  runSpacing: 6,
                  children: [
                    for (var i = 0; i < item.tokens.length; i++)
                      Text(
                        item.tokens[i],
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          color: score == null
                              ? baseColor
                              : (score.tokenOk[i]
                                    ? DuoColors.green
                                    : DuoColors.red),
                          decoration: score != null && !score.tokenOk[i]
                              ? TextDecoration.underline
                              : null,
                          decorationColor: DuoColors.red,
                          decorationThickness: 2,
                        ),
                      ),
                  ],
                ),
                if (item.reading != null && item.reading!.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(
                    item.reading!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: hint,
                    ),
                  ),
                ],
                const SizedBox(height: 6),
                Text(
                  item.meaning,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13.5, color: hint),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: _mic == _Mic.idle ? _listen : null,
                      icon: const Icon(Icons.volume_up_rounded),
                      label: Text(l.t('speaking_listen')),
                    ),
                    TextButton.icon(
                      onPressed: _mic == _Mic.idle
                          ? () => _listen(slow: true)
                          : null,
                      icon: const Text('🐢'),
                      label: Text(l.t('listening_slow')),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 22),
        Center(
          child: _MicButton(state: _mic, onTap: _toggleMic),
        ),
        const SizedBox(height: 10),
        Text(
          switch (_mic) {
            _Mic.listening =>
              _partial.isEmpty ? l.t('speaking_listening') : _partial,
            _Mic.preparing => l.t('speaking_preparing'),
            _Mic.idle =>
              score == null ? l.t('speaking_tap_mic') : l.t('speaking_retry'),
          },
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w700,
            color: _mic == _Mic.listening && _partial.isNotEmpty
                ? baseColor
                : hint,
          ),
        ),
        if (_unavailable != null) ...[
          const SizedBox(height: 12),
          _Notice(
            text: l.t(
              _unavailable == SpeechUnavailable.permission
                  ? 'speaking_no_permission'
                  : 'speaking_no_locale',
            ),
          ),
        ],
        if (score != null && _mic == _Mic.idle) ...[
          const SizedBox(height: 16),
          _ScorePanel(score: score, best: item.best),
        ],
        const SizedBox(height: 20),
        DuoButton(
          label: _index + 1 < _items.length
              ? l.t('speaking_next')
              : l.t('speaking_finish'),
          color: score?.passed == true ? DuoColors.green : DuoColors.blue,
          outlined: score?.passed != true,
          onPressed: _mic == _Mic.idle ? _next : null,
        ),
      ],
    );
  }

  Widget _buildReview(L l) {
    final missed = _items.where((i) => i.best < kSpeakingPassPercent);
    if (missed.isEmpty) return const SizedBox.shrink();
    final hint = Theme.of(context).hintColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l.t('speaking_review'),
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
        ),
        for (final i in missed)
          Card(
            margin: const EdgeInsets.only(top: 8),
            child: ListTile(
              title: Text(
                i.text,
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
              subtitle: Text(
                [
                  if (i.reading != null) i.reading!,
                  i.best < 0
                      ? l.t('speaking_skipped')
                      : '${l.t('speaking_best')}: ${i.best}%',
                ].join(' · '),
                style: TextStyle(color: hint),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.volume_up_rounded,
                  color: DuoColors.blue,
                ),
                onPressed: () =>
                    TtsService.instance.speak(i.text, _course.ttsLocale),
              ),
            ),
          ),
      ],
    );
  }
}

/// Tombol mikrofon bulat: biru (siap), merah berdenyut (mendengar).
class _MicButton extends StatelessWidget {
  final _Mic state;
  final VoidCallback onTap;

  const _MicButton({required this.state, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final listening = state == _Mic.listening;
    final busy = state == _Mic.preparing;
    final color = listening ? DuoColors.red : DuoColors.blue;
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: busy ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: listening ? 96 : 88,
        height: listening ? 96 : 88,
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
            BoxShadow(
              color: color.withValues(alpha: listening ? 0.55 : 0.3),
              blurRadius: listening ? 22 : 12,
              spreadRadius: listening ? 4 : 0,
            ),
          ],
        ),
        child: busy
            ? const Padding(
                padding: EdgeInsets.all(30),
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                ),
              )
            : Icon(
                listening ? Icons.stop_rounded : Icons.mic_rounded,
                size: 44,
                color: Colors.white,
              ),
      ),
    );
  }
}

/// Skor ucapan terakhir + apa yang terdengar oleh mesin.
class _ScorePanel extends StatelessWidget {
  final SpeechScore score;
  final int best;

  const _ScorePanel({required this.score, required this.best});

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final color = score.passed
        ? DuoColors.green
        : score.percent >= 50
        ? DuoColors.orange
        : DuoColors.red;
    final hint = Theme.of(context).hintColor;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.7), width: 1.5),
      ),
      child: Row(
        children: [
          Text(
            '${score.percent}%',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l.t(
                    score.passed
                        ? 'speaking_pass'
                        : score.heard.isEmpty
                        ? 'speaking_nothing'
                        : 'speaking_fail',
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                if (score.heard.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    '${l.t('speaking_heard')}: “${score.heard}”',
                    style: TextStyle(fontSize: 12.5, color: hint),
                  ),
                ],
                if (best > score.percent)
                  Text(
                    '${l.t('speaking_best')}: $best%',
                    style: TextStyle(fontSize: 12, color: hint),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Notice extends StatelessWidget {
  final String text;
  const _Notice({required this.text});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: DuoColors.orange.withValues(alpha: 0.14),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      text,
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
    ),
  );
}

class _UnitRow extends StatelessWidget {
  final int index;
  final CourseUnit unit;
  final String uiLang;
  final bool locked;
  final VoidCallback onTap;

  const _UnitRow({
    required this.index,
    required this.unit,
    required this.uiLang,
    required this.locked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final hint = Theme.of(context).hintColor;
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: onTap,
        leading: Text(unit.icon, style: const TextStyle(fontSize: 26)),
        title: Text(
          '$index. ${unit.title[uiLang] ?? unit.title.values.first}',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: locked ? hint : null,
          ),
        ),
        trailing: locked
            ? const Text('👑', style: TextStyle(fontSize: 16))
            : Icon(Icons.chevron_right_rounded, color: hint),
      ),
    );
  }
}
