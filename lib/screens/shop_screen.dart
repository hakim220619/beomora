import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_strings.dart';
import '../providers/progress_provider.dart';
import '../theme.dart';
import '../widgets/duo_button.dart';
import '../widgets/study/study_background.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  void _snack(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final progress = context.watch<ProgressProvider>();

    return StudyScaffold(
      appBar: AppBar(
        title: Text(l.t('shop_title')),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                '🪙 ${progress.gems}',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: DuoColors.blue),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          _ShopItem(
            emoji: '❤️',
            color: DuoColors.red,
            title: l.t('refill_hearts'),
            subtitle: l.t('refill_hearts_desc'),
            price: 350,
            onBuy: () {
              if (progress.hearts >= ProgressProvider.maxHearts) {
                _snack(context, l.t('hearts_full'));
                return;
              }
              if (!progress.spendGems(350)) {
                _snack(context, l.t('not_enough_gems'));
                return;
              }
              progress.refillHearts();
              _snack(context, l.t('purchased'));
            },
          ),
          _ShopItem(
            emoji: '🧊',
            color: DuoColors.blue,
            title: l.t('streak_freeze'),
            subtitle: l.t('streak_freeze_desc'),
            badge:
                '${l.t('owned_count')}: ${progress.streakFreezes}',
            price: 200,
            onBuy: () {
              if (!progress.spendGems(200)) {
                _snack(context, l.t('not_enough_gems'));
                return;
              }
              progress.addStreakFreeze();
              _snack(context, l.t('purchased'));
            },
          ),
          _ShopItem(
            emoji: '⚡',
            color: DuoColors.yellow,
            title: l.t('double_xp'),
            subtitle: l.t('double_xp_desc'),
            badge: progress.boostActive ? '⚡ ON' : null,
            price: 150,
            onBuy: () {
              if (progress.boostActive) {
                _snack(context, l.t('boost_active'));
                return;
              }
              if (!progress.spendGems(150)) {
                _snack(context, l.t('not_enough_gems'));
                return;
              }
              progress.activateBoost(const Duration(minutes: 15));
              _snack(context, l.t('purchased'));
            },
          ),
        ],
      ),
    );
  }
}

class _ShopItem extends StatelessWidget {
  final String emoji;
  final Color color;
  final String title;
  final String subtitle;
  final String? badge;
  final int price;
  final VoidCallback onBuy;

  const _ShopItem({
    required this.emoji,
    required this.color,
    required this.title,
    required this.subtitle,
    this.badge,
    required this.price,
    required this.onBuy,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                  child: Text(emoji, style: const TextStyle(fontSize: 30))),
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
                  if (badge != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        badge!,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: color),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 110,
              child: DuoButton(
                label: '🪙 $price',
                height: 42,
                color: DuoColors.blue,
                onPressed: onBuy,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
