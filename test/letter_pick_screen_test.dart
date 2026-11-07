import 'package:beomora/data/question_bank.dart';
import 'package:beomora/data/study_guides.dart';
import 'package:beomora/models/course.dart';
import 'package:beomora/providers/auth_provider.dart';
import 'package:beomora/providers/progress_provider.dart';
import 'package:beomora/providers/settings_provider.dart';
import 'package:beomora/screens/practice/letter_pick_screen.dart';
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

  Future<void> pump(WidgetTester tester, String id) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2;
    addTearDown(tester.view.reset);
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final cat = letterQuizFor('ja').firstWhere((c) => c.id == id);
    final topic = kStudyGuides['ja']!.firstWhere((t) => t.id == id);
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SettingsProvider(prefs)),
          ChangeNotifierProvider(create: (_) => AuthProvider(prefs)),
          ChangeNotifierProvider(
            create: (_) => ProgressProvider(prefs)..setPremium(true),
          ),
        ],
        child: MaterialApp(
          home: LetterPickScreen(course: course, category: cat, topic: topic),
        ),
      ),
    );
  }

  testWidgets('hiragana: kelompok per bagian, centang huruf, lalu kuis', (
    tester,
  ) async {
    await pump(tester, 'hiragana');
    expect(find.text('Gojūon (46 huruf dasar)'), findsOneWidget);
    expect(find.text('0 huruf'), findsOneWidget);

    await tester.tap(find.text('あ'));
    await tester.tap(find.text('い'));
    await tester.pump();
    expect(find.text('2 huruf'), findsOneWidget);
    expect(find.text('2/46'), findsOneWidget);

    await tester.tap(find.byTooltip('Pilih semua'));
    await tester.pump();
    expect(find.text('104 huruf'), findsOneWidget);
    await tester.tap(find.byTooltip('Kosongkan'));
    await tester.pump();
    expect(find.text('0 huruf'), findsOneWidget);

    // Centang satu bagian lewat kotak centangnya.
    await tester.tap(find.byType(Checkbox).first);
    await tester.pump();
    expect(find.text('46 huruf'), findsOneWidget);

    await tester.tap(find.text('Lanjut'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.widgetWithText(ChoiceChip, '20'));
    await tester.pump();
    await tester.tap(find.text('Mulai'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    final quiz = tester.widget<LetterQuizScreen>(find.byType(LetterQuizScreen));
    expect(quiz.questionCount, 20);
    expect(quiz.customCategory!.items, hasLength(46));
    expect(quiz.customCategory!.distractors, hasLength(104));
  });

  testWidgets('kanji N5: semua kanji masuk kelompok bagian Materi', (
    tester,
  ) async {
    await pump(tester, 'kanji_n5');
    await tester.tap(find.byTooltip('Pilih semua'));
    await tester.pump();
    expect(find.text('100 huruf'), findsOneWidget);
    expect(find.text('Lainnya'), findsNothing);
  });
}
