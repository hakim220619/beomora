import '../data/ja_particles.dart';
import '../data/jlpt_vocab.dart';
import '../data/ja_gloss_cards.dart';
import 'name_katakana.dart';

/// Satu kata di kalimat Jepang beserta arti per katanya (untuk kartu
/// "Kalimat Sehari-hari" di Latihan). Partikel tidak diberi arti — cukup
/// diwarnai, penjelasannya lewat [particle].
class GlossToken {
  final String text;
  final String? reading;
  final Map<String, String>? gloss;
  final JaParticle? particle;

  /// Entri kosakata JLPT asal arti (bentuk kamus), bila ada.
  final JVocab? vocab;

  const GlossToken(
    this.text, {
    this.reading,
    this.gloss,
    this.particle,
    this.vocab,
  });
}

/// Kata fungsi yang tidak ada di daftar JLPT (kopula, bantu, sambung).
const Map<String, Map<String, String>> _functionWords = {
  'です': {'id': '(sopan)', 'en': '(polite)'},
  'でした': {'id': '(sopan, lampau)', 'en': '(polite, past)'},
  'でしょう': {'id': 'mungkin', 'en': 'probably'},
  'だ': {'id': 'adalah', 'en': 'is'},
  'だった': {'id': 'dulu (adalah)', 'en': 'was'},
  'ではありません': {'id': 'bukan', 'en': 'is not'},
  'じゃありません': {'id': 'bukan', 'en': 'is not'},
  'じゃない': {'id': 'bukan', 'en': 'is not'},
  'ください': {'id': 'tolong', 'en': 'please'},
  'ございます': {'id': '(sangat sopan)', 'en': '(very polite)'},
  'います': {'id': 'ada (makhluk)', 'en': 'there is (living)'},
  'いました': {'id': 'ada (lampau)', 'en': 'there was (living)'},
  'あります': {'id': 'ada (benda)', 'en': 'there is (thing)'},
  'ありました': {'id': 'ada (lampau)', 'en': 'there was (thing)'},
  'ありません': {'id': 'tidak ada', 'en': 'there is not'},
  'ない': {'id': 'tidak', 'en': 'not'},
  'ので': {'id': 'karena', 'en': 'because'},
  'のに': {'id': 'padahal', 'en': 'even though'},
  'けど': {'id': 'tapi', 'en': 'but'},
  'けれど': {'id': 'tetapi', 'en': 'but'},
  'けれども': {'id': 'tetapi', 'en': 'however'},
  'ん': {'id': '(penegas)', 'en': '(emphasis)'},
  'んです': {'id': '(penjelasan)', 'en': '(explanation)'},
  'な': {'id': '(penghubung)', 'en': '(linker)'},
  'ため': {'id': 'demi; karena', 'en': 'for; because of'},
  'こと': {'id': 'hal', 'en': 'thing (abstract)'},
  'もの': {'id': 'barang; hal', 'en': 'thing'},
  'とき': {'id': 'ketika', 'en': 'when'},
  'あと': {'id': 'setelah', 'en': 'after'},
  'しまいました': {'id': '(terlanjur)', 'en': '(ended up)'},
  'なりました': {'id': 'menjadi', 'en': 'became'},
  'なります': {'id': 'menjadi', 'en': 'becomes'},
  'なった': {'id': 'menjadi', 'en': 'became'},
  'します': {'id': 'melakukan', 'en': 'do'},
  'しました': {'id': 'sudah melakukan', 'en': 'did'},
  'して': {'id': 'melakukan', 'en': 'doing'},
  'する': {'id': 'melakukan', 'en': 'do'},
  'した': {'id': 'sudah melakukan', 'en': 'did'},
  'いる': {'id': 'ada; sedang', 'en': 'be; -ing'},
  'ある': {'id': 'ada', 'en': 'there is'},
  'ましょう': {'id': 'ayo', 'en': "let's"},
  'ごちそうさま': {'id': 'terima kasih (makanannya)', 'en': 'thanks for the meal'},
  'おだいじに': {'id': 'semoga lekas sembuh', 'en': 'get well soon'},
  'いっしょ': {'id': 'bersama', 'en': 'together'},
};

