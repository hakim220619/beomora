import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../data/de_phrases.dart';
import '../../data/en_exam_vocab.dart';
import '../../data/goethe_vocab.dart';
import '../../data/ja_phrases.dart';
import '../../data/jlpt_vocab.dart';
import '../../data/ko_phrases.dart';
import '../../data/study_guides.dart';
import '../../data/topik_vocab.dart';
import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../models/guide.dart';
import '../../providers/progress_provider.dart';
import '../../providers/settings_provider.dart';
import '../../services/tts_service.dart';
import '../../theme.dart';
import '../../widgets/study/study_background.dart';
import '../../widgets/vocab_star_button.dart';
import '../course_select_screen.dart';
import '../practice/vocab_practice_screen.dart';
import 'guide_detail_screen.dart';
import 'vocab_detail_sheet.dart';

/// Tab Materi: daftar referensi belajar lengkap untuk kursus aktif —
/// hiragana/katakana untuk Jepang, grammar dasar untuk Inggris, dst.
class MaterialsScreen extends StatelessWidget {
  const MaterialsScreen({super.key});

  static const _accentCycle = [
    DuoColors.green,
    DuoColors.blue,
    DuoColors.orange,
    DuoColors.purple,
    DuoColors.yellow,
    DuoColors.red,
  ];

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final progress = context.watch<ProgressProvider>();
    final courses = context.read<List<Course>>();
    final course = courses.firstWhere(
      (c) => c.id == progress.activeCourseId,
      orElse: () => courses.first,
    );
    final allTopics = kStudyGuides[course.id] ?? const [];
    // Topik kosakata tematik dikelompokkan di balik satu kartu.
    final topics = allTopics.where((t) => !t.id.contains('vocab')).toList();
    // Jepang: Kosakata Pemula Bab 1–25 paling atas, baru JLPT.
    const firstIds = {'vocab_chapters'};
    final vocabTopics = [
      ...allTopics.where((t) => firstIds.contains(t.id)),
      // Kosakata ujian tampil di depan: JLPT (N5/N4/N3) untuk kursus
      // Jepang, Akademik/IELTS/TOEIC untuk kursus Inggris.
      if (course.id == 'ja') ..._jlptVocabTopics(),
      if (course.id == 'en') ..._englishExamVocabTopics(),
      if (course.id == 'ko') ..._koreanVocabTopics(),
      if (course.id == 'de') ..._germanVocabTopics(),
      ...allTopics.where(
        (t) => t.id.contains('vocab') && !firstIds.contains(t.id),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(l.t('materials_title')),
        actions: [
          // Bendera kursus aktif — ketuk untuk ganti kursus.
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const CourseSelectScreen()),
            ),
            icon: Text(course.flag, style: const TextStyle(fontSize: 24)),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 110),
        children: [
          Text(
            '${course.name[l.code]} — ${l.t('materials_sub')}',
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).hintColor),
          ),
          const SizedBox(height: 14),
          for (var i = 0; i < topics.length; i++)
            _TopicCard(
              topic: topics[i],
              color: _accentCycle[i % _accentCycle.length],
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => GuideDetailScreen(
                    course: course,
                    topic: topics[i],
                    ttsLocale: course.ttsLocale,
                  ),
                ),
              ),
            ),
          if (vocabTopics.isNotEmpty)
            _TopicCard(
              topic: GuideTopic(
                id: 'vocab_group',
                emoji: '🗒️',
                title: {
                  'id': l.t('materials_vocab_title'),
                  'en': l.t('materials_vocab_title'),
                },
                subtitle: {
                  'id': l.t('materials_vocab_sub'),
                  'en': l.t('materials_vocab_sub'),
                },
                sections: const [],
              ),
              color: _accentCycle[topics.length % _accentCycle.length],
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) =>
                      _VocabListScreen(course: course, topics: vocabTopics),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Daftar topik kosakata tematik (pertanian, kelautan, kantoran, dst.)
/// di balik kartu "Kosakata" pada tab Materi.
class _VocabListScreen extends StatefulWidget {
  final Course course;
  final List<GuideTopic> topics;

  const _VocabListScreen({required this.course, required this.topics});

