import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../data/mcq_bank.dart';
import '../../data/mcq_packs.dart';
import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../providers/progress_provider.dart';
import '../../services/tts_service.dart';
import '../../theme.dart';
import '../../widgets/choice_card.dart';
import '../../widgets/duo_button.dart';
import '../../widgets/study/pencil_progress_bar.dart';
import '../../widgets/study/quiz_result_view.dart';
import '../../widgets/study/study_background.dart';
import '../premium_screen.dart';

/// Satu soal aktif: soal dari bank + urutan pilihan yang sudah diacak.
class _Round {
  final McqQuestion q;
  final List<String> options;

  const _Round(this.q, this.options);

  String get answer => q.options[q.answer];
}

/// Soal Pilihan Ganda: kosakata & tata bahasa dari [mcqBankFor].
/// Di awal pengguna menentukan mau berapa soal (mis. isi 10 → hanya
/// 10 soal acak yang keluar), lalu kuis berjalan seperti Tebak Huruf.
class McqQuizScreen extends StatefulWidget {
  final Course course;
  final McqPack? pack;

  const McqQuizScreen({super.key, required this.course, this.pack});

  @override
  State<McqQuizScreen> createState() => _McqQuizScreenState();
}

class _McqQuizScreenState extends State<McqQuizScreen> {
  static const _defaultCount = 10;
  final _rng = Random();
  late final List<McqQuestion> _bank =
      widget.pack?.questions ?? mcqBankFor(widget.course.id);
  late final TextEditingController _countCtrl =
      TextEditingController(text: '${min(_defaultCount, _bank.length)}');

  /// Batas soal yang boleh dipilih pada sesi ini (dihitung ulang di
  /// [build] berdasarkan status premium).
  int _maxCount = 0;

  List<_Round> _rounds = [];
  int _index = 0;
  int _correct = 0;
  String? _picked; // jawaban yang dipilih di soal aktif
  final List<_Round> _missed = []; // soal yang dijawab salah
  bool _finished = false;
  int _earnedXp = 0;
  bool _countInvalid = false;

  @override
  void dispose() {
    _countCtrl.dispose();
    TtsService.instance.stop();
    super.dispose();
  }

  /// Jumlah soal dari kolom isian; null kalau di luar 1.._maxCount.
  int? get _requestedCount {
    final n = int.tryParse(_countCtrl.text.trim());
    if (n == null || n < 1 || n > _maxCount) return null;
    return n;
  }

  void _start() {
    final count = _requestedCount;
    if (count == null) {
      setState(() => _countInvalid = true);
      return;
    }
    final pool = [..._bank]..shuffle(_rng);
    setState(() {
      _rounds = [
        for (final q in pool.take(count))
          _Round(q, [...q.options]..shuffle(_rng)),
      ];
      _index = 0;
      _correct = 0;
      _picked = null;
      _missed.clear();
      _finished = false;
      _earnedXp = 0;
      _countInvalid = false;
    });
  }

  /// Teks yang diucapkan TTS: pilihan tanpa romaji dalam kurung.
  String _speakable(String option) => option.split(' (').first;

