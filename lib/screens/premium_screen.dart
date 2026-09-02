import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_strings.dart';
import '../providers/auth_provider.dart';
import '../services/purchase_service.dart';
import '../theme.dart';
import '../widgets/beomora_logo.dart';
import '../widgets/duo_button.dart';
import '../widgets/study/study_background.dart';

/// Paywall Beomora Premium: daftar keuntungan + pilihan paket.
/// Pembelian lewat Play Billing (PurchaseService); sebelum produk
/// dikonfigurasi di Play Console, tombol menampilkan pesan info.
class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  Future<void> _buy(BuildContext context, String productId) async {
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

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final auth = context.watch<AuthProvider>();
    final purchase = context.read<PurchaseService>();

    return StudyScaffold(
      appBar: AppBar(title: Text(l.t('premium_title'))),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          const Center(child: BeomoraLogo(size: 96)),
          const SizedBox(height: 10),
          Text(
            auth.isPremium
                ? l.t('premium_active')
                : l.t('premium_sub'),
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 18),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Benefit(emoji: '❤️', text: l.t('premium_b_hearts')),
                  _Benefit(emoji: '🧊', text: l.t('premium_b_streak')),
                  _Benefit(emoji: '⚡', text: l.t('premium_b_xp')),
                  _Benefit(emoji: '🚫', text: l.t('premium_b_noads')),
                  _Benefit(emoji: '👑', text: l.t('premium_b_badge')),
                  _Benefit(emoji: '🈴', text: l.t('premium_b_packs')),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
          if (auth.isPremium)
            Text(
              l.t('premium_thanks'),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: DuoColors.green,
              ),
            )
          else ...[
            _PlanButton(
              label: l.t('premium_monthly'),
              price: purchase.priceOf(PurchaseService.premiumMonthlyId),
              color: DuoColors.blue,
              onTap: () =>
                  _buy(context, PurchaseService.premiumMonthlyId),
            ),
            const SizedBox(height: 10),
            _PlanButton(
              label: l.t('premium_yearly'),
              badge: l.t('premium_best'),
              price: purchase.priceOf(PurchaseService.premiumYearlyId),
              color: DuoColors.green,
              onTap: () =>
                  _buy(context, PurchaseService.premiumYearlyId),
            ),
            const SizedBox(height: 10),
            _PlanButton(
              label: l.t('premium_lifetime'),
              price:
                  purchase.priceOf(PurchaseService.premiumLifetimeId),
              color: DuoColors.purple,
              onTap: () =>
                  _buy(context, PurchaseService.premiumLifetimeId),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => purchase.restore(),
              child: Text(
                l.t('restore_purchases'),
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _Benefit extends StatelessWidget {
  final String emoji;
  final String text;
  const _Benefit({required this.emoji, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 14.5, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlanButton extends StatelessWidget {
  final String label;
  final String? badge;
  final String? price;
  final Color color;
  final VoidCallback onTap;

  const _PlanButton({
    required this.label,
    this.badge,
    required this.price,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final priceText = price ?? '—';
    return Stack(
      clipBehavior: Clip.none,
      children: [
        DuoButton(
          label: '$label  ·  $priceText',
          color: color,
          onPressed: onTap,
        ),
        if (badge != null)
          Positioned(
            top: -8,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: DuoColors.yellow,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                badge!,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  color: DuoColors.eel,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
