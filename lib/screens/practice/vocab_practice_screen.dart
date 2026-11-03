import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/mcq_packs.dart';
import '../../data/question_bank.dart';
import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../models/guide.dart';
import '../../providers/progress_provider.dart';
import '../../providers/settings_provider.dart';
import '../../services/tts_service.dart';
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
  // Kelipatan kecepatan suara; 1× = laju TTS 0.45 dengan jeda 700 ms.
  static const _speeds = [0.5, 0.75, 1.0, 1.25, 1.5, 2.0];

  static String _speedLabel(double x) =>
      '${x.toStringAsFixed(2).replaceFirst(RegExp(r'\.?0+$'), '')}×';

  /// Kecepatan berikutnya setelah [x] (berputar kembali ke yang terkecil).
  static double _nextSpeed(double x) =>
      _speeds.firstWhere((s) => s > x + 0.001, orElse: () => _speeds.first);

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
  List<({GuideTopic topic, List<_Word> words})> _groups = const [];
  List<_Word> _all = const [];
  String? _hitsQuery;
  List<_Word> _hits = const [];
  late final Set<int> _expanded = {if (widget.topics.length == 1) 0};

  void _ensureWords(String uiLang) {
    if (_wordsLang == uiLang) return;
    _wordsLang = uiLang;
    _groups = [
      for (final t in widget.topics) (topic: t, words: _wordsOf(t, uiLang)),
    ];
    _all = [for (final g in _groups) ...g.words];
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
    _stopPlay();
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
    final settings = context.watch<SettingsProvider>();
    _ensureWords(l.code);
    final all = _all;
    final searching = _query.trim().isNotEmpty;
    final hits = searching
        ? _hitsFor(_query.trim().toLowerCase())
        : const <_Word>[];
    final selectedCount = _selected.length;

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
                  child: Text(
                    _playing == null
                        ? '$selectedCount ${l.t('vocab_practice_selected')}'
                        : '🔊 ${_queue[_playing!].example.target} '
                              '(${_playing! + 1}/${_queue.length})',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: const Size(44, 40),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                  onPressed: () =>
                      settings.setPlaySpeed(_nextSpeed(settings.playSpeed)),
                  child: Tooltip(
                    message: l.t('vocab_practice_speed'),
                    child: Text(
                      _speedLabel(settings.playSpeed),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: DuoColors.blue,
                      ),
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
    final (:topic, :words) = _groups[index];
    final open = _expanded.contains(index);
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
                  onTap: () => setState(
                    () => open ? _expanded.remove(index) : _expanded.add(index),
                  ),
                  leading: Checkbox(
                    tristate: true,
                    value: picked == 0
                        ? false
                        : (picked == words.length ? true : null),
                    activeColor: DuoColors.blue,
                    onChanged: (_) => _toggleAll(words, picked < words.length),
                  ),
                  title: Text(
                    '${topic.emoji} ${topic.title[l.code] ?? ''}',
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
                  itemCount: words.length,
                  itemBuilder: (_, i) => _wordTile(words[i]),
                ),
              ),
          ],
        ),
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
