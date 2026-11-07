import 'package:beomora/models/course.dart';
import 'package:beomora/models/guide.dart';
import 'package:beomora/providers/auth_provider.dart';
import 'package:beomora/providers/settings_provider.dart';
import 'package:beomora/screens/materials/guide_detail_screen.dart';
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
  final topic = GuideTopic(
    id: 'vocab_test',
    emoji: '🐱',
    title: const {'id': 'Tes', 'en': 'Test'},
    subtitle: const {'id': '', 'en': ''},
    sections: [
      GuideSection(
        title: const {'id': 'Bagian 1', 'en': 'Part 1'},
        examples: [
          for (final w in ['ねこ', 'いぬ', 'さかな'])
            GuideExample(w, {'id': 'arti $w', 'en': 'meaning $w'}),
        ],
      ),
    ],
  );

  testWidgets('bintang di Materi: kata masuk bagian Favorit paling atas', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
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
    expect(find.text('⭐ Favorit'), findsNothing);

    await tester.tap(find.byIcon(Icons.star_border_rounded).at(1)); // いぬ
    await tester.pump();
    expect(find.text('⭐ Favorit'), findsOneWidget);
    expect(find.text('いぬ'), findsNWidgets(2));
    expect(
      tester.getTopLeft(find.text('⭐ Favorit')).dy,
      lessThan(tester.getTopLeft(find.text('Bagian 1')).dy),
    );
    expect(prefs.getStringList('vocab_starred_ja'), ['いぬ']);

    await tester.tap(find.byIcon(Icons.star_rounded).first);
    await tester.pump();
    expect(find.text('⭐ Favorit'), findsNothing);
    expect(find.text('いぬ'), findsOneWidget);
  });

  testWidgets('reset Favorit: ikon hapus melepas semua bintang', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({
      'vocab_starred_ja': ['ねこ', 'さかな', 'lain'],
    });
    final prefs = await SharedPreferences.getInstance();
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
    expect(find.text('⭐ Favorit'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.delete_sweep_rounded));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));
    expect(find.text('2 kata akan dilepas dari Favorit.'), findsOneWidget);
    await tester.tap(find.text('Kosongkan'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));
    expect(find.text('⭐ Favorit'), findsNothing);
    // Bintang kata di luar topik ini tidak ikut terhapus.
    expect(prefs.getStringList('vocab_starred_ja'), ['lain']);
  });
}
