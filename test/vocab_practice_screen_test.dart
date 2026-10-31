import 'package:beomora/models/course.dart';
import 'package:beomora/models/guide.dart';
import 'package:beomora/providers/progress_provider.dart';
import 'package:beomora/providers/settings_provider.dart';
import 'package:beomora/screens/practice/letter_quiz_screen.dart';
import 'package:beomora/screens/practice/vocab_practice_screen.dart';
import 'package:beomora/widgets/choice_card.dart';
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
  const words = {
    'ねこ': 'kucing',
    'いぬ': 'anjing',
    'さかな': 'ikan',
    'みず': 'air',
    'ほん': 'buku',
    'いえ': 'rumah',
  };
  final topic = GuideTopic(
    id: 'vocab_test',
    emoji: '🐱',
    title: const {'id': 'Tes', 'en': 'Test'},
    subtitle: const {'id': '', 'en': ''},
    sections: [
      GuideSection(
        title: const {'id': 'Bagian 1', 'en': 'Part 1'},
        examples: [
          for (final e in words.entries)
            GuideExample(e.key, {'id': e.value, 'en': e.value}),
        ],
      ),
    ],
  );

  Future<void> pump(WidgetTester tester, {bool premium = true}) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final progress = ProgressProvider(prefs)..setPremium(premium);
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SettingsProvider(prefs)),
          ChangeNotifierProvider.value(value: progress),
        ],
        child: MaterialApp(
          home: VocabPracticeScreen(course: course, topics: [topic]),
        ),
      ),
    );
  }

  /// Kata yang sedang ditanyakan (prompt besar di tengah kartu).
  String promptWord(WidgetTester tester) {
    final prompt = tester
        .widgetList<Text>(find.byType(Text))
        .firstWhere((t) => (t.style?.fontSize ?? 0) >= 40)
        .data!;
    return words.containsKey(prompt)
        ? prompt
        : words.entries.firstWhere((e) => e.value == prompt).key;
  }

  testWidgets('2 kata, 5 soal: sisanya diulang acak, tak berurutan sama', (
    tester,
  ) async {
    await pump(tester);
    await tester.tap(find.text('ねこ'));
    await tester.tap(find.text('いぬ'));
    await tester.pump();
    expect(find.text('2 kata dipilih'), findsOneWidget);

    await tester.tap(find.text('Lanjut'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.widgetWithText(ChoiceChip, '5'));
    await tester.pump();
    expect(find.textContaining('diulang acak'), findsOneWidget);
    await tester.tap(find.text('Mulai'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.byType(LetterQuizScreen), findsOneWidget);
    final asked = <String>[];
    for (var i = 1; i <= 5; i++) {
      expect(find.text('$i/5'), findsOneWidget);
      // Pengecoh diambil dari seluruh topik: tetap 4 pilihan.
      expect(find.byType(ChoiceCard), findsNWidgets(4));
      asked.add(promptWord(tester));
      await tester.tap(find.byType(ChoiceCard).first);
      await tester.pump(const Duration(seconds: 1));
    }
    expect(asked.toSet(), {'ねこ', 'いぬ'});
    for (var i = 1; i < asked.length; i++) {
      expect(asked[i], isNot(asked[i - 1]));
    }
  });

  testWidgets('pengguna gratis: jumlah soal maksimal 10', (tester) async {
    await pump(tester, premium: false);
    await tester.tap(find.text('Pilih semua'));
    await tester.pump();
    await tester.tap(find.text('Lanjut'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(find.textContaining('Premium bebas pilih'), findsOneWidget);
    expect(find.widgetWithText(ChoiceChip, '20'), findsNothing);
    await tester.tap(find.byIcon(Icons.add_rounded));
    await tester.pump();
    await tester.tap(find.text('Mulai'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('1/10'), findsOneWidget);
  });
}
