import 'package:beomora/data/exam_blueprints.dart';
import 'package:beomora/models/course.dart';
import 'package:beomora/providers/progress_provider.dart';
import 'package:beomora/providers/settings_provider.dart';
import 'package:beomora/screens/practice/exam_list_screen.dart';
import 'package:beomora/screens/practice/exam_screen.dart';
import 'package:beomora/widgets/choice_card.dart';
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

  // Tiruan kanal flutter_tts: semua metode langsung sukses.
  void mockTts(WidgetTester tester) {
    const ch = MethodChannel('flutter_tts');
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      ch,
      (_) async => 1,
    );
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        ch,
        null,
      ),
    );
  }

  Future<ProgressProvider> pump(WidgetTester tester, Widget screen) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.reset);
    mockTts(tester);
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

  /// Gulir sampai [text] terlihat lalu ketuk (tombol ada di dasar daftar).
  Future<void> tapText(WidgetTester tester, String text) async {
    await tester.scrollUntilVisible(
      find.text(text),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text(text));
    await tester.pump();
  }

  /// Jawab soal aktif: ketuk pilihan pertama, atau ketik pada soal tulis.
  Future<void> answerCurrent(WidgetTester tester) async {
    final field = find.byType(TextField);
    if (field.evaluate().isNotEmpty) {
      await tester.enterText(field, 'jawaban');
    } else {
      await tester.tap(find.byType(ChoiceCard).first);
    }
    await tester.pump();
  }

  /// Kerjakan satu bagian sampai tombol "SELESAI BAGIAN" ditekan.
  Future<int> workSection(WidgetTester tester) async {
    var n = 0;
    while (true) {
      await answerCurrent(tester);
      n++;
      if (find.text('SELESAI BAGIAN').evaluate().isNotEmpty) {
        await tapText(tester, 'SELESAI BAGIAN');
        return n;
      }
      await tapText(tester, 'BERIKUTNYA');
    }
  }

  testWidgets('gratis: hanya ujian mini; jalan sampai hasil & simpan XP', (
    tester,
  ) async {
    final exam = examById('en_toefl')!;
    final progress = await pump(
      tester,
      ExamIntroScreen(course: course, exam: exam),
    );
    final xpBefore = progress.xp;

    expect(find.text('MULAI UJIAN PENUH'), findsNothing);
    expect(find.text('UJIAN MINI (10 SOAL)'), findsOneWidget);
    expect(find.text('Struktur ujian'), findsOneWidget);
    expect(find.text('Membaca'), findsOneWidget);
    expect(find.text('Mendengar'), findsOneWidget);
    expect(find.text('Menulis'), findsOneWidget);

    await tapText(tester, 'UJIAN MINI (10 SOAL)');
    await tester.pump(const Duration(milliseconds: 400));
    expect(find.byType(ExamScreen), findsOneWidget);

    var total = 0;
    for (var s = 1; s <= exam.sections.length; s++) {
      expect(find.text('Bagian $s dari ${exam.sections.length}'), findsOne);
      await tapText(tester, 'MULAI BAGIAN');
      // Timer tampil selama bagian berjalan.
      expect(find.byIcon(Icons.timer_outlined), findsOneWidget);
      total += await workSection(tester);
    }
    expect(total, kFreeExamQuestions);

    // Hasil: judul, XP, tabel per bagian, tanpa perkiraan skor (mini).
    expect(find.text('Hasil Ujian'), findsOneWidget);
    expect(find.textContaining('+'), findsWidgets);
    expect(find.text('Perkiraan skor'), findsNothing);
    expect(progress.xp, greaterThan(xpBefore));
    expect(progress.examBest['en_toefl_mini'], isNotNull);
    expect(progress.examBest['en_toefl_mini']!['pct'], isA<int>());
    await tester.scrollUntilVisible(
      find.text('ULANGI'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('ULANGI'), findsOneWidget);
  });

  testWidgets('premium: ujian penuh, waktu habis menutup bagian otomatis', (
    tester,
  ) async {
    final exam = examById('ja_n5')!;
    final progress = await pump(
      tester,
      ExamIntroScreen(course: course, exam: exam),
    );
    progress.setPremium(true);
    await tester.pump();
    expect(find.text('MULAI UJIAN PENUH'), findsOneWidget);
    expect(find.textContaining('bukan bagian JLPT resmi'), findsOneWidget);

    await tapText(tester, 'MULAI UJIAN PENUH');
    await tester.pump(const Duration(milliseconds: 400));
    expect(find.text('Bagian 1 dari 5'), findsOneWidget);
    expect(find.text('35 soal · 20 menit'), findsOneWidget);
    await tapText(tester, 'MULAI BAGIAN');
    expect(find.text('1/35'), findsOneWidget);
    expect(find.text('20:00'), findsOneWidget);

    // Biarkan waktu habis → bagian 2 dibuka otomatis.
    await tester.pump(const Duration(minutes: 20));
    await tester.pump();
    expect(find.text('Waktu habis! Bagian ini ditutup.'), findsOneWidget);
    expect(find.text('Bagian 2 dari 5'), findsOneWidget);
  });

  testWidgets('keluar di tengah ujian minta konfirmasi', (tester) async {
    final exam = examById('en_pte')!;
    await pump(tester, ExamScreen(course: course, exam: exam, mini: true));
    await tester.tap(find.text('MULAI BAGIAN'));
    await tester.pump();

    final nav = tester.state<NavigatorState>(find.byType(Navigator));
    nav.maybePop();
    await tester.pump(const Duration(milliseconds: 400));
    expect(find.text('Keluar dari ujian?'), findsOneWidget);
    await tester.tap(find.text('Batal'));
    await tester.pump(const Duration(milliseconds: 400));
    expect(find.byType(ExamScreen), findsOneWidget);
  });
}
