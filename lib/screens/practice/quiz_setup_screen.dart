import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/goethe_vocab.dart';
import '../../data/jlpt_vocab.dart';
import '../../data/kanji_bank.dart';
import '../../data/jlpt_vocab_adv.dart';
import '../../data/mcq_packs.dart';
import '../../data/question_bank.dart';
import '../../data/topik_vocab.dart';
import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../models/guide.dart';
import '../../providers/progress_provider.dart';
import '../../services/kana_speech.dart';
import '../../theme.dart';
import '../../widgets/duo_button.dart';
import '../../widgets/study/study_background.dart';
import '../premium_screen.dart';
import 'letter_quiz_screen.dart';

/// Satu pilihan chip di layar setelan kuis.
class QuizChoice {
  final String id;
  final String label;
  const QuizChoice(this.id, this.label);
}

/// Satu baris chip (multi-pilih, minimal satu aktif).
class QuizChoiceGroup {
  final String title;
  final List<QuizChoice> choices;
  final Set<String> initial;
  const QuizChoiceGroup({
    required this.title,
    required this.choices,
    required this.initial,
  });
}

/// Layar setelan kuis racikan sendiri: pilih isi lewat chip, pilih bebas
/// jumlah soal, lalu main di [LetterQuizScreen]. Dipakai Tebak Kana
/// Campur, Tebak Kanji, dan Tebak Kata.
class QuizSetupScreen extends StatefulWidget {
  final Course course;
  final String id;
  final String emoji;
  final String title;
  final List<QuizChoiceGroup> groups;

  /// Isi soal dari pilihan chip (urutan sama dengan [groups]).
  final List<KanaItem> Function(List<Set<String>> selected) buildPool;

  /// Satuan jumlah isi ("huruf", "kanji", "kata").
  final String unitLabel;
  final String symbolPromptKey;
  final String readingPromptKey;
  final String Function(KanaItem item)? spokenForm;

  /// Batas soal per sesi untuk pengguna gratis; null = tanpa batas.
  final int? freeLimit;

  const QuizSetupScreen({
    super.key,
    required this.course,
    required this.id,
    required this.emoji,
    required this.title,
    required this.groups,
    required this.buildPool,
    required this.unitLabel,
    this.symbolPromptKey = 'quiz_prompt_reading',
    this.readingPromptKey = 'quiz_prompt_symbol',
    this.spokenForm,
    this.freeLimit,
  });

  @override
  State<QuizSetupScreen> createState() => _QuizSetupScreenState();
}

class _QuizSetupScreenState extends State<QuizSetupScreen> {
  static const _presets = [10, 20, 30, 50, 100];
  static const _minCount = 5;

  late final List<Set<String>> _selected = [
    for (final g in widget.groups) {...g.initial},
  ];
  int _count = 20;

  List<KanaItem> get _pool => widget.buildPool(_selected);

  void _toggle(Set<String> set, String value) {
    setState(() {
      // Minimal satu pilihan tetap aktif.
      if (set.contains(value)) {
        if (set.length > 1) set.remove(value);
      } else {
        set.add(value);
      }
    });
  }

