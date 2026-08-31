import 'dart:async';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/question_bank.dart';
import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../models/guide.dart';
import '../../providers/progress_provider.dart';
import '../../services/tts_service.dart';
import '../../theme.dart';
import '../../widgets/choice_card.dart';
import '../../widgets/duo_button.dart';
import '../../widgets/study/pencil_progress_bar.dart';
import '../../widgets/study/study_background.dart';

/// Satu soal tebak huruf: lambang → bacaan, atau sebaliknya.
class _Question {
  final String prompt;
  final String answer;
  final List<String> options;
  final String speakText; // lambang yang diucapkan TTS
  final bool symbolToReading;

  const _Question({
    required this.prompt,
    required this.answer,
    required this.options,
    required this.speakText,
    required this.symbolToReading,
  });
}

/// Tebak Huruf: kuis dari bank soal [letterQuizFor] — hiragana/katakana
/// untuk Jepang, nama huruf alfabet untuk Inggris & Indonesia.
class LetterQuizScreen extends StatefulWidget {
  final Course course;

  /// Kalau diisi (mis. dari tombol latihan di halaman Materi),
  /// kuis langsung mulai di paket ini tanpa lewat pemilih paket.
  final String? initialCategoryId;

  const LetterQuizScreen({
    super.key,
    required this.course,
    this.initialCategoryId,
  });

  @override
  State<LetterQuizScreen> createState() => _LetterQuizScreenState();
}

class _LetterQuizScreenState extends State<LetterQuizScreen> {
  static const questionCount = 10;
  final _rng = Random();

  LetterQuizCategory? _category;
  List<_Question> _questions = [];
  int _index = 0;
  int _correct = 0;
  String? _picked; // jawaban yang dipilih di soal aktif
  final List<_Question> _missed = []; // soal yang dijawab salah
  bool _finished = false;
  int _earnedXp = 0;

  @override
  void initState() {
    super.initState();
    // Lompat langsung ke paket yang diminta (mis. dari halaman Materi).
    final id = widget.initialCategoryId;
    if (id != null) {
      final matches =
          letterQuizFor(widget.course.id).where((c) => c.id == id);
      if (matches.isNotEmpty) _startInternal(matches.first);
    }
  }

  @override
  void dispose() {
    TtsService.instance.stop();
    super.dispose();
  }

  void _start(LetterQuizCategory cat) =>
      setState(() => _startInternal(cat));

  void _startInternal(LetterQuizCategory cat) {
    final items = [...cat.items]..shuffle(_rng);
    _category = cat;
    _questions = [
      for (final item in items.take(min(questionCount, items.length)))
        _makeQuestion(cat, item),
    ];
    _index = 0;
    _correct = 0;
    _picked = null;
    _missed.clear();
    _finished = false;
    _earnedXp = 0;
  }

  _Question _makeQuestion(LetterQuizCategory cat, KanaItem item) {
    final symbolToReading = _rng.nextBool();
    // Kumpulkan 3 pengecoh unik dari paket yang sama.
    String sideOf(KanaItem i) => symbolToReading ? i.romaji : i.kana;
    final answer = sideOf(item);
    final options = <String>{answer};
    final pool = [...cat.items]..shuffle(_rng);
    for (final p in pool) {
      if (options.length >= 4) break;
      // Jangan sampai ada dua jawaban benar: di arah bacaan → lambang,
      // lambang lain dengan bacaan sama (mis. あ vs ア di paket
      // campuran, ず vs づ) tidak boleh jadi pengecoh.
      if (!symbolToReading && p.romaji == item.romaji) continue;
      options.add(sideOf(p));
    }
    return _Question(
      prompt: symbolToReading ? item.kana : item.romaji,
      answer: answer,
      options: options.toList()..shuffle(_rng),
      speakText: item.kana,
      symbolToReading: symbolToReading,
    );
  }

