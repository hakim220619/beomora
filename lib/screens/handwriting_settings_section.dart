import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/handwriting_bank.dart';
import '../l10n/app_strings.dart';
import '../models/course.dart';
import '../providers/progress_provider.dart';
import '../providers/settings_provider.dart';
import '../services/handwriting_service.dart';
import '../theme.dart';
import 'practice/handwriting_activation.dart';

/// Bagian "Tulis Huruf" di Pengaturan: saklar utama (menyalakan = dialog
/// kebutuhan + unduh model kursus aktif), pilihan hanya Wi-Fi, dan daftar
/// model per bahasa dengan status terunduh, perkiraan ukuran, serta tombol
/// unduh/hapus. Mematikan saklar tidak menghapus model, supaya menyalakan
/// lagi tidak perlu unduh ulang.
class HandwritingSettingsSection extends StatefulWidget {
  const HandwritingSettingsSection({super.key});

  @override
  State<HandwritingSettingsSection> createState() =>
      _HandwritingSettingsSectionState();
}

class _HandwritingSettingsSectionState
    extends State<HandwritingSettingsSection> {
  // Status model per kode bahasa; null = masih dicek.
  final Map<String, bool?> _downloaded = {};
  String? _busyLanguage;

  List<Course> get _courses => context
      .read<List<Course>>()
      .where(
        (c) =>
            HandwritingService.languageFor(c.id) != null &&
            writingCategoriesFor(c.id).isNotEmpty,
      )
      .toList();

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future<void> _refresh() async {
    for (final c in _courses) {
      final lang = HandwritingService.languageFor(c.id)!;
      final ok = await HandwritingService.instance.isModelDownloaded(lang);
      if (!mounted) return;
      setState(() => _downloaded[lang] = ok);
    }
  }

  Future<void> _toggle(bool on) async {
    final settings = context.read<SettingsProvider>();
    if (!on) {
      settings.setHandwritingOn(false);
      return;
    }
    final progress = context.read<ProgressProvider>();
    final courses = _courses;
    final active = courses.firstWhere(
      (c) => c.id == progress.activeCourseId,
      orElse: () => courses.first,
    );
    final messenger = ScaffoldMessenger.of(context);
    final l = L.read(context);
    final ok = await showHandwritingActivation(context, active);
    if (!mounted) return;
    if (ok) {
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(l.t('handwriting_ready'))));
    }
    await _refresh();
  }

  Future<void> _download(Course course) async {
    final ok = await showHandwritingActivation(context, course);
    if (!mounted) return;
    if (ok) await _refresh();
  }

  Future<void> _delete(String language) async {
    final l = L.read(context);
    final messenger = ScaffoldMessenger.of(context);
    setState(() => _busyLanguage = language);
    await HandwritingService.instance.deleteModel(language);
    if (!mounted) return;
    setState(() {
      _busyLanguage = null;
      _downloaded[language] = false;
    });
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(l.t('handwriting_deleted'))));
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final settings = context.watch<SettingsProvider>();
    final hint = Theme.of(context).hintColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            l.t('handwriting_setting'),
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
          subtitle: Text(l.t('handwriting_setting_sub')),
          value: settings.handwritingOn,
          activeThumbColor: DuoColors.green,
          onChanged: _toggle,
        ),
        if (settings.handwritingOn) ...[
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            title: Text(
              l.t('handwriting_wifi_only'),
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            value: settings.handwritingWifiOnly,
            activeThumbColor: DuoColors.green,
            onChanged: settings.setHandwritingWifiOnly,
          ),
          const SizedBox(height: 4),
          Text(
            l.t('handwriting_models'),
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w800,
              color: hint,
            ),
          ),
          for (final c in _courses)
            _ModelRow(
              course: c,
              language: HandwritingService.languageFor(c.id)!,
              downloaded: _downloaded[HandwritingService.languageFor(c.id)!],
              busy: _busyLanguage == HandwritingService.languageFor(c.id),
              l: l,
              onDownload: () => _download(c),
              onDelete: () => _delete(HandwritingService.languageFor(c.id)!),
            ),
        ],
      ],
    );
  }
}

class _ModelRow extends StatelessWidget {
  final Course course;
  final String language;
  final bool? downloaded;
  final bool busy;
  final L l;
  final VoidCallback onDownload;
  final VoidCallback onDelete;

  const _ModelRow({
    required this.course,
    required this.language,
    required this.downloaded,
    required this.busy,
    required this.l,
    required this.onDownload,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final hint = Theme.of(context).hintColor;
    final size = l
        .t('handwriting_model_size')
        .replaceFirst(
          '{n}',
          '${HandwritingService.estimatedModelMb(language)}',
        );
    final status = downloaded == null
        ? '…'
        : downloaded!
        ? '${l.t('handwriting_model_ready')} · $size'
        : '${l.t('handwriting_model_missing')} · $size';
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      leading: Text(course.flag, style: const TextStyle(fontSize: 22)),
      title: Text(
        course.name[l.code] ?? course.name['id']!,
        style: const TextStyle(fontWeight: FontWeight.w800),
      ),
      subtitle: Text(status, style: TextStyle(fontSize: 12, color: hint)),
      trailing: busy
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2.5),
            )
          : downloaded == true
          ? TextButton(
              onPressed: onDelete,
              child: Text(
                l.t('handwriting_delete'),
                style: const TextStyle(color: DuoColors.red),
              ),
            )
          : TextButton(
              onPressed: downloaded == null ? null : onDownload,
              child: Text(l.t('handwriting_download')),
            ),
    );
  }
}
