import 'package:flutter_test/flutter_test.dart';
import 'package:beomora/data/study_guides.dart';
import 'package:beomora/models/course.dart';
import 'package:beomora/models/exercise.dart';
import 'package:beomora/services/content_service.dart';
import 'package:beomora/services/exercise_generator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:beomora/main.dart';
import 'package:beomora/providers/auth_provider.dart';
import 'package:beomora/providers/progress_provider.dart';
import 'package:beomora/providers/settings_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Konten kursus', () {
    late List<Course> courses;

    setUpAll(() async {
      courses = await ContentService.loadCourses();
    });

    test('memuat 3 kursus (en, ja, id) dengan struktur lengkap', () {
      expect(courses.map((c) => c.id), containsAll(['en', 'ja', 'id']));
      for (final course in courses) {
        expect(course.units.length, 4, reason: 'kursus ${course.id}');
        for (final unit in course.units) {
          expect(unit.lessons.length, 3, reason: 'unit ${unit.id}');
          for (final lesson in unit.lessons) {
            expect(lesson.words.length, greaterThanOrEqualTo(4),
                reason: 'lesson ${lesson.id}');
            expect(lesson.title['id'], isNotEmpty);
            expect(lesson.title['en'], isNotEmpty);
          }
        }
      }
    });

    test('generator menghasilkan soal valid untuk semua pelajaran', () {
      for (final course in courses) {
        for (final lesson in course.allLessons) {
          final exercises = ExerciseGenerator(seed: 42)
              .forLesson(course, lesson, 'id');
          expect(exercises, isNotEmpty, reason: 'lesson ${lesson.id}');
          for (final ex in exercises) {
            if (ex.type == ExerciseType.matching) {
              expect(ex.pairs.length, greaterThanOrEqualTo(4));
            } else if (ex.type == ExerciseType.typing) {
              expect(ex.answer, isNotEmpty);
            } else {
              expect(ex.options, contains(anything));
              // Jawaban harus bisa dibentuk dari pilihan yang ada.
              if (ex.type == ExerciseType.scramble) {
                final letters = List<String>.from(ex.options)..sort();
                final answerLetters = ex.answer.split('')..sort();
                expect(letters, answerLetters);
              } else if (ex.type == ExerciseType.sentenceBuild) {
                for (final token in ex.answer.split(' ')) {
                  expect(ex.options, contains(token));
                }
              } else {
                expect(ex.options, contains(ex.answer));
              }
            }
          }
        }
      }
    });
  });

  group('Materi belajar', () {
    test('tersedia untuk semua kursus dengan konten valid', () {
      expect(kStudyGuides.keys, containsAll(['ja', 'en', 'id']));
      final ja = kStudyGuides['ja']!;
      final hiragana = ja.firstWhere((t) => t.id == 'hiragana');
      expect(hiragana.sections.first.kana.length, 46,
          reason: 'gojūon hiragana harus 46 huruf');
      final katakana = ja.firstWhere((t) => t.id == 'katakana');
      expect(katakana.sections.first.kana.length, 46,
          reason: 'gojūon katakana harus 46 huruf');
      for (final topics in kStudyGuides.values) {
        expect(topics, isNotEmpty);
        for (final topic in topics) {
          expect(topic.title['id'], isNotEmpty);
          expect(topic.title['en'], isNotEmpty);
          expect(topic.sections, isNotEmpty,
              reason: 'topik ${topic.id} tanpa isi');
        }
      }
    });
  });

  group('Penilaian jawaban ketik', () {
    test('menerima varian, typo ringan, dan menolak jawaban salah', () {
      expect(AnswerGrader.grade('halo', 'halo'), 2);
      expect(AnswerGrader.grade('  Selamat Pagi ', 'selamat pagi'), 2);
      expect(AnswerGrader.grade('tolong', 'tolong / silakan'), 2);
      expect(AnswerGrader.grade('silakan', 'tolong / silakan'), 2);
      expect(AnswerGrader.grade('selamat pagu', 'selamat pagi'), 1);
      expect(AnswerGrader.grade('apel', 'jeruk'), 0);
      expect(AnswerGrader.grade('', 'halo'), 0);
    });
  });

  testWidgets('aplikasi boot ke onboarding lalu bisa lanjut',
      (tester) async {
    SharedPreferences.setMockInitialValues({});
    // I/O asli (asset & prefs) harus lewat runAsync di dalam testWidgets,
    // kalau tidak future-nya tak pernah selesai di zona fake-async.
    final prefs =
        (await tester.runAsync(SharedPreferences.getInstance))!;
    final courses =
        (await tester.runAsync(ContentService.loadCourses))!;

    // Beberapa widget Material punya animasi berkelanjutan, jadi pakai
    // pump berdurasi tetap, bukan pumpAndSettle.
    Future<void> settle() async {
      for (var i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 150));
      }
    }

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
    await settle();

    // Layar onboarding: sambutan + pilihan bahasa UI.
    expect(find.text('Selamat datang di Beomora!'), findsOneWidget);
    expect(find.text('LANJUT'), findsOneWidget);

    await tester.tap(find.text('LANJUT'));
    await settle();
    expect(find.text('Mau belajar bahasa apa?'), findsOneWidget);

    await tester.tap(find.textContaining('Bahasa Inggris'));
    await settle();
    await tester.tap(find.text('LANJUT'));
    await settle();
    expect(find.text('Tentukan target harianmu'), findsOneWidget);

    await tester.tap(find.text('MULAI BELAJAR'));
    await settle();

    // Menu utama digembok: setelah onboarding wajib login Google dulu.
    expect(find.text('Masuk dulu, yuk!'), findsOneWidget);
    expect(find.text('MASUK DENGAN GOOGLE'), findsOneWidget);
    expect(find.text('Belajar'), findsNothing);
  });
}
