import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../data/handwriting_bank.dart';
import '../../data/question_bank.dart';
import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../models/guide.dart';
import '../../providers/progress_provider.dart';
import '../../services/handwriting_service.dart';
import '../../services/kana_speech.dart';
import '../../services/tts_service.dart';
import '../../theme.dart';
import '../../widgets/duo_button.dart';
import '../../widgets/study/ink_canvas.dart';
import '../../widgets/study/pencil_progress_bar.dart';
import '../../widgets/study/quiz_result_view.dart';
import '../../widgets/study/study_background.dart';
import '../premium_screen.dart';
import 'letter_pick_screen.dart';

/// Tulis Huruf: dengar/lihat bacaan, tulis lambangnya di kanvas, dinilai
/// oleh pengenalan tulisan tangan ML Kit (offline). Paket diambil dari
/// [writingCategoriesFor]; jawaban benar kalau lambang muncul di
/// [HandwritingService.topCandidates] kandidat teratas.
class HandwritingScreen extends StatefulWidget {
  final Course course;

  /// Paket berisi huruf pilihan (dari [LetterPickScreen]): latihan
  /// langsung mulai dengan [questionCount] soal, tanpa daftar paket.
  final LetterQuizCategory? customCategory;
  final int questionCount;

  const HandwritingScreen({
    super.key,
    required this.course,
    this.customCategory,
    this.questionCount = 10,
  });

  @override
  State<HandwritingScreen> createState() => _HandwritingScreenState();
}

class _HandwritingScreenState extends State<HandwritingScreen> {
  final _rng = Random();
  final _canvas = InkCanvasController();

  LetterQuizCategory? _category;
  List<KanaItem> _items = [];
  int _index = 0;
  int _correct = 0;
  final List<KanaItem> _missed = [];
  bool _finished = false;
  int _earnedXp = 0;

  bool _checking = false;
  bool? _lastCorrect; // null = belum diperiksa
  List<String> _lastCandidates = const [];

  String get _language => HandwritingService.languageFor(widget.course.id)!;

  @override
  void initState() {
    super.initState();
    final custom = widget.customCategory;
    if (custom != null) _startInternal(custom);
  }

  @override
  void dispose() {
    TtsService.instance.stop();
    _canvas.dispose();
    super.dispose();
  }

