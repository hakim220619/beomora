import 'dart:convert';

/// Bank "Soal Pilihan Ganda": kosakata & tata bahasa per kursus.
/// Teks soal per bahasa UI (id/en); pilihan jawaban dalam bahasa
/// target sehingga netral terhadap bahasa UI. Pilihan pertama pada
/// [_q] selalu jawaban benar — layar kuis yang mengacaknya.
///
/// Soal di file ini adalah BAWAAN aplikasi (fallback offline). Kalau
/// admin sudah mengunggah bank ke Firestore (`content/mcq_{ja,en}`),
/// versi server yang dipakai — lihat `ContentService.loadMcqBanks`.
class McqQuestion {
  final Map<String, String> question; // per bahasa UI
  final List<String> options; // 4 pilihan, bahasa target
  final int answer; // indeks jawaban benar di [options]

  const McqQuestion({
    required this.question,
    required this.options,
    required this.answer,
  });

  /// Parse + validasi ketat: 4 pilihan unik non-kosong, indeks jawaban
  /// sah, teks soal 'id' terisi. Lempar [FormatException] kalau tidak.
  factory McqQuestion.fromJson(Map<String, dynamic> m) {
    final q = McqQuestion(
      question: Map<String, String>.from(m['question'] as Map),
      options: List<String>.from(m['options'] as List),
      answer: (m['answer'] as num).toInt(),
    );
    final idText = q.question['id'];
    if (idText == null ||
        idText.trim().isEmpty ||
        q.options.length != 4 ||
        q.options.toSet().length != 4 ||
        q.options.any((o) => o.trim().isEmpty) ||
        q.answer < 0 ||
        q.answer >= q.options.length) {
      throw FormatException('soal tidak valid: ${m['question']}');
    }
    return q;
  }

  Map<String, dynamic> toJson() =>
      {'question': question, 'options': options, 'answer': answer};
}

/// Kursus yang punya bank soal (sekaligus daftar dokumen Firestore).
const List<String> mcqCourseIds = ['ja', 'en'];

/// Decode satu bank dari string JSON (isi dokumen Firestore / cache).
/// Lempar kalau kosong atau ada soal yang tidak valid.
List<McqQuestion> mcqListFromJson(String raw) {
  final list = [
    for (final e in jsonDecode(raw) as List)
      McqQuestion.fromJson(e as Map<String, dynamic>),
  ];
  if (list.isEmpty) throw const FormatException('bank soal kosong');
  return list;
}

String mcqListToJson(List<McqQuestion> questions) =>
    jsonEncode([for (final q in questions) q.toJson()]);

/// Bank hasil sinkron Firestore, diisi `ContentService.loadMcqBanks`
/// saat aplikasi mulai; selama kosong, bank bawaan yang dipakai.
final Map<String, List<McqQuestion>> _synced = {};

void applySyncedMcqBank(String courseId, List<McqQuestion> questions) {
  _synced[courseId] = questions;
}

/// (Khusus test) kembalikan ke bank bawaan.
void clearSyncedMcqBanks() => _synced.clear();

McqQuestion _q(String id, String en, List<String> options) =>
    McqQuestion(question: {'id': id, 'en': en}, options: options, answer: 0);

/// Paket soal aktif untuk satu kursus ('ja'/'en'); kursus lain: kosong.
List<McqQuestion> mcqBankFor(String courseId) =>
    _synced[courseId] ?? mcqBundledFor(courseId);

/// Paket soal bawaan aplikasi (sumber unggahan admin ke Firestore).
List<McqQuestion> mcqBundledFor(String courseId) {
  switch (courseId) {
    case 'ja':
      return _jaQuestions;
    case 'en':
      return _enQuestions;
    default:
      return const [];
  }
}

