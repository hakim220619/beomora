import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_strings.dart';
import '../providers/auth_provider.dart';
import '../providers/progress_provider.dart';
import '../providers/settings_provider.dart';
import '../services/content_service.dart';
import '../services/notification_service.dart';
import '../theme.dart';
import '../widgets/study/study_background.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final settings = context.watch<SettingsProvider>();
    final progress = context.watch<ProgressProvider>();

    return StudyScaffold(
      appBar: AppBar(title: Text(l.t('settings_title'))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Bahasa UI
          Text(l.t('ui_language'),
              style: const TextStyle(fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          SegmentedButton<String>(
            segments: const [
              ButtonSegment(
                  value: 'id', label: Text('🇮🇩 Indonesia')),
              ButtonSegment(value: 'en', label: Text('🇬🇧 English')),
            ],
            selected: {settings.uiLang},
            onSelectionChanged: (s) => settings.setUiLang(s.first),
          ),
          const SizedBox(height: 20),
          // Tema: hanya siang (terang) atau malam (gelap).
          Text(l.t('theme'),
              style: const TextStyle(fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          SegmentedButton<ThemeMode>(
            segments: [
              ButtonSegment(
                  value: ThemeMode.light,
                  label: Text('☀️ ${l.t('theme_light')}')),
              ButtonSegment(
                  value: ThemeMode.dark,
                  label: Text('🌙 ${l.t('theme_dark')}')),
            ],
            selected: {
              settings.themeMode == ThemeMode.dark
                  ? ThemeMode.dark
                  : ThemeMode.light
            },
            onSelectionChanged: (s) => settings.setThemeMode(s.first),
          ),
          const SizedBox(height: 20),
          // Suara
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l.t('sound_effects'),
                style: const TextStyle(fontWeight: FontWeight.w800)),
            value: settings.soundOn,
            activeThumbColor: DuoColors.green,
            onChanged: settings.setSoundOn,
          ),
          // Ikon emoji di layar Belajar & Latihan
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l.t('show_icons'),
                style: const TextStyle(fontWeight: FontWeight.w800)),
            subtitle: Text(l.t('show_icons_sub')),
            value: settings.showIcons,
            activeThumbColor: DuoColors.green,
            onChanged: settings.setShowIcons,
          ),
          // Pengingat belajar harian
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l.t('reminder_setting'),
                style: const TextStyle(fontWeight: FontWeight.w800)),
            subtitle: Text(l.t('reminder_sub')),
            value: settings.reminderOn,
            activeThumbColor: DuoColors.green,
            onChanged: (on) async {
              settings.setReminderOn(on);
              if (on) {
                // Izin Android 13+/iOS — lalu jadwal dipasang oleh
                // listener pengaturan di main().
                await NotificationService.requestPermission();
                await NotificationService.sync(settings, progress);
              }
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            enabled: settings.reminderOn,
            title: Text(l.t('reminder_time'),
                style: const TextStyle(fontWeight: FontWeight.w800)),
            trailing: Text(
              settings.reminderTime.format(context),
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w800),
            ),
            onTap: () async {
              final picked = await showTimePicker(
                context: context,
                initialTime: settings.reminderTime,
              );
              if (picked != null) settings.setReminderTime(picked);
            },
          ),
          const SizedBox(height: 8),
          // Target harian
          Text(l.t('daily_goal_setting'),
              style: const TextStyle(fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          SegmentedButton<int>(
            segments: const [
              ButtonSegment(value: 10, label: Text('10')),
              ButtonSegment(value: 20, label: Text('20')),
              ButtonSegment(value: 30, label: Text('30')),
              ButtonSegment(value: 50, label: Text('50')),
            ],
            selected: {progress.dailyGoal},
            onSelectionChanged: (s) => progress.setDailyGoal(s.first),
          ),
          const SizedBox(height: 20),
          // Tantangan streak (hitungan tidak hangus saat bolos)
          Text(
            '${l.t('streak_goal_setting')} 🔥 '
            '${progress.goalDaysDone}/${progress.streakGoalDays} '
            '${l.t('streak_days_label')}',
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          SegmentedButton<int>(
            segments: const [
              ButtonSegment(value: 10, label: Text('10')),
              ButtonSegment(value: 30, label: Text('30')),
              ButtonSegment(value: 50, label: Text('50')),
              ButtonSegment(value: 90, label: Text('90')),
              ButtonSegment(value: 120, label: Text('120')),
            ],
            selected: {progress.streakGoalDays},
            onSelectionChanged: (s) => progress.setStreakGoal(s.first),
          ),
          // Khusus admin: unggah materi dari asset bawaan ke Firestore
          // supaya semua perangkat tersinkron.
          if (context.watch<AuthProvider>().isAdmin) ...[
            const SizedBox(height: 20),
            const _AdminUploadTile(),
            const SizedBox(height: 12),
            const _AdminPremiumAllTile(),
            const SizedBox(height: 12),
            const _AdminGrantTile(),
            const SizedBox(height: 12),
            const _AdminHeartRegenTile(),
          ],
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

/// Kartu admin: unggah materi bawaan aplikasi ke Firestore (koleksi
/// `content`) — batch atomik + verifikasi baca-ulang dari server di
/// [ContentService.uploadFromAssets].
class _AdminUploadTile extends StatefulWidget {
  const _AdminUploadTile();

  @override
  State<_AdminUploadTile> createState() => _AdminUploadTileState();
}

class _AdminUploadTileState extends State<_AdminUploadTile> {
  bool _busy = false;

  Future<void> _upload() async {
    final l = L.read(context);
    final messenger = ScaffoldMessenger.of(context);
    setState(() => _busy = true);
    final error = await ContentService.uploadFromAssets();
    if (!mounted) return;
    setState(() => _busy = false);
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        duration: const Duration(seconds: 6),
        content: Text(error == null
            ? l.t('content_upload_success')
            : '${l.t('content_upload_failed')}\n($error)'),
      ));
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return Card(
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: _busy
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2.5),
              )
            : const Icon(Icons.cloud_upload_rounded,
                color: DuoColors.blue),
        title: Text(l.t('content_upload'),
            style: const TextStyle(fontWeight: FontWeight.w800)),
        subtitle: Text(l.t('content_upload_sub'),
            style: const TextStyle(fontSize: 12.5)),
        onTap: _busy ? null : _upload,
      ),
    );
  }
}

