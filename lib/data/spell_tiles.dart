import 'dart:math';

// Soal "Susun huruf" Latihan Kosakata: kata dipecah jadi kotak huruf
// (bunyi gabungan Jepang seperti きょ jadi satu kotak), lalu ditambah
// huruf pengecoh yang mirip bentuk/bunyinya dan diacak.

/// Kotak terbanyak untuk satu jawaban; kata lebih panjang → pilihan ganda.
const kSpellMaxUnits = 10;

const _small = 'ゃゅょぁぃぅぇぉャュョァィゥェォ';

bool _isKatakana(String s) =>
    s.runes.any((r) => r >= 0x30A0 && r <= 0x30FF && r != 0x30FC);

bool _isKana(String s) => s.runes.every((r) => r >= 0x3040 && r <= 0x30FF);

/// Kotak jawaban untuk [word], atau null kalau tidak cocok disusun
/// (ungkapan dengan spasi/～/tanda baca, angka, atau terlalu panjang).
List<String>? spellUnits(String word) {
  final w = word.trim();
  if (w.isEmpty || RegExp(r'[\s～~、。・/()（）！？!?,.0-9０-９]').hasMatch(w)) {
    return null;
  }
  final units = <String>[];
  if (_isKana(w)) {
    for (final ch in w.split('')) {
      if (units.isNotEmpty && _small.contains(ch)) {
        units[units.length - 1] += ch; // き + ょ → きょ
      } else {
        units.add(ch);
      }
    }
  } else if (RegExp(r"^[A-Za-zÀ-ÿ'-]+$").hasMatch(w)) {
    units.addAll(w.split(''));
  } else {
    return null; // kanji / campuran: tidak bisa disusun dari kotak kana
  }
  if (units.length < 2 || units.length > kSpellMaxUnits) return null;
  return units;
}

/// Huruf yang mirip bentuk/bunyi (pengecoh yang "menjebak").
const _confusableGroups = [
  // Hiragana
  'ねれわ', 'ぬめ', 'はほけ', 'さちき', 'るろ', 'いこりけ', 'うつら', 'しつ',
  'あおめ', 'まもほ', 'くへ', 'たなに', 'そん', 'ゆよ', 'すむ', 'ふぶぷ',
  'かがや', 'てでと', 'こご', 'きぎ', 'しじ', 'ちぢじ', 'つづず', 'はばぱ',
  'ひびぴ', 'ほぼぽ', 'へべぺ', 'さざ', 'とど', 'えう',
  // Katakana
  'シツ', 'ソン', 'クタケ', 'アマ', 'ウワフ', 'ノメ', 'スヌ', 'コユロ', 'チテ',
  'ハバパ', 'ヒビピ', 'フブプ', 'ヘベペ', 'ホボポ', 'カガ', 'キギ', 'サザ',
  'シジ', 'トド', 'ルレ', 'ラヲ', 'セヤ', 'ナメ', 'ミシ', 'ムマ', 'オホ',
  // Latin
  'bdpq', 'mnu', 'ilt', 'uvw', 'aeo', 'cks', 'gjy', 'fth',
];

const _hiraganaPool =
    'あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほ'
    'まみむめもやゆよらりるれろわをんがぎぐげござじずぜぞだでどばびぶべぼ';
const _katakanaPool =
    'アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホ'
    'マミムメモヤユヨラリルレロワンガギグゲゴザジズゼゾダデドバビブベボー';
const _latinPool = 'abcdefghijklmnopqrstuvwxyz';
const _yoon = ['ゃ', 'ゅ', 'ょ'];

/// Kotak acak untuk [word]: semua kotak jawaban + 3–6 pengecoh (kata 5
/// huruf → 8–11 kotak). [units] dari [spellUnits].
List<String> spellTiles(List<String> units, Random rng) {
  final latin = RegExp(r'[A-Za-z]').hasMatch(units.first);
  final kata = !latin && units.any(_isKatakana);
  final extra = 3 + rng.nextInt(min(4, units.length));
  final used = {...units};
  final out = <String>[];

  void tryAdd(String c) {
    if (out.length >= extra || c.isEmpty || used.contains(c)) return;
    if (latin != RegExp(r'[A-Za-z]').hasMatch(c)) return;
    if (!latin && kata != _isKatakana(c)) return;
    used.add(c);
    out.add(c);
  }

  // 1) Pengecoh mirip dari huruf jawaban (dikocok agar bervariasi).
  final similar = <String>[];
  for (final u in units) {
    final base = u.substring(0, 1);
    final tail = u.substring(1); // ゃ/ゅ/ょ pada bunyi gabungan
    for (final g in _confusableGroups) {
      final lower = latin ? base.toLowerCase() : base;
      if (!g.contains(lower)) continue;
      for (final c in g.split('')) {
        similar.add(latin && base != lower ? c.toUpperCase() : c + tail);
      }
    }
    // Bunyi gabungan: きょ ↔ きゃ/きゅ.
    if (tail.isNotEmpty) {
      for (final y in _yoon) {
        final t = _isKatakana(tail) ? _toKata(y) : y;
        similar.add(base + t);
      }
    }
  }
  similar.shuffle(rng);
  for (final c in similar) {
    // Separuh pengecoh dari huruf mirip, sisanya acak — tidak terlalu
    // menjebak tapi juga tidak terlalu mudah.
    if (out.length >= (extra / 2).ceil()) break;
    tryAdd(c);
  }
  // 2) Sisanya huruf acak dari aksara yang sama.
  final pool =
      (latin ? _latinPool : (kata ? _katakanaPool : _hiraganaPool)).split('')
        ..shuffle(rng);
  for (final c in pool) {
    tryAdd(c);
  }
  return [...units, ...out]..shuffle(rng);
}

String _toKata(String hira) => String.fromCharCode(hira.codeUnitAt(0) + 0x60);
