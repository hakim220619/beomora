import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../providers/settings_provider.dart';
import '../../services/device_info_service.dart';
import '../../services/handwriting_service.dart';
import '../../theme.dart';

/// Alur menyalakan Tulis Huruf untuk [course]: kalau model bahasanya sudah
/// ada, saklar langsung dinyalakan. Kalau belum, tampil dialog dengan
/// kebutuhan (RAM disarankan, ruang kosong) dibanding kondisi perangkat,
/// pilihan "hanya Wi-Fi", lalu unduh. Saklar baru aktif setelah unduhan
/// selesai; batal/gagal berarti saklar tetap mati.
///
/// Mengembalikan `true` kalau fitur siap dipakai untuk kursus ini.
Future<bool> showHandwritingActivation(
  BuildContext context,
  Course course,
) async {
  final settings = context.read<SettingsProvider>();
  final language = HandwritingService.languageFor(course.id);
  if (language == null) return false;
  if (await HandwritingService.instance.isModelDownloaded(language)) {
    settings.setHandwritingOn(true);
    return true;
  }
  if (!context.mounted) return false;
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
    final l = L.of(context);
    final settings = context.watch<SettingsProvider>();
    final d = _device;
    final sizeMb = HandwritingService.estimatedModelMb(widget.language);
    final storageBlocked = d?.storageOk == false;
    final langName = widget.course.name[l.code] ?? widget.course.name['id']!;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        l.t('handwriting_activate_title'),
        style: const TextStyle(fontWeight: FontWeight.w900),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l
                  .t('handwriting_activate_body')
                  .replaceFirst('{lang}', langName)
                  .replaceFirst('{n}', '$sizeMb'),
              style: const TextStyle(fontSize: 14, height: 1.4),
            ),
            const SizedBox(height: 14),
            _RequirementsTable(l: l, device: d),
            const SizedBox(height: 6),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                l.t('handwriting_wifi_only'),
                style: const TextStyle(fontSize: 13.5),
              ),
              value: settings.handwritingWifiOnly,
              onChanged: _busy
                  ? null
                  : (v) => settings.setHandwritingWifiOnly(v ?? true),
            ),
            if (_busy) ...[
              const SizedBox(height: 6),
              Row(
                children: [
                  const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2.5),
                  ),
                  const SizedBox(width: 10),
                  Text(l.t('handwriting_downloading')),
                ],
              ),
            ],
            if (_error != null) ...[
              const SizedBox(height: 8),
              Text(
                _error!,
                style: const TextStyle(
                  color: DuoColors.red,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
              if (_errorDetail != null && _errorDetail!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: SelectableText(
                    _errorDetail!,
                    style: TextStyle(
                      fontSize: 11,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _busy ? null : () => Navigator.of(context).pop(false),
          child: Text(l.t('cancel')),
        ),
        FilledButton(
          onPressed: _busy || storageBlocked ? null : _download,
          child: Text(l.t('handwriting_download_activate')),
        ),
      ],
    );
  }
}

/// Tabel dua kolom: yang disarankan vs kondisi perangkat, dengan warna
/// status (hijau cukup, kuning RAM rendah, merah ruang kurang).
class _RequirementsTable extends StatelessWidget {
  final L l;
  final DeviceResources? device;

  const _RequirementsTable({required this.l, required this.device});

  @override
  Widget build(BuildContext context) {
    final hint = Theme.of(context).hintColor;
    final d = device;
    final header = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w800,
      color: hint,
    );

    Widget row(String label, String need, String have, bool? ok, String note) {
      final color = ok == null
          ? hint
          : ok
          ? DuoColors.green
          : (label == l.t('handwriting_ram')
                ? DuoColors.yellow
                : DuoColors.red);
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(flex: 3, child: Text(need)),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ok == null ? have : '$have ${ok ? '✓' : '!'}',
                    style: TextStyle(fontWeight: FontWeight.w800, color: color),
                  ),
                  Text(note, style: TextStyle(fontSize: 11.5, color: color)),
                ],
              ),
            ),
          ],
        ),
      );
    }

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

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: hint.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(flex: 3, child: SizedBox()),
              Expanded(
                flex: 3,
                child: Text(l.t('handwriting_recommended'), style: header),
              ),
              Expanded(
                flex: 4,
                child: Text(l.t('handwriting_your_device'), style: header),
              ),
            ],
          ),
          row(
            l.t('handwriting_ram'),
            DeviceResources.format(kHandwritingRecommendedRamBytes),
            d == null ? '…' : DeviceResources.format(d.totalRamBytes),
            d?.ramOk,
            ramNote,
          ),
          row(
            l.t('handwriting_storage'),
            DeviceResources.format(kHandwritingMinFreeBytes),
            d == null ? '…' : DeviceResources.format(d.freeStorageBytes),
            d?.storageOk,
            storageNote,
          ),
        ],
      ),
    );
  }
}
