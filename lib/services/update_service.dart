import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:in_app_update/in_app_update.dart';

/// Pembaruan dalam aplikasi (Play In-App Updates, khusus Android).
///
/// Alur "flexible": versi baru terdeteksi → diunduh di latar belakang
/// (pengguna tetap bisa belajar) → selesai unduh, [onDownloaded]
/// dipanggil untuk menawarkan mulai ulang. Kalau pengguna mengabaikan,
/// Play memasangnya sendiri saat aplikasi ditutup.
///
/// Semua galat ditelan: build yang tidak ter-install dari Play Store
/// (flutter run, APK lokal) memang selalu gagal cek — itu normal.
class UpdateService {
  UpdateService._();

  static bool get supported => !kIsWeb && Platform.isAndroid;

  static Future<void> checkForUpdate(
      {required VoidCallback onDownloaded}) async {
    if (!supported) return;
    try {
      final info = await InAppUpdate.checkForUpdate();
      if (info.updateAvailability !=
          UpdateAvailability.updateAvailable) {
        return;
      }
      if (info.flexibleUpdateAllowed) {
        final result = await InAppUpdate.startFlexibleUpdate();
        if (result == AppUpdateResult.success) onDownloaded();
      } else if (info.immediateUpdateAllowed) {
        // Fallback bila flexible tidak diizinkan Play untuk update ini.
        await InAppUpdate.performImmediateUpdate();
      }
    } catch (e) {
      debugPrint('BeomoraUpdate cek gagal: $e');
    }
  }

  /// Pasang pembaruan yang sudah terunduh (aplikasi mulai ulang).
  static Future<void> completeUpdate() async {
    try {
      await InAppUpdate.completeFlexibleUpdate();
    } catch (e) {
      debugPrint('BeomoraUpdate pasang gagal: $e');
    }
  }
}