  @override
  State<_VocabListScreen> createState() => _VocabListScreenState();
}

/// Satu kata hasil pencarian beserta topik asalnya.
class _VocabHit {
  final GuideTopic topic;
  final GuideExample word;
  const _VocabHit(this.topic, this.word);
}

class _VocabListScreenState extends State<_VocabListScreen> {
  final _searchCtrl = TextEditingController();
  String _query = '';
  late final String _hintKey = vocabSearchHintKey(
    widget.course.id,
    hasReading: widget.topics.any(
      (t) => t.sections.any((s) => s.examples.any((e) => e.romaji != null)),
    ),
  );

  @override
  void dispose() {
    _searchCtrl.dispose();
    TtsService.instance.stop();
    super.dispose();
  }

  /// Cari di semua topik kosakata: kata target, romaji, atau arti
  /// (bahasa UI aktif). Dibatasi 60 hasil agar tetap ringan.
  List<_VocabHit> _search(String q, String uiLang) {
    final needle = q.trim().toLowerCase();
    if (needle.isEmpty) return const [];
    final hits = <_VocabHit>[];
    for (final topic in widget.topics) {
      for (final section in topic.sections) {
        for (final w in section.examples) {
          final meaning = (w.meaning[uiLang] ?? w.meaning.values.first)
              .toLowerCase();
          if (w.target.toLowerCase().contains(needle) ||
              (w.romaji?.toLowerCase().contains(needle) ?? false) ||
              meaning.contains(needle)) {
            hits.add(_VocabHit(topic, w));
            if (hits.length >= 60) return hits;
          }
        }
      }
    }
    return hits;
  }

  /// Kata berbintang dari semua topik kosakata, urut saat ditandai.
  List<_VocabHit> _starred(SettingsProvider settings) {
    final byTarget = <String, _VocabHit>{};
    for (final topic in widget.topics) {
      for (final section in topic.sections) {
        for (final w in section.examples) {
          byTarget.putIfAbsent(w.target, () => _VocabHit(topic, w));
        }
      }
    }
    return [
      for (final t in settings.starredWords(widget.course.id)) ?byTarget[t],
    ];
  }

  Widget _hitRow(BuildContext context, _VocabHit h, String uiLang) =>
      _VocabHitRow(
        hit: h,
        uiLang: uiLang,
        onSpeak: () => _speak(h.word.target),
        star: isVocabSentence(h.word)
            ? null
            : VocabStarButton(courseId: widget.course.id, word: h.word.target),
        onTap: isVocabSentence(h.word)
            ? null
            : () => showVocabDetail(
                context,
                courseId: widget.course.id,
                ttsLocale: widget.course.ttsLocale,
                word: h.word,
                topic: h.topic,
              ),
      );

  void _speak(String text) {
    HapticFeedback.selectionClick();
    TtsService.instance.speak(text, widget.course.ttsLocale);
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final course = widget.course;
    final topics = widget.topics;
    final searching = _query.trim().isNotEmpty;
    final hits = searching ? _search(_query, l.code) : const <_VocabHit>[];
    final starred = searching
        ? const <_VocabHit>[]
        : _starred(context.watch<SettingsProvider>());

    return StudyScaffold(
      appBar: AppBar(
        title: Text('${l.t('materials_vocab_title')} ${course.flag}'),
      ),
      floatingActionButton: vocabPracticeFab(context, course, topics),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 96),
        children: [
          TextField(
            controller: _searchCtrl,
            onChanged: (v) => setState(() => _query = v),
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: l.t(_hintKey),
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
                borderSide: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: DuoColors.blue, width: 2),
              ),
            ),
          ),
          const SizedBox(height: 12),
          if (starred.isNotEmpty)
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Theme(
                // Tanpa garis pembatas bawaan ExpansionTile.
                data: Theme.of(
                  context,
                ).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  maintainState: true,
                  tilePadding: const EdgeInsets.symmetric(horizontal: 16),
                  childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  title: Text(
                    '⭐ ${l.t('vocab_starred')}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      VocabStarClearButton(
                        courseId: course.id,
                        words: [for (final h in starred) h.word.target],
                      ),
                      const Icon(Icons.expand_more_rounded),
                    ],
                  ),
                  subtitle: Text(
                    '${starred.length} ${l.t('vocab_practice_selected')}',
                    style: TextStyle(
                      fontSize: 12.5,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  children: [
                    for (final h in starred) _hitRow(context, h, l.code),
                  ],
                ),
              ),
            ),
          if (!searching)
            for (var i = 0; i < topics.length; i++)
              _TopicCard(
                topic: topics[i],
                color: MaterialsScreen
                    ._accentCycle[i % MaterialsScreen._accentCycle.length],
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => GuideDetailScreen(
                      course: course,
                      topic: topics[i],
                      ttsLocale: course.ttsLocale,
                    ),
                  ),
                ),
              )
          else if (hits.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  const Text('🔍', style: TextStyle(fontSize: 40)),
                  const SizedBox(height: 10),
                  Text(
                    l.t('vocab_search_empty'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ],
              ),
            )
          else ...[
            Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 4),
              child: Text(
                '${hits.length} ${l.t('vocab_search_count')}',
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
            for (final h in hits) _hitRow(context, h, l.code),
          ],
        ],
      ),
    );
  }
}