  void _start(List<KanaItem> pool, int count) {
    final cat = LetterQuizCategory(
      id: widget.id,
      emoji: widget.emoji,
      title: {'id': widget.title, 'en': widget.title},
      items: pool,
      ttsLocale: widget.course.ttsLocale,
      symbolPromptKey: widget.symbolPromptKey,
      readingPromptKey: widget.readingPromptKey,
      spokenForm: widget.spokenForm,
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => LetterQuizScreen(
          course: widget.course,
          customCategory: cat,
          questionCount: count,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final pool = _pool;
    final limit = widget.freeLimit;
    final capped =
        limit != null &&
        !context.watch<ProgressProvider>().premiumActive &&
        pool.length > limit;
    final maxCount = capped ? limit : pool.length;
    final count = min(_count, maxCount);
    final sliderMin = min(_minCount, maxCount);
    final sliderMax = max(maxCount, sliderMin + 1);

    return StudyScaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          for (var i = 0; i < widget.groups.length; i++) ...[
            _Heading(widget.groups[i].title),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final c in widget.groups[i].choices)
                  _chip(
                    c.label,
                    _selected[i].contains(c.id),
                    () => _toggle(_selected[i], c.id),
                  ),
              ],
            ),
            const SizedBox(height: 20),
          ],
          Text(
            '${pool.length} ${widget.unitLabel}',
            style: TextStyle(
              fontSize: 12.5,
              color: Theme.of(context).hintColor,
            ),
          ),
          const SizedBox(height: 14),
          _Heading(l.t('kana_mix_count')),
          Center(
            child: Text(
              '$count ${l.t('kana_mix_questions')}',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: DuoColors.blue,
              ),
            ),
          ),
          Slider(
            value: count.toDouble().clamp(
              sliderMin.toDouble(),
              sliderMax.toDouble(),
            ),
            min: sliderMin.toDouble(),
            max: sliderMax.toDouble(),
            divisions: sliderMax - sliderMin,
            label: '$count',
            activeColor: DuoColors.blue,
            onChanged: (v) => setState(() => _count = v.round()),
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final n in _presets)
                if (n < maxCount)
                  _chip('$n', count == n, () => setState(() => _count = n)),
              _chip(
                capped ? '$maxCount' : '${l.t('kana_mix_all')} ($maxCount)',
                count == maxCount,
                () => setState(() => _count = maxCount),
              ),
            ],
          ),
          if (capped) ...[
            const SizedBox(height: 14),
            InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const PremiumScreen())),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: DuoColors.yellow.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: DuoColors.yellow, width: 1.5),
                ),
                child: Row(
                  children: [
                    const Text('👑', style: TextStyle(fontSize: 20)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        l.t('quiz_free_cap').replaceFirst('{n}', '$limit'),
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
          const SizedBox(height: 28),
          DuoButton(
            label: l.t('kana_mix_start'),
            color: DuoColors.blue,
            onPressed: () => _start(pool, count),
          ),
        ],
      ),
    );
  }

  Widget _chip(String label, bool selected, VoidCallback onTap) {
    return FilterChip(
      label: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          color: selected ? Colors.white : null,
        ),
      ),
      selected: selected,
      showCheckmark: false,
      selectedColor: DuoColors.blue,
      onSelected: (_) => onTap(),
    );
  }
}

class _Heading extends StatelessWidget {
  final String text;
  const _Heading(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
      ),
    );
  }
}

/// Tebak Kana Campur: hiragana dan/atau katakana, huruf dasar,
/// dakuten & handakuten, yōon — jumlah soal bebas.
class KanaMixScreen extends StatelessWidget {
  final Course course;
  const KanaMixScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    const groups = {
      'base': KanaGroup.base,
      'dakuten': KanaGroup.dakuten,
      'yoon': KanaGroup.yoon,
    };
    return QuizSetupScreen(
      course: course,
      id: 'kana_custom',
      emoji: '🔀',
      title: l.t('kana_mix_title'),
      unitLabel: l.t('letters'),
      groups: [
        QuizChoiceGroup(
          title: l.t('kana_mix_scripts'),
          choices: const [
            QuizChoice('hiragana', 'あ  Hiragana'),
            QuizChoice('katakana', 'ア  Katakana'),
          ],
          initial: const {'hiragana', 'katakana'},
        ),
        QuizChoiceGroup(
          title: l.t('kana_mix_groups'),
          choices: [
            QuizChoice('base', l.t('kana_mix_base')),
            QuizChoice('dakuten', l.t('kana_mix_dakuten')),
            QuizChoice('yoon', l.t('kana_mix_yoon')),
          ],
          initial: const {'base', 'dakuten'},
        ),
      ],
      buildPool: (sel) => [
        for (final script in sel[0])
          for (final g in sel[1]) ...kanaGroup(script, groups[g]!),
      ],
    );
  }
}

/// Tebak Kanji: kanji N5/N4 dengan tiga jenis soal — arti, bacaan
/// on/kun, dan cara baca contoh kata — jumlah soal bebas (pengguna
/// gratis dibatasi [kFreeMcqLimit] soal per sesi).
class KanjiQuizScreen extends StatelessWidget {
  final Course course;
  const KanjiQuizScreen({super.key, required this.course});

  static const Map<String, List<KanjiSection>> _levels = {
    'N5': kanjiN5Sections,
    'N4': kanjiN4Sections,
  };

