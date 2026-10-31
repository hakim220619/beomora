import 'package:beomora/data/kanji_bank.dart';
import 'package:beomora/data/question_bank.dart';
import 'package:beomora/data/study_guides.dart';
import 'package:beomora/models/course.dart';
import 'package:beomora/providers/auth_provider.dart';
import 'package:beomora/providers/settings_provider.dart';
import 'package:beomora/screens/materials/guide_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('kanji N5 ±100 & N4 ±170, lengkap dengan bacaan & contoh kata', () {
    int count(List<KanjiSection> s) =>
        s.fold(0, (n, sec) => n + sec.entries.length);
    expect(count(kanjiN5Sections), greaterThanOrEqualTo(90));
    expect(count(kanjiN4Sections), greaterThanOrEqualTo(150));
    for (final sec in [...kanjiN5Sections, ...kanjiN4Sections]) {
      for (final k in sec.entries) {
        expect(k.on.length + k.kun.length, greaterThan(0), reason: k.kanji);
        expect(k.words, isNotEmpty, reason: k.kanji);
        expect(kanjiEntryOf(k.kanji), same(k));
      }
    }
  });

  testWidgets('Materi: ketuk kanji → detail bacaan on/kun & contoh kata', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    const course = Course(
      id: 'ja',
      name: {'id': 'Bahasa Jepang', 'en': 'Japanese'},
      flag: '🇯🇵',
      ttsLocale: 'ja-JP',
      units: [],
    );
    final topic = kStudyGuides['ja']!.firstWhere((t) => t.id == 'kanji_n5');
    final first = kanjiN5Sections.first.entries.first;
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
    await tester.scrollUntilVisible(
      find.text(first.kanji),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.ensureVisible(find.text(first.kanji).first);
    await tester.pump();
    await tester.tap(find.text(first.kanji).first);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text("On'yomi"), findsOneWidget);
    expect(find.text("Kun'yomi"), findsOneWidget);
    expect(find.text('Contoh kata'), findsOneWidget);
    expect(find.text(first.words.first.word), findsWidgets);
  });
}
