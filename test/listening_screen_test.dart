import 'package:beomora/data/listening_bank.dart';
import 'package:beomora/models/listening.dart';
import 'package:beomora/models/course.dart';
import 'package:beomora/providers/progress_provider.dart';
import 'package:beomora/providers/settings_provider.dart';
import 'package:beomora/screens/practice/listening_screen.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferences prefs;
  const course = Course(
    id: 'en',
    name: {'id': 'Bahasa Inggris', 'en': 'English'},
    flag: '🇬🇧',
    ttsLocale: 'en-US',
    units: [],
  );

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
  });

  // Tiruan kanal flutter_tts: semua metode langsung sukses, kecuali
  // 'speak' yang menggantung (seperti engine sungguhan) sampai 'stop'
  // dipanggil atau [finishSpeak]. Tanpa tiruan ini kanal tak pernah
  // menjawab di lingkungan test, jadi status "memutar" menggantung.
  const ttsChannel = MethodChannel('flutter_tts');
  Completer<void>? speakDone;
  final spoken = <String>[];
  var rejectNextSpeak = false; // 'speak' berikutnya dijawab 0 (dibuang)
  void mockTts(WidgetTester tester) {
    spoken.clear(); // daftar dipakai bersama antar tes; mulai bersih
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(ttsChannel, (
      call,
    ) async {
      switch (call.method) {
        case 'speak':
          spoken.add(
            call.arguments is Map
                ? (call.arguments as Map)['text'] as String
                : call.arguments as String,
          );
          if (rejectNextSpeak) {
            rejectNextSpeak = false;
            return 0;
          }
          speakDone = Completer<void>();
          await speakDone!.future;
        case 'stop':
          if (!(speakDone?.isCompleted ?? true)) speakDone!.complete();
      }
      return 1;
    });
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        ttsChannel,
        null,
      ),
    );
  }

  void finishSpeak() {
    if (!(speakDone?.isCompleted ?? true)) speakDone!.complete();
  }

  /// Engine melapor sedang mengucapkan kata di offset [start] dari [text].
  Future<void> reportProgress(
    WidgetTester tester,
    String text,
    int start,
  ) async {
    await tester.binding.defaultBinaryMessenger.handlePlatformMessage(
      ttsChannel.name,
      ttsChannel.codec.encodeMethodCall(
        MethodCall('speak.onProgress', {
          'text': text,
          'start': '$start',
          'end': '${start + 1}',
          'word': text.substring(start, start + 1),
        }),
      ),
      (_) {},
    );
  }

  Future<ProgressProvider> pump(WidgetTester tester, Widget screen) async {
    // Layar setinggi ponsel agar semua pilihan & baris bacaan ter-render.
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.reset);
    final progress = ProgressProvider(prefs);
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SettingsProvider(prefs)),
          ChangeNotifierProvider.value(value: progress),
        ],
        child: MaterialApp(home: screen),
      ),
    );
    await tester.pump();
    return progress;
  }

  testWidgets('paket dasar: buka bacaan, jawab semua soal, dapat XP', (
    tester,
  ) async {
    final pack = listeningPacksFor('en').first; // Listening Dasar, gratis
    final progress = await pump(
      tester,
      ListeningScreen(course: course, pack: pack),
    );
    final xpBefore = progress.xp;

    // Daftar bacaan tampil tanpa gembok.
    expect(find.text('Pilih bacaan'), findsOneWidget);
    expect(find.byIcon(Icons.lock_rounded), findsNothing);

    // Buka bacaan pertama → pemutar + soal pertama.
    await tester.tap(find.text(pack.passages.first.title['id']!));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));
    expect(find.text('Putar bebas'), findsOneWidget);
    expect(find.text('1/3'), findsOneWidget);

    // Jawab benar semua. Soal diambil acak dari bank bacaan, jadi cari
    // jawaban benar (pilihan pertama di data) yang sedang tampil di layar.
    final answers = pack.passages.first.questions
        .map((q) => q.options.first)
        .toList();
    for (var i = 0; i < kListeningQuestionsPerRound; i++) {
      final shown = answers
          .where((a) => find.text(a).evaluate().isNotEmpty)
          .toList();
      expect(shown, hasLength(1), reason: 'soal ke-${i + 1}: $shown');
      await tester.tap(find.text(shown.single));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 1000));
    }

    // Hasil: transkrip terbuka, XP bertambah (5 dasar + 2 per benar).
    expect(find.text('Transkrip'), findsOneWidget);
    expect(
      find.textContaining(pack.passages.first.transcript.substring(0, 20)),
      findsWidgets,
    );
    expect(progress.xp - xpBefore, greaterThanOrEqualTo(5 + 3 * 2));
  });

  testWidgets('paket premium: bacaan ke-3 dst. bergembok untuk non-premium', (
    tester,
  ) async {
    final pack = listeningPacksFor('en')[1]; // TOEFL, premium
    await pump(tester, ListeningScreen(course: course, pack: pack));
    expect(
      find.byIcon(Icons.lock_rounded),
      findsNWidgets(pack.passages.length - 2),
    );
    expect(find.textContaining('Versi gratis'), findsOneWidget);
  });

  testWidgets('paket ujian: batas putar berkurang setelah pemutaran', (
    tester,
  ) async {
    final pack = listeningPacksFor('en')[1]; // TOEFL, maxPlays 2
    await pump(tester, ListeningScreen(course: course, pack: pack));
    await tester.tap(find.text(pack.passages.first.title['id']!));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));
    // Putar otomatis sekali saat dibuka → sisa 1.
    expect(find.text('1 sisa putar'), findsOneWidget);
    // Mode ujian: garis progres hanya tampilan, tidak bisa digeser.
    expect(find.byType(Slider), findsNothing);
    expect(find.byType(LinearProgressIndicator), findsOneWidget);

    // Jeda di awal (belum ada progres) lalu putar lagi → jatah habis.
    await tester.tap(find.byIcon(Icons.pause_rounded));
    await tester.pump();
    expect(find.text('Putar lagi'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.play_arrow_rounded));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.pause_rounded));
    await tester.pump();
    expect(find.text('Batas putar habis'), findsOneWidget);
  });

  testWidgets('jeda menyimpan posisi; lanjutkan mulai dari kata terakhir', (
    tester,
  ) async {
    mockTts(tester);
    final pack = listeningPacksFor('en')[1]; // TOEFL, maxPlays 2
    await pump(tester, ListeningScreen(course: course, pack: pack));
    final transcript = pack.passages.first.transcript;
    await tester.tap(find.text(pack.passages.first.title['id']!));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));
    expect(spoken, [transcript]);
    // Waktu berjalan 0:00, total masih perkiraan (~).
    expect(find.textContaining('0:00 / ~'), findsOneWidget);

    // 2 detik berjalan, lalu engine melapor sampai kata di tengah bacaan.
    await tester.pump(const Duration(seconds: 2));
    expect(find.textContaining('0:02 / ~'), findsOneWidget);
    final mid = transcript.indexOf(' ', transcript.length ~/ 2) + 1;
    await reportProgress(tester, transcript, mid);
    await tester.pump();
    // Total dikalibrasi dari kecepatan nyata: 2 detik untuk separuh teks.
    final estS = (2000 * transcript.length / mid / 1000).round();
    expect(
      find.text(
        '0:02 / ~${estS ~/ 60}:${(estS % 60).toString().padLeft(2, '0')}',
      ),
      findsOneWidget,
    );

    // Jeda → tombol jadi "Lanjutkan", jatah tidak berkurang (masih 1),
    // dan waktu berhenti berjalan.
    await tester.tap(find.byIcon(Icons.pause_rounded));
    await tester.pump();
    expect(find.text('Lanjutkan'), findsOneWidget);
    expect(find.text('1 sisa putar'), findsOneWidget);
    await tester.pump(const Duration(seconds: 1));
    expect(find.textContaining('0:02 / ~'), findsOneWidget);

    // Lanjutkan → yang dibacakan hanya sisa teks dari posisi jeda, waktu
    // berjalan lagi dari 0:02.
    await tester.tap(find.byIcon(Icons.play_arrow_rounded));
    await tester.pump();
    expect(spoken.last, transcript.substring(mid));
    expect(find.text('1 sisa putar'), findsOneWidget);
    await tester.pump(const Duration(seconds: 1));
    expect(find.textContaining('0:03 / ~'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.pause_rounded));
    await tester.pump();

    // "Dari awal" memakai jatah terakhir; selesai penuh setelah 4 detik →
    // durasi nyata dikunci (tanpa ~) dan jatah habis.
    await tester.tap(find.byIcon(Icons.replay_rounded));
    await tester.pump();
    expect(spoken.last, transcript);
    expect(find.text('0 sisa putar'), findsNothing);
    await tester.pump(const Duration(seconds: 4));
    finishSpeak();
    await tester.pump();
    expect(find.text('0:04 / 0:04'), findsOneWidget);
    expect(find.text('Batas putar habis'), findsOneWidget);
  });

  testWidgets(
    'engine tanpa laporan kata: jeda tetap lanjut dari perkiraan waktu',
    (tester) async {
      mockTts(tester);
      final pack = listeningPacksFor('en')[1]; // TOEFL, maxPlays 2
      await pump(tester, ListeningScreen(course: course, pack: pack));
      final transcript = pack.passages.first.transcript;
      await tester.tap(find.text(pack.passages.first.title['id']!));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));
      expect(spoken, [transcript]);

      // Tidak ada speak.onProgress sama sekali, hanya waktu yang berjalan.
      await tester.pump(const Duration(seconds: 3));
      await tester.tap(find.byIcon(Icons.pause_rounded));
      await tester.pump();
      expect(find.text('Lanjutkan'), findsOneWidget);
      expect(find.text('1 sisa putar'), findsOneWidget);

      // Lanjutkan → mulai dari tengah (bukan dari awal), di batas kata.
      await tester.tap(find.byIcon(Icons.play_arrow_rounded));
      await tester.pump();
      expect(spoken.length, 2);
      expect(spoken.last, isNot(transcript));
      expect(spoken.last, isNotEmpty);
      expect(transcript.endsWith(spoken.last), isTrue);
      expect(transcript[transcript.length - spoken.last.length - 1], ' ');
      expect(find.text('1 sisa putar'), findsOneWidget);
    },
  );

  testWidgets('engine membuang ucapan (hasil 0): posisi & jatah ditahan', (
    tester,
  ) async {
    mockTts(tester);
    final pack = listeningPacksFor('en')[1]; // TOEFL, maxPlays 2
    await pump(tester, ListeningScreen(course: course, pack: pack));
    final transcript = pack.passages.first.transcript;
    await tester.tap(find.text(pack.passages.first.title['id']!));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));
    final mid = transcript.indexOf(' ', transcript.length ~/ 2) + 1;
    await reportProgress(tester, transcript, mid);
    await tester.tap(find.byIcon(Icons.pause_rounded));
    await tester.pump();

    // Engine menjawab 0 (dibuang) saat lanjutkan → tetap "Lanjutkan".
    rejectNextSpeak = true;
    await tester.tap(find.byIcon(Icons.play_arrow_rounded));
    await tester.pump();
    expect(find.text('Lanjutkan'), findsOneWidget);
    expect(find.text('1 sisa putar'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.play_arrow_rounded));
    await tester.pump();
    expect(spoken.last, transcript.substring(mid));
  });

  testWidgets('premium: paket ujian jadi putar bebas dan garis bisa digeser', (
    tester,
  ) async {
    final pack = listeningPacksFor('en')[1]; // TOEFL, maxPlays 2
    final progress = await pump(
      tester,
      ListeningScreen(course: course, pack: pack),
    );
    progress.setPremium(true);
    await tester.pump();

    // Header paket tidak lagi menyebut batas putar.
    expect(find.text('Putar bebas'), findsOneWidget);
    expect(find.textContaining('putar per bacaan'), findsNothing);

    // Semua bacaan terbuka, tanpa gembok.
    expect(find.byIcon(Icons.lock_rounded), findsNothing);

    await tester.tap(find.text(pack.passages.first.title['id']!));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));
    expect(find.text('Putar bebas'), findsOneWidget);
    expect(find.textContaining('sisa putar'), findsNothing);
    // Putar bebas: garis progres berupa slider yang bisa digeser.
    expect(find.byType(Slider), findsOneWidget);
    // Jeda lalu putar berulang kali: tidak pernah "Batas putar habis".
    for (var i = 0; i < 3; i++) {
      await tester.tap(find.byIcon(Icons.pause_rounded));
      await tester.pump();
      expect(find.text('Putar lagi'), findsOneWidget);
      await tester.tap(find.byIcon(Icons.play_arrow_rounded));
      await tester.pump();
    }
    expect(find.text('Batas putar habis'), findsNothing);
    expect(find.text('Putar bebas'), findsOneWidget);
  });
}
