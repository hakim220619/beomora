import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/question_bank.dart';
import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../models/guide.dart';
import '../../providers/auth_provider.dart';
import '../../providers/progress_provider.dart';
import '../../screens/premium_screen.dart';
import '../../services/tts_service.dart';
import '../../theme.dart';
import '../../widgets/choice_card.dart';
import '../../widgets/study/pencil_progress_bar.dart';
import '../../widgets/study/quiz_result_view.dart';
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
              ? QuizResultView(
                  correct: _correct,
                  total: _questions.length,
                  earnedXp: _earnedXp,
                  review: _missed.isEmpty
                      ? null
                      : Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            for (final q in _missed)
                              _MissedChip(
                                symbol: q.speakText,
                                reading: q.symbolToReading
                                    ? q.answer
                                    : q.prompt,
                                onTap: () => TtsService.instance.speak(
                                    q.speakText, _category!.ttsLocale),
                              ),
                          ],
                        ),
                  onAgain: () => _start(_category!),
                  onDone: () => Navigator.of(context).pop(),
                )
              : _buildQuiz(l),
    );
  }

  Widget _buildPicker(L l) {
    final categories = letterQuizFor(widget.course.id);
    final isPremium = context.watch<AuthProvider>().isPremium;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: [
        Text(
          l.t('quiz_pick'),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 12),
        for (final cat in categories)
          _CategoryCard(
            cat: cat,
            locked: cat.premium && !isPremium,
            l: l,
            onTap: () {
              if (cat.premium && !isPremium) {
                // Paket premium → tawarkan upgrade.
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const PremiumScreen()));
              } else {
                _start(cat);
              }
            },
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
              ? _category!.symbolPromptKey
              : _category!.readingPromptKey),
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

/// Kartu satu paket soal di pemilih; paket premium tampil dengan
/// gembok untuk pengguna gratis (ketuk → tawaran Premium).
class _CategoryCard extends StatelessWidget {
  final LetterQuizCategory cat;
  final bool locked;
  final L l;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.cat,
    required this.locked,
    required this.l,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final accent = locked ? DuoColors.purple : DuoColors.blue;
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.15),
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
                          fontSize: 16, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      locked
                          ? l.t('premium_locked')
                          : '${cat.items.length} ${l.t('letters')}',
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight:
                            locked ? FontWeight.w800 : FontWeight.w400,
                        color: locked
                            ? DuoColors.purple
                            : Theme.of(context).hintColor,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                locked
                    ? Icons.lock_rounded
                    : Icons.chevron_right_rounded,
                color: locked
                    ? DuoColors.purple
                    : Theme.of(context).hintColor,
              ),
            ],
          ),
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

