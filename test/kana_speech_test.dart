import 'package:beomora/data/question_bank.dart';
import 'package:beomora/models/guide.dart';
import 'package:beomora/services/kana_speech.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('romajiToHiragana', () {
    test('angka & uang N5', () {
      const cases = {
        'ichi': 'いち',
        'ni': 'に',
        'san': 'さん',
        'yon': 'よん',
        'go': 'ご',
        'roku': 'ろく',
        'nana': 'なな',
        'hachi': 'はち',
        'kyuu': 'きゅう',
        'juu': 'じゅう',
        'hyaku': 'ひゃく',
        'sen': 'せん',
        'man': 'まん',
        'en': 'えん',
      };
      cases.forEach((r, k) => expect(romajiToHiragana(r), k, reason: r));
    });

    test('kasus khusus: nn, konsonan ganda, yōon, n akhir, ejaan lain', () {
      expect(romajiToHiragana('onna'), 'おんな');
      expect(romajiToHiragana('kitte'), 'きって');
      expect(romajiToHiragana('shou'), 'しょう');
      expect(romajiToHiragana('fun'), 'ふん');
      expect(romajiToHiragana('tsuchi'), 'つち');
      expect(romajiToHiragana('kanyou'), 'かにょう'); // n + y → suku kata
      expect(romajiToHiragana('si'), 'し');
      expect(romajiToHiragana('Kyou!'), 'きょう');
      expect(romajiToHiragana('xyz'), isNull);
      expect(romajiToHiragana(''), isNull);
    });

    test('semua bacaan paket kanji N5 bisa diubah ke hiragana', () {
      final kanji = letterQuizFor('ja').firstWhere((c) => c.id == 'kanji_n5');
      for (final item in kanji.items) {
        final kana = romajiToHiragana(item.romaji);
        expect(kana, isNotNull, reason: '${item.kana} ${item.romaji}');
        expect(containsKanji(kana!), isFalse);
      }
    });
  });

  group('spokenFormOf', () {
    test('kanji → bacaan hiragana; kana & Latin apa adanya', () {
      expect(spokenFormOf(const KanaItem('四', 'yon')), 'よん');
      expect(spokenFormOf(const KanaItem('七', 'nana')), 'なな');
      expect(spokenFormOf(const KanaItem('日', 'hi')), 'ひ');
      expect(spokenFormOf(const KanaItem('あ', 'a')), 'あ');
      expect(spokenFormOf(const KanaItem('ア', 'a')), 'ア');
      expect(spokenFormOf(const KanaItem('A', 'ei')), 'A');
      expect(spokenFormOf(const KanaItem('한', 'han')), '한');
    });
  });
}
