import 'package:flutter/material.dart';

// Analisis tata bahasa contoh kalimat Inggris: kata fungsi (diwarnai per
// golongan), bentuk kosakata di kalimat, dan tebakan tense. Semua
// berbasis pola kata — sengaja hati-hati: kalau ragu, tidak memberi label.

/// Golongan kata fungsi; satu warna per golongan.
enum EnWordClass {
  preposition(Color(0xFF1CB0F6), {'id': 'Preposisi', 'en': 'Preposition'}),
  article(Color(0xFFFF9600), {'id': 'Artikel', 'en': 'Article'}),
  auxiliary(Color(0xFF58CC02), {
    'id': 'Kata kerja bantu',
    'en': 'Auxiliary verb',
  }),
  conjunction(Color(0xFFCE82FF), {'id': 'Kata sambung', 'en': 'Conjunction'});

  final Color color;
  final Map<String, String> label;
  const EnWordClass(this.color, this.label);
}

class EnFunctionWord {
  final String word;
  final EnWordClass cls;
  final Map<String, String> desc;
  const EnFunctionWord(this.word, this.cls, this.desc);
}

const _p = EnWordClass.preposition;
const _a = EnWordClass.article;
const _x = EnWordClass.auxiliary;
const _c = EnWordClass.conjunction;

