import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/question_bank.dart';
import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../models/guide.dart';
import '../../providers/settings_provider.dart';
import '../../services/tts_service.dart';
import '../../theme.dart';
import '../../widgets/duo_button.dart';
import '../../widgets/question_count_sheet.dart';
import '../../widgets/study/study_background.dart';
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

/// Pembatas bagian (mis. "Bagian 1") di daftar kata satu topik.
class _Section {
  final String title;
  final List<_Word> words;
  const _Section(this.title, this.words);
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
  // Kelipatan kecepatan suara; 1× = laju TTS 0.45 dengan jeda 700 ms.
  static const _speeds = [0.5, 0.75, 1.0, 1.25, 1.5, 2.0];

  static String _speedLabel(double x) =>
      '${x.toStringAsFixed(2).replaceFirst(RegExp(r'\.?0+$'), '')}×';

  final _searchCtrl = TextEditingController();
  String _query = '';
  final Set<String> _selected = {};

  // Putar kata terpilih berurutan: antrean dibekukan saat mulai, dan
  // token dinaikkan untuk membatalkan putaran yang sedang berjalan.
  List<_Word> _queue = const [];
  int? _playing; // indeks di [_queue] yang sedang dibacakan
  int _playToken = 0;
  bool _loop = false; // ulangi antrean terus-menerus sampai dihentikan

