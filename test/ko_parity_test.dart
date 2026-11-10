// Kesetaraan fitur Korea dengan Jepang: ungkapan & tata bahasa di
// Materi, paket Pilihan Ganda & Tebak Kata TOPIK di Latihan.
import 'package:flutter_test/flutter_test.dart';

import 'package:beomora/data/ko_phrases.dart';
import 'package:beomora/data/mcq_packs.dart';
import 'package:beomora/data/study_guides.dart';
import 'package:beomora/data/topik_vocab.dart';
import 'package:beomora/data/vocab_examples.dart';

void main() {
  test('ungkapan Korea: unik, grup berurutan, punya contoh kalimat', () {
    final lists = {
      'Sehari-hari': (koPhraseVocab, koPhraseVocabGroups, 200),
      'Kerja & EPS': (koWorkVocab, koWorkVocabGroups, 70),
      'Onomatope': (koOnomatopeVocab, koOnomatopeVocabGroups, 100),
      'Idiom': (koIdiomVocab, koIdiomVocabGroups, 90),
    };
    final seen = {for (final w in topikVocab) w.kana};
    lists.forEach((name, data) {
      final (words, groups, minimum) = data;
      expect(words.length, greaterThanOrEqualTo(minimum), reason: name);
      var last = 0;
      for (final w in words) {
        expect(seen.add(w.kana), isTrue, reason: '$name: ${w.kana}');
        expect(w.group, greaterThanOrEqualTo(last), reason: w.kana);
        expect(w.group, lessThan(groups.length), reason: w.kana);
        last = w.group;
        final u = vocabUsageFor('ko', w.kana);
        expect(u, isNotNull, reason: w.kana);
        expect(u!.reading, isNotEmpty, reason: w.kana);
        expect(u.translation('id'), isNotEmpty, reason: w.kana);
      }
      for (final lang in ['id', 'en']) {
        final m = words.map((w) => w.meaning[lang]).toList();
        expect(m.toSet().length, m.length, reason: '$name $lang');
      }
    });
  });

  test('tata bahasa Korea tampil di Materi setelah Partikel', () {
    final ids = kStudyGuides['ko']!.map((t) => t.id).toList();
    expect(ids.where((i) => i.startsWith('ko_gr_')).length, 7);
    expect(
      ids.indexOf('ko_gr_speech_levels'),
      greaterThan(ids.indexOf('ko_particles')),
    );
    for (final t in kStudyGuides['ko']!.where(
      (t) => t.id.startsWith('ko_gr_'),
    )) {
      expect(t.sections, isNotEmpty, reason: t.id);
      for (final s in t.sections) {
        expect(s.examples, isNotEmpty, reason: '${t.id} ${s.title['id']}');
      }
    }
  });

  test('Pilihan Ganda Korea: satu paket per kategori, ≥ 4 opsi tiap soal', () {
    final packs = mcqPacksFor('ko');
    expect(packs.length, topikVocabCategories.length);
    var total = 0;
    for (final p in packs) {
      expect(p.questions, isNotEmpty, reason: p.id);
      for (final q in p.questions) {
        expect(q.options.length, 4);
        expect(q.options.toSet().length, 4);
      }
      total += p.questions.length;
    }
    expect(total, topikVocab.length);
  });

  test('kategori Tebak Kata menutup semua tema', () {
    expect(topikGroupCategory.length, topikVocabGroups.length);
    expect(topikGroupCategory.toSet(), {
      for (var i = 0; i < topikVocabCategories.length; i++) i,
    });
  });
}