/// Bilangan kana (urut terpanjang dulu) untuk [_numberGloss].
const _numerals = [
  ('じゅっ', 10),
  ('じゅう', 10),
  ('ひゃく', 100),
  ('きゅう', 9),
  ('せん', 1000),
  ('はっ', 8),
  ('はち', 8),
  ('なな', 7),
  ('しち', 7),
  ('ろっ', 6),
  ('ろく', 6),
  ('よん', 4),
  ('さん', 3),
  ('いっ', 1),
  ('いち', 1),
  ('よ', 4),
  ('ご', 5),
  ('に', 2),
  ('く', 9),
];

/// Satuan hitung → pola arti ({n} = angka).
const _counterGloss = <String, Map<String, String>>{
  'じかん': {'id': '{n} jam (lamanya)', 'en': '{n} hour(s)'},
  'じ': {'id': 'jam {n}', 'en': "{n} o'clock"},
  'ふん': {'id': '{n} menit', 'en': '{n} minute(s)'},
  'ぷん': {'id': '{n} menit', 'en': '{n} minute(s)'},
  'にん': {'id': '{n} orang', 'en': '{n} people'},
  'さい': {'id': '{n} tahun (usia)', 'en': '{n} years old'},
  'かい': {'id': 'lantai {n}; {n} kali', 'en': 'floor {n}; {n} times'},
  'がい': {'id': 'lantai {n}', 'en': 'floor {n}'},
  'えん': {'id': '{n} yen', 'en': '{n} yen'},
  'ねん': {'id': 'tahun {n}', 'en': 'year {n}'},
  'まい': {'id': '{n} lembar', 'en': '{n} sheet(s)'},
  'ほん': {'id': '{n} batang', 'en': '{n} (long things)'},
  'ぼん': {'id': '{n} batang', 'en': '{n} (long things)'},
  'ぽん': {'id': '{n} batang', 'en': '{n} (long things)'},
  'さつ': {'id': '{n} buku (jilid)', 'en': '{n} book(s)'},
};

/// [_numberGloss] hanya bila bukan kosakata JLPT (しちじ sudah ada).
Map<String, String>? _numberGlossIfNotWord(String t) =>
    _dict.words.containsKey(t) ? null : _numberGloss(t);

/// Angka + satuan hitung (ろくじ = jam 6, よにん = 4 orang, せんえん =
/// 1000 yen) → arti, atau null.
Map<String, String>? _numberGloss(String t) {
  for (final MapEntry(key: counter, value: pattern) in _counterGloss.entries) {
    if (!t.endsWith(counter) || t.length == counter.length) continue;
    var rest = t.substring(0, t.length - counter.length);
    var total = 0, cur = 0;
    while (rest.isNotEmpty) {
      final hit = _numerals.where((n) => rest.startsWith(n.$1)).firstOrNull;
      if (hit == null) break;
      rest = rest.substring(hit.$1.length);
      final v = hit.$2;
      if (v >= 10) {
        total += (cur == 0 ? 1 : cur) * v;
        cur = 0;
      } else {
        cur = v;
      }
    }
    if (rest.isNotEmpty) continue;
    final n = total + cur;
    if (n == 0) continue;
    return {
      for (final lang in const ['id', 'en'])
        lang: pattern[lang]!.replaceAll('{n}', '$n'),
    };
  }
  return null;
}

