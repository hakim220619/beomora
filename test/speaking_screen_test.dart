import 'dart:convert';

import 'package:beomora/models/course.dart';
import 'package:beomora/providers/progress_provider.dart';
import 'package:beomora/providers/settings_provider.dart';
import 'package:beomora/screens/practice/speaking_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _sentence = SentenceItem(
  target: 'Thank you very much',
  tokens: ['Thank', 'you', 'very', 'much'],
  meaning: {'id': 'Terima kasih banyak', 'en': 'big thanks'},
);

CourseUnit _unit(String id, String title) => CourseUnit(
  id: id,
  title: {'id': title, 'en': title},
  color: '#58CC02',
  icon: '👋',
  lessons: const [
    Lesson(
      id: 'l1',
      title: {'id': 'L1', 'en': 'L1'},
      words: [],
      sentences: [_sentence],
    ),
  ],
);

/// Layar punya animasi pensil yang terus berjalan, jadi pumpAndSettle
/// tidak pernah selesai; cukup majukan waktu beberapa langkah.
Future<void> settle(WidgetTester tester) async {
  for (var i = 0; i < 6; i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
}

void main() {
  late SharedPreferences prefs;
  final course = Course(
    id: 'en',
    name: const {'id': 'Bahasa Inggris', 'en': 'English'},
    flag: '🇬🇧',
    ttsLocale: 'en-US',
    units: [
      _unit('u1', 'Salam'),
      _unit('u2', 'Keluarga'),
      _unit('u3', 'Makan'),
    ],
  );

  const sttChannel = MethodChannel('plugin.csdcorp.com/speech_to_text');
  final calls = <String>[];
  final pushes = <Route<dynamic>>[];

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
  });

  void mockPlatform(WidgetTester tester) {
    calls.clear();
    final messenger = tester.binding.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(sttChannel, (call) async {
      calls.add(call.method);
      switch (call.method) {
        case 'locales':
          return ['en_US:English (United States)'];
        case 'has_permission':
        case 'initialize':
        case 'listen':
          return true;
      }
      return null;
    });
    // flutter_tts: semua panggilan langsung sukses.
    messenger.setMockMethodCallHandler(
      const MethodChannel('flutter_tts'),
      (_) async => 1,
    );
    addTearDown(() {
      messenger.setMockMethodCallHandler(sttChannel, null);
      messenger.setMockMethodCallHandler(
        const MethodChannel('flutter_tts'),
        null,
      );
    });
  }

  Future<void> send(WidgetTester tester, String method, Object? args) =>
      tester.binding.defaultBinaryMessenger.handlePlatformMessage(
        sttChannel.name,
        sttChannel.codec.encodeMethodCall(MethodCall(method, args)),
        (_) {},
      );

  /// Mesin pengenal suara mengirim hasil akhir (atau sementara) [words].
  Future<void> recognize(
    WidgetTester tester,
    List<String> words, {
    bool isFinal = true,
  }) async {
    await send(
      tester,
      'textRecognition',
      jsonEncode({
        'alternates': [
          for (final w in words) {'recognizedWords': w, 'confidence': 0.9},
        ],
        'resultType': isFinal ? 2 : 0,
      }),
    );
    await settle(tester);
  }

  /// Mesin mengirim status ('listening', 'notListening', 'done').
  Future<void> status(WidgetTester tester, String s) async {
    await send(tester, 'notifyStatus', s);
    await tester.pump();
  }

  Future<ProgressProvider> pump(WidgetTester tester) async {
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
        child: MaterialApp(
          home: SpeakingScreen(course: course),
          navigatorObservers: [_PushCounter(pushes)],
        ),
      ),
    );
    await tester.pump();
    return progress;
  }

  testWidgets('ucapan salah ditandai, coba lagi sampai lulus, dapat XP', (
    tester,
  ) async {
    mockPlatform(tester);
    final progress = await pump(tester);
    final xpBefore = progress.xp;

    // Pengguna gratis: unit setelah kFreeSpeakingUnits bermahkota.
    expect(find.text('Pilih unit'), findsOneWidget);
    expect(find.text('👑'), findsWidgets);

    await tester.tap(find.text('1. Salam'));
    await settle(tester);
    expect(find.text('Ucapkan kalimat ini'), findsOneWidget);
    expect(find.text('very'), findsOneWidget);

    // Percobaan 1: satu kata keliru.
    await tester.tap(find.byIcon(Icons.mic_rounded));
    await settle(tester);
    expect(calls, contains('listen'));
    await recognize(tester, ['thank you berry much']);
    expect(find.text('75%'), findsOneWidget);
    expect(find.textContaining('berry'), findsOneWidget);
    final very = tester.widget<Text>(find.text('very'));
    expect(
      very.style?.color,
      isNot(equals(tester.widget<Text>(find.text('much')).style?.color)),
    );

    // Percobaan 2: benar.
    await tester.tap(find.byIcon(Icons.mic_rounded));
    await settle(tester);
    await recognize(tester, ['Thank you very much']);
    expect(find.text('100%'), findsOneWidget);

    await tester.tap(find.text('Selesai'));
    await settle(tester);
    expect(progress.xp, greaterThan(xpBefore));

    // Habiskan timer internal plugin (batas waktu hasil akhir, konfeti).
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(seconds: 30));
  });

  testWidgets('hasil akhir yang datang setelah notListening tetap dinilai', (
    tester,
  ) async {
    mockPlatform(tester);
    await pump(tester);
    await tester.tap(find.text('1. Salam'));
    await settle(tester);

    await tester.tap(find.byIcon(Icons.mic_rounded));
    await settle(tester);
    // Status "berhenti" sisa sesi lama sebelum sesi baru mulai: abaikan.
    await status(tester, 'notListening');
    await settle(tester);
    expect(
      find.text('Suaramu tidak terdengar, coba lagi lebih dekat'),
      findsNothing,
    );

    // Urutan khas Android: notListening dulu, hasil akhir menyusul.
    await status(tester, 'listening');
    await status(tester, 'notListening');
    await tester.pump(const Duration(milliseconds: 400));
    await recognize(tester, ['Thank you very much']);
    expect(find.text('100%'), findsOneWidget);

    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(seconds: 30));
  });

  testWidgets('berhenti otomatis saat diam atau ucapan sudah tepat', (
    tester,
  ) async {
    mockPlatform(tester);
    await pump(tester);
    await tester.tap(find.text('1. Salam'));
    await settle(tester);

    // Diam setelah sebagian kalimat → mesin diminta berhenti.
    await tester.tap(find.byIcon(Icons.mic_rounded));
    await settle(tester);
    calls.clear();
    await recognize(tester, ['thank you'], isFinal: false);
    expect(calls, isNot(contains('stop')));
    await tester.pump(const Duration(milliseconds: 1300));
    expect(calls, contains('stop'));
    await recognize(tester, ['thank you']);

    // Ucapan sementara sudah tepat → langsung berhenti tanpa menunggu.
    await tester.tap(find.byIcon(Icons.mic_rounded));
    await settle(tester);
    calls.clear();
    await send(
      tester,
      'textRecognition',
      jsonEncode({
        'alternates': [
          {'recognizedWords': 'Thank you very much', 'confidence': 0.9},
        ],
        'resultType': 0,
      }),
    );
    await tester.pump();
    expect(calls, contains('stop'));

    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(seconds: 30));
  });

  testWidgets('unit terkunci membuka halaman Premium', (tester) async {
    mockPlatform(tester);
    await pump(tester);
    pushes.clear();
    await tester.tap(find.text('3. Makan'));
    await tester.pump();
    // PremiumScreen butuh AuthProvider yang tidak dipasang di test ini.
    tester.takeException();
    expect(pushes, hasLength(1));
    expect(find.text('Ucapkan kalimat ini'), findsNothing);
  });
}

class _PushCounter extends NavigatorObserver {
  final List<Route<dynamic>> pushes;
  _PushCounter(this.pushes);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute != null) pushes.add(route);
  }
}
