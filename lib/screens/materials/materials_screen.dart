import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/study_guides.dart';
import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../models/guide.dart';
import '../../providers/progress_provider.dart';
import '../../theme.dart';
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
    final topics = kStudyGuides[course.id] ?? const [];

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
        ],
      ),
    );
  }
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
