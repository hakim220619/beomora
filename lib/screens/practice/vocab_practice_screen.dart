import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/mcq_packs.dart';
import '../../data/question_bank.dart';
import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../models/guide.dart';
import '../../providers/progress_provider.dart';
import '../../theme.dart';
import '../../widgets/duo_button.dart';
import '../../widgets/study/study_background.dart';
import '../premium_screen.dart';
import 'letter_quiz_screen.dart';

/// Tombol mengapung "Latihan Kosakata" untuk halaman kosakata Materi.
Widget vocabPracticeFab(
  BuildContext context,
  Course course,
  List<GuideTopic> topics,
) {
  final l = L.of(context);
  return FloatingActionButton.extended(
    heroTag: 'vocab_practice',
    backgroundColor: DuoColors.green,
    foregroundColor: Colors.white,
    icon: const Icon(Icons.fitness_center_rounded),
    label: Text(
      l.t('vocab_practice_btn'),
      style: const TextStyle(fontWeight: FontWeight.w900, letterSpacing: 0.4),
    ),
    onPressed: () => Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => VocabPracticeScreen(course: course, topics: topics),
      ),
    ),
  );
}

/// Satu kata di pemilih beserta kunci uniknya (kata|arti).
class _Word {
  final String key;
  final GuideExample example;
  final KanaItem item; // kata ↔ arti (bahasa UI)
  const _Word(this.key, this.example, this.item);
}

/// Latihan Kosakata: pilih kata dari topik kosakata Materi, tentukan
/// jumlah soal, lalu hafalkan lewat kuis pilihan ganda (kata ↔ arti).
/// Jumlah soal boleh melebihi kata yang dipilih — sisanya diulang acak.
class VocabPracticeScreen extends StatefulWidget {
  final Course course;
  final List<GuideTopic> topics;

  const VocabPracticeScreen({
    super.key,
    required this.course,
    required this.topics,
  });

  @override
  State<VocabPracticeScreen> createState() => _VocabPracticeScreenState();
}

class _VocabPracticeScreenState extends State<VocabPracticeScreen> {
  static const _presets = [5, 10, 20, 30, 50];
  static const _maxCount = 100;

  final _searchCtrl = TextEditingController();
  String _query = '';
  final Set<String> _selected = {};

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  /// Kata per topik; kata yang sama di dua topik cukup satu kunci.
  List<_Word> _wordsOf(GuideTopic topic, String uiLang) => [
    for (final s in topic.sections)
      for (final e in s.examples) _wordOf(e, uiLang),
  ];

  _Word _wordOf(GuideExample e, String uiLang) {
    final meaning = e.meaning[uiLang] ?? e.meaning.values.first;
    return _Word('${e.target}|$meaning', e, KanaItem(e.target, meaning));
  }

  bool _matches(_Word w) {
    final q = _query.trim().toLowerCase();
    return w.example.target.toLowerCase().contains(q) ||
        (w.example.romaji?.toLowerCase().contains(q) ?? false) ||
        w.item.romaji.toLowerCase().contains(q);
  }

  void _toggleAll(Iterable<_Word> words, bool on) {
    setState(() {
      for (final w in words) {
        on ? _selected.add(w.key) : _selected.remove(w.key);
      }
    });
  }

  void _toggle(_Word w) => setState(
    () => _selected.contains(w.key)
        ? _selected.remove(w.key)
        : _selected.add(w.key),
  );

