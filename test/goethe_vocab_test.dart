// Kosakata inti Jerman (lib/data/goethe_vocab.dart): jumlah, unik, tema
// berurutan, artikel kata benda, dan tiap kata punya contoh kalimat.
import 'package:flutter_test/flutter_test.dart';

import 'package:beomora/data/goethe_vocab.dart';
import 'package:beomora/data/vocab_examples.dart';

void main() {
  test('±1.000 kata unik, tema berurutan, arti tidak kembar', () {
    expect(goetheVocab.length, greaterThanOrEqualTo(900));
    final seen = <String>{};
    var last = 0;
    for (final w in goetheVocab) {
      expect(seen.add(w.kana), isTrue, reason: w.kana);
      expect(w.romaji, isNotEmpty, reason: w.kana);
      expect(w.group, greaterThanOrEqualTo(last), reason: w.kana);
      expect(w.group, lessThan(goetheVocabGroups.length), reason: w.kana);
      last = w.group;
    }
    expect(
      {for (final w in goetheVocab) w.group}.length,
      goetheVocabGroups.length,
    );
    for (final lang in ['id', 'en']) {
      final meanings = goetheVocab.map((w) => w.meaning[lang]).toList();
      expect(meanings.toSet().length, meanings.length, reason: lang);
    }
  });

  test('kata benda berartikel & catatannya menyebut bentuk jamak', () {
    final nouns = goetheVocab.where(
      (w) => RegExp(r'^(der|die|das) [A-ZÄÖÜ]').hasMatch(w.kana),
    );
    expect(nouns.length, greaterThan(300));
    for (final w in nouns) {
      final u = vocabUsageFor('de', w.kana);
      expect(u, isNotNull, reason: w.kana);
      expect(u!.usage('id').toLowerCase(), contains('jamak'), reason: w.kana);
    }
  });

  test('waktu urut lampau → kini → depan', () {
    final idx = [
      for (final k in ['gestern', 'heute', 'morgen'])
        goetheVocab.indexWhere((w) => w.kana == k),
    ];
    expect(idx.contains(-1), isFalse);
    expect([...idx]..sort(), idx);
  });

  test('tiap kata punya contoh kalimat + terjemahan', () {
    for (final w in goetheVocab) {
      final u = vocabUsageFor('de', w.kana);
      expect(u, isNotNull, reason: w.kana);
      expect(u!.translation('id'), isNotEmpty, reason: w.kana);
      expect(u.translation('en'), isNotEmpty, reason: w.kana);
      expect(u.usage('en'), isNotEmpty, reason: w.kana);
    }
  });
}