// ---------------------------------------------------------------------------
// Jepang — kosakata dasar, angka, sapaan, partikel, dan kanji N5.
// ---------------------------------------------------------------------------
final List<McqQuestion> _jaQuestions = [
  // Kosakata: benda & alam.
  _q("Mana kata Jepang untuk 'air'?", "Which Japanese word means 'water'?",
      ['みず (mizu)', 'やま (yama)', 'かわ (kawa)', 'そら (sora)']),
  _q("Mana kata Jepang untuk 'gunung'?",
      "Which Japanese word means 'mountain'?",
      ['やま (yama)', 'みず (mizu)', 'き (ki)', 'うみ (umi)']),
  _q("Mana kata Jepang untuk 'sungai'?", "Which Japanese word means 'river'?",
      ['かわ (kawa)', 'そら (sora)', 'いし (ishi)', 'はな (hana)']),
  _q("Mana kata Jepang untuk 'langit'?", "Which Japanese word means 'sky'?",
      ['そら (sora)', 'ほし (hoshi)', 'あめ (ame)', 'くも (kumo)']),
  _q("Mana kata Jepang untuk 'kucing'?", "Which Japanese word means 'cat'?",
      ['ねこ (neko)', 'いぬ (inu)', 'とり (tori)', 'さかな (sakana)']),
  _q("Mana kata Jepang untuk 'anjing'?", "Which Japanese word means 'dog'?",
      ['いぬ (inu)', 'ねこ (neko)', 'うま (uma)', 'とり (tori)']),
  _q("Mana kata Jepang untuk 'buku'?", "Which Japanese word means 'book'?",
      ['ほん (hon)', 'ぺん (pen)', 'つくえ (tsukue)', 'いす (isu)']),
  _q("Mana kata Jepang untuk 'sekolah'?",
      "Which Japanese word means 'school'?",
      ['がっこう (gakkou)', 'いえ (ie)', 'えき (eki)', 'みせ (mise)']),
  _q("Mana kata Jepang untuk 'guru'?", "Which Japanese word means 'teacher'?",
      ['せんせい (sensei)', 'がくせい (gakusei)', 'ともだち (tomodachi)', 'いしゃ (isha)']),
  _q("Mana kata Jepang untuk 'teman'?", "Which Japanese word means 'friend'?",
      ['ともだち (tomodachi)', 'かぞく (kazoku)', 'せんせい (sensei)', 'こども (kodomo)']),
  // Kosakata: kata kerja.
  _q("Mana kata Jepang untuk 'makan'?", "Which Japanese word means 'to eat'?",
      ['たべる (taberu)', 'のむ (nomu)', 'みる (miru)', 'いく (iku)']),
  _q("Mana kata Jepang untuk 'minum'?",
      "Which Japanese word means 'to drink'?",
      ['のむ (nomu)', 'たべる (taberu)', 'ねる (neru)', 'くる (kuru)']),
  _q("Mana kata Jepang untuk 'pergi'?", "Which Japanese word means 'to go'?",
      ['いく (iku)', 'くる (kuru)', 'かえる (kaeru)', 'あるく (aruku)']),
  _q("Mana kata Jepang untuk 'melihat'?",
      "Which Japanese word means 'to see'?",
      ['みる (miru)', 'きく (kiku)', 'はなす (hanasu)', 'よむ (yomu)']),
  _q("Mana kata Jepang untuk 'membaca'?",
      "Which Japanese word means 'to read'?",
      ['よむ (yomu)', 'かく (kaku)', 'きく (kiku)', 'うたう (utau)']),
  // Kosakata: kata sifat.
  _q("Mana kata Jepang untuk 'besar'?", "Which Japanese word means 'big'?",
      ['おおきい (ookii)', 'ちいさい (chiisai)', 'たかい (takai)', 'やすい (yasui)']),
  _q("Mana kata Jepang untuk 'kecil'?", "Which Japanese word means 'small'?",
      ['ちいさい (chiisai)', 'おおきい (ookii)', 'ながい (nagai)', 'みじかい (mijikai)']),
  _q("Mana kata Jepang untuk 'mahal'?",
      "Which Japanese word means 'expensive'?",
      ['たかい (takai)', 'やすい (yasui)', 'ひくい (hikui)', 'ちかい (chikai)']),
  // Angka.
  _q("Berapa 'satu' dalam bahasa Jepang?", "What is 'one' in Japanese?",
      ['いち (ichi)', 'に (ni)', 'さん (san)', 'よん (yon)']),
  _q("Berapa 'tiga' dalam bahasa Jepang?", "What is 'three' in Japanese?",
      ['さん (san)', 'いち (ichi)', 'ご (go)', 'はち (hachi)']),
  _q("Berapa 'lima' dalam bahasa Jepang?", "What is 'five' in Japanese?",
      ['ご (go)', 'よん (yon)', 'ろく (roku)', 'なな (nana)']),
  _q("Berapa 'sepuluh' dalam bahasa Jepang?", "What is 'ten' in Japanese?",
      ['じゅう (juu)', 'きゅう (kyuu)', 'ひゃく (hyaku)', 'いち (ichi)']),
  _q("Berapa 'seratus' dalam bahasa Jepang?",
      "What is 'one hundred' in Japanese?",
      ['ひゃく (hyaku)', 'じゅう (juu)', 'せん (sen)', 'まん (man)']),
  // Sapaan.
  _q("Sapaan 'selamat pagi' dalam bahasa Jepang?",
      "How do you say 'good morning' in Japanese?",
      ['おはよう (ohayou)', 'こんにちは (konnichiwa)', 'こんばんは (konbanwa)', 'さようなら (sayounara)']),
  _q("Sapaan 'selamat siang' dalam bahasa Jepang?",
      "How do you say 'good afternoon' in Japanese?",
      ['こんにちは (konnichiwa)', 'おはよう (ohayou)', 'おやすみ (oyasumi)', 'ありがとう (arigatou)']),
  _q("Sapaan 'selamat malam' dalam bahasa Jepang?",
      "How do you say 'good evening' in Japanese?",
      ['こんばんは (konbanwa)', 'おはよう (ohayou)', 'こんにちは (konnichiwa)', 'すみません (sumimasen)']),
  _q("Bagaimana mengucapkan 'terima kasih'?", "How do you say 'thank you'?",
      ['ありがとう (arigatou)', 'すみません (sumimasen)', 'ごめんなさい (gomennasai)', 'おねがいします (onegaishimasu)']),
  _q("Bagaimana mengucapkan 'maaf'?", "How do you say 'sorry'?",
      ['ごめんなさい (gomennasai)', 'ありがとう (arigatou)', 'いただきます (itadakimasu)', 'おめでとう (omedetou)']),
  _q("Bagaimana mengucapkan 'selamat tinggal'?", "How do you say 'goodbye'?",
      ['さようなら (sayounara)', 'こんにちは (konnichiwa)', 'ただいま (tadaima)', 'おかえり (okaeri)']),
  _q("Ucapan sebelum tidur dalam bahasa Jepang?",
      "What do you say before going to sleep in Japanese?",
      ['おやすみなさい (oyasuminasai)', 'おはよう (ohayou)', 'いただきます (itadakimasu)', 'こんばんは (konbanwa)']),
  // Partikel.
  _q('Lengkapi: わたし ___ がくせいです。', 'Complete: わたし ___ がくせいです。',
      ['は (wa)', 'を (o)', 'へ (e)', 'で (de)']),
  _q('Lengkapi: ほん ___ よみます。', 'Complete: ほん ___ よみます。',
      ['を (o)', 'に (ni)', 'へ (e)', 'が (ga)']),
  _q('Lengkapi: がっこう ___ いきます。', 'Complete: がっこう ___ いきます。',
      ['に (ni)', 'を (o)','が (ga)', 'の (no)']),
  // Bacaan kanji.
  _q('Bagaimana bacaan kanji 「水」?', 'How do you read the kanji 「水」?',
      ['みず (mizu)', 'ひ (hi)', 'き (ki)', 'つち (tsuchi)']),
  _q('Bagaimana bacaan kanji 「日」?', 'How do you read the kanji 「日」?',
      ['ひ (hi)', 'つき (tsuki)', 'やま (yama)', 'かわ (kawa)']),
  _q('Bagaimana bacaan kanji 「山」?', 'How do you read the kanji 「山」?',
      ['やま (yama)', 'かわ (kawa)', 'いし (ishi)', 'そら (sora)']),
  _q('Bagaimana bacaan kanji 「人」?', 'How do you read the kanji 「人」?',
      ['ひと (hito)', 'くち (kuchi)', 'みみ (mimi)', 'あし (ashi)']),
  _q('Bagaimana bacaan kanji 「口」?', 'How do you read the kanji 「口」?',
      ['くち (kuchi)', 'め (me)', 'みみ (mimi)', 'て (te)']),
  _q('Bagaimana bacaan kanji 「目」?', 'How do you read the kanji 「目」?',
      ['め (me)', 'みみ (mimi)', 'くち (kuchi)', 'あたま (atama)']),
  // Kanji untuk arti.
  _q("Mana kanji untuk 'pohon'?", "Which kanji means 'tree'?",
      ['木', '水', '火', '土']),
  _q("Mana kanji untuk 'api'?", "Which kanji means 'fire'?",
      ['火', '水', '木', '金']),
  _q("Mana kanji untuk 'orang'?", "Which kanji means 'person'?",
      ['人', '入', '大', '子']),
  _q("Mana kanji untuk 'bulan'?", "Which kanji means 'moon'?",
      ['月', '日', '目', '白']),
  _q("Mana kanji untuk 'matahari / hari'?", "Which kanji means 'sun / day'?",
      ['日', '月', '白', '田']),
  _q("Mana kanji untuk 'gunung'?", "Which kanji means 'mountain'?",
      ['山', '川', '田', '石']),
  // Keluarga.
  _q("Mana kata Jepang untuk 'ibu' (ibu sendiri)?",
      "Which Japanese word means 'mother' (one's own)?",
      ['はは (haha)', 'ちち (chichi)', 'あね (ane)', 'あに (ani)']),
  _q("Mana kata Jepang untuk 'ayah' (ayah sendiri)?",
      "Which Japanese word means 'father' (one's own)?",
      ['ちち (chichi)', 'はは (haha)', 'おとうと (otouto)', 'いもうと (imouto)']),
  _q("Mana kata Jepang untuk 'kakak laki-laki' (kakak sendiri)?",
      "Which Japanese word means 'older brother' (one's own)?",
      ['あに (ani)', 'あね (ane)', 'おとうと (otouto)', 'いもうと (imouto)']),
  // Waktu.
  _q("Mana kata Jepang untuk 'sekarang'?", "Which Japanese word means 'now'?",
      ['いま (ima)', 'きょう (kyou)', 'あした (ashita)', 'きのう (kinou)']),
  _q("Mana kata Jepang untuk 'besok'?",
      "Which Japanese word means 'tomorrow'?",
      ['あした (ashita)', 'きのう (kinou)', 'きょう (kyou)', 'まいにち (mainichi)']),
  _q("Mana kata Jepang untuk 'kemarin'?",
      "Which Japanese word means 'yesterday'?",
      ['きのう (kinou)', 'あした (ashita)', 'いま (ima)', 'らいしゅう (raishuu)']),
  _q("Mana kata Jepang untuk 'hari ini'?",
      "Which Japanese word means 'today'?",
      ['きょう (kyou)', 'きのう (kinou)', 'あした (ashita)', 'まいあさ (maiasa)']),
  // Warna.
  _q("Mana kata Jepang untuk 'merah'?", "Which Japanese word means 'red'?",
      ['あかい (akai)', 'あおい (aoi)', 'しろい (shiroi)', 'くろい (kuroi)']),
  _q("Mana kata Jepang untuk 'putih'?", "Which Japanese word means 'white'?",
      ['しろい (shiroi)', 'くろい (kuroi)', 'あかい (akai)', 'きいろい (kiiroi)']),
  _q("Mana kata Jepang untuk 'biru'?", "Which Japanese word means 'blue'?",
      ['あおい (aoi)', 'あかい (akai)', 'みどり (midori)', 'しろい (shiroi)']),
  // Kata tanya.
  _q("Mana kata Jepang untuk 'apa'?", "Which Japanese word means 'what'?",
      ['なに (nani)', 'だれ (dare)', 'どこ (doko)', 'いつ (itsu)']),
  _q("Mana kata Jepang untuk 'siapa'?", "Which Japanese word means 'who'?",
      ['だれ (dare)', 'なに (nani)', 'どこ (doko)', 'どれ (dore)']),
  _q("Mana kata Jepang untuk 'di mana'?", "Which Japanese word means 'where'?",
      ['どこ (doko)', 'いつ (itsu)', 'だれ (dare)', 'なぜ (naze)']),
];

