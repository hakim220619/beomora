import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

import '../l10n/app_strings.dart';
import '../providers/progress_provider.dart';
import '../providers/settings_provider.dart';

/// Pengingat belajar harian — notifikasi lokal, tanpa server.
///
/// Jadwalnya "pintar": kalau hari ini sudah belajar (atau jamnya sudah
/// lewat), pengingat berikutnya dipasang mulai besok. Setiap pembukaan
/// aplikasi / penyelesaian pelajaran menjadwalkan ulang lewat [sync],
/// jadi pengingat tidak berbunyi pada hari yang targetnya sudah beres.
class NotificationService {
  static const _reminderId = 100;
  static final _plugin = FlutterLocalNotificationsPlugin();
  static bool _ready = false;

  static bool get supported =>
      !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  static Future<void> _init() async {
    if (!supported || _ready) return;
    tzdata.initializeTimeZones();
    try {
      final info = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(info.identifier));
    } catch (e) {
      // Zona waktu gagal terdeteksi — biarkan default.
      debugPrint('BeomoraNotif zona waktu: $e');
    }
    await _plugin.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
        ),
      ),
    );
    _ready = true;
  }

  /// Minta izin notifikasi (Android 13+ / iOS). true = diizinkan.
  static Future<bool> requestPermission() async {
    if (!supported) return false;
    try {
      await _init();
      if (Platform.isAndroid) {
        final android = _plugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
        final granted = await android?.requestNotificationsPermission();
        return granted ?? true; // pra-Android 13: tidak perlu izin
      }
      final ios = _plugin.resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>();
      final granted = await ios?.requestPermissions(
          alert: true, badge: true, sound: true);
      return granted ?? false;
    } catch (e) {
      debugPrint('BeomoraNotif izin gagal: $e');
      return false;
    }
  }

  /// Pasang/perbarui jadwal pengingat sesuai pengaturan & progres.
  /// Aman dipanggil sesering apa pun (selalu mengganti jadwal lama).
  static Future<void> sync(
      SettingsProvider settings, ProgressProvider progress) async {
    if (!supported) return;
    try {
      await _init();
      if (!settings.reminderOn) {
        await _plugin.cancel(id: _reminderId);
        return;
      }
      final l = L(settings.uiLang);
      final t = settings.reminderTime;
      final now = tz.TZDateTime.now(tz.local);
      var when = tz.TZDateTime(
          tz.local, now.year, now.month, now.day, t.hour, t.minute);
      final today = '${now.year}-'
          '${now.month.toString().padLeft(2, '0')}-'
          '${now.day.toString().padLeft(2, '0')}';
      // Jam sudah lewat, atau hari ini sudah belajar → mulai besok.
      if (!when.isAfter(now) || progress.lastActiveDay == today) {
        when = when.add(const Duration(days: 1));
      }
      final body = progress.streak > 0
          ? l
              .t('reminder_body_streak')
              .replaceFirst('{n}', '${progress.streak}')
          : l.t('reminder_body');
      await _plugin.zonedSchedule(
        id: _reminderId,
        title: l.t('reminder_title'),
        body: body,
        scheduledDate: when,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            'daily_reminder',
            l.t('reminder_channel_name'),
            channelDescription: l.t('reminder_channel_desc'),
            importance: Importance.high,
            priority: Priority.high,
          ),
        ),
        // Inexact: tidak butuh izin alarm eksakta; meleset beberapa
        // menit tidak masalah untuk pengingat belajar.
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    } catch (e) {
      debugPrint('BeomoraNotif jadwal gagal: $e');
    }
  }
}
