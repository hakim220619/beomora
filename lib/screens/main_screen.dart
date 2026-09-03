import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../l10n/app_strings.dart';
import '../providers/progress_provider.dart';
import '../providers/settings_provider.dart';
import '../services/notification_service.dart';
import '../theme.dart';
import '../widgets/duo_dialog.dart';
import '../widgets/study/study_background.dart';
import 'cabin/cabin_screen.dart';
import 'learn/skill_tree_screen.dart';
import 'materials/materials_screen.dart';
import 'practice/practice_screen.dart';

/// Empat ruang belajar utama: Jalur Belajar, Materi (referensi
/// lengkap: kana, grammar), Ruang Latihan, dan Kampus (akun, papan
/// juara, koperasi, piagam, pengaturan).
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _showStreakNotices());
  }

  /// Pemberitahuan saat menu utama terbuka: (1) notice bolos —
  /// tantangan streak tetap lanjut; (2) perayaan tantangan selesai.
  Future<void> _showStreakNotices() async {
    if (!mounted) return;
    final l = L.read(context);
    final progress = context.read<ProgressProvider>();
    final settings = context.read<SettingsProvider>();

    // Pengingat harian: minta izin notifikasi (Android 13+/iOS) lalu
    // pastikan jadwalnya terpasang. Aman dipanggil tiap kali dibuka.
    if (settings.reminderOn) {
      unawaited(NotificationService.requestPermission()
          .then((_) => NotificationService.sync(settings, progress)));
    }

    if (progress.pendingMissNotice) {
      progress.markMissNoticeShown();
      await showDuoDialog<void>(
        context,
        emoji: '😴',
        color: DuoColors.blue,
        title: l.t('miss_notice_title'),
        message: l
            .t('miss_notice_msg')
            .replaceFirst('{done}', '${progress.goalDaysDone}')
            .replaceFirst('{goal}', '${progress.streakGoalDays}'),
        actions: [DuoDialogAction(label: l.t('ok'), primary: true)],
      );
      if (!mounted) return;
    }

    if (progress.pendingGoalCelebration) {
      final goal = progress.streakGoalDays;
      final got = progress.celebrateStreakGoal();
      if (got == 0) return;
      await showDuoDialog<void>(
        context,
        emoji: '🏆',
        color: DuoColors.yellow,
        title: l
            .t('streak_goal_done_title')
            .replaceFirst('{goal}', '$goal'),
        message: l
            .t('streak_goal_done_msg')
            .replaceFirst('{goal}', '$goal')
            .replaceFirst('{gems}', '$got'),
        actions: [DuoDialogAction(label: l.t('ok'), primary: true)],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return StudyScaffold(
      body: IndexedStack(
        index: _index,
        children: const [
          SkillTreeScreen(),
          MaterialsScreen(),
          PracticeScreen(),
          CabinScreen(),
        ],
      ),
      bottomNavigationBar: _DockNav(
        index: _index,
        onTap: (i) => setState(() => _index = i),
        items: [
          ('📚', l.t('nav_learn'), DuoColors.green),
          ('📖', l.t('nav_materials'), DuoColors.blue),
          ('✏️', l.t('nav_practice'), DuoColors.purple),
          ('🎓', l.t('nav_cabin'), DuoColors.yellow),
        ],
      ),
    );
  }
}

/// Navigasi bawah berbentuk rak alat tulis yang mengapung di atas
/// halaman buku / papan tulis.
class _DockNav extends StatelessWidget {
  final int index;
  final ValueChanged<int> onTap;
  final List<(String, String, Color)> items;

  const _DockNav({
    required this.index,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(24, 0, 24, 10),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        decoration: BoxDecoration(
          color: isDark
              ? const Color(0xE0173A2D)
              : Colors.white.withValues(alpha: 0.90),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: isDark ? const Color(0x40FFFFFF) : Colors.white,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              offset: const Offset(0, 8),
              blurRadius: 20,
            ),
          ],
        ),
        child: Row(
          children: [
            for (var i = 0; i < items.length; i++)
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    HapticFeedback.selectionClick();
                    onTap(i);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 220),
                        curve: Curves.easeOutBack,
                        width: 52,
                        height: 36,
                        decoration: BoxDecoration(
                          color: i == index
                              ? items[i].$3.withValues(alpha: 0.22)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(14),
                          border: i == index
                              ? Border.all(
                                  color: items[i].$3, width: 1.5)
                              : null,
                        ),
                        alignment: Alignment.center,
                        child: AnimatedScale(
                          duration: const Duration(milliseconds: 220),
                          scale: i == index ? 1.15 : 1.0,
                          child: Text(items[i].$1,
                              style: const TextStyle(fontSize: 20)),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        items[i].$2,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: i == index
                              ? FontWeight.w900
                              : FontWeight.w600,
                          color: i == index
                              ? items[i].$3
                              : (isDark
                                  ? Colors.white60
                                  : DuoColors.gray),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
