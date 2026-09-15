import 'dart:math';

import 'package:beomora/data/exam_blueprints.dart';
import 'package:beomora/data/mcq_bank.dart';
import 'package:beomora/models/exam.dart';
import 'package:flutter_test/flutter_test.dart';

void _expectValidMcq(McqQuestion q, String where) {
  expect(q.options.length, 4, reason: '$where: ${q.question['id']}');
  expect(
    q.options.toSet().length,
    4,
    reason: '$where: pilihan dobel di "${q.question['id']}"',
  );
  expect(q.options.any((o) => o.trim().isEmpty), isFalse, reason: where);
  expect(q.answer, inInclusiveRange(0, 3), reason: where);
  expect(q.question['id'], isNotEmpty, reason: where);
  expect(q.question['en'], isNotEmpty, reason: where);
}

void main() {
  final all = [...examsFor('en'), ...examsFor('ja')];

  group('Cetak biru ujian', () {
    test('Inggris: TOEFL/IELTS/PTE; Jepang: N5–N1; kursus lain kosong', () {
      expect(examsFor('en').map((e) => e.id), [
        'en_toefl',
        'en_ielts',
        'en_pte',
      ]);
      expect(examsFor('ja').map((e) => e.id), [
        'ja_n5',
        'ja_n4',
        'ja_n3',
        'ja_n2',
        'ja_n1',
      ]);
      expect(examsFor('ko'), isEmpty);
      expect(examById('ja_n2')?.scoring, ExamScoring.jlptN2);
      expect(examById('zz'), isNull);
    });

    test('jumlah soal mengikuti ujian asli', () {
      int count(String id, ExamSectionKind k) =>
          examById(id)!.section(k)!.questionCount;
      expect(count('en_toefl', ExamSectionKind.reading), 20);
      expect(count('en_toefl', ExamSectionKind.listening), 28);
      expect(count('en_ielts', ExamSectionKind.reading), 40);
      expect(count('en_ielts', ExamSectionKind.listening), 40);
      expect(count('ja_n5', ExamSectionKind.vocab), 35);
      expect(count('ja_n5', ExamSectionKind.listening), 24);
      expect(count('ja_n4', ExamSectionKind.listening), 28);
      expect(count('ja_n3', ExamSectionKind.listening), 28);
      expect(count('ja_n2', ExamSectionKind.listening), 30);
      expect(count('ja_n1', ExamSectionKind.listening), 37);
      expect(examById('ja_n5')!.totalMinutes, greaterThanOrEqualTo(100));
      expect(examById('ja_n1')!.totalMinutes, greaterThanOrEqualTo(170));
    });

    test('pool tiap bagian cukup untuk jumlah soal (tanpa pengulangan)', () {
      for (final e in all) {
        for (final s in e.sections) {
          expect(
            e.pools.available(s.kind),
            greaterThanOrEqualTo(s.questionCount),
            reason: '${e.id} ${s.kind.name}',
          );
        }
      }
    });

    test('semua soal pilihan ganda & bacaan valid', () {
      for (final e in all) {
        final p = e.pools;
        for (final q in [...p.vocab, ...p.grammar, ...p.readingExtra]) {
          _expectValidMcq(q, e.id);
        }
        final ids = <String>{};
        for (final r in p.reading) {
          expect(ids.add(r.id), isTrue, reason: '${e.id}: id bacaan dobel');
          expect(r.text.trim(), isNotEmpty, reason: r.id);
          expect(r.title['id'], isNotEmpty, reason: r.id);
          expect(r.title['en'], isNotEmpty, reason: r.id);
          expect(r.questions.length, greaterThanOrEqualTo(4), reason: r.id);
          for (final q in r.questions) {
            _expectValidMcq(q, r.id);
          }
        }
        for (final w in p.writing) {
          expect(w.prompt['id'], isNotEmpty, reason: e.id);
          expect(w.prompt['en'], isNotEmpty, reason: e.id);
          expect(w.text.trim(), isNotEmpty, reason: e.id);
          expect(w.answers, isNotEmpty, reason: '${e.id}: ${w.text}');
          expect(
            w.answers.any((a) => a.trim().isEmpty),
            isFalse,
            reason: '${e.id}: ${w.text}',
          );
          expect(w.accepts(w.answers.first), isTrue, reason: w.text);
          expect(w.accepts(''), isFalse);
        }
      }
    });
  });

  group('Sesi ujian', () {
    test('ujian penuh: jumlah soal per bagian sesuai cetak biru', () {
      for (final e in all) {
        final s = ExamSession.build(e, Random(1));
        expect(s.sections.length, e.sections.length, reason: e.id);
        for (var i = 0; i < s.sections.length; i++) {
          expect(
            s.items[i].length,
            e.sections[i].questionCount,
            reason: '${e.id} ${e.sections[i].kind.name}',
          );
          for (final it in s.items[i]) {
            expect(it.section, e.sections[i].kind);
            if (it.isTyping) {
              expect(it.options, isEmpty);
            } else {
              expect(it.options.toSet(), it.mcq!.options.toSet());
              expect(it.options, contains(it.correctAnswer));
            }
            if (it.section == ExamSectionKind.reading ||
                it.section == ExamSectionKind.listening) {
              // Bacaan/transkrip harus ada (kecuali soal reading lepas).
              if (it.passageId != null) expect(it.passageText, isNotEmpty);
            }
          }
        }
        expect(s.totalQuestions, e.totalQuestions, reason: e.id);
      }
    });

    test('soal satu bacaan berurutan supaya teks tidak berganti-ganti', () {
      final s = ExamSession.build(examById('en_ielts')!, Random(7));
      final reading =
          s.items[s.sections.indexWhere(
            (x) => x.kind == ExamSectionKind.reading,
          )];
      final seen = <String>{};
      String? prev;
      for (final it in reading) {
        final id = it.passageId ?? '_extra';
        if (id != prev) {
          expect(seen.add(id), isTrue, reason: 'bacaan $id terpecah');
          prev = id;
        }
      }
    });

    test('ujian mini: total tepat & tiap bagian ≥ 1 soal', () {
      for (final e in all) {
        final s = ExamSession.build(
          e,
          Random(3),
          mini: true,
          miniTotal: kFreeExamQuestions,
        );
        expect(s.totalQuestions, kFreeExamQuestions, reason: e.id);
        for (final l in s.items) {
          expect(l, isNotEmpty, reason: e.id);
        }
      }
    });

    test('penilaian: jawaban benar/salah/kosong & item ketik', () {
      final s = ExamSession.build(examById('ja_n5')!, Random(2));
      expect(s.totalCorrect, 0);
      for (final l in s.items) {
        for (final it in l) {
          it.userAnswer = it.correctAnswer;
        }
      }
      expect(s.totalCorrect, s.totalQuestions);
      expect(s.missed, isEmpty);
      final w = const WritingItem(
        prompt: {'id': 'x', 'en': 'x'},
        text: 'The ____ is clear.',
        answers: ['Has Been', 'was'],
      );
      expect(w.accepts(' has been '), isTrue);
      expect(w.accepts('hasbeen'), isTrue);
      expect(w.accepts('WAS.'), isTrue);
      expect(w.accepts('were'), isFalse);
    });
  });

  group('Perkiraan skor', () {
    test('TOEFL: per bagian /30, total dijumlah', () {
      final sc = ExamScore.compute(ExamScoring.toefl, const [
        ExamSectionResult(ExamSectionKind.reading, 20, 20),
        ExamSectionResult(ExamSectionKind.listening, 14, 28),
        ExamSectionResult(ExamSectionKind.writing, 5, 10),
      ]);
      expect(sc.perSection[ExamSectionKind.reading], '30/30');
      expect(sc.perSection[ExamSectionKind.listening], '15/30');
      expect(sc.overall, '60/90');
      expect(sc.passed, isNull);
    });

    test('IELTS: band per bagian dan rata-rata dibulatkan ke 0.5', () {
      final sc = ExamScore.compute(ExamScoring.ielts, const [
        ExamSectionResult(ExamSectionKind.listening, 40, 40),
        ExamSectionResult(ExamSectionKind.reading, 30, 40),
        ExamSectionResult(ExamSectionKind.writing, 6, 10),
      ]);
      expect(sc.perSection[ExamSectionKind.listening], 'Band 9');
      expect(sc.perSection[ExamSectionKind.reading], 'Band 7');
      expect(sc.perSection[ExamSectionKind.writing], 'Band 6.5');
      expect(sc.overall, 'Band 7.5');
    });

    test('PTE: 10–90', () {
      final sc = ExamScore.compute(ExamScoring.pte, const [
        ExamSectionResult(ExamSectionKind.reading, 0, 18),
        ExamSectionResult(ExamSectionKind.listening, 18, 18),
      ]);
      expect(sc.perSection[ExamSectionKind.reading], '10/90');
      expect(sc.perSection[ExamSectionKind.listening], '90/90');
      expect(sc.overall, '50/90');
    });

    test('JLPT N5/N4: 120 + 60, ambang 80/90, writing terpisah', () {
      const rs = [
        ExamSectionResult(ExamSectionKind.vocab, 28, 35),
        ExamSectionResult(ExamSectionKind.grammar, 14, 20),
        ExamSectionResult(ExamSectionKind.reading, 6, 12),
        ExamSectionResult(ExamSectionKind.listening, 12, 24),
        ExamSectionResult(ExamSectionKind.writing, 3, 10),
      ];
      // Pengetahuan bahasa: 48/67 ≈ 0.716 → 86/120; dengar 30/60 → 116.
      final n5 = ExamScore.compute(ExamScoring.jlptN5, rs);
      expect(n5.perSection[ExamSectionKind.vocab], '86/120');
      expect(n5.perSection[ExamSectionKind.listening], '30/60');
      expect(n5.perSection[ExamSectionKind.writing], '3/10');
      expect(n5.overall, '116/180');
      expect(n5.passed, isTrue);
      // Gagal sektoral: dengar di bawah 19.
      final low = ExamScore.compute(ExamScoring.jlptN4, const [
        ExamSectionResult(ExamSectionKind.vocab, 35, 35),
        ExamSectionResult(ExamSectionKind.grammar, 20, 20),
        ExamSectionResult(ExamSectionKind.reading, 15, 15),
        ExamSectionResult(ExamSectionKind.listening, 5, 28),
      ]);
      expect(low.overall, '131/180');
      expect(low.passed, isFalse);
    });

    test('JLPT N3–N1: 3 × 60 dengan ambang berbeda', () {
      const rs = [
        ExamSectionResult(ExamSectionKind.vocab, 20, 30),
        ExamSectionResult(ExamSectionKind.grammar, 15, 25),
        ExamSectionResult(ExamSectionKind.reading, 10, 20),
        ExamSectionResult(ExamSectionKind.listening, 15, 30),
      ];
      // LK 35/55 → 38; reading 30; listening 30 → 98.
      final n3 = ExamScore.compute(ExamScoring.jlptN3, rs);
      expect(n3.overall, '98/180');
      expect(n3.passed, isTrue); // ≥ 95
      final n1 = ExamScore.compute(ExamScoring.jlptN1, rs);
      expect(n1.overall, '98/180');
      expect(n1.passed, isFalse); // < 100
      expect(ExamScoring.jlptN2.passMark, 90);
      expect(ExamScoring.toefl.isJlpt, isFalse);
    });
  });
}
