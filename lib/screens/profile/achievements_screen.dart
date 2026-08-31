import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_strings.dart';
import '../../models/achievement.dart';
import '../../providers/progress_provider.dart';
import '../../theme.dart';
import '../../widgets/study/study_background.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final progress = context.watch<ProgressProvider>();

    return StudyScaffold(
      appBar: AppBar(title: Text(l.t('achievements'))),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: kAchievements.length,
        itemBuilder: (_, i) {
          final ach = kAchievements[i];
          final unlocked =
              progress.unlockedAchievements.contains(ach.id);
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: unlocked
                  ? DuoColors.yellow.withValues(alpha: 0.18)
                  : (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white.withValues(alpha: 0.07)
                      : Colors.white.withValues(alpha: 0.65)),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: unlocked
                    ? DuoColors.yellow
                    : (Theme.of(context).brightness == Brightness.dark
                        ? const Color(0x40FFFFFF)
                        : Colors.white),
                width: unlocked ? 2 : 1.5,
              ),
            ),
            child: Row(
              children: [
                Opacity(
                  opacity: unlocked ? 1 : 0.35,
                  child: Text(ach.emoji,
                      style: const TextStyle(fontSize: 34)),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l.t('ach_${ach.id}'),
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: unlocked
                              ? null
                              : Theme.of(context).hintColor,
                        ),
                      ),
                      Text(
                        l.t('ach_${ach.id}_desc'),
                        style: TextStyle(
                            fontSize: 13,
                            color: Theme.of(context).hintColor),
                      ),
                    ],
                  ),
                ),
                if (unlocked)
                  const Icon(Icons.check_circle_rounded,
                      color: DuoColors.yellow),
              ],
            ),
          );
        },
      ),
    );
  }
}
