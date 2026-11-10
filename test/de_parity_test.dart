// Kesetaraan fitur Jerman dengan Jepang: ungkapan & tata bahasa di
// Materi, paket Pilihan Ganda & Tebak Kata Goethe di Latihan.
import 'package:flutter_test/flutter_test.dart';

import 'package:beomora/data/de_phrases.dart';
import 'package:beomora/data/mcq_packs.dart';
import 'package:beomora/data/study_guides.dart';
import 'package:beomora/data/goethe_vocab.dart';
import 'package:beomora/data/vocab_examples.dart';

void main() {
  test('ungkapan Jerman: unik, grup berurutan, punya contoh kalimat', () {
    final lists = {
      'Sehari-hari': (dePhraseVocab, dePhraseVocabGroups, 200),
      'Kerja': (deWorkVocab, deWorkVocabGroups, 70),
      'Partikel': (deParticleVocab, deParticleVocabGroups, 60),
      'Idiom': (deIdiomVocab, deIdiomVocabGroups, 90),
    };
    final seen = {for (final w in goetheVocab) w.kana};
    lists.forEach((name, data) {
      final (words, groups, minimum) = data;
      expect(words.length, greaterThanOrEqualTo(minimum), reason: name);
      var last = 0;
      for (final w in words) {
        expect(seen.add(w.kana), isTrue, reason: '$name: ${w.kana}');
        expect(w.group, greaterThanOrEqualTo(last), reason: w.kana);
        expect(w.group, lessThan(groups.length), reason: w.kana);
        last = w.group;
        final u = vocabUsageFor('de', w.kana);
        expect(u, isNotNull, reason: w.kana);
        expect(u!.reading, isEmpty, reason: w.kana); // Jerman tanpa bacaan
        expect(u.translation('id'), isNotEmpty, reason: w.kana);
      }
      for (final lang in ['id', 'en']) {
        final m = words.map((w) => w.meaning[lang]).toList();
        expect(m.toSet().length, m.length, reason: '$name $lang');
      }
    });
  });

  test('tata bahasa Jerman tampil di Materi setelah Partikel', () {
    final ids = kStudyGuides['de']!.map((t) => t.id).toList();
    expect(ids.where((i) => i.startsWith('de_gr_')).length, 7);
    expect(
      ids.indexOf('de_gr_word_order'),
      greaterThan(ids.indexOf('de_present')),
    );
    for (final t in kStudyGuides['de']!.where(
      (t) => t.id.startsWith('de_gr_'),
    )) {
      expect(t.sections, isNotEmpty, reason: t.id);
      for (final s in t.sections) {
        expect(s.examples, isNotEmpty, reason: '${t.id} ${s.title['id']}');
      }
    }
  });

  test('Pilihan Ganda Jerman: satu paket per kategori, ≥ 4 opsi tiap soal', () {
    final packs = mcqPacksFor('de');
    expect(packs.length, goetheVocabCategories.length);
    var total = 0;
    for (final p in packs) {
      expect(p.questions, isNotEmpty, reason: p.id);
      for (final q in p.questions) {
        expect(q.options.length, 4);
        expect(q.options.toSet().length, 4);
      }
      total += p.questions.length;
    }
    expect(total, goetheVocab.length);
  });

  test('kategori Tebak Kata menutup semua tema', () {
    expect(goetheGroupCategory.length, goetheVocabGroups.length);
    expect(goetheGroupCategory.toSet(), {
      for (var i = 0; i < goetheVocabCategories.length; i++) i,
    });
  });
}
