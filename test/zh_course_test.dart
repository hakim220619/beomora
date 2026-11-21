import 'package:beomora/data/hsk_vocab.dart';
import 'package:beomora/data/question_bank.dart';
import 'package:beomora/data/study_guides.dart';
import 'package:beomora/data/vocab_examples.dart';
import 'package:beomora/data/zh_particles.dart';
import 'package:beomora/data/zh_phrases.dart';
import 'package:beomora/screens/materials/guide_detail_screen.dart';
import 'package:beomora/services/content_service.dart';
import 'package:beomora/services/reading_search.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('kursus Mandarin: 16 unit, TTS zh-CN, semua kata ber-pinyin', () async {
    final courses = await ContentService.loadCourses();
    final zh = courses.firstWhere((c) => c.id == 'zh');
    expect(zh.ttsLocale, 'zh-CN');
    expect(zh.flag, '🇨🇳');
    expect(zh.units.length, 16);
    for (final w in zh.allWords) {
      expect(w.romaji, isNotEmpty, reason: w.target);
      expect(w.target, isNot(contains(' ')), reason: w.target);
    }
    for (final s in zh.allSentences) {
      expect(s.tokens.join(' '), s.target);
      expect(s.romaji, isNotEmpty, reason: s.target);
    }
  });

  group('Kosakata HSK 1–2', () {
    test('HSK 1 ±520 kata + HSK 2 ±730 kata, tema & kategori konsisten', () {
      final n1 = hskVocab.where((w) => w.group < hsk2FirstGroup).length;
      expect(n1, greaterThanOrEqualTo(500));
      expect(hskVocab.length - n1, greaterThanOrEqualTo(700));
      // Kata satu level berurutan (HSK 1 dulu, lalu HSK 2).
      final firstHsk2 = hskVocab.indexWhere((w) => w.group >= hsk2FirstGroup);
      expect(
        hskVocab.skip(firstHsk2).every((w) => w.group >= hsk2FirstGroup),
        isTrue,
      );
      expect(hskVocabCategories.first['id'], startsWith('HSK 1'));
      expect(hskVocabCategories.last['id'], startsWith('HSK 2'));
      expect(hskGroupCategory.length, hskVocabGroups.length);
      for (final c in hskGroupCategory) {
        expect(c, inInclusiveRange(0, hskVocabCategories.length - 1));
      }
      for (final w in hskVocab) {
        expect(w.group, inInclusiveRange(0, hskVocabGroups.length - 1));
        expect(w.romaji, isNotEmpty, reason: w.kana);
      }
    });

    test('hanzi & arti unik (Tebak Kata tanpa jawaban ganda)', () {
      expect(hskVocab.map((w) => w.kana).toSet().length, hskVocab.length);
      for (final lang in ['id', 'en']) {
        final meanings = hskVocab.map((w) => w.meaning[lang]).toList();
        expect(meanings.toSet().length, meanings.length, reason: lang);
      }
    });
  });

  test('Materi Mandarin: pinyin, frasa, angka & pola kalimat', () {
    final ids = kStudyGuides['zh']!.map((t) => t.id).toList();
    expect(
      ids,
      containsAll(['pinyin', 'zh_phrases', 'zh_numbers', 'zh_grammar']),
    );
    expect(
      vocabSearchHintKey('zh', hasReading: true),
      'vocab_search_hint_pinyin',
    );
  });

  test('Tebak Huruf Mandarin: hanzi → pinyin, tanpa lambang ganda', () {
    final cats = letterQuizFor('zh');
    expect(cats.map((c) => c.id), ['pinyin', 'zh_numbers']);
    for (final c in cats) {
      expect(c.items, isNotEmpty, reason: c.id);
      final symbols = c.items.map((k) => k.kana).toList();
      expect(symbols.toSet().length, symbols.length, reason: c.id);
      final readings = c.items.map((k) => k.romaji).toList();
      expect(readings.toSet().length, readings.length, reason: c.id);
    }
  });

  group('Cari pinyin tanpa tanda nada', () {
    test('ni hao / nihao / nǐ hǎo menemukan 你好', () {
      for (final q in ['ni hao', 'nihao', 'nǐ hǎo', 'NI HAO', 'hao']) {
        expect(readingContains('nǐ hǎo', q), isTrue, reason: q);
      }
      expect(readingContains('nǐ hǎo', 'nin'), isFalse);
    });

    test('ü bisa diketik sebagai v atau ü', () {
      expect(readingContains('lǜsè', 'lvse'), isTrue);
      expect(readingContains('lǜsè', 'lüse'), isTrue);
      expect(readingContains("nǚ'ér", 'nver'), isTrue);
    });

    test('romaji/romanisasi kursus lain tetap cocok', () {
      expect(readingContains('konnichiwa', 'konni'), isTrue);
      expect(readingContains('annyeonghaseyo', 'annyeong'), isTrue);
      expect(readingContains(null, 'a'), isFalse);
      expect(readingContains('abc', '   '), isFalse);
    });
  });

  test('Tata bahasa HSK 1–2: topik lengkap & contoh sejajar dengan pinyin', () {
    final topics = kStudyGuides['zh']!;
    expect(
      topics.map((t) => t.id),
      containsAll([
        'zh_grammar_le',
        'zh_grammar_guo',
        'zh_grammar_zai',
        'zh_grammar_modal',
        'zh_grammar_questions',
        'zh_grammar_compare',
        'zh_grammar_shide',
        'zh_grammar_time',
        'zh_grammar_place',
        'zh_grammar_complement',
        'zh_grammar_connectors',
        'zh_grammar_ba',
        'zh_grammar_bei',
        'zh_grammar_zhe',
        'zh_grammar_moods',
      ]),
    );
    for (final t in topics) {
      for (final s in t.sections) {
        for (final e in s.examples) {
          expect(e.romaji, isNotEmpty, reason: e.target);
          if (e.target.contains(' ')) {
            expect(
              e.romaji!.split(' ').length,
              e.target.split(' ').length,
              reason: e.target,
            );
          }
        }
      }
    }
  });

  test('Ungkapan Mandarin: 3 daftar, tanpa dobel & tidak mengulang HSK', () {
    final lists = {
      'sehari-hari': (zhPhraseVocab, zhPhraseVocabGroups, 90),
      'kerja': (zhWorkVocab, zhWorkVocabGroups, 25),
      'chengyu': (zhIdiomVocab, zhIdiomVocabGroups, 30),
    };
    final hsk = hskVocab.map((w) => w.kana).toSet();
    final all = <String>{};
    for (final MapEntry(key: name, value: (list, groups, min))
        in lists.entries) {
      expect(list.length, greaterThanOrEqualTo(min), reason: name);
      for (final w in list) {
        expect(w.group, inInclusiveRange(0, groups.length - 1), reason: name);
        expect(w.romaji, isNotEmpty, reason: w.kana);
        expect(all.add(w.kana), isTrue, reason: 'dobel: ${w.kana}');
        expect(hsk, isNot(contains(w.kana)), reason: 'ada di HSK: ${w.kana}');
      }
    }
  });

  test('contoh kalimat: semua kosakata HSK & ungkapan Mandarin punya', () {
    final words = [
      ...hskVocab,
      ...zhPhraseVocab,
      ...zhWorkVocab,
      ...zhIdiomVocab,
    ];
    expect(words.length, greaterThanOrEqualTo(1400));
    for (final w in words) {
      final u = vocabUsageFor('zh', w.kana);
      expect(u, isNotNull, reason: w.kana);
      expect(u!.sentence, contains(w.kana));
      expect(u.reading, isNotEmpty, reason: w.kana);
      expect(u.translation('id'), isNotEmpty, reason: w.kana);
      expect(u.translation('en'), isNotEmpty, reason: w.kana);
      expect(u.usage('id'), isNotEmpty, reason: w.kana);
    }
  });

  group('Partikel Mandarin diwarnai', () {
    List<String> marked(ZhMarked m) => [
      for (var i = 0; i < m.marks.length; i++)
        if (m.marks[i] != null) m.text.split(' ')[i],
    ];

    test('kalimat tanpa spasi dipecah sejajar pinyin', () {
      final m = zhParticlesOf('你明白我的意思吗？', 'Nǐ míngbai wǒ de yìsi ma?')!;
      expect(m.joiner, '');
      expect(m.text, '你 明白 我 的 意思 吗？');
      expect(marked(m), ['的', '吗？']);
      expect(m.reading.split(' ').length, m.text.split(' ').length);
    });

    test('nada membedakan partikel dari kata biasa', () {
      // 地 dì (tanah) & 得 dé bukan partikel; 现在 bukan 在.
      expect(zhParticlesOf('地上有一本书。', 'Dì shang yǒu yì běn shū.'), isNull);
      expect(zhParticlesOf('现在三点半。', 'Xiànzài sān diǎn bàn.'), isNull);
      final m = zhParticlesOf('他说得很好。', 'Tā shuō de hěn hǎo.')!;
      expect(marked(m), ['得']);
    });

    test('erhua & aspek yang menyatu dengan kata kerja', () {
      final m = zhParticlesOf('孩子们在外面玩儿。', 'Háizimen zài wàimiàn wánr.')!;
      expect(m.text, '孩子们 在 外面 玩儿。');
      final g = zhParticlesOf('我去过中国。', 'Wǒ qùguo Zhōngguó.')!;
      expect(g.text, '我 去 过 中国。');
      expect(marked(g), ['过']);
      // 不过 / 为了 bukan partikel aspek.
      expect(zhParticlesOf('为了健康。', 'Wèile jiànkāng.'), isNull);
    });

    test('contoh tata bahasa (berspasi) tetap berspasi', () {
      final m = zhParticlesOf('我 把 门 关上 了', 'wǒ bǎ mén guānshang le')!;
      expect(m.joiner, ' ');
      expect(marked(m), ['把', '了']);
    });

    test('sebagian besar contoh kosakata bisa disejajarkan', () {
      final cand = RegExp('[的了吗呢吧把被]');
      var n = 0, ok = 0;
      for (final u in vocabUsageZh.values) {
        if (!cand.hasMatch(u.sentence)) continue;
        n++;
        if (zhParticlesOf(u.sentence, u.reading) != null) ok++;
      }
      expect(ok / n, greaterThan(0.95), reason: '$ok/$n');
    });
  });
}
