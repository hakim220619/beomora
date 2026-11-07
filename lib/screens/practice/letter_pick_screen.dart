import 'package:flutter/material.dart';

import '../../data/handwriting_bank.dart';
import '../../data/question_bank.dart';
import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../models/guide.dart';
import '../../theme.dart';
import '../../widgets/duo_button.dart';
import '../../widgets/question_count_sheet.dart';
import '../../widgets/study/study_background.dart';
import 'letter_quiz_screen.dart';

/// Satu kelompok huruf (mengikuti bagian topik Materi, mis. "Gojūon").
class _Group {
  final String title;
  final List<KanaItem> items;
  const _Group(this.title, this.items);
}

/// Pemilih huruf sebelum latihan (hiragana, katakana, kanji, dst.):
/// centang huruf per bagian, lalu tentukan jumlah soal. Dipakai tombol
/// latihan di Materi (→ kuis pilihan ganda) dan Tulis Huruf.
class LetterPickScreen extends StatefulWidget {
  final Course course;
  final LetterQuizCategory category;

  /// Topik Materi asal — bagian-bagiannya jadi kelompok huruf.
  final GuideTopic? topic;

  /// Kelompok siap pakai (mis. [writingGroupsFor]); menggantikan [topic].
  final List<LetterGroup>? groups;

  /// Judul AppBar; bawaan "Latihan" + nama paket.
  final String? title;

  /// Batas soal pengguna gratis; bawaan [showQuestionCountSheet].
  final int? freeLimit;

  /// Mulai latihan dengan paket berisi huruf terpilih. Bawaan: kuis
  /// pilihan ganda ([LetterQuizScreen]).
  final void Function(
    BuildContext context,
    LetterQuizCategory picked,
    int count,
  )?
  onStart;

  const LetterPickScreen({
    super.key,
    required this.course,
    required this.category,
    this.topic,
    this.groups,
    this.title,
    this.freeLimit,
    this.onStart,
  });

  @override
  State<LetterPickScreen> createState() => _LetterPickScreenState();
}

class _LetterPickScreenState extends State<LetterPickScreen> {
  final Set<String> _selected = {};
  String? _groupsLang;
  List<_Group> _groups = const [];

  /// Kelompok per bagian topik; huruf paket yang tidak ada di bagian
  /// mana pun dikumpulkan di kelompok terakhir.
  List<_Group> _groupsFor(String uiLang) {
    if (_groupsLang == uiLang) return _groups;
    _groupsLang = uiLang;
    final inPack = {for (final k in widget.category.items) k.kana: k};
    final seen = <String>{};
    final groups = <_Group>[];
    for (final g in widget.groups ?? const <LetterGroup>[]) {
      final items = [
        for (final k in g.items)
          if (inPack.containsKey(k.kana) && seen.add(k.kana)) inPack[k.kana]!,
      ];
      if (items.isEmpty) continue;
      groups.add(
        _Group(g.title[uiLang] ?? g.title.values.firstOrNull ?? '', items),
      );
    }
    final sections = widget.groups == null
        ? widget.topic?.sections ?? const <GuideSection>[]
        : const <GuideSection>[];
    for (final s in sections) {
      final items = [
        for (final k in s.kana)
          if (inPack.containsKey(k.kana) && seen.add(k.kana)) inPack[k.kana]!,
      ];
      if (items.isEmpty) continue;
      groups.add(
        _Group(s.title[uiLang] ?? s.title.values.firstOrNull ?? '', items),
      );
    }
    final rest = [
      for (final k in widget.category.items)
        if (!seen.contains(k.kana)) k,
    ];
    if (rest.isNotEmpty) {
      groups.add(
        _Group(
          groups.isEmpty ? '' : L.read(context).t('letter_pick_other'),
          rest,
        ),
      );
    }
    return _groups = groups;
  }

  void _setAll(Iterable<KanaItem> items, bool on) => setState(() {
    for (final k in items) {
      on ? _selected.add(k.kana) : _selected.remove(k.kana);
    }
  });

