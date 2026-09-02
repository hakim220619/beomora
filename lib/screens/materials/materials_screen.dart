import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/jlpt_vocab.dart';
import '../../data/study_guides.dart';
import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../models/guide.dart';
import '../../providers/progress_provider.dart';
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
    final topics =
        allTopics.where((t) => !t.id.contains('vocab')).toList();
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
              MaterialPageRoute(
                  builder: (_) => const CourseSelectScreen()),
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
              color:
                  _accentCycle[topics.length % _accentCycle.length],
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => _VocabListScreen(
                    course: course,
                    topics: vocabTopics,
                  ),
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
class _VocabListScreen extends StatelessWidget {
  final Course course;
  final List<GuideTopic> topics;

  const _VocabListScreen({required this.course, required this.topics});

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return StudyScaffold(
      appBar: AppBar(
        title: Text('${l.t('materials_vocab_title')} ${course.flag}'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
        children: [
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
            ),
        ],
      ),
    );
  }
}

/// Bangun topik materi kosakata JLPT (N5/N4/N3) dari [jlptN5] dst.
/// Tiap level dipecah menjadi bagian ±16 kata agar mudah dibaca.
List<GuideTopic> _jlptVocabTopics() {
  GuideTopic build(String id, String emoji, String level,
      List<JVocab> vocab) {
    const chunk = 16;
    final sections = <GuideSection>[];
    for (var i = 0; i < vocab.length; i += chunk) {
      final part = vocab.sublist(i, (i + chunk).clamp(0, vocab.length));
      sections.add(GuideSection(
        title: {
          'id': 'Bagian ${sections.length + 1}',
          'en': 'Part ${sections.length + 1}',
        },
        examples: [
          for (final w in part)
            GuideExample(w.kana, w.meaning, romaji: w.romaji),
        ],
      ));
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
                      color: color.withValues(alpha: 0.6), width: 1.5),
                ),
                alignment: Alignment.center,
                child: Text(topic.emoji,
                    style: const TextStyle(fontSize: 26)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topic.title[l.code] ?? '',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      topic.subtitle[l.code] ?? '',
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
    );
  }
}
