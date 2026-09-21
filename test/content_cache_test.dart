// Materi offline-first: cache lokal dipakai kalau valid, dan aplikasi
// SELALU bisa memuat materi dari asset bawaan — apa pun isi cache-nya.
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:beomora/services/content_service.dart';

void main() {
  testWidgets('tanpa cache → materi dimuat dari asset bawaan', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = (await tester.runAsync(SharedPreferences.getInstance))!;
    final courses = (await tester.runAsync(
      () => ContentService.loadCourses(prefs: prefs),
    ))!;
    expect(courses.length, 5);
  });

  testWidgets('cache rusak → jatuh kembali ke asset bawaan', (tester) async {
    SharedPreferences.setMockInitialValues({
      'content_json_en': 'bukan { json yang valid',
      'content_json_ja': '{"tanpa": "struktur kursus"}',
    });
    final prefs = (await tester.runAsync(SharedPreferences.getInstance))!;
    final courses = (await tester.runAsync(
      () => ContentService.loadCourses(prefs: prefs),
    ))!;
    expect(courses.length, 5);
    expect(courses.every((c) => c.units.isNotEmpty), isTrue);
  });

  group('invalidateIfAppUpdated', () {
    const cacheKeys = {
      'content_json_en': '{"apa": "saja"}',
      'content_mcq_ja': '[]',
      'content_version': 123,
      'content_last_check': 456,
    };

    test(
      'install baru (tanpa jejak build & cache) → cuma catat build',
      () async {
        SharedPreferences.setMockInitialValues({});
        final prefs = await SharedPreferences.getInstance();
        expect(
          await ContentService.invalidateIfAppUpdated(prefs, '19'),
          isFalse,
        );
        expect(prefs.getString('content_app_build'), '19');
      },
    );

    test('build sama → cache dibiarkan', () async {
      SharedPreferences.setMockInitialValues({
        ...cacheKeys,
        'content_app_build': '19',
      });
      final prefs = await SharedPreferences.getInstance();
      expect(await ContentService.invalidateIfAppUpdated(prefs, '19'), isFalse);
      expect(prefs.getString('content_json_en'), '{"apa": "saja"}');
      expect(prefs.getInt('content_version'), 123);
    });

    test('build berubah → cache & versi dibuang, build baru dicatat', () async {
      SharedPreferences.setMockInitialValues({
        ...cacheKeys,
        'content_app_build': '18',
      });
      final prefs = await SharedPreferences.getInstance();
      expect(await ContentService.invalidateIfAppUpdated(prefs, '19'), isTrue);
      expect(prefs.containsKey('content_json_en'), isFalse);
      expect(prefs.containsKey('content_mcq_ja'), isFalse);
      expect(prefs.containsKey('content_version'), isFalse);
      expect(prefs.containsKey('content_last_check'), isFalse);
      expect(prefs.getString('content_app_build'), '19');
    });

    test('pengguna lama sebelum fitur ini (ada cache, tanpa jejak build) '
        '→ cache dibuang', () async {
      SharedPreferences.setMockInitialValues({...cacheKeys});
      final prefs = await SharedPreferences.getInstance();
      expect(await ContentService.invalidateIfAppUpdated(prefs, '19'), isTrue);
      expect(prefs.containsKey('content_json_en'), isFalse);
      expect(prefs.getString('content_app_build'), '19');
    });

    test('build number kosong → tidak melakukan apa-apa', () async {
      SharedPreferences.setMockInitialValues({...cacheKeys});
      final prefs = await SharedPreferences.getInstance();
      expect(await ContentService.invalidateIfAppUpdated(prefs, ''), isFalse);
      expect(prefs.getString('content_json_en'), '{"apa": "saja"}');
      expect(prefs.containsKey('content_app_build'), isFalse);
    });
  });
}
