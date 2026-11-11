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

  testWidgets('bintang di tengah daftar: posisi kata tidak melompat', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final words = [for (var i = 0; i < 40; i++) 'kata$i'];
    final long = GuideTopic(
      id: 'vocab_long',
      emoji: '📚',
      title: const {'id': 'Panjang', 'en': 'Long'},
      subtitle: const {'id': '', 'en': ''},
      sections: [
        GuideSection(
          title: const {'id': 'Bagian 1', 'en': 'Part 1'},
          examples: [
            for (final w in words) GuideExample(w, {'id': 'arti', 'en': 'm'}),
          ],
        ),
      ],
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
            topic: long,
            ttsLocale: 'ja-JP',
          ),
        ),
      ),
    );
    await tester.scrollUntilVisible(
      find.text('kata20'),
      300,
      scrollable: find
          .descendant(
            of: find.byType(ListView),
            matching: find.byType(Scrollable),
          )
          .first,
    );
    await tester.pump();
    final before = tester.getTopLeft(find.text('kata20')).dy;
    final star = find.descendant(
      of: find
          .ancestor(of: find.text('kata20'), matching: find.byType(Row))
          .first,
      matching: find.byIcon(Icons.star_border_rounded),
    );
    await tester.tap(star);
    await tester.pump(); // Favorit muncul di atas
    await tester.pump(); // geser posisi gulir (post-frame)
    expect(prefs.getStringList('vocab_starred_ja'), ['kata20']);
    // Baris di topik (yang terakhir) tetap di tempat yang sama.
    expect(
      tester.getTopLeft(find.text('kata20', skipOffstage: false).last).dy,
      moreOrLessEquals(before, epsilon: 1),
    );
  });
  testWidgets('bintang dekat atas (Favorit terlihat): posisi kata tetap', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final words = [for (var i = 0; i < 40; i++) 'kata$i'];
    final long = GuideTopic(
      id: 'vocab_long',
      emoji: '📚',
      title: const {'id': 'Panjang', 'en': 'Long'},
      subtitle: const {'id': '', 'en': ''},
      sections: [
        GuideSection(
          title: const {'id': 'Bagian 1', 'en': 'Part 1'},
          examples: [
            for (final w in words) GuideExample(w, {'id': 'arti', 'en': 'm'}),
          ],
        ),
      ],
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
            topic: long,
            ttsLocale: 'ja-JP',
          ),
        ),
      ),
    );
    await tester.drag(find.byType(ListView), const Offset(0, -120));
    await tester.pump();
    final before = tester.getTopLeft(find.text('kata4')).dy;
    final star = find.descendant(
      of: find
          .ancestor(of: find.text('kata4'), matching: find.byType(Row))
          .first,
      matching: find.byIcon(Icons.star_border_rounded),
    );
    await tester.tap(star);
    await tester.pump(); // Favorit muncul di atas
    await tester.pump(); // geser posisi gulir (post-frame)
    expect(prefs.getStringList('vocab_starred_ja'), ['kata4']);
    expect(find.text('⭐ Favorit', skipOffstage: false), findsOneWidget);
    // Baris di topik (yang terakhir) tetap di tempat yang sama.
    expect(
      tester.getTopLeft(find.text('kata4', skipOffstage: false).last).dy,
      moreOrLessEquals(before, epsilon: 1),
    );
  });
}
