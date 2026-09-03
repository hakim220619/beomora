import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'models/course.dart';
import 'providers/auth_provider.dart';
import 'providers/progress_provider.dart';
import 'providers/settings_provider.dart';
import 'screens/login_screen.dart';
import 'screens/main_screen.dart';
import 'screens/onboarding_screen.dart';
import 'services/ad_service.dart';
import 'services/content_service.dart';
import 'services/notification_service.dart';
import 'services/progress_sync_service.dart';
import 'services/purchase_service.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase (login Google). Dilewati selama firebase_options.dart
  // masih placeholder — aplikasi tetap jalan dalam mode tamu.
  final fbOptions = DefaultFirebaseOptions.currentPlatform;
  if (!fbOptions.apiKey.contains('GANTI')) {
    try {
      await Firebase.initializeApp(options: fbOptions);
    } catch (_) {
      // Konfigurasi tidak valid — biarkan mode tamu.
    }
  }
  final prefs = await SharedPreferences.getInstance();
  // Materi: cache lokal / asset bawaan — instan & selalu tersedia.
  final courses = await ContentService.loadCourses(prefs: prefs);
  // Bank Soal Pilihan Ganda: cache hasil sinkron / bawaan aplikasi.
  ContentService.loadMcqBanks(prefs);
  // Sinkron materi di latar belakang (maks. 1 cek tiap 6 jam);
  // pembaruan dipakai mulai peluncuran berikutnya.
  unawaited(ContentService.sync(prefs));

  final progress = ProgressProvider(prefs);
  final auth = AuthProvider(prefs);
  // Menit regenerasi nyawa dari server (content/config, diatur admin).
  auth.onHeartRegenMinutes = progress.applyHeartRegenMinutes;
  // Cadangkan/pulihkan progres lewat dokumen profil Firestore —
  // hidup selama aplikasi karena terikat listener kedua provider.
  ProgressSyncService(auth: auth, progress: progress);
  // Pembelian dalam aplikasi (premium & top-up permata).
  final purchase = PurchaseService(auth: auth, progress: progress);
  // Iklan untuk pengguna gratis (premium bebas iklan).
  unawaited(AdService.init());

  final settings = SettingsProvider(prefs);
  // Pengingat belajar harian: pasang jadwal saat aplikasi dibuka, dan
  // jadwalkan ulang setiap pengaturan berubah atau hari aktif berubah
  // (selesai belajar hari ini → pengingat mundur ke besok).
  unawaited(NotificationService.sync(settings, progress));
  settings.addListener(
      () => unawaited(NotificationService.sync(settings, progress)));
  var lastActive = progress.lastActiveDay;
  progress.addListener(() {
    if (progress.lastActiveDay == lastActive) return;
    lastActive = progress.lastActiveDay;
    unawaited(NotificationService.sync(settings, progress));
  });

  runApp(
    MultiProvider(
      providers: [
        Provider<List<Course>>.value(value: courses),
        Provider<PurchaseService>.value(value: purchase),
        ChangeNotifierProvider.value(value: settings),
        ChangeNotifierProvider.value(value: progress),
        ChangeNotifierProvider.value(value: auth),
      ],
      child: const BeomoraApp(),
    ),
  );
}

class BeomoraApp extends StatelessWidget {
  const BeomoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsProvider>();
    final auth = context.watch<AuthProvider>();
    return MaterialApp(
      title: 'Beomora',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(Brightness.light),
      darkTheme: buildTheme(Brightness.dark),
      themeMode: settings.themeMode,
      locale: Locale(settings.uiLang),
      supportedLocales: const [Locale('id'), Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // Gerbang aplikasi: onboarding → login (wajib) → menu utama.
      home: !settings.onboarded
          ? const OnboardingScreen()
          : auth.signedIn
              ? const MainScreen()
              : const LoginScreen(),
    );
  }
}
