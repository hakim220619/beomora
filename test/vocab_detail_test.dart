import 'package:beomora/data/en_exam_vocab.dart';
import 'package:beomora/data/jlpt_vocab.dart';
import 'package:beomora/data/study_guides.dart';
import 'package:beomora/data/vocab_examples.dart';
import 'package:beomora/models/course.dart';
import 'package:beomora/models/guide.dart';
import 'package:beomora/providers/auth_provider.dart';
import 'package:beomora/providers/settings_provider.dart';
import 'package:beomora/screens/materials/guide_detail_screen.dart';
import 'package:beomora/screens/materials/vocab_detail_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('setiap kosakata JLPT & ujian Inggris punya contoh + penggunaan', () {
    for (final w in [...jlptN5, ...jlptN4, ...jlptN3]) {
      final u = vocabUsageFor('ja', w.kana);
      expect(u, isNotNull, reason: w.kana);
      expect(u!.reading, isNotEmpty, reason: w.kana);
      expect(u.translation('id'), isNotEmpty, reason: w.kana);
      expect(u.translation('en'), isNotEmpty, reason: w.kana);
      expect(u.usage('id'), isNotEmpty, reason: w.kana);
      expect(u.sentence, isNot(matches(RegExp('[一-鿿]'))));
    }
    for (final w in [...academicVocab, ...ieltsVocab, ...toeicVocab]) {
      final u = vocabUsageFor('en', w.word);
      expect(u, isNotNull, reason: w.word);
      expect(u!.translation('id'), isNotEmpty, reason: w.word);
      expect(u.usage('en'), isNotEmpty, reason: w.word);
    }
  });

  test('UI Inggris di kursus Inggris: kalimat tanpa terjemahan ganda', () {
    final w = academicVocab.first;
    final d = vocabDetailOf(
      courseId: 'en',
      word: GuideExample(w.word, w.meaning, romaji: w.pron),
      uiLang: 'en',
    );
    expect(d.sentences, hasLength(1));
    expect(d.sentences.single.translation, isNull);
    expect(d.usage, isNotEmpty);
  });

  test('topik tematik: kalimat di topik yang memuat kata ikut tampil', () {
    final ja = kStudyGuides['ja']!.firstWhere((t) => t.id == 'vocab_farming');
    final hatake = ja.sections.first.examples.firstWhere(
      (e) => e.target == 'はたけ',
    );
    final d = vocabDetailOf(
      courseId: 'ja',
      word: hatake,
      uiLang: 'id',
      topic: ja,
    );
    expect(
      d.sentences.map((s) => s.text),
      contains('のうか は はたけ で はたらきます'),
    );

    final en = kStudyGuides['en']!.firstWhere(
      (t) => t.id == 'en_vocab_farming',
    );
    final seed = en.sections.first.examples.firstWhere(
      (e) => e.target == 'seed',
    );
    final d2 = vocabDetailOf(
      courseId: 'en',
      word: seed,
      uiLang: 'id',
      topic: en,
    );
    expect(
      d2.sentences.map((s) => s.text),
      contains('We plant seeds in the soil'),
    );
  });

  testWidgets('Materi: ketuk kata → lembar contoh kalimat', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    const course = Course(
      id: 'ja',
      name: {'id': 'Bahasa Jepang', 'en': 'Japanese'},
      flag: '🇯🇵',
      ttsLocale: 'ja-JP',
      units: [],
    );
    final topic = kStudyGuides['ja']!.firstWhere(
      (t) => t.id == 'vocab_farming',
    );
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SettingsProvider(prefs)),
          ChangeNotifierProvider(create: (_) => AuthProvider(prefs)),
        ],
        child: MaterialApp(
          home: GuideDetailScreen(
            course: course,
            topic: topic,
            ttsLocale: 'ja-JP',
          ),
        ),
      ),
    );
    await tester.ensureVisible(find.text('はたけ'));
    await tester.pump();
    await tester.tap(find.text('はたけ'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Contoh kalimat'), findsOneWidget);
    // Kalimat muncul di daftar topik dan sekali lagi di lembar detail.
    expect(find.text('のうか は はたけ で はたらきます'), findsNWidgets(2));
  });
}