  Future<void> _answer(String option) async {
    if (_picked != null) return;
    final q = _questions[_index];
    setState(() => _picked = option);
    if (option == q.answer) {
      _correct++;
    } else {
      _missed.add(q);
    }
    unawaited(
        TtsService.instance.speak(q.speakText, _category!.ttsLocale));
    await Future<void>.delayed(const Duration(milliseconds: 900));
    if (!mounted) return;
    if (_index + 1 < _questions.length) {
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
    return StudyScaffold(
      appBar: AppBar(title: Text(l.t('letter_quiz'))),
      body: _category == null
          ? _buildPicker(l)
          : _finished
              ? _QuizResultView(
                  correct: _correct,
                  total: _questions.length,
                  missed: _missed,
                  earnedXp: _earnedXp,
                  ttsLocale: _category!.ttsLocale,
                  onAgain: () => _start(_category!),
                  onDone: () => Navigator.of(context).pop(),
                )
              : _buildQuiz(l),
    );
  }

  Widget _buildPicker(L l) {
    final categories = letterQuizFor(widget.course.id);
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: [
        Text(
          l.t('quiz_pick'),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 12),
        for (final cat in categories)
          Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => _start(cat),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: DuoColors.blue.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      alignment: Alignment.center,
                      child: Text(cat.emoji,
                          style: const TextStyle(fontSize: 26)),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cat.title[l.code] ?? cat.title['id']!,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            '${cat.items.length} ${l.t('letters')}',
                            style: TextStyle(
                                fontSize: 12.5,
                                color: Theme.of(context).hintColor),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right_rounded,
                        color: Theme.of(context).hintColor),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildQuiz(L l) {
    final q = _questions[_index];
    ChoiceState stateFor(String option) {
      if (_picked == null) return ChoiceState.idle;
      if (option == q.answer) return ChoiceState.correct;
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
                value: (_index + (_picked == null ? 0 : 1)) /
                    _questions.length,
                height: 14,
                color: DuoColors.blue,
                showPencil: true,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '${_index + 1}/${_questions.length}',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).hintColor),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          l.t(q.symbolToReading
              ? 'quiz_prompt_reading'
              : 'quiz_prompt_symbol'),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 14),
        // Lambang/bacaan yang ditanyakan — besar di tengah.
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 28),
            child: Text(
              q.prompt,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: q.symbolToReading ? 56 : 40,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        const SizedBox(height: 18),
        for (final option in q.options)
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
}

/// Rangkuman akhir kuis: ring skor yang terisi perlahan, hitungan
/// benar/salah yang berjalan naik, konfeti untuk skor bagus,
/// kesimpulan bertingkat, dan daftar huruf yang salah (ketuk untuk
/// mendengar bunyinya).
class _QuizResultView extends StatefulWidget {
  final int correct;
  final int total;
  final List<_Question> missed;
  final int earnedXp;
  final String ttsLocale;
  final VoidCallback onAgain;
  final VoidCallback onDone;

  const _QuizResultView({
    required this.correct,
    required this.total,
    required this.missed,
    required this.earnedXp,
    required this.ttsLocale,
    required this.onAgain,
    required this.onDone,
  });

  @override
  State<_QuizResultView> createState() => _QuizResultViewState();
}

class _QuizResultViewState extends State<_QuizResultView> {
  late final ConfettiController _confetti =
      ConfettiController(duration: const Duration(seconds: 2));

  double get _accuracy =>
      widget.total == 0 ? 0 : widget.correct / widget.total;

