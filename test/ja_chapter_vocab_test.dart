import 'package:beomora/data/ja_chapter_examples.dart';
import 'package:beomora/data/ja_chapter_vocab.dart';
import 'package:beomora/data/study_guides.dart';
import 'package:beomora/screens/materials/vocab_detail_sheet.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final secs = kJaChapterVocabTopic.sections;

  test('25 bab berurutan, terdaftar di Materi → Kosakata', () {
    expect(secs, hasLength(25));
    for (var i = 0; i < 25; i++) {
      expect(secs[i].title['id'], 'Bab ${i + 1}');
    }
    final ids = kStudyGuides['ja']!.map((t) => t.id).toList();
    expect(ids, contains(kJaChapterVocabTopic.id));
    expect(kJaChapterVocabTopic.id, contains('vocab'));
    expect(secs.fold<int>(0, (n, s) => n + s.examples.length), 982);
  });

  test('urutan mengikuti daftar: kata pertama & terakhir tiap bab', () {
    String first(int bab) => secs[bab - 1].examples.first.target;
    String last(int bab) => secs[bab - 1].examples.last.target;
    expect(first(1), 'わたし');
    expect(last(1), 'ブラジル');
    expect(first(2), 'これ');
    expect(first(4), 'おきます');
    expect(first(5), 'いきます');
    expect(last(5), '～ばんせん');
    expect(first(6), 'たべます');
    expect(first(7), 'きります');
    expect(first(13), 'あそびます');
    expect(first(25), 'かんがえます');
    expect(last(25), 'どうぞおげんきで');
  });

  test('setiap kata punya arti id/en & romaji Latin', () {
    final kana = RegExp(r'[぀-ヿ]');
    for (final s in secs) {
      for (final e in s.examples) {
        expect(e.meaning['id'], isNotEmpty, reason: e.target);
        expect(e.meaning['en'], isNotEmpty, reason: e.target);
        expect(e.romaji, isNotEmpty, reason: e.target);
        expect(kana.hasMatch(e.romaji!), isFalse, reason: e.romaji);
        // Bukan kalimat (≥3 kata) agar diperlakukan sebagai kosakata.
        expect(e.target.split(' ').length, lessThan(3), reason: e.target);
      }
    }
  });

  test('kata yang bunyinya sama memakai arti yang benar', () {
    String meaning(String target, int bab, [int nth = 0]) => secs[bab - 1]
        .examples
        .where((e) => e.target == target)
        .elementAt(nth)
        .meaning['id']!;
    expect(meaning('かみ', 7), 'kertas');
    expect(meaning('かみ', 16), 'rambut');
    expect(meaning('はし', 7), 'sumpit');
    expect(meaning('はし', 23), 'jembatan');
    expect(meaning('あつい', 8, 0), 'tebal');
    expect(meaning('あつい', 8, 1), 'panas');
    expect(meaning('いきます', 5), 'pergi');
    expect(meaning('はな', 7), 'bunga');
    expect(meaning('おきます', 4), 'bangun');
    expect(meaning('おきます', 15), 'menaruh; meletakkan');
    expect(meaning('とまります', 19), 'menginap');
  });

  test('setiap kata Bab 1–25 punya contoh kalimat yang sesuai artinya', () {
    final none = <String>[];
    for (final s in secs) {
      for (final e in s.examples) {
        final d = vocabDetailOf(
          courseId: 'ja',
          word: e,
          uiLang: 'id',
          topic: kJaChapterVocabTopic,
        );
        if (d.sentences.isEmpty) none.add('${s.title['id']}: ${e.target}');
      }
    }
    expect(none, isEmpty);

    String sentence(String target, int bab) {
      final e = secs[bab - 1].examples.firstWhere((x) => x.target == target);
      return vocabDetailOf(
        courseId: 'ja',
        word: e,
        uiLang: 'id',
      ).sentences.first.text;
    }

    expect(sentence('はし', 7), contains('ごはん'));
    expect(sentence('はし', 23), isNot(contains('ごはん')));
    expect(sentence('かみ', 16), contains('ながい'));
    expect(sentence('きます', 5), contains('きます'));
    expect(sentence('おきます', 15), contains('かぎ'));
  });

  test('contoh kalimat khusus: kana & romaji sejajar per kata', () {
    for (final MapEntry(:key, :value) in vocabUsageJaChapter.entries) {
      expect(
        value.reading.split(' ').length,
        value.sentence.split(' ').length,
        reason: key,
      );
    }
  });
}