/// Baris hasil pencarian: kata, romaji, arti, label topik, tombol dengar.
class _VocabHitRow extends StatelessWidget {
  final _VocabHit hit;
  final String uiLang;
  final VoidCallback onSpeak;
  final VoidCallback? onTap;
  final Widget? star;

  const _VocabHitRow({
    required this.hit,
    required this.uiLang,
    required this.onSpeak,
    this.onTap,
    this.star,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final w = hit.word;
    final row = Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.05) : DuoColors.snow,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? const Color(0x26FFFFFF) : const Color(0xFFEDE6CF),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  w.target,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                if (w.romaji != null)
                  Text(
                    w.romaji!,
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                Text(
                  w.meaning[uiLang] ?? w.meaning.values.first,
                  style: TextStyle(
                    fontSize: 12.5,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${hit.topic.emoji} ${hit.topic.title[uiLang] ?? ''}',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: DuoColors.blue.withValues(alpha: 0.9),
                  ),
                ),
              ],
            ),
          ),
          ?star,
          IconButton(
            tooltip: hit.word.target,
            icon: const Icon(Icons.volume_up_rounded, color: DuoColors.blue),
            onPressed: onSpeak,
          ),
        ],
      ),
    );
    if (onTap == null) return row;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: row,
    );
  }
}

/// Topik kosakata ujian: daftar kata dipecah menjadi bagian ±16 kata
/// agar mudah dibaca. Dengan [groups] (indeks tema per kata) +
/// [groupTitles], tiap bagian berisi satu tema dan berjudul nama tema;
/// tema panjang dibagi rata, mis. "Kata kerja (1)", "Kata kerja (2)".
GuideTopic _examVocabTopic({
  required String id,
  required String emoji,
  required String title,
  String? titleEn,
  required List<GuideExample> words,
  required Map<String, String> subtitle,
  List<int>? groups,
  List<Map<String, String>>? groupTitles,
}) {
  const chunk = 16;
  final sections = <GuideSection>[];
  if (groups != null && groupTitles != null) {
    var start = 0;
    while (start < words.length) {
      var end = start;
      while (end < words.length && groups[end] == groups[start]) {
        end++;
      }
      final t = groupTitles[groups[start]];
      final n = end - start;
      final parts = (n / chunk).ceil();
      for (var p = 0; p < parts; p++) {
        final from = start + (n * p / parts).round();
        final to = start + (n * (p + 1) / parts).round();
        sections.add(
          GuideSection(
            title: {
              for (final lang in t.keys)
                lang: parts == 1 ? t[lang]! : '${t[lang]} (${p + 1})',
            },
            examples: words.sublist(from, to),
          ),
        );
      }
      start = end;
    }
    return GuideTopic(
      id: id,
      emoji: emoji,
      title: {'id': title, 'en': titleEn ?? title},
      subtitle: subtitle,
      sections: sections,
    );
  }
  for (var i = 0; i < words.length; i += chunk) {
    sections.add(
      GuideSection(
        title: {
          'id': 'Bagian ${sections.length + 1}',
          'en': 'Part ${sections.length + 1}',
        },
        examples: words.sublist(i, (i + chunk).clamp(0, words.length)),
      ),
    );
  }
  return GuideTopic(
    id: id,
    emoji: emoji,
    title: {'id': title, 'en': titleEn ?? title},
    subtitle: subtitle,
    sections: sections,
  );
}

