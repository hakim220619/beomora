// Urutan kosakata JLPT per tema (tool/jlpt_themes.py): tiap tema satu
// blok utuh, dan kelompok waktu urut lampau → kini → depan.
import 'package:flutter_test/flutter_test.dart';

import 'package:beomora/data/jlpt_vocab.dart';

void main() {
  final levels = {
    'N5': (jlptN5, jlptN5Groups),
    'N4': (jlptN4, jlptN4Groups),
    'N3': (jlptN3, jlptN3Groups),
  };

  test('tiap tema muncul sebagai satu blok berurutan', () {
    levels.forEach((level, data) {
      final (words, groups) = data;
      var last = -1;
      for (final w in words) {
        expect(w.group >= last, isTrue, reason: '$level: ${w.kana} mundur');
        expect(w.group < groups.length, isTrue);
        last = w.group;
      }
      // Semua tema terpakai.
      expect({for (final w in words) w.group}.length, groups.length);
    });
  });

  test('N5: lalu → ini → depan untuk minggu, bulan & tahun', () {
    List<String> order(List<String> kana) {
      final idx = [for (final k in kana) jlptN5.indexWhere((w) => w.kana == k)];
      expect(idx.contains(-1), isFalse, reason: '$kana');
      return [
        for (final i in [...idx]..sort()) jlptN5[i].kana,
      ];
    }

    for (final seq in [
      ['おととい', 'きのう', 'きょう', 'あした', 'あさって'],
      ['せんしゅう', 'こんしゅう', 'らいしゅう', 'さらいしゅう'],
      ['せんげつ', 'こんげつ', 'らいげつ'],
      ['おととし', 'きょねん', 'ことし', 'らいねん', 'さらいねん'],
    ]) {
      expect(order(seq), seq);
    }
    // Satu tahun-tahunan berdampingan langsung.
    final i = jlptN5.indexWhere((w) => w.kana == 'きょねん');
    expect(jlptN5[i + 1].kana, 'ことし');
    expect(jlptN5[i + 2].kana, 'らいねん');
  });
}