  void _toggle(KanaItem k) => setState(
    () => _selected.contains(k.kana)
        ? _selected.remove(k.kana)
        : _selected.add(k.kana),
  );

  Future<void> _next() async {
    final cat = widget.category;
    final picked = [
      for (final k in cat.items)
        if (_selected.contains(k.kana)) k,
    ];
    final count = await showQuestionCountSheet(
      context,
      selected: picked.length,
      freeLimit: widget.freeLimit,
    );
    if (count == null || !mounted) return;
    final custom = LetterQuizCategory(
      id: '${cat.id}_custom',
      emoji: cat.emoji,
      title: cat.title,
      items: picked,
      ttsLocale: cat.ttsLocale,
      symbolPromptKey: cat.symbolPromptKey,
      readingPromptKey: cat.readingPromptKey,
      spokenForm: cat.spokenForm,
      // Pengecoh dari seluruh paket agar tetap 4 pilihan walau
      // huruf yang dipilih cuma satu-dua.
      distractors: cat.distractors ?? cat.items,
    );
    final onStart = widget.onStart;
    if (onStart != null) {
      onStart(context, custom, count);
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => LetterQuizScreen(
          course: widget.course,
          questionCount: count,
          customCategory: custom,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final groups = _groupsFor(l.code);
    final all = widget.category.items;
    final count = _selected.length;

    return StudyScaffold(
      appBar: AppBar(
        title: Text(
          widget.title ??
              '${l.t('practice_btn')} ${widget.category.title[l.code] ?? ''}',
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 8, 0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    l.t('letter_pick_hint'),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                IconButton(
                  tooltip: l.t('vocab_practice_all'),
                  onPressed: () => _setAll(all, true),
                  icon: const Icon(Icons.done_all_rounded),
                  color: DuoColors.blue,
                ),
                IconButton(
                  tooltip: l.t('vocab_practice_none'),
                  onPressed: count == 0
                      ? null
                      : () => setState(_selected.clear),
                  icon: const Icon(Icons.remove_done_rounded),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
              itemCount: groups.length,
              itemBuilder: (_, i) => _groupCard(groups[i]),
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
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '$count ${l.t('letter_pick_count')}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: DuoButton(
                      label: l.t('vocab_practice_next'),
                      color: DuoColors.blue,
                      height: 48,
                      onPressed: count == 0 ? null : _next,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _groupCard(_Group g) {
    final picked = g.items.where((k) => _selected.contains(k.kana)).length;
    final hint = Theme.of(context).hintColor;
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4, 4, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Checkbox(
                  tristate: true,
                  value: picked == 0
                      ? false
                      : (picked == g.items.length ? true : null),
                  activeColor: DuoColors.blue,
                  onChanged: (_) => _setAll(g.items, picked < g.items.length),
                ),
                Expanded(
                  child: Text(
                    g.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Text(
                  '$picked/${g.items.length}',
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w700,
                    color: hint,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: LayoutBuilder(
                builder: (_, box) {
                  const gap = 6.0;
                  const cols = 5;
                  final w = (box.maxWidth - gap * (cols - 1)) / cols;
                  return Wrap(
                    spacing: gap,
                    runSpacing: gap,
                    children: [for (final k in g.items) _tile(k, w)],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tile(KanaItem k, double width) {
    final on = _selected.contains(k.kana);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Material(
      color: on
          ? DuoColors.blue.withValues(alpha: 0.18)
          : (isDark ? Colors.white.withValues(alpha: 0.05) : DuoColors.snow),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: on
              ? DuoColors.blue
              : (isDark ? const Color(0x26FFFFFF) : const Color(0xFFEDE6CF)),
          width: on ? 2 : 1.5,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => _toggle(k),
        child: SizedBox(
          width: width,
          height: 58,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  k.kana,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: on ? DuoColors.blue : null,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Text(
                  k.romaji,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10.5,
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
