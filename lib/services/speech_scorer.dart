/// Skor minimal (persen) agar satu ucapan dianggap lulus.
const int kSpeakingPassPercent = 80;

/// Kursus yang punya Latihan Bicara (mesin pengenal suara bawaan HP
/// mendukung bahasa-bahasa ini).
const Set<String> kSpeakingCourses = {'ja', 'en', 'de', 'ko'};

/// Hasil penilaian satu ucapan terhadap teks target.
class SpeechScore {
  /// Token target (kata / potongan kalimat) sesuai urutan tampil.
  final List<String> tokens;

  /// Per token: true = terucap dengan benar.
  final List<bool> tokenOk;

  /// 0..1: bagian target yang cocok, dikurangi ucapan yang berlebih.
  final double accuracy;

  /// Transkrip dari mesin pengenal suara yang menghasilkan skor ini.
  final String heard;

  const SpeechScore({
    required this.tokens,
    required this.tokenOk,
    required this.accuracy,
    required this.heard,
  });

  int get percent => (accuracy * 100).round();
  bool get passed => percent >= kSpeakingPassPercent;
}

/// Nilai ucapan: bandingkan setiap alternatif transkrip [heard] (mesin
/// biasanya memberi beberapa tebakan) dengan [tokens] target lalu ambil
/// yang terbaik.
///
/// - Inggris/Jerman: per kata (huruf kecil, tanpa tanda baca, singkatan
///   seperti "let's" dibuka, angka "3" dibaca "three").
/// - Jepang/Korea: per huruf (kana / suku kata Hangul), spasi diabaikan.
///   Mesin pengenal menulis bahasa Jepang dengan kanji (見に行きます),
///   padahal kursus memakai kana (みに いきます), jadi setiap kanji, angka,
///   atau huruf Latin di transkrip boleh mewakili 1–4 kana. Okurigana dan
///   partikel tetap harus cocok persis.
SpeechScore scoreSpeech({
  required String courseId,
  required List<String> tokens,
  required List<String> heard,
}) {
  SpeechScore? best;
  for (final h in heard.isEmpty ? const [''] : heard) {
    final s = _scoreOne(courseId, tokens, h);
    if (best == null || s.accuracy > best.accuracy) best = s;
  }
  return best!;
}

SpeechScore _scoreOne(String courseId, List<String> tokens, String heard) {
  final charLevel = courseId == 'ja' || courseId == 'ko';
  final target = <_Unit>[];
  for (var i = 0; i < tokens.length; i++) {
    final parts = charLevel
        ? _chars(_normalizeCjk(tokens[i], courseId))
        : _words(tokens[i], courseId);
    for (final p in parts) {
      target.add(_Unit(p, token: i));
    }
  }
  final spoken = charLevel
      ? _chars(
          _normalizeCjk(heard, courseId),
        ).map((c) => _Unit(c, wildcard: _isWildcard(c, courseId))).toList()
      : _words(heard, courseId).map((w) => _Unit(w)).toList();

  final a = _align(target, spoken);
  final ok = List<bool>.filled(tokens.length, true);
  var matched = 0;
  for (var i = 0; i < target.length; i++) {
    if (a.matched[i]) {
      matched++;
    } else {
      ok[target[i].token] = false;
    }
  }
  // Token kosong setelah dinormalisasi (mis. hanya tanda baca) dianggap
  // benar; target yang kosong sama sekali tidak bisa dinilai.
  final denom = target.length + a.extra;
  return SpeechScore(
    tokens: tokens,
    tokenOk: ok,
    accuracy: target.isEmpty || denom == 0 ? 0 : matched / denom,
    heard: heard.trim(),
  );
}

// ---------- Unit & penyelarasan ----------

class _Unit {
  final String text;
  final int token; // indeks token target (hanya untuk sisi target)
  final bool wildcard; // boleh mewakili 1..[_maxSpan] unit target
  const _Unit(this.text, {this.token = -1, this.wildcard = false});
}

/// Satu kanji paling banyak dibaca 4 kana (mis. 志 こころざし = 5, jarang).
const int _maxSpan = 4;

class _Alignment {
  final List<bool> matched; // per unit target
  final int extra; // unit ucapan yang tidak ada di target
  const _Alignment(this.matched, this.extra);
}