  @override
  void initState() {
    super.initState();
    if (_accuracy >= 0.7) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => _confetti.play());
    }
  }

  @override
  void dispose() {
    _confetti.dispose();
    super.dispose();
  }

  String _verdictKey() {
    if (_accuracy >= 0.9) return 'quiz_verdict_great';
    if (_accuracy >= 0.7) return 'quiz_verdict_good';
    if (_accuracy >= 0.5) return 'quiz_verdict_ok';
    return 'quiz_verdict_retry';
  }

  Color get _ringColor => _accuracy >= 0.7
      ? DuoColors.green
      : _accuracy >= 0.5
          ? DuoColors.orange
          : DuoColors.red;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final wrongCount = widget.total - widget.correct;

    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
          children: [
            Text(
              l.t('quiz_result_title'),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 18),
            // Ring skor + hitungan berjalan — satu animasi penggerak.
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration: const Duration(milliseconds: 1400),
              curve: Curves.easeOutCubic,
              builder: (context, t, _) {
                return Column(
                  children: [
                    SizedBox(
                      width: 170,
                      height: 170,
                      child: CustomPaint(
                        painter: _ScoreRingPainter(
                          value: t * _accuracy,
                          color: _ringColor,
                          track: isDark
                              ? Colors.white.withValues(alpha: 0.12)
                              : Colors.black.withValues(alpha: 0.08),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${(t * _accuracy * 100).round()}%',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                  color: _ringColor,
                                ),
                              ),
                              Text(
                                l.t('accuracy_label'),
                                style: TextStyle(
                                    fontSize: 12,
                                    color:
                                        Theme.of(context).hintColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        _CountChip(
                          emoji: '✅',
                          label: l.t('quiz_correct_label'),
                          value: (t * widget.correct).round(),
                          color: DuoColors.green,
                        ),
                        const SizedBox(width: 10),
                        _CountChip(
                          emoji: '❌',
                          label: l.t('quiz_wrong_label'),
                          value: (t * wrongCount).round(),
                          color: DuoColors.red,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 14),
            // Kesimpulan + XP muncul belakangan (fade & naik).
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration: const Duration(milliseconds: 2000),
              curve: Curves.easeOut,
              builder: (context, t, child) {
                final late = ((t - 0.55) / 0.45).clamp(0.0, 1.0);
                return Opacity(
                  opacity: late,
                  child: Transform.translate(
                    offset: Offset(0, 16 * (1 - late)),
                    child: child,
                  ),
                );
              },
              child: Column(
                children: [
                  Text(
                    '+${widget.earnedXp} ${l.t('xp')} ⚡',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: DuoColors.orange,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    l.t(_verdictKey()),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 18),
                  if (widget.missed.isEmpty)
                    Text(
                      l.t('quiz_perfect'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: DuoColors.green,
                      ),
                    )
                  else ...[
                    Text(
                      l.t('quiz_review'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).hintColor),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final q in widget.missed)
                          _MissedChip(
                            symbol: q.speakText,
                            reading: q.symbolToReading
                                ? q.answer
                                : q.prompt,
                            onTap: () => TtsService.instance
                                .speak(q.speakText, widget.ttsLocale),
                          ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 24),
                  DuoButton(
                    label: l.t('play_again'),
                    onPressed: widget.onAgain,
                  ),
                  TextButton(
                    onPressed: widget.onDone,
                    child: Text(
                      l.t('quiz_done'),
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Hujan konfeti dari atas untuk skor ≥ 70%.
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _confetti,
            blastDirection: pi / 2,
            blastDirectionality: BlastDirectionality.explosive,
            numberOfParticles: 30,
            emissionFrequency: 0.05,
            gravity: 0.25,
            colors: const [
              DuoColors.green,
              DuoColors.blue,
              DuoColors.yellow,
              DuoColors.orange,
              DuoColors.purple,
            ],
          ),
        ),
      ],
    );
  }
}

/// Kartu kecil hitungan benar/salah dengan angka yang berjalan naik.
class _CountChip extends StatelessWidget {
  final String emoji;
  final String label;
  final int value;
  final Color color;

  const _CountChip({
    required this.emoji,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: isDark ? 0.18 : 0.12),
          borderRadius: BorderRadius.circular(14),
          border:
              Border.all(color: color.withValues(alpha: 0.5), width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 8),
            Text(
              '$value',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w900, color: color),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).hintColor),
            ),
          ],
        ),
      ),
    );
  }
}

/// Huruf yang terlewat: lambang + bacaan, ketuk untuk mendengar.
class _MissedChip extends StatelessWidget {
  final String symbol;
  final String reading;
  final VoidCallback onTap;

  const _MissedChip({
    required this.symbol,
    required this.reading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.white.withValues(alpha: 0.72),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: DuoColors.red.withValues(alpha: 0.5), width: 1.5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(symbol,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w900)),
            const SizedBox(width: 6),
            Text(
              reading,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).hintColor),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.volume_up_rounded,
                size: 16, color: DuoColors.blue),
          ],
        ),
      ),
    );
  }
}

/// Ring skor melingkar dengan ujung membulat.
class _ScoreRingPainter extends CustomPainter {
  final double value; // 0..1
  final Color color;
  final Color track;

  const _ScoreRingPainter({
    required this.value,
    required this.color,
    required this.track,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.shortestSide / 2 - 8;
    final base = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, base..color = track);
    if (value > 0) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2,
        2 * pi * value.clamp(0.0, 1.0),
        false,
        base..color = color,
      );
    }
  }

  @override
  bool shouldRepaint(_ScoreRingPainter old) =>
      old.value != value || old.color != color || old.track != track;
}
