import 'dart:math';

import 'package:beomora/data/spell_tiles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('kata dipecah jadi kotak; bunyi gabungan satu kotak', () {
    expect(spellUnits('ねこ'), ['ね', 'こ']);
    expect(spellUnits('きょう'), ['きょ', 'う']);
    expect(spellUnits('しゃしん'), ['しゃ', 'し', 'ん']);
    expect(spellUnits('コーヒー'), ['コ', 'ー', 'ヒ', 'ー']);
    expect(spellUnits('seed'), ['s', 'e', 'e', 'd']);
  });

  test('tidak cocok disusun → null (jadi pilihan ganda)', () {
    expect(spellUnits('どうぞよろしくおねがいします'), isNull); // > 10
    expect(spellUnits('～さん'), isNull);
    expect(spellUnits('あの ひと'), isNull);
    expect(spellUnits('いいえ、けっこうです'), isNull);
    expect(spellUnits('学生'), isNull); // kanji
    expect(spellUnits('は'), isNull); // 1 huruf
    expect(spellUnits('to plant'), isNull);
  });

  test('kotak = jawaban + 3–6 pengecoh (kata 5 huruf → 8–11)', () {
    final units = spellUnits('たまねぎ')!; // 4 kotak
    final five = spellUnits('ひこうきじょう')!; // ひ こ う き じょ う = 6
    for (var seed = 0; seed < 50; seed++) {
      final rng = Random(seed);
      final t = spellTiles(units, rng);
      expect(t.length, inInclusiveRange(units.length + 3, units.length + 6));
      for (final u in units) {
        expect(t, contains(u));
      }
      final t5 = spellTiles(['あ', 'い', 'う', 'え', 'お'], rng);
      expect(t5.length, inInclusiveRange(8, 11));
      final t6 = spellTiles(five, rng);
      expect(t6.length, inInclusiveRange(9, 12));
    }
  });

  test('pengecoh dari aksara yang sama & tidak menggandakan jawaban', () {
    final kata = RegExp(r'^[゠-ヿ]+$');
    final hira = RegExp(r'^[぀-ゟ]+$');
    for (var seed = 0; seed < 30; seed++) {
      final rng = Random(seed);
      final k = spellTiles(spellUnits('テレビ')!, rng);
      expect(k.every(kata.hasMatch), isTrue, reason: '$k');
      final h = spellTiles(spellUnits('さかな')!, rng);
      expect(h.every(hira.hasMatch), isTrue, reason: '$h');
      // Pengecoh tidak sama dengan kotak jawaban (jawaban tetap jelas).
      final extra = [...h]..removeWhere(['さ', 'か', 'な'].contains);
      expect(extra.length, h.length - 3);
      final e = spellTiles(spellUnits('seed')!, rng);
      expect(e.every(RegExp(r'^[a-z]$').hasMatch), isTrue, reason: '$e');
    }
  });
}
