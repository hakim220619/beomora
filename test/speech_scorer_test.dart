import 'package:beomora/services/speech_scorer.dart';
import 'package:flutter_test/flutter_test.dart';

SpeechScore _score(String course, String target, List<String> heard) =>
    scoreSpeech(courseId: course, tokens: tokensOf(target), heard: heard);

void main() {
  group('Inggris / Jerman (per kata)', () {
    test('ucapan persis → 100%, semua token benar', () {
      final s = _score('en', 'Thank you very much', ['thank you very much.']);
      expect(s.percent, 100);
      expect(s.tokenOk, everyElement(isTrue));
      expect(s.passed, isTrue);
    });

    test('satu kata salah ditandai, skor turun', () {
      final s = _score('en', 'Good morning my friend', [
        'good morning my fiend',
      ]);
      expect(s.tokenOk, [true, true, true, false]);
      expect(s.percent, 75);
      expect(s.passed, isFalse);
    });

    test('kata hilang ditandai salah', () {
      final s = _score('de', 'Guten Morgen mein Freund', [
        'Guten Morgen Freund',
      ]);
      expect(s.tokenOk, [true, true, false, true]);
    });

    test('singkatan & angka dari mesin tetap cocok', () {
      expect(
        _score('en', "Let's go to the beach", [
          'let us go to the beach',
        ]).percent,
        100,
      );
      expect(_score('en', 'I have three cats', ['I have 3 cats']).percent, 100);
      expect(
        _score('de', 'Ich habe drei Katzen', ['ich habe 3 Katzen']).percent,
        100,
      );
      expect(_score('de', 'einundzwanzig', ['21']).percent, 100);
    });

    test('ucapan berlebih menurunkan skor', () {
      final s = _score('en', 'hello', ['hello hello there everyone']);
      expect(s.tokenOk, [true]);
      expect(s.passed, isFalse);
    });

    test('alternatif terbaik yang dipakai', () {
      final s = _score('en', 'Can I pay by card', [
        'can I pay by car',
        'can I pay by card',
      ]);
      expect(s.percent, 100);
      expect(s.heard, 'can I pay by card');
    });

    test('tanpa suara → 0%', () {
      final s = _score('en', 'hello', []);
      expect(s.percent, 0);
      expect(s.tokenOk, [false]);
    });
  });

  group('Jepang (per kana, kanji = wildcard)', () {
    test('transkrip kana/katakana cocok', () {
      expect(_score('ja', 'おはよう ございます', ['おはようございます']).percent, 100);
      expect(_score('ja', 'こーひー', ['コーヒー']).percent, 100);
    });

    test('transkrip berkanji tetap cocok dengan target kana', () {
      final s = _score('ja', 'すもう を みに いきます', ['相撲を見に行きます。']);
      expect(s.percent, 100);
      expect(s.tokenOk, everyElement(isTrue));
    });

    test('okurigana / partikel yang salah ditandai', () {
      // "みました" (lampau) bukan "みます".
      final s = _score('ja', 'えいが を みます', ['映画を見ました']);
      expect(s.tokenOk.last, isFalse);
      expect(s.tokenOk.first, isTrue);
      expect(s.passed, isFalse);
    });

    test('ucapan yang sama sekali lain → gagal', () {
      final s = _score('ja', 'ありがとう ございます', ['すみません']);
      expect(s.passed, isFalse);
    });
  });

  group('Korea (per suku kata)', () {
    test('spasi berbeda tetap cocok', () {
      expect(_score('ko', '정말 감사합니다', ['정말감사합니다']).percent, 100);
    });

    test('suku kata salah menandai kata', () {
      final s = _score('ko', '잔돈 여기 있어요', ['잔돈 저기 있어요']);
      expect(s.tokenOk, [true, false, true]);
    });
  });
}
