import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// Iklan AdMob untuk pengguna gratis (premium bebas iklan).
///
/// Unit PRODUKSI (akun AdMob Beomora) hanya dipakai di build release
/// Android; build debug/profile dan platform lain selalu memakai unit
/// TEST resmi Google — supaya uji coba di perangkat sendiri tidak
/// dihitung invalid traffic (risiko akun AdMob dibekukan).
class AdService {
  static bool get supported {
    if (kIsWeb) return false;
    try {
      return Platform.isAndroid || Platform.isIOS;
    } catch (_) {
      return false;
    }
  }

  // Unit produksi — AdMob → Beomora → Unit iklan.
  static const _bannerProdAndroid =
      'ca-app-pub-1133455930155291/2624675167';
  static const _rewardedProdAndroid =
      'ca-app-pub-1133455930155291/2676646053';

  // Unit TEST resmi Google.
  static String get _rewardedTest => Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/5224354917'
      : 'ca-app-pub-3940256099942544/1712485313';
  static String get _bannerTest => Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/2934735716';

  static bool get _useProd => kReleaseMode && Platform.isAndroid;

  static String get rewardedUnitId =>
      _useProd ? _rewardedProdAndroid : _rewardedTest;

  static String get bannerUnitId =>
      _useProd ? _bannerProdAndroid : _bannerTest;

  static bool _initialized = false;

  static Future<void> init() async {
    if (!supported || _initialized) return;
    try {
      await MobileAds.instance.initialize();
      _initialized = true;
    } catch (e) {
      debugPrint('BeomoraAds init gagal: $e');
    }
  }

  /// Muat lalu tayangkan iklan reward. [onReward] dipanggil saat
  /// pengguna menuntaskan iklan. Mengembalikan false kalau iklan
  /// tidak tersedia/siap.
  static Future<bool> showRewarded(
      {required VoidCallback onReward}) async {
    if (!supported) return false;
    await init();
    RewardedAd? loaded;
    try {
      await RewardedAd.load(
        adUnitId: rewardedUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) => loaded = ad,
          onAdFailedToLoad: (e) =>
              debugPrint('BeomoraAds rewarded gagal dimuat: $e'),
        ),
      );
      // Tunggu callback load (RewardedAd.load selesai sebelum callback
      // pada beberapa versi plugin) — beri jeda singkat.
      for (var i = 0; i < 20 && loaded == null; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 250));
      }
      final ad = loaded;
      if (ad == null) return false;
      ad.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) => ad.dispose(),
        onAdFailedToShowFullScreenContent: (ad, _) => ad.dispose(),
      );
      await ad.show(onUserEarnedReward: (_, _) => onReward());
      return true;
    } catch (e) {
      debugPrint('BeomoraAds rewarded gagal: $e');
      loaded?.dispose();
      return false;
    }
  }
}
