import 'package:beomora/data/en_grammar.dart';
import 'package:beomora/data/study_guides.dart';
import 'package:beomora/data/vocab_examples.dart';
import 'package:beomora/models/guide.dart';
import 'package:beomora/providers/settings_provider.dart';
import 'package:beomora/screens/materials/vocab_detail_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('kata fungsi dikenali, termasuk huruf besar & tanda baca', () {
    final w = enFunctionWordsOf('The keys are on the table, in the kitchen.');
    expect(
      [for (final x in w) x?.cls],
      [
        EnWordClass.article,
        null,
        EnWordClass.auxiliary,
        EnWordClass.preposition,
        EnWordClass.article,
        null,
        EnWordClass.preposition,
        EnWordClass.article,
        null,
      ],
    );
  });

  test('bentuk kosakata di kalimat', () {
    expect(enVocabIn('The researchers analyzed the data.', 'analyze'), (
      2,
      EnWordForm.past,
    ));
    expect(enVocabIn('We plant seeds in spring.', 'seed')?.$2, EnWordForm.s);
    expect(enVocabIn('She studied hard.', 'study')?.$2, EnWordForm.past);
    expect(enVocabIn('He is running late.', 'run')?.$2, EnWordForm.ing);
    expect(enVocabIn('I bought a car.', 'buy')?.$2, EnWordForm.past);
    expect(enVocabIn('Take a seat.', 'seat')?.$2, EnWordForm.base);
    expect(enVocabIn('Nothing here.', 'seat'), isNull);
  });

  test('tense: kasus sulit', () {
    expect(
      enTenseOf('Rural areas often have limited access to care.'),
      EnTense.simplePresent,
    );
    expect(enTenseOf('The book is interesting.'), EnTense.simplePresent);
    expect(
      enTenseOf('The results will be announced soon.'),
      EnTense.simpleFuture,
    );
    expect(enTenseOf('It\'s been a long day.'), EnTense.presentPerfect);
    expect(enTenseOf('The government set up a commission.'), isNull);
    expect(enTenseOf('Wash the vegetables before cooking.'), isNull);
    expect(enTenseOf('You should drink more water.'), isNull);
    expect(enTenseOf('Always warm up before you go running.'), isNull);
  });

  test('contoh Materi Tenses dikenali sesuai bagiannya', () {
    final topic = kStudyGuides['en']!.firstWhere((t) => t.id == 'en_tenses');
    expect(topic.sections, hasLength(EnTense.values.length));
    for (final tense in EnTense.values) {
      final section = topic.sections[tense.sectionIndex];
      expect(section.title['en'], startsWith(tense.label));
      for (final ex in section.examples) {
        final got = enTenseOf(ex.target);
        // Boleh tanpa label (ragu), tapi tidak boleh salah tense.
        expect(
          got == null || got == tense,
          isTrue,
          reason: '${ex.target} → $got',
        );
      }
    }
  });

  test('sebagian besar contoh kosakata Inggris mendapat label tense', () {
    final s = [for (final u in vocabUsageEn.values) u.sentence];
    final labeled = s.where((x) => enTenseOf(x) != null).length;
    expect(labeled / s.length, greaterThan(0.6));
  });

  testWidgets('lembar kosakata Inggris: kosakata, kata fungsi & tense', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => SettingsProvider(prefs),
        child: MaterialApp(
          home: Builder(
            builder: (context) => TextButton(
              onPressed: () => showVocabDetail(
                context,
                courseId: 'en',
                ttsLocale: 'en-US',
                word: const GuideExample('analyze', {
                  'id': 'menganalisis',
                  'en': 'analyze',
                }),
              ),
              child: const Text('buka'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('buka'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Simple Past'), findsOneWidget);
    expect(
      find.textContaining(
        'bentuk lampau (V2) dari "analyze"',
        findRichText: true,
      ),
      findsOneWidget,
    );
    expect(find.textContaining('● the', findRichText: true), findsOneWidget);

    // Ketuk label tense → penjelasan Simple Past.
    await tester.tap(find.text('Simple Past'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(find.textContaining('S + did + not + V1'), findsOneWidget);
  });
}
