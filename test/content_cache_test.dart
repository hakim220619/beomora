// Materi offline-first: cache lokal dipakai kalau valid, dan aplikasi
// SELALU bisa memuat materi dari asset bawaan — apa pun isi cache-nya.
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:beomora/services/content_service.dart';

void main() {
  testWidgets('tanpa cache → materi dimuat dari asset bawaan',
      (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = (await tester.runAsync(SharedPreferences.getInstance))!;
    final courses = (await tester
        .runAsync(() => ContentService.loadCourses(prefs: prefs)))!;
    expect(courses.length, 3);
  });

  testWidgets('cache rusak → jatuh kembali ke asset bawaan',
      (tester) async {
    SharedPreferences.setMockInitialValues({
      'content_json_en': 'bukan { json yang valid',
      'content_json_ja': '{"tanpa": "struktur kursus"}',
    });
    final prefs = (await tester.runAsync(SharedPreferences.getInstance))!;
    final courses = (await tester
        .runAsync(() => ContentService.loadCourses(prefs: prefs)))!;
    expect(courses.length, 3);
    expect(courses.every((c) => c.units.isNotEmpty), isTrue);
  });
}