/// Kata fungsi yang diwarnai, dengan arti singkat (bahasa UI).
const Map<String, EnFunctionWord> kEnFunctionWords = {
  // Artikel
  'a': EnFunctionWord('a', _a, {
    'id': 'sebuah/seorang — benda tunggal tidak spesifik (bunyi konsonan)',
    'en': 'one, any — singular, not specific (before consonant sounds)',
  }),
  'an': EnFunctionWord('an', _a, {
    'id': 'sebuah/seorang — sebelum bunyi vokal (an apple, an hour)',
    'en': 'one, any — before vowel sounds (an apple, an hour)',
  }),
  'the': EnFunctionWord('the', _a, {
    'id': 'si/itu — benda tertentu yang sudah jelas',
    'en': 'specific thing both speakers know',
  }),
  // Preposisi
  'in': EnFunctionWord('in', _p, {
    'id': 'di dalam; waktu panjang (in May, in 2026, in the morning)',
    'en': 'inside; longer time (in May, in 2026, in the morning)',
  }),
  'on': EnFunctionWord('on', _p, {
    'id': 'di atas (menempel); hari/tanggal (on Monday, on May 5)',
    'en': 'on a surface; days/dates (on Monday, on May 5)',
  }),
  'at': EnFunctionWord('at', _p, {
    'id': 'di (titik tempat); jam (at 7, at the station, at night)',
    'en': 'at a point; clock time (at 7, at the station, at night)',
  }),
  'to': EnFunctionWord('to', _p, {
    'id': 'ke (arah) / to + kata kerja = untuk …',
    'en': 'toward (direction) / to + verb = in order to …',
  }),
  'from': EnFunctionWord('from', _p, {
    'id': 'dari (asal / titik awal)',
    'en': 'origin / starting point',
  }),
  'for': EnFunctionWord('for', _p, {
    'id': 'untuk; selama (for two hours)',
    'en': 'purpose, recipient; duration (for two hours)',
  }),
  'with': EnFunctionWord('with', _p, {
    'id': 'dengan / bersama',
    'en': 'together with / using',
  }),
  'by': EnFunctionWord('by', _p, {
    'id': 'oleh (pasif); dengan (by bus); paling lambat (by Friday)',
    'en': 'agent (passive); means (by bus); deadline (by Friday)',
  }),
  'of': EnFunctionWord('of', _p, {
    'id': 'dari / milik (a cup of tea, the end of the day)',
    'en': 'belonging, part (a cup of tea, the end of the day)',
  }),
  'about': EnFunctionWord('about', _p, {
    'id': 'tentang; kira-kira (about ten)',
    'en': 'on the topic of; approximately (about ten)',
  }),
  'into': EnFunctionWord('into', _p, {'id': 'ke dalam', 'en': 'moving inside'}),
  'during': EnFunctionWord('during', _p, {
    'id': 'selama (sebuah periode/kejadian)',
    'en': 'throughout a period/event',
  }),
  'after': EnFunctionWord('after', _p, {'id': 'setelah', 'en': 'later than'}),
  'before': EnFunctionWord('before', _p, {
    'id': 'sebelum',
    'en': 'earlier than',
  }),
  'under': EnFunctionWord('under', _p, {'id': 'di bawah', 'en': 'below'}),
  'between': EnFunctionWord('between', _p, {
    'id': 'di antara (dua hal)',
    'en': 'in the middle of two things',
  }),
  'through': EnFunctionWord('through', _p, {
    'id': 'melalui / menembus',
    'en': 'from one side to the other; by means of',
  }),
  'without': EnFunctionWord('without', _p, {'id': 'tanpa', 'en': 'not having'}),
  'since': EnFunctionWord('since', _p, {
    'id': 'sejak (titik awal waktu); karena',
    'en': 'from a point in time; because',
  }),
  'until': EnFunctionWord('until', _p, {
    'id': 'sampai / hingga',
    'en': 'up to a time',
  }),
  // Kata kerja bantu, to be & modal
  'am': EnFunctionWord('am', _x, {
    'id': 'to be untuk I (sekarang)',
    'en': 'to be with I (present)',
  }),
  'is': EnFunctionWord('is', _x, {
    'id': 'to be untuk he/she/it/tunggal (sekarang)',
    'en': 'to be for he/she/it/singular (present)',
  }),
  'are': EnFunctionWord('are', _x, {
    'id': 'to be untuk you/we/they/jamak (sekarang)',
    'en': 'to be for you/we/they/plural (present)',
  }),
  'was': EnFunctionWord('was', _x, {
    'id': 'to be lampau untuk I/he/she/it',
    'en': 'past to be for I/he/she/it',
  }),
  'were': EnFunctionWord('were', _x, {
    'id': 'to be lampau untuk you/we/they',
    'en': 'past to be for you/we/they',
  }),
  'be': EnFunctionWord('be', _x, {
    'id': 'to be bentuk dasar (setelah will/can/must/to)',
    'en': 'base form of to be (after will/can/must/to)',
  }),
  'been': EnFunctionWord('been', _x, {
    'id': 'to be bentuk V3 (have been, has been)',
    'en': 'past participle of be (have been)',
  }),
  'have': EnFunctionWord('have', _x, {
    'id': 'punya; atau kata bantu perfect: have + V3',
    'en': 'possess; or perfect auxiliary: have + V3',
  }),
  'has': EnFunctionWord('has', _x, {
    'id': 'punya (he/she/it); atau kata bantu perfect: has + V3',
    'en': 'possess (he/she/it); or perfect auxiliary: has + V3',
  }),
  'had': EnFunctionWord('had', _x, {
    'id': 'lampau dari have; atau past perfect: had + V3',
    'en': 'past of have; or past perfect: had + V3',
  }),
  'do': EnFunctionWord('do', _x, {
    'id': 'kata bantu tanya/negatif (Simple Present); juga "melakukan"',
    'en': 'helper for questions/negatives (Simple Present); also "perform"',
  }),
  'does': EnFunctionWord('does', _x, {
    'id': 'do untuk he/she/it (Simple Present)',
    'en': 'do for he/she/it (Simple Present)',
  }),
  'did': EnFunctionWord('did', _x, {
    'id': 'kata bantu tanya/negatif lampau (Simple Past)',
    'en': 'helper for past questions/negatives (Simple Past)',
  }),
  'will': EnFunctionWord('will', _x, {
    'id': 'akan (masa depan): will + V1',
    'en': 'future: will + base verb',
  }),
  'would': EnFunctionWord('would', _x, {
    'id': 'akan (lampau/pengandaian); permintaan sopan',
    'en': 'past of will; conditional; polite requests',
  }),
  'can': EnFunctionWord('can', _x, {
    'id': 'bisa / boleh',
    'en': 'ability / permission',
  }),
  'could': EnFunctionWord('could', _x, {
    'id': 'bisa (lampau); mungkin; permintaan sopan',
    'en': 'past ability; possibility; polite request',
  }),
  'should': EnFunctionWord('should', _x, {
    'id': 'sebaiknya / seharusnya (saran)',
    'en': 'advice / expectation',
  }),
  'must': EnFunctionWord('must', _x, {
    'id': 'harus (kewajiban kuat)',
    'en': 'strong obligation',
  }),
  'may': EnFunctionWord('may', _x, {
    'id': 'boleh; mungkin',
    'en': 'permission; possibility',
  }),
  'might': EnFunctionWord('might', _x, {
    'id': 'mungkin (kemungkinan kecil)',
    'en': 'weaker possibility',
  }),
  // Kata sambung
  'and': EnFunctionWord('and', _c, {'id': 'dan', 'en': 'adds information'}),
  'but': EnFunctionWord('but', _c, {
    'id': 'tetapi (pertentangan)',
    'en': 'contrast',
  }),
  'or': EnFunctionWord('or', _c, {
    'id': 'atau (pilihan)',
    'en': 'choice / alternative',
  }),
  'because': EnFunctionWord('because', _c, {
    'id': 'karena (alasan)',
    'en': 'reason',
  }),
  'so': EnFunctionWord('so', _c, {
    'id': 'jadi / sehingga (akibat); juga "sangat"',
    'en': 'result; also "very"',
  }),
  'if': EnFunctionWord('if', _c, {
    'id': 'jika / kalau (syarat)',
    'en': 'condition',
  }),
  'when': EnFunctionWord('when', _c, {
    'id': 'ketika / saat',
    'en': 'at the time that',
  }),
  'although': EnFunctionWord('although', _c, {
    'id': 'meskipun',
    'en': 'despite the fact that',
  }),
  'while': EnFunctionWord('while', _c, {
    'id': 'sementara / selagi',
    'en': 'during the time that; whereas',
  }),
};

