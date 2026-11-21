/// Nama Latin (Indonesia) → katakana, untuk menyisipkan nama pengguna
/// di kalimat Jepang ("わたし の なまえ は ダニ です"). Pendekatan bunyi
/// sederhana: suku konsonan+vokal → kana; konsonan tanpa vokal mendapat
/// vokal bantu (u, atau o setelah t/d); n di akhir suku → ン; konsonan
/// ganda → ッ. Ejaan Indonesia: c = ch, j = j, sy = sh, ny = ny, kh = h.
String nameToKatakana(String latin) {
  final s = latin.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '');
  if (s.isEmpty) return '';
  final out = StringBuffer();
  var i = 0;
  bool isVowel(String c) => c.length == 1 && 'aeiou'.contains(c);
  String at(int k) => k < s.length ? s[k] : '';

  while (i < s.length) {
    final c = s[i];
    // Vokal berdiri sendiri.
    if (isVowel(c)) {
      out.write(_rows['']![c]);
      i++;
      continue;
    }
    // ng / n sebelum konsonan / n di akhir → ン.
    if (c == 'n' &&
        (i + 1 == s.length || !isVowel(at(i + 1)) && at(i + 1) != 'y')) {
      out.write('ン');
      i += at(i + 1) == 'g' && !isVowel(at(i + 2)) ? 2 : 1;
      continue;
    }
    // m sebelum b/p/m dibaca ン (Bambang → バンバン, Muhammad → ムハンマド).
    if (c == 'm' && 'bpm'.contains(at(i + 1)) && at(i + 1).isNotEmpty) {
      out.write('ン');
      i++;
      continue;
    }
    // Konsonan ganda (anna → アンナ ditangani di atas; ditto → ディット).
    if (at(i + 1) == c && c != 'n') {
      out.write('ッ');
      i++;
      continue;
    }
    // Gugus dua huruf: sy, ny, kh, ch, sh, th, ph, ts.
    var cons = c;
    final two = s.length > i + 1 ? s.substring(i, i + 2) : '';
    if (const {
      'sy',
      'ny',
      'kh',
      'ch',
      'sh',
      'th',
      'ph',
      'ts',
      'gh',
      'dh',
    }.contains(two)) {
      cons = two;
    }
    final next = at(i + cons.length);
    final row = _rows[_norm(cons)];
    if (row != null && isVowel(next)) {
      out.write(row[next]);
      i += cons.length + 1;
      continue;
    }
    // y/w di depan vokal sudah tercakup; konsonan tanpa vokal.
    final lone = _lone[_norm(cons)];
    if (lone != null) out.write(lone);
    i += cons.length;
  }
  return out.toString();
}

String _norm(String cons) => switch (cons) {
  'l' => 'r',
  'q' => 'k',
  'v' => 'b',
  'kh' || 'gh' => 'h',
  'th' => 't',
  'dh' => 'd',
  'ph' => 'f',
  'ch' => 'c',
  'sh' => 'sy',
  'x' => 's',
  _ => cons,
};

/// Konsonan tanpa vokal (akhir nama / sebelum konsonan lain).
const _lone = {
  'k': 'ク',
  'g': 'グ',
  's': 'ス',
  'sy': 'シュ',
  'z': 'ズ',
  't': 'ト',
  'd': 'ド',
  'ts': 'ツ',
  'c': 'チ',
  'j': 'ジ',
  'h': '',
  'f': 'フ',
  'b': 'ブ',
  'p': 'プ',
  'm': 'ム',
  'r': 'ル',
  'w': 'ウ',
  'y': 'イ',
  'ny': 'ニ',
};

/// Baris kana per konsonan: vokal → kana.
const Map<String, Map<String, String>> _rows = {
  '': {'a': 'ア', 'i': 'イ', 'u': 'ウ', 'e': 'エ', 'o': 'オ'},
  'k': {'a': 'カ', 'i': 'キ', 'u': 'ク', 'e': 'ケ', 'o': 'コ'},
  'g': {'a': 'ガ', 'i': 'ギ', 'u': 'グ', 'e': 'ゲ', 'o': 'ゴ'},
  's': {'a': 'サ', 'i': 'シ', 'u': 'ス', 'e': 'セ', 'o': 'ソ'},
  'sy': {'a': 'シャ', 'i': 'シ', 'u': 'シュ', 'e': 'シェ', 'o': 'ショ'},
  'z': {'a': 'ザ', 'i': 'ジ', 'u': 'ズ', 'e': 'ゼ', 'o': 'ゾ'},
  'j': {'a': 'ジャ', 'i': 'ジ', 'u': 'ジュ', 'e': 'ジェ', 'o': 'ジョ'},
  't': {'a': 'タ', 'i': 'ティ', 'u': 'トゥ', 'e': 'テ', 'o': 'ト'},
  'ts': {'a': 'ツァ', 'i': 'ツィ', 'u': 'ツ', 'e': 'ツェ', 'o': 'ツォ'},
  'd': {'a': 'ダ', 'i': 'ディ', 'u': 'ドゥ', 'e': 'デ', 'o': 'ド'},
  'c': {'a': 'チャ', 'i': 'チ', 'u': 'チュ', 'e': 'チェ', 'o': 'チョ'},
  'n': {'a': 'ナ', 'i': 'ニ', 'u': 'ヌ', 'e': 'ネ', 'o': 'ノ'},
  'ny': {'a': 'ニャ', 'i': 'ニ', 'u': 'ニュ', 'e': 'ニェ', 'o': 'ニョ'},
  'h': {'a': 'ハ', 'i': 'ヒ', 'u': 'フ', 'e': 'ヘ', 'o': 'ホ'},
  'f': {'a': 'ファ', 'i': 'フィ', 'u': 'フ', 'e': 'フェ', 'o': 'フォ'},
  'b': {'a': 'バ', 'i': 'ビ', 'u': 'ブ', 'e': 'ベ', 'o': 'ボ'},
  'p': {'a': 'パ', 'i': 'ピ', 'u': 'プ', 'e': 'ペ', 'o': 'ポ'},
  'm': {'a': 'マ', 'i': 'ミ', 'u': 'ム', 'e': 'メ', 'o': 'モ'},
  'y': {'a': 'ヤ', 'i': 'イ', 'u': 'ユ', 'e': 'イェ', 'o': 'ヨ'},
  'r': {'a': 'ラ', 'i': 'リ', 'u': 'ル', 'e': 'レ', 'o': 'ロ'},
  'w': {'a': 'ワ', 'i': 'ウィ', 'u': 'ウ', 'e': 'ウェ', 'o': 'ウォ'},
};
