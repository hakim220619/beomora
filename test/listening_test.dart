import 'dart:math';

import 'package:beomora/data/listening_bank.dart';
import 'package:beomora/models/listening.dart';
import 'package:flutter_test/flutter_test.dart';

const kListeningCourses = ['en', 'ja', 'ko', 'de', 'id'];

void main() {
  group('Latihan Dengar (ListeningPack)', () {
    test('Inggris: Dasar + TOEFL/IELTS/PTE; Jepang: N5/N4; Korea/Jerman/'
        'Indonesia: Dasar + ujian; kursus lain kosong', () {
      expect(listeningPacksFor('en').map((p) => p.id), [
        'en_listen_basic',
        'en_listen_toefl',
        'en_listen_ielts',
        'en_listen_pte',
      ]);
      expect(listeningPacksFor('ja').map((p) => p.id), [
        'ja_listen_n5',
        'ja_listen_n4',
      ]);
      expect(listeningPacksFor('ko').map((p) => p.id), [
        'ko_listen_basic',
        'ko_listen_topik1',
      ]);
      expect(listeningPacksFor('de').map((p) => p.id), [
        'de_listen_basic',
        'de_listen_goethe',
      ]);
      expect(listeningPacksFor('id').map((p) => p.id), [
        'id_listen_basic',
        'id_listen_ukbi',
      ]);
      expect(listeningPacksFor('zz'), isEmpty);
    });

    test(
      'setiap bacaan valid: transkrip, terjemahan, >3 soal, 4 pilihan unik',
      () {
        final ids = <String>{};
        for (final courseId in kListeningCourses) {
          for (final pack in listeningPacksFor(courseId)) {
            expect(
              pack.passages.length,
              greaterThanOrEqualTo(8),
              reason: '${pack.id} terlalu sedikit bacaan',
            );
            for (final p in pack.passages) {
              expect(ids.add(p.id), isTrue, reason: 'id ganda ${p.id}');
              expect(
                p.transcript.trim().length,
                greaterThan(40),
                reason: '${p.id} transkrip terlalu pendek',
              );
              // Kursus Indonesia: transkrip sudah Indonesia, cukup
              // terjemahan Inggris; kursus lain wajib terjemahan Indonesia.
              expect(
                courseId == 'id' ? p.translation['en'] : p.translation['id'],
                isNotEmpty,
                reason: '${p.id} tanpa terjemahan',
              );
              expect(p.title['id'], isNotEmpty);
              expect(p.title['en'], isNotEmpty);
              // Bank harus lebih besar dari jumlah soal per main supaya
              // pengacakan berarti.
              expect(
                p.questions.length,
                greaterThan(kListeningQuestionsPerRound),
                reason: '${p.id} soal kurang untuk diacak',
              );
              expect(p.questionsPerRound, kListeningQuestionsPerRound);
              for (final q in p.questions) {
                expect(q.options.length, 4, reason: '${p.id}: ${q.question}');
                expect(
                  q.options.toSet().length,
                  4,
                  reason: '${p.id}: pilihan ganda ${q.options}',
                );
                expect(q.answer, inInclusiveRange(0, 3));
                expect(q.question['id'], isNotEmpty);
                expect(q.question['en'], isNotEmpty);
              }
            }
          }
        }
      },
    );

    test(
      'pickQuestions: 3 soal acak dari bank, tanpa duplikat, bisa berbeda',
      () {
        final p = listeningPacksFor('en').first.passages.first;
        final seen = <String>{};
        for (var seed = 0; seed < 30; seed++) {
          final picked = p.pickQuestions(Random(seed));
          expect(picked.length, kListeningQuestionsPerRound);
          expect(picked.toSet().length, picked.length, reason: 'soal ganda');
          for (final q in picked) {
            expect(p.questions.contains(q), isTrue);
          }
          seen.add(picked.map((q) => q.question['en']).join('|'));
        }
        // Dengan 30 percobaan, kombinasi/urutan tidak mungkin selalu sama.
        expect(seen.length, greaterThan(1));
      },
    );

    test('paket premium punya lebih banyak bacaan daripada batas gratis', () {
      for (final pack
          in kListeningCourses
              .expand(listeningPacksFor)
              .where((p) => p.premium)) {
        expect(
          pack.passages.length,
          greaterThan(kFreeListeningPassages),
          reason: '${pack.id} harus > $kFreeListeningPassages bacaan',
        );
        expect(
          pack.maxPlays,
          greaterThan(0),
          reason: '${pack.id} paket ujian harus punya batas putar',
        );
      }
      // Paket pertama tiap kursus (kecuali Jepang) gratis & putar bebas.
      for (final courseId in ['en', 'ko', 'de', 'id']) {
        final basic = listeningPacksFor(courseId).first;
        expect(basic.premium, isFalse, reason: basic.id);
        expect(basic.maxPlays, 0, reason: basic.id);
      }
    });
  });
}