  Future<void> _openCountSheet(List<_Word> all) async {
    final premium = context.read<ProgressProvider>().premiumActive;
    final maxCount = premium ? _maxCount : kFreeMcqLimit;
    final picked = {
      for (final w in all)
        if (_selected.contains(w.key)) w.key: w.item,
    }.values.toList();
    final count = await showModalBottomSheet<int>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _CountSheet(
        selected: picked.length,
        initial: min(max(picked.length, 10), maxCount),
        maxCount: maxCount,
        capped: !premium,
        presets: _presets,
      ),
    );
    if (count == null || !mounted) return;
    final l = L.read(context);
    final cat = LetterQuizCategory(
      id: 'vocab_custom',
      emoji: '🗒️',
      title: {
        'id': l.t('vocab_practice_title'),
        'en': l.t('vocab_practice_title'),
      },
      items: picked,
      // Pengecoh dari semua kata di topik agar tetap 4 pilihan walau
      // kata yang dipilih cuma satu-dua.
      distractors: {for (final w in all) w.key: w.item}.values.toList(),
      ttsLocale: widget.course.ttsLocale,
      symbolPromptKey: 'quiz_prompt_meaning',
      readingPromptKey: 'quiz_prompt_word',
      spokenForm: (item) => item.kana,
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
    final groups = [
      for (final t in widget.topics) (topic: t, words: _wordsOf(t, l.code)),
    ];
    final all = [for (final g in groups) ...g.words];
    final searching = _query.trim().isNotEmpty;
    final hits = searching
        ? {for (final w in all.where(_matches)) w.key: w}.values.toList()
        : const <_Word>[];
    final selectedCount = {
      for (final w in all)
        if (_selected.contains(w.key)) w.key,
    }.length;

    return StudyScaffold(
      appBar: AppBar(title: Text(l.t('vocab_practice_title'))),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
            child: TextField(
              controller: _searchCtrl,
              onChanged: (v) => setState(() => _query = v),
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: l.t('vocab_search_hint_plain'),
                prefixIcon: const Icon(Icons.search_rounded),
                suffixIcon: searching
                    ? IconButton(
                        icon: const Icon(Icons.close_rounded),
                        onPressed: () {
                          _searchCtrl.clear();
                          setState(() => _query = '');
                        },
                      )
                    : null,
                isDense: true,
                filled: true,
                fillColor: Theme.of(context).cardTheme.color,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 6, 8, 0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    l.t('vocab_practice_pick'),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => _toggleAll(searching ? hits : all, true),
                  child: Text(l.t('vocab_practice_all')),
                ),
                TextButton(
                  onPressed: selectedCount == 0
                      ? null
                      : () => setState(_selected.clear),
                  child: Text(l.t('vocab_practice_none')),
                ),
              ],
            ),
          ),
          Expanded(
            child: searching
                ? ListView(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                    children: [
                      if (hits.isEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40),
                          child: Text(
                            l.t('vocab_search_empty'),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                        ),
                      for (final w in hits) _wordTile(w),
                    ],
                  )
                : ListView(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                    children: [
                      for (final g in groups) _topicTile(g.topic, g.words, l),
                    ],
                  ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
            decoration: BoxDecoration(
              color: Theme.of(context).cardTheme.color,
              border: Border(
                top: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '$selectedCount ${l.t('vocab_practice_selected')}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: DuoButton(
                    label: l.t('vocab_practice_next'),
                    color: DuoColors.blue,
                    height: 48,
                    onPressed: selectedCount == 0
                        ? null
                        : () => _openCountSheet(all),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _topicTile(GuideTopic topic, List<_Word> words, L l) {
    final picked = words.where((w) => _selected.contains(w.key)).length;
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        initiallyExpanded: widget.topics.length == 1,
        shape: const Border(),
        leading: Checkbox(
          tristate: true,
          value: picked == 0 ? false : (picked == words.length ? true : null),
          activeColor: DuoColors.blue,
          onChanged: (_) => _toggleAll(words, picked < words.length),
        ),
        title: Text(
          '${topic.emoji} ${topic.title[l.code] ?? ''}',
          style: const TextStyle(fontWeight: FontWeight.w900),
        ),
        subtitle: Text('$picked/${words.length}'),
        children: [for (final w in words) _wordTile(w)],
      ),
    );
  }

  Widget _wordTile(_Word w) {
    final romaji = w.example.romaji;
    return CheckboxListTile(
      dense: true,
      value: _selected.contains(w.key),
      activeColor: DuoColors.blue,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (_) => _toggle(w),
      title: Text(
        w.example.target,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
      ),
      subtitle: Text(
        romaji == null ? w.item.romaji : '$romaji · ${w.item.romaji}',
      ),
    );
  }
}

/// Lembar bawah: tentukan jumlah soal (−/+ dan pilihan cepat).
class _CountSheet extends StatefulWidget {
  final int selected;
  final int initial;
  final int maxCount;
  final bool capped;
  final List<int> presets;

  const _CountSheet({
    required this.selected,
    required this.initial,
    required this.maxCount,
    required this.capped,
    required this.presets,
  });

  @override
  State<_CountSheet> createState() => _CountSheetState();
}

class _CountSheetState extends State<_CountSheet> {
  late int _count = widget.initial;

  void _set(int v) => setState(() => _count = v.clamp(1, widget.maxCount));

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l.t('kana_mix_count'),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filledTonal(
                  onPressed: _count > 1 ? () => _set(_count - 1) : null,
                  icon: const Icon(Icons.remove_rounded),
                ),
                SizedBox(
                  width: 120,
                  child: Text(
                    '$_count',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: DuoColors.blue,
                    ),
                  ),
                ),
                IconButton.filledTonal(
                  onPressed: _count < widget.maxCount
                      ? () => _set(_count + 1)
                      : null,
                  icon: const Icon(Icons.add_rounded),
                ),
              ],
            ),
            Center(child: Text(l.t('kana_mix_questions'))),
            const SizedBox(height: 12),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final n in {
                  widget.selected,
                  ...widget.presets,
                }.where((n) => n <= widget.maxCount).toList()..sort())
                  ChoiceChip(
                    label: Text(
                      '$n',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: _count == n ? Colors.white : null,
                      ),
                    ),
                    selected: _count == n,
                    showCheckmark: false,
                    selectedColor: DuoColors.blue,
                    onSelected: (_) => _set(n),
                  ),
              ],
            ),
            if (_count > widget.selected) ...[
              const SizedBox(height: 12),
              Text(
                '🔁 ${l.t('vocab_practice_repeat')}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.5,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ],
            if (widget.capped) ...[
              const SizedBox(height: 12),
              InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const PremiumScreen()),
                ),
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
                          l
                              .t('quiz_free_cap')
                              .replaceFirst('{n}', '${widget.maxCount}'),
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
            DuoButton(
              label: l.t('kana_mix_start'),
              color: DuoColors.blue,
              onPressed: () => Navigator.of(context).pop(_count),
            ),
          ],
        ),
      ),
    );
  }
}
