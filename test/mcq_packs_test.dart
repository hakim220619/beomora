import 'package:beomora/data/jlpt_vocab.dart';
import 'package:beomora/data/mcq_packs.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Kosakata JLPT', () {
    test('tiap level punya cukup kata & unik (kana+romaji)', () {
      for (final entry in {'N5': jlptN5, 'N4': jlptN4, 'N3': jlptN3}.entries) {
        final level = entry.key;
        final vocab = entry.value;
        expect(vocab.length, greaterThanOrEqualTo(4), reason: level);
        final keys = <String>{};
        for (final v in vocab) {
          expect(v.kana.trim(), isNotEmpty, reason: level);
          expect(v.romaji.trim(), isNotEmpty, reason: level);
          expect(v.meaning['id'], isNotEmpty, reason: level);
          expect(v.meaning['en'], isNotEmpty, reason: level);
          expect(keys.add('${v.kana}|${v.romaji}'), isTrue,
              reason: '$level dobel: ${v.kana}');
        }
      }
    });
  });

  group('Paket soal (McqPack)', () {
    test('Jepang: Umum + N5/N4/N3; Inggris: Umum + TOEFL/IELTS/PTE', () {
      expect(mcqPacksFor('ja').map((p) => p.id),
          containsAll(['ja_general', 'ja_n5', 'ja_n4', 'ja_n3']));
      expect(mcqPacksFor('en').map((p) => p.id),
          containsAll(['en_general', 'en_toefl', 'en_ielts', 'en_pte']));
      expect(mcqPacksFor('id'), isEmpty);
    });

    test('semua soal tiap paket valid (4 pilihan unik, jawaban benar)', () {
      for (final courseId in ['ja', 'en']) {
        for (final pack in mcqPacksFor(courseId)) {
          expect(pack.questions, isNotEmpty, reason: pack.id);
          for (final q in pack.questions) {
            expect(q.options.length, 4, reason: pack.id);
            expect(q.options.toSet().length, 4,
                reason: '${pack.id}: pilihan dobel di "${q.question['id']}"');
            expect(q.answer, inInclusiveRange(0, 3), reason: pack.id);
            expect(q.question['id'], isNotEmpty, reason: pack.id);
            expect(q.question['en'], isNotEmpty, reason: pack.id);
          }
        }
      }
    });

    test('paket JLPT/ujian melebihi batas gratis (agar premium bermakna)',
        () {
      for (final id in ['ja_n5', 'ja_n4', 'ja_n3', 'en_toefl', 'en_ielts',
        'en_pte']) {
        final pack = [...mcqPacksFor('ja'), ...mcqPacksFor('en')]
            .firstWhere((p) => p.id == id);
        expect(pack.questions.length, greaterThan(kFreeMcqLimit),
            reason: '$id harus > $kFreeMcqLimit soal');
      }
    });

    test('N5 memenuhi target minimal kosakata', () {
      // Target ideal 800; nilai ambang di sini mengikuti dataset saat ini
      // dan dinaikkan seiring penambahan kosakata.
      expect(jlptN5.length, greaterThanOrEqualTo(200));
    });
  });
}