final _edge = RegExp(r"^[^A-Za-z']+|[^A-Za-z']+$");

/// Token tanpa tanda baca di ujung, huruf kecil.
String enBare(String token) => token.replaceAll(_edge, '').toLowerCase();

/// Kata fungsi per token kalimat; null = bukan kata fungsi.
List<EnFunctionWord?> enFunctionWordsOf(String sentence) => [
  for (final t in sentence.split(' ')) kEnFunctionWords[enBare(t)],
];

// ---------- Kata kerja tak beraturan (V1, V2, V3) ----------

const _irregular = <String, (String, String)>{
  'be': ('was', 'been'),
  'become': ('became', 'become'),
  'begin': ('began', 'begun'),
  'break': ('broke', 'broken'),
  'bring': ('brought', 'brought'),
  'build': ('built', 'built'),
  'buy': ('bought', 'bought'),
  'catch': ('caught', 'caught'),
  'choose': ('chose', 'chosen'),
  'come': ('came', 'come'),
  'cost': ('cost', 'cost'),
  'cut': ('cut', 'cut'),
  'do': ('did', 'done'),
  'draw': ('drew', 'drawn'),
  'drink': ('drank', 'drunk'),
  'drive': ('drove', 'driven'),
  'eat': ('ate', 'eaten'),
  'fall': ('fell', 'fallen'),
  'feed': ('fed', 'fed'),
  'feel': ('felt', 'felt'),
  'fight': ('fought', 'fought'),
  'find': ('found', 'found'),
  'fly': ('flew', 'flown'),
  'forget': ('forgot', 'forgotten'),
  'freeze': ('froze', 'frozen'),
  'get': ('got', 'gotten'),
  'give': ('gave', 'given'),
  'go': ('went', 'gone'),
  'grow': ('grew', 'grown'),
  'hang': ('hung', 'hung'),
  'have': ('had', 'had'),
  'hear': ('heard', 'heard'),
  'hide': ('hid', 'hidden'),
  'hit': ('hit', 'hit'),
  'hold': ('held', 'held'),
  'hurt': ('hurt', 'hurt'),
  'keep': ('kept', 'kept'),
  'know': ('knew', 'known'),
  'lay': ('laid', 'laid'),
  'lead': ('led', 'led'),
  'leave': ('left', 'left'),
  'lend': ('lent', 'lent'),
  'let': ('let', 'let'),
  'lie': ('lay', 'lain'),
  'lose': ('lost', 'lost'),
  'make': ('made', 'made'),
  'mean': ('meant', 'meant'),
  'meet': ('met', 'met'),
  'pay': ('paid', 'paid'),
  'put': ('put', 'put'),
  'read': ('read', 'read'),
  'ride': ('rode', 'ridden'),
  'ring': ('rang', 'rung'),
  'rise': ('rose', 'risen'),
  'run': ('ran', 'run'),
  'say': ('said', 'said'),
  'see': ('saw', 'seen'),
  'sell': ('sold', 'sold'),
  'send': ('sent', 'sent'),
  'set': ('set', 'set'),
  'shake': ('shook', 'shaken'),
  'shine': ('shone', 'shone'),
  'shoot': ('shot', 'shot'),
  'show': ('showed', 'shown'),
  'shut': ('shut', 'shut'),
  'sing': ('sang', 'sung'),
  'sink': ('sank', 'sunk'),
  'sit': ('sat', 'sat'),
  'sleep': ('slept', 'slept'),
  'speak': ('spoke', 'spoken'),
  'spend': ('spent', 'spent'),
  'split': ('split', 'split'),
  'spread': ('spread', 'spread'),
  'stand': ('stood', 'stood'),
  'steal': ('stole', 'stolen'),
  'stick': ('stuck', 'stuck'),
  'strike': ('struck', 'struck'),
  'swim': ('swam', 'swum'),
  'take': ('took', 'taken'),
  'teach': ('taught', 'taught'),
  'tear': ('tore', 'torn'),
  'tell': ('told', 'told'),
  'think': ('thought', 'thought'),
  'throw': ('threw', 'thrown'),
  'understand': ('understood', 'understood'),
  'wake': ('woke', 'woken'),
  'wear': ('wore', 'worn'),
  'win': ('won', 'won'),
  'write': ('wrote', 'written'),
  'withdraw': ('withdrew', 'withdrawn'),
  'arise': ('arose', 'arisen'),
  'bear': ('bore', 'born'),
  'bend': ('bent', 'bent'),
  'bind': ('bound', 'bound'),
  'deal': ('dealt', 'dealt'),
  'dig': ('dug', 'dug'),
  'forbid': ('forbade', 'forbidden'),
  'forgive': ('forgave', 'forgiven'),
  'overcome': ('overcame', 'overcome'),
  'seek': ('sought', 'sought'),
  'undertake': ('undertook', 'undertaken'),
  'upset': ('upset', 'upset'),
};

