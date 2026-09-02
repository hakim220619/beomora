import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';

import '../providers/auth_provider.dart';
import '../providers/progress_provider.dart';

/// Pembelian dalam aplikasi via Google Play Billing / App Store.
///
/// Produk HARUS didaftarkan dulu di Play Console (Monetize → Products)
/// dengan ID persis seperti konstanta di bawah; sebelum itu, tombol
/// beli menampilkan pesan "toko belum tersedia" tapi aplikasi tetap
/// berjalan normal.
///
/// Catatan keamanan: verifikasi pembelian dilakukan di sisi klien dan
/// status premium ditulis ke dokumen profil Firestore — kompromi yang
/// wajar untuk skala tanpa backend (verifikasi server-side butuh
/// Cloud Functions/backend sendiri).
///
/// Pembelian diikat ke akun Beomora yang membeli: UID Firebase dikirim
/// sebagai `obfuscatedAccountId` saat beli, dan saat pembelian datang
/// (baru/restore) premium hanya diberikan kalau penanda akunnya cocok
/// dengan yang sedang login — akun lain di HP yang sama tidak ikut
/// premium. Pembelian lama tanpa penanda (sebelum aturan ini) tetap
/// diterima supaya pembeli lama tidak kehilangan premium.
class PurchaseService {
  // ID produk — samakan dengan Play Console.
  // ID HARUS sama persis dengan yang dibuat di Play Console (permanen).
  static const premiumMonthlyId = 'beomora_premium_monthly';
  static const premiumYearlyId = 'beomora_premium_yearly';
  static const premiumLifetimeId = 'beomora_premium_lifetime';
  static const gemsSmallId = 'beomora_gems_1000';
  static const gemsLargeId = 'beomora_gems_5000';

  static const _allIds = {
    premiumMonthlyId,
    premiumYearlyId,
    premiumLifetimeId,
    gemsSmallId,
    gemsLargeId,
  };

  final AuthProvider auth;
  final ProgressProvider progress;

  StreamSubscription<List<PurchaseDetails>>? _sub;
  Map<String, ProductDetails> _products = {};
  bool _available = false;

  PurchaseService({required this.auth, required this.progress}) {
    _init();
  }

  Future<void> _init() async {
    try {
      _available = await InAppPurchase.instance.isAvailable();
      if (!_available) return;
      _sub = InAppPurchase.instance.purchaseStream.listen(
        _onPurchases,
        onError: (Object e) =>
            debugPrint('BeomoraIAP stream error: $e'),
      );
      final resp =
          await InAppPurchase.instance.queryProductDetails(_allIds);
      _products = {
        for (final p in resp.productDetails) p.id: p,
      };
      // Auto-restore tiap aplikasi dibuka: Play hanya mengembalikan
      // langganan yang MASIH aktif, jadi masa premium diperbarui
      // bergulir selama pengguna terus berlangganan; begitu berhenti,
      // restore tidak mengembalikannya lagi dan premium kedaluwarsa
      // sendiri (paling lambat satu periode setelah berhenti).
      await restore();
    } catch (e) {
      debugPrint('BeomoraIAP init gagal: $e');
      _available = false;
    }
  }

  bool get storeReady => _available && _products.isNotEmpty;

  /// Harga terformat dari toko (mis. "Rp29.000"), null kalau produk
  /// belum terdaftar.
  String? priceOf(String productId) => _products[productId]?.price;

  /// Mulai alur pembelian. Mengembalikan kunci l10n galat, atau null
  /// kalau alur toko berhasil dibuka (hasil akhirnya lewat stream).
  Future<String?> buy(String productId) async {
    final product = _products[productId];
    if (!_available || product == null) return 'store_unavailable';
    try {
      // UID ikut ke Play sebagai obfuscatedAccountId — penanda pemilik
      // pembelian, dibaca kembali di [_ownedByActiveAccount].
      final param = PurchaseParam(
        productDetails: product,
        applicationUserName: auth.uid,
      );
      final isConsumable =
          productId == gemsSmallId || productId == gemsLargeId;
      if (isConsumable) {
        await InAppPurchase.instance.buyConsumable(purchaseParam: param);
      } else {
        await InAppPurchase.instance
            .buyNonConsumable(purchaseParam: param);
      }
      return null;
    } catch (e) {
      debugPrint('BeomoraIAP buy gagal: $e');
      return 'store_unavailable';
    }
  }

  /// Pulihkan pembelian lama (ganti perangkat / instal ulang).
  Future<void> restore() async {
    try {
      if (_available) await InAppPurchase.instance.restorePurchases();
    } catch (e) {
      debugPrint('BeomoraIAP restore gagal: $e');
    }
  }

  Future<void> _onPurchases(List<PurchaseDetails> purchases) async {
    for (final p in purchases) {
      final restored = p.status == PurchaseStatus.restored;
      if (p.status == PurchaseStatus.purchased || restored) {
        // Permata itu konsumabel: hanya diberikan pada pembelian baru
        // — saat restore dilewati agar saldo tidak dobel.
        final isGems =
            p.productID == gemsSmallId || p.productID == gemsLargeId;
        if ((!restored || !isGems) && _ownedByActiveAccount(p)) {
          await _grant(p.productID);
        }
      }
      // Tetap selesaikan semua pembelian (termasuk milik akun lain —
      // pembelian itu sudah sah di Play, cuma tidak diberikan di sini).
      if (p.pendingCompletePurchase) {
        try {
          await InAppPurchase.instance.completePurchase(p);
        } catch (_) {}
      }
    }
  }

  /// Pembelian milik akun Beomora yang sedang login? Penanda pemilik
  /// (obfuscatedAccountId) diisi UID saat [buy]; pembelian lama tanpa
  /// penanda dianggap sah. Platform selain Android tidak membawa
  /// penanda ini, jadi diterima apa adanya.
  bool _ownedByActiveAccount(PurchaseDetails p) {
    if (p is! GooglePlayPurchaseDetails) return true;
    final owner = p.billingClientPurchase.obfuscatedAccountId;
    if (owner == null || owner.isEmpty) return true;
    return owner == auth.uid;
  }

  Future<void> _grant(String productId) async {
    switch (productId) {
      case premiumMonthlyId:
        await auth.activatePremium(
            until: DateTime.now().add(const Duration(days: 31)));
      case premiumYearlyId:
        await auth.activatePremium(
            until: DateTime.now().add(const Duration(days: 366)));
      case premiumLifetimeId:
        await auth.activatePremium(); // seumur hidup
      case gemsSmallId:
        progress.addGems(1000);
      case gemsLargeId:
        progress.addGems(5000);
    }
  }

  void dispose() {
    _sub?.cancel();
  }
}
