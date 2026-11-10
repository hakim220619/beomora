// Tabel gojūon Hiragana/Katakana: tiap baris 5 kolom tetap rapi
// (や・ゆ・よ, ら〜ろ, わ・を satu baris) dan yōon 3 kolom.
import 'package:flutter_test/flutter_test.dart';

import 'package:beomora/data/study_guides.dart';

void main() {
  for (final id in ['hiragana', 'katakana']) {
    test('$id: baris ya, ra, wa sejajar', () {
      final topic = kStudyGuides['ja']!.firstWhere((t) => t.id == id);
      final s = topic.sections.first;
      final rows = <String>[];
      for (var i = 0; i < s.kanaGrid.length; i += s.kanaColumns) {
        rows.add(
          s.kanaGrid
              .skip(i)
              .take(s.kanaColumns)
              .map((k) => k.isBlank ? '_' : k.romaji)
              .join(' '),
        );
      }
      expect(rows, contains('ya _ yu _ yo'));
      expect(rows, contains('ra ri ru re ro'));
      expect(rows, contains('wa _ _ _ wo'));
      expect(rows.last, 'n');
      expect(s.kana.length, 46); // sel kosong tidak ikut dihitung

      final yoon = topic.sections.firstWhere((x) => x.kanaColumns == 3);
      for (var i = 0; i < yoon.kana.length; i += 3) {
        final r = yoon.kana.skip(i).take(3).map((k) => k.romaji).toList();
        expect(
          r[0].endsWith('a') && r[1].endsWith('u') && r[2].endsWith('o'),
          isTrue,
          reason: r.join(' '),
        );
      }
    });
  }
}