  @override
  void dispose() {
    _playToken++;
    TtsService.instance.stop();
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _play(List<_Word> all) async {
    final queue = {
      for (final w in all)
        if (_selected.contains(w.key)) w.key: w,
    }.values.toList();
    if (queue.isEmpty) return;
    final token = ++_playToken;
    setState(() => _queue = queue);
    // [_loop] dibaca tiap akhir putaran, jadi boleh diubah saat berjalan.
    play:
    do {
      for (var i = 0; i < queue.length; i++) {
        if (!mounted || token != _playToken) return;
        setState(() => _playing = i);
        // Kecepatan dibaca per kata agar perubahan langsung terasa.
        final x = context.read<SettingsProvider>().playSpeed;
        final done = await TtsService.instance.speakAndWait(
          queue[i].example.target,
          widget.course.ttsLocale,
          rate: min(0.45 * x, 1.0),
        );
        if (!mounted || token != _playToken) return;
        if (!done) break play;
        await Future<void>.delayed(Duration(milliseconds: (700 / x).round()));
      }
    } while (_loop);
    if (mounted && token == _playToken) setState(() => _playing = null);
  }

  void _stopPlay() {
    _playToken++;
    TtsService.instance.stop();
    if (_playing != null) setState(() => _playing = null);
  }

  bool _isPlaying(_Word w) =>
      _playing != null && _queue[_playing!].key == w.key;

  // Daftar kata disusun sekali per bahasa UI (bukan tiap ketukan), dan
  // hasil cari disimpan per kata kunci — topik JLPT berisi ratusan kata.
  String? _wordsLang;

  /// [rows] = isi topik saat dibuka: [_Section] (pembatas) atau [_Word].
  List<({GuideTopic topic, List<_Word> words, List<Object> rows})> _groups =
      const [];
  List<_Word> _all = const [];
  Map<String, _Word> _byTarget = const {}; // kata target → kata pertama
  bool _starredOpen = true;
  String? _hitsQuery;
  List<_Word> _hits = const [];
  late final Set<int> _expanded = {if (widget.topics.length == 1) 0};

  void _ensureWords(String uiLang) {
    if (_wordsLang == uiLang) return;
    _wordsLang = uiLang;
    _groups = [for (final t in widget.topics) _groupOf(t, uiLang)];
    _all = [for (final g in _groups) ...g.words];
    _byTarget = {};
    for (final w in _all) {
      _byTarget.putIfAbsent(w.example.target, () => w);
    }
    _hitsQuery = null;
    // Kunci memuat arti, jadi berubah saat bahasa UI diganti.
    _selected.retainAll({for (final w in _all) w.key});
  }

  List<_Word> _hitsFor(String q) {
    if (_hitsQuery != q) {
      _hitsQuery = q;
      _hits = {for (final w in _all.where(_matches)) w.key: w}.values.toList();
    }
    return _hits;
  }

  /// Kata per topik; kata yang sama di dua topik cukup satu kunci.
  /// Topik berbagian (Bagian 1, 2, …) mendapat pembatas di [rows].
  ({GuideTopic topic, List<_Word> words, List<Object> rows}) _groupOf(
    GuideTopic topic,
    String uiLang,
  ) {
    final words = <_Word>[];
    final rows = <Object>[];
    final withHeaders =
        topic.sections.where((s) => s.examples.isNotEmpty).length > 1;
    for (final s in topic.sections) {
      if (s.examples.isEmpty) continue;
      final part = [for (final e in s.examples) _wordOf(e, uiLang)];
      final title = s.title[uiLang] ?? s.title.values.firstOrNull ?? '';
      if (withHeaders && title.isNotEmpty) rows.add(_Section(title, part));
      rows.addAll(part);
      words.addAll(part);
    }
    return (topic: topic, words: words, rows: rows);
  }

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
    _stopPlay();
    final picked = {
      for (final w in all)
        if (_selected.contains(w.key)) w.key: w.item,
    }.values.toList();
    final count = await showQuestionCountSheet(
      context,
      selected: picked.length,
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
    final settings = context.watch<SettingsProvider>();
    _ensureWords(l.code);
    final all = _all;
    final searching = _query.trim().isNotEmpty;
    final hits = searching
        ? _hitsFor(_query.trim().toLowerCase())
        : const <_Word>[];
    final selectedCount = _selected.length;
    // Kartu Favorit: kata berbintang (dari Materi) yang ada di topik ini.
    final starred = [
      for (final t in settings.starredWords(widget.course.id)) ?_byTarget[t],
    ];

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
                IconButton(
                  tooltip: l.t('vocab_practice_all'),
                  onPressed: () => _toggleAll(searching ? hits : all, true),
                  icon: const Icon(Icons.done_all_rounded),
                  color: DuoColors.blue,
                ),
                IconButton(
                  tooltip: l.t('vocab_practice_none'),
                  onPressed: selectedCount == 0
                      ? null
                      : () => setState(_selected.clear),
                  icon: const Icon(Icons.remove_done_rounded),
                ),
              ],
            ),
          ),
          Expanded(
            // Hanya baris yang terlihat yang dibangun (builder/sliver).
            child: searching
                ? (hits.isEmpty
                      ? ListView(
                          padding: const EdgeInsets.symmetric(vertical: 40),
                          children: [
                            Text(
                              l.t('vocab_search_empty'),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                          ],
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                          itemCount: hits.length,
                          itemBuilder: (_, i) => _wordTile(hits[i]),
                        ))
                : CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                        sliver: SliverMainAxisGroup(
                          slivers: [
                            if (starred.isNotEmpty)
                              _cardSliver(
                                title: '⭐ ${l.t('vocab_starred')}',
                                words: starred,
                                rows: starred,
                                open: _starredOpen,
                                onTap: () => setState(
                                  () => _starredOpen = !_starredOpen,
                                ),
                              ),
                            for (var i = 0; i < _groups.length; i++)
                              _topicSliver(i, l),
                          ],
                        ),
                      ),
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
                  // Saat memutar cukup ikon suara (tanpa kata yang dibaca).
                  child: _playing == null
                      ? Text(
                          '$selectedCount ${l.t('vocab_practice_selected')}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                          ),
                        )
                      : const Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.volume_up_rounded,
                            color: DuoColors.blue,
                            size: 26,
                          ),
                        ),
                ),
                // Ketuk → daftar kecepatan muncul ke atas, pilih langsung.
                PopupMenuButton<double>(
                  tooltip: l.t('vocab_practice_speed'),
                  initialValue: _speeds.firstWhere(
                    (s) => (s - settings.playSpeed).abs() < 0.001,
                    orElse: () => 1.0,
                  ),
                  position: PopupMenuPosition.over,
                  offset: Offset(0, -32.0 * _speeds.length - 20),
                  constraints: const BoxConstraints(minWidth: 72, maxWidth: 88),
                  menuPadding: const EdgeInsets.symmetric(vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onSelected: settings.setPlaySpeed,
                  itemBuilder: (_) => [
                    for (final s in _speeds.reversed)
                      PopupMenuItem(
                        value: s,
                        height: 32,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 18,
                              child: (s - settings.playSpeed).abs() < 0.001
                                  ? const Icon(
                                      Icons.check_rounded,
                                      size: 14,
                                      color: DuoColors.blue,
                                    )
                                  : null,
                            ),
                            Text(
                              _speedLabel(s),
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _speedLabel(settings.playSpeed),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: DuoColors.blue,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_drop_up_rounded,
                          size: 20,
                          color: DuoColors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  tooltip: l.t(
                    _loop ? 'vocab_practice_loop_off' : 'vocab_practice_loop',
                  ),
                  isSelected: _loop,
                  onPressed: () => setState(() => _loop = !_loop),
                  icon: const Icon(Icons.repeat_rounded),
                  selectedIcon: const Icon(
                    Icons.repeat_on_rounded,
                    color: DuoColors.blue,
                  ),
                ),
                IconButton.filledTonal(
                  tooltip: l.t(
                    _playing == null
                        ? 'vocab_practice_play'
                        : 'vocab_practice_stop',
                  ),
                  onPressed: _playing != null
                      ? _stopPlay
                      : (selectedCount == 0 ? null : () => _play(all)),
                  icon: Icon(
                    _playing == null
                        ? Icons.play_arrow_rounded
                        : Icons.stop_rounded,
                    color: selectedCount == 0 && _playing == null
                        ? null
                        : DuoColors.blue,
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 120,
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

  /// Satu topik sebagai kartu: judul (buka/tutup + centang semua) dan,
  /// bila terbuka, daftar kata yang dibangun malas per baris.
  Widget _topicSliver(int index, L l) {
    final (:topic, :words, :rows) = _groups[index];
    final open = _expanded.contains(index);
    return _cardSliver(
      title: '${topic.emoji} ${topic.title[l.code] ?? ''}',
      words: words,
      rows: rows,
      open: open,
      onTap: () =>
          setState(() => open ? _expanded.remove(index) : _expanded.add(index)),
    );
  }

  /// Kartu berisi judul (buka/tutup + centang semua) dan daftar kata.
  Widget _cardSliver({
    required String title,
    required List<_Word> words,
    required List<Object> rows,
    required bool open,
    required VoidCallback onTap,
  }) {
    final picked = words.where((w) => _selected.contains(w.key)).length;
    final card = Theme.of(context).cardTheme;
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 8),
      sliver: DecoratedSliver(
        decoration: ShapeDecoration(
          color: card.color,
          shape: card.shape ?? const RoundedRectangleBorder(),
        ),
        sliver: SliverMainAxisGroup(
          slivers: [
            SliverToBoxAdapter(
              child: Material(
                type: MaterialType.transparency,
                child: ListTile(
                  shape: card.shape,
                  onTap: onTap,
                  leading: Checkbox(
                    tristate: true,
                    value: picked == 0
                        ? false
                        : (picked == words.length ? true : null),
                    activeColor: DuoColors.blue,
                    onChanged: (_) => _toggleAll(words, picked < words.length),
                  ),
                  title: Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                  subtitle: Text('$picked/${words.length}'),
                  trailing: AnimatedRotation(
                    turns: open ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(Icons.expand_more_rounded),
                  ),
                ),
              ),
            ),
            if (open)
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 8),
                sliver: SliverList.builder(
                  itemCount: rows.length,
                  itemBuilder: (_, i) => switch (rows[i]) {
                    final _Section s => _sectionHeader(s),
                    final r => _wordTile(r as _Word),
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// Pembatas bagian: judul + centang semua kata di bagian itu. Tetap
  /// tampil apa pun kata yang sedang dipilih.
  Widget _sectionHeader(_Section s) {
    final picked = s.words.where((w) => _selected.contains(w.key)).length;
    final hint = Theme.of(context).hintColor;
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 12, 0),
      child: Row(
        children: [
          Checkbox(
            tristate: true,
            value: picked == 0
                ? false
                : (picked == s.words.length ? true : null),
            activeColor: DuoColors.blue,
            visualDensity: VisualDensity.compact,
            onChanged: (_) => _toggleAll(s.words, picked < s.words.length),
          ),
          Text(
            s.title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w900,
              color: DuoColors.blue,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(child: Divider(color: hint.withValues(alpha: 0.3))),
          const SizedBox(width: 8),
          Text(
            '$picked/${s.words.length}',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: hint,
            ),
          ),
        ],
      ),
    );
  }

  Widget _wordTile(_Word w) {
    final romaji = w.example.romaji;
    // Material transparan: tinta & warna sorot tergambar di atas kartu.
    return Material(
      type: MaterialType.transparency,
      child: CheckboxListTile(
        dense: true,
        value: _selected.contains(w.key),
        activeColor: DuoColors.blue,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (_) => _toggle(w),
        tileColor: _isPlaying(w)
            ? DuoColors.blue.withValues(alpha: 0.12)
            : null,
        secondary: _isPlaying(w)
            ? const Icon(Icons.graphic_eq_rounded, color: DuoColors.blue)
            : null,
        title: Text(
          w.example.target,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
        ),
        subtitle: Text(
          romaji == null ? w.item.romaji : '$romaji · ${w.item.romaji}',
        ),
      ),
    );
  }
}
