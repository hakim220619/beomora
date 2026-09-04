import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_strings.dart';
import '../providers/auth_provider.dart';
import '../providers/progress_provider.dart';
import '../services/ad_service.dart';
import '../services/purchase_service.dart';
import '../theme.dart';
import '../widgets/ad_banner.dart';
import '../widgets/duo_button.dart';
import '../widgets/study/study_background.dart';
import 'premium_screen.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  void _snack(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _buyGems(BuildContext context, String productId) async {
    final l = L.read(context);
    final purchase = context.read<PurchaseService>();
    final messenger = ScaffoldMessenger.of(context);
    final errorKey = await purchase.buy(productId);
    if (errorKey != null) {
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
          duration: const Duration(seconds: 6),
          content: Text(l.t(errorKey)),
        ));
    }
  }

  Future<void> _watchAdForHeart(BuildContext context) async {
    final l = L.read(context);
    final progress = context.read<ProgressProvider>();
    final messenger = ScaffoldMessenger.of(context);
    if (progress.hearts >= ProgressProvider.maxHearts) {
      _snack(context, l.t('hearts_full'));
      return;
    }
    final shown = await AdService.showRewarded(
        onReward: () => progress.restoreHeart());
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(l.t(shown ? 'ad_reward_heart' : 'ad_not_ready')),
      ));
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final progress = context.watch<ProgressProvider>();
    final isPremium = context.watch<AuthProvider>().isPremium;

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
          // Spanduk Beomora Premium (pengguna gratis).
          if (!isPremium) ...[
            Card(
              margin: const EdgeInsets.only(bottom: 14),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => const PremiumScreen()),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Text('👑', style: TextStyle(fontSize: 34)),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(l.t('premium_title'),
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    color: DuoColors.purple)),
                            Text(l.t('premium_banner_sub'),
                                style: TextStyle(
                                    fontSize: 12.5,
                                    color:
                                        Theme.of(context).hintColor)),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right_rounded,
                          color: DuoColors.purple),
                    ],
                  ),
                ),
              ),
            ),
            // Hati gratis lewat iklan reward.
            if (AdService.supported)
              _ShopItem(
                emoji: '📺',
                color: DuoColors.green,
                title: l.t('free_heart_ad'),
                subtitle: l.t('free_heart_ad_desc'),
                priceLabel: l.t('free_label'),
                onBuy: () => _watchAdForHeart(context),
              ),
          ],
          // Top-up permata (uang asli, via Play Billing).
          _ShopItem(
            emoji: '🪙',
            color: DuoColors.purple,
            title: l.t('gems_pack_small'),
            subtitle: l.t('topup_desc'),
            priceLabel: context
                    .read<PurchaseService>()
                    .priceOf(PurchaseService.gemsSmallId) ??
                l.t('topup_label'),
            onBuy: () =>
                _buyGems(context, PurchaseService.gemsSmallId),
          ),
          _ShopItem(
            emoji: '💰',
            color: DuoColors.orange,
            title: l.t('gems_pack_large'),
            subtitle: l.t('topup_desc'),
            priceLabel: context
                    .read<PurchaseService>()
                    .priceOf(PurchaseService.gemsLargeId) ??
                l.t('topup_label'),
            onBuy: () =>
                _buyGems(context, PurchaseService.gemsLargeId),
          ),
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
          // Banner iklan (pengguna gratis; premium tidak melihatnya).
          const AdBanner(),
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

  /// Harga permata; null kalau memakai [priceLabel] (uang asli/gratis).
  final int? price;
  final String? priceLabel;
  final VoidCallback onBuy;

  const _ShopItem({
    required this.emoji,
    required this.color,
    required this.title,
    required this.subtitle,
    this.badge,
    this.price,
    this.priceLabel,
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
                label: priceLabel ?? '🪙 $price',
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
