// Kosakata inti Korea (lib/data/topik_vocab.dart): jumlah, unik, tema
// berurutan, arti tidak kembar, dan tiap kata punya contoh kalimat.
import 'package:flutter_test/flutter_test.dart';

import 'package:beomora/data/topik_vocab.dart';
import 'package:beomora/data/vocab_examples.dart';

void main() {
  test('±1.000 kata unik, tema berurutan, arti tidak kembar', () {
    expect(topikVocab.length, greaterThanOrEqualTo(900));
    final seen = <String>{};
    var last = 0;
    for (final w in topikVocab) {
      expect(seen.add(w.kana), isTrue, reason: w.kana);
      expect(w.romaji, isNotEmpty, reason: w.kana);
      expect(w.kana, matches(RegExp('[가-힣]')), reason: w.kana);
      expect(w.group, greaterThanOrEqualTo(last), reason: w.kana);
      expect(w.group, lessThan(topikVocabGroups.length), reason: w.kana);
      last = w.group;
    }
    expect(
      {for (final w in topikVocab) w.group}.length,
      topikVocabGroups.length,
    );
    for (final lang in ['id', 'en']) {
      final meanings = topikVocab.map((w) => w.meaning[lang]).toList();
      expect(meanings.toSet().length, meanings.length, reason: lang);
    }
  });

  test('waktu urut lampau → kini → depan', () {
    int at(String k) => topikVocab.indexWhere((w) => w.kana == k);
    for (final seq in [
      ['어제', '오늘', '내일'],
      ['작년', '올해', '내년'],
    ]) {
      final idx = [for (final k in seq) at(k)];
      expect(idx.contains(-1), isFalse, reason: '$seq');
      expect([...idx]..sort(), idx, reason: '$seq');
    }
  });

  test('tiap kata punya contoh kalimat Hangul + romanisasi', () {
    for (final w in topikVocab) {
      final u = vocabUsageFor('ko', w.kana);
      expect(u, isNotNull, reason: w.kana);
      expect(u!.reading, isNotEmpty, reason: w.kana);
      expect(u.translation('id'), isNotEmpty, reason: w.kana);
      expect(u.translation('en'), isNotEmpty, reason: w.kana);
      expect(u.usage('id'), isNotEmpty, reason: w.kana);
    }
  });
}