  /// "ニチ・ジツ / ひ・か" — on'yomi lalu kun'yomi.
  static String readingsOf(KanjiEntry k) =>
      [k.on.join('・'), k.kun.join('・')].where((r) => r.isNotEmpty).join(' / ');

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return QuizSetupScreen(
      course: course,
      id: 'kanji_custom',
      emoji: '漢',
      title: l.t('kanji_quiz_title'),
      unitLabel: l.t('kanji_quiz_unit'),
      groups: [
        QuizChoiceGroup(
          title: l.t('word_quiz_levels'),
          choices: [for (final k in _levels.keys) QuizChoice(k, k)],
          initial: const {'N5'},
        ),
        QuizChoiceGroup(
          title: l.t('kanji_quiz_types'),
          choices: [
            QuizChoice('meaning', l.t('kanji_type_meaning')),
            QuizChoice('reading', l.t('kanji_type_reading')),
            QuizChoice('word', l.t('kanji_type_word')),
          ],
          initial: const {'meaning', 'reading', 'word'},
        ),
      ],
      buildPool: (sel) {
        final types = sel[1];
        return [
          for (final level in _levels.keys)
            if (sel[0].contains(level))
              for (final s in _levels[level]!)
                for (final k in s.entries) ...[
                  if (types.contains('meaning'))
                    QuizItem(
                      k.kanji,
                      k.meaning[l.code] ?? k.meaning['id']!,
                      kind: 'meaning',
                      symbolPromptKey: 'kanji_prompt_meaning',
                      readingPromptKey: 'quiz_prompt_kanji',
                      speak: spokenFormOf(KanaItem(k.kanji, k.romaji)),
                    ),
                  if (types.contains('reading'))
                    QuizItem(
                      k.kanji,
                      readingsOf(k),
                      kind: 'reading',
                      symbolPromptKey: 'kanji_prompt_reading',
                      readingPromptKey: 'quiz_prompt_kanji',
                      speak: spokenFormOf(KanaItem(k.kanji, k.romaji)),
                    ),
                  if (types.contains('word'))
                    for (final w in k.words)
                      QuizItem(
                        w.word,
                        w.kana,
                        kind: 'word',
                        symbolPromptKey: 'kanji_prompt_word',
                        readingPromptKey: 'kanji_prompt_word_kanji',
                        speak: w.kana,
                      ),
                ],
        ];
      },
      freeLimit: kFreeMcqLimit,
    );
  }
}

/// Tebak Kata: kosakata JLPT per level (Jepang) atau kosakata inti
/// TOPIK I per kategori (Korea) — kata ↔ artinya (bahasa UI), jumlah
/// soal bebas (pengguna gratis dibatasi [kFreeMcqLimit]).
class WordQuizScreen extends StatelessWidget {
  final Course course;
  const WordQuizScreen({super.key, required this.course});

  static const Map<String, List<JVocab>> _levels = {
    'N5': jlptN5,
    'N4': jlptN4,
    'N3': jlptN3,
    'N2': jlptN2,
    'N1': jlptN1,
  };

  /// Kata per pilihan (kunci pilihan → daftar kata) dan label pilihan.
  (Map<String, List<JVocab>>, Map<String, String>, String) _choices(L l) {
    // Korea (TOPIK I) & Jerman (Goethe A1/A2): per kategori besar.
    final byCategory = switch (course.id) {
      'ko' => (topikVocab, topikGroupCategory, topikVocabCategories),
      'de' => (goetheVocab, goetheGroupCategory, goetheVocabCategories),
      _ => null,
    };
    if (byCategory != null) {
      final (vocab, groupCat, cats) = byCategory;
      final byCat = <String, List<JVocab>>{};
      for (final w in vocab) {
        byCat.putIfAbsent('c${groupCat[w.group]}', () => []).add(w);
      }
      return (
        byCat,
        {
          for (var i = 0; i < cats.length; i++)
            'c$i': cats[i][l.code] ?? cats[i]['id']!,
        },
        'c0',
      );
    }
    return (_levels, {for (final k in _levels.keys) k: k}, 'N5');
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final (levels, labels, initial) = _choices(l);
    final isKo = course.id == 'ko' || course.id == 'de';
    return QuizSetupScreen(
      course: course,
      id: course.id == 'ja' ? 'word_custom' : 'word_custom_${course.id}',
      emoji: '📖',
      title: l.t('word_quiz_title'),
      unitLabel: l.t('word_quiz_unit'),
      groups: [
        QuizChoiceGroup(
          title: l.t(isKo ? 'word_quiz_categories' : 'word_quiz_levels'),
          choices: [for (final k in levels.keys) QuizChoice(k, labels[k]!)],
          initial: {initial},
        ),
      ],
      buildPool: (sel) {
        final seen = <String>{};
        return [
          for (final level in levels.keys)
            if (sel[0].contains(level))
              for (final v in levels[level]!)
                if (seen.add('${v.kana}|${v.meaning[l.code]}'))
                  KanaItem(v.kana, v.meaning[l.code] ?? v.meaning['id']!),
        ];
      },
      symbolPromptKey: 'quiz_prompt_meaning',
      readingPromptKey: 'quiz_prompt_word',
      // Sisi kanan item berisi arti (bukan romaji), jadi TTS
      // mengucapkan katanya langsung.
      spokenForm: (item) => item.kana,
      freeLimit: kFreeMcqLimit,
    );
  }
}
