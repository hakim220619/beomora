import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_strings.dart';
import '../models/course.dart';
import '../providers/progress_provider.dart';
import '../theme.dart';
import '../widgets/study/study_background.dart';

class CourseSelectScreen extends StatelessWidget {
  const CourseSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final courses = context.read<List<Course>>();
    final progress = context.watch<ProgressProvider>();

    return StudyScaffold(
      appBar: AppBar(title: Text(l.t('course_select_title'))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final course in courses)
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading:
                    Text(course.flag, style: const TextStyle(fontSize: 32)),
                title: Text(
                  course.name[l.code] ?? '',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: LinearProgressIndicator(
                    value: course.allLessons.isEmpty
                        ? 0
                        : progress.completedInCourse(course.id) /
                            course.allLessons.length,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(6),
                    color: DuoColors.green,
                    backgroundColor: Theme.of(context)
                        .dividerColor
                        .withValues(alpha: 0.5),
                  ),
                ),
                trailing: progress.activeCourseId == course.id
                    ? const Icon(Icons.check_circle,
                        color: DuoColors.green, size: 28)
                    : null,
                onTap: () {
                  context.read<ProgressProvider>().setActiveCourse(course.id);
                  Navigator.of(context).pop();
                },
              ),
            ),
        ],
      ),
    );
  }
}
