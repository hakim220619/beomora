import 'package:beomora/services/content_service.dart';
import 'package:beomora/services/exercise_generator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('latihan bebas: jumlah soal sesuai pilihan, tanpa kata ulang', () async {
    final courses = await ContentService.loadCourses();
    for (final course in courses) {
      final all = ExerciseGenerator.uniqueWords(course);
      // Kurang dari 10 kata dikuasai → pakai semua kata kursus.
      final few = all.take(4).map((w) => w.target).toSet();
      expect(ExerciseGenerator.practicePool(course, few).length, all.length);
      // 12 kata dikuasai → hanya kata itu.
      final some = all.take(12).map((w) => w.target).toSet();
      expect(ExerciseGenerator.practicePool(course, some).length, 12);

      final gen = ExerciseGenerator();
      final ex = gen.freePractice(course, some, 'id', count: 12);
      expect(ex.length, 12);
      expect(
        ex.map((e) => e.word?.target ?? e.prompt).toSet().length,
        12,
        reason: '${course.id}: soal tak berulang selama kata cukup',
      );
      expect(gen.freePractice(course, few, 'id').length, 10);
    }
  });
}
