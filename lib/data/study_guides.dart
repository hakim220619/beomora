import '../models/guide.dart';

/// Konten Materi Belajar per kursus. Teks penjelasan tersedia dalam
/// bahasa UI 'id' dan 'en'.
List<KanaItem> _kana(String s) => s
    .trim()
    .split(RegExp(r'\s+'))
    .map((e) {
      final i = e.indexOf(':');
      return KanaItem(e.substring(0, i), e.substring(i + 1));
    })
    .toList();

final Map<String, List<GuideTopic>> kStudyGuides = {
  'ja': _japanese,
  'en': _english,
  'id': _indonesian,
};

// ===================== BAHASA JEPANG =====================

final List<GuideTopic> _japanese = [
  GuideTopic(
    id: 'hiragana',
    emoji: 'あ',
    title: const {'id': 'Hiragana', 'en': 'Hiragana'},
    subtitle: const {
      'id': '71 huruf dasar + tambahan, ketuk untuk dengar',
      'en': '71 base + extended characters, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {
          'id': 'Gojūon (46 huruf dasar)',
          'en': 'Gojūon (46 base characters)',
        },
        body: const {
          'id':
              'Hiragana dipakai untuk kata asli Jepang dan partikel. Hafalkan baris demi baris: a-i-u-e-o.',
          'en':
              'Hiragana is used for native Japanese words and particles. Memorize it row by row: a-i-u-e-o.',
        },
        kana: _kana(
            'あ:a い:i う:u え:e お:o か:ka き:ki く:ku け:ke こ:ko '
            'さ:sa し:shi す:su せ:se そ:so た:ta ち:chi つ:tsu て:te と:to '
            'な:na に:ni ぬ:nu ね:ne の:no は:ha ひ:hi ふ:fu へ:he ほ:ho '
            'ま:ma み:mi む:mu め:me も:mo や:ya ゆ:yu よ:yo '
            'ら:ra り:ri る:ru れ:re ろ:ro わ:wa を:wo ん:n'),
      ),
      GuideSection(
        title: const {
          'id': 'Dakuten & Handakuten (゛dan ゜)',
          'en': 'Dakuten & Handakuten (゛and ゜)',
        },
        body: const {
          'id':
              'Tanda ゛mengubah bunyi: k→g, s→z, t→d, h→b. Tanda ゜mengubah h→p.',
          'en':
              'The ゛mark voices the sound: k→g, s→z, t→d, h→b. The ゜mark turns h→p.',
        },
        kana: _kana(
            'が:ga ぎ:gi ぐ:gu げ:ge ご:go ざ:za じ:ji ず:zu ぜ:ze ぞ:zo '
            'だ:da ぢ:ji づ:zu で:de ど:do ば:ba び:bi ぶ:bu べ:be ぼ:bo '
            'ぱ:pa ぴ:pi ぷ:pu ぺ:pe ぽ:po'),
      ),
      GuideSection(
        title: const {
          'id': 'Yōon (bunyi gabungan)',
          'en': 'Yōon (combined sounds)',
        },
        body: const {
          'id': 'Huruf kecil ゃゅょ digabung dengan huruf baris -i.',
          'en': 'Small ゃゅょ combine with characters from the -i row.',
        },
        kana: _kana(
            'きゃ:kya きゅ:kyu きょ:kyo しゃ:sha しゅ:shu しょ:sho '
            'ちゃ:cha ちゅ:chu ちょ:cho にゃ:nya にゅ:nyu にょ:nyo '
            'ひゃ:hya ひゅ:hyu ひょ:hyo みゃ:mya みゅ:myu みょ:myo '
            'りゃ:rya りゅ:ryu りょ:ryo ぎゃ:gya ぎゅ:gyu ぎょ:gyo '
            'じゃ:ja じゅ:ju じょ:jo びゃ:bya びゅ:byu びょ:byo '
            'ぴゃ:pya ぴゅ:pyu ぴょ:pyo'),
      ),
    ],
  ),
  GuideTopic(
    id: 'katakana',
    emoji: 'ア',
    title: const {'id': 'Katakana', 'en': 'Katakana'},
    subtitle: const {
      'id': 'Untuk kata serapan asing, ketuk untuk dengar',
      'en': 'For foreign loanwords, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {
          'id': 'Gojūon (46 huruf dasar)',
          'en': 'Gojūon (46 base characters)',
        },
        body: const {
          'id':
              'Katakana dipakai untuk kata serapan (コーヒー = kopi), nama asing, dan penekanan.',
          'en':
              'Katakana is used for loanwords (コーヒー = coffee), foreign names, and emphasis.',
        },
        kana: _kana(
            'ア:a イ:i ウ:u エ:e オ:o カ:ka キ:ki ク:ku ケ:ke コ:ko '
            'サ:sa シ:shi ス:su セ:se ソ:so タ:ta チ:chi ツ:tsu テ:te ト:to '
            'ナ:na ニ:ni ヌ:nu ネ:ne ノ:no ハ:ha ヒ:hi フ:fu ヘ:he ホ:ho '
            'マ:ma ミ:mi ム:mu メ:me モ:mo ヤ:ya ユ:yu ヨ:yo '
            'ラ:ra リ:ri ル:ru レ:re ロ:ro ワ:wa ヲ:wo ン:n'),
      ),
      GuideSection(
        title: const {
          'id': 'Dakuten & Handakuten',
          'en': 'Dakuten & Handakuten',
        },
        kana: _kana(
            'ガ:ga ギ:gi グ:gu ゲ:ge ゴ:go ザ:za ジ:ji ズ:zu ゼ:ze ゾ:zo '
            'ダ:da ヂ:ji ヅ:zu デ:de ド:do バ:ba ビ:bi ブ:bu ベ:be ボ:bo '
            'パ:pa ピ:pi プ:pu ペ:pe ポ:po'),
      ),
      GuideSection(
        title: const {
          'id': 'Yōon (bunyi gabungan)',
          'en': 'Yōon (combined sounds)',
        },
        kana: _kana(
            'キャ:kya キュ:kyu キョ:kyo シャ:sha シュ:shu ショ:sho '
            'チャ:cha チュ:chu チョ:cho ニャ:nya ニュ:nyu ニョ:nyo '
            'ヒャ:hya ヒュ:hyu ヒョ:hyo ミャ:mya ミュ:myu ミョ:myo '
            'リャ:rya リュ:ryu リョ:ryo ギャ:gya ギュ:gyu ギョ:gyo '
            'ジャ:ja ジュ:ju ジョ:jo ビャ:bya ビュ:byu ビョ:byo '
            'ピャ:pya ピュ:pyu ピョ:pyo'),
      ),
      GuideSection(
        title: const {
          'id': 'Contoh kata serapan',
          'en': 'Loanword examples',
        },
        examples: const [
          GuideExample('コーヒー', {'id': 'kopi', 'en': 'coffee'},
              romaji: 'koohii'),
          GuideExample('テレビ', {'id': 'televisi', 'en': 'television'},
              romaji: 'terebi'),
          GuideExample('インドネシア', {'id': 'Indonesia', 'en': 'Indonesia'},
              romaji: 'indoneshia'),
          GuideExample('パン', {'id': 'roti', 'en': 'bread'}, romaji: 'pan'),
          GuideExample('タクシー', {'id': 'taksi', 'en': 'taxi'},
              romaji: 'takushii'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'ja_particles',
    emoji: '🔗',
    title: const {'id': 'Partikel Dasar', 'en': 'Basic Particles'},
    subtitle: const {
      'id': 'は・を・に・で・の・か — lem perekat kalimat Jepang',
      'en': 'は・を・に・で・の・か — the glue of Japanese sentences',
    },
    sections: [
      GuideSection(
        title: const {'id': 'は (wa) — penanda topik', 'en': 'は (wa) — topic marker'},
        body: const {
          'id': 'Menandai topik kalimat. Ditulis は tapi dibaca "wa".',
          'en': 'Marks the topic of the sentence. Written は but read "wa".',
        },
        examples: const [
          GuideExample('わたし は がくせい です',
              {'id': 'Saya (adalah) pelajar', 'en': 'I am a student'},
              romaji: 'watashi wa gakusei desu'),
        ],
      ),
      GuideSection(
        title: const {'id': 'を (o) — penanda objek', 'en': 'を (o) — object marker'},
        body: const {
          'id': 'Menandai objek yang dikenai kata kerja.',
          'en': 'Marks the object that the verb acts on.',
        },
        examples: const [
          GuideExample('ごはん を たべます',
              {'id': 'Saya makan nasi', 'en': 'I eat rice'},
              romaji: 'gohan o tabemasu'),
        ],
      ),
      GuideSection(
        title: const {'id': 'に (ni) — arah / waktu', 'en': 'に (ni) — direction / time'},
        body: const {
          'id': 'Menunjukkan tujuan gerakan atau titik waktu.',
          'en': 'Shows the destination of movement or a point in time.',
        },
        examples: const [
          GuideExample('がっこう に いきます',
              {'id': 'Saya pergi ke sekolah', 'en': 'I go to school'},
              romaji: 'gakkou ni ikimasu'),
        ],
      ),
      GuideSection(
        title: const {'id': 'で (de) — tempat kegiatan', 'en': 'で (de) — place of action'},
        body: const {
          'id': 'Menunjukkan di mana suatu kegiatan dilakukan.',
          'en': 'Shows where an action takes place.',
        },
        examples: const [
          GuideExample('いえ で べんきょう します',
              {'id': 'Saya belajar di rumah', 'en': 'I study at home'},
              romaji: 'ie de benkyou shimasu'),
        ],
      ),
      GuideSection(
        title: const {'id': 'の (no) — kepemilikan', 'en': 'の (no) — possession'},
        body: const {
          'id': 'Seperti "milik/-nya": A の B = B milik A.',
          'en': 'Like "of/\'s": A の B = A\'s B.',
        },
        examples: const [
          GuideExample('わたし の ほん',
              {'id': 'Buku saya', 'en': 'My book'},
              romaji: 'watashi no hon'),
        ],
      ),
      GuideSection(
        title: const {'id': 'か (ka) — kalimat tanya', 'en': 'か (ka) — question marker'},
        body: const {
          'id': 'Ditaruh di akhir kalimat untuk membuat pertanyaan.',
          'en': 'Placed at the end of a sentence to form a question.',
        },
        examples: const [
          GuideExample('あなた は せんせい です か',
              {'id': 'Apakah kamu guru?', 'en': 'Are you a teacher?'},
              romaji: 'anata wa sensei desu ka'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'ja_patterns',
    emoji: '🧱',
    title: const {'id': 'Pola Kalimat Dasar', 'en': 'Basic Sentence Patterns'},
    subtitle: const {
      'id': 'です・ます — fondasi kalimat sopan',
      'en': 'です・ます — the foundation of polite sentences',
    },
    sections: [
      GuideSection(
        title: const {'id': 'A は B です', 'en': 'A は B です'},
        body: const {
          'id':
              'Pola paling dasar: "A adalah B". です membuat kalimat menjadi sopan.',
          'en':
              'The most basic pattern: "A is B". です makes the sentence polite.',
        },
        examples: const [
          GuideExample('これ は ほん です',
              {'id': 'Ini (adalah) buku', 'en': 'This is a book'},
              romaji: 'kore wa hon desu'),
          GuideExample('はは は せんせい です',
              {'id': 'Ibu saya seorang guru', 'en': 'My mother is a teacher'},
              romaji: 'haha wa sensei desu'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Kata kerja bentuk ます', 'en': 'ます verb form'},
        body: const {
          'id':
              'Bentuk sopan kata kerja. Negatifnya ません, lampau ました.',
          'en':
              'The polite verb form. Negative is ません, past tense is ました.',
        },
        examples: const [
          GuideExample('たべます',
              {'id': 'makan (sopan)', 'en': 'eat (polite)'},
              romaji: 'tabemasu'),
          GuideExample('たべません',
              {'id': 'tidak makan', 'en': 'do not eat'},
              romaji: 'tabemasen'),
          GuideExample('たべました',
              {'id': 'sudah makan (lampau)', 'en': 'ate (past)'},
              romaji: 'tabemashita'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Menunjuk benda: これ・それ・あれ', 'en': 'Pointing: これ・それ・あれ'},
        body: const {
          'id':
              'これ = ini (dekat pembicara), それ = itu (dekat lawan bicara), あれ = itu (jauh dari keduanya).',
          'en':
              'これ = this (near speaker), それ = that (near listener), あれ = that over there (far from both).',
        },
        examples: const [
          GuideExample('それ は なん です か',
              {'id': 'Itu apa?', 'en': 'What is that?'},
              romaji: 'sore wa nan desu ka'),
        ],
      ),
    ],
  ),
];

// ===================== BAHASA INGGRIS =====================

final List<GuideTopic> _english = [
  GuideTopic(
    id: 'en_tobe',
    emoji: '🧩',
    title: const {'id': 'To Be (am, is, are)', 'en': 'To Be (am, is, are)'},
    subtitle: const {
      'id': 'Kata kerja paling penting dalam bahasa Inggris',
      'en': 'The most important verb in English',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Aturan dasar', 'en': 'Basic rules'},
        body: const {
          'id':
              'I → am · he/she/it → is · you/we/they → are. Dipakai untuk identitas, sifat, dan lokasi.',
          'en':
              'I → am · he/she/it → is · you/we/they → are. Used for identity, qualities, and location.',
        },
        examples: const [
          GuideExample('I am a student',
              {'id': 'Saya seorang pelajar', 'en': 'I am a student'}),
          GuideExample('She is my teacher',
              {'id': 'Dia guru saya', 'en': 'She is my teacher'}),
          GuideExample('They are hungry',
              {'id': 'Mereka lapar', 'en': 'They are hungry'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'Negatif & tanya', 'en': 'Negative & questions'},
        body: const {
          'id':
              'Negatif: tambah "not" (is not / isn\'t). Tanya: tukar posisi — Are you...? Is she...?',
          'en':
              'Negative: add "not" (is not / isn\'t). Question: swap the order — Are you...? Is she...?',
        },
        examples: const [
          GuideExample('He is not at home',
              {'id': 'Dia tidak di rumah', 'en': 'He is not at home'}),
          GuideExample('Are you thirsty?',
              {'id': 'Apakah kamu haus?', 'en': 'Are you thirsty?'}),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'en_pronouns',
    emoji: '🙋',
    title: const {'id': 'Kata Ganti (Pronouns)', 'en': 'Pronouns'},
    subtitle: const {
      'id': 'I, you, he, she... dan kepemilikannya',
      'en': 'I, you, he, she... and their possessives',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Subjek & kepemilikan', 'en': 'Subject & possessive'},
        body: const {
          'id':
              'I→my, you→your, he→his, she→her, it→its, we→our, they→their.',
          'en':
              'I→my, you→your, he→his, she→her, it→its, we→our, they→their.',
        },
        examples: const [
          GuideExample('My name is Dani',
              {'id': 'Nama saya Dani', 'en': 'My name is Dani'}),
          GuideExample('Her house is big',
              {'id': 'Rumahnya (pr) besar', 'en': 'Her house is big'}),
          GuideExample('Our teacher is kind',
              {'id': 'Guru kami baik hati', 'en': 'Our teacher is kind'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'Objek', 'en': 'Object form'},
        body: const {
          'id': 'me, you, him, her, it, us, them — dipakai setelah kata kerja.',
          'en': 'me, you, him, her, it, us, them — used after a verb.',
        },
        examples: const [
          GuideExample('She helps me',
              {'id': 'Dia membantu saya', 'en': 'She helps me'}),
          GuideExample('I love them',
              {'id': 'Saya menyayangi mereka', 'en': 'I love them'}),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'en_present',
    emoji: '⏰',
    title: const {'id': 'Simple Present', 'en': 'Simple Present'},
    subtitle: const {
      'id': 'Kebiasaan & fakta sehari-hari',
      'en': 'Habits & everyday facts',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Aturan dasar', 'en': 'Basic rules'},
        body: const {
          'id':
              'Untuk kebiasaan dan fakta. Tambah -s/-es untuk he/she/it: I eat → she eats.',
          'en':
              'For habits and facts. Add -s/-es for he/she/it: I eat → she eats.',
        },
        examples: const [
          GuideExample('I study every day',
              {'id': 'Saya belajar setiap hari', 'en': 'I study every day'}),
          GuideExample('He works at night',
              {'id': 'Dia bekerja di malam hari', 'en': 'He works at night'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'Negatif & tanya: do/does', 'en': 'Negative & questions: do/does'},
        body: const {
          'id':
              'Negatif: don\'t / doesn\'t + kata kerja dasar. Tanya: Do/Does di depan.',
          'en':
              'Negative: don\'t / doesn\'t + base verb. Question: Do/Does at the front.',
        },
        examples: const [
          GuideExample('She does not eat fish',
              {'id': 'Dia tidak makan ikan', 'en': 'She does not eat fish'}),
          GuideExample('Do you speak English?',
              {'id': 'Apakah kamu berbicara bahasa Inggris?', 'en': 'Do you speak English?'}),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'en_past',
    emoji: '⏪',
    title: const {'id': 'Simple Past', 'en': 'Simple Past'},
    subtitle: const {
      'id': 'Kejadian yang sudah selesai',
      'en': 'Finished events',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Kata kerja beraturan (-ed)', 'en': 'Regular verbs (-ed)'},
        body: const {
          'id': 'Tambahkan -ed: work→worked, study→studied, walk→walked.',
          'en': 'Add -ed: work→worked, study→studied, walk→walked.',
        },
        examples: const [
          GuideExample('I worked yesterday',
              {'id': 'Saya bekerja kemarin', 'en': 'I worked yesterday'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'Kata kerja tak beraturan', 'en': 'Irregular verbs'},
        body: const {
          'id':
              'Harus dihafal: go→went, eat→ate, have→had, come→came, see→saw, sleep→slept, read→read, write→wrote.',
          'en':
              'Must be memorized: go→went, eat→ate, have→had, come→came, see→saw, sleep→slept, read→read, write→wrote.',
        },
        examples: const [
          GuideExample('We went to school',
              {'id': 'Kami pergi ke sekolah', 'en': 'We went to school'}),
          GuideExample('She ate breakfast',
              {'id': 'Dia sudah sarapan', 'en': 'She ate breakfast'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'Negatif & tanya: did', 'en': 'Negative & questions: did'},
        body: const {
          'id': 'didn\'t + kata kerja dasar. Tanya: Did you...?',
          'en': 'didn\'t + base verb. Question: Did you...?',
        },
        examples: const [
          GuideExample('I did not sleep well',
              {'id': 'Saya tidak tidur nyenyak', 'en': 'I did not sleep well'}),
          GuideExample('Did you eat?',
              {'id': 'Apakah kamu sudah makan?', 'en': 'Did you eat?'}),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'en_articles',
    emoji: '🔤',
    title: const {'id': 'Articles: a, an, the', 'en': 'Articles: a, an, the'},
    subtitle: const {
      'id': 'Kapan pakai a, an, atau the',
      'en': 'When to use a, an, or the',
    },
    sections: [
      GuideSection(
        title: const {'id': 'a / an — tidak spesifik', 'en': 'a / an — non-specific'},
        body: const {
          'id':
              '"a" sebelum bunyi konsonan (a book), "an" sebelum bunyi vokal (an apple). Hanya untuk benda tunggal.',
          'en':
              '"a" before consonant sounds (a book), "an" before vowel sounds (an apple). Singular nouns only.',
        },
        examples: const [
          GuideExample('I have a cat',
              {'id': 'Saya punya seekor kucing', 'en': 'I have a cat'}),
          GuideExample('She eats an egg',
              {'id': 'Dia makan sebutir telur', 'en': 'She eats an egg'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'the — spesifik', 'en': 'the — specific'},
        body: const {
          'id':
              'Dipakai ketika pembicara dan pendengar tahu benda yang dimaksud.',
          'en':
              'Used when both speaker and listener know which thing is meant.',
        },
        examples: const [
          GuideExample('Open the door, please',
              {'id': 'Tolong buka pintunya', 'en': 'Open the door, please'}),
          GuideExample('The apple is red',
              {'id': 'Apel itu merah', 'en': 'The apple is red'}),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'en_questions',
    emoji: '❓',
    title: const {'id': 'Kata Tanya (5W1H)', 'en': 'Question Words (5W1H)'},
    subtitle: const {
      'id': 'what, where, when, who, why, how',
      'en': 'what, where, when, who, why, how',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Enam kata tanya utama', 'en': 'The six main question words'},
        body: const {
          'id':
              'what = apa · where = di mana · when = kapan · who = siapa · why = mengapa · how = bagaimana.',
          'en':
              'what · where · when · who · why · how — the essential question starters.',
        },
        examples: const [
          GuideExample('What is your name?',
              {'id': 'Siapa namamu?', 'en': 'What is your name?'}),
          GuideExample('Where do you live?',
              {'id': 'Di mana kamu tinggal?', 'en': 'Where do you live?'}),
          GuideExample('When do you study?',
              {'id': 'Kapan kamu belajar?', 'en': 'When do you study?'}),
          GuideExample('Who is she?',
              {'id': 'Siapa dia?', 'en': 'Who is she?'}),
          GuideExample('Why are you late?',
              {'id': 'Mengapa kamu terlambat?', 'en': 'Why are you late?'}),
          GuideExample('How are you?',
              {'id': 'Apa kabar?', 'en': 'How are you?'}),
        ],
      ),
    ],
  ),
];

// ===================== BAHASA INDONESIA =====================

final List<GuideTopic> _indonesian = [
  GuideTopic(
    id: 'id_pronouns',
    emoji: '🙋',
    title: const {'id': 'Kata Ganti Orang', 'en': 'Personal Pronouns'},
    subtitle: const {
      'id': 'saya, kamu, dia, kami, kita, mereka',
      'en': 'saya, kamu, dia, kami, kita, mereka',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Kata ganti dasar', 'en': 'Basic pronouns'},
        body: const {
          'id':
              'saya (formal) / aku (akrab) = I · kamu = you · dia = he/she · kami = we (tanpa lawan bicara) · kita = we (dengan lawan bicara) · mereka = they.',
          'en':
              'saya (formal) / aku (casual) = I · kamu = you · dia = he/she · kami = we (excluding you) · kita = we (including you) · mereka = they.',
        },
        examples: const [
          GuideExample('Saya seorang murid',
              {'id': 'I am a student', 'en': 'I am a student'}),
          GuideExample('Mereka teman saya',
              {'id': 'They are my friends', 'en': 'They are my friends'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'Kepemilikan', 'en': 'Possession'},
        body: const {
          'id':
              'Taruh kata ganti SETELAH benda: buku saya = my book, rumah mereka = their house.',
          'en':
              'Put the pronoun AFTER the noun: buku saya = my book, rumah mereka = their house.',
        },
        examples: const [
          GuideExample('Nama saya Emma',
              {'id': 'My name is Emma', 'en': 'My name is Emma'}),
          GuideExample('Ibu kami guru',
              {'id': 'Our mother is a teacher', 'en': 'Our mother is a teacher'}),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'id_order',
    emoji: '🧱',
    title: const {'id': 'Urutan Kata', 'en': 'Word Order'},
    subtitle: const {
      'id': 'SVO tanpa perubahan kata kerja',
      'en': 'SVO with no verb conjugation',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Subjek–Kata kerja–Objek', 'en': 'Subject–Verb–Object'},
        body: const {
          'id':
              'Sama seperti bahasa Inggris: Saya makan nasi. Kata kerja TIDAK berubah bentuk untuk siapa pun.',
          'en':
              'Same as English: Saya makan nasi (I eat rice). Verbs NEVER change form for any subject.',
        },
        examples: const [
          GuideExample('Saya makan nasi',
              {'id': 'I eat rice', 'en': 'I eat rice'}),
          GuideExample('Mereka makan nasi',
              {'id': 'They eat rice', 'en': 'They eat rice'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'Waktu: sudah, sedang, akan', 'en': 'Time: sudah, sedang, akan'},
        body: const {
          'id':
              'Tidak ada tenses! Cukup tambahkan: sudah (past), sedang (sedang berlangsung), akan (future).',
          'en':
              'There are no tenses! Just add: sudah (already/past), sedang (in progress), akan (will/future).',
        },
        examples: const [
          GuideExample('Saya sudah makan',
              {'id': 'I have eaten', 'en': 'I have eaten'}),
          GuideExample('Dia sedang belajar',
              {'id': 'She is studying', 'en': 'She is studying'}),
          GuideExample('Kami akan pergi',
              {'id': 'We will go', 'en': 'We will go'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'Kata sifat setelah benda', 'en': 'Adjectives after nouns'},
        body: const {
          'id': 'rumah besar = (a) big house — sifat menyusul bendanya.',
          'en': 'rumah besar = big house — the adjective follows the noun.',
        },
        examples: const [
          GuideExample('Apel merah',
              {'id': 'Red apple', 'en': 'Red apple'}),
          GuideExample('Rumah saya besar',
              {'id': 'My house is big', 'en': 'My house is big'}),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'id_plural',
    emoji: '🔁',
    title: const {'id': 'Bentuk Jamak', 'en': 'Plurals'},
    subtitle: const {
      'id': 'Pengulangan kata: buku-buku',
      'en': 'Word reduplication: buku-buku',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Pengulangan', 'en': 'Reduplication'},
        body: const {
          'id':
              'Jamak dibuat dengan mengulang kata: buku-buku = books, anak-anak = children. Sering juga cukup dari konteks: dua buku (bukan dua buku-buku!).',
          'en':
              'Plurals repeat the word: buku-buku = books, anak-anak = children. Often context is enough: dua buku = two books (never dua buku-buku!).',
        },
        examples: const [
          GuideExample('Anak-anak sedang belajar',
              {'id': 'The children are studying', 'en': 'The children are studying'}),
          GuideExample('Saya punya dua teman',
              {'id': 'I have two friends', 'en': 'I have two friends'}),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'id_affixes',
    emoji: '🧬',
    title: const {'id': 'Imbuhan ber- & me-', 'en': 'Prefixes ber- & me-'},
    subtitle: const {
      'id': 'Awalan pembentuk kata kerja',
      'en': 'Verb-forming prefixes',
    },
    sections: [
      GuideSection(
        title: const {'id': 'ber- : melakukan / memiliki', 'en': 'ber- : doing / having'},
        body: const {
          'id':
              'ber + jalan = berjalan (to walk), ber + bicara = berbicara (to speak), ber + lari = berlari (to run).',
          'en':
              'ber + jalan = berjalan (to walk), ber + bicara = berbicara (to speak), ber + lari = berlari (to run).',
        },
        examples: const [
          GuideExample('Dia berjalan ke sekolah',
              {'id': 'He walks to school', 'en': 'He walks to school'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'me- : kata kerja aktif', 'en': 'me- : active verbs'},
        body: const {
          'id':
              'me + baca = membaca (to read), me + tulis = menulis (to write). Bentuk dasarnya sering tetap dipahami dalam percakapan santai (baca, tulis).',
          'en':
              'me + baca = membaca (to read), me + tulis = menulis (to write). The bare root is also common in casual speech (baca, tulis).',
        },
        examples: const [
          GuideExample('Saya membaca buku',
              {'id': 'I read a book', 'en': 'I read a book'}),
          GuideExample('Dia menulis surat',
              {'id': 'She writes a letter', 'en': 'She writes a letter'}),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'id_questions',
    emoji: '❓',
    title: const {'id': 'Kata Tanya', 'en': 'Question Words'},
    subtitle: const {
      'id': 'apa, siapa, di mana, kapan, mengapa, bagaimana, berapa',
      'en': 'apa, siapa, di mana, kapan, mengapa, bagaimana, berapa',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Tujuh kata tanya', 'en': 'The seven question words'},
        body: const {
          'id':
              'apa = what · siapa = who · di mana = where · kapan = when · mengapa/kenapa = why · bagaimana = how · berapa = how many/much.',
          'en':
              'apa = what · siapa = who · di mana = where · kapan = when · mengapa/kenapa = why · bagaimana = how · berapa = how many/much.',
        },
        examples: const [
          GuideExample('Siapa namamu?',
              {'id': 'What is your name?', 'en': 'What is your name?'}),
          GuideExample('Di mana kamu tinggal?',
              {'id': 'Where do you live?', 'en': 'Where do you live?'}),
          GuideExample('Berapa harganya?',
              {'id': 'How much is it?', 'en': 'How much is it?'}),
        ],
      ),
    ],
  ),
];
