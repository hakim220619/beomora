import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../providers/settings_provider.dart';
import '../../services/device_info_service.dart';
import '../../services/handwriting_service.dart';
import '../../theme.dart';

/// Alur menyalakan Tulis Huruf untuk [course]. Dialog langsung tampil
/// (dengan loading) selagi model dicek — cek native bisa beberapa detik.
/// Kalau model sudah ada, saklar dinyalakan dan dialog menutup sendiri.
/// Kalau belum, dialog menampilkan kebutuhan (RAM disarankan, ruang
/// kosong) dibanding kondisi perangkat, pilihan "hanya Wi-Fi", lalu unduh.
/// Saklar baru aktif setelah unduhan selesai; batal/gagal = tetap mati.
///
/// Mengembalikan `true` kalau fitur siap dipakai untuk kursus ini.
Future<bool> showHandwritingActivation(
  BuildContext context,
  Course course,
) async {
  final settings = context.read<SettingsProvider>();
  final language = HandwritingService.languageFor(course.id);
  if (language == null) return false;
  // Sudah terbukti ada di sesi ini: tanpa dialog sama sekali.
  if (HandwritingService.instance.isKnownDownloaded(language)) {
    settings.setHandwritingOn(true);
    return true;
  }
  final ok = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (_) =>
        HandwritingActivationDialog(course: course, language: language),
  );
  return ok ?? false;
}

class HandwritingActivationDialog extends StatefulWidget {
  final Course course;
  final String language;

  const HandwritingActivationDialog({
    super.key,
    required this.course,
    required this.language,
  });

  @override
  State<HandwritingActivationDialog> createState() =>
      _HandwritingActivationDialogState();
}

class _HandwritingActivationDialogState
    extends State<HandwritingActivationDialog> {
  bool _checking = true; // cek model awal masih berjalan
  DeviceResources? _device;
  bool _busy = false;
  String? _error;
  String? _errorDetail; // pesan asli plugin/ML Kit, untuk pelacakan

  @override
  void initState() {
    super.initState();
    DeviceInfoService.read().then((d) {
      if (mounted) setState(() => _device = d);
    });
    _checkModel();
  }

  Future<void> _checkModel() async {
    final ready = await HandwritingService.instance.isModelDownloaded(
      widget.language,
    );
    if (!mounted) return;
    if (ready) {
      context.read<SettingsProvider>().setHandwritingOn(true);
      Navigator.of(context).pop(true);
      return;
    }
    setState(() => _checking = false);
  }

  Future<void> _download() async {
    final settings = context.read<SettingsProvider>();
    final l = L.read(context);
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      final ok = await HandwritingService.instance.downloadModel(
        widget.language,
        wifiOnly: settings.handwritingWifiOnly,
      );
      if (!ok) throw StateError('download failed');
      settings.setHandwritingOn(true);
      if (mounted) Navigator.of(context).pop(true);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _busy = false;
        _error = l.t('handwriting_download_failed');
        _errorDetail = HandwritingService.describeError(e);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          child: _checking ? _checkingView(context) : _activateView(context),
        ),
      ),
    );
  }

  /// Tahap awal: loading selagi model dicek.
  Widget _checkingView(BuildContext context) {
    final l = L.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _Badge(),
          const SizedBox(height: 18),
          const SizedBox(
            width: 26,
            height: 26,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: DuoColors.blue,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            l.t('handwriting_checking'),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 4),
          Text(
            l.t('handwriting_checking_sub'),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Theme.of(context).hintColor),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l.t('cancel')),
          ),
        ],
      ),
    );
  }

  /// Model belum ada: kebutuhan perangkat, opsi Wi-Fi, lalu unduh.
  Widget _activateView(BuildContext context) {
    final l = L.of(context);
    final settings = context.watch<SettingsProvider>();
    final hint = Theme.of(context).hintColor;
    final d = _device;
    final sizeMb = HandwritingService.estimatedModelMb(widget.language);
    final storageBlocked = d?.storageOk == false;
    final langName = widget.course.name[l.code] ?? widget.course.name['id']!;

    final ramNote = d == null || d.ramOk == null
        ? l.t('handwriting_unknown')
        : d.ramOk!
        ? l.t('handwriting_ok')
        : l.t('handwriting_low_ram');
    final storageNote = d == null || d.storageOk == null
        ? l.t('handwriting_unknown')
        : d.storageOk!
        ? l.t('handwriting_ok')
        : l
              .t('handwriting_low_storage')
              .replaceFirst('{n}', '${d.storageShortfallMb}');

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _Badge(),
          const SizedBox(height: 14),
          Text(
            l.t('handwriting_activate_title'),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 8),
          Text(
            l
                .t('handwriting_activate_body')
                .replaceFirst('{lang}', langName)
                .replaceFirst('{n}', '$sizeMb'),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13.5, height: 1.45, color: hint),
          ),
          const SizedBox(height: 18),
          _RequirementTile(
            icon: Icons.memory_rounded,
            label: l.t('handwriting_ram'),
            recommended:
                '${l.t('handwriting_recommended')} '
                '${DeviceResources.format(kHandwritingRecommendedRamBytes)}',
            value: d == null ? null : DeviceResources.format(d.totalRamBytes),
            ok: d?.ramOk,
            warnOnly: true,
            note: ramNote,
          ),
          const SizedBox(height: 8),
          _RequirementTile(
            icon: Icons.sd_storage_rounded,
            label: l.t('handwriting_storage'),
            recommended:
                '${l.t('handwriting_recommended')} '
                '${DeviceResources.format(kHandwritingMinFreeBytes)}',
            value: d == null
                ? null
                : DeviceResources.format(d.freeStorageBytes),
            ok: d?.storageOk,
            note: storageNote,
          ),
          const SizedBox(height: 8),
          _Panel(
            child: Row(
              children: [
                Icon(Icons.wifi_rounded, size: 20, color: hint),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    l.t('handwriting_wifi_only'),
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Switch.adaptive(
                  value: settings.handwritingWifiOnly,
                  activeTrackColor: DuoColors.blue,
                  onChanged: _busy
                      ? null
                      : (v) => settings.setHandwritingWifiOnly(v),
                ),
              ],
            ),
          ),
          if (_busy) ...[
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: const LinearProgressIndicator(
                minHeight: 6,
                color: DuoColors.blue,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l.t('handwriting_downloading'),
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: hint,
              ),
            ),
          ],
          if (_error != null) ...[
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: DuoColors.red.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _error!,
                    style: const TextStyle(
                      color: DuoColors.red,
                      fontWeight: FontWeight.w800,
                      fontSize: 13,
                    ),
                  ),
                  if (_errorDetail != null && _errorDetail!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: SelectableText(
                        _errorDetail!,
                        style: TextStyle(fontSize: 11, color: hint),
                      ),
                    ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: DuoColors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: _busy || storageBlocked ? null : _download,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.download_rounded, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    l.t('handwriting_download_activate'),
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          TextButton(
            onPressed: _busy ? null : () => Navigator.of(context).pop(false),
            child: Text(l.t('cancel')),
          ),
        ],
      ),
    );
  }
}

