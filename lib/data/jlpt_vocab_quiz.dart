import 'dart:math';

import 'kanji_bank.dart';
import 'mcq_bank.dart';

/// Soal kosakata gaya JLPT yang dibangkitkan dari contoh kata di
/// [kanjiN5Sections] dst. — tanpa terjemahan & tanpa romaji, seperti
/// ujian aslinya:
/// - 漢字読み: kata berkanji → pilih cara bacanya (hiragana);
/// - 表記: kata dalam hiragana → pilih tulisan kanjinya.
/// Pilihan pertama = jawaban benar (layar ujian yang mengacak).

List<KanjiWord> _wordsOf(List<KanjiSection> sections) => [
  for (final s in sections)
    for (final k in s.entries) ...k.words,
];

/// Pengecoh: kata lain dengan panjang mirip, diutamakan yang berbagi
/// huruf dengan jawaban (lebih menjebak), dipilih tetap per [seed].
List<String> _distractors(
  String answer,
  List<String> pool,
  int seed, {
  required Set<String> exclude,
}) {
  final rng = Random(seed);
  final candidates = [
    for (final p in pool)
      if (p != answer && !exclude.contains(p)) p,
  ]..shuffle(rng);
  int closeness(String p) {
    final shared = p.split('').where(answer.contains).length;
    return shared * 3 - (p.length - answer.length).abs();
  }

  candidates.sort((a, b) => closeness(b).compareTo(closeness(a)));
  final out = <String>[];
  for (final c in candidates.take(12).toList()..shuffle(rng)) {
    if (out.length == 3) break;
    if (!out.contains(c)) out.add(c);
  }
  return out;
}

/// 漢字読み — "Bagaimana cara baca kata ini?"
List<McqQuestion> kanjiReadingQuestions(List<KanjiSection> sections) {
  final words = _wordsOf(sections);
  final readings = words.map((w) => w.kana).toSet().toList();
  final out = <McqQuestion>[];
  for (var i = 0; i < words.length; i++) {
    final w = words[i];
    final wrong = _distractors(w.kana, readings, i, exclude: {w.kana});
    if (wrong.length < 3) continue;
    out.add(
      McqQuestion(
        question: {
          'id': 'Bagaimana cara baca kata ini?\n「${w.word}」',
          'en': 'How is this word read?\n「${w.word}」',
        },
        options: [w.kana, ...wrong],
        answer: 0,
      ),
    );
  }
  return out;
}

/// 表記 — "Bagaimana tulisan kanjinya?" Kata yang bacaannya sama dengan
/// kata lain (homofon) dilewati supaya jawabannya tunggal.
List<McqQuestion> kanjiSpellingQuestions(List<KanjiSection> sections) {
  final words = _wordsOf(sections);
  final byReading = <String, int>{};
  for (final w in words) {
    byReading[w.kana] = (byReading[w.kana] ?? 0) + 1;
  }
  final spellings = words.map((w) => w.word).toSet().toList();
  final out = <McqQuestion>[];
  for (var i = 0; i < words.length; i++) {
    final w = words[i];
    if (byReading[w.kana]! > 1 || w.word == w.kana) continue;
    final sameReading = {
      for (final o in words)
        if (o.kana == w.kana) o.word,
    };
    final wrong = _distractors(
      w.word,
      spellings,
      i + 7919,
      exclude: sameReading,
    );
    if (wrong.length < 3) continue;
    out.add(
      McqQuestion(
        question: {
          'id': 'Bagaimana tulisan kanjinya?\n「${w.kana}」',
          'en': 'How is it written in kanji?\n「${w.kana}」',
        },
        options: [w.word, ...wrong],
        answer: 0,
      ),
    );
  }
  return out;
}
