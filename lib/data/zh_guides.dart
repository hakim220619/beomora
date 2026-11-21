import '../models/guide.dart';
import 'zh_grammar_guides.dart';

// ===================== BAHASA MANDARIN =====================
// Materi Belajar kursus Mandarin (tingkat HSK 1): pinyin & nada, frasa
// dasar, angka, dan pola kalimat dasar. Kosakata HSK 1 per tema ada di
// hsk_vocab.dart (ditampilkan di bawah kartu Kosakata).

/// `hanzi:pinyin` dipisah spasi/baris → grid yang bisa diketuk (TTS
/// membacakan hanzinya).
List<KanaItem> _grid(String s) => s.trim().split(RegExp(r'\s+')).map((e) {
  final i = e.indexOf(':');
  return KanaItem(e.substring(0, i), e.substring(i + 1));
}).toList();

final List<GuideTopic> zhGuideTopics = [
  GuideTopic(
    id: 'pinyin',
    emoji: '拼',
    title: const {'id': 'Pinyin & Nada', 'en': 'Pinyin & Tones'},
    subtitle: const {
      'id': '4 nada + bunyi awal & akhir, ketuk untuk dengar',
      'en': '4 tones + initials & finals, tap to listen',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Empat Nada', 'en': 'The Four Tones'},
        body: const {
          'id':
              'Pinyin adalah ejaan Latin untuk bunyi Mandarin. Satu suku '
              'kata bisa berarti lain kalau nadanya beda: '
              'mā (datar tinggi) = ibu, má (naik) = rami, '
              'mǎ (turun-naik) = kuda, mà (turun tajam) = memarahi. '
              'Tanpa tanda = nada netral (ringan & pendek), mis. ma partikel tanya.',
          'en':
              'Pinyin is the Latin spelling of Mandarin sounds. The same '
              'syllable means something else with another tone: '
              'mā (high level) = mother, má (rising) = hemp, '
              'mǎ (dipping) = horse, mà (falling) = to scold. '
              'No mark = neutral tone (light & short), e.g. the question particle ma.',
        },
        kana: _grid('妈:mā 麻:má 马:mǎ 骂:mà 吗:ma'),
      ),
      GuideSection(
        title: const {'id': 'Bunyi Awal (Inisial)', 'en': 'Initials'},
        body: const {
          'id':
              'Perhatikan bunyi yang beda dari bahasa Indonesia: '
              'q ≈ "c" (qī = ci), x ≈ "s" tipis (xī), j ≈ "j" (jī), '
              'zh/ch/sh = lidah melengkung ke belakang, '
              'z ≈ "dz", c ≈ "ts" (cì), r ≈ antara "r" dan "j".',
          'en':
              'Watch the sounds that differ from English: q ≈ "ch" (qī), '
              'x ≈ a soft "sh" (xī), zh/ch/sh = tongue curled back, '
              'z ≈ "dz", c ≈ "ts" (cì), r ≈ between "r" and "zh".',
        },
        kana: _grid('''
八:bā 怕:pà 买:mǎi 发:fā 大:dà
他:tā 那:nà 拉:lā 哥:gē 可:kě
喝:hē 鸡:jī 七:qī 西:xī 知:zhī
吃:chī 是:shì 日:rì 字:zì 次:cì
四:sì
'''),
      ),
      GuideSection(
        title: const {'id': 'Bunyi Akhir (Final)', 'en': 'Finals'},
        body: const {
          'id':
              'ü dibaca seperti "i" dengan bibir bulat (yú = ikan). '
              'Setelah j, q, x, y titik ü dihilangkan: ju, qu, xu, yu tetap '
              'dibaca ü. e dibaca seperti "e" pada "emas" yang ditahan.',
          'en':
              'ü sounds like "ee" with rounded lips (yú = fish). After j, '
              'q, x, y the dots are dropped: ju, qu, xu, yu are still ü. '
              'e is a "uh" sound made further back.',
        },
        kana: _grid('''
啊:a 饿:è 衣:yī 五:wǔ 鱼:yú
爱:ài 黑:hēi 好:hǎo 走:zǒu 安:ān
门:mén 忙:máng 冷:lěng 东:dōng 月:yuè
'''),
      ),
      GuideSection(
        title: const {'id': 'Perubahan Nada', 'en': 'Tone Changes'},
        body: const {
          'id':
              'Dua nada 3 berurutan: yang pertama dibaca nada 2 '
              '(nǐ hǎo → ní hǎo). 不 bù jadi bú sebelum nada 4 (bú shì). '
              '一 yī jadi yí sebelum nada 4 (yíxià) dan yì sebelum nada '
              'lain (yìqǐ). Kamus menulis nada asli; di aplikasi ini 一 '
              'dan 不 ditulis sesuai bunyinya.',
          'en':
              'Two 3rd tones in a row: the first becomes a 2nd tone '
              '(nǐ hǎo → ní hǎo). 不 bù becomes bú before a 4th tone '
              '(bú shì). 一 yī becomes yí before a 4th tone (yíxià) and '
              'yì before other tones (yìqǐ). This app writes 一 and 不 '
              'as they are spoken.',
        },
        examples: const [
          GuideExample('你好', {
            'id': 'halo (dibaca ní hǎo)',
            'en': 'hello (said ní hǎo)',
          }, romaji: 'nǐ hǎo'),
          GuideExample('不是', {'id': 'bukan', 'en': 'is not'}, romaji: 'bú shì'),
          GuideExample('一起', {
            'id': 'bersama',
            'en': 'together',
          }, romaji: 'yìqǐ'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'zh_phrases',
    emoji: '🙏',
    title: const {'id': 'Frasa Dasar', 'en': 'Basic Phrases'},
    subtitle: const {
      'id': 'Ungkapan sehari-hari yang paling sering dipakai',
      'en': 'The most common everyday expressions',
    },
    sections: [
      GuideSection(
        title: const {
          'id': 'Sapaan & Sopan Santun',
          'en': 'Greetings & Politeness',
        },
        examples: const [
          GuideExample('你好', {'id': 'halo', 'en': 'hello'}, romaji: 'nǐ hǎo'),
          GuideExample('您好', {
            'id': 'halo (sopan)',
            'en': 'hello (polite)',
          }, romaji: 'nín hǎo'),
          GuideExample('早上好', {
            'id': 'selamat pagi',
            'en': 'good morning',
          }, romaji: 'zǎoshang hǎo'),
          GuideExample('谢谢', {
            'id': 'terima kasih',
            'en': 'thank you',
          }, romaji: 'xièxie'),
          GuideExample('不客气', {
            'id': 'sama-sama',
            'en': 'you\'re welcome',
          }, romaji: 'bú kèqi'),
          GuideExample('对不起', {'id': 'maaf', 'en': 'sorry'}, romaji: 'duìbuqǐ'),
          GuideExample('没关系', {
            'id': 'tidak apa-apa',
            'en': 'it doesn\'t matter',
          }, romaji: 'méi guānxi'),
          GuideExample('再见', {
            'id': 'sampai jumpa',
            'en': 'goodbye',
          }, romaji: 'zàijiàn'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Perkenalan', 'en': 'Introductions'},
        examples: const [
          GuideExample('你叫什么名字', {
            'id': 'siapa namamu?',
            'en': 'what is your name?',
          }, romaji: 'nǐ jiào shénme míngzi'),
          GuideExample('我叫达尼', {
            'id': 'nama saya Dani',
            'en': 'my name is Dani',
          }, romaji: 'wǒ jiào Dání'),
          GuideExample('我是印度尼西亚人', {
            'id': 'saya orang Indonesia',
            'en': 'I am Indonesian',
          }, romaji: 'wǒ shì Yìndùníxīyà rén'),
          GuideExample('认识你很高兴', {
            'id': 'senang berkenalan denganmu',
            'en': 'nice to meet you',
          }, romaji: 'rènshi nǐ hěn gāoxìng'),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Saat Belajar & Bertanya',
          'en': 'While Learning & Asking',
        },
        examples: const [
          GuideExample('我不懂', {
            'id': 'saya tidak paham',
            'en': 'I don\'t understand',
          }, romaji: 'wǒ bù dǒng'),
          GuideExample('请再说一遍', {
            'id': 'tolong ulangi sekali lagi',
            'en': 'please say it again',
          }, romaji: 'qǐng zài shuō yí biàn'),
          GuideExample('请说慢一点儿', {
            'id': 'tolong bicara lebih pelan',
            'en': 'please speak more slowly',
          }, romaji: 'qǐng shuō màn yìdiǎnr'),
          GuideExample('这个多少钱', {
            'id': 'ini berapa harganya?',
            'en': 'how much is this?',
          }, romaji: 'zhège duōshao qián'),
          GuideExample('洗手间在哪儿', {
            'id': 'toilet di mana?',
            'en': 'where is the restroom?',
          }, romaji: 'xǐshǒujiān zài nǎr'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'zh_numbers',
    emoji: '🔢',
    title: const {'id': 'Angka Mandarin', 'en': 'Chinese Numbers'},
    subtitle: const {
      'id': '0–10, puluhan, ratusan & 万 (sepuluh ribu)',
      'en': '0–10, tens, hundreds & 万 (ten thousand)',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Angka 0–10', 'en': 'Numbers 0–10'},
        body: const {
          'id':
              'Untuk menghitung benda, "dua" memakai 两 liǎng, bukan 二: '
              '两个人 (dua orang). 二 dipakai saat menyebut angka/urutan: '
              '二月 (Februari), 第二 (kedua).',
          'en':
              'When counting things, "two" is 两 liǎng, not 二: 两个人 '
              '(two people). 二 is used for numbers and order: 二月 '
              '(February), 第二 (second).',
        },
        kana: _grid('''
零:líng 一:yī 二:èr 三:sān 四:sì
五:wǔ 六:liù 七:qī 八:bā 九:jiǔ
十:shí 两:liǎng
'''),
      ),
      GuideSection(
        title: const {'id': 'Puluhan & Lebih Besar', 'en': 'Tens & Beyond'},
        body: const {
          'id':
              'Angka disusun seperti dibaca: 十一 = 11 (sepuluh satu), '
              '二十 = 20 (dua sepuluh), 二十五 = 25. Satuan besar Mandarin '
              'adalah 万 (10.000), jadi 100.000 = 十万 (sepuluh 万).',
          'en':
              'Numbers are built the way they are read: 十一 = 11 (ten '
              'one), 二十 = 20 (two tens), 二十五 = 25. The big unit is 万 '
              '(10,000), so 100,000 = 十万 (ten 万).',
        },
        kana: _grid('''
十一:shíyī 二十:èrshí 二十五:èrshíwǔ 一百:yìbǎi 一千:yìqiān
一万:yíwàn 十万:shíwàn
'''),
      ),
    ],
  ),
  GuideTopic(
    id: 'zh_grammar',
    emoji: '🧩',
    title: const {'id': 'Pola Kalimat Dasar', 'en': 'Basic Sentence Patterns'},
    subtitle: const {
      'id': '是, 吗, 不/没, 的, 很, kata satuan & urutan kata',
      'en': '是, 吗, 不/没, 的, 很, measure words & word order',
    },
    sections: [
      GuideSection(
        title: const {'id': 'A 是 B (adalah)', 'en': 'A 是 B (to be)'},
        body: const {
          'id':
              'Kata kerja tidak berubah bentuk: 我是, 他是, 我们是 sama saja. '
              'Untuk kata sifat jangan pakai 是 (lihat 很).',
          'en':
              'Verbs never change form: 我是, 他是, 我们是 are all the same. '
              'Do not use 是 with adjectives (see 很).',
        },
        examples: const [
          GuideExample('我 是 学生', {
            'id': 'saya pelajar',
            'en': 'I am a student',
          }, romaji: 'wǒ shì xuésheng'),
          GuideExample('他 是 我的 老师', {
            'id': 'dia guru saya',
            'en': 'he is my teacher',
          }, romaji: 'tā shì wǒde lǎoshī'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Pertanyaan dengan 吗', 'en': 'Questions with 吗'},
        body: const {
          'id':
              'Tambahkan 吗 di akhir kalimat berita untuk pertanyaan ya/tidak. '
              'Dengan kata tanya (什么, 谁, 哪儿) tidak perlu 吗.',
          'en':
              'Add 吗 to the end of a statement for a yes/no question. '
              'With question words (什么, 谁, 哪儿) no 吗 is needed.',
        },
        examples: const [
          GuideExample('你 是 中国人 吗', {
            'id': 'kamu orang Tiongkok?',
            'en': 'are you Chinese?',
          }, romaji: 'nǐ shì Zhōngguórén ma'),
          GuideExample('你 喝 什么', {
            'id': 'kamu minum apa?',
            'en': 'what do you drink?',
          }, romaji: 'nǐ hē shénme'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Negasi 不 dan 没', 'en': 'Negation 不 and 没'},
        body: const {
          'id':
              '不 untuk sekarang/kebiasaan/kemauan (我不喝咖啡 = saya tidak '
              'minum kopi). 没 untuk "tidak punya" (没有) dan "belum/tidak '
              'terjadi" di masa lalu (我没去 = saya tidak pergi).',
          'en':
              '不 for present, habits and wishes (我不喝咖啡 = I don\'t '
              'drink coffee). 没 for "not have" (没有) and past events that '
              'didn\'t happen (我没去 = I didn\'t go).',
        },
        examples: const [
          GuideExample('我 不 喝 咖啡', {
            'id': 'saya tidak minum kopi',
            'en': 'I don\'t drink coffee',
          }, romaji: 'wǒ bù hē kāfēi'),
          GuideExample('我 没有 钱', {
            'id': 'saya tidak punya uang',
            'en': 'I have no money',
          }, romaji: 'wǒ méiyǒu qián'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Kepemilikan 的', 'en': 'Possession 的'},
        body: const {
          'id':
              'Pemilik + 的 + benda: 我的书 (buku saya). Untuk keluarga dan '
              'orang dekat 的 sering dihilangkan: 我妈妈 (ibu saya).',
          'en':
              'Owner + 的 + thing: 我的书 (my book). With family and close '
              'people 的 is often dropped: 我妈妈 (my mom).',
        },
        examples: const [
          GuideExample('这 是 我的 书', {
            'id': 'ini buku saya',
            'en': 'this is my book',
          }, romaji: 'zhè shì wǒde shū'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Kata Sifat dengan 很', 'en': 'Adjectives with 很'},
        body: const {
          'id':
              'Kata sifat langsung jadi predikat tanpa 是. 很 biasanya '
              'ditambahkan dan sering tidak berarti "sangat": 我很忙 = saya sibuk.',
          'en':
              'Adjectives act as the predicate without 是. 很 is usually '
              'added and often doesn\'t mean "very": 我很忙 = I am busy.',
        },
        examples: const [
          GuideExample('我 很 忙', {
            'id': 'saya sibuk',
            'en': 'I am busy',
          }, romaji: 'wǒ hěn máng'),
          GuideExample('今天 很 热', {
            'id': 'hari ini panas',
            'en': 'it is hot today',
          }, romaji: 'jīntiān hěn rè'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Kata Satuan', 'en': 'Measure Words'},
        body: const {
          'id':
              'Angka/ini/itu + kata satuan + benda. 个 adalah yang paling '
              'umum; buku memakai 本, gelas memakai 杯.',
          'en':
              'Number/this/that + measure word + noun. 个 is the most '
              'common; books take 本, cups take 杯.',
        },
        examples: const [
          GuideExample('三 个 人', {
            'id': 'tiga orang',
            'en': 'three people',
          }, romaji: 'sān gè rén'),
          GuideExample('两 本 书', {
            'id': 'dua buku',
            'en': 'two books',
          }, romaji: 'liǎng běn shū'),
          GuideExample('一 杯 茶', {
            'id': 'secangkir teh',
            'en': 'a cup of tea',
          }, romaji: 'yì bēi chá'),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Urutan: Siapa–Kapan–Di mana–Apa',
          'en': 'Order: Who–When–Where–What',
        },
        body: const {
          'id':
              'Keterangan waktu dan tempat diletakkan SEBELUM kata kerja, '
              'berbeda dengan bahasa Indonesia.',
          'en': 'Time and place come BEFORE the verb, unlike in English.',
        },
        examples: const [
          GuideExample('我 明天 在 家 学习', {
            'id': 'besok saya belajar di rumah',
            'en': 'I will study at home tomorrow',
          }, romaji: 'wǒ míngtiān zài jiā xuéxí'),
        ],
      ),
    ],
  ),
  // Tata bahasa HSK 1–2 lanjutan — lihat zh_grammar_guides.dart.
  ...zhGrammarTopics,
];