// ---------------------------------------------------------------------------
// Inggris — kosakata dasar, to be, bentuk lampau, jamak, dan tata bahasa.
// ---------------------------------------------------------------------------
final List<McqQuestion> _enQuestions = [
  // Kosakata: hewan & benda.
  _q("Apa bahasa Inggris dari 'kucing'?",
      "What is the English word for 'kucing'?",
      ['cat', 'dog', 'bird', 'fish']),
  _q("Apa bahasa Inggris dari 'anjing'?",
      "What is the English word for 'anjing'?",
      ['dog', 'cat', 'horse', 'cow']),
  _q("Apa bahasa Inggris dari 'burung'?",
      "What is the English word for 'burung'?",
      ['bird', 'fish', 'cat', 'mouse']),
  _q("Apa bahasa Inggris dari 'ikan'?",
      "What is the English word for 'ikan'?",
      ['fish', 'bird', 'meat', 'chicken']),
  _q("Apa bahasa Inggris dari 'buku'?",
      "What is the English word for 'buku'?",
      ['book', 'pen', 'bag', 'desk']),
  _q("Apa bahasa Inggris dari 'rumah'?",
      "What is the English word for 'rumah'?",
      ['house', 'school', 'office', 'store']),
  _q("Apa bahasa Inggris dari 'sekolah'?",
      "What is the English word for 'sekolah'?",
      ['school', 'house', 'hospital', 'market']),
  _q("Apa bahasa Inggris dari 'air'?",
      "What is the English word for 'air' (minuman)?",
      ['water', 'fire', 'milk', 'tea']),
  _q("Apa bahasa Inggris dari 'api'?",
      "What is the English word for 'api'?",
      ['fire', 'water', 'ice', 'wind']),
  _q("Apa bahasa Inggris dari 'matahari'?",
      "What is the English word for 'matahari'?",
      ['sun', 'moon', 'star', 'sky']),
  _q("Apa bahasa Inggris dari 'bulan' (benda langit)?",
      "What is the English word for 'bulan' (in the sky)?",
      ['moon', 'sun', 'star', 'cloud']),
  // Kosakata: kata kerja.
  _q("Apa bahasa Inggris dari 'makan'?",
      "What is the English word for 'makan'?",
      ['eat', 'drink', 'sleep', 'run']),
  _q("Apa bahasa Inggris dari 'minum'?",
      "What is the English word for 'minum'?",
      ['drink', 'eat', 'cook', 'wash']),
  _q("Apa bahasa Inggris dari 'tidur'?",
      "What is the English word for 'tidur'?",
      ['sleep', 'wake', 'sit', 'stand']),
  _q("Apa bahasa Inggris dari 'lari'?",
      "What is the English word for 'lari'?",
      ['run', 'walk', 'jump', 'swim']),
  _q("Apa bahasa Inggris dari 'membaca'?",
      "What is the English word for 'membaca'?",
      ['read', 'write', 'draw', 'sing']),
  _q("Apa bahasa Inggris dari 'menulis'?",
      "What is the English word for 'menulis'?",
      ['write', 'read', 'speak', 'listen']),
  // Kosakata: sifat & warna.
  _q("Apa bahasa Inggris dari 'besar'?",
      "What is the English word for 'besar'?",
      ['big', 'small', 'short', 'thin']),
  _q("Apa bahasa Inggris dari 'kecil'?",
      "What is the English word for 'kecil'?",
      ['small', 'big', 'long', 'wide']),
  _q("Apa bahasa Inggris dari 'merah'?",
      "What is the English word for 'merah'?",
      ['red', 'blue', 'green', 'black']),
  _q("Apa bahasa Inggris dari 'biru'?",
      "What is the English word for 'biru'?",
      ['blue', 'red', 'yellow', 'white']),
  _q("Apa bahasa Inggris dari 'hitam'?",
      "What is the English word for 'hitam'?",
      ['black', 'white', 'gray', 'brown']),
  _q("Apa bahasa Inggris dari 'putih'?",
      "What is the English word for 'putih'?",
      ['white', 'black', 'red', 'pink']),
  // To be & kala kini.
  _q('Lengkapi: I ___ a student.', 'Complete: I ___ a student.',
      ['am', 'is', 'are', 'be']),
  _q('Lengkapi: He ___ my brother.', 'Complete: He ___ my brother.',
      ['is', 'am', 'are', 'be']),
  _q('Lengkapi: We ___ happy.', 'Complete: We ___ happy.',
      ['are', 'is', 'am', 'be']),
  _q('Lengkapi: There ___ a cat under the chair.',
      'Complete: There ___ a cat under the chair.',
      ['is', 'are', 'am', 'be']),
  _q('Lengkapi: She ___ to school every day.',
      'Complete: She ___ to school every day.',
      ['goes', 'go', 'going', 'gone']),
  _q('Lengkapi: They ___ watching TV now.',
      'Complete: They ___ watching TV now.',
      ['are', 'is', 'am', 'be']),
  _q('Lengkapi: He ___ a car.', 'Complete: He ___ a car.',
      ['has', 'have', 'having', 'haves']),
  // Bentuk lampau.
  _q("Bentuk lampau dari 'go' adalah …", "The past form of 'go' is …",
      ['went', 'goed', 'gone', 'goes']),
  _q("Bentuk lampau dari 'eat' adalah …", "The past form of 'eat' is …",
      ['ate', 'eated', 'eaten', 'eats']),
  _q("Bentuk lampau dari 'see' adalah …", "The past form of 'see' is …",
      ['saw', 'seed', 'seen', 'sees']),
  _q("Bentuk lampau dari 'buy' adalah …", "The past form of 'buy' is …",
      ['bought', 'buyed', 'brought', 'buys']),
  _q("Bentuk lampau dari 'take' adalah …", "The past form of 'take' is …",
      ['took', 'taked', 'taken', 'takes']),
  _q("Bentuk lampau dari 'make' adalah …", "The past form of 'make' is …",
      ['made', 'maked', 'maken', 'makes']),
  // Bentuk jamak.
  _q("Bentuk jamak dari 'child' adalah …", "The plural of 'child' is …",
      ['children', 'childs', 'childes', 'childrens']),
  _q("Bentuk jamak dari 'man' adalah …", "The plural of 'man' is …",
      ['men', 'mans', 'manes', 'mens']),
  _q("Bentuk jamak dari 'foot' adalah …", "The plural of 'foot' is …",
      ['feet', 'foots', 'feets', 'footes']),
  _q("Bentuk jamak dari 'mouse' adalah …", "The plural of 'mouse' is …",
      ['mice', 'mouses', 'mices', 'mousees']),
  _q("Bentuk jamak dari 'box' adalah …", "The plural of 'box' is …",
      ['boxes', 'boxs', 'boxies', 'boxen']),
  // Perbandingan.
  _q("Bentuk perbandingan dari 'good' adalah …",
      "The comparative form of 'good' is …",
      ['better', 'gooder', 'more good', 'goodest']),
  _q("Bentuk perbandingan dari 'big' adalah …",
      "The comparative form of 'big' is …",
      ['bigger', 'more big', 'biggest', 'most big']),
  _q('Lengkapi: She is the ___ student in the class.',
      'Complete: She is the ___ student in the class.',
      ['best', 'better', 'good', 'most good']),
  // Preposisi.
  _q('Lengkapi: I was born ___ 1990.', 'Complete: I was born ___ 1990.',
      ['in', 'on', 'at', 'by']),
  _q('Lengkapi: The meeting is ___ Monday.',
      'Complete: The meeting is ___ Monday.',
      ['on', 'in', 'at', 'by']),
  _q('Lengkapi: She is good ___ math.', 'Complete: She is good ___ math.',
      ['at', 'on', 'in', 'by']),
  // Kata tanya.
  _q('Lengkapi: ___ is your name?', 'Complete: ___ is your name?',
      ['What', 'Who', 'Where', 'When']),
  _q('Lengkapi: ___ do you live?', 'Complete: ___ do you live?',
      ['Where', 'What', 'Who', 'Why']),
  _q('Lengkapi: ___ old are you?', 'Complete: ___ old are you?',
      ['How', 'What', 'Who', 'Where']),
  // Artikel & kata ganti.
  _q('Lengkapi: She is ___ honest person.',
      'Complete: She is ___ honest person.',
      ['an', 'a', 'am', 'in']),
  _q('Lengkapi: This is my book. It is ___.',
      'Complete: This is my book. It is ___.',
      ['mine', 'my', 'me', 'I']),
  _q("Lengkapi: ___ is my sister. Her name is Rina.",
      'Complete: ___ is my sister. Her name is Rina.',
      ['She', 'He', 'It', 'They']),
  // Lawan kata.
  _q("Lawan kata 'hot' adalah …", "The opposite of 'hot' is …",
      ['cold', 'tall', 'fast', 'red']),
  _q("Lawan kata 'big' adalah …", "The opposite of 'big' is …",
      ['small', 'long', 'high', 'far']),
];