/// Jarak edit (Levenshtein) antara target dan ucapan, dengan tambahan:
/// unit wildcard di ucapan boleh "menelan" 1..[_maxSpan] unit target
/// tanpa biaya. Lalu telusuri balik untuk menandai unit target yang cocok.
_Alignment _align(List<_Unit> t, List<_Unit> h) {
  final n = t.length, m = h.length;
  const inf = 1 << 30;
  final cost = List.generate(n + 1, (_) => List<int>.filled(m + 1, inf));
  // Langkah yang dipakai untuk mencapai sel: 0 = lewati target (hilang),
  // 1 = unit ucapan berlebih, 2 = cocok/ganti, 10+k = wildcard menelan k.
  final step = List.generate(n + 1, (_) => List<int>.filled(m + 1, -1));
  cost[0][0] = 0;
  for (var i = 0; i <= n; i++) {
    for (var j = 0; j <= m; j++) {
      final c = cost[i][j];
      if (c == inf) continue;
      void relax(int ni, int nj, int nc, int s) {
        if (nc < cost[ni][nj]) {
          cost[ni][nj] = nc;
          step[ni][nj] = s;
        }
      }

      if (i < n) relax(i + 1, j, c + 1, 0);
      if (j < m) relax(i, j + 1, c + 1, 1);
      if (i < n && j < m) {
        if (h[j].wildcard) {
          for (var k = 1; k <= _maxSpan && i + k <= n; k++) {
            relax(i + k, j + 1, c, 10 + k);
          }
        } else {
          relax(i + 1, j + 1, c + (t[i].text == h[j].text ? 0 : 1), 2);
        }
      }
    }
  }

  final matched = List<bool>.filled(n, false);
  var extra = 0;
  var i = n, j = m;
  while (i > 0 || j > 0) {
    final s = step[i][j];
    if (s == 0) {
      i--;
    } else if (s == 1) {
      extra++;
      j--;
    } else if (s == 2) {
      i--;
      j--;
      matched[i] = t[i].text == h[j].text;
    } else {
      final k = s - 10;
      for (var x = 1; x <= k; x++) {
        matched[i - x] = true;
      }
      i -= k;
      j--;
    }
  }
  return _Alignment(matched, extra);
}

// ---------- Normalisasi Jepang / Korea ----------

final _cjkStrip = RegExp(r'[\s\p{P}\p{S}]', unicode: true);

String _normalizeCjk(String s, String courseId) {
  var out = s.replaceAll(_cjkStrip, '');
  // Angka lebar penuh → ASCII.
  out = String.fromCharCodes(
    out.runes.map((r) => r >= 0xFF10 && r <= 0xFF19 ? r - 0xFF10 + 0x30 : r),
  );
  if (courseId == 'ja') out = _kataToHira(out);
  return out.toLowerCase();
}

/// Katakana → hiragana (ァ..ヶ digeser ke ぁ..ゖ), ー dibiarkan.
String _kataToHira(String s) => String.fromCharCodes(
  s.runes.map((r) => r >= 0x30A1 && r <= 0x30F6 ? r - 0x60 : r),
);

List<String> _chars(String s) => s.runes.map(String.fromCharCode).toList();

bool _isKana(int r) => (r >= 0x3041 && r <= 0x309F) || r == 0x30FC;

bool _isHangul(int r) => r >= 0xAC00 && r <= 0xD7A3;

/// Unit ucapan yang bacaannya tak bisa diketahui dari tulisannya:
/// kanji/angka/Latin di Jepang, angka/Latin/hanja di Korea.
bool _isWildcard(String c, String courseId) {
  final r = c.runes.first;
  return courseId == 'ja' ? !_isKana(r) : !_isHangul(r);
}

// ---------- Normalisasi Inggris / Jerman ----------

const _enContractions = {
  "let's": 'let us',
  "i'm": 'i am',
  "you're": 'you are',
  "we're": 'we are',
  "they're": 'they are',
  "he's": 'he is',
  "she's": 'she is',
  "it's": 'it is',
  "that's": 'that is',
  "what's": 'what is',
  "where's": 'where is',
  "there's": 'there is',
  "don't": 'do not',
  "doesn't": 'does not',
  "didn't": 'did not',
  "isn't": 'is not',
  "aren't": 'are not',
  "wasn't": 'was not',
  "can't": 'can not',
  'cannot': 'can not',
  "won't": 'will not',
  "i'll": 'i will',
  "you'll": 'you will',
  "i've": 'i have',
  "i'd": 'i would',
};

