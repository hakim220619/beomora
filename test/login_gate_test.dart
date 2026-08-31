// Gerbang login: menu utama (MainScreen) hanya boleh tampil setelah
// pengguna login. Tanpa sesi, aplikasi berhenti di LoginScreen.
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:beomora/main.dart';
import 'package:beomora/models/course.dart';
import 'package:beomora/providers/auth_provider.dart';
import 'package:beomora/providers/progress_provider.dart';
import 'package:beomora/providers/settings_provider.dart';
import 'package:beomora/screens/login_screen.dart';
import 'package:beomora/screens/main_screen.dart';
import 'package:beomora/services/content_service.dart';

void main() {
  Future<void> pumpApp(
      WidgetTester tester, Map<String, Object> initialPrefs) async {
    SharedPreferences.setMockInitialValues(initialPrefs);
    final prefs = (await tester.runAsync(SharedPreferences.getInstance))!;
    final courses = (await tester.runAsync(ContentService.loadCourses))!;
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<List<Course>>.value(value: courses),
          ChangeNotifierProvider(create: (_) => SettingsProvider(prefs)),
          ChangeNotifierProvider(create: (_) => ProgressProvider(prefs)),
          ChangeNotifierProvider(create: (_) => AuthProvider(prefs)),
        ],
        child: const BeomoraApp(),
      ),
    );
    for (var i = 0; i < 5; i++) {
      await tester.pump(const Duration(milliseconds: 150));
    }
  }

  testWidgets('belum login → tertahan di LoginScreen', (tester) async {
    await pumpApp(tester, {'onboarded': true});
    expect(find.byType(LoginScreen), findsOneWidget);
    expect(find.byType(MainScreen), findsNothing);
  });

  testWidgets('sesi login tersimpan → langsung ke menu utama',
      (tester) async {
    await pumpApp(tester, {
      'onboarded': true,
      'auth_name': 'Dani',
      'auth_email': 'dani@example.com',
    });
    expect(find.byType(MainScreen), findsOneWidget);
    expect(find.byType(LoginScreen), findsNothing);
  });
}