/// Kartu admin: saklar "premium untuk semua pengguna" — menulis field
/// `premiumForAll` di dokumen `content/config` (hanya admin yang boleh,
/// ditegakkan firestore.rules). Perangkat pengguna membacanya saat
/// aplikasi dibuka.
class _AdminPremiumAllTile extends StatefulWidget {
  const _AdminPremiumAllTile();

  @override
  State<_AdminPremiumAllTile> createState() =>
      _AdminPremiumAllTileState();
}

class _AdminPremiumAllTileState extends State<_AdminPremiumAllTile> {
  bool _busy = false;

  Future<void> _toggle(bool on) async {
    final l = L.read(context);
    final auth = context.read<AuthProvider>();
    final messenger = ScaffoldMessenger.of(context);
    setState(() => _busy = true);
    final error = await auth.setGlobalPremium(on);
    if (!mounted) return;
    setState(() => _busy = false);
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        duration: const Duration(seconds: 6),
        content: Text(error == null
            ? l.t(on
                ? 'admin_premium_all_on'
                : 'admin_premium_all_off')
            : '${l.t('admin_premium_all_failed')}\n($error)'),
      ));
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final on = context.watch<AuthProvider>().globalPremium;
    return Card(
      child: SwitchListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        secondary: _busy
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2.5),
              )
            : const Icon(Icons.workspace_premium_rounded,
                color: DuoColors.purple),
        title: Text(l.t('admin_premium_all'),
            style: const TextStyle(fontWeight: FontWeight.w800)),
        subtitle: Text(l.t('admin_premium_all_sub'),
            style: const TextStyle(fontSize: 12.5)),
        value: on,
        activeThumbColor: DuoColors.green,
        onChanged: _busy ? null : _toggle,
      ),
    );
  }
}

/// Kartu admin: atur menit regenerasi nyawa untuk SEMUA pengguna —
/// menulis `heartRegenMinutes` di dokumen `content/config`.
class _AdminHeartRegenTile extends StatefulWidget {
  const _AdminHeartRegenTile();

  @override
  State<_AdminHeartRegenTile> createState() =>
      _AdminHeartRegenTileState();
}

class _AdminHeartRegenTileState extends State<_AdminHeartRegenTile> {
  bool _busy = false;