/// Bantu setelah bentuk て.
const Map<String, Map<String, String>> _progressive = {
  'います': {
    'id': '(sedang)',
    'en': '(-ing)',
    'merge_id': 'sedang {m}',
    'merge_en': '{m} (-ing)',
  },
  'いました': {
    'id': '(sedang, lampau)',
    'en': '(was -ing)',
    'merge_id': 'tadi sedang {m}',
    'merge_en': 'was {m} (-ing)',
  },
  'いる': {
    'id': '(sedang)',
    'en': '(-ing)',
    'merge_id': 'sedang {m}',
    'merge_en': '{m} (-ing)',
  },
  'いた': {
    'id': '(sedang, lampau)',
    'en': '(was -ing)',
    'merge_id': 'tadi sedang {m}',
    'merge_en': 'was {m} (-ing)',
  },
  'いません': {
    'id': '(belum)',
    'en': '(not yet)',
    'merge_id': 'belum {m}',
    'merge_en': 'not {m} yet',
  },
};

const _iToU = {
  'い': 'う',
  'き': 'く',
  'ぎ': 'ぐ',
  'し': 'す',
  'ち': 'つ',
  'に': 'ぬ',
  'び': 'ぶ',
  'み': 'む',
  'り': 'る',
};
const _aToU = {
  'わ': 'う',
  'か': 'く',
  'が': 'ぐ',
  'さ': 'す',
  'た': 'つ',
  'な': 'ぬ',
  'ば': 'ぶ',
  'ま': 'む',
  'ら': 'る',
};

/// Bentuk kamus yang mungkin dari bentuk ます (tanpa ます).
List<String> _fromMasuStem(String stem) {
  if (stem.isEmpty) return const [];
  final last = stem[stem.length - 1];
  final head = stem.substring(0, stem.length - 1);
  // Akhiran -i kebanyakan godan (いきます → いく); hanya sedikit kata
  // kerja ichidan berakhiran -i (みる, おきる, かりる, …).
  final ichidanFirst =
      !_iToU.containsKey(last) || _ichidanIStems.contains(stem);
  return [
    if (stem == 'し') 'する',
    if (stem == 'き') 'くる',
    if (last == 'し' && head.isNotEmpty) ...['$headする', head],
    if (ichidanFirst) '$stemる',
    if (_iToU[last] != null) '$head${_iToU[last]}',
    if (!ichidanFirst) '$stemる',
  ];
}

/// Kata kerja ichidan yang batangnya berakhiran -i (みます → みる).
const _ichidanIStems = {
  'み',
  'い',
  'おき',
  'かり',
  'おり',
  'でき',
  'あび',
  'たり',
  'に',
  'き',
  'しんじ',
  'おち',
  'すぎ',
  'のび',
};

/// Bentuk kamus yang mungkin dari bentuk て/た ([form] = utuh).
List<String> _fromTeTa(String form) {
  if (form.length < 2) return const [];
  final body = form.substring(0, form.length - 1); // tanpa て/た/で/だ
  final voiced = form.endsWith('で') || form.endsWith('だ');
  final out = <String>[];
  if (form == 'きて' || form == 'きた') out.add('くる');
  if (form == 'して' || form == 'した') out.add('する');
  if (form == 'いって' || form == 'いった') out.add('いく');
  final last = body[body.length - 1];
  final head = body.substring(0, body.length - 1);
  if (voiced) {
    if (last == 'ん') out.addAll(['$headむ', '$headぶ', '$headぬ']);
    if (last == 'い') out.add('$headぐ');
  } else {
    if (last == 'っ') out.addAll(['$headう', '$headつ', '$headる']);
    if (last == 'い') out.add('$headく');
    if (last == 'し') out.addAll(['$headす', '$headする', head]);
    out.add('$bodyる'); // ichidan: たべて → たべる
  }
  return out;
}

/// Bentuk kamus yang mungkin dari bentuk ない (tanpa ない).
List<String> _fromNaiStem(String stem) {
  if (stem.isEmpty) return const [];
  final last = stem[stem.length - 1];
  final head = stem.substring(0, stem.length - 1);
  return [
    if (stem == 'し') 'する',
    if (stem == 'こ') 'くる',
    '$stemる',
    if (_aToU[last] != null) '$head${_aToU[last]}',
  ];
}

String _stripTo(String m) => m.startsWith('to ') ? m.substring(3) : m;

