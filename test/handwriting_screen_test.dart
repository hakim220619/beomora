import 'package:beomora/data/handwriting_bank.dart';
import 'package:beomora/models/course.dart';
import 'package:beomora/models/guide.dart';
import 'package:beomora/providers/progress_provider.dart';
import 'package:beomora/providers/settings_provider.dart';
import 'package:beomora/screens/practice/handwriting_activation.dart';
import 'package:beomora/screens/practice/handwriting_screen.dart';
import 'package:beomora/services/device_info_service.dart';
import 'package:beomora/services/handwriting_service.dart';
import 'package:beomora/widgets/study/ink_canvas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferences prefs;
  const course = Course(
    id: 'ja',
    name: {'id': 'Bahasa Jepang', 'en': 'Japanese'},
    flag: '🇯🇵',
    ttsLocale: 'ja-JP',
    units: [],
  );
  const gb = 1024 * 1024 * 1024;
  const mb = 1024 * 1024;

  // Tiruan kanal ML Kit Digital Ink: cek/unduh/hapus model dan pengenalan.
  const ttsChannel = MethodChannel('flutter_tts');
  var modelDownloaded = true;
  var downloadOk = true;
  List<String> recognized = const [];
  final downloads = <Map<Object?, Object?>>[];
  final closed = <String>[];

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    modelDownloaded = true;
    downloadOk = true;
    recognized = const [];
    downloads.clear();
    closed.clear();
  });

  void mockChannels(
    WidgetTester tester, {
    int totalRam = 4 * gb,
    int freeStorage = 2 * gb,
  }) {
    final messenger = tester.binding.defaultBinaryMessenger;
    // Kedua nama kanal di-mock: kanal tanpa mock dijawab engine di luar
    // waktu palsu tes sehingga fallback tak pernah selesai di sini
    // (fallback-nya diuji di handwriting_test.dart).
    Future<Object?> inkHandler(MethodCall call) async {
      final args = call.arguments as Map;
      switch (call.method) {
        case 'vision#manageInkModels':
          switch (args['task']) {
            case 'check':
              return modelDownloaded;
            case 'download':
              downloads.add(args);
              if (!downloadOk) {
                throw PlatformException(code: 'network', message: 'offline');
              }
              modelDownloaded = true;
              return 'success';
            case 'delete':
              modelDownloaded = false;
              return 'success';
          }
        case 'vision#startDigitalInkRecognizer':
          // Goresan harus benar-benar terkirim.
          final strokes = (args['ink'] as Map)['strokes'] as List;
          expect(strokes, isNotEmpty);
          return [
            for (final t in recognized) {'text': t, 'score': 0.0},
          ];
        case 'vision#closeDigitalInkRecognizer':
          closed.add(args['id'] as String);
          return null;
      }
      return null;
    }

    for (final name in HandwritingService.manageChannelNames) {
      messenger.setMockMethodCallHandler(MethodChannel(name), inkHandler);
    }
    messenger.setMockMethodCallHandler(ttsChannel, (call) async => 1);
    messenger.setMockMethodCallHandler(DeviceInfoService.channel, (_) async {
      return {'totalRamBytes': totalRam, 'freeStorageBytes': freeStorage};
    });
    addTearDown(() {
      for (final name in HandwritingService.manageChannelNames) {
        messenger.setMockMethodCallHandler(MethodChannel(name), null);
      }
      messenger.setMockMethodCallHandler(ttsChannel, null);
      messenger.setMockMethodCallHandler(DeviceInfoService.channel, null);
    });
  }

  Future<(SettingsProvider, ProgressProvider)> pump(
    WidgetTester tester,
    Widget screen,
  ) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.reset);
    final settings = SettingsProvider(prefs);
    final progress = ProgressProvider(prefs);
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: settings),
          ChangeNotifierProvider.value(value: progress),
        ],
        child: MaterialApp(home: screen),
      ),
    );
    await tester.pump();
    return (settings, progress);
  }

  /// Tunggu callback kanal + animasi dialog/snackbar selesai.
  Future<void> settle(WidgetTester tester) async {
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
  }

  /// Huruf yang sedang ditanyakan: bacaan (romaji) tampil besar di kartu.
  List<KanaItem> currentItems(List<KanaItem> all) =>
      all.where((i) => find.text(i.romaji).evaluate().isNotEmpty).toList();

  testWidgets('kuis tulis: kanvas kosong ditolak, benar & salah dinilai, XP', (
    tester,
  ) async {
    // Premium: sesi penuh 10 huruf.
    SharedPreferences.setMockInitialValues({'auth_premium': true});
    prefs = await SharedPreferences.getInstance();
    mockChannels(tester);
    final (_, progress) = await pump(
      tester,
      const HandwritingScreen(course: course),
    );
    final xpBefore = progress.xp;

    // Pemilih paket: Premium → semua terbuka, termasuk kanji N5.
    expect(find.text('Pilih paket soal'), findsOneWidget);
    expect(find.text('Hiragana'), findsOneWidget);
    expect(find.byIcon(Icons.lock_rounded), findsNothing);

    await tester.tap(find.text('Hiragana'));
    await settle(tester);
    // Langkah cakupan: bawaan Gojūon saja; pilih Semua → 104 huruf.
    expect(find.text('Pilih cakupan huruf'), findsOneWidget);
    expect(find.textContaining('Gojūon'), findsOneWidget);
    expect(find.textContaining('Dakuten'), findsOneWidget);
    expect(find.textContaining('Yōon'), findsOneWidget);
    expect(find.textContaining('· 46 huruf'), findsOneWidget);
    // Satu tombol kembali saja (AppBar); menekannya mundur ke daftar paket.
    expect(find.byType(BackButton), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back_rounded), findsNothing);
    await tester.tap(find.byType(BackButton));
    await settle(tester);
    expect(find.text('Pilih paket soal'), findsOneWidget);
    await tester.tap(find.text('Hiragana'));
    await settle(tester);
    expect(find.text('Pilih cakupan huruf'), findsOneWidget);
    await tester.tap(find.text('Semua'));
    await tester.pump();
    expect(find.textContaining('· 104 huruf'), findsOneWidget);
    await tester.tap(find.textContaining('Mulai menulis'));
    await settle(tester);
    expect(find.text('1/10'), findsOneWidget);
    expect(find.text('Tulis lambang untuk bunyi ini'), findsOneWidget);
    expect(find.byType(InkCanvas), findsOneWidget);

    // Periksa tanpa menulis → peringatan, soal tidak berpindah.
    await tester.tap(find.text('Periksa'));
    await settle(tester);
    expect(find.text('Tulis dulu di kotak'), findsOneWidget);
    expect(find.text('1/10'), findsOneWidget);

    final hiragana = writingCategoriesFor(
      'ja',
    ).firstWhere((c) => c.id == 'hiragana');
    var correct = 0;
    for (var i = 0; i < 10; i++) {
      expect(find.text('${i + 1}/10'), findsOneWidget);
      final items = currentItems(hiragana.items);
      expect(items, isNotEmpty, reason: 'soal ke-${i + 1} tanpa bacaan');
      final wrong = i == 3; // satu soal sengaja salah
      recognized = wrong
          ? const ['〆', '々']
          : ['ぬ', ...items.map((it) => it.kana)]; // benar di 3 teratas
      await tester.drag(find.byType(InkCanvas), const Offset(60, 40));
      await tester.pump();
      await tester.tap(find.text('Periksa'));
      await settle(tester);
      if (wrong) {
        expect(find.text('Salah 😔'), findsOneWidget);
        expect(find.textContaining('Jawaban: '), findsOneWidget);
        expect(find.textContaining('Terbaca: 〆, 々'), findsOneWidget);
      } else {
        correct++;
        expect(find.text('Benar sekali! 🎉'), findsOneWidget);
      }
      // Kanvas terkunci setelah diperiksa; lanjut ke soal berikutnya.
      await tester.tap(find.text('Lanjut'));
      await settle(tester);
    }

    // Hasil: 9 benar, satu keping ulasan, XP = 5 dasar + 2 per benar.
    expect(correct, 9);
    expect(find.text('Lanjut'), findsNothing);
    expect(find.byType(ActionChip), findsOneWidget);
    expect(progress.xp - xpBefore, greaterThanOrEqualTo(5 + 9 * 2));
    // Setiap pengenalan menutup recognizer-nya (tidak bocor).
    expect(closed.length, 10);
  });

  testWidgets('pengguna gratis: 3 huruf per sesi lalu ajakan Premium', (
    tester,
  ) async {
    mockChannels(tester);
    await pump(tester, const HandwritingScreen(course: course));
    // Gratis: paket kanji N5 bergembok.
    expect(find.byIcon(Icons.lock_rounded), findsOneWidget);
    await tester.tap(find.text('Katakana'));
    await settle(tester);
    await tester.tap(find.textContaining('Mulai menulis'));
    await settle(tester);
    expect(find.text('1/3'), findsOneWidget);
    expect(
      find.textContaining('Versi gratis: 3 huruf per sesi'),
      findsOneWidget,
    );
    final katakana = writingCategoriesFor(
      'ja',
    ).firstWhere((c) => c.id == 'katakana');
    for (var i = 0; i < 3; i++) {
      recognized = currentItems(katakana.items).map((it) => it.kana).toList();
      await tester.drag(find.byType(InkCanvas), const Offset(60, 40));
      await tester.pump();
      await tester.tap(find.text('Periksa'));
      await settle(tester);
      await tester.tap(find.text('Lanjut'));
      await settle(tester);
    }
    // Hasil: semua benar tapi tetap ada ajakan Premium.
    expect(find.text('Lanjut'), findsNothing);
    expect(
      find.textContaining('Buka 10 huruf per sesi dengan Premium'),
      findsOneWidget,
    );
  });

  testWidgets('hapus goresan & bersihkan bekerja pada kanvas', (tester) async {
    mockChannels(tester);
    await pump(tester, const HandwritingScreen(course: course));
    await tester.tap(find.text('Katakana'));
    await settle(tester);
    await tester.tap(find.textContaining('Mulai menulis'));
    await settle(tester);

    final canvas = tester.widget<InkCanvas>(find.byType(InkCanvas));
    await tester.drag(find.byType(InkCanvas), const Offset(40, 0));
    await tester.drag(find.byType(InkCanvas), const Offset(0, 40));
    await tester.pump();
    expect(canvas.controller.strokes.length, 2);
    await tester.tap(find.byIcon(Icons.undo_rounded));
    await tester.pump();
    expect(canvas.controller.strokes.length, 1);
    await tester.tap(find.byIcon(Icons.delete_sweep_rounded));
    await tester.pump();
    expect(canvas.controller.isEmpty, isTrue);
  });

  group('aktivasi', () {
    Future<(SettingsProvider, ValueNotifier<bool?>)> pumpActivation(
      WidgetTester tester,
    ) async {
      final result = ValueNotifier<bool?>(null);
      final (settings, _) = await pump(
        tester,
        Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () async {
                result.value = await showHandwritingActivation(context, course);
              },
              child: const Text('buka'),
            ),
          ),
        ),
      );
      return (settings, result);
    }

    testWidgets('model sudah ada → langsung aktif tanpa dialog', (
      tester,
    ) async {
      mockChannels(tester);
      final (settings, result) = await pumpActivation(tester);
      await tester.tap(find.text('buka'));
      await settle(tester);
      expect(find.text('Aktifkan Tulis Huruf?'), findsNothing);
      expect(result.value, isTrue);
      expect(settings.handwritingOn, isTrue);
    });

    testWidgets('dialog: kebutuhan vs perangkat, unduh Wi-Fi, lalu aktif', (
      tester,
    ) async {
      modelDownloaded = false;
      mockChannels(tester, totalRam: 2 * gb, freeStorage: 6 * gb);
      final (settings, result) = await pumpActivation(tester);
      await tester.tap(find.text('buka'));
      await settle(tester);

      expect(find.text('Aktifkan Tulis Huruf?'), findsOneWidget);
      expect(find.textContaining('Bahasa Jepang'), findsOneWidget);
      expect(find.textContaining('sekitar 30 MB'), findsOneWidget);
      // Kolom "Disarankan": RAM 3,0 GB & ruang 200 MB. RAM 2 GB hanya
      // peringatan (kuning), unduh tetap boleh.
      expect(find.text('3,0 GB'), findsOneWidget);
      expect(find.text('200 MB'), findsOneWidget);
      expect(find.text('2,0 GB !'), findsOneWidget);
      expect(find.text('mungkin lambat saat memuat'), findsOneWidget);
      expect(find.text('6,0 GB ✓'), findsOneWidget);
      expect(find.text('cukup'), findsOneWidget);
      expect(settings.handwritingOn, isFalse);

      await tester.tap(find.text('Unduh & aktifkan'));
      await settle(tester);
      expect(downloads.single['model'], 'ja');
      expect(downloads.single['wifi'], isTrue, reason: 'bawaan hanya Wi-Fi');
      expect(find.text('Aktifkan Tulis Huruf?'), findsNothing);
      expect(result.value, isTrue);
      expect(settings.handwritingOn, isTrue);
    });

    testWidgets('ruang kosong kurang → tombol unduh nonaktif dengan alasan', (
      tester,
    ) async {
      modelDownloaded = false;
      mockChannels(tester, freeStorage: 50 * mb);
      final (settings, result) = await pumpActivation(tester);
      await tester.tap(find.text('buka'));
      await settle(tester);

      expect(find.text('kosongkan sekitar 150 MB lagi'), findsOneWidget);
      final button = tester.widget<FilledButton>(
        find.widgetWithText(FilledButton, 'Unduh & aktifkan'),
      );
      expect(button.onPressed, isNull);
      await tester.tap(find.text('Batal'));
      await settle(tester);
      expect(result.value, isFalse);
      expect(settings.handwritingOn, isFalse);
      expect(downloads, isEmpty);
    });

    testWidgets('unduhan gagal → pesan, saklar tetap mati; bisa coba lagi', (
      tester,
    ) async {
      modelDownloaded = false;
      downloadOk = false;
      mockChannels(tester);
      final (settings, result) = await pumpActivation(tester);
      await tester.tap(find.text('buka'));
      await settle(tester);

      // Matikan "hanya Wi-Fi" lalu unduh → gagal.
      await tester.tap(find.byType(Checkbox));
      await tester.pump();
      expect(settings.handwritingWifiOnly, isFalse);
      await tester.tap(find.text('Unduh & aktifkan'));
      await settle(tester);
      expect(downloads.single['wifi'], isFalse);
      expect(find.textContaining('Unduhan gagal'), findsOneWidget);
      expect(find.text('Aktifkan Tulis Huruf?'), findsOneWidget);
      expect(settings.handwritingOn, isFalse);
      expect(result.value, isNull);

      // Coba lagi setelah jaringan pulih.
      downloadOk = true;
      await tester.tap(find.text('Unduh & aktifkan'));
      await settle(tester);
      expect(result.value, isTrue);
      expect(settings.handwritingOn, isTrue);
    });
  });
}
