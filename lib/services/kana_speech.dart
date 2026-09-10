import '../data/study_guides.dart';
import '../models/guide.dart';

/// Teks yang diucapkan TTS untuk satu huruf/kanji.
///
/// Kanji tunggal itu ambigu bagi mesin suara: 四 bisa dibaca "shi" padahal
/// tabel menampilkan "yon", 七 "shichi" padahal "nana", 日 "nichi" padahal
/// "hi". Untuk item yang mengandung kanji, ucapkan bacaan romajinya yang
/// sudah diubah ke hiragana (よん, なな, ひ) supaya suara cocok dengan teks.
/// Kana biasa dan huruf Latin dikembalikan apa adanya.
String spokenFormOf(KanaItem item) {
  if (!containsKanji(item.kana)) return item.kana;
  final reading = romajiToHiragana(item.romaji);
  return reading ?? item.kana;
}

/// Ada karakter CJK Unified Ideographs (kanji) di [s].
bool containsKanji(String s) => s.runes.any(
  (r) => (r >= 0x4E00 && r <= 0x9FFF) || (r >= 0x3400 && r <= 0x4DBF),
);

/// Tabel romaji → hiragana dari seksi Materi Belajar (gojūon, dakuten,
/// yōon). Bacaan yang muncul dua kali (ji: じ/ぢ, zu: ず/づ) memakai yang
/// pertama, yaitu じ dan ず, bacaan bakunya.
final Map<String, String> _romajiToKana = () {
  final map = <String, String>{};
  for (final topic in kStudyGuides['ja'] ?? const <GuideTopic>[]) {
    if (topic.id != 'hiragana') continue;
    for (final section in topic.sections) {
      for (final k in section.kana) {
        map.putIfAbsent(k.romaji, () => k.kana);
      }
    }
  }
  // Ejaan alternatif yang lazim di romaji Hepburn.
  map.putIfAbsent('n', () => 'ん');
  map.putIfAbsent('si', () => 'し');
  map.putIfAbsent('ti', () => 'ち');
  map.putIfAbsent('tu', () => 'つ');
  map.putIfAbsent('hu', () => 'ふ');
  map.putIfAbsent('zi', () => 'じ');
  map.putIfAbsent('di', () => 'ぢ');
  map.putIfAbsent('du', () => 'づ');
  return map;
}();

const _vowels = 'aiueo';

/// Ubah romaji Hepburn ke hiragana: pencocokan terpanjang (maks. 3 huruf,
/// mis. "kyu", "shi", "tsu"), konsonan ganda → っ, "n" sebelum konsonan
/// atau di akhir → ん. Mengembalikan `null` kalau ada bagian yang tidak
/// bisa dipetakan, supaya pemanggil bisa jatuh ke teks aslinya.
String? romajiToHiragana(String romaji) {
  final s = romaji.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '');
  if (s.isEmpty) return null;
  final out = StringBuffer();
  var i = 0;
  while (i < s.length) {
    final c = s[i];
    final next = i + 1 < s.length ? s[i + 1] : '';
    // "n" yang bukan awal suku kata: sebelum konsonan (selain y) atau
    // di akhir kata → ん. "nn" (mis. onna) → ん lalu lanjut ke "na".
    if (c == 'n' &&
        (next.isEmpty || (!_vowels.contains(next) && next != 'y'))) {
      out.write('ん');
      i++;
      continue;
    }
    // Konsonan ganda (kk, tt, ss, pp, cch) → っ.
    if (!_vowels.contains(c) && c != 'n' && next == c) {
      out.write('っ');
      i++;
      continue;
    }
    var matched = false;
    for (var len = 3; len >= 1; len--) {
      if (i + len > s.length) continue;
      final kana = _romajiToKana[s.substring(i, i + len)];
      if (kana != null) {
        out.write(kana);
        i += len;
        matched = true;
        break;
      }
    }
    if (!matched) return null;
  }
  return out.toString();
}