final Set<String> _irregularPast = {for (final v in _irregular.values) v.$1};
final Set<String> _irregularPP = {for (final v in _irregular.values) v.$2};

/// Kata berakhiran -ed yang bukan kata kerja lampau.
const _notPastEd = {
  'need',
  'seed',
  'feed',
  'speed',
  'indeed',
  'proceed',
  'succeed',
  'exceed',
  'breed',
  'bleed',
  'weed',
  'reed',
  'greed',
  'deed',
  'hundred',
  'bed',
  'red',
  'shed',
  'bread',
  'sacred',
  'naked',
  'wicked',
  'kindred',
  'shred',
  'sled',
  'wed',
  'led',
  'fed',
  'thread',
  'spread',
  'ahead',
  'instead',
  'dead',
  'head',
  'read',
  'ready',
  'embed',
};

bool _looksPastEd(String w) =>
    w.length > 4 && w.endsWith('ed') && !_notPastEd.contains(w);

bool _isPastParticiple(String w) =>
    _irregularPP.contains(w) || _irregularPast.contains(w) || _looksPastEd(w);

bool _isIng(String w) => w.length > 4 && w.endsWith('ing');

/// Kata -ing yang lazim sebagai kata sifat (is interesting ≠ continuous).
const _ingAdjectives = {
  'interesting',
  'boring',
  'exciting',
  'amazing',
  'surprising',
  'confusing',
  'tiring',
  'annoying',
  'outstanding',
  'challenging',
  'encouraging',
  'demanding',
  'promising',
  'convincing',
  'worrying',
  'disappointing',
  'satisfying',
  'refreshing',
  'relaxing',
  'charming',
  'existing',
  'willing',
  'rewarding',
  'shocking',
  'frightening',
  'embarrassing',
  'misleading',
  'overwhelming',
  'appealing',
  'fascinating',
  'thrilling',
  'ongoing',
  'upcoming',
  'outgoing',
  'striking',
  'pressing',
  'booming',
  'thriving',
};

// ---------- Bentuk kosakata di kalimat ----------

/// Bentuk kata kosakata yang muncul di kalimat.
enum EnWordForm { base, s, past, pastParticiple, ing }

