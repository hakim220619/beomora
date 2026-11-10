import 'dart:math';

import 'package:beomora/data/exam_blueprints.dart';
import 'package:beomora/data/mcq_bank.dart';
import 'package:beomora/models/exam.dart';
import 'package:flutter_test/flutter_test.dart';

void _expectValidMcq(McqQuestion q, String where) {
  // 4 pilihan; khusus soal IELTS True/False/Not Given cukup 3.
  final tfng = q.options.toSet().containsAll(['True', 'False', 'Not Given']);
  final n = tfng ? 3 : 4;
  expect(q.options.length, n, reason: '$where: ${q.question['id']}');
  expect(
    q.options.toSet().length,
    n,
    reason: '$where: pilihan dobel di "${q.question['id']}"',
  );
  expect(q.options.any((o) => o.trim().isEmpty), isFalse, reason: where);
  expect(q.answer, inInclusiveRange(0, 3), reason: where);
  expect(q.question['id'], isNotEmpty, reason: where);
  expect(q.question['en'], isNotEmpty, reason: where);
}

void main() {
  final all = [
    ...examsFor('en'),
    ...examsFor('ja'),
    ...examsFor('ko'),
    ...examsFor('de'),
  ];

  group('Cetak biru ujian', () {
    test('Inggris: TOEFL/IELTS/PTE; Jepang: N5–N1; Korea: TOPIK I & EPS', () {
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
      expect(examsFor('ko').map((e) => e.id), ['ko_topik1', 'ko_eps']);
      expect(examsFor('de').map((e) => e.id), ['de_goethe_a1', 'de_goethe_a2']);
      expect(examsFor('id'), isEmpty);
      expect(examById('ja_n2')?.scoring, ExamScoring.jlptN2);
      expect(examById('zz'), isNull);
    });

    test('jumlah soal mengikuti ujian asli', () {
      int count(String id, ExamSectionKind k) =>
          examById(id)!.section(k)!.questionCount;
      // TOEFL format 2026 (satu tahap tes adaptif) & JLPT sejak 2020.
      expect(count('en_toefl', ExamSectionKind.reading), 28);
      expect(count('en_toefl', ExamSectionKind.listening), 24);
      expect(count('en_toefl', ExamSectionKind.writing), 12);
      expect(count('en_ielts', ExamSectionKind.reading), 40);
      expect(count('en_ielts', ExamSectionKind.listening), 40);
      expect(count('ja_n5', ExamSectionKind.vocab), 21);
      expect(count('ja_n4', ExamSectionKind.vocab), 28);
      expect(count('en_ielts', ExamSectionKind.writing), 2);
      expect(count('ja_n5', ExamSectionKind.listening), 24);
      expect(count('ja_n4', ExamSectionKind.listening), 28);
      expect(count('ja_n3', ExamSectionKind.listening), 28);
      expect(count('ja_n2', ExamSectionKind.listening), 30);
      expect(count('ja_n1', ExamSectionKind.listening), 37);
      expect(examById('ja_n5')!.totalMinutes, greaterThanOrEqualTo(100));
      expect(examById('ja_n1')!.totalMinutes, greaterThanOrEqualTo(170));
    });

    test('pool tiap bagian cukup untuk jumlah soal (tanpa pengulangan)', () {
      int available(ExamPart p) => switch (p.type) {
        ExamPartType.mcq => p.mcq.length,
        ExamPartType.reading => p.passages.fold(
          0,
          (n, r) => n + r.questions.length,
        ),
        ExamPartType.listening => p.audio.fold(
          0,
          (n, a) => n + a.questions.length,
        ),
        ExamPartType.typing => p.typing.length,
        ExamPartType.order => p.order.length,
        ExamPartType.pick => p.pick.length,
        ExamPartType.essay => p.essays.length,
      };
      for (final e in all) {
        for (final s in e.sections) {
          if (s.parts.isEmpty) {
            expect(
              e.pools.available(s.kind),
              greaterThanOrEqualTo(s.questionCount),
              reason: '${e.id} ${s.kind.name}',
            );
          }
          for (final p in s.parts) {
            // Pool minimal 2× kebutuhan supaya sesi tidak selalu sama.
            expect(
              available(p),
              greaterThanOrEqualTo(p.count * 2),
              reason: '${e.id} ${s.kind.name} ${p.type.name}',
            );
          }
        }
      }
    });

    test('semua soal pilihan ganda & bacaan valid', () {
      for (final e in all) {
        final p = e.pools;
        final parts = [for (final s in e.sections) ...s.parts];
        for (final q in [
          ...p.vocab,
          ...p.grammar,
          ...p.readingExtra,
          for (final part in parts) ...part.mcq,
        ]) {
          _expectValidMcq(q, e.id);
        }
        final ids = <String>{};
        final passages = {
          ...p.reading,
          for (final part in parts) ...part.passages,
        };
        for (final r in passages) {
          expect(ids.add(r.id), isTrue, reason: '${e.id}: id bacaan dobel');
          expect(r.text.trim(), isNotEmpty, reason: r.id);
          expect(r.title['id'], isNotEmpty, reason: r.id);
          expect(r.title['en'], isNotEmpty, reason: r.id);
          // Teks harian TOEFL & 情報検索 cukup 2 soal; TOPIK I (soal
          // 50–70) lazim satu teks satu soal.
          expect(
            r.questions.length,
            greaterThanOrEqualTo(e.scoring.isKorean ? 1 : 2),
            reason: r.id,
          );
          for (final q in r.questions) {
            _expectValidMcq(q, r.id);
          }
        }
        for (final part in parts) {
          for (final o in part.order) {
            expect(o.pieces.length, greaterThanOrEqualTo(3), reason: e.id);
            expect(o.pieces.toSet().length, o.pieces.length, reason: e.id);
          }
          for (final w in part.pick) {
            expect(
              w.shownWords[w.wrongIndex],
              isNot(w.spokenWords[w.wrongIndex]),
              reason: w.spoken,
            );
          }
          for (final es in part.essays) {
            expect(es.task.trim(), isNotEmpty, reason: e.id);
            expect(es.modelAnswer.trim(), isNotEmpty, reason: e.id);
            expect(es.checklist, isNotEmpty, reason: e.id);
          }
          for (final w in part.typing) {
            expect(w.accepts(w.answers.first), isTrue, reason: w.text);
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
            if (it.isTyping || it.isPick) {
              expect(it.options, isEmpty);
            } else if (it.isOrder) {
              expect(it.options.toSet(), it.order!.pieces.toSet());
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
      expect(s.totalCorrect, s.totalScored);
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
    test('TOEFL 2026: band 1–6 per bagian + padanan 0–30', () {
      final sc = ExamScore.compute(ExamScoring.toefl, const [
        ExamSectionResult(ExamSectionKind.reading, 20, 20),
        ExamSectionResult(ExamSectionKind.listening, 14, 28),
        ExamSectionResult(ExamSectionKind.writing, 5, 10),
      ]);
      expect(sc.perSection[ExamSectionKind.reading], 'Band 6');
      expect(sc.perSection[ExamSectionKind.listening], 'Band 3.5');
      expect(sc.overall, 'Band 4.5 · ≈ 60/90');
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

    test('TOPIK I: /200 dengan Level 1 (≥ 80) & Level 2 (≥ 140)', () {
      final l2 = ExamScore.compute(ExamScoring.topik1, const [
        ExamSectionResult(ExamSectionKind.listening, 24, 30),
        ExamSectionResult(ExamSectionKind.reading, 32, 40),
      ]);
      expect(l2.overall, '160/200 · Level 2');
      expect(l2.passed, isTrue);
      final fail = ExamScore.compute(ExamScoring.topik1, const [
        ExamSectionResult(ExamSectionKind.listening, 9, 30),
        ExamSectionResult(ExamSectionKind.reading, 12, 40),
      ]);
      expect(fail.overall, '60/200');
      expect(fail.passed, isFalse);
    });

    test('EPS-TOPIK: 4 poin per soal, lulus ≥ 80', () {
      final sc = ExamScore.compute(ExamScoring.epsTopik, const [
        ExamSectionResult(ExamSectionKind.reading, 15, 25),
        ExamSectionResult(ExamSectionKind.listening, 10, 25),
      ]);
      expect(sc.overall, '100/200');
      expect(sc.perSection[ExamSectionKind.reading], '60/100');
      expect(sc.passed, isTrue);
    });

    test('Goethe A1 rata-rata ≥ 60; A2 tiap modul ≥ 60', () {
      const results = [
        ExamSectionResult(ExamSectionKind.reading, 14, 20),
        ExamSectionResult(ExamSectionKind.listening, 10, 20),
      ];
      final a1 = ExamScore.compute(ExamScoring.goetheA1, results);
      expect(a1.overall, '60/100');
      expect(a1.passed, isTrue);
      final a2 = ExamScore.compute(ExamScoring.goetheA2, results);
      expect(a2.perSection[ExamSectionKind.listening], '50/100');
      expect(a2.passed, isFalse); // Hören < 60
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
