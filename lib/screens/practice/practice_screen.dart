import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../providers/progress_provider.dart';
import '../../theme.dart';
import '../lesson/lesson_screen.dart';
import 'flashcards_screen.dart';
import 'letter_quiz_screen.dart';
import 'memory_match_screen.dart';
import 'time_challenge_screen.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final progress = context.watch<ProgressProvider>();
    final courses = context.read<List<Course>>();
    final course = courses.firstWhere(
      (c) => c.id == progress.activeCourseId,
      orElse: () => courses.first,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: Text(l.t('practice_title'))),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 110),
        children: [
          _GameCard(
            emoji: '🃏',
            color: DuoColors.blue,
            title: l.t('flashcards'),
            subtitle: l.t('flashcards_desc'),
            onTap: () => _push(context, FlashcardsScreen(course: course)),
          ),
          _GameCard(
            emoji: '🧩',
            color: DuoColors.purple,
            title: l.t('memory_game'),
            subtitle: l.t('memory_desc'),
            trailing: progress.bestMemoryMoves > 0
                ? '${l.t('best')}: ${progress.bestMemoryMoves} ${l.t('moves').toLowerCase()}'
                : null,
            onTap: () => _push(context, MemoryMatchScreen(course: course)),
          ),
          _GameCard(
            emoji: '🔤',
            color: DuoColors.red,
            title: l.t('letter_quiz'),
            subtitle: l.t('letter_quiz_desc'),
            onTap: () => _push(context, LetterQuizScreen(course: course)),
          ),
          _GameCard(
            emoji: '⏱️',
            color: DuoColors.orange,
            title: l.t('time_challenge'),
            subtitle: l.t('time_desc'),
            trailing: progress.bestTimeChallenge > 0
                ? '${l.t('best')}: ${progress.bestTimeChallenge}'
                : null,
            onTap: () => _push(context, TimeChallengeScreen(course: course)),
          ),
          _GameCard(
            emoji: '💪',
            color: DuoColors.green,
            title: l.t('free_practice'),
            subtitle: l.t('free_practice_desc'),
            onTap: () => _push(context, LessonScreen(course: course)),
          ),
        ],
      ),
    );
  }

  void _push(BuildContext context, Widget screen) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => screen));
  }
}

class _GameCard extends StatelessWidget {
  final String emoji;
  final Color color;
  final String title;
  final String subtitle;
  final String? trailing;
  final VoidCallback onTap;

  const _GameCard({
    required this.emoji,
    required this.color,
    required this.title,
    required this.subtitle,
    this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child:
                      Text(emoji, style: const TextStyle(fontSize: 28)),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 2),
                    Text(subtitle,
                        style: TextStyle(
                            fontSize: 13,
                            color: Theme.of(context).hintColor)),
                    if (trailing != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          trailing!,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: color,
                          ),
                        ),
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