  Future<void> _answer(String option) async {
    if (_picked != null) return;
    final r = _rounds[_index];
    setState(() => _picked = option);
    if (option == r.answer) {
      _correct++;
    } else {
      _missed.add(r);
    }
    unawaited(TtsService.instance
        .speak(_speakable(r.answer), widget.course.ttsLocale));
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
    final progress = context.read<ProgressProvider>();
    // Streak + pulihkan 1 nyawa (+5 XP), plus 1 XP per jawaban benar.
    final baseXp = progress.completePractice();
    final bonusXp = _correct > 0 ? progress.addXp(_correct) : 0;
    setState(() {
      _earnedXp = baseXp + bonusXp;
      _finished = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final premium = context.watch<ProgressProvider>().premiumActive;
    // Non-premium dibatasi kFreeMcqLimit soal per sesi.
    _maxCount =
        premium ? _bank.length : min(kFreeMcqLimit, _bank.length);
    return StudyScaffold(
      appBar: AppBar(
        title: Text(widget.pack?.title[l.code] ?? l.t('mcq_title')),
      ),
      body: _rounds.isEmpty
          ? _buildCountPicker(l, premium)
          : _finished
              ? QuizResultView(
                  correct: _correct,
                  total: _rounds.length,
                  earnedXp: _earnedXp,
                  review: _missed.isEmpty ? null : _buildReview(l),
                  onAgain: _start,
                  onDone: () => Navigator.of(context).pop(),
                )
              : _buildQuiz(l),
    );
  }

  /// Pembuka: berapa soal yang mau dilatih (isi angka / ketuk pilihan
  /// cepat), baru mulai.
  Widget _buildCountPicker(L l, bool premium) {
    final quickCounts = <int>{5, 10, 25, _maxCount}
        .where((n) => n >= 1 && n <= _maxCount)
        .toList()
      ..sort();
    final locked = !premium && _bank.length > kFreeMcqLimit;
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(widget.pack?.emoji ?? '📝',
                    style: const TextStyle(fontSize: 44)),
                const SizedBox(height: 8),
                Text(
                  '${_bank.length} ${l.t('mcq_available')}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Non-premium: batas soal + ajakan buka semua.
        if (locked) ...[
          const SizedBox(height: 12),
          InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const PremiumScreen())),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: DuoColors.yellow.withValues(alpha: 0.16),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                    color: DuoColors.yellow, width: 1.5),
              ),
              child: Row(
                children: [
                  const Text('👑', style: TextStyle(fontSize: 22)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      '${l.t('mcq_free_limit')} $kFreeMcqLimit. '
                      '${l.t('mcq_unlock_all')} (${_bank.length})',
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w800),
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
          l.t('mcq_how_many'),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 14),
        TextField(
          controller: _countCtrl,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
          decoration: InputDecoration(
            hintText: l.t('mcq_count_hint'),
            errorText: _countInvalid
                ? '${l.t('mcq_count_error')} 1–$_maxCount'
                : null,
          ),
          onChanged: (_) {
            if (_countInvalid) setState(() => _countInvalid = false);
          },
          onSubmitted: (_) => _start(),
        ),
        const SizedBox(height: 12),
        // Pilihan cepat: ketuk untuk mengisi jumlah soal.
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          children: [
            for (final n in quickCounts)
              ActionChip(
                label: Text(
                  n == _bank.length ? '${l.t('mcq_all')} ($n)' : '$n',
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                onPressed: () => setState(() {
                  _countCtrl.text = '$n';
                  _countInvalid = false;
                }),
              ),
          ],
        ),
        const SizedBox(height: 20),
        DuoButton(label: l.t('start_lesson'), onPressed: _start),
      ],
    );
  }

  Widget _buildQuiz(L l) {
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
        Row(
          children: [
            Expanded(
              child: PencilProgressBar(
                value:
                    (_index + (_picked == null ? 0 : 1)) / _rounds.length,
                height: 14,
                color: DuoColors.yellow,
                showPencil: true,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '${_index + 1}/${_rounds.length}',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).hintColor),
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Teks soal — mengikuti bahasa UI.
        Card(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 26, horizontal: 18),
            child: Text(
              r.q.question[l.code] ?? r.q.question['id']!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 19, fontWeight: FontWeight.w900, height: 1.4),
            ),
          ),
        ),
        const SizedBox(height: 18),
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

  /// Ulasan soal yang salah: soal + jawaban benar, ketuk untuk dengar.
  Widget _buildReview(L l) {
    return Column(
      children: [
        for (final r in _missed)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _MissedRow(
              question: r.q.question[l.code] ?? r.q.question['id']!,
              answer: r.answer,
              onTap: () => TtsService.instance
                  .speak(_speakable(r.answer), widget.course.ttsLocale),
            ),
          ),
      ],
    );
  }
}

/// Baris soal yang terlewat: soal kecil + jawaban benar yang menonjol.
class _MissedRow extends StatelessWidget {
  final String question;
  final String answer;
  final VoidCallback onTap;

  const _MissedRow({
    required this.question,
    required this.answer,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.white.withValues(alpha: 0.72),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: DuoColors.red.withValues(alpha: 0.5), width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).hintColor),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: Text(
                    answer,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: DuoColors.greenDark,
                    ),
                  ),
                ),
                const Icon(Icons.volume_up_rounded,
                    size: 16, color: DuoColors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