List<String> _words(String s, String courseId) {
  var t = s.toLowerCase().replaceAll('’', "'").replaceAll('-', ' ');
  if (courseId == 'de') t = t.replaceAll('ß', 'ss');
  final out = <String>[];
  for (var w in t.split(RegExp(r'\s+'))) {
    w = w.replaceAll(RegExp(r"[^\p{L}\p{N}']", unicode: true), '');
    w = w.replaceAll(RegExp(r"^'+|'+$"), '');
    if (w.isEmpty) continue;
    if (courseId == 'en' && _enContractions.containsKey(w)) {
      out.addAll(_enContractions[w]!.split(' '));
    } else if (RegExp(r'^\d+$').hasMatch(w)) {
      final spelled = _spellNumber(int.parse(w), courseId);
      out.addAll(spelled == null ? [w] : spelled.split(' '));
    } else {
      out.add(w);
    }
  }
  return out;
}

const _enOnes = [
  'zero',
  'one',
  'two',
  'three',
  'four',
  'five',
  'six',
  'seven',
  'eight',
  'nine',
  'ten',
  'eleven',
  'twelve',
  'thirteen',
  'fourteen',
  'fifteen',
  'sixteen',
  'seventeen',
  'eighteen',
  'nineteen',
];
const _enTens = [
  '',
  '',
  'twenty',
  'thirty',
  'forty',
  'fifty',
  'sixty',
  'seventy',
  'eighty',
  'ninety',
];
const _deOnes = [
  'null',
  'eins',
  'zwei',
  'drei',
  'vier',
  'fünf',
  'sechs',
  'sieben',
  'acht',
  'neun',
  'zehn',
  'elf',
  'zwölf',
  'dreizehn',
  'vierzehn',
  'fünfzehn',
  'sechzehn',
  'siebzehn',
  'achtzehn',
  'neunzehn',
];
const _deTens = [
  '',
  '',
  'zwanzig',
  'dreißig',
  'vierzig',
  'fünfzig',
  'sechzig',
  'siebzig',
  'achtzig',
  'neunzig',
];

/// Angka dari transkrip (mesin menulis "3", kursus menulis "three")
/// dieja ulang, 0–999. Di luar itu dibiarkan apa adanya.
String? _spellNumber(int n, String courseId) {
  if (n < 0 || n > 999) return null;
  if (courseId == 'de') {
    String under100(int x) {
      if (x < 20) return _deOnes[x];
      final o = x % 10, tens = _deTens[x ~/ 10];
      if (o == 0) return tens;
      return '${o == 1 ? 'ein' : _deOnes[o]}und$tens';
    }

    final out = n < 100
        ? under100(n)
        : '${n ~/ 100 == 1 ? 'ein' : _deOnes[n ~/ 100]}hundert'
              '${n % 100 == 0 ? '' : under100(n % 100)}';
    return out.replaceAll('ß', 'ss');
  }
  if (courseId == 'en') {
    String under100(int x) {
      if (x < 20) return _enOnes[x];
      final o = x % 10;
      return o == 0 ? _enTens[x ~/ 10] : '${_enTens[x ~/ 10]} ${_enOnes[o]}';
    }

    if (n < 100) return under100(n);
    final rest = n % 100;
    return '${_enOnes[n ~/ 100]} hundred'
        '${rest == 0 ? '' : ' ${under100(rest)}'}';
  }
  return null;
}

/// Dipakai layar untuk memecah kata tunggal (bisa berupa frasa) menjadi
/// token tampilan.
List<String> tokensOf(String text) =>
    text.split(RegExp(r'\s+')).where((w) => w.isNotEmpty).toList();

/// Nilai rata-rata sesi (0..100) dari skor terbaik per item.
int averagePercent(Iterable<int> scores) => scores.isEmpty
    ? 0
    : (scores.fold(0, (a, b) => a + b) / scores.length).round();
