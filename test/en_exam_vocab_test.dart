import 'package:beomora/data/en_exam_vocab.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('kosakata Akademik/IELTS/TOEIC lengkap & tidak dobel', () {
    // Akademik: seluruh 570 kata Academic Word List + tambahan.
    final minimum = {'Akademik': 570, 'IELTS': 250, 'TOEIC': 450};
    final lists = {
      'Akademik': academicVocab,
      'IELTS': ieltsVocab,
      'TOEIC': toeicVocab,
    };
    final seen = <String>{};
    for (final entry in lists.entries) {
      expect(
        entry.value.length,
        greaterThanOrEqualTo(minimum[entry.key]!),
        reason: entry.key,
      );
      for (final w in entry.value) {
        expect(seen.add(w.word.toLowerCase()), isTrue, reason: w.word);
        expect(w.pron, isNotEmpty, reason: w.word);
        expect(w.meaning['id'], isNotEmpty, reason: w.word);
        expect(w.meaning['en'], isNotEmpty, reason: w.word);
      }
      // Arti tidak boleh kembar dalam satu daftar (kuis jadi ambigu).
      for (final lang in ['id', 'en']) {
        final meanings = entry.value.map((w) => w.meaning[lang]).toList();
        expect(meanings.toSet().length, meanings.length, reason: entry.key);
      }
    }
  });
}
