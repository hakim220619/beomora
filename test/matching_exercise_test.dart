import 'package:beomora/models/exercise.dart';
import 'package:beomora/providers/settings_provider.dart';
import 'package:beomora/widgets/exercises/matching_exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  const pairs = [
    MatchPair('あ', 'a'),
    MatchPair('か', 'ka'),
    MatchPair('さ', 'sa'),
  ];

  Future<void> pump(WidgetTester tester, VoidCallback onSolved) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => SettingsProvider(prefs),
        child: MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: MatchingExercise(
                exercise: const Exercise(
                  type: ExerciseType.matching,
                  prompt: '',
                  answer: '',
                  pairs: pairs,
                ),
                onSolved: onSolved,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> drag(WidgetTester tester, String from, String to) async {
    final start = tester.getCenter(find.text(from));
    final end = tester.getCenter(find.text(to));
    final gesture = await tester.startGesture(start);
    // Gerak horizontal dulu agar drag dikenali, lalu ke tujuan.
    await gesture.moveBy(const Offset(40, 0));
    await tester.pump();
    await gesture.moveTo(end);
    await tester.pump();
    await gesture.up();
    await tester.pump();
  }

  testWidgets('tarik garis ke pasangan benar menyelesaikan soal', (
    tester,
  ) async {
    var solved = false;
    await pump(tester, () => solved = true);
    for (final p in pairs) {
      await drag(tester, p.left, p.right);
    }
    expect(solved, isTrue);
    await tester.pump(const Duration(seconds: 1));
  });

  testWidgets(
    'tarik ke pasangan salah tidak menyelesaikan; ketuk tetap jalan',
    (tester) async {
      var solved = false;
      await pump(tester, () => solved = true);
      await drag(tester, 'あ', 'ka');
      await tester.pump(const Duration(seconds: 1));
      expect(solved, isFalse);
      for (final p in pairs) {
        await tester.tap(find.text(p.left));
        await tester.pump();
        await tester.tap(find.text(p.right));
        await tester.pump();
      }
      expect(solved, isTrue);
      await tester.pump(const Duration(seconds: 1));
    },
  );
}
