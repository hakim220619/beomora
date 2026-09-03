import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_strings.dart';
import '../../models/achievement.dart';
import '../../providers/auth_provider.dart';
import '../../providers/progress_provider.dart';
import '../../theme.dart';
import '../../widgets/duo_dialog.dart';
import '../../widgets/google_sign_in_button.dart';
import '../../widgets/study/pencil_progress_bar.dart';
import '../leaderboard_screen.dart';
import '../premium_screen.dart';
import '../profile/achievements_screen.dart';
import '../settings_screen.dart';
import '../shop_screen.dart';

/// Kampus: akun (login Google), level & statistik, dan pintu menuju
/// Papan Juara, Koperasi Sekolah, Piagam, serta Pengaturan.
class CabinScreen extends StatelessWidget {
  const CabinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final progress = context.watch<ProgressProvider>();
    final auth = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: Text(l.t('cabin_title'))),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 110),
        children: [
          _AccountCard(auth: auth),
          const SizedBox(height: 14),
          // Level sang kapten
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text(
                    '${l.t('level')} ${progress.level}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        color: DuoColors.green),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: PencilProgressBar(
                      value: progress.xpIntoLevel / 100,
                      height: 14,
                      color: DuoColors.green,
                      showPencil: true,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '${progress.xpIntoLevel}/100',
                    style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).hintColor),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(l.t('stats'),
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w900)),
          const SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2.4,
            children: [
              _StatTile(
                  icon: '⚡',
                  label: l.t('total_xp'),
                  value: '${progress.xp}'),
              _StatTile(
                  icon: '🔥',
                  label: l.t('longest_streak'),
                  value: '${progress.longestStreak}'),
              _StatTile(
                  icon: '🗣️',
                  label: l.t('words_learned'),
                  value: '${progress.wordsMasteredCount}'),
              _StatTile(
                  icon: '📗',
                  label: l.t('lessons_done'),
                  value: '${progress.totalLessonsDone}'),
              _StatTile(
                  icon: '🎯',
                  label: l.t('accuracy_label'),
                  value: '${(progress.accuracy * 100).round()}%'),
              _StatTile(
                  icon: '⏱️',
                  label: l.t('time_challenge'),
                  value: '${progress.bestTimeChallenge}'),
            ],
          ),
          const SizedBox(height: 18),
          // Pintu-pintu kabin
          _CabinDoor(
            emoji: '👑',
            color: DuoColors.purple,
            title: l.t('premium_title'),
            subtitle: auth.isPremium
                ? l.t('premium_active')
                : l.t('premium_banner_sub'),
            onTap: () => _push(context, const PremiumScreen()),
          ),
          _CabinDoor(
            emoji: '🏆',
            color: DuoColors.yellow,
            title: l.t('leaderboard_title'),
            subtitle: '${progress.weeklyXp} ${l.t('weekly_xp')}',
            onTap: () => _push(context, const LeaderboardScreen()),
          ),
          _CabinDoor(
            emoji: '🪙',
            color: DuoColors.blue,
            title: l.t('shop_title'),
            subtitle: '${progress.gems} ${l.t('gems')}',
            onTap: () => _push(context, const ShopScreen()),
          ),
          _CabinDoor(
            emoji: '🏅',
            color: DuoColors.purple,
            title: l.t('achievements'),
            subtitle:
                '${progress.unlockedAchievements.length}/${kAchievements.length}',
            onTap: () => _push(context, const AchievementsScreen()),
          ),
          _CabinDoor(
            emoji: '⚙️',
            color: DuoColors.gray,
            title: l.t('settings_title'),
            subtitle: l.t('theme'),
            onTap: () => _push(context, const SettingsScreen()),
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

/// Kartu akun: tamu diajak login Google; yang sudah masuk melihat
/// foto, nama, email, dan tombol keluar.
class _AccountCard extends StatelessWidget {
  final AuthProvider auth;
  const _AccountCard({required this.auth});

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: auth.signedIn
            ? Row(
                children: [
                  _Porthole(
                    child: auth.photoUrl != null
                        ? ClipOval(
                            child: Image.network(
                              auth.photoUrl!,
                              width: 56,
                              height: 56,
                              fit: BoxFit.cover,
                              errorBuilder: (_, _, _) => const Center(
                                  child: Text('🐝',
                                      style: TextStyle(fontSize: 30))),
                            ),
                          )
                        : const Center(
                            child: Text('🐝',
                                style: TextStyle(fontSize: 30))),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          auth.name ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          auth.email ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 13,
                              color: Theme.of(context).hintColor),
                        ),
                        Text(
                          l.t('learner'),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: DuoColors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    tooltip: l.t('sign_out'),
                    icon: const Icon(Icons.logout_rounded,
                        color: DuoColors.red),
                    onPressed: () async {
                      final messenger = ScaffoldMessenger.of(context);
                      final confirmed = await showDuoConfirm(
                        context,
                        emoji: '👋',
                        color: DuoColors.red,
                        title: l.t('logout_title'),
                        message: l.t('logout_msg'),
                        confirmLabel: l.t('logout_confirm'),
                        cancelLabel: l.t('cancel'),
                      );
                      if (!confirmed) return;
                      await auth.signOut();
                      messenger
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                            content: Text(l.t('signed_out_msg'))));
                    },
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const _Porthole(
                        child: Center(
                            child: Text('🐝',
                                style: TextStyle(fontSize: 30))),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l.t('guest'),
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              l.t('guest_hint'),
                              style: TextStyle(
                                  fontSize: 12.5,
                                  color: Theme.of(context).hintColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  // Alur login lengkap (termasuk arah ke pendaftaran)
                  // ada di dalam widget tombol ini.
                  const GoogleSignInButton(),
                ],
              ),
      ),
    );
  }
}

/// Bingkai foto kartu pelajar untuk avatar.
class _Porthole extends StatelessWidget {
  final Widget child;
  const _Porthole({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: DuoColors.blue.withValues(alpha: 0.18),
        border: Border.all(color: DuoColors.yellow, width: 3.5),
        boxShadow: [
          BoxShadow(
            color: DuoColors.yellow.withValues(alpha: 0.35),
            blurRadius: 10,
          ),
        ],
      ),
      child: child,
    );
  }
}

class _StatTile extends StatelessWidget {
  final String icon;
  final String label;
  final String value;

  const _StatTile(
      {required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.08)
            : Colors.white.withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? const Color(0x40FFFFFF) : Colors.white,
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Text(icon, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w900)),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 11,
                      color: Theme.of(context).hintColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Pintu menu di dalam kampus.
class _CabinDoor extends StatelessWidget {
  final String emoji;
  final Color color;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _CabinDoor({
    required this.emoji,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                      color: color.withValues(alpha: 0.6), width: 1.5),
                ),
                alignment: Alignment.center,
                child:
                    Text(emoji, style: const TextStyle(fontSize: 24)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 15.5,
                            fontWeight: FontWeight.w900)),
                    Text(subtitle,
                        style: TextStyle(
                            fontSize: 12.5,
                            color: Theme.of(context).hintColor)),
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