  /// Paket dipilih: pilih huruf (per kelompok) & jumlah soal dulu.
  void _pick(LetterQuizCategory cat) {
    final l = L.read(context);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => LetterPickScreen(
          course: widget.course,
          category: cat,
          groups: writingGroupsFor(widget.course.id, cat),
          title: '${l.t('handwriting_title')} · ${cat.title[l.code] ?? ''}',
          freeLimit: kFreeHandwritingQuestions,
          onStart: (ctx, picked, count) => Navigator.of(ctx).push(
            MaterialPageRoute(
              builder: (_) => HandwritingScreen(
                course: widget.course,
                customCategory: picked,
                questionCount: count,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// [widget.questionCount] huruf acak dari paket. Kalau melebihi isi
  /// paket, huruf diulang per putaran (diacak ulang tiap putaran) dan
  /// diusahakan tidak muncul dua kali berturut-turut.
  List<KanaItem> _drawItems(List<KanaItem> pool) {
    final out = <KanaItem>[];
    while (out.length < widget.questionCount && pool.isNotEmpty) {
      final round = [...pool]..shuffle(_rng);
      if (out.isNotEmpty && round.length > 1 && round.first == out.last) {
        round.add(round.removeAt(0));
      }
      out.addAll(round.take(widget.questionCount - out.length));
    }
    return out;
  }

  void _start(LetterQuizCategory cat) => setState(() => _startInternal(cat));

  void _startInternal(LetterQuizCategory cat) {
    _category = cat;
    _items = _drawItems(cat.items);
    _index = 0;
    _correct = 0;
    _missed.clear();
    _finished = false;
    _earnedXp = 0;
    _resetQuestion();
  }

  void _resetQuestion() {
    _canvas.clear();
    _lastCorrect = null;
    _lastCandidates = const [];
    _checking = false;
  }

  Future<void> _check() async {
    if (_checking || _lastCorrect != null) return;
    final l = L.read(context);
    if (_canvas.isEmpty) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(l.t('handwriting_empty'))));
      return;
    }
    setState(() => _checking = true);
    final item = _items[_index];
    final candidates = await HandwritingService.instance.recognize(
      _canvas.strokes,
      _language,
      area: _canvas.area,
    );
    if (!mounted) return;
    final ok = HandwritingService.matches(item.kana, candidates);
    if (ok) {
      _correct++;
      HapticFeedback.lightImpact();
    } else {
      _missed.add(item);
      HapticFeedback.mediumImpact();
    }
    unawaited(
      TtsService.instance.speak(spokenFormOf(item), _category!.ttsLocale),
    );
    setState(() {
      _checking = false;
      _lastCorrect = ok;
      _lastCandidates = candidates
          .take(HandwritingService.topCandidates)
          .toList();
    });
  }

  void _next() {
    if (_index + 1 < _items.length) {
      setState(() {
        _index++;
        _resetQuestion();
      });
    } else {
      _finish();
    }
  }

  void _finish() {
    final progress = context.read<ProgressProvider>();
    // Streak + pulihkan 1 nyawa (+5 XP), plus 2 XP per huruf yang benar
    // (menulis lebih berat daripada memilih).
    final baseXp = progress.completePractice();
    final bonusXp = _correct > 0 ? progress.addXp(_correct * 2) : 0;
    setState(() {
      _earnedXp = baseXp + bonusXp;
      _finished = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return StudyScaffold(
      appBar: AppBar(title: Text(l.t('handwriting_title'))),
      body: _category == null
          ? _buildPicker(l)
          : _finished
          ? QuizResultView(
              correct: _correct,
              total: _items.length,
              earnedXp: _earnedXp,
              review: _buildReview(l),
              onAgain: () => _start(_category!),
              onDone: () => Navigator.of(context).pop(),
            )
          : _buildQuiz(l),
    );
  }

  /// Ulasan hasil: keping huruf yang salah, plus ajakan Premium untuk
  /// pengguna gratis (sesi mereka hanya [kFreeHandwritingQuestions] huruf).
  Widget? _buildReview(L l) {
    final premium = context.watch<ProgressProvider>().premiumActive;
    if (_missed.isEmpty && premium) return null;
    return Column(
      children: [
        if (_missed.isNotEmpty)
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final item in _missed)
                _MissedChip(
                  symbol: item.kana,
                  reading: item.romaji,
                  onTap: () => TtsService.instance.speak(
                    spokenFormOf(item),
                    _category!.ttsLocale,
                  ),
                ),
            ],
          ),
        if (!premium) ...[
          if (_missed.isNotEmpty) const SizedBox(height: 14),
          _PremiumNote(
            text:
                '${l.t('handwriting_free_note').replaceFirst('{n}', '$kFreeHandwritingQuestions')}. '
                '${l.t('handwriting_unlock')}',
          ),
        ],
      ],
    );
  }

  Widget _buildPicker(L l) {
    final categories = writingCategoriesFor(widget.course.id);
    final isPremium = context.watch<ProgressProvider>().premiumActive;
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
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const PremiumScreen()),
                );
              } else {
                _pick(cat);
              }
            },
          ),
      ],
    );
  }

  Widget _buildQuiz(L l) {
    final item = _items[_index];
    final checked = _lastCorrect != null;
    final hint = Theme.of(context).hintColor;

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      children: [
        Row(
          children: [
            Expanded(
              child: PencilProgressBar(
                value: (_index + (checked ? 1 : 0)) / _items.length,
                height: 14,
                color: DuoColors.green,
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
        if (!context.watch<ProgressProvider>().premiumActive) ...[
          const SizedBox(height: 10),
          _PremiumNote(
            compact: true,
            text:
                '${l.t('handwriting_free_note').replaceFirst('{n}', '$kFreeHandwritingQuestions')} · '
                '${l.t('handwriting_unlock')}',
          ),
        ],
        const SizedBox(height: 16),
        Text(
          l.t('handwriting_prompt'),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10),
        // Bacaan yang ditanyakan + tombol dengar.
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Row(
              children: [
                const SizedBox(width: 40),
                Expanded(
                  child: Text(
                    item.romaji,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                IconButton(
                  tooltip: l.t('listening_play'),
                  icon: const Icon(
                    Icons.volume_up_rounded,
                    color: DuoColors.blue,
                  ),
                  onPressed: () => TtsService.instance.speak(
                    spokenFormOf(item),
                    _category!.ttsLocale,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 14),
        InkCanvas(
          controller: _canvas,
          enabled: !checked && !_checking,
          hint: l.t('handwriting_canvas_hint'),
        ),
        const SizedBox(height: 10),
        if (!checked)
          Row(
            children: [
              IconButton(
                tooltip: l.t('handwriting_undo'),
                onPressed: _checking ? null : _canvas.undo,
                icon: const Icon(Icons.undo_rounded),
              ),
              IconButton(
                tooltip: l.t('handwriting_clear'),
                onPressed: _checking ? null : _canvas.clear,
                icon: const Icon(Icons.delete_sweep_rounded),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: DuoButton(
                  label: _checking ? '…' : l.t('handwriting_check'),
                  onPressed: _checking ? null : _check,
                  color: DuoColors.blue,
                ),
              ),
            ],
          )
        else ...[
          _Feedback(
            correct: _lastCorrect!,
            answer: item.kana,
            recognized: _lastCandidates,
            l: l,
          ),
          const SizedBox(height: 12),
          DuoButton(
            label: l.t('handwriting_next'),
            onPressed: _next,
            color: _lastCorrect! ? DuoColors.green : DuoColors.red,
          ),
        ],
      ],
    );
  }
}

/// Umpan balik setelah diperiksa: benar (hijau) atau salah (merah) dengan
/// lambang jawaban besar dan teks yang terbaca oleh mesin.
class _Feedback extends StatelessWidget {
  final bool correct;
  final String answer;
  final List<String> recognized;
  final L l;

  const _Feedback({
    required this.correct,
    required this.answer,
    required this.recognized,
    required this.l,
  });

  @override
  Widget build(BuildContext context) {
    final color = correct ? DuoColors.green : DuoColors.red;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.5), width: 1.5),
      ),
      child: Row(
        children: [
          Text(
            answer,
            style: TextStyle(
              fontSize: 44,
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
                  l.t(correct ? 'correct' : 'wrong'),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: color,
                  ),
                ),
                if (!correct)
                  Text(
                    '${l.t('handwriting_answer')}: $answer',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                Text(
                  '${l.t('handwriting_recognized')}: '
                  '${recognized.isEmpty ? '—' : recognized.join(', ')}',
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Kotak kuning bermahkota: keterangan batas gratis, ketuk → Premium.
class _PremiumNote extends StatelessWidget {
  final String text;
  final bool compact;
  const _PremiumNote({required this.text, this.compact = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () => Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => const PremiumScreen())),
      child: Container(
        padding: EdgeInsets.all(compact ? 10 : 14),
        decoration: BoxDecoration(
          color: DuoColors.yellow.withValues(alpha: 0.16),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: DuoColors.yellow, width: 1.5),
        ),
        child: Row(
          children: [
            Text('👑', style: TextStyle(fontSize: compact ? 18 : 22)),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: compact ? 12 : 13,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Icon(Icons.chevron_right_rounded),
          ],
        ),
      ),
    );
  }
}

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
    final accent = locked ? DuoColors.purple : DuoColors.green;
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
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(14),
                ),
                alignment: Alignment.center,
                child: Text(
                  cat.emoji,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                  ),
                ),
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
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      locked
                          ? l.t('premium_locked')
                          : '${cat.items.length} ${l.t('handwriting_title').toLowerCase()}',
                      style: TextStyle(
                        fontSize: 12.5,
                        color: locked ? accent : Theme.of(context).hintColor,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                locked ? Icons.lock_rounded : Icons.draw_rounded,
                color: accent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
    return ActionChip(
      onPressed: onTap,
      avatar: Text(
        symbol,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
      ),
      label: Text(reading),
    );
  }
}
