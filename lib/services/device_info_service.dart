import 'package:flutter/services.dart';

/// Sumber daya perangkat yang dipakai untuk memutuskan apakah fitur
/// berat (model tulisan tangan) layak dinyalakan.
class DeviceResources {
  /// RAM total perangkat, byte. `null` kalau platform tidak melapor.
  final int? totalRamBytes;

  /// Ruang kosong di penyimpanan internal app, byte.
  final int? freeStorageBytes;

  const DeviceResources({this.totalRamBytes, this.freeStorageBytes});

  static const int _mb = 1024 * 1024;
  static const int _gb = 1024 * _mb;

  /// RAM ≥ [kHandwritingRecommendedRamBytes]. `null` = tidak diketahui.
  bool? get ramOk => totalRamBytes == null
      ? null
      : totalRamBytes! >= kHandwritingRecommendedRamBytes;

  /// Ruang kosong ≥ [kHandwritingMinFreeBytes]. `null` = tidak diketahui.
  bool? get storageOk => freeStorageBytes == null
      ? null
      : freeStorageBytes! >= kHandwritingMinFreeBytes;

  /// Kekurangan ruang (MB, dibulatkan ke atas) agar cukup; 0 kalau cukup
  /// atau tidak diketahui.
  int get storageShortfallMb {
    final free = freeStorageBytes;
    if (free == null || free >= kHandwritingMinFreeBytes) return 0;
    return ((kHandwritingMinFreeBytes - free) / _mb).ceil();
  }

  /// "3,8 GB" / "512 MB" — mudah dibaca, satu angka desimal untuk GB.
  static String format(int? bytes, {String decimalSep = ','}) {
    if (bytes == null) return '—';
    if (bytes >= _gb) {
      final gb = bytes / _gb;
      final text = gb >= 10 ? gb.round().toString() : gb.toStringAsFixed(1);
      return '${text.replaceAll('.', decimalSep)} GB';
    }
    return '${(bytes / _mb).round()} MB';
  }
}

/// RAM yang disarankan untuk model tulisan tangan (di bawah ini tetap
/// jalan, hanya muat pertama terasa lambat).
const int kHandwritingRecommendedRamBytes = 3 * 1024 * 1024 * 1024;

/// Ruang kosong minimum sebelum mengunduh model (model 20–30 MB plus
/// ruang unduh sementara; jangan sampai penyimpanan penuh).
const int kHandwritingMinFreeBytes = 200 * 1024 * 1024;

/// Kanal native kecil: RAM total (ActivityManager / ProcessInfo) dan ruang
/// kosong penyimpanan internal (StatFs / NSFileManager). Implementasi di
/// MainActivity.kt dan AppDelegate.swift.
class DeviceInfoService {
  static const MethodChannel channel = MethodChannel('beomora/device');

  /// Baca sumber daya; kalau kanal tidak tersedia (platform lain, tes
  /// tanpa mock) kembalikan nilai kosong, bukan melempar.
  static Future<DeviceResources> read() async {
    try {
      final raw = await channel.invokeMethod<Map<Object?, Object?>>(
        'getResources',
      );
      if (raw == null) return const DeviceResources();
      int? asInt(Object? v) => v is int ? v : (v is num ? v.toInt() : null);
      return DeviceResources(
        totalRamBytes: asInt(raw['totalRamBytes']),
        freeStorageBytes: asInt(raw['freeStorageBytes']),
      );
    } on MissingPluginException {
      return const DeviceResources();
    } on PlatformException {
      return const DeviceResources();
    }
  }
}