/// Topik kosakata kursus Jerman: ungkapan (sehari-hari, kerja, partikel,
/// idiom — [dePhraseVocab] dst.), lalu kosakata inti Goethe A1–A2.
List<GuideTopic> _germanVocabTopics() {
  GuideTopic phrases(
    String id,
    String emoji,
    String titleId,
    String titleEn,
    String unitId,
    String unitEn,
    List<JVocab> v,
    List<Map<String, String>> groupTitles,
  ) => _examVocabTopic(
    id: id,
    emoji: emoji,
    title: titleId,
    titleEn: titleEn,
    words: [
      for (final w in v) GuideExample(w.kana, w.meaning, romaji: w.romaji),
    ],
    groups: [for (final w in v) w.group],
    groupTitles: groupTitles,
    subtitle: {
      'id': '${v.length} $unitId, ketuk untuk dengar',
      'en': '${v.length} $unitEn, tap to listen',
    },
  );

  return [
    phrases(
      'de_vocab_phrases',
      '💬',
      'Ungkapan Sehari-hari',
      'Everyday Expressions',
      'ungkapan',
      'expressions',
      dePhraseVocab,
      dePhraseVocabGroups,
    ),
    phrases(
      'de_vocab_work',
      '💼',
      'Ungkapan Kerja & Pflege',
      'Work & Nursing Phrases',
      'ungkapan kerja',
      'workplace phrases',
      deWorkVocab,
      deWorkVocabGroups,
    ),
    phrases(
      'de_vocab_particles',
      '🗣️',
      'Partikel & Pengisi Obrolan',
      'Particles & Fillers',
      'partikel & pengisi',
      'particles & fillers',
      deParticleVocab,
      deParticleVocabGroups,
    ),
    phrases(
      'de_vocab_idiom',
      '🎭',
      'Idiom & Peribahasa',
      'Idioms & Proverbs',
      'idiom & peribahasa',
      'idioms & proverbs',
      deIdiomVocab,
      deIdiomVocabGroups,
    ),
    _germanCoreVocabTopic(),
  ];
}

/// Kosakata inti Jerman (Goethe A1/A2) dari [goetheVocab], per tema.
GuideTopic _germanCoreVocabTopic() => _examVocabTopic(
  id: 'de_vocab_goethe',
  emoji: '🇩🇪',
  title: 'Kosakata Inti A1–A2',
  titleEn: 'A1–A2 Core Vocabulary',
  words: [
    for (final w in goetheVocab)
      GuideExample(w.kana, w.meaning, romaji: w.romaji),
  ],
  groups: [for (final w in goetheVocab) w.group],
  groupTitles: goetheVocabGroups,
  subtitle: {
    'id': '${goetheVocab.length} kosakata standar Goethe, ketuk untuk dengar',
    'en': '${goetheVocab.length} standard Goethe words, tap to listen',
  },
);