/// Kata [vocab] (satu kata) di kalimat beserta bentuknya:
/// (indeks token, bentuk). null kalau tidak ditemukan.
(int, EnWordForm)? enVocabIn(String sentence, String vocab) {
  final v = vocab.trim().toLowerCase();
  if (v.isEmpty || v.contains(' ')) return null;
  final tokens = [for (final t in sentence.split(' ')) enBare(t)];
  final forms = _formsOf(v);
  for (var i = 0; i < tokens.length; i++) {
    final f = forms[tokens[i]];
    if (f != null) return (i, f);
  }
  return null;
}

Map<String, EnWordForm> _formsOf(String v) {
  final out = <String, EnWordForm>{};
  void add(String w, EnWordForm f) => out.putIfAbsent(w, () => f);
  add(v, EnWordForm.base);
  final irr = _irregular[v];
  if (irr != null) {
    add(irr.$1, EnWordForm.past);
    add(irr.$2, EnWordForm.pastParticiple);
  }
  final stem = v.endsWith('e') ? v.substring(0, v.length - 1) : v;
  final consonantY =
      v.endsWith('y') && v.length > 2 && !'aeiou'.contains(v[v.length - 2]);
  // -s / -es
  if (consonantY) {
    add('${v.substring(0, v.length - 1)}ies', EnWordForm.s);
  } else if (RegExp(r'(s|x|z|ch|sh|o)$').hasMatch(v)) {
    add('${v}es', EnWordForm.s);
  }
  add('${v}s', EnWordForm.s);
  // -ed
  if (irr == null) {
    if (consonantY) {
      add('${v.substring(0, v.length - 1)}ied', EnWordForm.past);
    } else if (v.endsWith('e')) {
      add('${v}d', EnWordForm.past);
    } else {
      add('${v}ed', EnWordForm.past);
      add('$v${v[v.length - 1]}ed', EnWordForm.past); // stop → stopped
    }
  }
  // -ing
  if (v.endsWith('ie')) {
    add('${v.substring(0, v.length - 2)}ying', EnWordForm.ing);
  }
  add('${stem}ing', EnWordForm.ing);
  add('${v}ing', EnWordForm.ing);
  add('$v${v[v.length - 1]}ing', EnWordForm.ing); // run → running
  return out;
}

/// Keterangan bentuk untuk ditampilkan di bawah kalimat.
Map<String, String>? enFormNote(EnWordForm form, String vocab) =>
    switch (form) {
      EnWordForm.base => null,
      EnWordForm.s => {
        'id': 'bentuk -s/-es dari "$vocab" (jamak, atau kata kerja he/she/it)',
        'en': '-s/-es form of "$vocab" (plural, or he/she/it verb)',
      },
      EnWordForm.past => {
        'id': 'bentuk lampau (V2) dari "$vocab"',
        'en': 'past form (V2) of "$vocab"',
      },
      EnWordForm.pastParticiple => {
        'id': 'bentuk V3 (past participle) dari "$vocab"',
        'en': 'past participle (V3) of "$vocab"',
      },
      EnWordForm.ing => {
        'id': 'bentuk -ing dari "$vocab" (sedang …, atau kata benda)',
        'en': '-ing form of "$vocab" (ongoing action, or gerund)',
      },
    };

// ---------- Tense ----------

/// Tense yang bisa dikenali; [sectionIndex] = bagian di topik Materi
/// `en_tenses` yang menjelaskannya.
enum EnTense {
  simplePresent('Simple Present', 0),
  presentContinuous('Present Continuous', 1),
  presentPerfect('Present Perfect', 2),
  presentPerfectContinuous('Present Perfect Continuous', 3),
  simplePast('Simple Past', 4),
  pastContinuous('Past Continuous', 5),
  pastPerfect('Past Perfect', 6),
  simpleFuture('Simple Future', 7);

  final String label;
  final int sectionIndex;
  const EnTense(this.label, this.sectionIndex);
}

const _subjectStarts = {
  'i',
  'you',
  'we',
  'they',
  'he',
  'she',
  'it',
  'this',
  'that',
  'these',
  'those',
  'my',
  'our',
  'their',
  'his',
  'her',
  'its',
  'your',
  'the',
  'a',
  'an',
  'many',
  'most',
  'some',
  'all',
  'every',
  'each',
  'people',
  'there',
  'everyone',
  'nobody',
  'someone',
  'one',
  'both',
  'few',
  'several',
  'no',
};