/// Ambil arti pertama yang ringkas ("nol (bacaan Jepang)" → tetap,
/// "makan; menyantap" → "makan").
String _short(String m) {
  final s = m.split(';').first.trim();
  return s.length > 28 ? '${s.substring(0, 26)}…' : s;
}

class _Dict {
  final Map<String, JVocab> words = {};

  /// Kana yang punya lebih dari satu arti (とめる, はし, …): artinya
  /// hanya dipakai bila kata itu sendiri pemilik kalimat.
  final Set<String> ambiguous = {};
  _Dict() {
    for (final list in const [jlptN5, jlptN4, jlptN3]) {
      for (final w in list) {
        final prev = words.putIfAbsent(w.kana, () => w);
        if (!identical(prev, w) && prev.meaning['id'] != w.meaning['id']) {
          ambiguous.add(w.kana);
        }
      }
    }
  }

  /// [prefer] = kata pemilik kalimat: bila bentuk kamusnya cocok, arti
  /// dari kata itu yang dipakai (とめる "memasang" vs "menghentikan").
  /// [verb] = bentuk berubah dari kata kerja: hanya terima entri yang
  /// artinya kata kerja ("to …"), supaya もって tidak dibaca もう.
  JVocab? find(
    Iterable<String> candidates, [
    JVocab? prefer,
    bool verb = false,
  ]) {
    bool ok(JVocab w) =>
        !verb || (w.meaning['en'] ?? '').toLowerCase().startsWith('to ');
    if (prefer != null && ok(prefer)) {
      for (final c in candidates) {
        if (c == prefer.kana) return prefer;
      }
    }
    for (final c in candidates) {
      final key = words.containsKey(c)
          ? c
          // Awalan sopan お/ご (おなまえ → なまえ); sisa minimal 2 kana
          // supaya ごじ (jam 5) tidak dibaca じ (huruf).
          : (c.startsWith('お') || c.startsWith('ご')) &&
                c.length >= 3 &&
                words.containsKey(c.substring(1))
          ? c.substring(1)
          : null;
      if (key == null || !ok(words[key]!)) continue;
      // Homofon tanpa konteks → jangan menebak artinya.
      if (ambiguous.contains(key)) return null;
      return words[key];
    }
    return null;
  }
}

final _dict = _Dict();

