// Ungkapan Jepang (lib/data/ja_phrases.dart): lengkap, unik, grup
// berurutan, dan tiap entri punya contoh kalimat kana + romaji.
import 'package:flutter_test/flutter_test.dart';

import 'package:beomora/data/ja_phrases.dart';
import 'package:beomora/data/jlpt_vocab.dart';
import 'package:beomora/data/vocab_examples.dart';

void main() {
  final lists = {
    'Ungkapan sehari-hari': (jaPhraseVocab, jaPhraseVocabGroups, 200),
    'Aizuchi': (jaAizuchiVocab, jaAizuchiVocabGroups, 40),
    'Onomatope': (jaOnomatopeVocab, jaOnomatopeVocabGroups, 100),
    'Kerja & keigo': (jaWorkVocab, jaWorkVocabGroups, 60),
    'Idiom & peribahasa': (jaIdiomVocab, jaIdiomVocabGroups, 100),
  };

  test('lengkap, unik terhadap JLPT, grup berurutan, arti tidak kembar', () {
    final seen = {
      for (final w in [...jlptN5, ...jlptN4, ...jlptN3]) w.kana,
    };
    lists.forEach((name, data) {
      final (words, groups, minimum) = data;
      expect(words.length, greaterThanOrEqualTo(minimum), reason: name);
      var last = 0;
      for (final w in words) {
        expect(seen.add(w.kana), isTrue, reason: '$name: ${w.kana}');
        expect(w.romaji, isNotEmpty, reason: w.kana);
        expect(w.kana, isNot(matches(RegExp('[一-鿿]'))), reason: w.kana);
        expect(w.group, greaterThanOrEqualTo(last), reason: w.kana);
        expect(w.group, lessThan(groups.length), reason: w.kana);
        last = w.group;
      }
      expect({for (final w in words) w.group}.length, groups.length);
      for (final lang in ['id', 'en']) {
        final meanings = words.map((w) => w.meaning[lang]).toList();
        expect(meanings.toSet().length, meanings.length, reason: name);
      }
    });
  });

  test('tiap ungkapan punya contoh kalimat kana + romaji + terjemahan', () {
    lists.forEach((name, data) {
      for (final w in data.$1) {
        final u = vocabUsageFor('ja', w.kana);
        expect(u, isNotNull, reason: '$name: ${w.kana}');
        expect(u!.reading, isNotEmpty, reason: w.kana);
        expect(u.translation('id'), isNotEmpty, reason: w.kana);
        expect(u.translation('en'), isNotEmpty, reason: w.kana);
        expect(u.usage('id'), isNotEmpty, reason: w.kana);
        expect(u.sentence, isNot(matches(RegExp('[一-鿿]'))), reason: w.kana);
      }
    });
  });
}