/// Lencana pensil di atas dialog.
class _Badge extends StatelessWidget {
  const _Badge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: DuoColors.blue.withValues(alpha: 0.14),
      ),
      child: const Text('✍️', style: TextStyle(fontSize: 30)),
    );
  }
}

/// Kotak latar lembut untuk satu baris isi dialog.
class _Panel extends StatelessWidget {
  final Widget child;
  const _Panel({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
      decoration: BoxDecoration(
        color: Theme.of(context).hintColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
      ),
      child: child,
    );
  }
}

/// Satu kebutuhan perangkat: ikon, nama + yang disarankan, lalu nilai
/// perangkat dengan status berwarna (hijau cukup; RAM rendah kuning,
/// ruang kurang merah; abu-abu kalau belum/tidak diketahui).
class _RequirementTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String recommended;
  final String? value; // null = masih dibaca
  final bool? ok;
  final bool warnOnly; // kurang = peringatan (kuning), bukan blokir
  final String note;

  const _RequirementTile({
    required this.icon,
    required this.label,
    required this.recommended,
    required this.value,
    required this.ok,
    required this.note,
    this.warnOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final hint = Theme.of(context).hintColor;
    final color = ok == null
        ? hint
        : ok!
        ? DuoColors.green
        : (warnOnly ? DuoColors.yellow : DuoColors.red);
    return _Panel(
      child: Padding(
        padding: const EdgeInsets.only(right: 4, top: 2, bottom: 2),
        child: Row(
          children: [
            Icon(icon, size: 20, color: hint),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    recommended,
                    style: TextStyle(fontSize: 11.5, color: hint),
                  ),
                  const SizedBox(height: 4),
                  // Catatan status di bawah label: teks panjang (mis.
                  // "kosongkan sekitar 150 MB lagi") bebas membungkus.
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.14),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      note,
                      style: TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.w800,
                        color: color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            value == null
                ? const SizedBox(
                    width: 14,
                    height: 14,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(
                    value!,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: color,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
