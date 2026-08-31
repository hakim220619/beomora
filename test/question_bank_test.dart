// Bank soal Tebak Huruf: setiap kursus punya paket, isinya cukup untuk
// membuat 4 pilihan jawaban, dan pasangannya tidak kosong.
import 'package:flutter_test/flutter_test.dart';

import 'package:beomora/data/question_bank.dart';

void main() {
  test('semua kursus punya paket soal huruf', () {
    for (final courseId in ['en', 'ja', 'id']) {
      final categories = letterQuizFor(courseId);
      expect(categories, isNotEmpty,
          reason: 'kursus $courseId tanpa paket soal');
      for (final cat in categories) {
        expect(cat.items.length, greaterThanOrEqualTo(10),
            reason: 'paket ${cat.id} terlalu kecil');
        for (final item in cat.items) {
          expect(item.kana, isNotEmpty);
          expect(item.romaji, isNotEmpty);
        }
        expect(cat.title['id'], isNotNull);
        expect(cat.title['en'], isNotNull);
      }
    }
  });

  test('kursus jepang memuat hiragana dan katakana dari materi', () {
    final categories = letterQuizFor('ja');
    expect(categories.map((c) => c.id),
        containsAll(['hiragana', 'katakana', 'kana_mix']));
    final hiragana =
        categories.firstWhere((c) => c.id == 'hiragana').items;
    expect(hiragana.any((k) => k.kana == 'あ' && k.romaji == 'a'), isTrue);
    final katakana =
        categories.firstWhere((c) => c.id == 'katakana').items;
    expect(katakana.any((k) => k.kana == 'ア' && k.romaji == 'a'), isTrue);
  });

  test('paket campuran berisi gabungan hiragana + katakana', () {
    final categories = letterQuizFor('ja');
    final hiragana =
        categories.firstWhere((c) => c.id == 'hiragana').items;
    final katakana =
        categories.firstWhere((c) => c.id == 'katakana').items;
    final mix = categories.firstWhere((c) => c.id == 'kana_mix').items;
    expect(mix.length, hiragana.length + katakana.length);
    expect(mix.any((k) => k.kana == 'あ'), isTrue);
    expect(mix.any((k) => k.kana == 'ア'), isTrue);
  });
}
