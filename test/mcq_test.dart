import 'package:beomora/data/mcq_bank.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Bank Soal Pilihan Ganda', () {
    test('Jepang & Inggris masing-masing minimal 50 soal', () {
      expect(mcqBankFor('ja').length, greaterThanOrEqualTo(50));
      expect(mcqBankFor('en').length, greaterThanOrEqualTo(50));
    });

    test('kursus tanpa bank soal mengembalikan daftar kosong', () {
      expect(mcqBankFor('id'), isEmpty);
      expect(mcqBankFor('xx'), isEmpty);
    });

    test('tiap soal: 4 pilihan unik, jawaban valid, teks id & en', () {
      for (final courseId in ['ja', 'en']) {
        for (final q in mcqBankFor(courseId)) {
          final label = '[$courseId] "${q.question['id']}"';
          expect(q.options.length, 4, reason: label);
          expect(q.options.toSet().length, 4,
              reason: '$label: pilihan dobel');
          expect(q.answer, inInclusiveRange(0, 3), reason: label);
          expect(q.question['id'], isNotEmpty, reason: label);
          expect(q.question['en'], isNotEmpty, reason: label);
          for (final o in q.options) {
            expect(o.trim(), isNotEmpty, reason: '$label: pilihan kosong');
          }
        }
      }
    });

    test('tidak ada soal kembar dalam satu bank', () {
      for (final courseId in ['ja', 'en']) {
        final seen = <String>{};
        for (final q in mcqBankFor(courseId)) {
          expect(seen.add(q.question['id']!), isTrue,
              reason: '[$courseId] soal dobel: ${q.question['id']}');
        }
      }
    });
  });

  group('Sinkronisasi bank soal (Firestore)', () {
    tearDown(clearSyncedMcqBanks);

    test('JSON bolak-balik tanpa kehilangan data', () {
      for (final courseId in mcqCourseIds) {
        final bundled = mcqBundledFor(courseId);
        final parsed = mcqListFromJson(mcqListToJson(bundled));
        expect(parsed.length, bundled.length);
        for (var i = 0; i < bundled.length; i++) {
          expect(parsed[i].question, bundled[i].question);
          expect(parsed[i].options, bundled[i].options);
          expect(parsed[i].answer, bundled[i].answer);
        }
      }
    });

    test('JSON tidak valid ditolak (jangan menimpa bank bawaan)', () {
      expect(() => mcqListFromJson('[]'), throwsFormatException);
      // Cuma 3 pilihan.
      expect(
          () => mcqListFromJson(
              '[{"question":{"id":"x"},"options":["a","b","c"],"answer":0}]'),
          throwsFormatException);
      // Indeks jawaban di luar jangkauan.
      expect(
          () => mcqListFromJson('[{"question":{"id":"x"},'
              '"options":["a","b","c","d"],"answer":4}]'),
          throwsFormatException);
      // Pilihan dobel.
      expect(
          () => mcqListFromJson('[{"question":{"id":"x"},'
              '"options":["a","a","c","d"],"answer":0}]'),
          throwsFormatException);
    });

    test('bank hasil sinkron menggantikan bawaan; clear mengembalikan',
        () {
      final custom = [
        const McqQuestion(
          question: {'id': 'Soal server?', 'en': 'Server question?'},
          options: ['a', 'b', 'c', 'd'],
          answer: 0,
        ),
      ];
      applySyncedMcqBank('ja', custom);
      expect(mcqBankFor('ja'), hasLength(1));
      expect(mcqBankFor('en'), mcqBundledFor('en')); // tak tersentuh
      clearSyncedMcqBanks();
      expect(mcqBankFor('ja'), mcqBundledFor('ja'));
    });
  });
}
