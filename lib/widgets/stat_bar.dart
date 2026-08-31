import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/course.dart';
import '../providers/progress_provider.dart';
import '../screens/course_select_screen.dart';
import '../theme.dart';

/// Bar status: lencana kursus (bendera), streak, koin, nyawa —
/// dikemas dalam chip kertas yang mengapung di atas halaman.
class StatBar extends StatelessWidget implements PreferredSizeWidget {
  const StatBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final progress = context.watch<ProgressProvider>();
    final courses = context.read<List<Course>>();
    final course = courses.firstWhere(
      (c) => c.id == progress.activeCourseId,
      orElse: () => courses.first,
    );

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Kompas kursus: ketuk untuk ganti bahasa.
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_) => const CourseSelectScreen()),
              ),
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.25),
                  border: Border.all(color: DuoColors.yellow, width: 2.5),
                  boxShadow: [
                    BoxShadow(
                      color: DuoColors.yellow.withValues(alpha: 0.35),
                      blurRadius: 10,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(course.flag,
                    style: const TextStyle(fontSize: 22)),
              ),
            ),
            _StatChip(
                icon: '🔥',
                value: '${progress.streak}',
                color: DuoColors.orange),
            _StatChip(
                icon: '🪙',
                value: '${progress.gems}',
                color: DuoColors.blue),
            _StatChip(
                icon: '❤️',
                value: '${progress.hearts}',
                color: DuoColors.red),
          ],
        ),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final String icon;
  final String value;
  final Color color;
  const _StatChip(
      {required this.icon, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.10)
            : Colors.white.withValues(alpha: 0.65),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: isDark ? const Color(0x40FFFFFF) : Colors.white,
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Text(icon, style: const TextStyle(fontSize: 17)),
          const SizedBox(width: 5),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w900,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
