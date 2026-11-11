import 'package:beomora/models/course.dart';
import 'package:beomora/providers/progress_provider.dart';
import 'package:beomora/providers/settings_provider.dart';
import 'package:beomora/screens/materials/materials_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Kosakata Jepang: Bab 1–25 paling atas, lalu JLPT N5', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2;
    addTearDown(tester.view.reset);
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    const ja = Course(
      id: 'ja',
      name: {'id': 'Bahasa Jepang', 'en': 'Japanese'},
      flag: '🇯🇵',
      ttsLocale: 'ja-JP',
      units: [],
    );
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SettingsProvider(prefs)),
          ChangeNotifierProvider(
            create: (_) => ProgressProvider(prefs)..setActiveCourse('ja'),
          ),
          Provider<List<Course>>.value(value: const [ja]),
        ],
        child: const MaterialApp(home: MaterialsScreen()),
      ),
    );
    await tester.scrollUntilVisible(find.text('Kosakata'), 300);
    await tester.tap(find.text('Kosakata'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    final bab = tester.getTopLeft(find.text('Kosakata Pemula Bab 1–25')).dy;
    final n5 = tester.getTopLeft(find.text('JLPT N5')).dy;
    expect(bab, lessThan(n5));
  });
}