/// (kosakata, pola arti) untuk satu kata Jepang, atau null. Pola memakai
/// `{m}` untuk arti bentuk kamusnya.
(JVocab, Map<String, String>)? _lookup(String t, [JVocab? prefer]) {
  const plain = {'id': '{m}', 'en': '{m}'};
  final direct = _dict.find([t], prefer);
  if (direct != null) return (direct, plain);

  (JVocab, Map<String, String>)? tryRule(
    String suffix,
    List<String> Function(String) base,
    Map<String, String> pattern, {
    bool verb = false,
  }) {
    if (!t.endsWith(suffix) || t.length <= suffix.length) return null;
    final w = _dict.find(
      base(t.substring(0, t.length - suffix.length)),
      prefer,
      verb,
    );
    return w == null ? null : (w, pattern);
  }

  List<String> te(String s) => _fromTeTa('$sて');
  List<String> de(String s) => _fromTeTa('$sで');
  const rules = <(String, String, Map<String, String>)>[
    // (akhiran, jenis dasar, pola arti)
    ('ていました', 'te', {'id': 'sedang {m}', 'en': 'was {m}-ing'}),
    ('でいました', 'de', {'id': 'sedang {m}', 'en': 'was {m}-ing'}),
    ('ています', 'te', {'id': 'sedang {m}', 'en': '{m} (-ing)'}),
    ('でいます', 'de', {'id': 'sedang {m}', 'en': '{m} (-ing)'}),
    ('ている', 'te', {'id': 'sedang {m}', 'en': '{m} (-ing)'}),
    ('でいる', 'de', {'id': 'sedang {m}', 'en': '{m} (-ing)'}),
    ('ませんでした', 'masu', {'id': 'tidak {m}', 'en': "didn't {m}"}),
    ('ました', 'masu', {'id': 'sudah {m}', 'en': '{m} (past)'}),
    ('ません', 'masu', {'id': 'tidak {m}', 'en': "don't {m}"}),
    ('ましょう', 'masu', {'id': 'ayo {m}', 'en': "let's {m}"}),
    ('ます', 'masu', {'id': '{m}', 'en': '{m}'}),
    ('たかった', 'masu', {'id': 'dulu ingin {m}', 'en': 'wanted to {m}'}),
    ('たい', 'masu', {'id': 'ingin {m}', 'en': 'want to {m}'}),
    ('なかった', 'nai', {'id': 'tidak {m}', 'en': "didn't {m}"}),
    ('ない', 'nai', {'id': 'tidak {m}', 'en': 'not {m}'}),
    ('くなかった', 'adj', {'id': 'tidak {m}', 'en': 'was not {m}'}),
    ('くない', 'adj', {'id': 'tidak {m}', 'en': 'not {m}'}),
    ('かった', 'adj', {'id': '{m} (lampau)', 'en': 'was {m}'}),
    ('くて', 'adj', {'id': '{m}, dan', 'en': '{m} and'}),
    ('くなりました', 'adj', {'id': 'menjadi {m}', 'en': 'became {m}'}),
    ('く', 'adj', {'id': '{m}', 'en': '{m}'}),
    ('な', 'na', {'id': '{m}', 'en': '{m}'}),
  ];
  for (final (suffix, kind, pattern) in rules) {
    final r = tryRule(
      suffix,
      switch (kind) {
        'te' => te,
        'de' => de,
        'masu' => _fromMasuStem,
        'nai' => _fromNaiStem,
        'adj' => (s) => ['$sい'],
        _ => (s) => [s, '$sな'],
      },
      pattern,
      verb: kind != 'adj' && kind != 'na',
    );
    if (r != null) return r;
  }
  // Bentuk て/た biasa.
  for (final (suffix, pattern) in const [
    ('て', {'id': '{m}', 'en': '{m}'}),
    ('で', {'id': '{m}', 'en': '{m}'}),
    ('た', {'id': 'sudah {m}', 'en': '{m} (past)'}),
    ('だ', {'id': 'sudah {m}', 'en': '{m} (past)'}),
  ]) {
    if (t.endsWith(suffix) && t.length > 1) {
      final w = _dict.find(_fromTeTa(t), prefer, true);
      if (w != null) return (w, pattern);
    }
  }
  return null;
}

final _trailing = RegExp(r'[、。！？!?,.「」『』]+');

