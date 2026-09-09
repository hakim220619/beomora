// Halaman penuh pemberitahuan streak: notice bolos menampilkan progres
// tantangan dan tombol lanjut; perayaan tantangan selesai menampilkan
// hadiah dan tombol pilih tantangan berikutnya. Keduanya menutup diri
// lewat pop sehingga pemanggil bisa `await` push-nya.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:beomora/providers/settings_provider.dart';
import 'package:beomora/screens/streak_notice_screen.dart';

void main() {
  late SharedPreferences prefs;
  bool popped = false;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    popped = false;
  });

  Future<void> pumpAndOpen(WidgetTester tester, Widget screen) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => SettingsProvider(prefs),
        child: MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => TextButton(
                onPressed: () async {
                  await Navigator.of(context).push<void>(
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (_) => screen,
                    ),
                  );
                  popped = true;
                },
                child: const Text('buka'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('buka'));
    // Halo/pensil beranimasi terus, jadi pump beberapa frame saja.
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));
  }

  testWidgets('notice bolos: progres tantangan tampil satu halaman penuh',
      (tester) async {
    await pumpAndOpen(
      tester,
      const StreakNoticeScreen.missed(goalDays: 30, daysDone: 12),
    );

    expect(find.text('Kamu sempat bolos 😴'), findsOneWidget);
    expect(find.text('12/30 hari'), findsOneWidget);
    expect(find.text('Tinggal 18 hari lagi menuju target 🎯'),
        findsOneWidget);
    expect(find.text('LANJUT BELAJAR'), findsOneWidget);
    // Bukan dialog: tidak ada AlertDialog/Dialog di pohon widget.
    expect(find.byType(Dialog), findsNothing);
    // Tombol "buka" tertutup halaman penuh.
    expect(find.text('buka'), findsNothing);

    await tester.tap(find.text('LANJUT BELAJAR'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));
    expect(popped, isTrue);
    expect(find.text('buka'), findsOneWidget);
  });

  testWidgets('tantangan selesai: hadiah koin dan tombol pilih berikutnya',
      (tester) async {
    await pumpAndOpen(
      tester,
      const StreakNoticeScreen.goalDone(goalDays: 30, gems: 50),
    );

    expect(find.text('Tantangan 30 hari selesai! 🏆'), findsOneWidget);
    expect(find.text('🪙 +50'), findsOneWidget);
    expect(find.text('🔥 30'), findsOneWidget);
    expect(find.text('LANJUT'), findsOneWidget);
    expect(find.text('PILIH TANTANGAN BERIKUTNYA'), findsOneWidget);
    expect(find.byType(Dialog), findsNothing);

    await tester.tap(find.text('LANJUT'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));
    expect(popped, isTrue);
  });
}
