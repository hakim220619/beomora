import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../data/jlpt_vocab.dart';
import '../../data/study_guides.dart';
import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../models/guide.dart';
import '../../providers/progress_provider.dart';
import '../../services/tts_service.dart';
import '../../theme.dart';
import '../../widgets/study/study_background.dart';
import '../course_select_screen.dart';
import 'guide_detail_screen.dart';

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
    final vocabTopics = [
      // Kosakata JLPT (N5/N4/N3) tampil di depan untuk kursus Jepang.
      if (course.id == 'ja') ..._jlptVocabTopics(),
      ...allTopics.where((t) => t.id.contains('vocab')),
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

    return StudyScaffold(
      appBar: AppBar(
        title: Text('${l.t('materials_vocab_title')} ${course.flag}'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
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
            for (final h in hits)
              _VocabHitRow(
                hit: h,
                uiLang: l.code,
                onSpeak: () => _speak(h.word.target),
              ),
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

  const _VocabHitRow({
    required this.hit,
    required this.uiLang,
    required this.onSpeak,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final w = hit.word;
    return Container(
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
          IconButton(
            tooltip: hit.word.target,
            icon: const Icon(Icons.volume_up_rounded, color: DuoColors.blue),
            onPressed: onSpeak,
          ),
        ],
      ),
    );
  }
}

/// Bangun topik materi kosakata JLPT (N5/N4/N3) dari [jlptN5] dst.
/// Tiap level dipecah menjadi bagian ±16 kata agar mudah dibaca.
List<GuideTopic> _jlptVocabTopics() {
  GuideTopic build(String id, String emoji, String level, List<JVocab> vocab) {
    const chunk = 16;
    final sections = <GuideSection>[];
    for (var i = 0; i < vocab.length; i += chunk) {
      final part = vocab.sublist(i, (i + chunk).clamp(0, vocab.length));
      sections.add(
        GuideSection(
          title: {
            'id': 'Bagian ${sections.length + 1}',
            'en': 'Part ${sections.length + 1}',
          },
          examples: [
            for (final w in part)
              GuideExample(w.kana, w.meaning, romaji: w.romaji),
          ],
        ),
      );
    }
    return GuideTopic(
      id: id,
      emoji: emoji,
      title: {'id': 'JLPT $level', 'en': 'JLPT $level'},
      subtitle: {
        'id': '${vocab.length} kosakata $level, ketuk untuk dengar',
        'en': '${vocab.length} $level words, tap to listen',
      },
      sections: sections,
    );
  }

  return [
    build('vocab_jlpt_n5', '🌸', 'N5', jlptN5),
    build('vocab_jlpt_n4', '🍁', 'N4', jlptN4),
    build('vocab_jlpt_n3', '🗻', 'N3', jlptN3),
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