/// Pecah kalimat contoh (kana, dipisah spasi) jadi kata + arti. null bila
/// romaji tidak sejajar atau ada kata isi yang tidak bisa diberi arti.
/// [owner] = kata JLPT pemilik kalimat (artinya diutamakan); [onFail]
/// menerima alasan bila gagal (untuk tes/diagnosis). [extra] = arti
/// tambahan untuk nama diri / kata di luar JLPT (リナ, とうきょう).
List<GlossToken>? glossJaSentence(
  String text,
  String reading, {
  JVocab? owner,
  Map<String, Map<String, String>> extra = const {},
  void Function(String reason)? onFail,
}) {
  final tokens = text.split(' ');
  final rom = reading.split(' ');
  if (tokens.length != rom.length) {
    onFail?.call('jumlah kata ${tokens.length} ≠ romaji ${rom.length}');
    return null;
  }
  final marks = particlesOf(text, reading);
  final out = <GlossToken>[];
  for (var i = 0; i < tokens.length; i++) {
    final bare = tokens[i].replaceAll(_trailing, '');
    if (marks[i] != null) {
      out.add(GlossToken(tokens[i], reading: rom[i], particle: marks[i]));
      continue;
    }
    if (bare.isEmpty) {
      onFail?.call('token kosong');
      return null;
    }
    // ～て います / ～て いる = sedang (bukan "ada").
    final prev = i > 0 ? tokens[i - 1].replaceAll(_trailing, '') : '';
    // Arti khusus kalimat ([extra]) selalu menang.
    if (extra[bare] case final forced?) {
      out.add(GlossToken(tokens[i], reading: rom[i], gloss: forced));
      continue;
    }
    if ((prev.endsWith('て') || prev.endsWith('で')) &&
        _progressive.containsKey(bare)) {
      // Satukan jadi satu kata seperti ふっています = "sedang turun".
      final last = out.isEmpty ? null : out.last;
      if (last != null && last.vocab != null && last.gloss != null) {
        final aspect = _progressive[bare]!;
        out[out.length - 1] = GlossToken(
          '${last.text}${tokens[i]}',
          reading: '${last.reading}${rom[i]}',
          vocab: last.vocab,
          gloss: {
            for (final lang in const ['id', 'en'])
              lang: aspect['merge_$lang']!.replaceAll(
                '{m}',
                last.gloss![lang]!,
              ),
          },
        );
      } else {
        out.add(
          GlossToken(tokens[i], reading: rom[i], gloss: _progressive[bare]),
        );
      }
      continue;
    }
    final fn =
        extra[bare] ?? _functionWords[bare] ?? _numberGlossIfNotWord(bare);
    if (fn != null) {
      out.add(GlossToken(tokens[i], reading: rom[i], gloss: fn));
      continue;
    }
    final hit = _lookup(bare, owner);
    if (hit == null) {
      onFail?.call('tak dikenal: $bare');
      return null;
    }
    final (vocab, pattern) = hit;
    out.add(
      GlossToken(
        tokens[i],
        reading: rom[i],
        vocab: vocab,
        gloss: {
          for (final lang in const ['id', 'en'])
            lang: pattern[lang]!.replaceAll(
              '{m}',
              _short(
                lang == 'en'
                    ? _stripTo(vocab.meaning['en'] ?? '')
                    : vocab.meaning['id'] ?? '',
              ),
            ),
        },
      ),
    );
  }
  return out;
}

/// Satu kalimat kartu yang sudah dipecah + diberi arti per kata.
class GlossedLine {
  final GlossLine line;
  final List<GlossToken> tokens;
  const GlossedLine(this.line, this.tokens);
}

/// Kalimat-kalimat [card] dengan arti per kata (kalimat yang gagal
/// diberi arti dilewati; test memastikan tidak ada). `{name}` diganti
/// [userName] (nama depan pengguna, ditulis katakana) atau "Rina".
List<GlossedLine> glossCardLines(GlossCardData card, {String? userName}) {
  final latin = _firstName(userName) ?? 'Rina';
  final kana = nameToKatakana(latin).isEmpty ? 'リナ' : nameToKatakana(latin);
  final romaji = latin.toLowerCase();
  final out = <GlossedLine>[];
  for (final l in card.lines) {
    final line = _withName(l, latin, kana, romaji);
    final t = glossJaSentence(line.text, line.romaji, extra: line.extra);
    if (t != null) out.add(GlossedLine(line, t));
  }
  return out;
}

/// Nama depan berhuruf Latin, kapital di awal ("dani lukman" → "Dani").
String? _firstName(String? name) {
  final first = name?.trim().split(RegExp(r'\s+')).first ?? '';
  final latin = first.replaceAll(RegExp(r'[^A-Za-z]'), '');
  if (latin.isEmpty) return null;
  return latin[0].toUpperCase() + latin.substring(1).toLowerCase();
}

GlossLine _withName(GlossLine l, String latin, String kana, String romaji) {
  if (!l.text.contains(kGlossNameSlot)) return l;
  return GlossLine(
    l.text.replaceAll(kGlossNameSlot, kana),
    l.romaji.replaceAll(kGlossNameSlot, romaji),
    {
      for (final e in l.meaning.entries)
        e.key: e.value.replaceAll(kGlossNameSlot, latin),
    },
    extra: {
      ...l.extra,
      kana: {'id': '$latin (nama)', 'en': '$latin (name)'},
    },
  );
}
