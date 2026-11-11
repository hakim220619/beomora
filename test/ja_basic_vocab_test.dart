import 'package:beomora/data/ja_basic_vocab.dart';
import 'package:beomora/data/ja_phrases.dart';
import 'package:beomora/data/jlpt_vocab.dart';
import 'package:beomora/data/jlpt_vocab_adv.dart';
import 'package:beomora/data/study_guides.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final words = [
    for (final s in kJaBasicVocabTopic.sections)
      for (final e in s.examples)
        if (e.target.split(' ').length < 3) e,
  ];

  test('Kosakata Dasar: terdaftar di Materi kursus Jepang', () {
    expect(
      kStudyGuides['ja']!.map((t) => t.id),
      contains(kJaBasicVocabTopic.id),
    );
    expect(kJaBasicVocabTopic.id, contains('vocab')); // grup Kosakata
    expect(words.length, greaterThan(150));
  });

  test('tidak menduplikasi kosakata JLPT & ungkapan yang sudah ada', () {
    final existing = {
      for (final v in [
        ...jlptN5,
        ...jlptN4,
        ...jlptN3,
        ...jlptN2,
        ...jlptN1,
        ...jaPhraseVocab,
        ...jaWorkVocab,
        ...jaAizuchiVocab,
      ])
        v.kana,
    };
    final targets = [for (final w in words) w.target];
    expect(targets.where(existing.contains), isEmpty);
    expect(targets.toSet().length, targets.length, reason: 'kata ganda');
  });

  test('setiap entri punya romaji & arti; kalimat sejajar dengan romaji', () {
    for (final s in kJaBasicVocabTopic.sections) {
      for (final e in s.examples) {
        expect(e.romaji, isNotEmpty, reason: e.target);
        expect(e.meaning['id'], isNotEmpty, reason: e.target);
        expect(e.meaning['en'], isNotEmpty, reason: e.target);
        if (e.target.split(' ').length >= 3) {
          expect(
            e.romaji!.split(' ').length,
            e.target.split(' ').length,
            reason: e.target,
          );
        }
      }
    }
  });
}
