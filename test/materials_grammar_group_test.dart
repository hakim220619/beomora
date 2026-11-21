import 'package:beomora/data/study_guides.dart';
import 'package:beomora/models/course.dart';
import 'package:beomora/models/guide.dart';
import 'package:beomora/providers/progress_provider.dart';
import 'package:beomora/providers/settings_provider.dart';
import 'package:beomora/screens/materials/materials_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> _ids(List<GuideTopic> topics) => [for (final t in topics) t.id];

void main() {
  List<GuideTopic> nonVocab(String c) => [
    for (final t in kStudyGuides[c]!)
      if (!t.id.contains('vocab')) t,
  ];

  group('Materi: topik tata bahasa dikelompokkan', () {
    test('Mandarin: pinyin, frasa, angka tetap; 16 topik tata bahasa', () {
      final (:core, :grammar) = splitMaterialTopics(nonVocab('zh'));
      expect(_ids(core), ['pinyin', 'zh_phrases', 'zh_numbers']);
      expect(grammar.length, 16);
      expect(_ids(grammar).first, 'zh_grammar');
    });

    test('Korea & Jerman: huruf/frasa/angka tetap di luar', () {
      expect(_ids(splitMaterialTopics(nonVocab('ko')).core), [
        'hangul',
        'ko_phrases',
        'ko_numbers',
      ]);
      expect(_ids(splitMaterialTopics(nonVocab('de')).core), [
        'de_phrases',
        'de_numbers',
      ]);
    });

    test('Jepang: tata bahasa cuma 2 topik → tidak dikelompokkan', () {
      final all = nonVocab('ja');
      final (:core, :grammar) = splitMaterialTopics(all);
      expect(grammar, isEmpty);
      expect(_ids(core), _ids(all));
    });

    test('tidak ada topik yang hilang di kursus mana pun', () {
      for (final c in kStudyGuides.keys) {
        final all = nonVocab(c);
        final (:core, :grammar) = splitMaterialTopics(all);
        expect({..._ids(core), ..._ids(grammar)}, _ids(all).toSet(), reason: c);
        expect(core.length + grammar.length, all.length, reason: c);
      }
    });
  });

  testWidgets('Mandarin: kartu Tata Bahasa membuka daftar 16 topik', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2;
    addTearDown(tester.view.reset);
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    const zh = Course(
      id: 'zh',
      name: {'id': 'Bahasa Mandarin', 'en': 'Mandarin Chinese'},
      flag: '🇨🇳',
      ttsLocale: 'zh-CN',
      units: [],
    );
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SettingsProvider(prefs)),
          ChangeNotifierProvider(
            create: (_) => ProgressProvider(prefs)..setActiveCourse('zh'),
          ),
          Provider<List<Course>>.value(value: const [zh]),
        ],
        child: const MaterialApp(home: MaterialsScreen()),
      ),
    );
    // Halaman utama: 3 kartu dasar + Tata Bahasa + Kosakata.
    expect(find.text('Pinyin & Nada'), findsOneWidget);
    expect(find.text('Tata Bahasa'), findsOneWidget);
    expect(find.text('16 topik pola kalimat & tata bahasa'), findsOneWidget);
    expect(find.text('Perbandingan 比'), findsNothing);

    await tester.tap(find.text('Tata Bahasa'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Pola Kalimat Dasar'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('Perbandingan 比'), 300);
    expect(find.text('Perbandingan 比'), findsOneWidget);
  });
}
