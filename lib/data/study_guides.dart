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
  'ko': _korean,
  'de': _german,
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
  GuideTopic(
    id: 'vocab_farming',
    emoji: '🌾',
    title: const {'id': 'Pertanian', 'en': 'Farming'},
    subtitle: const {
      'id': '18 kosakata + contoh kalimat, ketuk untuk dengar',
      'en': '18 words + example sentences, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Di Sawah & Ladang', 'en': 'Fields & Paddies'},
        examples: const [
          GuideExample('はたけ', {'id': 'ladang', 'en': 'field (farm)'}, romaji: 'hatake'),
          GuideExample('たんぼ', {'id': 'sawah', 'en': 'rice paddy'}, romaji: 'tanbo'),
          GuideExample('のうぎょう', {'id': 'pertanian', 'en': 'agriculture'}, romaji: 'nougyou'),
          GuideExample('こめ', {'id': 'beras', 'en': 'rice (uncooked)'}, romaji: 'kome'),
          GuideExample('むぎ', {'id': 'gandum', 'en': 'wheat / barley'}, romaji: 'mugi'),
          GuideExample('たね', {'id': 'benih', 'en': 'seed'}, romaji: 'tane'),
          GuideExample('のうか は はたけ で はたらきます', {'id': 'Petani bekerja di ladang', 'en': 'Farmers work in the fields'}, romaji: 'nouka wa hatake de hatarakimasu'),
          GuideExample('たんぼ に みず を いれます', {'id': 'Mengairi sawah', 'en': 'I put water into the rice paddy'}, romaji: 'tanbo ni mizu o iremasu'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Menanam', 'en': 'Growing Crops'},
        examples: const [
          GuideExample('うえる', {'id': 'menanam', 'en': 'to plant'}, romaji: 'ueru'),
          GuideExample('そだてる', {'id': 'merawat; membesarkan', 'en': 'to grow / raise'}, romaji: 'sodateru'),
          GuideExample('しゅうかく', {'id': 'panen', 'en': 'harvest'}, romaji: 'shuukaku'),
          GuideExample('みのる', {'id': 'berbuah', 'en': 'to bear fruit'}, romaji: 'minoru'),
          GuideExample('つち', {'id': 'tanah', 'en': 'soil'}, romaji: 'tsuchi'),
          GuideExample('ひりょう', {'id': 'pupuk', 'en': 'fertilizer'}, romaji: 'hiryou'),
          GuideExample('やさい を そだてます', {'id': 'Saya menanam sayuran', 'en': 'I grow vegetables'}, romaji: 'yasai o sodatemasu'),
          GuideExample('あき に しゅうかく します', {'id': 'Panen di musim gugur', 'en': 'We harvest in autumn'}, romaji: 'aki ni shuukaku shimasu'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Peternakan', 'en': 'Livestock'},
        examples: const [
          GuideExample('ぼくじょう', {'id': 'peternakan', 'en': 'ranch / farm'}, romaji: 'bokujou'),
          GuideExample('にわとり', {'id': 'ayam', 'en': 'chicken'}, romaji: 'niwatori'),
          GuideExample('ひつじ', {'id': 'domba', 'en': 'sheep'}, romaji: 'hitsuji'),
          GuideExample('やぎ', {'id': 'kambing', 'en': 'goat'}, romaji: 'yagi'),
          GuideExample('はちみつ', {'id': 'madu', 'en': 'honey'}, romaji: 'hachimitsu'),
          GuideExample('ぎゅうにく', {'id': 'daging sapi', 'en': 'beef'}, romaji: 'gyuuniku'),
          GuideExample('ぼくじょう に うし が います', {'id': 'Ada sapi di peternakan', 'en': 'There are cows on the ranch'}, romaji: 'bokujou ni ushi ga imasu'),
          GuideExample('にわとり は たまご を うみます', {'id': 'Ayam bertelur', 'en': 'Chickens lay eggs'}, romaji: 'niwatori wa tamago o umimasu'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'vocab_sea',
    emoji: '⚓',
    title: const {'id': 'Laut & Perikanan', 'en': 'Sea & Fishing'},
    subtitle: const {
      'id': '18 kosakata + contoh kalimat, ketuk untuk dengar',
      'en': '18 words + example sentences, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Pelaut & Kapal', 'en': 'Sailors & Ships'},
        examples: const [
          GuideExample('ふなのり', {'id': 'pelaut', 'en': 'sailor'}, romaji: 'funanori'),
          GuideExample('みなと', {'id': 'pelabuhan', 'en': 'harbor / port'}, romaji: 'minato'),
          GuideExample('ヨット', {'id': 'kapal layar', 'en': 'yacht / sailboat'}, romaji: 'yotto'),
          GuideExample('なみ', {'id': 'ombak', 'en': 'wave'}, romaji: 'nami'),
          GuideExample('はま', {'id': 'pantai', 'en': 'beach / shore'}, romaji: 'hama'),
          GuideExample('とうだい', {'id': 'mercusuar', 'en': 'lighthouse'}, romaji: 'toudai'),
          GuideExample('ふね は みなと に あります', {'id': 'Kapal ada di pelabuhan', 'en': 'The ship is in the harbor'}, romaji: 'fune wa minato ni arimasu'),
          GuideExample('なみ が たかい です', {'id': 'Ombaknya tinggi', 'en': 'The waves are high'}, romaji: 'nami ga takai desu'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Menangkap Ikan', 'en': 'Catching Fish'},
        examples: const [
          GuideExample('りょうし', {'id': 'nelayan', 'en': 'fisherman'}, romaji: 'ryoushi'),
          GuideExample('あみ', {'id': 'jala', 'en': 'fishing net'}, romaji: 'ami'),
          GuideExample('まぐろ', {'id': 'ikan tuna', 'en': 'tuna'}, romaji: 'maguro'),
          GuideExample('えび', {'id': 'udang', 'en': 'shrimp'}, romaji: 'ebi'),
          GuideExample('かに', {'id': 'kepiting', 'en': 'crab'}, romaji: 'kani'),
          GuideExample('たこ', {'id': 'gurita', 'en': 'octopus'}, romaji: 'tako'),
          GuideExample('りょうし は あさ はやく うみ に でます', {'id': 'Nelayan berangkat ke laut pagi-pagi', 'en': 'Fishermen go to sea early in the morning'}, romaji: 'ryoushi wa asa hayaku umi ni demasu'),
          GuideExample('まぐろ を つかまえました', {'id': 'Menangkap ikan tuna', 'en': 'I caught a tuna'}, romaji: 'maguro o tsukamaemashita'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Di Bawah Laut', 'en': 'Under the Sea'},
        examples: const [
          GuideExample('かい', {'id': 'kerang', 'en': 'shellfish'}, romaji: 'kai'),
          GuideExample('さんご', {'id': 'karang', 'en': 'coral'}, romaji: 'sango'),
          GuideExample('ダイビング', {'id': 'menyelam', 'en': 'diving'}, romaji: 'daibingu'),
          GuideExample('ふかい', {'id': 'dalam', 'en': 'deep'}, romaji: 'fukai'),
          GuideExample('あさい', {'id': 'dangkal', 'en': 'shallow'}, romaji: 'asai'),
          GuideExample('すいぞくかん', {'id': 'akuarium', 'en': 'aquarium'}, romaji: 'suizokukan'),
          GuideExample('うみ は ふかい です', {'id': 'Lautnya dalam', 'en': 'The sea is deep'}, romaji: 'umi wa fukai desu'),
          GuideExample('すいぞくかん で さかな を みます', {'id': 'Melihat ikan di akuarium', 'en': 'I watch fish at the aquarium'}, romaji: 'suizokukan de sakana o mimasu'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'vocab_office',
    emoji: '🗂️',
    title: const {'id': 'Kantor & Bisnis', 'en': 'Office & Business'},
    subtitle: const {
      'id': '18 kosakata + contoh kalimat, ketuk untuk dengar',
      'en': '18 words + example sentences, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Orang Kantor', 'en': 'Office People'},
        examples: const [
          GuideExample('しゃちょう', {'id': 'direktur perusahaan', 'en': 'company president'}, romaji: 'shachou'),
          GuideExample('ぶちょう', {'id': 'kepala divisi', 'en': 'department manager'}, romaji: 'buchou'),
          GuideExample('じょうし', {'id': 'atasan', 'en': 'boss / superior'}, romaji: 'joushi'),
          GuideExample('どうりょう', {'id': 'rekan kerja', 'en': 'colleague'}, romaji: 'douryou'),
          GuideExample('アルバイト', {'id': 'kerja paruh waktu', 'en': 'part-time job'}, romaji: 'arubaito'),
          GuideExample('めんせつ', {'id': 'wawancara kerja', 'en': 'job interview'}, romaji: 'mensetsu'),
          GuideExample('しゃちょう は いそがしい です', {'id': 'Direktur sedang sibuk', 'en': 'The president is busy'}, romaji: 'shachou wa isogashii desu'),
          GuideExample('あした めんせつ が あります', {'id': 'Besok ada wawancara kerja', 'en': 'I have a job interview tomorrow'}, romaji: 'ashita mensetsu ga arimasu'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Di Meja Kerja', 'en': 'At the Desk'},
        examples: const [
          GuideExample('しょるい', {'id': 'dokumen', 'en': 'documents'}, romaji: 'shorui'),
          GuideExample('はんこ', {'id': 'stempel pribadi', 'en': 'personal seal'}, romaji: 'hanko'),
          GuideExample('コピー', {'id': 'fotokopi', 'en': 'photocopy'}, romaji: 'kopii'),
          GuideExample('かいぎしつ', {'id': 'ruang rapat', 'en': 'meeting room'}, romaji: 'kaigishitsu'),
          GuideExample('プリンター', {'id': 'printer', 'en': 'printer'}, romaji: 'purintaa'),
          GuideExample('サイン', {'id': 'tanda tangan', 'en': 'signature'}, romaji: 'sain'),
          GuideExample('しょるい に サイン を おねがいします', {'id': 'Mohon tanda tangan di dokumennya', 'en': 'Please sign the documents'}, romaji: 'shorui ni sain o onegaishimasu'),
          GuideExample('かいぎしつ で まって います', {'id': 'Menunggu di ruang rapat', 'en': 'I am waiting in the meeting room'}, romaji: 'kaigishitsu de matte imasu'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Gaji & Karier', 'en': 'Salary & Career'},
        examples: const [
          GuideExample('きゅうりょう', {'id': 'gaji', 'en': 'salary'}, romaji: 'kyuuryou'),
          GuideExample('ざんぎょう', {'id': 'lembur', 'en': 'overtime'}, romaji: 'zangyou'),
          GuideExample('きゅうか', {'id': 'cuti', 'en': 'paid leave'}, romaji: 'kyuuka'),
          GuideExample('しゅっちょう', {'id': 'dinas luar kota', 'en': 'business trip'}, romaji: 'shucchou'),
          GuideExample('しょうしん', {'id': 'naik jabatan', 'en': 'promotion'}, romaji: 'shoushin'),
          GuideExample('たいしょく', {'id': 'pensiun; berhenti kerja', 'en': 'retirement / resignation'}, romaji: 'taishoku'),
          GuideExample('きゅうりょう が あがりました', {'id': 'Gajinya naik', 'en': 'The salary went up'}, romaji: 'kyuuryou ga agarimashita'),
          GuideExample('らいしゅう しゅっちょう が あります', {'id': 'Minggu depan ada dinas luar kota', 'en': 'I have a business trip next week'}, romaji: 'raishuu shucchou ga arimasu'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'vocab_cooking',
    emoji: '🍳',
    title: const {'id': 'Memasak', 'en': 'Cooking'},
    subtitle: const {
      'id': '18 kosakata + contoh kalimat, ketuk untuk dengar',
      'en': '18 words + example sentences, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Cara Memasak', 'en': 'Cooking Methods'},
        examples: const [
          GuideExample('やく', {'id': 'memanggang', 'en': 'to grill / bake'}, romaji: 'yaku'),
          GuideExample('にる', {'id': 'merebus berbumbu', 'en': 'to simmer'}, romaji: 'niru'),
          GuideExample('むす', {'id': 'mengukus', 'en': 'to steam'}, romaji: 'musu'),
          GuideExample('いためる', {'id': 'menumis', 'en': 'to stir-fry'}, romaji: 'itameru'),
          GuideExample('ゆでる', {'id': 'merebus', 'en': 'to boil'}, romaji: 'yuderu'),
          GuideExample('まぜる', {'id': 'mengaduk', 'en': 'to mix'}, romaji: 'mazeru'),
          GuideExample('さかな を やきます', {'id': 'Memanggang ikan', 'en': 'I grill fish'}, romaji: 'sakana o yakimasu'),
          GuideExample('たまご を ゆでます', {'id': 'Merebus telur', 'en': 'I boil eggs'}, romaji: 'tamago o yudemasu'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Bumbu', 'en': 'Seasonings'},
        examples: const [
          GuideExample('さとう', {'id': 'gula', 'en': 'sugar'}, romaji: 'satou'),
          GuideExample('しお', {'id': 'garam', 'en': 'salt'}, romaji: 'shio'),
          GuideExample('しょうゆ', {'id': 'kecap asin', 'en': 'soy sauce'}, romaji: 'shouyu'),
          GuideExample('あぶら', {'id': 'minyak', 'en': 'oil'}, romaji: 'abura'),
          GuideExample('こしょう', {'id': 'merica', 'en': 'pepper'}, romaji: 'koshou'),
          GuideExample('みそ', {'id': 'miso', 'en': 'miso paste'}, romaji: 'miso'),
          GuideExample('しお を すこし いれます', {'id': 'Masukkan sedikit garam', 'en': 'I add a little salt'}, romaji: 'shio o sukoshi iremasu'),
          GuideExample('しょうゆ で あじ を つけます', {'id': 'Memberi rasa dengan kecap asin', 'en': 'I season it with soy sauce'}, romaji: 'shouyu de aji o tsukemasu'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Peralatan Dapur', 'en': 'Kitchen Tools'},
        examples: const [
          GuideExample('ほうちょう', {'id': 'pisau dapur', 'en': 'kitchen knife'}, romaji: 'houchou'),
          GuideExample('なべ', {'id': 'panci', 'en': 'pot'}, romaji: 'nabe'),
          GuideExample('フライパン', {'id': 'wajan', 'en': 'frying pan'}, romaji: 'furaipan'),
          GuideExample('おさら', {'id': 'piring', 'en': 'plate'}, romaji: 'osara'),
          GuideExample('コップ', {'id': 'gelas', 'en': 'cup / glass'}, romaji: 'koppu'),
          GuideExample('はし', {'id': 'sumpit', 'en': 'chopsticks'}, romaji: 'hashi'),
          GuideExample('ほうちょう で やさい を きります', {'id': 'Memotong sayuran dengan pisau', 'en': 'I cut vegetables with a knife'}, romaji: 'houchou de yasai o kirimasu'),
          GuideExample('はし で たべます', {'id': 'Makan dengan sumpit', 'en': 'I eat with chopsticks'}, romaji: 'hashi de tabemasu'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'vocab_tools',
    emoji: '🔨',
    title: const {'id': 'Perkakas & Konstruksi', 'en': 'Tools & Construction'},
    subtitle: const {
      'id': '18 kosakata + contoh kalimat, ketuk untuk dengar',
      'en': '18 words + example sentences, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Perkakas', 'en': 'Tools'},
        examples: const [
          GuideExample('かなづち', {'id': 'palu', 'en': 'hammer'}, romaji: 'kanazuchi'),
          GuideExample('くぎ', {'id': 'paku', 'en': 'nail'}, romaji: 'kugi'),
          GuideExample('ネジ', {'id': 'sekrup', 'en': 'screw'}, romaji: 'neji'),
          GuideExample('ドライバー', {'id': 'obeng', 'en': 'screwdriver'}, romaji: 'doraibaa'),
          GuideExample('のこぎり', {'id': 'gergaji', 'en': 'saw'}, romaji: 'nokogiri'),
          GuideExample('はしご', {'id': 'tangga lipat', 'en': 'ladder'}, romaji: 'hashigo'),
          GuideExample('かなづち で くぎ を うちます', {'id': 'Memukul paku dengan palu', 'en': 'I hammer a nail'}, romaji: 'kanazuchi de kugi o uchimasu'),
          GuideExample('のこぎり で き を きります', {'id': 'Memotong kayu dengan gergaji', 'en': 'I cut wood with a saw'}, romaji: 'nokogiri de ki o kirimasu'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Di Lokasi Bangunan', 'en': 'At the Site'},
        examples: const [
          GuideExample('こうじ', {'id': 'konstruksi', 'en': 'construction work'}, romaji: 'kouji'),
          GuideExample('げんば', {'id': 'lokasi kerja', 'en': 'work site'}, romaji: 'genba'),
          GuideExample('だいく', {'id': 'tukang kayu', 'en': 'carpenter'}, romaji: 'daiku'),
          GuideExample('ヘルメット', {'id': 'helm', 'en': 'helmet'}, romaji: 'herumetto'),
          GuideExample('きかい', {'id': 'mesin', 'en': 'machine'}, romaji: 'kikai'),
          GuideExample('ざいりょう', {'id': 'bahan', 'en': 'materials'}, romaji: 'zairyou'),
          GuideExample('ここ は こうじちゅう です', {'id': 'Di sini sedang ada konstruksi', 'en': 'Construction is underway here'}, romaji: 'koko wa koujichuu desu'),
          GuideExample('ヘルメット を かぶって ください', {'id': 'Pakailah helm', 'en': 'Please wear a helmet'}, romaji: 'herumetto o kabutte kudasai'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Membangun', 'en': 'Building'},
        examples: const [
          GuideExample('たてる', {'id': 'membangun', 'en': 'to build'}, romaji: 'tateru'),
          GuideExample('なおす', {'id': 'memperbaiki', 'en': 'to fix / repair'}, romaji: 'naosu'),
          GuideExample('こわれる', {'id': 'rusak', 'en': 'to break down'}, romaji: 'kowareru'),
          GuideExample('ペンキ', {'id': 'cat tembok', 'en': 'paint'}, romaji: 'penki'),
          GuideExample('いた', {'id': 'papan kayu', 'en': 'board / plank'}, romaji: 'ita'),
          GuideExample('れんが', {'id': 'bata', 'en': 'brick'}, romaji: 'renga'),
          GuideExample('いえ を たてます', {'id': 'Membangun rumah', 'en': 'I build a house'}, romaji: 'ie o tatemasu'),
          GuideExample('じてんしゃ を なおします', {'id': 'Memperbaiki sepeda', 'en': 'I fix the bicycle'}, romaji: 'jitensha o naoshimasu'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'vocab_economy',
    emoji: '💹',
    title: const {'id': 'Ekonomi & Bank', 'en': 'Economy & Banking'},
    subtitle: const {
      'id': '18 kosakata + contoh kalimat, ketuk untuk dengar',
      'en': '18 words + example sentences, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Di Bank', 'en': 'At the Bank'},
        examples: const [
          GuideExample('こうざ', {'id': 'rekening', 'en': 'bank account'}, romaji: 'kouza'),
          GuideExample('よきん', {'id': 'simpanan', 'en': 'deposit'}, romaji: 'yokin'),
          GuideExample('ちょきん', {'id': 'menabung', 'en': 'savings'}, romaji: 'chokin'),
          GuideExample('おろす', {'id': 'menarik uang', 'en': 'to withdraw money'}, romaji: 'orosu'),
          GuideExample('ふりこみ', {'id': 'transfer bank', 'en': 'bank transfer'}, romaji: 'furikomi'),
          GuideExample('りし', {'id': 'bunga bank', 'en': 'interest (bank)'}, romaji: 'rishi'),
          GuideExample('ぎんこう で こうざ を つくります', {'id': 'Membuka rekening di bank', 'en': 'I open a bank account'}, romaji: 'ginkou de kouza o tsukurimasu'),
          GuideExample('おかね を おろします', {'id': 'Menarik uang', 'en': 'I withdraw money'}, romaji: 'okane o oroshimasu'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Ekonomi', 'en': 'The Economy'},
        examples: const [
          GuideExample('けいざい', {'id': 'ekonomi', 'en': 'economy'}, romaji: 'keizai'),
          GuideExample('しじょう', {'id': 'pasar (ekonomi)', 'en': 'market (economy)'}, romaji: 'shijou'),
          GuideExample('かぶ', {'id': 'saham', 'en': 'stocks'}, romaji: 'kabu'),
          GuideExample('ぜいきん', {'id': 'pajak', 'en': 'tax'}, romaji: 'zeikin'),
          GuideExample('ねあがり', {'id': 'kenaikan harga', 'en': 'price increase'}, romaji: 'neagari'),
          GuideExample('わりびき', {'id': 'diskon', 'en': 'discount'}, romaji: 'waribiki'),
          GuideExample('ぜいきん を はらいます', {'id': 'Membayar pajak', 'en': 'I pay taxes'}, romaji: 'zeikin o haraimasu'),
          GuideExample('この みせ は わりびき が あります', {'id': 'Toko ini ada diskon', 'en': 'This shop has a discount'}, romaji: 'kono mise wa waribiki ga arimasu'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Jual Beli', 'en': 'Trade'},
        examples: const [
          GuideExample('ゆしゅつ', {'id': 'ekspor', 'en': 'export'}, romaji: 'yushutsu'),
          GuideExample('ゆにゅう', {'id': 'impor', 'en': 'import'}, romaji: 'yunyuu'),
          GuideExample('ぼうえき', {'id': 'perdagangan internasional', 'en': 'international trade'}, romaji: 'boueki'),
          GuideExample('しょうばい', {'id': 'bisnis; dagang', 'en': 'business / trade'}, romaji: 'shoubai'),
          GuideExample('もうかる', {'id': 'untung', 'en': 'to be profitable'}, romaji: 'moukaru'),
          GuideExample('そんする', {'id': 'rugi', 'en': 'to lose money'}, romaji: 'sonsuru'),
          GuideExample('くるま を ゆしゅつ します', {'id': 'Mengekspor mobil', 'en': 'We export cars'}, romaji: 'kuruma o yushutsu shimasu'),
          GuideExample('しょうばい が もうかります', {'id': 'Bisnisnya untung', 'en': 'The business is profitable'}, romaji: 'shoubai ga moukarimasu'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'vocab_science',
    emoji: '🔬',
    title: const {'id': 'Sains & Antariksa', 'en': 'Science & Space'},
    subtitle: const {
      'id': '18 kosakata + contoh kalimat, ketuk untuk dengar',
      'en': '18 words + example sentences, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Sains Dasar', 'en': 'Basic Science'},
        examples: const [
          GuideExample('かがく', {'id': 'sains', 'en': 'science'}, romaji: 'kagaku'),
          GuideExample('じっけん', {'id': 'eksperimen', 'en': 'experiment'}, romaji: 'jikken'),
          GuideExample('けんきゅう', {'id': 'penelitian', 'en': 'research'}, romaji: 'kenkyuu'),
          GuideExample('はっけん', {'id': 'penemuan', 'en': 'discovery'}, romaji: 'hakken'),
          GuideExample('りか', {'id': 'IPA (pelajaran)', 'en': 'science class'}, romaji: 'rika'),
          GuideExample('すうがく', {'id': 'matematika', 'en': 'mathematics'}, romaji: 'suugaku'),
          GuideExample('がっこう で りか を べんきょう します', {'id': 'Belajar IPA di sekolah', 'en': 'I study science at school'}, romaji: 'gakkou de rika o benkyou shimasu'),
          GuideExample('じっけん を します', {'id': 'Melakukan eksperimen', 'en': 'I do an experiment'}, romaji: 'jikken o shimasu'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Luar Angkasa', 'en': 'Outer Space'},
        examples: const [
          GuideExample('うちゅう', {'id': 'luar angkasa', 'en': 'space / universe'}, romaji: 'uchuu'),
          GuideExample('ちきゅう', {'id': 'bumi', 'en': 'the Earth'}, romaji: 'chikyuu'),
          GuideExample('わくせい', {'id': 'planet', 'en': 'planet'}, romaji: 'wakusei'),
          GuideExample('ロケット', {'id': 'roket', 'en': 'rocket'}, romaji: 'roketto'),
          GuideExample('うちゅうひこうし', {'id': 'astronaut', 'en': 'astronaut'}, romaji: 'uchuuhikoushi'),
          GuideExample('ながれぼし', {'id': 'bintang jatuh', 'en': 'shooting star'}, romaji: 'nagareboshi'),
          GuideExample('ちきゅう は わくせい です', {'id': 'Bumi adalah planet', 'en': 'The Earth is a planet'}, romaji: 'chikyuu wa wakusei desu'),
          GuideExample('ロケット が うちゅう に いきます', {'id': 'Roket pergi ke luar angkasa', 'en': 'The rocket goes to space'}, romaji: 'roketto ga uchuu ni ikimasu'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Mengukur', 'en': 'Measuring'},
        examples: const [
          GuideExample('はかる', {'id': 'mengukur', 'en': 'to measure'}, romaji: 'hakaru'),
          GuideExample('ながさ', {'id': 'panjang (ukuran)', 'en': 'length'}, romaji: 'nagasa'),
          GuideExample('おもさ', {'id': 'berat (ukuran)', 'en': 'weight'}, romaji: 'omosa'),
          GuideExample('はやさ', {'id': 'kecepatan', 'en': 'speed'}, romaji: 'hayasa'),
          GuideExample('おんど', {'id': 'suhu', 'en': 'temperature'}, romaji: 'ondo'),
          GuideExample('でんち', {'id': 'baterai', 'en': 'battery'}, romaji: 'denchi'),
          GuideExample('おんど を はかります', {'id': 'Mengukur suhu', 'en': 'I measure the temperature'}, romaji: 'ondo o hakarimasu'),
          GuideExample('でんち が ありません', {'id': 'Tidak ada baterai', 'en': 'There are no batteries'}, romaji: 'denchi ga arimasen'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'vocab_industry',
    emoji: '🏭',
    title: const {'id': 'Industri & Pabrik', 'en': 'Industry & Factory'},
    subtitle: const {
      'id': '18 kosakata + contoh kalimat, ketuk untuk dengar',
      'en': '18 words + example sentences, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Di Pabrik', 'en': 'At the Factory'},
        examples: const [
          GuideExample('こうじょう', {'id': 'pabrik', 'en': 'factory'}, romaji: 'koujou'),
          GuideExample('せいひん', {'id': 'produk', 'en': 'product'}, romaji: 'seihin'),
          GuideExample('ぶひん', {'id': 'suku cadang', 'en': 'parts / components'}, romaji: 'buhin'),
          GuideExample('ロボット', {'id': 'robot', 'en': 'robot'}, romaji: 'robotto'),
          GuideExample('ライン', {'id': 'lini produksi', 'en': 'production line'}, romaji: 'rain'),
          GuideExample('けんさ', {'id': 'inspeksi', 'en': 'inspection'}, romaji: 'kensa'),
          GuideExample('こうじょう で くるま を つくります', {'id': 'Membuat mobil di pabrik', 'en': 'We make cars at the factory'}, romaji: 'koujou de kuruma o tsukurimasu'),
          GuideExample('ロボット が はたらいて います', {'id': 'Robot sedang bekerja', 'en': 'Robots are working'}, romaji: 'robotto ga hataraite imasu'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Produksi', 'en': 'Production'},
        examples: const [
          GuideExample('せいさん', {'id': 'produksi', 'en': 'production'}, romaji: 'seisan'),
          GuideExample('ひんしつ', {'id': 'kualitas', 'en': 'quality'}, romaji: 'hinshitsu'),
          GuideExample('こうりつ', {'id': 'efisiensi', 'en': 'efficiency'}, romaji: 'kouritsu'),
          GuideExample('きんし', {'id': 'dilarang', 'en': 'prohibited'}, romaji: 'kinshi'),
          GuideExample('ちゅうい', {'id': 'perhatian; hati-hati', 'en': 'caution / attention'}, romaji: 'chuui'),
          GuideExample('きゅうけい', {'id': 'istirahat kerja', 'en': 'work break'}, romaji: 'kyuukei'),
          GuideExample('ひんしつ が いい です', {'id': 'Kualitasnya bagus', 'en': 'The quality is good'}, romaji: 'hinshitsu ga ii desu'),
          GuideExample('ちょっと きゅうけい しましょう', {'id': 'Ayo istirahat sebentar', 'en': 'Let us take a short break'}, romaji: 'chotto kyuukei shimashou'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Energi', 'en': 'Energy'},
        examples: const [
          GuideExample('エネルギー', {'id': 'energi', 'en': 'energy'}, romaji: 'enerugii'),
          GuideExample('せきゆ', {'id': 'minyak bumi', 'en': 'petroleum'}, romaji: 'sekiyu'),
          GuideExample('ガス', {'id': 'gas', 'en': 'gas'}, romaji: 'gasu'),
          GuideExample('たいようこう', {'id': 'tenaga surya', 'en': 'solar power'}, romaji: 'taiyoukou'),
          GuideExample('はつでん', {'id': 'pembangkit listrik', 'en': 'power generation'}, romaji: 'hatsuden'),
          GuideExample('しげん', {'id': 'sumber daya', 'en': 'resources'}, romaji: 'shigen'),
          GuideExample('でんき は たいようこう から きます', {'id': 'Listriknya dari tenaga surya', 'en': 'The electricity comes from solar power'}, romaji: 'denki wa taiyoukou kara kimasu'),
          GuideExample('しげん を たいせつ に します', {'id': 'Menghemat sumber daya', 'en': 'We use resources carefully'}, romaji: 'shigen o taisetsu ni shimasu'),
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
  GuideTopic(
    id: 'en_vocab_farming',
    emoji: '🌾',
    title: const {'id': 'Pertanian', 'en': 'Farming'},
    subtitle: const {
      'id': '18 kosakata + contoh kalimat, ketuk untuk dengar',
      'en': '18 words + example sentences, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Ladang & Tanaman', 'en': 'Fields & Crops'},
        examples: const [
          GuideExample('farm', {'id': 'pertanian; ladang usaha tani', 'en': 'farm'},
              romaji: 'farm'),
          GuideExample('field', {'id': 'ladang', 'en': 'field'},
              romaji: 'fild'),
          GuideExample('rice field', {'id': 'sawah', 'en': 'rice field'},
              romaji: 'rais fild'),
          GuideExample('crop', {'id': 'tanaman panen', 'en': 'crop'},
              romaji: 'krop'),
          GuideExample('seed', {'id': 'benih', 'en': 'seed'},
              romaji: 'sid'),
          GuideExample('soil', {'id': 'tanah', 'en': 'soil'},
              romaji: 'soil'),
          GuideExample('The farmer works in the field', {'id': 'Petani bekerja di ladang', 'en': 'The farmer works in the field'},
              romaji: 'dhe far-mer werks in dhe fild'),
          GuideExample('We plant seeds in the soil', {'id': 'Kami menanam benih di tanah', 'en': 'We plant seeds in the soil'},
              romaji: 'wi plent sids in dhe soil'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Menanam & Panen', 'en': 'Planting & Harvest'},
        examples: const [
          GuideExample('to plant', {'id': 'menanam', 'en': 'to plant'},
              romaji: 'tu plent'),
          GuideExample('to grow', {'id': 'menumbuhkan; menanam', 'en': 'to grow'},
              romaji: 'tu grou'),
          GuideExample('to water', {'id': 'menyiram', 'en': 'to water'},
              romaji: 'tu wo-ter'),
          GuideExample('harvest', {'id': 'panen', 'en': 'harvest'},
              romaji: 'har-vest'),
          GuideExample('fertilizer', {'id': 'pupuk', 'en': 'fertilizer'},
              romaji: 'fer-ti-lai-zer'),
          GuideExample('tractor', {'id': 'traktor', 'en': 'tractor'},
              romaji: 'trek-tor'),
          GuideExample('I grow vegetables at home', {'id': 'Saya menanam sayuran di rumah', 'en': 'I grow vegetables at home'},
              romaji: 'ai grou vej-te-bels et houm'),
          GuideExample('We water the plants every morning', {'id': 'Kami menyiram tanaman setiap pagi', 'en': 'We water the plants every morning'},
              romaji: 'wi wo-ter dhe plents ev-ri mor-ning'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Peternakan', 'en': 'Livestock'},
        examples: const [
          GuideExample('cattle', {'id': 'sapi ternak', 'en': 'cattle'},
              romaji: 'ke-tel'),
          GuideExample('chicken', {'id': 'ayam', 'en': 'chicken'},
              romaji: 'chi-ken'),
          GuideExample('sheep', {'id': 'domba', 'en': 'sheep'},
              romaji: 'syiip'),
          GuideExample('goat', {'id': 'kambing', 'en': 'goat'},
              romaji: 'gout'),
          GuideExample('honey', {'id': 'madu', 'en': 'honey'},
              romaji: 'ha-ni'),
          GuideExample('barn', {'id': 'lumbung; kandang', 'en': 'barn'},
              romaji: 'barn'),
          GuideExample('The chickens lay eggs every day', {'id': 'Ayam bertelur setiap hari', 'en': 'The chickens lay eggs every day'},
              romaji: 'dhe chi-kens lei egs ev-ri dei'),
          GuideExample('There are cows in the barn', {'id': 'Ada sapi di kandang', 'en': 'There are cows in the barn'},
              romaji: 'dher ar kaus in dhe barn'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'en_vocab_sea',
    emoji: '⚓',
    title: const {'id': 'Laut & Perikanan', 'en': 'Sea & Fishing'},
    subtitle: const {
      'id': '18 kosakata + contoh kalimat, ketuk untuk dengar',
      'en': '18 words + example sentences, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Pelaut & Kapal', 'en': 'Sailors & Ships'},
        examples: const [
          GuideExample('sailor', {'id': 'pelaut', 'en': 'sailor'},
              romaji: 'sei-lor'),
          GuideExample('harbor', {'id': 'pelabuhan', 'en': 'harbor'},
              romaji: 'har-bor'),
          GuideExample('ship', {'id': 'kapal', 'en': 'ship'},
              romaji: 'syip'),
          GuideExample('wave', {'id': 'ombak', 'en': 'wave'},
              romaji: 'weiv'),
          GuideExample('beach', {'id': 'pantai', 'en': 'beach'},
              romaji: 'bich'),
          GuideExample('lighthouse', {'id': 'mercusuar', 'en': 'lighthouse'},
              romaji: 'lait-haus'),
          GuideExample('The ship is in the harbor', {'id': 'Kapal ada di pelabuhan', 'en': 'The ship is in the harbor'},
              romaji: 'dhe syip iz in dhe har-bor'),
          GuideExample('The waves are high today', {'id': 'Ombaknya tinggi hari ini', 'en': 'The waves are high today'},
              romaji: 'dhe weivs ar hai tu-dei'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Menangkap Ikan', 'en': 'Fishing'},
        examples: const [
          GuideExample('fisherman', {'id': 'nelayan', 'en': 'fisherman'},
              romaji: 'fi-syer-men'),
          GuideExample('net', {'id': 'jala', 'en': 'net'},
              romaji: 'net'),
          GuideExample('tuna', {'id': 'ikan tuna', 'en': 'tuna'},
              romaji: 'tu-na'),
          GuideExample('shrimp', {'id': 'udang', 'en': 'shrimp'},
              romaji: 'syrimp'),
          GuideExample('crab', {'id': 'kepiting', 'en': 'crab'},
              romaji: 'kreb'),
          GuideExample('octopus', {'id': 'gurita', 'en': 'octopus'},
              romaji: 'ok-to-pes'),
          GuideExample('Fishermen go to sea early in the morning', {'id': 'Nelayan berangkat ke laut pagi-pagi', 'en': 'Fishermen go to sea early in the morning'},
              romaji: 'fi-syer-men gou tu si er-li in dhe mor-ning'),
          GuideExample('He caught a big tuna', {'id': 'Dia menangkap tuna besar', 'en': 'He caught a big tuna'},
              romaji: 'hi kot e big tu-na'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Bawah Laut', 'en': 'Under the Sea'},
        examples: const [
          GuideExample('shell', {'id': 'kerang', 'en': 'shell'},
              romaji: 'syel'),
          GuideExample('coral', {'id': 'karang', 'en': 'coral'},
              romaji: 'ko-ral'),
          GuideExample('diving', {'id': 'menyelam', 'en': 'diving'},
              romaji: 'dai-ving'),
          GuideExample('deep', {'id': 'dalam', 'en': 'deep'},
              romaji: 'dip'),
          GuideExample('shallow', {'id': 'dangkal', 'en': 'shallow'},
              romaji: 'sye-lou'),
          GuideExample('aquarium', {'id': 'akuarium', 'en': 'aquarium'},
              romaji: 'e-kwe-ri-um'),
          GuideExample('The sea is very deep here', {'id': 'Laut di sini sangat dalam', 'en': 'The sea is very deep here'},
              romaji: 'dhe si iz ve-ri dip hir'),
          GuideExample('We watch fish at the aquarium', {'id': 'Kami melihat ikan di akuarium', 'en': 'We watch fish at the aquarium'},
              romaji: 'wi woch fisy et dhe e-kwe-ri-um'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'en_vocab_office',
    emoji: '🗂️',
    title: const {'id': 'Kantor & Bisnis', 'en': 'Office & Business'},
    subtitle: const {
      'id': '18 kosakata + contoh kalimat, ketuk untuk dengar',
      'en': '18 words + example sentences, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Orang Kantor', 'en': 'Office People'},
        examples: const [
          GuideExample('boss', {'id': 'atasan', 'en': 'boss'},
              romaji: 'bos'),
          GuideExample('manager', {'id': 'manajer', 'en': 'manager'},
              romaji: 'me-ne-jer'),
          GuideExample('employee', {'id': 'karyawan', 'en': 'employee'},
              romaji: 'em-ploi-yi'),
          GuideExample('colleague', {'id': 'rekan kerja', 'en': 'colleague'},
              romaji: 'ko-lig'),
          GuideExample('part-time job', {'id': 'kerja paruh waktu', 'en': 'part-time job'},
              romaji: 'part-taim job'),
          GuideExample('interview', {'id': 'wawancara', 'en': 'interview'},
              romaji: 'in-ter-vyu'),
          GuideExample('My boss is very busy', {'id': 'Atasan saya sangat sibuk', 'en': 'My boss is very busy'},
              romaji: 'mai bos iz ve-ri bi-zi'),
          GuideExample('I have a job interview tomorrow', {'id': 'Besok saya ada wawancara kerja', 'en': 'I have a job interview tomorrow'},
              romaji: 'ai hev e job in-ter-vyu tu-mo-rou'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Di Meja Kerja', 'en': 'At the Desk'},
        examples: const [
          GuideExample('document', {'id': 'dokumen', 'en': 'document'},
              romaji: 'do-kyu-ment'),
          GuideExample('meeting room', {'id': 'ruang rapat', 'en': 'meeting room'},
              romaji: 'mi-ting rum'),
          GuideExample('printer', {'id': 'printer', 'en': 'printer'},
              romaji: 'prin-ter'),
          GuideExample('signature', {'id': 'tanda tangan', 'en': 'signature'},
              romaji: 'sig-ne-cher'),
          GuideExample('photocopy', {'id': 'fotokopi', 'en': 'photocopy'},
              romaji: 'fo-to-ko-pi'),
          GuideExample('deadline', {'id': 'tenggat waktu', 'en': 'deadline'},
              romaji: 'ded-lain'),
          GuideExample('Please sign the document', {'id': 'Silakan tanda tangani dokumennya', 'en': 'Please sign the document'},
              romaji: 'plis sain dhe do-kyu-ment'),
          GuideExample('The meeting starts at nine', {'id': 'Rapat mulai pukul sembilan', 'en': 'The meeting starts at nine'},
              romaji: 'dhe mi-ting starts et nain'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Gaji & Karier', 'en': 'Salary & Career'},
        examples: const [
          GuideExample('salary', {'id': 'gaji', 'en': 'salary'},
              romaji: 'se-le-ri'),
          GuideExample('overtime', {'id': 'lembur', 'en': 'overtime'},
              romaji: 'ou-ver-taim'),
          GuideExample('paid leave', {'id': 'cuti', 'en': 'paid leave'},
              romaji: 'peid liv'),
          GuideExample('business trip', {'id': 'dinas luar kota', 'en': 'business trip'},
              romaji: 'biz-nes trip'),
          GuideExample('promotion', {'id': 'kenaikan jabatan', 'en': 'promotion'},
              romaji: 'pro-mou-syen'),
          GuideExample('retirement', {'id': 'pensiun', 'en': 'retirement'},
              romaji: 'ri-ta-yer-ment'),
          GuideExample('She got a promotion last month', {'id': 'Dia naik jabatan bulan lalu', 'en': 'She got a promotion last month'},
              romaji: 'syi got e pro-mou-syen last manth'),
          GuideExample('I have a business trip next week', {'id': 'Minggu depan saya dinas luar kota', 'en': 'I have a business trip next week'},
              romaji: 'ai hev e biz-nes trip nekst wik'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'en_vocab_cooking',
    emoji: '🍳',
    title: const {'id': 'Memasak', 'en': 'Cooking'},
    subtitle: const {
      'id': '18 kosakata + contoh kalimat, ketuk untuk dengar',
      'en': '18 words + example sentences, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Cara Memasak', 'en': 'Cooking Methods'},
        examples: const [
          GuideExample('to bake', {'id': 'memanggang (oven)', 'en': 'to bake'},
              romaji: 'tu beik'),
          GuideExample('to fry', {'id': 'menggoreng', 'en': 'to fry'},
              romaji: 'tu frai'),
          GuideExample('to boil', {'id': 'merebus', 'en': 'to boil'},
              romaji: 'tu boil'),
          GuideExample('to steam', {'id': 'mengukus', 'en': 'to steam'},
              romaji: 'tu stim'),
          GuideExample('to grill', {'id': 'membakar; memanggang', 'en': 'to grill'},
              romaji: 'tu gril'),
          GuideExample('to mix', {'id': 'mengaduk; mencampur', 'en': 'to mix'},
              romaji: 'tu miks'),
          GuideExample('I boil the eggs for ten minutes', {'id': 'Saya merebus telur sepuluh menit', 'en': 'I boil the eggs for ten minutes'},
              romaji: 'ai boil dhe egs for ten mi-nits'),
          GuideExample('She bakes bread every weekend', {'id': 'Dia memanggang roti tiap akhir pekan', 'en': 'She bakes bread every weekend'},
              romaji: 'syi beiks bred ev-ri wik-end'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Bumbu', 'en': 'Seasonings'},
        examples: const [
          GuideExample('sugar', {'id': 'gula', 'en': 'sugar'},
              romaji: 'syu-gar'),
          GuideExample('salt', {'id': 'garam', 'en': 'salt'},
              romaji: 'solt'),
          GuideExample('pepper', {'id': 'merica', 'en': 'pepper'},
              romaji: 'pe-per'),
          GuideExample('cooking oil', {'id': 'minyak goreng', 'en': 'cooking oil'},
              romaji: 'ku-king oil'),
          GuideExample('soy sauce', {'id': 'kecap', 'en': 'soy sauce'},
              romaji: 'soi sos'),
          GuideExample('garlic', {'id': 'bawang putih', 'en': 'garlic'},
              romaji: 'gar-lik'),
          GuideExample('Add a little salt', {'id': 'Tambahkan sedikit garam', 'en': 'Add a little salt'},
              romaji: 'ed e li-tel solt'),
          GuideExample('This soup needs more pepper', {'id': 'Sup ini kurang merica', 'en': 'This soup needs more pepper'},
              romaji: 'dhis sup nids mor pe-per'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Peralatan Dapur', 'en': 'Kitchen Tools'},
        examples: const [
          GuideExample('knife', {'id': 'pisau', 'en': 'knife'},
              romaji: 'naif'),
          GuideExample('pot', {'id': 'panci', 'en': 'pot'},
              romaji: 'pot'),
          GuideExample('frying pan', {'id': 'wajan', 'en': 'frying pan'},
              romaji: 'frai-ing pen'),
          GuideExample('plate', {'id': 'piring', 'en': 'plate'},
              romaji: 'pleit'),
          GuideExample('glass', {'id': 'gelas', 'en': 'glass'},
              romaji: 'glas'),
          GuideExample('spoon', {'id': 'sendok', 'en': 'spoon'},
              romaji: 'spun'),
          GuideExample('Cut the vegetables with a knife', {'id': 'Potong sayuran dengan pisau', 'en': 'Cut the vegetables with a knife'},
              romaji: 'kat dhe vej-te-bels widh e naif'),
          GuideExample('The plates are on the table', {'id': 'Piringnya ada di atas meja', 'en': 'The plates are on the table'},
              romaji: 'dhe pleits ar on dhe tei-bel'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'en_vocab_tools',
    emoji: '🔨',
    title: const {'id': 'Perkakas & Konstruksi', 'en': 'Tools & Construction'},
    subtitle: const {
      'id': '18 kosakata + contoh kalimat, ketuk untuk dengar',
      'en': '18 words + example sentences, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Perkakas', 'en': 'Tools'},
        examples: const [
          GuideExample('hammer', {'id': 'palu', 'en': 'hammer'},
              romaji: 'he-mer'),
          GuideExample('nail', {'id': 'paku', 'en': 'nail'},
              romaji: 'neil'),
          GuideExample('screw', {'id': 'sekrup', 'en': 'screw'},
              romaji: 'skru'),
          GuideExample('screwdriver', {'id': 'obeng', 'en': 'screwdriver'},
              romaji: 'skru-drai-ver'),
          GuideExample('saw', {'id': 'gergaji', 'en': 'saw'},
              romaji: 'so'),
          GuideExample('ladder', {'id': 'tangga lipat', 'en': 'ladder'},
              romaji: 'le-der'),
          GuideExample('Hit the nail with a hammer', {'id': 'Pukul paku dengan palu', 'en': 'Hit the nail with a hammer'},
              romaji: 'hit dhe neil widh e he-mer'),
          GuideExample('He cuts the wood with a saw', {'id': 'Dia memotong kayu dengan gergaji', 'en': 'He cuts the wood with a saw'},
              romaji: 'hi kats dhe wud widh e so'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Di Lokasi Bangunan', 'en': 'At the Site'},
        examples: const [
          GuideExample('construction', {'id': 'konstruksi', 'en': 'construction'},
              romaji: 'kon-strak-syen'),
          GuideExample('worker', {'id': 'pekerja', 'en': 'worker'},
              romaji: 'wer-ker'),
          GuideExample('helmet', {'id': 'helm', 'en': 'helmet'},
              romaji: 'hel-met'),
          GuideExample('machine', {'id': 'mesin', 'en': 'machine'},
              romaji: 'me-syin'),
          GuideExample('brick', {'id': 'bata', 'en': 'brick'},
              romaji: 'brik'),
          GuideExample('cement', {'id': 'semen', 'en': 'cement'},
              romaji: 'se-ment'),
          GuideExample('Please wear a helmet here', {'id': 'Harap pakai helm di sini', 'en': 'Please wear a helmet here'},
              romaji: 'plis wer e hel-met hir'),
          GuideExample('The workers build a new school', {'id': 'Para pekerja membangun sekolah baru', 'en': 'The workers build a new school'},
              romaji: 'dhe wer-kers bild e nyu skul'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Membangun', 'en': 'Building'},
        examples: const [
          GuideExample('to build', {'id': 'membangun', 'en': 'to build'},
              romaji: 'tu bild'),
          GuideExample('to fix', {'id': 'memperbaiki', 'en': 'to fix'},
              romaji: 'tu fiks'),
          GuideExample('broken', {'id': 'rusak', 'en': 'broken'},
              romaji: 'brou-ken'),
          GuideExample('paint', {'id': 'cat', 'en': 'paint'},
              romaji: 'peint'),
          GuideExample('wood', {'id': 'kayu', 'en': 'wood'},
              romaji: 'wud'),
          GuideExample('wall', {'id': 'tembok', 'en': 'wall'},
              romaji: 'wol'),
          GuideExample('They build houses', {'id': 'Mereka membangun rumah', 'en': 'They build houses'},
              romaji: 'dhei bild hau-zes'),
          GuideExample('My father fixes the roof', {'id': 'Ayah saya memperbaiki atap', 'en': 'My father fixes the roof'},
              romaji: 'mai fa-dher fik-ses dhe ruf'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'en_vocab_economy',
    emoji: '💹',
    title: const {'id': 'Ekonomi & Bank', 'en': 'Economy & Banking'},
    subtitle: const {
      'id': '18 kosakata + contoh kalimat, ketuk untuk dengar',
      'en': '18 words + example sentences, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Di Bank', 'en': 'At the Bank'},
        examples: const [
          GuideExample('bank account', {'id': 'rekening bank', 'en': 'bank account'},
              romaji: 'bengk e-kaunt'),
          GuideExample('savings', {'id': 'tabungan', 'en': 'savings'},
              romaji: 'sei-vings'),
          GuideExample('to withdraw', {'id': 'menarik uang', 'en': 'to withdraw'},
              romaji: 'tu widh-dro'),
          GuideExample('to deposit', {'id': 'menyetor', 'en': 'to deposit'},
              romaji: 'tu di-po-zit'),
          GuideExample('transfer', {'id': 'transfer', 'en': 'transfer'},
              romaji: 'trens-fer'),
          GuideExample('interest', {'id': 'bunga (bank)', 'en': 'interest'},
              romaji: 'in-te-rest'),
          GuideExample('I open a bank account', {'id': 'Saya membuka rekening bank', 'en': 'I open a bank account'},
              romaji: 'ai ou-pen e bengk e-kaunt'),
          GuideExample('She withdraws money at the ATM', {'id': 'Dia menarik uang di ATM', 'en': 'She withdraws money at the ATM'},
              romaji: 'syi widh-dros ma-ni et dhi ei-ti-em'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Ekonomi', 'en': 'The Economy'},
        examples: const [
          GuideExample('economy', {'id': 'ekonomi', 'en': 'economy'},
              romaji: 'i-ko-no-mi'),
          GuideExample('market', {'id': 'pasar', 'en': 'market'},
              romaji: 'mar-ket'),
          GuideExample('tax', {'id': 'pajak', 'en': 'tax'},
              romaji: 'teks'),
          GuideExample('price', {'id': 'harga', 'en': 'price'},
              romaji: 'prais'),
          GuideExample('discount', {'id': 'diskon', 'en': 'discount'},
              romaji: 'dis-kaunt'),
          GuideExample('stock', {'id': 'saham', 'en': 'stock'},
              romaji: 'stok'),
          GuideExample('Prices go up every year', {'id': 'Harga naik setiap tahun', 'en': 'Prices go up every year'},
              romaji: 'prai-ses gou ap ev-ri yir'),
          GuideExample('This shop gives a big discount', {'id': 'Toko ini memberi diskon besar', 'en': 'This shop gives a big discount'},
              romaji: 'dhis syop givs e big dis-kaunt'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Jual Beli', 'en': 'Trade'},
        examples: const [
          GuideExample('export', {'id': 'ekspor', 'en': 'export'},
              romaji: 'eks-port'),
          GuideExample('import', {'id': 'impor', 'en': 'import'},
              romaji: 'im-port'),
          GuideExample('trade', {'id': 'perdagangan', 'en': 'trade'},
              romaji: 'treid'),
          GuideExample('profit', {'id': 'untung', 'en': 'profit'},
              romaji: 'pro-fit'),
          GuideExample('loss', {'id': 'rugi', 'en': 'loss'},
              romaji: 'los'),
          GuideExample('customer', {'id': 'pelanggan', 'en': 'customer'},
              romaji: 'kas-to-mer'),
          GuideExample('Indonesia exports coffee', {'id': 'Indonesia mengekspor kopi', 'en': 'Indonesia exports coffee'},
              romaji: 'in-do-ni-sya eks-ports ko-fi'),
          GuideExample('The customer is always right', {'id': 'Pelanggan selalu benar', 'en': 'The customer is always right'},
              romaji: 'dhe kas-to-mer iz ol-weis rait'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'en_vocab_science',
    emoji: '🔬',
    title: const {'id': 'Sains & Antariksa', 'en': 'Science & Space'},
    subtitle: const {
      'id': '18 kosakata + contoh kalimat, ketuk untuk dengar',
      'en': '18 words + example sentences, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Sains Dasar', 'en': 'Basic Science'},
        examples: const [
          GuideExample('science', {'id': 'sains; ilmu pengetahuan', 'en': 'science'},
              romaji: 'sai-ens'),
          GuideExample('experiment', {'id': 'eksperimen', 'en': 'experiment'},
              romaji: 'eks-pe-ri-ment'),
          GuideExample('research', {'id': 'penelitian', 'en': 'research'},
              romaji: 'ri-serch'),
          GuideExample('discovery', {'id': 'penemuan', 'en': 'discovery'},
              romaji: 'dis-ka-ve-ri'),
          GuideExample('laboratory', {'id': 'laboratorium', 'en': 'laboratory'},
              romaji: 'le-bo-re-to-ri'),
          GuideExample('mathematics', {'id': 'matematika', 'en': 'mathematics'},
              romaji: 'me-the-me-tiks'),
          GuideExample('We do an experiment at school', {'id': 'Kami melakukan eksperimen di sekolah', 'en': 'We do an experiment at school'},
              romaji: 'wi du en eks-pe-ri-ment et skul'),
          GuideExample('Math is my favorite subject', {'id': 'Matematika pelajaran favorit saya', 'en': 'Math is my favorite subject'},
              romaji: 'meth iz mai fei-vo-rit sab-jekt'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Luar Angkasa', 'en': 'Outer Space'},
        examples: const [
          GuideExample('space', {'id': 'luar angkasa', 'en': 'space'},
              romaji: 'speis'),
          GuideExample('the Earth', {'id': 'bumi', 'en': 'the Earth'},
              romaji: 'dhi erth'),
          GuideExample('planet', {'id': 'planet', 'en': 'planet'},
              romaji: 'ple-net'),
          GuideExample('rocket', {'id': 'roket', 'en': 'rocket'},
              romaji: 'ro-ket'),
          GuideExample('astronaut', {'id': 'astronaut', 'en': 'astronaut'},
              romaji: 'es-tro-not'),
          GuideExample('shooting star', {'id': 'bintang jatuh', 'en': 'shooting star'},
              romaji: 'syu-ting star'),
          GuideExample('The Earth is a planet', {'id': 'Bumi adalah planet', 'en': 'The Earth is a planet'},
              romaji: 'dhi erth iz e ple-net'),
          GuideExample('The rocket flies to space', {'id': 'Roket terbang ke luar angkasa', 'en': 'The rocket flies to space'},
              romaji: 'dhe ro-ket flais tu speis'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Mengukur', 'en': 'Measuring'},
        examples: const [
          GuideExample('to measure', {'id': 'mengukur', 'en': 'to measure'},
              romaji: 'tu me-zher'),
          GuideExample('length', {'id': 'panjang', 'en': 'length'},
              romaji: 'lengt'),
          GuideExample('weight', {'id': 'berat', 'en': 'weight'},
              romaji: 'weit'),
          GuideExample('speed', {'id': 'kecepatan', 'en': 'speed'},
              romaji: 'spid'),
          GuideExample('temperature', {'id': 'suhu', 'en': 'temperature'},
              romaji: 'tem-pre-cher'),
          GuideExample('battery', {'id': 'baterai', 'en': 'battery'},
              romaji: 'be-te-ri'),
          GuideExample('I measure the temperature', {'id': 'Saya mengukur suhu', 'en': 'I measure the temperature'},
              romaji: 'ai me-zher dhe tem-pre-cher'),
          GuideExample('The battery is empty', {'id': 'Baterainya habis', 'en': 'The battery is empty'},
              romaji: 'dhe be-te-ri iz em-ti'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'en_vocab_industry',
    emoji: '🏭',
    title: const {'id': 'Industri & Pabrik', 'en': 'Industry & Factory'},
    subtitle: const {
      'id': '18 kosakata + contoh kalimat, ketuk untuk dengar',
      'en': '18 words + example sentences, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Di Pabrik', 'en': 'At the Factory'},
        examples: const [
          GuideExample('factory', {'id': 'pabrik', 'en': 'factory'},
              romaji: 'fek-to-ri'),
          GuideExample('product', {'id': 'produk', 'en': 'product'},
              romaji: 'pro-dakt'),
          GuideExample('robot', {'id': 'robot', 'en': 'robot'},
              romaji: 'ro-bot'),
          GuideExample('parts', {'id': 'suku cadang', 'en': 'parts'},
              romaji: 'parts'),
          GuideExample('production line', {'id': 'lini produksi', 'en': 'production line'},
              romaji: 'pro-dak-syen lain'),
          GuideExample('inspection', {'id': 'inspeksi', 'en': 'inspection'},
              romaji: 'in-spek-syen'),
          GuideExample('This factory makes cars', {'id': 'Pabrik ini membuat mobil', 'en': 'This factory makes cars'},
              romaji: 'dhis fek-to-ri meiks kars'),
          GuideExample('Robots work day and night', {'id': 'Robot bekerja siang dan malam', 'en': 'Robots work day and night'},
              romaji: 'ro-bots werk dei end nait'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Produksi', 'en': 'Production'},
        examples: const [
          GuideExample('production', {'id': 'produksi', 'en': 'production'},
              romaji: 'pro-dak-syen'),
          GuideExample('quality', {'id': 'kualitas', 'en': 'quality'},
              romaji: 'kwo-li-ti'),
          GuideExample('efficiency', {'id': 'efisiensi', 'en': 'efficiency'},
              romaji: 'i-fi-syen-si'),
          GuideExample('safety', {'id': 'keselamatan', 'en': 'safety'},
              romaji: 'seif-ti'),
          GuideExample('warning', {'id': 'peringatan', 'en': 'warning'},
              romaji: 'wor-ning'),
          GuideExample('break', {'id': 'istirahat', 'en': 'break'},
              romaji: 'breik'),
          GuideExample('The quality is very good', {'id': 'Kualitasnya sangat bagus', 'en': 'The quality is very good'},
              romaji: 'dhe kwo-li-ti iz ve-ri gud'),
          GuideExample('Let\'s take a short break', {'id': 'Ayo istirahat sebentar', 'en': 'Let\'s take a short break'},
              romaji: 'lets teik e syort breik'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Energi', 'en': 'Energy'},
        examples: const [
          GuideExample('energy', {'id': 'energi', 'en': 'energy'},
              romaji: 'e-ner-ji'),
          GuideExample('oil', {'id': 'minyak bumi', 'en': 'oil'},
              romaji: 'oil'),
          GuideExample('gas', {'id': 'gas', 'en': 'gas'},
              romaji: 'ges'),
          GuideExample('solar power', {'id': 'tenaga surya', 'en': 'solar power'},
              romaji: 'so-lar pau-er'),
          GuideExample('electricity', {'id': 'listrik', 'en': 'electricity'},
              romaji: 'i-lek-tri-si-ti'),
          GuideExample('resources', {'id': 'sumber daya', 'en': 'resources'},
              romaji: 'ri-sor-ses'),
          GuideExample('The electricity comes from solar power', {'id': 'Listriknya dari tenaga surya', 'en': 'The electricity comes from solar power'},
              romaji: 'dhi i-lek-tri-si-ti kams from so-lar pau-er'),
          GuideExample('We must save energy', {'id': 'Kita harus menghemat energi', 'en': 'We must save energy'},
              romaji: 'wi mast seiv e-ner-ji'),
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
  GuideTopic(
    id: 'id_vocab_farming',
    emoji: '🌾',
    title: const {'id': 'Pertanian', 'en': 'Farming'},
    subtitle: const {
      'id': '18 kosakata + contoh kalimat, ketuk untuk dengar',
      'en': '18 words + example sentences, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Ladang & Tanaman', 'en': 'Fields & Crops'},
        examples: const [
          GuideExample('pertanian',
              {'id': 'pertanian', 'en': 'farm'}),
          GuideExample('ladang',
              {'id': 'ladang', 'en': 'field'}),
          GuideExample('sawah',
              {'id': 'sawah', 'en': 'rice field'}),
          GuideExample('tanaman panen',
              {'id': 'tanaman panen', 'en': 'crop'}),
          GuideExample('benih',
              {'id': 'benih', 'en': 'seed'}),
          GuideExample('tanah',
              {'id': 'tanah', 'en': 'soil'}),
          GuideExample('Petani bekerja di ladang',
              {'id': 'Petani bekerja di ladang', 'en': 'The farmer works in the field'}),
          GuideExample('Kami menanam benih di tanah',
              {'id': 'Kami menanam benih di tanah', 'en': 'We plant seeds in the soil'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'Menanam & Panen', 'en': 'Planting & Harvest'},
        examples: const [
          GuideExample('menanam',
              {'id': 'menanam', 'en': 'to plant'}),
          GuideExample('menumbuhkan',
              {'id': 'menumbuhkan', 'en': 'to grow'}),
          GuideExample('menyiram',
              {'id': 'menyiram', 'en': 'to water'}),
          GuideExample('panen',
              {'id': 'panen', 'en': 'harvest'}),
          GuideExample('pupuk',
              {'id': 'pupuk', 'en': 'fertilizer'}),
          GuideExample('traktor',
              {'id': 'traktor', 'en': 'tractor'}),
          GuideExample('Saya menanam sayuran di rumah',
              {'id': 'Saya menanam sayuran di rumah', 'en': 'I grow vegetables at home'}),
          GuideExample('Kami menyiram tanaman setiap pagi',
              {'id': 'Kami menyiram tanaman setiap pagi', 'en': 'We water the plants every morning'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'Peternakan', 'en': 'Livestock'},
        examples: const [
          GuideExample('sapi ternak',
              {'id': 'sapi ternak', 'en': 'cattle'}),
          GuideExample('ayam',
              {'id': 'ayam', 'en': 'chicken'}),
          GuideExample('domba',
              {'id': 'domba', 'en': 'sheep'}),
          GuideExample('kambing',
              {'id': 'kambing', 'en': 'goat'}),
          GuideExample('madu',
              {'id': 'madu', 'en': 'honey'}),
          GuideExample('kandang',
              {'id': 'kandang', 'en': 'barn'}),
          GuideExample('Ayam bertelur setiap hari',
              {'id': 'Ayam bertelur setiap hari', 'en': 'The chickens lay eggs every day'}),
          GuideExample('Ada sapi di kandang',
              {'id': 'Ada sapi di kandang', 'en': 'There are cows in the barn'}),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'id_vocab_sea',
    emoji: '⚓',
    title: const {'id': 'Laut & Perikanan', 'en': 'Sea & Fishing'},
    subtitle: const {
      'id': '18 kosakata + contoh kalimat, ketuk untuk dengar',
      'en': '18 words + example sentences, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Pelaut & Kapal', 'en': 'Sailors & Ships'},
        examples: const [
          GuideExample('pelaut',
              {'id': 'pelaut', 'en': 'sailor'}),
          GuideExample('pelabuhan',
              {'id': 'pelabuhan', 'en': 'harbor'}),
          GuideExample('kapal',
              {'id': 'kapal', 'en': 'ship'}),
          GuideExample('ombak',
              {'id': 'ombak', 'en': 'wave'}),
          GuideExample('pantai',
              {'id': 'pantai', 'en': 'beach'}),
          GuideExample('mercusuar',
              {'id': 'mercusuar', 'en': 'lighthouse'}),
          GuideExample('Kapal ada di pelabuhan',
              {'id': 'Kapal ada di pelabuhan', 'en': 'The ship is in the harbor'}),
          GuideExample('Ombaknya tinggi hari ini',
              {'id': 'Ombaknya tinggi hari ini', 'en': 'The waves are high today'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'Menangkap Ikan', 'en': 'Fishing'},
        examples: const [
          GuideExample('nelayan',
              {'id': 'nelayan', 'en': 'fisherman'}),
          GuideExample('jala',
              {'id': 'jala', 'en': 'net'}),
          GuideExample('ikan tuna',
              {'id': 'ikan tuna', 'en': 'tuna'}),
          GuideExample('udang',
              {'id': 'udang', 'en': 'shrimp'}),
          GuideExample('kepiting',
              {'id': 'kepiting', 'en': 'crab'}),
          GuideExample('gurita',
              {'id': 'gurita', 'en': 'octopus'}),
          GuideExample('Nelayan berangkat ke laut pagi-pagi',
              {'id': 'Nelayan berangkat ke laut pagi-pagi', 'en': 'Fishermen go to sea early in the morning'}),
          GuideExample('Dia menangkap tuna besar',
              {'id': 'Dia menangkap tuna besar', 'en': 'He caught a big tuna'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'Bawah Laut', 'en': 'Under the Sea'},
        examples: const [
          GuideExample('kerang',
              {'id': 'kerang', 'en': 'shell'}),
          GuideExample('karang',
              {'id': 'karang', 'en': 'coral'}),
          GuideExample('menyelam',
              {'id': 'menyelam', 'en': 'diving'}),
          GuideExample('dalam',
              {'id': 'dalam', 'en': 'deep'}),
          GuideExample('dangkal',
              {'id': 'dangkal', 'en': 'shallow'}),
          GuideExample('akuarium',
              {'id': 'akuarium', 'en': 'aquarium'}),
          GuideExample('Laut di sini sangat dalam',
              {'id': 'Laut di sini sangat dalam', 'en': 'The sea is very deep here'}),
          GuideExample('Kami melihat ikan di akuarium',
              {'id': 'Kami melihat ikan di akuarium', 'en': 'We watch fish at the aquarium'}),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'id_vocab_office',
    emoji: '🗂️',
    title: const {'id': 'Kantor & Bisnis', 'en': 'Office & Business'},
    subtitle: const {
      'id': '18 kosakata + contoh kalimat, ketuk untuk dengar',
      'en': '18 words + example sentences, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Orang Kantor', 'en': 'Office People'},
        examples: const [
          GuideExample('atasan',
              {'id': 'atasan', 'en': 'boss'}),
          GuideExample('manajer',
              {'id': 'manajer', 'en': 'manager'}),
          GuideExample('karyawan',
              {'id': 'karyawan', 'en': 'employee'}),
          GuideExample('rekan kerja',
              {'id': 'rekan kerja', 'en': 'colleague'}),
          GuideExample('kerja paruh waktu',
              {'id': 'kerja paruh waktu', 'en': 'part-time job'}),
          GuideExample('wawancara',
              {'id': 'wawancara', 'en': 'interview'}),
          GuideExample('Atasan saya sangat sibuk',
              {'id': 'Atasan saya sangat sibuk', 'en': 'My boss is very busy'}),
          GuideExample('Besok saya ada wawancara kerja',
              {'id': 'Besok saya ada wawancara kerja', 'en': 'I have a job interview tomorrow'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'Di Meja Kerja', 'en': 'At the Desk'},
        examples: const [
          GuideExample('dokumen',
              {'id': 'dokumen', 'en': 'document'}),
          GuideExample('ruang rapat',
              {'id': 'ruang rapat', 'en': 'meeting room'}),
          GuideExample('pencetak',
              {'id': 'pencetak', 'en': 'printer'}),
          GuideExample('tanda tangan',
              {'id': 'tanda tangan', 'en': 'signature'}),
          GuideExample('fotokopi',
              {'id': 'fotokopi', 'en': 'photocopy'}),
          GuideExample('tenggat waktu',
              {'id': 'tenggat waktu', 'en': 'deadline'}),
          GuideExample('Silakan tanda tangani dokumennya',
              {'id': 'Silakan tanda tangani dokumennya', 'en': 'Please sign the document'}),
          GuideExample('Rapat mulai pukul sembilan',
              {'id': 'Rapat mulai pukul sembilan', 'en': 'The meeting starts at nine'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'Gaji & Karier', 'en': 'Salary & Career'},
        examples: const [
          GuideExample('gaji',
              {'id': 'gaji', 'en': 'salary'}),
          GuideExample('lembur',
              {'id': 'lembur', 'en': 'overtime'}),
          GuideExample('cuti',
              {'id': 'cuti', 'en': 'paid leave'}),
          GuideExample('dinas luar kota',
              {'id': 'dinas luar kota', 'en': 'business trip'}),
          GuideExample('kenaikan jabatan',
              {'id': 'kenaikan jabatan', 'en': 'promotion'}),
          GuideExample('pensiun',
              {'id': 'pensiun', 'en': 'retirement'}),
          GuideExample('Dia naik jabatan bulan lalu',
              {'id': 'Dia naik jabatan bulan lalu', 'en': 'She got a promotion last month'}),
          GuideExample('Minggu depan saya dinas luar kota',
              {'id': 'Minggu depan saya dinas luar kota', 'en': 'I have a business trip next week'}),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'id_vocab_cooking',
    emoji: '🍳',
    title: const {'id': 'Memasak', 'en': 'Cooking'},
    subtitle: const {
      'id': '18 kosakata + contoh kalimat, ketuk untuk dengar',
      'en': '18 words + example sentences, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Cara Memasak', 'en': 'Cooking Methods'},
        examples: const [
          GuideExample('memanggang',
              {'id': 'memanggang', 'en': 'to bake'}),
          GuideExample('menggoreng',
              {'id': 'menggoreng', 'en': 'to fry'}),
          GuideExample('merebus',
              {'id': 'merebus', 'en': 'to boil'}),
          GuideExample('mengukus',
              {'id': 'mengukus', 'en': 'to steam'}),
          GuideExample('membakar',
              {'id': 'membakar', 'en': 'to grill'}),
          GuideExample('mengaduk',
              {'id': 'mengaduk', 'en': 'to mix'}),
          GuideExample('Saya merebus telur sepuluh menit',
              {'id': 'Saya merebus telur sepuluh menit', 'en': 'I boil the eggs for ten minutes'}),
          GuideExample('Dia memanggang roti tiap akhir pekan',
              {'id': 'Dia memanggang roti tiap akhir pekan', 'en': 'She bakes bread every weekend'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'Bumbu', 'en': 'Seasonings'},
        examples: const [
          GuideExample('gula',
              {'id': 'gula', 'en': 'sugar'}),
          GuideExample('garam',
              {'id': 'garam', 'en': 'salt'}),
          GuideExample('merica',
              {'id': 'merica', 'en': 'pepper'}),
          GuideExample('minyak goreng',
              {'id': 'minyak goreng', 'en': 'cooking oil'}),
          GuideExample('kecap',
              {'id': 'kecap', 'en': 'soy sauce'}),
          GuideExample('bawang putih',
              {'id': 'bawang putih', 'en': 'garlic'}),
          GuideExample('Tambahkan sedikit garam',
              {'id': 'Tambahkan sedikit garam', 'en': 'Add a little salt'}),
          GuideExample('Sup ini kurang merica',
              {'id': 'Sup ini kurang merica', 'en': 'This soup needs more pepper'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'Peralatan Dapur', 'en': 'Kitchen Tools'},
        examples: const [
          GuideExample('pisau',
              {'id': 'pisau', 'en': 'knife'}),
          GuideExample('panci',
              {'id': 'panci', 'en': 'pot'}),
          GuideExample('wajan',
              {'id': 'wajan', 'en': 'frying pan'}),
          GuideExample('piring',
              {'id': 'piring', 'en': 'plate'}),
          GuideExample('gelas',
              {'id': 'gelas', 'en': 'glass'}),
          GuideExample('sendok',
              {'id': 'sendok', 'en': 'spoon'}),
          GuideExample('Potong sayuran dengan pisau',
              {'id': 'Potong sayuran dengan pisau', 'en': 'Cut the vegetables with a knife'}),
          GuideExample('Piringnya ada di atas meja',
              {'id': 'Piringnya ada di atas meja', 'en': 'The plates are on the table'}),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'id_vocab_tools',
    emoji: '🔨',
    title: const {'id': 'Perkakas & Konstruksi', 'en': 'Tools & Construction'},
    subtitle: const {
      'id': '18 kosakata + contoh kalimat, ketuk untuk dengar',
      'en': '18 words + example sentences, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Perkakas', 'en': 'Tools'},
        examples: const [
          GuideExample('palu',
              {'id': 'palu', 'en': 'hammer'}),
          GuideExample('paku',
              {'id': 'paku', 'en': 'nail'}),
          GuideExample('sekrup',
              {'id': 'sekrup', 'en': 'screw'}),
          GuideExample('obeng',
              {'id': 'obeng', 'en': 'screwdriver'}),
          GuideExample('gergaji',
              {'id': 'gergaji', 'en': 'saw'}),
          GuideExample('tangga lipat',
              {'id': 'tangga lipat', 'en': 'ladder'}),
          GuideExample('Pukul paku dengan palu',
              {'id': 'Pukul paku dengan palu', 'en': 'Hit the nail with a hammer'}),
          GuideExample('Dia memotong kayu dengan gergaji',
              {'id': 'Dia memotong kayu dengan gergaji', 'en': 'He cuts the wood with a saw'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'Di Lokasi Bangunan', 'en': 'At the Site'},
        examples: const [
          GuideExample('konstruksi',
              {'id': 'konstruksi', 'en': 'construction'}),
          GuideExample('pekerja',
              {'id': 'pekerja', 'en': 'worker'}),
          GuideExample('helm',
              {'id': 'helm', 'en': 'helmet'}),
          GuideExample('mesin',
              {'id': 'mesin', 'en': 'machine'}),
          GuideExample('bata',
              {'id': 'bata', 'en': 'brick'}),
          GuideExample('semen',
              {'id': 'semen', 'en': 'cement'}),
          GuideExample('Harap pakai helm di sini',
              {'id': 'Harap pakai helm di sini', 'en': 'Please wear a helmet here'}),
          GuideExample('Para pekerja membangun sekolah baru',
              {'id': 'Para pekerja membangun sekolah baru', 'en': 'The workers build a new school'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'Membangun', 'en': 'Building'},
        examples: const [
          GuideExample('membangun',
              {'id': 'membangun', 'en': 'to build'}),
          GuideExample('memperbaiki',
              {'id': 'memperbaiki', 'en': 'to fix'}),
          GuideExample('rusak',
              {'id': 'rusak', 'en': 'broken'}),
          GuideExample('cat',
              {'id': 'cat', 'en': 'paint'}),
          GuideExample('kayu',
              {'id': 'kayu', 'en': 'wood'}),
          GuideExample('tembok',
              {'id': 'tembok', 'en': 'wall'}),
          GuideExample('Mereka membangun rumah',
              {'id': 'Mereka membangun rumah', 'en': 'They build houses'}),
          GuideExample('Ayah saya memperbaiki atap',
              {'id': 'Ayah saya memperbaiki atap', 'en': 'My father fixes the roof'}),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'id_vocab_economy',
    emoji: '💹',
    title: const {'id': 'Ekonomi & Bank', 'en': 'Economy & Banking'},
    subtitle: const {
      'id': '18 kosakata + contoh kalimat, ketuk untuk dengar',
      'en': '18 words + example sentences, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Di Bank', 'en': 'At the Bank'},
        examples: const [
          GuideExample('rekening bank',
              {'id': 'rekening bank', 'en': 'bank account'}),
          GuideExample('tabungan',
              {'id': 'tabungan', 'en': 'savings'}),
          GuideExample('menarik uang',
              {'id': 'menarik uang', 'en': 'to withdraw'}),
          GuideExample('menyetor',
              {'id': 'menyetor', 'en': 'to deposit'}),
          GuideExample('transfer',
              {'id': 'transfer', 'en': 'transfer'}),
          GuideExample('bunga bank',
              {'id': 'bunga bank', 'en': 'interest'}),
          GuideExample('Saya membuka rekening bank',
              {'id': 'Saya membuka rekening bank', 'en': 'I open a bank account'}),
          GuideExample('Dia menarik uang di ATM',
              {'id': 'Dia menarik uang di ATM', 'en': 'She withdraws money at the ATM'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'Ekonomi', 'en': 'The Economy'},
        examples: const [
          GuideExample('ekonomi',
              {'id': 'ekonomi', 'en': 'economy'}),
          GuideExample('pasar',
              {'id': 'pasar', 'en': 'market'}),
          GuideExample('pajak',
              {'id': 'pajak', 'en': 'tax'}),
          GuideExample('harga',
              {'id': 'harga', 'en': 'price'}),
          GuideExample('diskon',
              {'id': 'diskon', 'en': 'discount'}),
          GuideExample('saham',
              {'id': 'saham', 'en': 'stock'}),
          GuideExample('Harga naik setiap tahun',
              {'id': 'Harga naik setiap tahun', 'en': 'Prices go up every year'}),
          GuideExample('Toko ini memberi diskon besar',
              {'id': 'Toko ini memberi diskon besar', 'en': 'This shop gives a big discount'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'Jual Beli', 'en': 'Trade'},
        examples: const [
          GuideExample('ekspor',
              {'id': 'ekspor', 'en': 'export'}),
          GuideExample('impor',
              {'id': 'impor', 'en': 'import'}),
          GuideExample('perdagangan',
              {'id': 'perdagangan', 'en': 'trade'}),
          GuideExample('untung',
              {'id': 'untung', 'en': 'profit'}),
          GuideExample('rugi',
              {'id': 'rugi', 'en': 'loss'}),
          GuideExample('pelanggan',
              {'id': 'pelanggan', 'en': 'customer'}),
          GuideExample('Indonesia mengekspor kopi',
              {'id': 'Indonesia mengekspor kopi', 'en': 'Indonesia exports coffee'}),
          GuideExample('Pelanggan selalu benar',
              {'id': 'Pelanggan selalu benar', 'en': 'The customer is always right'}),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'id_vocab_science',
    emoji: '🔬',
    title: const {'id': 'Sains & Antariksa', 'en': 'Science & Space'},
    subtitle: const {
      'id': '18 kosakata + contoh kalimat, ketuk untuk dengar',
      'en': '18 words + example sentences, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Sains Dasar', 'en': 'Basic Science'},
        examples: const [
          GuideExample('sains',
              {'id': 'sains', 'en': 'science'}),
          GuideExample('eksperimen',
              {'id': 'eksperimen', 'en': 'experiment'}),
          GuideExample('penelitian',
              {'id': 'penelitian', 'en': 'research'}),
          GuideExample('penemuan',
              {'id': 'penemuan', 'en': 'discovery'}),
          GuideExample('laboratorium',
              {'id': 'laboratorium', 'en': 'laboratory'}),
          GuideExample('matematika',
              {'id': 'matematika', 'en': 'mathematics'}),
          GuideExample('Kami melakukan eksperimen di sekolah',
              {'id': 'Kami melakukan eksperimen di sekolah', 'en': 'We do an experiment at school'}),
          GuideExample('Matematika pelajaran favorit saya',
              {'id': 'Matematika pelajaran favorit saya', 'en': 'Math is my favorite subject'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'Luar Angkasa', 'en': 'Outer Space'},
        examples: const [
          GuideExample('luar angkasa',
              {'id': 'luar angkasa', 'en': 'space'}),
          GuideExample('bumi',
              {'id': 'bumi', 'en': 'the Earth'}),
          GuideExample('planet',
              {'id': 'planet', 'en': 'planet'}),
          GuideExample('roket',
              {'id': 'roket', 'en': 'rocket'}),
          GuideExample('astronaut',
              {'id': 'astronaut', 'en': 'astronaut'}),
          GuideExample('bintang jatuh',
              {'id': 'bintang jatuh', 'en': 'shooting star'}),
          GuideExample('Bumi adalah planet',
              {'id': 'Bumi adalah planet', 'en': 'The Earth is a planet'}),
          GuideExample('Roket terbang ke luar angkasa',
              {'id': 'Roket terbang ke luar angkasa', 'en': 'The rocket flies to space'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'Mengukur', 'en': 'Measuring'},
        examples: const [
          GuideExample('mengukur',
              {'id': 'mengukur', 'en': 'to measure'}),
          GuideExample('panjang',
              {'id': 'panjang', 'en': 'length'}),
          GuideExample('berat',
              {'id': 'berat', 'en': 'weight'}),
          GuideExample('kecepatan',
              {'id': 'kecepatan', 'en': 'speed'}),
          GuideExample('suhu',
              {'id': 'suhu', 'en': 'temperature'}),
          GuideExample('baterai',
              {'id': 'baterai', 'en': 'battery'}),
          GuideExample('Saya mengukur suhu',
              {'id': 'Saya mengukur suhu', 'en': 'I measure the temperature'}),
          GuideExample('Baterainya habis',
              {'id': 'Baterainya habis', 'en': 'The battery is empty'}),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'id_vocab_industry',
    emoji: '🏭',
    title: const {'id': 'Industri & Pabrik', 'en': 'Industry & Factory'},
    subtitle: const {
      'id': '18 kosakata + contoh kalimat, ketuk untuk dengar',
      'en': '18 words + example sentences, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Di Pabrik', 'en': 'At the Factory'},
        examples: const [
          GuideExample('pabrik',
              {'id': 'pabrik', 'en': 'factory'}),
          GuideExample('produk',
              {'id': 'produk', 'en': 'product'}),
          GuideExample('robot',
              {'id': 'robot', 'en': 'robot'}),
          GuideExample('suku cadang',
              {'id': 'suku cadang', 'en': 'parts'}),
          GuideExample('lini produksi',
              {'id': 'lini produksi', 'en': 'production line'}),
          GuideExample('inspeksi',
              {'id': 'inspeksi', 'en': 'inspection'}),
          GuideExample('Pabrik ini membuat mobil',
              {'id': 'Pabrik ini membuat mobil', 'en': 'This factory makes cars'}),
          GuideExample('Robot bekerja siang dan malam',
              {'id': 'Robot bekerja siang dan malam', 'en': 'Robots work day and night'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'Produksi', 'en': 'Production'},
        examples: const [
          GuideExample('produksi',
              {'id': 'produksi', 'en': 'production'}),
          GuideExample('kualitas',
              {'id': 'kualitas', 'en': 'quality'}),
          GuideExample('efisiensi',
              {'id': 'efisiensi', 'en': 'efficiency'}),
          GuideExample('keselamatan',
              {'id': 'keselamatan', 'en': 'safety'}),
          GuideExample('peringatan',
              {'id': 'peringatan', 'en': 'warning'}),
          GuideExample('istirahat',
              {'id': 'istirahat', 'en': 'break'}),
          GuideExample('Kualitasnya sangat bagus',
              {'id': 'Kualitasnya sangat bagus', 'en': 'The quality is very good'}),
          GuideExample('Ayo istirahat sebentar',
              {'id': 'Ayo istirahat sebentar', 'en': 'Let\'s take a short break'}),
        ],
      ),
      GuideSection(
        title: const {'id': 'Energi', 'en': 'Energy'},
        examples: const [
          GuideExample('energi',
              {'id': 'energi', 'en': 'energy'}),
          GuideExample('minyak bumi',
              {'id': 'minyak bumi', 'en': 'oil'}),
          GuideExample('gas',
              {'id': 'gas', 'en': 'gas'}),
          GuideExample('tenaga surya',
              {'id': 'tenaga surya', 'en': 'solar power'}),
          GuideExample('listrik',
              {'id': 'listrik', 'en': 'electricity'}),
          GuideExample('sumber daya',
              {'id': 'sumber daya', 'en': 'resources'}),
          GuideExample('Listriknya dari tenaga surya',
              {'id': 'Listriknya dari tenaga surya', 'en': 'The electricity comes from solar power'}),
          GuideExample('Kita harus menghemat energi',
              {'id': 'Kita harus menghemat energi', 'en': 'We must save energy'}),
        ],
      ),
    ],
  ),
];

// ===================== BAHASA KOREA =====================

final List<GuideTopic> _korean = [
  GuideTopic(
    id: 'hangul',
    emoji: '한',
    title: const {'id': 'Hangul', 'en': 'Hangul'},
    subtitle: const {
      'id': 'Vokal & konsonan dasar, ketuk untuk dengar',
      'en': 'Basic vowels & consonants, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Vokal Dasar', 'en': 'Basic Vowels'},
        body: const {
          'id': 'Hangul ditulis per suku kata: konsonan + vokal '
              'digabung menjadi satu blok. Contoh: ㅎ + ㅏ + ㄴ = 한 (han).',
          'en': 'Hangul is written in syllable blocks: consonant + '
              'vowel combine into one block. Example: ㅎ + ㅏ + ㄴ = 한 (han).',
        },
        kana: _kana('''
ㅏ:a ㅑ:ya ㅓ:eo ㅕ:yeo ㅗ:o
ㅛ:yo ㅜ:u ㅠ:yu ㅡ:eu ㅣ:i
'''),
      ),
      GuideSection(
        title: const {'id': 'Konsonan Dasar', 'en': 'Basic Consonants'},
        kana: _kana('''
ㄱ:g ㄴ:n ㄷ:d ㄹ:r ㅁ:m
ㅂ:b ㅅ:s ㅇ:ng ㅈ:j ㅊ:ch
ㅋ:k ㅌ:t ㅍ:p ㅎ:h
'''),
      ),
      GuideSection(
        title: const {'id': 'Vokal Gabungan', 'en': 'Compound Vowels'},
        kana: _kana('''
ㅐ:ae ㅔ:e ㅘ:wa ㅝ:wo ㅚ:oe ㅟ:wi ㅢ:ui
'''),
      ),
      GuideSection(
        title: const {'id': 'Konsonan Ganda', 'en': 'Double Consonants'},
        kana: _kana('''
ㄲ:kk ㄸ:tt ㅃ:pp ㅆ:ss ㅉ:jj
'''),
      ),
    ],
  ),
  GuideTopic(
    id: 'ko_phrases',
    emoji: '🙏',
    title: const {'id': 'Frasa Dasar', 'en': 'Basic Phrases'},
    subtitle: const {
      'id': 'Ungkapan sehari-hari yang paling sering dipakai',
      'en': 'The most common everyday expressions',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Sapaan & Sopan Santun', 'en': 'Greetings & Politeness'},
        examples: const [
          GuideExample('안녕하세요',
              {'id': 'halo / apa kabar', 'en': 'hello'},
              romaji: 'annyeonghaseyo'),
          GuideExample('감사합니다',
              {'id': 'terima kasih', 'en': 'thank you'},
              romaji: 'gamsahamnida'),
          GuideExample('죄송합니다',
              {'id': 'maaf', 'en': 'I am sorry'},
              romaji: 'joesonghamnida'),
          GuideExample('실례합니다',
              {'id': 'permisi', 'en': 'excuse me'},
              romaji: 'sillyehamnida'),
          GuideExample('만나서 반가워요',
              {'id': 'senang bertemu denganmu', 'en': 'nice to meet you'},
              romaji: 'mannaseo bangawoyo'),
          GuideExample('네',
              {'id': 'ya', 'en': 'yes'}, romaji: 'ne'),
          GuideExample('아니요',
              {'id': 'tidak', 'en': 'no'}, romaji: 'aniyo'),
          GuideExample('몰라요',
              {'id': 'saya tidak tahu', 'en': 'I do not know'},
              romaji: 'mollayo'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'ko_particles',
    emoji: '🧩',
    title: const {'id': 'Partikel Dasar', 'en': 'Basic Particles'},
    subtitle: const {
      'id': '은/는, 이/가, 을/를, 에 — penanda peran kata',
      'en': '은/는, 이/가, 을/를, 에 — role markers',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Partikel Topik & Subjek', 'en': 'Topic & Subject'},
        body: const {
          'id': '은/는 menandai topik kalimat; 이/가 menandai subjek. '
              'Pilih 은/이 setelah konsonan, 는/가 setelah vokal.',
          'en': '은/는 marks the topic; 이/가 marks the subject. '
              'Use 은/이 after a consonant, 는/가 after a vowel.',
        },
        examples: const [
          GuideExample('저는 학생이에요',
              {'id': 'Saya (adalah) pelajar', 'en': 'I am a student'},
              romaji: 'jeoneun haksaengieyo'),
          GuideExample('사과가 빨개요',
              {'id': 'Apelnya merah', 'en': 'The apple is red'},
              romaji: 'sagwaga ppalgaeyo'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Partikel Objek & Tempat', 'en': 'Object & Place'},
        body: const {
          'id': '을/를 menandai objek; 에 menandai tujuan/waktu; '
              '에서 menandai tempat aksi berlangsung.',
          'en': '을/를 marks the object; 에 marks destination/time; '
              '에서 marks where an action happens.',
        },
        examples: const [
          GuideExample('밥을 먹어요',
              {'id': 'Makan nasi', 'en': 'I eat rice'},
              romaji: 'babeul meogeoyo'),
          GuideExample('학교에 가요',
              {'id': 'Pergi ke sekolah', 'en': 'I go to school'},
              romaji: 'hakgyoe gayo'),
          GuideExample('집에서 공부해요',
              {'id': 'Belajar di rumah', 'en': 'I study at home'},
              romaji: 'jibeseo gongbuhaeyo'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'ko_numbers',
    emoji: '🔢',
    title: const {'id': 'Angka Korea', 'en': 'Korean Numbers'},
    subtitle: const {
      'id': 'Dua sistem angka: asli Korea & Sino-Korea',
      'en': 'Two number systems: native Korean & Sino-Korean',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Angka Asli Korea (1-10)', 'en': 'Native Korean (1-10)'},
        body: const {
          'id': 'Dipakai untuk menghitung benda, umur, dan jam.',
          'en': 'Used for counting objects, age, and hours.',
        },
        kana: _kana('''
하나:hana 둘:dul 셋:set 넷:net 다섯:daseot
여섯:yeoseot 일곱:ilgop 여덟:yeodeol 아홉:ahop 열:yeol
'''),
      ),
      GuideSection(
        title: const {'id': 'Angka Sino-Korea (1-10)', 'en': 'Sino-Korean (1-10)'},
        body: const {
          'id': 'Dipakai untuk tanggal, uang, nomor telepon, dan menit.',
          'en': 'Used for dates, money, phone numbers, and minutes.',
        },
        kana: _kana('''
일:il 이:i 삼:sam 사:sa 오:o
육:yuk 칠:chil 팔:pal 구:gu 십:sip
'''),
      ),
    ],
  ),
];

// ===================== BAHASA JERMAN =====================

final List<GuideTopic> _german = [
  GuideTopic(
    id: 'de_articles',
    emoji: '📦',
    title: const {'id': 'Artikel der/die/das', 'en': 'Articles der/die/das'},
    subtitle: const {
      'id': 'Tiga jenis kata benda: maskulin, feminin, netral',
      'en': 'Three noun genders: masculine, feminine, neuter',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Tiga Artikel', 'en': 'The Three Articles'},
        body: const {
          'id': 'Setiap kata benda Jerman punya jenis: der (maskulin), '
              'die (feminin), das (netral). Bentuk jamak selalu die. '
              'Hafalkan artikel bersama kata bendanya!',
          'en': 'Every German noun has a gender: der (masculine), '
              'die (feminine), das (neuter). Plural is always die. '
              'Memorize the article together with the noun!',
        },
        examples: const [
          GuideExample('der Mann',
              {'id': 'pria (maskulin)', 'en': 'the man (masculine)'},
              romaji: 'der man'),
          GuideExample('die Frau',
              {'id': 'wanita (feminin)', 'en': 'the woman (feminine)'},
              romaji: 'di frau'),
          GuideExample('das Kind',
              {'id': 'anak (netral)', 'en': 'the child (neuter)'},
              romaji: 'das kint'),
          GuideExample('die Kinder',
              {'id': 'anak-anak (jamak)', 'en': 'the children (plural)'},
              romaji: 'di kin-der'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'de_pronouns',
    emoji: '👤',
    title: const {'id': 'Kata Ganti & sein/haben', 'en': 'Pronouns & sein/haben'},
    subtitle: const {
      'id': 'ich, du, er/sie/es + kata kerja "adalah" dan "punya"',
      'en': 'ich, du, er/sie/es + "to be" and "to have"',
    },
    sections: [
      GuideSection(
        title: const {'id': 'sein (adalah)', 'en': 'sein (to be)'},
        examples: const [
          GuideExample('ich bin',
              {'id': 'saya adalah', 'en': 'I am'}, romaji: 'ikh bin'),
          GuideExample('du bist',
              {'id': 'kamu adalah', 'en': 'you are'}, romaji: 'du bist'),
          GuideExample('er ist',
              {'id': 'dia (laki-laki) adalah', 'en': 'he is'},
              romaji: 'er ist'),
          GuideExample('sie ist',
              {'id': 'dia (perempuan) adalah', 'en': 'she is'},
              romaji: 'zi ist'),
          GuideExample('wir sind',
              {'id': 'kami adalah', 'en': 'we are'}, romaji: 'vir zint'),
          GuideExample('sie sind',
              {'id': 'mereka adalah', 'en': 'they are'},
              romaji: 'zi zint'),
        ],
      ),
      GuideSection(
        title: const {'id': 'haben (punya)', 'en': 'haben (to have)'},
        examples: const [
          GuideExample('ich habe',
              {'id': 'saya punya', 'en': 'I have'}, romaji: 'ikh ha-be'),
          GuideExample('du hast',
              {'id': 'kamu punya', 'en': 'you have'}, romaji: 'du hast'),
          GuideExample('er hat',
              {'id': 'dia punya', 'en': 'he has'}, romaji: 'er hat'),
          GuideExample('wir haben',
              {'id': 'kami punya', 'en': 'we have'},
              romaji: 'vir ha-ben'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'de_present',
    emoji: '⏰',
    title: const {'id': 'Kalimat Sekarang', 'en': 'Present Tense'},
    subtitle: const {
      'id': 'Akhiran kata kerja: -e, -st, -t, -en',
      'en': 'Verb endings: -e, -st, -t, -en',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Pola Dasar', 'en': 'Basic Pattern'},
        body: const {
          'id': 'Kata kerja berubah mengikuti subjek: ich lerne, '
              'du lernst, er lernt, wir lernen.',
          'en': 'Verbs change with the subject: ich lerne, '
              'du lernst, er lernt, wir lernen.',
        },
        examples: const [
          GuideExample('Ich lerne Deutsch',
              {'id': 'Saya belajar bahasa Jerman', 'en': 'I learn German'},
              romaji: 'ikh ler-ne doitsy'),
          GuideExample('Du trinkst Wasser',
              {'id': 'Kamu minum air', 'en': 'You drink water'},
              romaji: 'du tringkst va-ser'),
          GuideExample('Er arbeitet heute',
              {'id': 'Dia bekerja hari ini', 'en': 'He works today'},
              romaji: 'er ar-bai-tet hoi-te'),
          GuideExample('Wir gehen zur Schule',
              {'id': 'Kami pergi ke sekolah', 'en': 'We go to school'},
              romaji: 'vir ge-en tsur syu-le'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'de_phrases',
    emoji: '🙏',
    title: const {'id': 'Frasa Dasar', 'en': 'Basic Phrases'},
    subtitle: const {
      'id': 'Ungkapan sehari-hari yang paling sering dipakai',
      'en': 'The most common everyday expressions',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Percakapan Sehari-hari', 'en': 'Everyday Conversation'},
        examples: const [
          GuideExample('Wie geht es dir?',
              {'id': 'Apa kabar?', 'en': 'How are you?'},
              romaji: 'vi geyt es dir'),
          GuideExample('Mir geht es gut',
              {'id': 'Kabar saya baik', 'en': 'I am fine'},
              romaji: 'mir geyt es gut'),
          GuideExample('Entschuldigung',
              {'id': 'maaf / permisi', 'en': 'sorry / excuse me'},
              romaji: 'ent-syul-di-gung'),
          GuideExample('Wie heißt du?',
              {'id': 'Siapa namamu?', 'en': 'What is your name?'},
              romaji: 'vi haist du'),
          GuideExample('Ich verstehe nicht',
              {'id': 'Saya tidak mengerti', 'en': 'I do not understand'},
              romaji: 'ikh fer-syte-e nikht'),
          GuideExample('Freut mich',
              {'id': 'Senang bertemu denganmu', 'en': 'Nice to meet you'},
              romaji: 'froit mikh'),
          GuideExample('Bis morgen',
              {'id': 'Sampai besok', 'en': 'See you tomorrow'},
              romaji: 'bis mor-gen'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'de_numbers',
    emoji: '🔢',
    title: const {'id': 'Angka', 'en': 'Numbers'},
    subtitle: const {
      'id': '1-12, puluhan, dan ratusan',
      'en': '1-12, tens, and hundreds',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Angka 1-12', 'en': 'Numbers 1-12'},
        kana: _kana('''
eins:ains zwei:tsvai drei:drai vier:fir fünf:fünf sechs:zeks
sieben:zi-ben acht:akht neun:noin zehn:tseen elf:elf zwölf:tsvölf
'''),
      ),
      GuideSection(
        title: const {'id': 'Puluhan & Ratusan', 'en': 'Tens & Hundreds'},
        examples: const [
          GuideExample('zwanzig',
              {'id': 'dua puluh', 'en': 'twenty'}, romaji: 'tsvan-tsikh'),
          GuideExample('dreißig',
              {'id': 'tiga puluh', 'en': 'thirty'}, romaji: 'drai-sikh'),
          GuideExample('hundert',
              {'id': 'seratus', 'en': 'one hundred'}, romaji: 'hun-dert'),
          GuideExample('einundzwanzig',
              {'id': 'dua puluh satu (satu-dan-dua-puluh!)',
               'en': 'twenty-one (one-and-twenty!)'},
              romaji: 'ain-unt-tsvan-tsikh'),
        ],
      ),
    ],
  ),
];
