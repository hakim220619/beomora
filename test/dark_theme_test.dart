// Tema gelap: teks snackbar & dialog harus kontras dengan latarnya
// (dulu teks snackbar gelap di atas hijau gelap — tak terbaca).
import 'package:beomora/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

double _contrast(Color a, Color b) {
  final la = a.computeLuminance(), lb = b.computeLuminance();
  final hi = la > lb ? la : lb, lo = la > lb ? lb : la;
  return (hi + 0.05) / (lo + 0.05);
}

void main() {
  for (final brightness in Brightness.values) {
    testWidgets('teks snackbar & dialog kontras ($brightness)', (t) async {
      final theme = buildTheme(brightness);
      await t.pumpWidget(
        MaterialApp(
          theme: theme,
          home: Scaffold(
            body: Builder(
              builder: (c) => TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(c).showSnackBar(
                    SnackBar(
                      content: const Text('SNACK'),
                      action: SnackBarAction(label: 'ACT', onPressed: () {}),
                    ),
                  );
                  showDialog<void>(
                    context: c,
                    builder: (_) => const AlertDialog(
                      title: Text('TITLE'),
                      content: Text('BODY'),
                    ),
                  );
                },
                child: const Text('go'),
              ),
            ),
          ),
        ),
      );
      await t.tap(find.text('go'));
      await t.pumpAndSettle();
      Color colorOf(String s) =>
          t.renderObject<RenderParagraph>(find.text(s)).text.style!.color!;
      final snackBg = theme.snackBarTheme.backgroundColor!;
      final dialogBg = theme.dialogTheme.backgroundColor!;
      expect(_contrast(colorOf('SNACK'), snackBg), greaterThan(4.5));
      expect(_contrast(colorOf('ACT'), snackBg), greaterThan(3));
      expect(_contrast(colorOf('TITLE'), dialogBg), greaterThan(4.5));
      expect(_contrast(colorOf('BODY'), dialogBg), greaterThan(4.5));
    });
  }
}
