import 'dart:math';

import 'package:beomora/data/exam_blueprints.dart';
import 'package:beomora/data/jlpt_vocab_quiz.dart';
import 'package:beomora/data/kanji_bank.dart';
import 'package:beomora/models/exam.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const prompt = {'id': 'x', 'en': 'x'};

  test('susun: benar hanya bila urutannya tepat', () {
    const o = OrderItem(prompt: prompt, pieces: ['I', 'still need', 'help']);
    final item = ExamItem.ordering(ExamSectionKind.writing, o, Random(1));
    expect(item.options.toSet(), {'I', 'still need', 'help'});
    expect(item.options.join(), isNot('Istill needhelp'));
    item.userAnswer = ['I', 'help', 'still need'].join(ExamItem.orderSeparator);
    expect(item.correct, isFalse);
    item.userAnswer = o.pieces.join(ExamItem.orderSeparator);
    expect(item.correct, isTrue);
  });

  test('tandai kata: benar bila indeks kata yang diganti dipilih', () {
    const p = WordPickItem(
      prompt: prompt,
      spoken: 'The results were published last year.',
      wrongIndex: 3,
      shownWord: 'printed',
    );
    expect(p.shownWords[3], 'printed');
    final item = ExamItem.picking(ExamSectionKind.listening, p);
    expect(item.isAudio, isTrue);
    expect(item.passageText, p.spoken);
    item.userAnswer = '2';
    expect(item.correct, isFalse);
    item.userAnswer = '3';
    expect(item.correct, isTrue);
  });

  test('dikte: benar bila ≥ 80% kata tertulis', () {
    const w = WritingItem(
      prompt: prompt,
      text: '',
      answers: ['Students must submit the report before Friday.'],
      dictation: true,
    );
    final item = ExamItem.typing(ExamSectionKind.listening, w);
    expect(item.isAudio, isTrue);
    item.userAnswer = 'students must submit the report before friday';
    expect(item.correct, isTrue);
    item.userAnswer = 'students must submit report';
    expect(item.correct, isFalse);
  });

  test('esai tidak ikut nilai otomatis; bagian esai saja = nilai sendiri', () {
    const essay = EssayItem(
      title: prompt,
      task: 'Write about…',
      minWords: 250,
      modelAnswer: '…',
      checklist: [prompt],
    );
    final bp = ExamBlueprint(
      id: 't',
      courseId: 'en',
      emoji: '',
      title: prompt,
      subtitle: prompt,
      sections: [
        ExamSection.mixed(
          ExamSectionKind.writing,
          minutes: 60,
          parts: const [
            ExamPart.essay([essay], 1),
          ],
        ),
      ],
      scoring: ExamScoring.ielts,
      pools: const ExamPools(),
    );
    final session = ExamSession.build(bp, Random(1));
    expect(session.totalQuestions, 1);
    expect(session.totalScored, 0);
    expect(session.essays, hasLength(1));
    expect(session.missed, isEmpty);
    final score = ExamScore.compute(bp.scoring, session.results);
    expect(score.perSection, isEmpty);
  });

  test('versi mini membagi soal ke tiap part dan melewati esai', () {
    final s = ExamSection.mixed(
      ExamSectionKind.writing,
      minutes: 30,
      parts: const [
        ExamPart.order([], 10),
        ExamPart.essay([], 1),
        ExamPart.essay([], 1),
      ],
    );
    expect(s.questionCount, 12);
    final mini = s.copyWith(questionCount: 3);
    expect(mini.parts, hasLength(1));
    expect(mini.parts.single.type, ExamPartType.order);
    expect(mini.parts.single.count, 3);
  });

  test('skor TOEFL: band 1–6 per bagian + padanan 0–30', () {
    final score = ExamScore.compute(ExamScoring.toefl, const [
      ExamSectionResult(ExamSectionKind.reading, 10, 10),
      ExamSectionResult(ExamSectionKind.listening, 5, 10),
    ]);
    expect(score.perSection[ExamSectionKind.reading], 'Band 6');
    expect(score.perSection[ExamSectionKind.listening], 'Band 3.5');
    expect(score.overall, 'Band 5 · ≈ 45/60');
  });

  test('kosakata JLPT gaya asli: tanpa romaji, jawaban tunggal', () {
    for (final sections in [kanjiN5Sections, kanjiN4Sections]) {
      final reading = kanjiReadingQuestions(sections);
      final spelling = kanjiSpellingQuestions(sections);
      expect(reading.length, greaterThan(100));
      expect(spelling.length, greaterThan(80));
      for (final q in [...reading, ...spelling]) {
        expect(q.options.toSet(), hasLength(4));
        for (final o in q.options) {
          expect(o, isNot(matches(RegExp('[a-zA-Z]'))), reason: o);
        }
      }
    }
  });

  test('setiap ujian: semua bagian terisi penuh & soal tidak dobel', () {
    for (final course in ['en', 'ja']) {
      for (final bp in examsFor(course)) {
        for (var seed = 0; seed < 5; seed++) {
          final session = ExamSession.build(bp, Random(seed));
          expect(session.sections.length, bp.sections.length, reason: bp.id);
          for (var i = 0; i < session.sections.length; i++) {
            final want = session.sections[i].questionCount;
            final got = session.items[i];
            expect(got.length, want, reason: '${bp.id} bagian $i');
            final keys = got.map(
              (e) => e.mcq ?? e.writing ?? e.order ?? e.pick ?? e.essay,
            );
            expect(keys.toSet().length, got.length, reason: bp.id);
          }
          // Versi mini tetap 10 soal.
          final mini = ExamSession.build(bp, Random(seed), mini: true);
          expect(mini.totalQuestions, 10, reason: '${bp.id} mini');
        }
      }
    }
  });

  test('format JLPT N5/N4: kosakata tanpa romaji', () {
    for (final id in ['ja_n5', 'ja_n4']) {
      final bp = examById(id)!;
      final vocab = bp.sections.firstWhere(
        (s) => s.kind == ExamSectionKind.vocab,
      );
      for (final part in vocab.parts) {
        for (final q in part.mcq) {
          for (final o in q.options) {
            expect(o, isNot(matches(RegExp('[a-zA-Z]'))), reason: '$id $o');
          }
        }
      }
    }
  });
}