/// Kata setelah V3 yang menandai have/has + V3 memang perfect (bukan
/// "have limited access" = punya akses terbatas).
const _afterPerfectVerb = {
  'the',
  'a',
  'an',
  'it',
  'them',
  'him',
  'her',
  'us',
  'me',
  'you',
  'this',
  'that',
  'these',
  'those',
  'my',
  'our',
  'their',
  'his',
  'its',
  'your',
  'to',
  'in',
  'on',
  'at',
  'for',
  'from',
  'with',
  'by',
  'about',
  'into',
  'since',
  'already',
  'yet',
  'here',
  'there',
  'up',
  'out',
  'down',
  'off',
  'over',
  'some',
  'all',
  'many',
  'much',
  'more',
  'several',
  'two',
  'three',
  'well',
  'hard',
  'together',
  'away',
  'back',
  'twice',
  'before',
  'after',
  'and',
  'so',
  'recently',
};

const _adverbsBetween = {
  'just',
  'already',
  'never',
  'ever',
  'recently',
  'not',
  'always',
  'often',
  'also',
  'still',
  'finally',
  'only',
  'really',
  'usually',
  'sometimes',
  'carefully',
  'quickly',
  'slowly',
  'n\'t',
};

/// Tebak tense kalimat [sentence] dari penanda pertama yang ditemukan.
/// null = tidak yakin (kalimat perintah, modal, pola rumit) → tanpa label.
EnTense? enTenseOf(String sentence) {
  final raw = sentence.split(' ');
  final t = [for (final w in raw) enBare(w)];
  if (t.isEmpty || t.first.isEmpty) return null;
  if (t.first == 'please' || t.first == 'let\'s' || t.first == 'don\'t') {
    return null; // kalimat perintah
  }

  /// Lewati adverbia di antara kata bantu dan kata kerja utama.
  final question = sentence.trim().endsWith('?');

  /// Kata kerja utama setelah kata bantu di [i]: lewati adverbia; di
  /// kalimat tanya lewati juga subjeknya (Are you studying? → studying).
  int next(int i) {
    var j = i + 1;
    while (j < t.length && _adverbsBetween.contains(t[j])) {
      j++;
    }
    if (question) {
      for (var k = j; k < t.length && k <= j + 3; k++) {
        final w = t[k];
        if (w == 'been' || w == 'going' || _isIng(w) || _isPastParticiple(w)) {
          return k;
        }
      }
    }
    return j;
  }

  String at(int i) => i < t.length ? t[i] : '';

  /// have/had + [j] memang perfect: V3 khas (seen, eaten — beda dari V2),
  /// kalimat tanya, atau diikuti objek/keterangan (bukan "have limited
  /// access" = punya akses terbatas).
  bool perfectAt(int j) {
    final w = at(j);
    if (!_isPastParticiple(w)) return false;
    if (_irregularPP.contains(w) && !_irregularPast.contains(w)) return true;
    if (question || j + 1 >= t.length) return true;
    final after = raw[j + 1];
    return _afterPerfectVerb.contains(at(j + 1)) ||
        (after.isNotEmpty && after[0] != after[0].toLowerCase()); // Japan
  }

  for (var i = 0; i < t.length; i++) {
    final w = _expand(t[i]);
    switch (w) {
      case 'will' || 'shall' || 'won\'t':
        final j = next(i);
        // will be + V-ing / will have + V3 = future lain (tanpa label);
        // will be + V3 (pasif) tetap Simple Future.
        if (at(j) == 'have') return null;
        if (at(j) == 'be' && _isIng(at(j + 1))) return null;
        return EnTense.simpleFuture;
      case 'am' || 'is' || 'are' || 'isn\'t' || 'aren\'t' || 'i\'m':
        final j = next(i);
        if (at(j) == 'going' && at(j + 1) == 'to') return EnTense.simpleFuture;
        if (at(j) == 'been') return EnTense.presentPerfect; // it's been
        if (_isIng(at(j)) && !_ingAdjectives.contains(at(j))) {
          return EnTense.presentContinuous;
        }
        return EnTense.simplePresent;
      case 'was' || 'were' || 'wasn\'t' || 'weren\'t':
        final j = next(i);
        if (at(j) == 'going' && at(j + 1) == 'to') return null;
        if (_isIng(at(j)) && !_ingAdjectives.contains(at(j))) {
          return EnTense.pastContinuous;
        }
        return EnTense.simplePast;
      case 'have' || 'has' || 'haven\'t' || 'hasn\'t':
        final j = next(i);
        if (at(j) == 'been') {
          return _isIng(at(j + 1)) && !_ingAdjectives.contains(at(j + 1))
              ? EnTense.presentPerfectContinuous
              : EnTense.presentPerfect;
        }
        if (at(j) == 'to') return EnTense.simplePresent; // have to = harus
        if (perfectAt(j)) return EnTense.presentPerfect;
        return EnTense.simplePresent; // have = punya
      case 'had' || 'hadn\'t':
        final j = next(i);
        if (at(j) == 'been' || perfectAt(j)) return EnTense.pastPerfect;
        if (at(j) == 'to') return EnTense.simplePast;
        return i == 0 ? null : EnTense.simplePast;
      case 'do' || 'does' || 'don\'t' || 'doesn\'t':
        return EnTense.simplePresent;
      case 'did' || 'didn\'t':
        return EnTense.simplePast;
      case 'can' ||
          'could' ||
          'should' ||
          'must' ||
          'may' ||
          'might' ||
          'would' ||
          'can\'t' ||
          'couldn\'t' ||
          'shouldn\'t' ||
          'mustn\'t':
        return null; // modal: bukan tense
    }
    if (i > 0) {
      final prev = t[i - 1];
      final prevIsDeterminer = const {
        'a',
        'an',
        'the',
        'very',
        'more',
        'most',
        'is',
        'are',
        'was',
        'were',
        'be',
        'been',
        'of',
        'in',
        'on',
        'at',
        'for',
        'with',
        'by',
        'and',
        'or',
        'this',
        'that',
        'these',
        'those',
        'my',
        'our',
        'their',
        'his',
        'her',
        'its',
        'your',
        'well',
        'highly',
        'badly',
        'newly',
        'so',
        'too',
        'get',
        'got',
        'become',
        'became',
        'feel',
        'felt',
        'seem',
        'look',
      }.contains(prev);
      if (!prevIsDeterminer && _hasSubject(t)) {
        // put/set/cut: lampau = bentuk dasar → tak bisa dipastikan.
        if (_pastSameAsBase.contains(w)) return null;
        // Kata kerja lampau setelah subjek ("The researchers analyzed").
        if (_irregularPast.contains(w) || _looksPastEd(w)) {
          return EnTense.simplePast;
        }
      }
    }
  }
  // Tanpa penanda: kalimat bersubjek jelas = Simple Present.
  return _hasSubject(t) ? EnTense.simplePresent : null;
}

