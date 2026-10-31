import 'package:beomora/models/course.dart';
import 'package:beomora/data/mcq_packs.dart';
import 'package:beomora/providers/progress_provider.dart';
import 'package:beomora/providers/settings_provider.dart';
import 'package:beomora/screens/practice/quiz_setup_screen.dart';
import 'package:beomora/screens/practice/letter_quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  const course = Course(
    id: 'ja',
    name: {'id': 'Bahasa Jepang', 'en': 'Japanese'},
    flag: '🇯🇵',
    ttsLocale: 'ja-JP',
    units: [],
  );

  testWidgets('tombol Mulai membuka kuis dengan jumlah soal pilihan', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => SettingsProvider(prefs),
        child: const MaterialApp(home: KanaMixScreen(course: course)),
      ),
    );

    await tester.tap(find.text('10'));
    await tester.pump();
    await tester.scrollUntilVisible(find.text('Mulai'), 100);
    await tester.tap(find.text('Mulai'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.byType(LetterQuizScreen), findsOneWidget);
    expect(find.text('1/10'), findsOneWidget);
  });

  Future<ProgressProvider> pumpWith(
    WidgetTester tester,
    Widget screen, {
    bool premium = false,
  }) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final progress = ProgressProvider(prefs)..setPremium(premium);
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SettingsProvider(prefs)),
          ChangeNotifierProvider.value(value: progress),
        ],
        child: MaterialApp(home: screen),
      ),
    );
    return progress;
  }

  Future<void> start(WidgetTester tester) async {
    await tester.scrollUntilVisible(find.text('Mulai'), 100);
    await tester.tap(find.text('Mulai'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
  }

  testWidgets('Tebak Kanji: pengguna gratis dibatasi, premium bebas', (
    tester,
  ) async {
    final progress = await pumpWith(
      tester,
      const KanjiQuizScreen(course: course),
    );
    // Gratis: maksimal kFreeMcqLimit soal, ada ajakan Premium.
    expect(find.text('$kFreeMcqLimit soal'), findsOneWidget);
    expect(find.textContaining('Premium bebas pilih'), findsOneWidget);

    progress.setPremium(true);
    await tester.pump();
    expect(find.textContaining('Premium bebas pilih'), findsNothing);
    await tester.tap(find.text('30'));
    await tester.pump();
    await start(tester);
    expect(find.byType(LetterQuizScreen), findsOneWidget);
    expect(find.text('1/30'), findsOneWidget);
  });

  testWidgets('Tebak Kata: pilih level, soal berisi arti kata', (tester) async {
    await pumpWith(tester, const WordQuizScreen(course: course), premium: true);
    expect(find.text('Level JLPT'), findsOneWidget);
    await tester.tap(find.text('N4'));
    await tester.pump();
    await tester.tap(find.text('20'));
    await tester.pump();
    await start(tester);
    expect(find.text('1/20'), findsOneWidget);
    expect(
      find.textContaining(RegExp('Apa artinya|Yang mana katanya')),
      findsOneWidget,
    );
  });

  testWidgets(
    'Tebak Kanji: jenis soal "Baca kata" saja → soal cara baca kata',
    (tester) async {
      await pumpWith(
        tester,
        const KanjiQuizScreen(course: course),
        premium: true,
      );
      expect(find.text('Jenis soal'), findsOneWidget);
      // Matikan Arti & Bacaan, sisakan Baca kata.
      await tester.tap(find.text('Arti'));
      await tester.pump();
      await tester.tap(find.text('Bacaan on/kun'));
      await tester.pump();
      await tester.tap(find.text('10'));
      await tester.pump();
      await start(tester);
      expect(find.text('1/10'), findsOneWidget);
      expect(
        find.textContaining(
          RegExp('Bagaimana cara baca kata ini|Yang mana tulisan kanjinya'),
        ),
        findsOneWidget,
      );
      expect(find.textContaining('Apa arti kanji ini'), findsNothing);
    },
  );
}