/// Topik kosakata kursus Korea: ungkapan (sehari-hari, kerja & EPS,
/// onomatope & tanggapan, idiom & peribahasa — [koPhraseVocab] dst.),
/// lalu kosakata inti TOPIK I.
List<GuideTopic> _koreanVocabTopics() {
  GuideTopic phrases(
    String id,
    String emoji,
    String titleId,
    String titleEn,
    String unitId,
    String unitEn,
    List<JVocab> v,
    List<Map<String, String>> groupTitles,
  ) => _examVocabTopic(
    id: id,
    emoji: emoji,
    title: titleId,
    titleEn: titleEn,
    words: [
      for (final w in v) GuideExample(w.kana, w.meaning, romaji: w.romaji),
    ],
    groups: [for (final w in v) w.group],
    groupTitles: groupTitles,
    subtitle: {
      'id': '${v.length} $unitId, ketuk untuk dengar',
      'en': '${v.length} $unitEn, tap to listen',
    },
  );

  return [
    phrases(
      'ko_vocab_phrases',
      '💬',
      'Ungkapan Sehari-hari',
      'Everyday Expressions',
      'ungkapan',
      'expressions',
      koPhraseVocab,
      koPhraseVocabGroups,
    ),
    phrases(
      'ko_vocab_work',
      '🏭',
      'Ungkapan Kerja & EPS',
      'Workplace & EPS Phrases',
      'ungkapan kerja',
      'workplace phrases',
      koWorkVocab,
      koWorkVocabGroups,
    ),
    phrases(
      'ko_vocab_onomatope',
      '🎵',
      'Onomatope & Tanggapan',
      'Onomatopoeia & Responses',
      'onomatope & tanggapan',
      'onomatopoeia & responses',
      koOnomatopeVocab,
      koOnomatopeVocabGroups,
    ),
    phrases(
      'ko_vocab_idiom',
      '🎭',
      'Idiom & Peribahasa',
      'Idioms & Proverbs',
      'idiom & peribahasa',
      'idioms & proverbs',
      koIdiomVocab,
      koIdiomVocabGroups,
    ),
    _koreanCoreVocabTopic(),
  ];
}

/// Kosakata inti Korea (TOPIK I / EPS-TOPIK) dari [topikVocab], dibagi
/// per tema.
GuideTopic _koreanCoreVocabTopic() => _examVocabTopic(
  id: 'ko_vocab_topik',
  emoji: '🇰🇷',
  title: 'Kosakata Inti TOPIK I',
  titleEn: 'TOPIK I Core Vocabulary',
  words: [
    for (final w in topikVocab)
      GuideExample(w.kana, w.meaning, romaji: w.romaji),
  ],
  groups: [for (final w in topikVocab) w.group],
  groupTitles: topikVocabGroups,
  subtitle: {
    'id': '${topikVocab.length} kosakata standar, ketuk untuk dengar',
    'en': '${topikVocab.length} standard words, tap to listen',
  },
);

/// Topik kosakata kursus Jepang: ungkapan (sehari-hari, aizuchi, kerja &
/// keigo, onomatope, idiom & peribahasa — [jaPhraseVocab] dst.), lalu
/// kosakata JLPT (N5/N4/N3) dari [jlptN5] dst.
List<GuideTopic> _jlptVocabTopics() {
  GuideTopic build(
    String id,
    String emoji,
    String level,
    List<JVocab> v,
    List<Map<String, String>> groupTitles,
  ) => _examVocabTopic(
    id: id,
    emoji: emoji,
    title: 'JLPT $level',
    words: [
      for (final w in v) GuideExample(w.kana, w.meaning, romaji: w.romaji),
    ],
    groups: [for (final w in v) w.group],
    groupTitles: groupTitles,
    subtitle: {
      'id': '${v.length} kosakata $level, ketuk untuk dengar',
      'en': '${v.length} $level words, tap to listen',
    },
  );

  GuideTopic phrases(
    String id,
    String emoji,
    String titleId,
    String titleEn,
    String unitId,
    String unitEn,
    List<JVocab> v,
    List<Map<String, String>> groupTitles,
  ) => _examVocabTopic(
    id: id,
    emoji: emoji,
    title: titleId,
    titleEn: titleEn,
    words: [
      for (final w in v) GuideExample(w.kana, w.meaning, romaji: w.romaji),
    ],
    groups: [for (final w in v) w.group],
    groupTitles: groupTitles,
    subtitle: {
      'id': '${v.length} $unitId, ketuk untuk dengar',
      'en': '${v.length} $unitEn, tap to listen',
    },
  );

  return [
    phrases(
      'ja_vocab_phrases',
      '💬',
      'Ungkapan Sehari-hari',
      'Everyday Expressions',
      'ungkapan',
      'expressions',
      jaPhraseVocab,
      jaPhraseVocabGroups,
    ),
    phrases(
      'ja_vocab_aizuchi',
      '🗣️',
      'Aizuchi & Pengisi Obrolan',
      'Aizuchi & Fillers',
      'tanggapan & pengisi',
      'responses & fillers',
      jaAizuchiVocab,
      jaAizuchiVocabGroups,
    ),
    phrases(
      'ja_vocab_work',
      '💼',
      'Ungkapan Kerja & Keigo',
      'Workplace Phrases & Keigo',
      'ungkapan kerja',
      'workplace phrases',
      jaWorkVocab,
      jaWorkVocabGroups,
    ),
    phrases(
      'ja_vocab_onomatope',
      '🎵',
      'Onomatope',
      'Onomatopoeia',
      'onomatope',
      'onomatopoeia',
      jaOnomatopeVocab,
      jaOnomatopeVocabGroups,
    ),
    phrases(
      'ja_vocab_idiom',
      '🎭',
      'Idiom & Peribahasa',
      'Idioms & Proverbs',
      'idiom & peribahasa',
      'idioms & proverbs',
      jaIdiomVocab,
      jaIdiomVocabGroups,
    ),
    build('vocab_jlpt_n5', '🌸', 'N5', jlptN5, jlptN5Groups),
    build('vocab_jlpt_n4', '🍁', 'N4', jlptN4, jlptN4Groups),
    build('vocab_jlpt_n3', '🗻', 'N3', jlptN3, jlptN3Groups),
  ];
}