/// Bentuk singkat → kata bantunya: it's → is, you're → are, I've → have,
/// we'll → will. "'d" (had/would) dibiarkan.
String _expand(String w) {
  if (w == 'i\'m') return 'am';
  if (w == 'let\'s') return w;
  if (w.endsWith('\'re')) return 'are';
  if (w.endsWith('\'ve')) return 'have';
  if (w.endsWith('\'ll')) return 'will';
  if (w.endsWith('\'s') &&
      const {
        'it',
        'that',
        'there',
        'he',
        'she',
        'what',
        'who',
        'here',
        'where',
        'how',
      }.contains(w.substring(0, w.length - 2))) {
    return 'is'; // "it's been" ditangani di cabang is → perfect
  }
  return w;
}

/// Kata pembuka berakhiran -s yang bukan subjek (Always warm up …).
const _notSubject = {
  'always',
  'perhaps',
  'sometimes',
  'besides',
  'unless',
  'thanks',
  'yes',
  'regardless',
  'nevertheless',
  'nowadays',
  'afterwards',
  'towards',
  'otherwise',
  'whereas',
  'whereas,',
};

/// Kata kerja yang bentuk lampaunya sama dengan bentuk dasar.
const _pastSameAsBase = {
  'set',
  'put',
  'cut',
  'hit',
  'let',
  'cost',
  'read',
  'shut',
  'spread',
  'split',
  'hurt',
  'upset',
};

/// Kalimat diawali subjek yang jelas (kata ganti/penentu, atau kata
/// benda jamak "Farmers …") — bukan kalimat perintah "Wash the …".
bool _hasSubject(List<String> t) {
  final first = t.first;
  if (_notSubject.contains(first)) return false;
  return _subjectStarts.contains(first) ||
      (first.endsWith('s') &&
          !first.endsWith('ss') &&
          !first.endsWith('us') &&
          !first.endsWith('is'));
}
