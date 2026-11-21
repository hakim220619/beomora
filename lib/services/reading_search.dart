/// Pencocokan kolom bacaan (romaji, romanisasi, pinyin) untuk kolom
/// cari kosakata: tidak peka huruf besar, tanda nada pinyin, spasi,
/// tanda hubung, dan apostrof — "ni hao", "nihao", dan "nǐ hǎo"
/// sama-sama menemukan 你好.
library;

const Map<String, String> _toneless = {
  'ā': 'a', 'á': 'a', 'ǎ': 'a', 'à': 'a', //
  'ē': 'e', 'é': 'e', 'ě': 'e', 'è': 'e', //
  'ī': 'i', 'í': 'i', 'ǐ': 'i', 'ì': 'i', //
  'ō': 'o', 'ó': 'o', 'ǒ': 'o', 'ò': 'o', //
  'ū': 'u', 'ú': 'u', 'ǔ': 'u', 'ù': 'u', //
  'ǖ': 'v', 'ǘ': 'v', 'ǚ': 'v', 'ǜ': 'v', 'ü': 'v', //
};

/// Bentuk lipatan untuk dibandingkan: huruf kecil, tanpa tanda nada
/// (ü → v, seperti mengetik pinyin di keyboard), tanpa spasi/-/'.
String foldReading(String s) {
  final b = StringBuffer();
  for (final ch in s.toLowerCase().split('')) {
    if (ch == ' ' || ch == '-' || ch == "'" || ch == '’') continue;
    b.write(_toneless[ch] ?? ch);
  }
  return b.toString();
}

/// Apakah [reading] memuat [query] (keduanya dilipat dengan
/// [foldReading]). Kueri yang kosong setelah dilipat tidak cocok.
bool readingContains(String? reading, String query) {
  if (reading == null) return false;
  final q = foldReading(query);
  if (q.isEmpty) return false;
  return foldReading(reading).contains(q);
}