  Future<void> _open() async {
    final l = L.read(context);
    final auth = context.read<AuthProvider>();
    final progress = context.read<ProgressProvider>();
    final messenger = ScaffoldMessenger.of(context);

    final controller = TextEditingController(
        text: '${progress.heartRegenMinutes}');
    final minutes = await showDialog<int>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l.t('admin_heart_regen')),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          autofocus: true,
          decoration: InputDecoration(
            labelText: l.t('admin_heart_regen_label'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(l.t('cancel')),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext)
                .pop(int.tryParse(controller.text.trim())),
            child: Text(l.t('save')),
          ),
        ],
      ),
    );
    if (minutes == null) return;
    if (minutes < 1 || minutes > 1440) {
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(
            SnackBar(content: Text(l.t('admin_heart_regen_invalid'))));
      return;
    }

    setState(() => _busy = true);
    final error = await auth.setHeartRegenMinutes(minutes);
    if (!mounted) return;
    setState(() => _busy = false);
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        duration: const Duration(seconds: 6),
        content: Text(error == null
            ? l
                .t('admin_heart_regen_saved')
                .replaceFirst('{n}', '$minutes')
            : '${l.t('admin_heart_regen_failed')}\n($error)'),
      ));
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final progress = context.watch<ProgressProvider>();
    return Card(
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: _busy
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2.5),
              )
            : const Icon(Icons.favorite_rounded, color: DuoColors.red),
        title: Text(l.t('admin_heart_regen'),
            style: const TextStyle(fontWeight: FontWeight.w800)),
        subtitle: Text(
          l
              .t('admin_heart_regen_sub')
              .replaceFirst('{n}', '${progress.heartRegenMinutes}'),
          style: const TextStyle(fontSize: 12.5),
        ),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: _busy ? null : _open,
      ),
    );
  }
}

/// Kartu admin: hadiahkan/cabut premium untuk pengguna tertentu lewat
/// email — menulis field `premiumGrantUntil` di dokumen profilnya
/// (hanya admin yang diizinkan firestore.rules; klien pemilik tidak
/// pernah menulis field ini sehingga hadiah kebal tertimpa sync).
class _AdminGrantTile extends StatelessWidget {
  const _AdminGrantTile();

  Future<void> _open(BuildContext context) async {
    final l = L.read(context);
    final auth = context.read<AuthProvider>();
    final messenger = ScaffoldMessenger.of(context);
    final result = await showDialog<(String, Duration?)>(
      context: context,
      builder: (_) => const _GrantDialog(),
    );
    if (result == null) return;
    final (email, duration) = result;
    final error = await auth.grantPremiumByEmail(email, duration);
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        duration: const Duration(seconds: 6),
        content: Text(error == null
            ? '${l.t(duration == null ? 'admin_grant_revoked' : 'admin_grant_success')} $email'
            : l.t(error)),
      ));
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return Card(
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: const Icon(Icons.card_giftcard_rounded,
            color: DuoColors.orange),
        title: Text(l.t('admin_grant'),
            style: const TextStyle(fontWeight: FontWeight.w800)),
        subtitle: Text(l.t('admin_grant_sub'),
            style: const TextStyle(fontSize: 12.5)),
        onTap: () => _open(context),
      ),
    );
  }
}

/// Dialog isian hadiah: email penerima + durasi (atau cabut).
class _GrantDialog extends StatefulWidget {
  const _GrantDialog();

  @override
  State<_GrantDialog> createState() => _GrantDialogState();
}

class _GrantDialogState extends State<_GrantDialog> {
  final _emailCtrl = TextEditingController();
  int _days = 30; // 0 = cabut hadiah

  @override
  void dispose() {
    _emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return AlertDialog(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(l.t('admin_grant'),
          style: const TextStyle(fontWeight: FontWeight.w900)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _emailCtrl,
            keyboardType: TextInputType.emailAddress,
            autofocus: true,
            decoration:
                InputDecoration(hintText: l.t('admin_grant_email')),
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 14),
          Text(l.t('admin_grant_duration'),
              style: const TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w800)),
          const SizedBox(height: 6),
          Wrap(
            spacing: 6,
            children: [
              for (final d in const [7, 30, 90, 365])
                ChoiceChip(
                  label: Text('$d ${l.t('days_unit')}'),
                  selected: _days == d,
                  onSelected: (_) => setState(() => _days = d),
                ),
              ChoiceChip(
                label: Text(l.t('admin_grant_revoke')),
                selected: _days == 0,
                selectedColor: DuoColors.red.withValues(alpha: 0.2),
                onSelected: (_) => setState(() => _days = 0),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l.t('cancel')),
        ),
        FilledButton(
          onPressed: _emailCtrl.text.trim().isEmpty
              ? null
              : () => Navigator.of(context).pop((
                    _emailCtrl.text.trim(),
                    _days == 0 ? null : Duration(days: _days),
                  )),
          child: Text(l.t('admin_grant_apply')),
        ),
      ],
    );
  }
}