/// Topik kosakata Inggris: ungkapan percakapan, phrasal verb & idiom
/// (dikelompokkan per situasi/tema), lalu kosakata ujian Akademik
/// (Academic Word List, dipakai TOEFL/IELTS/PTE), IELTS dan TOEIC.
List<GuideTopic> _englishExamVocabTopics() {
  GuideTopic build(
    String id,
    String emoji,
    String exam,
    String focusId,
    String focusEn,
    List<EVocab> v, {
    List<Map<String, String>>? groupTitles,
    String unitId = 'kosakata',
    String unitEn = 'words',
    String? titleEn,
  }) => _examVocabTopic(
    id: id,
    emoji: emoji,
    title: exam,
    titleEn: titleEn,
    words: [for (final w in v) GuideExample(w.word, w.meaning, romaji: w.pron)],
    groups: groupTitles == null ? null : [for (final w in v) w.group],
    groupTitles: groupTitles,
    subtitle: {
      'id': '${v.length} $unitId $focusId, ketuk untuk dengar',
      'en': '${v.length} $focusEn $unitEn, tap to listen',
    },
  );

  return [
    build(
      'en_vocab_phrases',
      '💬',
      'Ungkapan Sehari-hari',
      'percakapan',
      'everyday',
      phraseVocab,
      titleEn: 'Everyday Expressions',
      groupTitles: phraseVocabGroups,
      unitId: 'ungkapan',
      unitEn: 'expressions',
    ),
    build(
      'en_vocab_phrasal',
      '🧩',
      'Phrasal Verb',
      'yang paling sering dipakai',
      'most common',
      phrasalVocab,
      groupTitles: phrasalVocabGroups,
      unitId: 'phrasal verb',
      unitEn: 'phrasal verbs',
    ),
    build(
      'en_vocab_idiom',
      '🎭',
      'Idiom',
      'yang umum dipakai',
      'common',
      idiomVocab,
      groupTitles: idiomVocabGroups,
      unitId: 'idiom',
      unitEn: 'idioms',
    ),
    build(
      'en_vocab_academic',
      '🎓',
      'Akademik (TOEFL · IELTS · PTE)',
      'akademik',
      'academic',
      academicVocab,
    ),
    build(
      'en_vocab_ielts',
      '🌏',
      'IELTS',
      'tema esai & speaking',
      'essay & speaking',
      ieltsVocab,
    ),
    build(
      'en_vocab_toeic',
      '💼',
      'TOEIC',
      'kantor & bisnis',
      'office & business',
      toeicVocab,
    ),
  ];
}

class _TopicCard extends StatelessWidget {
  final GuideTopic topic;
  final Color color;
  final VoidCallback onTap;

  const _TopicCard({
    required this.topic,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: color.withValues(alpha: 0.6),
                    width: 1.5,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(topic.emoji, style: const TextStyle(fontSize: 26)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topic.title[l.code] ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      topic.subtitle[l.code] ?? '',
                      style: TextStyle(
                        fontSize: 12.5,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: Theme.of(context).hintColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
