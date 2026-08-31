// Dialog khas Beomora: konfirmasi mengembalikan true/false sesuai
// tombol yang ditekan.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:beomora/widgets/duo_dialog.dart';

void main() {
  bool? result;

  Future<void> pumpAndOpen(WidgetTester tester) async {
    result = null;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => TextButton(
            onPressed: () async {
              result = await showDuoConfirm(
                context,
                emoji: '👋',
                title: 'Keluar akun?',
                message: 'Progresmu tetap tersimpan.',
                confirmLabel: 'KELUAR',
                cancelLabel: 'Batal',
              );
            },
            child: const Text('buka'),
          ),
        ),
      ),
    ));
    await tester.tap(find.text('buka'));
    await tester.pumpAndSettle();
  }

  testWidgets('isi dialog tampil dan tombol utama mengembalikan true',
      (tester) async {
    await pumpAndOpen(tester);
    expect(find.text('👋'), findsOneWidget);
    expect(find.text('Keluar akun?'), findsOneWidget);
    expect(find.text('Progresmu tetap tersimpan.'), findsOneWidget);
    expect(find.text('Batal'), findsOneWidget);

    await tester.tap(find.text('KELUAR'));
    await tester.pumpAndSettle();
    expect(result, isTrue);
    expect(find.text('Keluar akun?'), findsNothing); // dialog tertutup
  });

  testWidgets('tombol batal mengembalikan false', (tester) async {
    await pumpAndOpen(tester);
    await tester.tap(find.text('Batal'));
    await tester.pumpAndSettle();
    expect(result, isFalse);
  });
}
