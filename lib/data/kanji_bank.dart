// Data kanji JLPT (N5/N4): bacaan on/kun, arti, contoh kata — sumber
// Materi Kanji, Tebak Kanji, dan Tulis Huruf. DIBUAT OTOMATIS oleh
// tool/gen_kanji.py; jangan edit manual.
class KanjiWord {
  final String word;
  final String kana;
  final String romaji;
  final Map<String, String> meaning; // {'id':.., 'en':..}
  const KanjiWord(this.word, this.kana, this.romaji, this.meaning);
}

class KanjiEntry {
  final String kanji;

  /// Satu bacaan paling umum (romaji) — tampil di grid & dibacakan.
  final String romaji;
  final List<String> on; // on'yomi (katakana)
  final List<String> kun; // kun'yomi (hiragana, okurigana dalam kurung)
  final Map<String, String> meaning;
  final List<KanjiWord> words;
  const KanjiEntry(
    this.kanji,
    this.romaji,
    this.on,
    this.kun,
    this.meaning,
    this.words,
  );
}

class KanjiSection {
  final Map<String, String> title;
  final Map<String, String>? note;
  final List<KanjiEntry> entries;
  const KanjiSection(this.title, this.note, this.entries);
}

const List<KanjiSection> kanjiN5Sections = [
  KanjiSection(
    {'id': 'Angka & uang', 'en': 'Numbers & money'},
    {
      'id':
          '四 bisa dibaca yon atau shi, 七 nana atau shichi, 九 kyuu atau ku. Dalam percakapan sehari-hari yon dan nana lebih sering dipakai.',
      'en':
          '四 can be read yon or shi, 七 nana or shichi, 九 kyuu or ku. In everyday speech yon and nana are more common.',
    },
    [
      KanjiEntry(
        '一',
        'ichi',
        ['イチ', 'イツ'],
        ['ひと(つ)'],
        {'id': 'satu', 'en': 'one'},
        [
          KanjiWord('一つ', 'ひとつ', 'hitotsu', {
            'id': 'satu (buah)',
            'en': 'one (thing)',
          }),
          KanjiWord('一月', 'いちがつ', 'ichigatsu', {
            'id': 'Januari',
            'en': 'January',
          }),
        ],
      ),
      KanjiEntry(
        '二',
        'ni',
        ['ニ'],
        ['ふた(つ)'],
        {'id': 'dua', 'en': 'two'},
        [
          KanjiWord('二つ', 'ふたつ', 'futatsu', {
            'id': 'dua (buah)',
            'en': 'two (things)',
          }),
          KanjiWord('二月', 'にがつ', 'nigatsu', {
            'id': 'Februari',
            'en': 'February',
          }),
        ],
      ),
      KanjiEntry(
        '三',
        'san',
        ['サン'],
        ['みっ(つ)'],
        {'id': 'tiga', 'en': 'three'},
        [
          KanjiWord('三つ', 'みっつ', 'mittsu', {
            'id': 'tiga (buah)',
            'en': 'three (things)',
          }),
          KanjiWord('三月', 'さんがつ', 'sangatsu', {'id': 'Maret', 'en': 'March'}),
        ],
      ),
      KanjiEntry(
        '四',
        'yon',
        ['シ'],
        ['よん', 'よ', 'よっ(つ)'],
        {'id': 'empat', 'en': 'four'},
        [
          KanjiWord('四つ', 'よっつ', 'yottsu', {
            'id': 'empat (buah)',
            'en': 'four (things)',
          }),
          KanjiWord('四月', 'しがつ', 'shigatsu', {'id': 'April', 'en': 'April'}),
        ],
      ),
      KanjiEntry(
        '五',
        'go',
        ['ゴ'],
        ['いつ(つ)'],
        {'id': 'lima', 'en': 'five'},
        [
          KanjiWord('五つ', 'いつつ', 'itsutsu', {
            'id': 'lima (buah)',
            'en': 'five (things)',
          }),
          KanjiWord('五月', 'ごがつ', 'gogatsu', {'id': 'Mei', 'en': 'May'}),
        ],
      ),
      KanjiEntry(
        '六',
        'roku',
        ['ロク'],
        ['むっ(つ)'],
        {'id': 'enam', 'en': 'six'},
        [
          KanjiWord('六つ', 'むっつ', 'muttsu', {
            'id': 'enam (buah)',
            'en': 'six (things)',
          }),
          KanjiWord('六月', 'ろくがつ', 'rokugatsu', {'id': 'Juni', 'en': 'June'}),
        ],
      ),
      KanjiEntry(
        '七',
        'nana',
        ['シチ'],
        ['なな', 'なな(つ)'],
        {'id': 'tujuh', 'en': 'seven'},
        [
          KanjiWord('七つ', 'ななつ', 'nanatsu', {
            'id': 'tujuh (buah)',
            'en': 'seven (things)',
          }),
          KanjiWord('七月', 'しちがつ', 'shichigatsu', {'id': 'Juli', 'en': 'July'}),
        ],
      ),
      KanjiEntry(
        '八',
        'hachi',
        ['ハチ'],
        ['やっ(つ)'],
        {'id': 'delapan', 'en': 'eight'},
        [
          KanjiWord('八つ', 'やっつ', 'yattsu', {
            'id': 'delapan (buah)',
            'en': 'eight (things)',
          }),
          KanjiWord('八月', 'はちがつ', 'hachigatsu', {
            'id': 'Agustus',
            'en': 'August',
          }),
        ],
      ),
      KanjiEntry(
        '九',
        'kyuu',
        ['キュウ', 'ク'],
        ['ここの(つ)'],
        {'id': 'sembilan', 'en': 'nine'},
        [
          KanjiWord('九つ', 'ここのつ', 'kokonotsu', {
            'id': 'sembilan (buah)',
            'en': 'nine (things)',
          }),
          KanjiWord('九月', 'くがつ', 'kugatsu', {
            'id': 'September',
            'en': 'September',
          }),
        ],
      ),
      KanjiEntry(
        '十',
        'juu',
        ['ジュウ'],
        ['とお'],
        {'id': 'sepuluh', 'en': 'ten'},
        [
          KanjiWord('十日', 'とおか', 'tooka', {
            'id': 'tanggal sepuluh; sepuluh hari',
            'en': 'the 10th (day); ten days',
          }),
          KanjiWord('十月', 'じゅうがつ', 'juugatsu', {
            'id': 'Oktober',
            'en': 'October',
          }),
        ],
      ),
      KanjiEntry(
        '百',
        'hyaku',
        ['ヒャク'],
        [],
        {'id': 'seratus', 'en': 'hundred'},
        [
          KanjiWord('三百円', 'さんびゃくえん', 'sanbyaku en', {
            'id': '300 yen',
            'en': '300 yen',
          }),
          KanjiWord('百人', 'ひゃくにん', 'hyakunin', {
            'id': 'seratus orang',
            'en': 'a hundred people',
          }),
        ],
      ),
      KanjiEntry(
        '千',
        'sen',
        ['セン'],
        ['ち'],
        {'id': 'seribu', 'en': 'thousand'},
        [
          KanjiWord('三千', 'さんぜん', 'sanzen', {
            'id': 'tiga ribu',
            'en': 'three thousand',
          }),
          KanjiWord('千葉', 'ちば', 'chiba', {
            'id': 'Chiba (prefektur)',
            'en': 'Chiba (prefecture)',
          }),
        ],
      ),
      KanjiEntry(
        '万',
        'man',
        ['マン', 'バン'],
        [],
        {'id': 'sepuluh ribu', 'en': 'ten thousand'},
        [
          KanjiWord('一万円', 'いちまんえん', 'ichiman en', {
            'id': '10.000 yen',
            'en': '10,000 yen',
          }),
          KanjiWord('万年筆', 'まんねんひつ', 'mannenhitsu', {
            'id': 'pulpen tinta',
            'en': 'fountain pen',
          }),
        ],
      ),
      KanjiEntry(
        '円',
        'en',
        ['エン'],
        ['まる(い)'],
        {'id': 'yen; lingkaran', 'en': 'yen; circle'},
        [
          KanjiWord('百円', 'ひゃくえん', 'hyakuen', {
            'id': 'seratus yen',
            'en': '100 yen',
          }),
          KanjiWord('円い', 'まるい', 'marui', {'id': 'bulat', 'en': 'round'}),
        ],
      ),
      KanjiEntry(
        '何',
        'nani',
        ['カ'],
        ['なに', 'なん'],
        {'id': 'apa', 'en': 'what'},
        [
          KanjiWord('何時', 'なんじ', 'nanji', {
            'id': 'jam berapa',
            'en': 'what time',
          }),
          KanjiWord('何人', 'なんにん', 'nannin', {
            'id': 'berapa orang',
            'en': 'how many people',
          }),
        ],
      ),
    ],
  ),
  KanjiSection(
    {'id': 'Waktu & hari', 'en': 'Time & days'},
    {
      'id':
          'Nama hari = kanji elemen + 曜日 (youbi): 日 Minggu, 月 Senin, 火 Selasa, 水 Rabu, 木 Kamis, 金 Jumat, 土 Sabtu.',
      'en':
          'Day names = element kanji + 曜日 (youbi): 日 Sunday, 月 Monday, 火 Tuesday, 水 Wednesday, 木 Thursday, 金 Friday, 土 Saturday.',
    },
    [
      KanjiEntry(
        '日',
        'hi',
        ['ニチ', 'ジツ'],
        ['ひ', 'か'],
        {'id': 'hari; matahari', 'en': 'day; sun'},
        [
          KanjiWord('日曜日', 'にちようび', 'nichiyoubi', {
            'id': 'hari Minggu',
            'en': 'Sunday',
          }),
          KanjiWord('三日', 'みっか', 'mikka', {
            'id': 'tanggal tiga; tiga hari',
            'en': 'the 3rd (day); three days',
          }),
        ],
      ),
      KanjiEntry(
        '月',
        'tsuki',
        ['ゲツ', 'ガツ'],
        ['つき'],
        {'id': 'bulan', 'en': 'month; moon'},
        [
          KanjiWord('月曜日', 'げつようび', 'getsuyoubi', {
            'id': 'hari Senin',
            'en': 'Monday',
          }),
          KanjiWord('今月', 'こんげつ', 'kongetsu', {
            'id': 'bulan ini',
            'en': 'this month',
          }),
        ],
      ),
      KanjiEntry(
        '火',
        'hi',
        ['カ'],
        ['ひ'],
        {'id': 'api', 'en': 'fire'},
        [
          KanjiWord('火曜日', 'かようび', 'kayoubi', {
            'id': 'hari Selasa',
            'en': 'Tuesday',
          }),
          KanjiWord('火山', 'かざん', 'kazan', {
            'id': 'gunung berapi',
            'en': 'volcano',
          }),
        ],
      ),
      KanjiEntry(
        '水',
        'mizu',
        ['スイ'],
        ['みず'],
        {'id': 'air', 'en': 'water'},
        [
          KanjiWord('水曜日', 'すいようび', 'suiyoubi', {
            'id': 'hari Rabu',
            'en': 'Wednesday',
          }),
          KanjiWord('水道', 'すいどう', 'suidou', {
            'id': 'saluran air (ledeng)',
            'en': 'water supply',
          }),
        ],
      ),
      KanjiEntry(
        '木',
        'ki',
        ['モク', 'ボク'],
        ['き'],
        {'id': 'pohon; kayu', 'en': 'tree; wood'},
        [
          KanjiWord('木曜日', 'もくようび', 'mokuyoubi', {
            'id': 'hari Kamis',
            'en': 'Thursday',
          }),
          KanjiWord('木の下', 'きのした', 'ki no shita', {
            'id': 'di bawah pohon',
            'en': 'under the tree',
          }),
        ],
      ),
      KanjiEntry(
        '金',
        'kane',
        ['キン'],
        ['かね'],
        {'id': 'uang; emas', 'en': 'money; gold'},
        [
          KanjiWord('金曜日', 'きんようび', 'kinyoubi', {
            'id': 'hari Jumat',
            'en': 'Friday',
          }),
          KanjiWord('お金', 'おかね', 'okane', {'id': 'uang', 'en': 'money'}),
        ],
      ),
      KanjiEntry(
        '土',
        'tsuchi',
        ['ド', 'ト'],
        ['つち'],
        {'id': 'tanah', 'en': 'soil; earth'},
        [
          KanjiWord('土曜日', 'どようび', 'doyoubi', {
            'id': 'hari Sabtu',
            'en': 'Saturday',
          }),
          KanjiWord('土地', 'とち', 'tochi', {
            'id': 'lahan; tanah',
            'en': 'land; plot',
          }),
        ],
      ),
      KanjiEntry(
        '年',
        'toshi',
        ['ネン'],
        ['とし'],
        {'id': 'tahun', 'en': 'year'},
        [
          KanjiWord('一年', 'いちねん', 'ichinen', {
            'id': 'satu tahun',
            'en': 'one year',
          }),
          KanjiWord('年上', 'としうえ', 'toshiue', {
            'id': 'lebih tua (usia)',
            'en': 'older (in age)',
          }),
        ],
      ),
      KanjiEntry(
        '時',
        'toki',
        ['ジ'],
        ['とき'],
        {'id': 'waktu; jam', 'en': 'time; hour'},
        [
          KanjiWord('時計', 'とけい', 'tokei', {
            'id': 'jam (alat)',
            'en': 'clock; watch',
          }),
          KanjiWord('時間', 'じかん', 'jikan', {
            'id': 'waktu; durasi',
            'en': 'time; hours',
          }),
        ],
      ),
      KanjiEntry(
        '分',
        'fun',
        ['ブン', 'フン'],
        ['わ(かる)', 'わ(ける)'],
        {'id': 'menit; bagian', 'en': 'minute; part'},
        [
          KanjiWord('五分', 'ごふん', 'gofun', {
            'id': 'lima menit',
            'en': 'five minutes',
          }),
          KanjiWord('分かる', 'わかる', 'wakaru', {
            'id': 'mengerti',
            'en': 'to understand',
          }),
        ],
      ),
      KanjiEntry(
        '半',
        'han',
        ['ハン'],
        ['なか(ば)'],
        {'id': 'setengah', 'en': 'half'},
        [
          KanjiWord('三時半', 'さんじはん', 'sanjihan', {
            'id': 'jam setengah empat (3.30)',
            'en': 'half past three',
          }),
          KanjiWord('半分', 'はんぶん', 'hanbun', {
            'id': 'separuh',
            'en': 'half (portion)',
          }),
        ],
      ),
      KanjiEntry(
        '今',
        'ima',
        ['コン', 'キン'],
        ['いま'],
        {'id': 'sekarang', 'en': 'now'},
        [
          KanjiWord('今日', 'きょう', 'kyou', {
            'id': 'hari ini (bacaan khusus)',
            'en': 'today (special reading)',
          }),
          KanjiWord('今年', 'ことし', 'kotoshi', {
            'id': 'tahun ini',
            'en': 'this year',
          }),
        ],
      ),
      KanjiEntry(
        '週',
        'shuu',
        ['シュウ'],
        [],
        {'id': 'minggu (7 hari)', 'en': 'week'},
        [
          KanjiWord('今週', 'こんしゅう', 'konshuu', {
            'id': 'minggu ini',
            'en': 'this week',
          }),
          KanjiWord('来週', 'らいしゅう', 'raishuu', {
            'id': 'minggu depan',
            'en': 'next week',
          }),
        ],
      ),
      KanjiEntry('午', 'go', ['ゴ'], [], {'id': 'tengah hari', 'en': 'noon'}, [
        KanjiWord('午前', 'ごぜん', 'gozen', {
          'id': 'pagi (a.m.)',
          'en': 'morning (a.m.)',
        }),
        KanjiWord('午後', 'ごご', 'gogo', {
          'id': 'siang/sore (p.m.)',
          'en': 'afternoon (p.m.)',
        }),
      ]),
      KanjiEntry('毎', 'mai', ['マイ'], [], {'id': 'setiap', 'en': 'every'}, [
        KanjiWord('毎日', 'まいにち', 'mainichi', {
          'id': 'setiap hari',
          'en': 'every day',
        }),
        KanjiWord('毎週', 'まいしゅう', 'maishuu', {
          'id': 'setiap minggu',
          'en': 'every week',
        }),
      ]),
      KanjiEntry(
        '間',
        'aida',
        ['カン', 'ケン'],
        ['あいだ', 'ま'],
        {'id': 'antara; selang', 'en': 'interval; between'},
        [
          KanjiWord('一週間', 'いっしゅうかん', 'isshuukan', {
            'id': 'satu minggu (lamanya)',
            'en': 'one week (long)',
          }),
          KanjiWord('人間', 'にんげん', 'ningen', {
            'id': 'manusia',
            'en': 'human being',
          }),
        ],
      ),
      KanjiEntry(
        '先',
        'sen',
        ['セン'],
        ['さき'],
        {'id': 'dulu; lebih dulu', 'en': 'previous; ahead'},
        [
          KanjiWord('先生', 'せんせい', 'sensei', {'id': 'guru', 'en': 'teacher'}),
          KanjiWord('先週', 'せんしゅう', 'senshuu', {
            'id': 'minggu lalu',
            'en': 'last week',
          }),
        ],
      ),
    ],
  ),
  KanjiSection(
    {'id': 'Orang & keluarga', 'en': 'People & family'},
    {
      'id':
          '父 dan 母 dipakai untuk orang tua sendiri. Untuk orang tua orang lain pakai お父さん (otousan) dan お母さん (okaasan).',
      'en':
          '父 and 母 refer to your own parents. For someone else\'s parents use お父さん (otousan) and お母さん (okaasan).',
    },
    [
      KanjiEntry(
        '人',
        'hito',
        ['ジン', 'ニン'],
        ['ひと'],
        {'id': 'orang', 'en': 'person'},
        [
          KanjiWord('日本人', 'にほんじん', 'nihonjin', {
            'id': 'orang Jepang',
            'en': 'Japanese person',
          }),
          KanjiWord('一人', 'ひとり', 'hitori', {
            'id': 'satu orang; sendirian',
            'en': 'one person; alone',
          }),
        ],
      ),
      KanjiEntry(
        '男',
        'otoko',
        ['ダン', 'ナン'],
        ['おとこ'],
        {'id': 'laki-laki', 'en': 'man; male'},
        [
          KanjiWord('男の子', 'おとこのこ', 'otoko no ko', {
            'id': 'anak laki-laki',
            'en': 'boy',
          }),
          KanjiWord('男性', 'だんせい', 'dansei', {'id': 'pria', 'en': 'male; man'}),
        ],
      ),
      KanjiEntry(
        '女',
        'onna',
        ['ジョ', 'ニョ'],
        ['おんな'],
        {'id': 'perempuan', 'en': 'woman; female'},
        [
          KanjiWord('女の人', 'おんなのひと', 'onna no hito', {
            'id': 'perempuan (orang)',
            'en': 'woman',
          }),
          KanjiWord('女性', 'じょせい', 'josei', {
            'id': 'wanita',
            'en': 'female; woman',
          }),
        ],
      ),
      KanjiEntry(
        '子',
        'ko',
        ['シ'],
        ['こ'],
        {'id': 'anak', 'en': 'child'},
        [
          KanjiWord('女の子', 'おんなのこ', 'onna no ko', {
            'id': 'anak perempuan',
            'en': 'girl',
          }),
          KanjiWord('子ども', 'こども', 'kodomo', {
            'id': 'anak-anak',
            'en': 'children; kid',
          }),
        ],
      ),
      KanjiEntry(
        '父',
        'chichi',
        ['フ'],
        ['ちち'],
        {'id': 'ayah', 'en': 'father'},
        [
          KanjiWord('お父さん', 'おとうさん', 'otousan', {
            'id': 'ayah (sapaan / ayah orang lain)',
            'en': 'father (polite / someone else\'s)',
          }),
          KanjiWord('父の日', 'ちちのひ', 'chichi no hi', {
            'id': 'Hari Ayah',
            'en': 'Father\'s Day',
          }),
        ],
      ),
      KanjiEntry(
        '母',
        'haha',
        ['ボ'],
        ['はは'],
        {'id': 'ibu', 'en': 'mother'},
        [
          KanjiWord('お母さん', 'おかあさん', 'okaasan', {
            'id': 'ibu (sapaan / ibu orang lain)',
            'en': 'mother (polite / someone else\'s)',
          }),
          KanjiWord('母国語', 'ぼこくご', 'bokokugo', {
            'id': 'bahasa ibu',
            'en': 'mother tongue',
          }),
        ],
      ),
      KanjiEntry(
        '友',
        'tomo',
        ['ユウ'],
        ['とも'],
        {'id': 'teman', 'en': 'friend'},
        [
          KanjiWord('友達', 'ともだち', 'tomodachi', {'id': 'teman', 'en': 'friend'}),
          KanjiWord('友人', 'ゆうじん', 'yuujin', {
            'id': 'kawan (formal)',
            'en': 'friend (formal)',
          }),
        ],
      ),
      KanjiEntry(
        '名',
        'na',
        ['メイ', 'ミョウ'],
        ['な'],
        {'id': 'nama', 'en': 'name'},
        [
          KanjiWord('名前', 'なまえ', 'namae', {'id': 'nama', 'en': 'name'}),
          KanjiWord('名刺', 'めいし', 'meishi', {
            'id': 'kartu nama',
            'en': 'business card',
          }),
        ],
      ),
    ],
  ),
  KanjiSection(
    {'id': 'Belajar & bahasa', 'en': 'Study & language'},
    {
      'id':
          '本 berarti buku, tapi 日本 (nihon) berarti Jepang. Tambahkan 語 untuk nama bahasa dan 人 untuk kebangsaan.',
      'en':
          '本 means book, but 日本 (nihon) means Japan. Add 語 for a language name and 人 for nationality.',
    },
    [
      KanjiEntry(
        '学',
        'gaku',
        ['ガク'],
        ['まな(ぶ)'],
        {'id': 'belajar; ilmu', 'en': 'study; learning'},
        [
          KanjiWord('学生', 'がくせい', 'gakusei', {
            'id': 'pelajar, mahasiswa',
            'en': 'student',
          }),
          KanjiWord('大学', 'だいがく', 'daigaku', {
            'id': 'universitas',
            'en': 'university',
          }),
        ],
      ),
      KanjiEntry('校', 'kou', ['コウ'], [], {'id': 'sekolah', 'en': 'school'}, [
        KanjiWord('学校', 'がっこう', 'gakkou', {'id': 'sekolah', 'en': 'school'}),
        KanjiWord('校長', 'こうちょう', 'kouchou', {
          'id': 'kepala sekolah',
          'en': 'principal',
        }),
      ]),
      KanjiEntry(
        '生',
        'sei',
        ['セイ', 'ショウ'],
        ['い(きる)', 'う(まれる)', 'なま'],
        {'id': 'hidup; lahir', 'en': 'life; birth'},
        [
          KanjiWord('生まれる', 'うまれる', 'umareru', {
            'id': 'lahir',
            'en': 'to be born',
          }),
          KanjiWord('一生', 'いっしょう', 'isshou', {
            'id': 'seumur hidup',
            'en': 'whole life',
          }),
        ],
      ),
      KanjiEntry(
        '本',
        'hon',
        ['ホン'],
        ['もと'],
        {'id': 'buku; asal', 'en': 'book; origin'},
        [
          KanjiWord('日本', 'にほん', 'nihon', {'id': 'Jepang', 'en': 'Japan'}),
          KanjiWord('一本', 'いっぽん', 'ippon', {
            'id': 'satu batang (benda panjang)',
            'en': 'one (long object)',
          }),
        ],
      ),
      KanjiEntry(
        '語',
        'go',
        ['ゴ'],
        ['かた(る)'],
        {'id': 'bahasa; kata', 'en': 'language; word'},
        [
          KanjiWord('日本語', 'にほんご', 'nihongo', {
            'id': 'bahasa Jepang',
            'en': 'Japanese language',
          }),
          KanjiWord('中国語', 'ちゅうごくご', 'chuugokugo', {
            'id': 'bahasa Mandarin',
            'en': 'Chinese language',
          }),
        ],
      ),
      KanjiEntry(
        '国',
        'kuni',
        ['コク'],
        ['くに'],
        {'id': 'negara', 'en': 'country'},
        [
          KanjiWord('中国', 'ちゅうごく', 'chuugoku', {
            'id': 'Tiongkok',
            'en': 'China',
          }),
          KanjiWord('外国', 'がいこく', 'gaikoku', {
            'id': 'luar negeri',
            'en': 'foreign country',
          }),
        ],
      ),
    ],
  ),
  KanjiSection(
    {'id': 'Alam & kota', 'en': 'Nature & town'},
    {
      'id':
          'Banyak kanji alam berbentuk gambar: 山 tiga puncak gunung, 川 aliran sungai, 田 petak sawah, 雨 tetesan hujan.',
      'en':
          'Many nature kanji are pictures: 山 three mountain peaks, 川 a flowing river, 田 rice paddy plots, 雨 falling raindrops.',
    },
    [
      KanjiEntry(
        '山',
        'yama',
        ['サン'],
        ['やま'],
        {'id': 'gunung', 'en': 'mountain'},
        [
          KanjiWord('富士山', 'ふじさん', 'fujisan', {
            'id': 'Gunung Fuji',
            'en': 'Mount Fuji',
          }),
          KanjiWord('山道', 'やまみち', 'yamamichi', {
            'id': 'jalan gunung',
            'en': 'mountain path',
          }),
        ],
      ),
      KanjiEntry(
        '川',
        'kawa',
        ['セン'],
        ['かわ'],
        {'id': 'sungai', 'en': 'river'},
        [
          KanjiWord('小川', 'おがわ', 'ogawa', {
            'id': 'sungai kecil',
            'en': 'stream; brook',
          }),
          KanjiWord('天の川', 'あまのがわ', 'amanogawa', {
            'id': 'Bima Sakti',
            'en': 'Milky Way',
          }),
        ],
      ),
      KanjiEntry(
        '田',
        'ta',
        ['デン'],
        ['た'],
        {'id': 'sawah', 'en': 'rice field'},
        [
          KanjiWord('山田', 'やまだ', 'yamada', {
            'id': 'Yamada (nama keluarga)',
            'en': 'Yamada (family name)',
          }),
          KanjiWord('田中', 'たなか', 'tanaka', {
            'id': 'Tanaka (nama keluarga)',
            'en': 'Tanaka (family name)',
          }),
        ],
      ),
      KanjiEntry(
        '空',
        'sora',
        ['クウ'],
        ['そら', 'あ(く)', 'から'],
        {'id': 'langit; kosong', 'en': 'sky; empty'},
        [
          KanjiWord('青空', 'あおぞら', 'aozora', {
            'id': 'langit biru cerah',
            'en': 'blue sky',
          }),
          KanjiWord('空港', 'くうこう', 'kuukou', {'id': 'bandara', 'en': 'airport'}),
        ],
      ),
      KanjiEntry(
        '雨',
        'ame',
        ['ウ'],
        ['あめ'],
        {'id': 'hujan', 'en': 'rain'},
        [
          KanjiWord('雨の日', 'あめのひ', 'ame no hi', {
            'id': 'hari hujan',
            'en': 'rainy day',
          }),
          KanjiWord('大雨', 'おおあめ', 'ooame', {
            'id': 'hujan lebat',
            'en': 'heavy rain',
          }),
        ],
      ),
      KanjiEntry(
        '花',
        'hana',
        ['カ'],
        ['はな'],
        {'id': 'bunga', 'en': 'flower'},
        [
          KanjiWord('花見', 'はなみ', 'hanami', {
            'id': 'piknik melihat bunga sakura',
            'en': 'cherry-blossom viewing',
          }),
          KanjiWord('花火', 'はなび', 'hanabi', {
            'id': 'kembang api',
            'en': 'fireworks',
          }),
        ],
      ),
      KanjiEntry(
        '車',
        'kuruma',
        ['シャ'],
        ['くるま'],
        {'id': 'mobil; kendaraan', 'en': 'car; vehicle'},
        [
          KanjiWord('電車', 'でんしゃ', 'densha', {
            'id': 'kereta listrik',
            'en': 'train',
          }),
          KanjiWord('車道', 'しゃどう', 'shadou', {
            'id': 'jalur kendaraan',
            'en': 'roadway',
          }),
        ],
      ),
      KanjiEntry('駅', 'eki', ['エキ'], [], {'id': 'stasiun', 'en': 'station'}, [
        KanjiWord('駅前', 'えきまえ', 'ekimae', {
          'id': 'depan stasiun',
          'en': 'in front of the station',
        }),
        KanjiWord('駅弁', 'えきべん', 'ekiben', {
          'id': 'bento stasiun',
          'en': 'station bento',
        }),
      ]),
      KanjiEntry(
        '天',
        'ten',
        ['テン'],
        ['あま'],
        {'id': 'surga; cuaca', 'en': 'heaven; weather'},
        [
          KanjiWord('天気', 'てんき', 'tenki', {'id': 'cuaca', 'en': 'weather'}),
          KanjiWord('天国', 'てんごく', 'tengoku', {
            'id': 'surga',
            'en': 'heaven; paradise',
          }),
        ],
      ),
      KanjiEntry(
        '気',
        'ki',
        ['キ', 'ケ'],
        [],
        {'id': 'semangat; perasaan', 'en': 'spirit; mood'},
        [
          KanjiWord('人気', 'にんき', 'ninki', {
            'id': 'populer',
            'en': 'popularity',
          }),
          KanjiWord('気分', 'きぶん', 'kibun', {
            'id': 'suasana hati',
            'en': 'mood; feeling',
          }),
        ],
      ),
      KanjiEntry(
        '魚',
        'sakana',
        ['ギョ'],
        ['さかな', 'うお'],
        {'id': 'ikan', 'en': 'fish'},
        [
          KanjiWord('金魚', 'きんぎょ', 'kingyo', {
            'id': 'ikan mas koki',
            'en': 'goldfish',
          }),
          KanjiWord('人魚', 'にんぎょ', 'ningyo', {
            'id': 'putri duyung',
            'en': 'mermaid',
          }),
        ],
      ),
      KanjiEntry(
        '店',
        'mise',
        ['テン'],
        ['みせ'],
        {'id': 'toko', 'en': 'shop'},
        [
          KanjiWord('書店', 'しょてん', 'shoten', {
            'id': 'toko buku',
            'en': 'bookstore',
          }),
          KanjiWord('店長', 'てんちょう', 'tenchou', {
            'id': 'manajer toko',
            'en': 'store manager',
          }),
        ],
      ),
      KanjiEntry(
        '道',
        'michi',
        ['ドウ'],
        ['みち'],
        {'id': 'jalan', 'en': 'road; way'},
        [
          KanjiWord('北海道', 'ほっかいどう', 'hokkaidou', {
            'id': 'Hokkaido',
            'en': 'Hokkaido',
          }),
          KanjiWord('書道', 'しょどう', 'shodou', {
            'id': 'kaligrafi',
            'en': 'calligraphy',
          }),
        ],
      ),
      KanjiEntry(
        '電',
        'den',
        ['デン'],
        [],
        {'id': 'listrik', 'en': 'electricity'},
        [
          KanjiWord('電話', 'でんわ', 'denwa', {'id': 'telepon', 'en': 'telephone'}),
          KanjiWord('電気', 'でんき', 'denki', {
            'id': 'listrik; lampu',
            'en': 'electricity; light',
          }),
        ],
      ),
    ],
  ),
  KanjiSection(
    {'id': 'Ukuran & arah', 'en': 'Size & direction'},
    {
      'id':
          '大 dan 小 sering muncul sebagai kata sifat 大きい (ookii) dan 小さい (chiisai). 上下左右 = atas, bawah, kiri, kanan.',
      'en':
          '大 and 小 usually appear as the adjectives 大きい (ookii) and 小さい (chiisai). 上下左右 = up, down, left, right.',
    },
    [
      KanjiEntry(
        '大',
        'dai',
        ['ダイ', 'タイ'],
        ['おお(きい)'],
        {'id': 'besar', 'en': 'big'},
        [
          KanjiWord('大きい', 'おおきい', 'ookii', {'id': 'besar', 'en': 'big'}),
          KanjiWord('大人', 'おとな', 'otona', {
            'id': 'orang dewasa',
            'en': 'adult',
          }),
        ],
      ),
      KanjiEntry(
        '小',
        'shou',
        ['ショウ'],
        ['ちい(さい)', 'こ', 'お'],
        {'id': 'kecil', 'en': 'small'},
        [
          KanjiWord('小さい', 'ちいさい', 'chiisai', {'id': 'kecil', 'en': 'small'}),
          KanjiWord('小学校', 'しょうがっこう', 'shougakkou', {
            'id': 'sekolah dasar',
            'en': 'elementary school',
          }),
        ],
      ),
      KanjiEntry(
        '中',
        'naka',
        ['チュウ', 'ジュウ'],
        ['なか'],
        {'id': 'tengah; dalam', 'en': 'middle; inside'},
        [
          KanjiWord('中学生', 'ちゅうがくせい', 'chuugakusei', {
            'id': 'siswa SMP',
            'en': 'junior high student',
          }),
          KanjiWord('一日中', 'いちにちじゅう', 'ichinichijuu', {
            'id': 'sepanjang hari',
            'en': 'all day long',
          }),
        ],
      ),
      KanjiEntry(
        '上',
        'ue',
        ['ジョウ'],
        ['うえ', 'あ(がる)', 'のぼ(る)'],
        {'id': 'atas', 'en': 'up; above'},
        [
          KanjiWord('上手', 'じょうず', 'jouzu', {
            'id': 'pandai, mahir',
            'en': 'skilful; good at',
          }),
          KanjiWord('上がる', 'あがる', 'agaru', {'id': 'naik', 'en': 'to go up'}),
        ],
      ),
      KanjiEntry(
        '下',
        'shita',
        ['カ', 'ゲ'],
        ['した', 'さ(がる)', 'くだ(さい)'],
        {'id': 'bawah', 'en': 'down; below'},
        [
          KanjiWord('下手', 'へた', 'heta', {
            'id': 'tidak pandai',
            'en': 'unskilful; bad at',
          }),
          KanjiWord('下さい', 'ください', 'kudasai', {
            'id': 'tolong (berikan)',
            'en': 'please (give me)',
          }),
        ],
      ),
      KanjiEntry(
        '左',
        'hidari',
        ['サ'],
        ['ひだり'],
        {'id': 'kiri', 'en': 'left'},
        [
          KanjiWord('左手', 'ひだりて', 'hidarite', {
            'id': 'tangan kiri',
            'en': 'left hand',
          }),
          KanjiWord('左右', 'さゆう', 'sayuu', {
            'id': 'kiri dan kanan',
            'en': 'left and right',
          }),
        ],
      ),
      KanjiEntry(
        '右',
        'migi',
        ['ウ', 'ユウ'],
        ['みぎ'],
        {'id': 'kanan', 'en': 'right'},
        [
          KanjiWord('右手', 'みぎて', 'migite', {
            'id': 'tangan kanan',
            'en': 'right hand',
          }),
          KanjiWord('右側', 'みぎがわ', 'migigawa', {
            'id': 'sisi kanan',
            'en': 'right side',
          }),
        ],
      ),
    ],
  ),
  KanjiSection(
    {'id': 'Arah & tempat', 'en': 'Directions & places'},
    {
      'id':
          'Arah mata angin sering dipakai untuk pintu stasiun: 東口 (pintu timur), 西口, 南口, 北口.',
      'en':
          'Compass directions often name station exits: 東口 (east exit), 西口, 南口, 北口.',
    },
    [
      KanjiEntry(
        '東',
        'higashi',
        ['トウ'],
        ['ひがし'],
        {'id': 'timur', 'en': 'east'},
        [
          KanjiWord('東口', 'ひがしぐち', 'higashiguchi', {
            'id': 'pintu timur',
            'en': 'east exit',
          }),
          KanjiWord('中東', 'ちゅうとう', 'chuutou', {
            'id': 'Timur Tengah',
            'en': 'Middle East',
          }),
        ],
      ),
      KanjiEntry(
        '西',
        'nishi',
        ['セイ', 'サイ'],
        ['にし'],
        {'id': 'barat', 'en': 'west'},
        [
          KanjiWord('西口', 'にしぐち', 'nishiguchi', {
            'id': 'pintu barat',
            'en': 'west exit',
          }),
          KanjiWord('関西', 'かんさい', 'kansai', {
            'id': 'Kansai (wilayah Osaka–Kyoto)',
            'en': 'Kansai (Osaka–Kyoto region)',
          }),
        ],
      ),
      KanjiEntry(
        '南',
        'minami',
        ['ナン'],
        ['みなみ'],
        {'id': 'selatan', 'en': 'south'},
        [
          KanjiWord('南口', 'みなみぐち', 'minamiguchi', {
            'id': 'pintu selatan',
            'en': 'south exit',
          }),
          KanjiWord('東南アジア', 'とうなんアジア', 'tounan ajia', {
            'id': 'Asia Tenggara',
            'en': 'Southeast Asia',
          }),
        ],
      ),
      KanjiEntry(
        '北',
        'kita',
        ['ホク'],
        ['きた'],
        {'id': 'utara', 'en': 'north'},
        [
          KanjiWord('北口', 'きたぐち', 'kitaguchi', {
            'id': 'pintu utara',
            'en': 'north exit',
          }),
          KanjiWord('南北', 'なんぼく', 'nanboku', {
            'id': 'utara-selatan',
            'en': 'north and south',
          }),
        ],
      ),
      KanjiEntry(
        '前',
        'mae',
        ['ゼン'],
        ['まえ'],
        {'id': 'depan; sebelum', 'en': 'front; before'},
        [
          KanjiWord('三年前', 'さんねんまえ', 'sannen mae', {
            'id': 'tiga tahun lalu',
            'en': 'three years ago',
          }),
          KanjiWord('前日', 'ぜんじつ', 'zenjitsu', {
            'id': 'hari sebelumnya',
            'en': 'the day before',
          }),
        ],
      ),
      KanjiEntry(
        '後',
        'ushiro',
        ['ゴ', 'コウ'],
        ['うし(ろ)', 'あと', 'のち'],
        {'id': 'belakang; sesudah', 'en': 'behind; after'},
        [
          KanjiWord('後ろ', 'うしろ', 'ushiro', {
            'id': 'belakang',
            'en': 'behind; back',
          }),
          KanjiWord('後で', 'あとで', 'ato de', {'id': 'nanti', 'en': 'later'}),
        ],
      ),
      KanjiEntry(
        '外',
        'soto',
        ['ガイ'],
        ['そと', 'ほか'],
        {'id': 'luar', 'en': 'outside'},
        [
          KanjiWord('外国人', 'がいこくじん', 'gaikokujin', {
            'id': 'orang asing',
            'en': 'foreigner',
          }),
          KanjiWord('外出', 'がいしゅつ', 'gaishutsu', {
            'id': 'keluar rumah',
            'en': 'going out',
          }),
        ],
      ),
    ],
  ),
  KanjiSection(
    {'id': 'Tubuh & warna', 'en': 'Body & colors'},
    {
      'id':
          'Warna menjadi kata sifat dengan akhiran い: 白い putih, 赤い merah, 青い biru.',
      'en':
          'Colors become adjectives with the ending い: 白い white, 赤い red, 青い blue.',
    },
    [
      KanjiEntry(
        '手',
        'te',
        ['シュ'],
        ['て'],
        {'id': 'tangan', 'en': 'hand'},
        [
          KanjiWord('選手', 'せんしゅ', 'senshu', {
            'id': 'atlet',
            'en': 'athlete; player',
          }),
          KanjiWord('握手', 'あくしゅ', 'akushu', {
            'id': 'jabat tangan',
            'en': 'handshake',
          }),
        ],
      ),
      KanjiEntry(
        '目',
        'me',
        ['モク'],
        ['め'],
        {'id': 'mata', 'en': 'eye'},
        [
          KanjiWord('一つ目', 'ひとつめ', 'hitotsume', {
            'id': 'yang pertama',
            'en': 'the first one',
          }),
          KanjiWord('目的', 'もくてき', 'mokuteki', {
            'id': 'tujuan',
            'en': 'purpose',
          }),
        ],
      ),
      KanjiEntry(
        '口',
        'kuchi',
        ['コウ'],
        ['くち'],
        {'id': 'mulut', 'en': 'mouth'},
        [
          KanjiWord('人口', 'じんこう', 'jinkou', {
            'id': 'jumlah penduduk',
            'en': 'population',
          }),
          KanjiWord('窓口', 'まどぐち', 'madoguchi', {
            'id': 'loket',
            'en': 'service counter',
          }),
        ],
      ),
      KanjiEntry(
        '耳',
        'mimi',
        ['ジ'],
        ['みみ'],
        {'id': 'telinga', 'en': 'ear'},
        [
          KanjiWord('耳鼻科', 'じびか', 'jibika', {
            'id': 'klinik THT',
            'en': 'ENT clinic',
          }),
          KanjiWord('空耳', 'そらみみ', 'soramimi', {
            'id': 'salah dengar',
            'en': 'mishearing',
          }),
        ],
      ),
      KanjiEntry(
        '白',
        'shiro',
        ['ハク'],
        ['しろ', 'しろ(い)'],
        {'id': 'putih', 'en': 'white'},
        [
          KanjiWord('白い', 'しろい', 'shiroi', {'id': 'putih', 'en': 'white'}),
          KanjiWord('面白い', 'おもしろい', 'omoshiroi', {
            'id': 'menarik, lucu',
            'en': 'interesting; funny',
          }),
        ],
      ),
      KanjiEntry(
        '赤',
        'aka',
        ['セキ'],
        ['あか', 'あか(い)'],
        {'id': 'merah', 'en': 'red'},
        [
          KanjiWord('赤い花', 'あかいはな', 'akai hana', {
            'id': 'bunga merah',
            'en': 'red flower',
          }),
          KanjiWord('赤ちゃん', 'あかちゃん', 'akachan', {'id': 'bayi', 'en': 'baby'}),
        ],
      ),
      KanjiEntry(
        '青',
        'ao',
        ['セイ'],
        ['あお', 'あお(い)'],
        {'id': 'biru', 'en': 'blue'},
        [
          KanjiWord('青い空', 'あおいそら', 'aoi sora', {
            'id': 'langit biru',
            'en': 'blue sky',
          }),
          KanjiWord('青年', 'せいねん', 'seinen', {
            'id': 'pemuda',
            'en': 'young man; youth',
          }),
        ],
      ),
    ],
  ),
  KanjiSection(
    {'id': 'Sifat', 'en': 'Adjectives'},
    {
      'id':
          'Kata sifat-i berakhiran い yang ditulis dengan hiragana (okurigana): 高い, 安い, 新しい, 古い, 長い.',
      'en':
          'I-adjectives end in い written in hiragana (okurigana): 高い, 安い, 新しい, 古い, 長い.',
    },
    [
      KanjiEntry(
        '長',
        'nagai',
        ['チョウ'],
        ['なが(い)'],
        {'id': 'panjang; kepala (pemimpin)', 'en': 'long; chief'},
        [
          KanjiWord('長い', 'ながい', 'nagai', {'id': 'panjang', 'en': 'long'}),
          KanjiWord('長男', 'ちょうなん', 'chounan', {
            'id': 'putra sulung',
            'en': 'eldest son',
          }),
        ],
      ),
      KanjiEntry(
        '高',
        'takai',
        ['コウ'],
        ['たか(い)'],
        {'id': 'tinggi; mahal', 'en': 'tall; expensive'},
        [
          KanjiWord('高い', 'たかい', 'takai', {
            'id': 'tinggi; mahal',
            'en': 'tall; expensive',
          }),
          KanjiWord('高校', 'こうこう', 'koukou', {'id': 'SMA', 'en': 'high school'}),
        ],
      ),
      KanjiEntry(
        '安',
        'yasui',
        ['アン'],
        ['やす(い)'],
        {'id': 'murah; tenang', 'en': 'cheap; peaceful'},
        [
          KanjiWord('安い', 'やすい', 'yasui', {'id': 'murah', 'en': 'cheap'}),
          KanjiWord('安全', 'あんぜん', 'anzen', {
            'id': 'aman',
            'en': 'safe; safety',
          }),
        ],
      ),
      KanjiEntry(
        '新',
        'atarashii',
        ['シン'],
        ['あたら(しい)'],
        {'id': 'baru', 'en': 'new'},
        [
          KanjiWord('新しい', 'あたらしい', 'atarashii', {'id': 'baru', 'en': 'new'}),
          KanjiWord('新年', 'しんねん', 'shinnen', {
            'id': 'tahun baru',
            'en': 'New Year',
          }),
        ],
      ),
      KanjiEntry(
        '古',
        'furui',
        ['コ'],
        ['ふる(い)'],
        {'id': 'lama; tua (barang)', 'en': 'old'},
        [
          KanjiWord('古い', 'ふるい', 'furui', {
            'id': 'lama, kuno',
            'en': 'old (things)',
          }),
          KanjiWord('中古', 'ちゅうこ', 'chuuko', {
            'id': 'bekas (barang)',
            'en': 'second-hand',
          }),
        ],
      ),
    ],
  ),
  KanjiSection(
    {'id': 'Kata kerja', 'en': 'Verbs'},
    {
      'id':
          'Kanji kata kerja hampir selalu diikuti hiragana (okurigana): 食べる, 飲む, 行く. Bagian hiragana inilah yang berubah saat konjugasi (食べます, 飲みます).',
      'en':
          'Verb kanji are almost always followed by hiragana (okurigana): 食べる, 飲む, 行く. The hiragana part is what changes in conjugation (食べます, 飲みます).',
    },
    [
      KanjiEntry(
        '来',
        'kuru',
        ['ライ'],
        ['く(る)'],
        {'id': 'datang', 'en': 'come'},
        [
          KanjiWord('来る', 'くる', 'kuru', {'id': 'datang', 'en': 'to come'}),
          KanjiWord('来年', 'らいねん', 'rainen', {
            'id': 'tahun depan',
            'en': 'next year',
          }),
        ],
      ),
      KanjiEntry(
        '行',
        'iku',
        ['コウ', 'ギョウ'],
        ['い(く)', 'おこな(う)'],
        {'id': 'pergi', 'en': 'go'},
        [
          KanjiWord('行く', 'いく', 'iku', {'id': 'pergi', 'en': 'to go'}),
          KanjiWord('行う', 'おこなう', 'okonau', {
            'id': 'melaksanakan',
            'en': 'to carry out',
          }),
        ],
      ),
      KanjiEntry(
        '見',
        'miru',
        ['ケン'],
        ['み(る)', 'み(せる)'],
        {'id': 'melihat', 'en': 'see; look'},
        [
          KanjiWord('見る', 'みる', 'miru', {
            'id': 'melihat; menonton',
            'en': 'to see; to watch',
          }),
          KanjiWord('見学', 'けんがく', 'kengaku', {
            'id': 'kunjungan belajar',
            'en': 'study visit; tour',
          }),
        ],
      ),
      KanjiEntry(
        '食',
        'taberu',
        ['ショク'],
        ['た(べる)'],
        {'id': 'makan', 'en': 'eat'},
        [
          KanjiWord('食べる', 'たべる', 'taberu', {'id': 'makan', 'en': 'to eat'}),
          KanjiWord('和食', 'わしょく', 'washoku', {
            'id': 'masakan Jepang',
            'en': 'Japanese food',
          }),
        ],
      ),
      KanjiEntry(
        '飲',
        'nomu',
        ['イン'],
        ['の(む)'],
        {'id': 'minum', 'en': 'drink'},
        [
          KanjiWord('飲む', 'のむ', 'nomu', {'id': 'minum', 'en': 'to drink'}),
          KanjiWord('飲食店', 'いんしょくてん', 'inshokuten', {
            'id': 'rumah makan',
            'en': 'eatery; restaurant',
          }),
        ],
      ),
      KanjiEntry(
        '書',
        'kaku',
        ['ショ'],
        ['か(く)'],
        {'id': 'menulis', 'en': 'write'},
        [
          KanjiWord('書く', 'かく', 'kaku', {'id': 'menulis', 'en': 'to write'}),
          KanjiWord('辞書', 'じしょ', 'jisho', {'id': 'kamus', 'en': 'dictionary'}),
        ],
      ),
      KanjiEntry(
        '読',
        'yomu',
        ['ドク'],
        ['よ(む)'],
        {'id': 'membaca', 'en': 'read'},
        [
          KanjiWord('読む', 'よむ', 'yomu', {'id': 'membaca', 'en': 'to read'}),
          KanjiWord('読書', 'どくしょ', 'dokusho', {
            'id': 'membaca buku (hobi)',
            'en': 'reading (books)',
          }),
        ],
      ),
      KanjiEntry(
        '話',
        'hanasu',
        ['ワ'],
        ['はな(す)', 'はなし'],
        {'id': 'berbicara; cerita', 'en': 'speak; story'},
        [
          KanjiWord('話す', 'はなす', 'hanasu', {
            'id': 'berbicara',
            'en': 'to speak',
          }),
          KanjiWord('お話', 'おはなし', 'ohanashi', {
            'id': 'cerita; pembicaraan',
            'en': 'story; talk',
          }),
        ],
      ),
      KanjiEntry(
        '聞',
        'kiku',
        ['ブン'],
        ['き(く)', 'き(こえる)'],
        {'id': 'mendengar; bertanya', 'en': 'hear; ask'},
        [
          KanjiWord('聞く', 'きく', 'kiku', {
            'id': 'mendengar; bertanya',
            'en': 'to listen; to ask',
          }),
          KanjiWord('新聞', 'しんぶん', 'shinbun', {
            'id': 'koran',
            'en': 'newspaper',
          }),
        ],
      ),
      KanjiEntry(
        '言',
        'iu',
        ['ゲン', 'ゴン'],
        ['い(う)', 'こと'],
        {'id': 'berkata', 'en': 'say'},
        [
          KanjiWord('言う', 'いう', 'iu', {'id': 'berkata', 'en': 'to say'}),
          KanjiWord('言葉', 'ことば', 'kotoba', {
            'id': 'kata; bahasa',
            'en': 'word; language',
          }),
        ],
      ),
      KanjiEntry(
        '休',
        'yasumu',
        ['キュウ'],
        ['やす(む)', 'やす(み)'],
        {'id': 'istirahat', 'en': 'rest'},
        [
          KanjiWord('休む', 'やすむ', 'yasumu', {
            'id': 'beristirahat; libur',
            'en': 'to rest; to take off',
          }),
          KanjiWord('休日', 'きゅうじつ', 'kyuujitsu', {
            'id': 'hari libur',
            'en': 'holiday; day off',
          }),
        ],
      ),
      KanjiEntry(
        '出',
        'deru',
        ['シュツ'],
        ['で(る)', 'だ(す)'],
        {'id': 'keluar', 'en': 'exit; go out'},
        [
          KanjiWord('出る', 'でる', 'deru', {'id': 'keluar', 'en': 'to go out'}),
          KanjiWord('出口', 'でぐち', 'deguchi', {
            'id': 'pintu keluar',
            'en': 'exit',
          }),
        ],
      ),
      KanjiEntry(
        '入',
        'hairu',
        ['ニュウ'],
        ['はい(る)', 'い(れる)', 'い(る)'],
        {'id': 'masuk', 'en': 'enter'},
        [
          KanjiWord('入る', 'はいる', 'hairu', {'id': 'masuk', 'en': 'to enter'}),
          KanjiWord('入口', 'いりぐち', 'iriguchi', {
            'id': 'pintu masuk',
            'en': 'entrance',
          }),
        ],
      ),
      KanjiEntry(
        '立',
        'tatsu',
        ['リツ'],
        ['た(つ)'],
        {'id': 'berdiri', 'en': 'stand'},
        [
          KanjiWord('立つ', 'たつ', 'tatsu', {'id': 'berdiri', 'en': 'to stand'}),
          KanjiWord('国立', 'こくりつ', 'kokuritsu', {
            'id': 'negeri (milik negara)',
            'en': 'national; state-run',
          }),
        ],
      ),
    ],
  ),
];

const List<KanjiSection> kanjiN4Sections = [
  KanjiSection(
    {'id': 'Keluarga & orang', 'en': 'Family & people'},
    null,
    [
      KanjiEntry(
        '兄',
        'ani',
        ['ケイ', 'キョウ'],
        ['あに'],
        {'id': 'kakak laki-laki', 'en': 'older brother'},
        [
          KanjiWord('兄弟', 'きょうだい', 'kyoudai', {
            'id': 'saudara kandung',
            'en': 'siblings',
          }),
          KanjiWord('お兄さん', 'おにいさん', 'oniisan', {
            'id': 'kakak laki-laki (orang lain)',
            'en': 'older brother (polite)',
          }),
        ],
      ),
      KanjiEntry(
        '姉',
        'ane',
        ['シ'],
        ['あね'],
        {'id': 'kakak perempuan', 'en': 'older sister'},
        [
          KanjiWord('姉妹', 'しまい', 'shimai', {
            'id': 'saudara perempuan',
            'en': 'sisters',
          }),
          KanjiWord('お姉さん', 'おねえさん', 'oneesan', {
            'id': 'kakak perempuan (orang lain)',
            'en': 'older sister (polite)',
          }),
        ],
      ),
      KanjiEntry(
        '弟',
        'otouto',
        ['ダイ', 'デ', 'テイ'],
        ['おとうと'],
        {'id': 'adik laki-laki', 'en': 'younger brother'},
        [
          KanjiWord('弟さん', 'おとうとさん', 'otoutosan', {
            'id': 'adik laki-laki (orang lain)',
            'en': 'younger brother (polite)',
          }),
          KanjiWord('弟子', 'でし', 'deshi', {
            'id': 'murid; pengikut',
            'en': 'disciple',
          }),
        ],
      ),
      KanjiEntry(
        '妹',
        'imouto',
        ['マイ'],
        ['いもうと'],
        {'id': 'adik perempuan', 'en': 'younger sister'},
        [
          KanjiWord('妹さん', 'いもうとさん', 'imoutosan', {
            'id': 'adik perempuan (orang lain)',
            'en': 'younger sister (polite)',
          }),
        ],
      ),
      KanjiEntry(
        '家',
        'ie',
        ['カ', 'ケ'],
        ['いえ', 'うち'],
        {'id': 'rumah', 'en': 'house'},
        [
          KanjiWord('作家', 'さっか', 'sakka', {'id': 'pengarang', 'en': 'writer'}),
          KanjiWord('家賃', 'やちん', 'yachin', {'id': 'sewa rumah', 'en': 'rent'}),
        ],
      ),
      KanjiEntry(
        '族',
        'zoku',
        ['ゾク'],
        [],
        {'id': 'suku; kerabat', 'en': 'tribe; family'},
        [
          KanjiWord('家族', 'かぞく', 'kazoku', {'id': 'keluarga', 'en': 'family'}),
          KanjiWord('民族', 'みんぞく', 'minzoku', {
            'id': 'suku bangsa',
            'en': 'ethnic group',
          }),
        ],
      ),
      KanjiEntry(
        '親',
        'oya',
        ['シン'],
        ['おや', 'した(しい)'],
        {'id': 'orang tua; akrab', 'en': 'parent; intimate'},
        [
          KanjiWord('両親', 'りょうしん', 'ryoushin', {
            'id': 'kedua orang tua',
            'en': 'parents',
          }),
          KanjiWord('親切', 'しんせつ', 'shinsetsu', {
            'id': 'baik hati',
            'en': 'kind',
          }),
        ],
      ),
      KanjiEntry(
        '私',
        'watashi',
        ['シ'],
        ['わたし', 'わたくし'],
        {'id': 'saya; pribadi', 'en': 'I; private'},
        [
          KanjiWord('私', 'わたし', 'watashi', {'id': 'saya', 'en': 'I'}),
          KanjiWord('私立', 'しりつ', 'shiritsu', {
            'id': 'swasta',
            'en': 'private (institution)',
          }),
        ],
      ),
      KanjiEntry(
        '自',
        'ji',
        ['ジ', 'シ'],
        ['みずか(ら)'],
        {'id': 'diri sendiri', 'en': 'oneself'},
        [
          KanjiWord('自分', 'じぶん', 'jibun', {
            'id': 'diri sendiri',
            'en': 'oneself',
          }),
          KanjiWord('自転車', 'じてんしゃ', 'jitensha', {
            'id': 'sepeda',
            'en': 'bicycle',
          }),
        ],
      ),
      KanjiEntry(
        '者',
        'sha',
        ['シャ'],
        ['もの'],
        {'id': 'orang (pelaku)', 'en': 'person (who does)'},
        [
          KanjiWord('学者', 'がくしゃ', 'gakusha', {
            'id': 'ilmuwan',
            'en': 'scholar',
          }),
          KanjiWord('若者', 'わかもの', 'wakamono', {
            'id': 'anak muda',
            'en': 'young people',
          }),
        ],
      ),
      KanjiEntry(
        '員',
        'in',
        ['イン'],
        [],
        {'id': 'anggota; petugas', 'en': 'member; staff'},
        [
          KanjiWord('会社員', 'かいしゃいん', 'kaishain', {
            'id': 'karyawan',
            'en': 'company employee',
          }),
          KanjiWord('店員', 'てんいん', 'ten\'in', {
            'id': 'pramuniaga',
            'en': 'shop clerk',
          }),
        ],
      ),
      KanjiEntry(
        '主',
        'shu',
        ['シュ', 'ス'],
        ['おも', 'ぬし'],
        {'id': 'utama; tuan', 'en': 'main; master'},
        [
          KanjiWord('主人', 'しゅじん', 'shujin', {
            'id': 'suami; tuan rumah',
            'en': 'husband; master',
          }),
          KanjiWord('主に', 'おもに', 'omoni', {'id': 'terutama', 'en': 'mainly'}),
        ],
      ),
      KanjiEntry(
        '民',
        'min',
        ['ミン'],
        ['たみ'],
        {'id': 'rakyat', 'en': 'the people'},
        [
          KanjiWord('国民', 'こくみん', 'kokumin', {
            'id': 'warga negara',
            'en': 'citizens',
          }),
          KanjiWord('市民', 'しみん', 'shimin', {
            'id': 'warga kota',
            'en': 'citizen',
          }),
        ],
      ),
    ],
  ),
  KanjiSection(
    {'id': 'Tubuh & kesehatan', 'en': 'Body & health'},
    null,
    [
      KanjiEntry(
        '体',
        'karada',
        ['タイ', 'テイ'],
        ['からだ'],
        {'id': 'tubuh', 'en': 'body'},
        [
          KanjiWord('体重', 'たいじゅう', 'taijuu', {
            'id': 'berat badan',
            'en': 'body weight',
          }),
          KanjiWord('体育', 'たいいく', 'taiiku', {
            'id': 'pendidikan jasmani',
            'en': 'physical education',
          }),
        ],
      ),
      KanjiEntry(
        '頭',
        'atama',
        ['トウ', 'ズ'],
        ['あたま'],
        {'id': 'kepala', 'en': 'head'},
        [
          KanjiWord('頭痛', 'ずつう', 'zutsuu', {
            'id': 'sakit kepala',
            'en': 'headache',
          }),
          KanjiWord('先頭', 'せんとう', 'sentou', {
            'id': 'posisi paling depan',
            'en': 'the lead',
          }),
        ],
      ),
      KanjiEntry(
        '顔',
        'kao',
        ['ガン'],
        ['かお'],
        {'id': 'wajah', 'en': 'face'},
        [
          KanjiWord('顔色', 'かおいろ', 'kaoiro', {
            'id': 'raut wajah',
            'en': 'complexion',
          }),
          KanjiWord('笑顔', 'えがお', 'egao', {
            'id': 'wajah tersenyum',
            'en': 'smiling face',
          }),
        ],
      ),
      KanjiEntry(
        '首',
        'kubi',
        ['シュ'],
        ['くび'],
        {'id': 'leher', 'en': 'neck'},
        [
          KanjiWord('手首', 'てくび', 'tekubi', {
            'id': 'pergelangan tangan',
            'en': 'wrist',
          }),
          KanjiWord('首輪', 'くびわ', 'kubiwa', {
            'id': 'kalung hewan',
            'en': 'collar',
          }),
        ],
      ),
      KanjiEntry(
        '心',
        'kokoro',
        ['シン'],
        ['こころ'],
        {'id': 'hati; jiwa', 'en': 'heart; mind'},
        [
          KanjiWord('安心', 'あんしん', 'anshin', {
            'id': 'lega; tenang',
            'en': 'relief',
          }),
          KanjiWord('心配', 'しんぱい', 'shinpai', {'id': 'khawatir', 'en': 'worry'}),
        ],
      ),
      KanjiEntry(
        '力',
        'chikara',
        ['リョク', 'リキ'],
        ['ちから'],
        {'id': 'tenaga; kekuatan', 'en': 'power'},
        [
          KanjiWord('協力', 'きょうりょく', 'kyouryoku', {
            'id': 'kerja sama',
            'en': 'cooperation',
          }),
          KanjiWord('力持ち', 'ちからもち', 'chikaramochi', {
            'id': 'orang kuat',
            'en': 'strong person',
          }),
        ],
      ),
      KanjiEntry(
        '病',
        'byou',
        ['ビョウ'],
        ['やまい'],
        {'id': 'penyakit', 'en': 'illness'},
        [
          KanjiWord('病気', 'びょうき', 'byouki', {'id': 'sakit', 'en': 'sickness'}),
          KanjiWord('病人', 'びょうにん', 'byounin', {
            'id': 'orang sakit',
            'en': 'sick person',
          }),
        ],
      ),
      KanjiEntry(
        '医',
        'i',
        ['イ'],
        [],
        {'id': 'pengobatan; medis', 'en': 'medical'},
        [
          KanjiWord('医者', 'いしゃ', 'isha', {'id': 'dokter', 'en': 'doctor'}),
          KanjiWord('医学', 'いがく', 'igaku', {
            'id': 'ilmu kedokteran',
            'en': 'medical science',
          }),
        ],
      ),
      KanjiEntry(
        '院',
        'in',
        ['イン'],
        [],
        {'id': 'lembaga; balai', 'en': 'institution'},
        [
          KanjiWord('病院', 'びょういん', 'byouin', {
            'id': 'rumah sakit',
            'en': 'hospital',
          }),
          KanjiWord('入院', 'にゅういん', 'nyuuin', {
            'id': 'masuk rumah sakit',
            'en': 'hospitalization',
          }),
        ],
      ),
      KanjiEntry(
        '薬',
        'kusuri',
        ['ヤク'],
        ['くすり'],
        {'id': 'obat', 'en': 'medicine (drug)'},
        [
          KanjiWord('薬局', 'やっきょく', 'yakkyoku', {
            'id': 'apotek',
            'en': 'pharmacy',
          }),
          KanjiWord('目薬', 'めぐすり', 'megusuri', {
            'id': 'obat tetes mata',
            'en': 'eye drops',
          }),
        ],
      ),
      KanjiEntry(
        '死',
        'shi',
        ['シ'],
        ['し(ぬ)'],
        {'id': 'mati', 'en': 'death'},
        [
          KanjiWord('死ぬ', 'しぬ', 'shinu', {'id': 'meninggal', 'en': 'to die'}),
          KanjiWord('死亡', 'しぼう', 'shibou', {
            'id': 'kematian',
            'en': 'death (formal)',
          }),
        ],
      ),
    ],
  ),
  KanjiSection(
    {'id': 'Waktu & musim', 'en': 'Time & seasons'},
    null,
    [
      KanjiEntry(
        '春',
        'haru',
        ['シュン'],
        ['はる'],
        {'id': 'musim semi', 'en': 'spring'},
        [
          KanjiWord('春休み', 'はるやすみ', 'haruyasumi', {
            'id': 'libur musim semi',
            'en': 'spring break',
          }),
          KanjiWord('青春', 'せいしゅん', 'seishun', {
            'id': 'masa muda',
            'en': 'youth',
          }),
        ],
      ),
      KanjiEntry(
        '夏',
        'natsu',
        ['カ', 'ゲ'],
        ['なつ'],
        {'id': 'musim panas', 'en': 'summer'},
        [
          KanjiWord('夏休み', 'なつやすみ', 'natsuyasumi', {
            'id': 'libur musim panas',
            'en': 'summer vacation',
          }),
          KanjiWord('初夏', 'しょか', 'shoka', {
            'id': 'awal musim panas',
            'en': 'early summer',
          }),
        ],
      ),
      KanjiEntry(
        '秋',
        'aki',
        ['シュウ'],
        ['あき'],
        {'id': 'musim gugur', 'en': 'autumn'},
        [
          KanjiWord('秋風', 'あきかぜ', 'akikaze', {
            'id': 'angin musim gugur',
            'en': 'autumn wind',
          }),
          KanjiWord('春夏秋冬', 'しゅんかしゅうとう', 'shunkashuutou', {
            'id': 'empat musim',
            'en': 'the four seasons',
          }),
        ],
      ),
      KanjiEntry(
        '冬',
        'fuyu',
        ['トウ'],
        ['ふゆ'],
        {'id': 'musim dingin', 'en': 'winter'},
        [
          KanjiWord('冬休み', 'ふゆやすみ', 'fuyuyasumi', {
            'id': 'libur musim dingin',
            'en': 'winter vacation',
          }),
          KanjiWord('冬眠', 'とうみん', 'toumin', {
            'id': 'hibernasi',
            'en': 'hibernation',
          }),
        ],
      ),
      KanjiEntry(
        '朝',
        'asa',
        ['チョウ'],
        ['あさ'],
        {'id': 'pagi', 'en': 'morning'},
        [
          KanjiWord('朝ご飯', 'あさごはん', 'asagohan', {
            'id': 'sarapan',
            'en': 'breakfast',
          }),
          KanjiWord('今朝', 'けさ', 'kesa', {
            'id': 'tadi pagi',
            'en': 'this morning',
          }),
        ],
      ),
      KanjiEntry(
        '昼',
        'hiru',
        ['チュウ'],
        ['ひる'],
        {'id': 'siang', 'en': 'noon; daytime'},
        [
          KanjiWord('昼休み', 'ひるやすみ', 'hiruyasumi', {
            'id': 'istirahat siang',
            'en': 'lunch break',
          }),
          KanjiWord('昼食', 'ちゅうしょく', 'chuushoku', {
            'id': 'makan siang',
            'en': 'lunch',
          }),
        ],
      ),
      KanjiEntry(
        '夜',
        'yoru',
        ['ヤ'],
        ['よる', 'よ'],
        {'id': 'malam', 'en': 'night'},
        [
          KanjiWord('今夜', 'こんや', 'kon\'ya', {
            'id': 'malam ini',
            'en': 'tonight',
          }),
          KanjiWord('夜中', 'よなか', 'yonaka', {
            'id': 'tengah malam',
            'en': 'middle of the night',
          }),
        ],
      ),
      KanjiEntry(
        '夕',
        'yuu',
        ['セキ'],
        ['ゆう'],
        {'id': 'senja; sore', 'en': 'evening'},
        [
          KanjiWord('夕方', 'ゆうがた', 'yuugata', {
            'id': 'sore hari',
            'en': 'early evening',
          }),
          KanjiWord('夕飯', 'ゆうはん', 'yuuhan', {
            'id': 'makan malam',
            'en': 'supper',
          }),
        ],
      ),
      KanjiEntry(
        '曜',
        'you',
        ['ヨウ'],
        [],
        {'id': 'hari (dalam sepekan)', 'en': 'weekday'},
        [
          KanjiWord('曜日', 'ようび', 'youbi', {
            'id': 'hari dalam sepekan',
            'en': 'day of the week',
          }),
          KanjiWord('何曜日', 'なんようび', 'nan\'youbi', {
            'id': 'hari apa',
            'en': 'what day of the week',
          }),
        ],
      ),
      KanjiEntry(
        '度',
        'do',
        ['ド'],
        ['たび'],
        {'id': 'kali; derajat', 'en': 'degree; times'},
        [
          KanjiWord('今度', 'こんど', 'kondo', {
            'id': 'lain kali; kali ini',
            'en': 'next time',
          }),
          KanjiWord('温度', 'おんど', 'ondo', {'id': 'suhu', 'en': 'temperature'}),
        ],
      ),
      KanjiEntry(
        '代',
        'dai',
        ['ダイ', 'タイ'],
        ['か(わる)', 'よ'],
        {'id': 'zaman; ganti; biaya', 'en': 'era; substitute; fee'},
        [
          KanjiWord('時代', 'じだい', 'jidai', {'id': 'zaman', 'en': 'era'}),
          KanjiWord('代わり', 'かわり', 'kawari', {
            'id': 'pengganti',
            'en': 'substitute',
          }),
        ],
      ),
      KanjiEntry(
        '世',
        'yo',
        ['セ', 'セイ'],
        ['よ'],
        {'id': 'dunia; generasi', 'en': 'world; generation'},
        [
          KanjiWord('世話', 'せわ', 'sewa', {
            'id': 'perawatan; bantuan',
            'en': 'care; help',
          }),
          KanjiWord('世の中', 'よのなか', 'yononaka', {
            'id': 'masyarakat; dunia',
            'en': 'society; the world',
          }),
        ],
      ),
      KanjiEntry(
        '始',
        'hajimeru',
        ['シ'],
        ['はじ(める)', 'はじ(まる)'],
        {'id': 'mulai', 'en': 'begin'},
        [
          KanjiWord('始める', 'はじめる', 'hajimeru', {
            'id': 'memulai',
            'en': 'to begin',
          }),
          KanjiWord('開始', 'かいし', 'kaishi', {'id': 'permulaan', 'en': 'start'}),
        ],
      ),
      KanjiEntry(
        '終',
        'owaru',
        ['シュウ'],
        ['お(わる)', 'お(える)'],
        {'id': 'selesai', 'en': 'end'},
        [
          KanjiWord('終わる', 'おわる', 'owaru', {'id': 'berakhir', 'en': 'to end'}),
          KanjiWord('終電', 'しゅうでん', 'shuuden', {
            'id': 'kereta terakhir',
            'en': 'last train',
          }),
        ],
      ),
      KanjiEntry(
        '回',
        'kai',
        ['カイ'],
        ['まわ(る)', 'まわ(す)'],
        {'id': 'putaran; kali (hitungan)', 'en': 'turn; round'},
        [
          KanjiWord('今回', 'こんかい', 'konkai', {
            'id': 'kali ini',
            'en': 'this time',
          }),
          KanjiWord('回る', 'まわる', 'mawaru', {
            'id': 'berputar',
            'en': 'to turn around',
          }),
        ],
      ),
    ],
  ),
  KanjiSection(
    {'id': 'Alam, hewan & warna', 'en': 'Nature, animals & colors'},
    null,
    [
      KanjiEntry(
        '風',
        'kaze',
        ['フウ', 'フ'],
        ['かぜ'],
        {'id': 'angin', 'en': 'wind'},
        [
          KanjiWord('台風', 'たいふう', 'taifuu', {'id': 'topan', 'en': 'typhoon'}),
          KanjiWord('風呂', 'ふろ', 'furo', {'id': 'bak mandi', 'en': 'bath'}),
        ],
      ),
      KanjiEntry(
        '海',
        'umi',
        ['カイ'],
        ['うみ'],
        {'id': 'laut', 'en': 'sea'},
        [
          KanjiWord('海外', 'かいがい', 'kaigai', {
            'id': 'luar negeri',
            'en': 'overseas',
          }),
          KanjiWord('海岸', 'かいがん', 'kaigan', {'id': 'pantai', 'en': 'coast'}),
        ],
      ),
      KanjiEntry(
        '池',
        'ike',
        ['チ'],
        ['いけ'],
        {'id': 'kolam', 'en': 'pond'},
        [
          KanjiWord('電池', 'でんち', 'denchi', {'id': 'baterai', 'en': 'battery'}),
        ],
      ),
      KanjiEntry(
        '森',
        'mori',
        ['シン'],
        ['もり'],
        {'id': 'hutan lebat', 'en': 'forest'},
        [
          KanjiWord('森', 'もり', 'mori', {'id': 'hutan', 'en': 'forest'}),
          KanjiWord('森林', 'しんりん', 'shinrin', {
            'id': 'hutan rimba',
            'en': 'woods',
          }),
        ],
      ),
      KanjiEntry(
        '林',
        'hayashi',
        ['リン'],
        ['はやし'],
        {'id': 'hutan kecil', 'en': 'grove'},
        [
          KanjiWord('林', 'はやし', 'hayashi', {
            'id': 'hutan kecil',
            'en': 'grove',
          }),
          KanjiWord('林業', 'りんぎょう', 'ringyou', {
            'id': 'kehutanan',
            'en': 'forestry',
          }),
        ],
      ),
      KanjiEntry(
        '野',
        'no',
        ['ヤ'],
        ['の'],
        {'id': 'padang; ladang', 'en': 'field'},
        [
          KanjiWord('野球', 'やきゅう', 'yakyuu', {'id': 'bisbol', 'en': 'baseball'}),
          KanjiWord('分野', 'ぶんや', 'bun\'ya', {
            'id': 'bidang',
            'en': 'field (of study)',
          }),
        ],
      ),
      KanjiEntry(
        '地',
        'chi',
        ['チ', 'ジ'],
        [],
        {'id': 'tanah; bumi', 'en': 'ground; earth'},
        [
          KanjiWord('地震', 'じしん', 'jishin', {
            'id': 'gempa bumi',
            'en': 'earthquake',
          }),
          KanjiWord('地球', 'ちきゅう', 'chikyuu', {'id': 'bumi', 'en': 'the Earth'}),
        ],
      ),
      KanjiEntry(
        '光',
        'hikari',
        ['コウ'],
        ['ひかり', 'ひか(る)'],
        {'id': 'cahaya; sinar', 'en': 'light; ray'},
        [
          KanjiWord('光る', 'ひかる', 'hikaru', {
            'id': 'bersinar',
            'en': 'to shine',
          }),
          KanjiWord('観光', 'かんこう', 'kankou', {
            'id': 'wisata',
            'en': 'sightseeing',
          }),
        ],
      ),
      KanjiEntry(
        '色',
        'iro',
        ['ショク', 'シキ'],
        ['いろ'],
        {'id': 'warna', 'en': 'color'},
        [
          KanjiWord('色々', 'いろいろ', 'iroiro', {
            'id': 'bermacam-macam',
            'en': 'various',
          }),
          KanjiWord('景色', 'けしき', 'keshiki', {
            'id': 'pemandangan',
            'en': 'scenery',
          }),
        ],
      ),
      KanjiEntry(
        '黒',
        'kuro',
        ['コク'],
        ['くろ', 'くろ(い)'],
        {'id': 'hitam', 'en': 'black'},
        [
          KanjiWord('黒い', 'くろい', 'kuroi', {'id': 'hitam', 'en': 'black'}),
          KanjiWord('黒板', 'こくばん', 'kokuban', {
            'id': 'papan tulis',
            'en': 'blackboard',
          }),
        ],
      ),
      KanjiEntry(
        '犬',
        'inu',
        ['ケン'],
        ['いぬ'],
        {'id': 'anjing', 'en': 'dog'},
        [
          KanjiWord('子犬', 'こいぬ', 'koinu', {'id': 'anak anjing', 'en': 'puppy'}),
          KanjiWord('番犬', 'ばんけん', 'banken', {
            'id': 'anjing penjaga',
            'en': 'guard dog',
          }),
        ],
      ),
      KanjiEntry(
        '牛',
        'ushi',
        ['ギュウ'],
        ['うし'],
        {'id': 'sapi', 'en': 'cow'},
        [
          KanjiWord('牛肉', 'ぎゅうにく', 'gyuuniku', {
            'id': 'daging sapi',
            'en': 'beef',
          }),
          KanjiWord('牛乳', 'ぎゅうにゅう', 'gyuunyuu', {
            'id': 'susu sapi',
            'en': 'milk',
          }),
        ],
      ),
      KanjiEntry(
        '鳥',
        'tori',
        ['チョウ'],
        ['とり'],
        {'id': 'burung', 'en': 'bird'},
        [
          KanjiWord('小鳥', 'ことり', 'kotori', {
            'id': 'burung kecil',
            'en': 'small bird',
          }),
          KanjiWord('焼き鳥', 'やきとり', 'yakitori', {
            'id': 'sate ayam Jepang',
            'en': 'yakitori',
          }),
        ],
      ),
    ],
  ),
  KanjiSection(
    {'id': 'Tempat & kota', 'en': 'Places & towns'},
    null,
    [
      KanjiEntry(
        '京',
        'kyou',
        ['キョウ', 'ケイ'],
        [],
        {'id': 'ibu kota', 'en': 'capital'},
        [
          KanjiWord('京都', 'きょうと', 'kyouto', {'id': 'Kyoto', 'en': 'Kyoto'}),
          KanjiWord('上京', 'じょうきょう', 'joukyou', {
            'id': 'pergi ke Tokyo',
            'en': 'moving to Tokyo',
          }),
        ],
      ),
      KanjiEntry(
        '都',
        'to',
        ['ト', 'ツ'],
        ['みやこ'],
        {'id': 'kota besar; metropolitan', 'en': 'metropolis'},
        [
          KanjiWord('首都', 'しゅと', 'shuto', {
            'id': 'ibu kota negara',
            'en': 'capital city',
          }),
          KanjiWord('都合', 'つごう', 'tsugou', {
            'id': 'kesempatan; kondisi',
            'en': 'convenience',
          }),
        ],
      ),
      KanjiEntry(
        '県',
        'ken',
        ['ケン'],
        [],
        {'id': 'prefektur', 'en': 'prefecture'},
        [
          KanjiWord('県立', 'けんりつ', 'kenritsu', {
            'id': 'milik prefektur',
            'en': 'prefectural',
          }),
          KanjiWord('県民', 'けんみん', 'kenmin', {
            'id': 'warga prefektur',
            'en': 'prefecture residents',
          }),
        ],
      ),
      KanjiEntry(
        '市',
        'shi',
        ['シ'],
        ['いち'],
        {'id': 'kota', 'en': 'city'},
        [
          KanjiWord('市場', 'いちば', 'ichiba', {'id': 'pasar', 'en': 'market'}),
          KanjiWord('市役所', 'しやくしょ', 'shiyakusho', {
            'id': 'balai kota',
            'en': 'city hall',
          }),
        ],
      ),
      KanjiEntry('区', 'ku', ['ク'], [], {'id': 'distrik', 'en': 'ward'}, [
        KanjiWord('区役所', 'くやくしょ', 'kuyakusho', {
          'id': 'kantor distrik',
          'en': 'ward office',
        }),
        KanjiWord('地区', 'ちく', 'chiku', {'id': 'kawasan', 'en': 'district'}),
      ]),
      KanjiEntry(
        '町',
        'machi',
        ['チョウ'],
        ['まち'],
        {'id': 'kota kecil', 'en': 'town'},
        [
          KanjiWord('下町', 'したまち', 'shitamachi', {
            'id': 'kota lama',
            'en': 'old downtown',
          }),
          KanjiWord('町内', 'ちょうない', 'chounai', {
            'id': 'lingkungan kampung',
            'en': 'neighborhood (block)',
          }),
        ],
      ),
      KanjiEntry(
        '村',
        'mura',
        ['ソン'],
        ['むら'],
        {'id': 'desa', 'en': 'village'},
        [
          KanjiWord('村長', 'そんちょう', 'sonchou', {
            'id': 'kepala desa',
            'en': 'village head',
          }),
          KanjiWord('農村', 'のうそん', 'nouson', {
            'id': 'desa pertanian',
            'en': 'farming village',
          }),
        ],
      ),
      KanjiEntry(
        '館',
        'kan',
        ['カン'],
        ['やかた'],
        {'id': 'gedung', 'en': 'large building'},
        [
          KanjiWord('映画館', 'えいがかん', 'eigakan', {
            'id': 'bioskop',
            'en': 'movie theater',
          }),
          KanjiWord('美術館', 'びじゅつかん', 'bijutsukan', {
            'id': 'museum seni',
            'en': 'art museum',
          }),
        ],
      ),
      KanjiEntry('堂', 'dou', ['ドウ'], [], {'id': 'aula; balai', 'en': 'hall'}, [
        KanjiWord('食堂', 'しょくどう', 'shokudou', {
          'id': 'kantin',
          'en': 'cafeteria',
        }),
        KanjiWord('講堂', 'こうどう', 'koudou', {'id': 'aula', 'en': 'auditorium'}),
      ]),
      KanjiEntry(
        '屋',
        'ya',
        ['オク'],
        ['や'],
        {'id': 'toko; rumah; atap', 'en': 'shop; roof'},
        [
          KanjiWord('部屋', 'へや', 'heya', {'id': 'kamar', 'en': 'room'}),
          KanjiWord('屋上', 'おくじょう', 'okujou', {
            'id': 'atap gedung',
            'en': 'rooftop',
          }),
        ],
      ),
      KanjiEntry('室', 'shitsu', ['シツ'], [], {'id': 'ruang', 'en': 'room'}, [
        KanjiWord('教室', 'きょうしつ', 'kyoushitsu', {
          'id': 'ruang kelas',
          'en': 'classroom',
        }),
        KanjiWord('会議室', 'かいぎしつ', 'kaigishitsu', {
          'id': 'ruang rapat',
          'en': 'meeting room',
        }),
      ]),
      KanjiEntry(
        '場',
        'ba',
        ['ジョウ'],
        ['ば'],
        {'id': 'tempat (lokasi kejadian)', 'en': 'place; scene'},
        [
          KanjiWord('場所', 'ばしょ', 'basho', {'id': 'tempat', 'en': 'place'}),
          KanjiWord('会場', 'かいじょう', 'kaijou', {
            'id': 'tempat acara',
            'en': 'venue',
          }),
        ],
      ),
      KanjiEntry(
        '所',
        'tokoro',
        ['ショ', 'ジョ'],
        ['ところ'],
        {'id': 'tempat; alamat', 'en': 'location; address'},
        [
          KanjiWord('近所', 'きんじょ', 'kinjo', {
            'id': 'sekitar rumah',
            'en': 'neighborhood',
          }),
          KanjiWord('住所', 'じゅうしょ', 'juusho', {'id': 'alamat', 'en': 'address'}),
        ],
      ),
      KanjiEntry(
        '門',
        'mon',
        ['モン'],
        ['かど'],
        {'id': 'gerbang', 'en': 'gate'},
        [
          KanjiWord('専門', 'せんもん', 'senmon', {
            'id': 'keahlian; jurusan',
            'en': 'specialty',
          }),
          KanjiWord('正門', 'せいもん', 'seimon', {
            'id': 'gerbang utama',
            'en': 'main gate',
          }),
        ],
      ),
      KanjiEntry(
        '台',
        'dai',
        ['ダイ', 'タイ'],
        [],
        {
          'id': 'alas; unit (mesin/kendaraan)',
          'en': 'stand; counter for machines',
        },
        [
          KanjiWord('台所', 'だいどころ', 'daidokoro', {
            'id': 'dapur',
            'en': 'kitchen',
          }),
          KanjiWord('舞台', 'ぶたい', 'butai', {'id': 'panggung', 'en': 'stage'}),
        ],
      ),
      KanjiEntry(
        '住',
        'sumu',
        ['ジュウ'],
        ['す(む)'],
        {'id': 'tinggal; menetap', 'en': 'live (reside)'},
        [
          KanjiWord('住む', 'すむ', 'sumu', {'id': 'tinggal', 'en': 'to live'}),
          KanjiWord('住民', 'じゅうみん', 'juumin', {
            'id': 'penduduk',
            'en': 'residents',
          }),
        ],
      ),
      KanjiEntry(
        '界',
        'kai',
        ['カイ'],
        [],
        {'id': 'batas; kalangan', 'en': 'boundary; circles'},
        [
          KanjiWord('世界', 'せかい', 'sekai', {'id': 'dunia', 'en': 'world'}),
          KanjiWord('業界', 'ぎょうかい', 'gyoukai', {
            'id': 'dunia industri',
            'en': 'industry',
          }),
        ],
      ),
    ],
  ),
  KanjiSection(
    {'id': 'Sekolah & belajar', 'en': 'School & study'},
    null,
    [
      KanjiEntry(
        '教',
        'oshieru',
        ['キョウ'],
        ['おし(える)', 'おそ(わる)'],
        {'id': 'mengajar', 'en': 'teach'},
        [
          KanjiWord('教える', 'おしえる', 'oshieru', {
            'id': 'mengajar; memberi tahu',
            'en': 'to teach',
          }),
          KanjiWord('教育', 'きょういく', 'kyouiku', {
            'id': 'pendidikan',
            'en': 'education',
          }),
        ],
      ),
      KanjiEntry(
        '習',
        'narau',
        ['シュウ'],
        ['なら(う)'],
        {'id': 'belajar (dari orang)', 'en': 'learn'},
        [
          KanjiWord('習う', 'ならう', 'narau', {
            'id': 'belajar (pada guru)',
            'en': 'to learn',
          }),
          KanjiWord('練習', 'れんしゅう', 'renshuu', {
            'id': 'latihan',
            'en': 'practice',
          }),
        ],
      ),
      KanjiEntry(
        '勉',
        'ben',
        ['ベン'],
        [],
        {'id': 'rajin; berusaha', 'en': 'diligence'},
        [
          KanjiWord('勉強', 'べんきょう', 'benkyou', {'id': 'belajar', 'en': 'study'}),
          KanjiWord('勤勉', 'きんべん', 'kinben', {'id': 'rajin', 'en': 'diligent'}),
        ],
      ),
      KanjiEntry(
        '強',
        'tsuyoi',
        ['キョウ', 'ゴウ'],
        ['つよ(い)'],
        {'id': 'kuat', 'en': 'strong'},
        [
          KanjiWord('強い', 'つよい', 'tsuyoi', {'id': 'kuat', 'en': 'strong'}),
          KanjiWord('強風', 'きょうふう', 'kyoufuu', {
            'id': 'angin kencang',
            'en': 'strong wind',
          }),
        ],
      ),
      KanjiEntry(
        '研',
        'ken',
        ['ケン'],
        ['と(ぐ)'],
        {'id': 'mengasah; meneliti', 'en': 'polish; research'},
        [
          KanjiWord('研修', 'けんしゅう', 'kenshuu', {
            'id': 'pelatihan',
            'en': 'training',
          }),
          KanjiWord('研究室', 'けんきゅうしつ', 'kenkyuushitsu', {
            'id': 'laboratorium',
            'en': 'laboratory',
          }),
        ],
      ),
      KanjiEntry(
        '究',
        'kyuu',
        ['キュウ'],
        ['きわ(める)'],
        {'id': 'menyelidiki', 'en': 'investigate'},
        [
          KanjiWord('研究', 'けんきゅう', 'kenkyuu', {
            'id': 'penelitian',
            'en': 'research',
          }),
          KanjiWord('究明', 'きゅうめい', 'kyuumei', {
            'id': 'pengungkapan',
            'en': 'investigation',
          }),
        ],
      ),
      KanjiEntry(
        '試',
        'shi',
        ['シ'],
        ['ため(す)', 'こころ(みる)'],
        {'id': 'mencoba; menguji', 'en': 'try; test'},
        [
          KanjiWord('試験', 'しけん', 'shiken', {'id': 'ujian', 'en': 'exam'}),
          KanjiWord('試合', 'しあい', 'shiai', {
            'id': 'pertandingan',
            'en': 'match',
          }),
        ],
      ),
      KanjiEntry(
        '験',
        'ken',
        ['ケン', 'ゲン'],
        [],
        {'id': 'bukti; pengujian', 'en': 'verify; effect'},
        [
          KanjiWord('経験', 'けいけん', 'keiken', {
            'id': 'pengalaman',
            'en': 'experience',
          }),
          KanjiWord('実験', 'じっけん', 'jikken', {
            'id': 'eksperimen',
            'en': 'experiment',
          }),
        ],
      ),
      KanjiEntry(
        '質',
        'shitsu',
        ['シツ', 'シチ'],
        [],
        {'id': 'mutu; sifat', 'en': 'quality'},
        [
          KanjiWord('質問', 'しつもん', 'shitsumon', {
            'id': 'pertanyaan',
            'en': 'question',
          }),
          KanjiWord('品質', 'ひんしつ', 'hinshitsu', {
            'id': 'kualitas',
            'en': 'product quality',
          }),
        ],
      ),
      KanjiEntry(
        '問',
        'mon',
        ['モン'],
        ['と(う)'],
        {'id': 'tanya; masalah', 'en': 'ask; problem'},
        [
          KanjiWord('問題', 'もんだい', 'mondai', {
            'id': 'soal; masalah',
            'en': 'problem',
          }),
          KanjiWord('学問', 'がくもん', 'gakumon', {
            'id': 'ilmu pengetahuan',
            'en': 'learning',
          }),
        ],
      ),
      KanjiEntry(
        '題',
        'dai',
        ['ダイ'],
        [],
        {'id': 'judul; topik', 'en': 'topic; title'},
        [
          KanjiWord('宿題', 'しゅくだい', 'shukudai', {'id': 'PR', 'en': 'homework'}),
          KanjiWord('話題', 'わだい', 'wadai', {
            'id': 'topik pembicaraan',
            'en': 'topic of conversation',
          }),
        ],
      ),
      KanjiEntry(
        '答',
        'kotae',
        ['トウ'],
        ['こた(える)', 'こた(え)'],
        {'id': 'jawab', 'en': 'answer'},
        [
          KanjiWord('答える', 'こたえる', 'kotaeru', {
            'id': 'menjawab',
            'en': 'to answer',
          }),
          KanjiWord('回答', 'かいとう', 'kaitou', {
            'id': 'jawaban (resmi)',
            'en': 'reply',
          }),
        ],
      ),
      KanjiEntry(
        '字',
        'ji',
        ['ジ'],
        ['あざ'],
        {'id': 'huruf', 'en': 'letter (character)'},
        [
          KanjiWord('文字', 'もじ', 'moji', {
            'id': 'huruf; aksara',
            'en': 'characters',
          }),
          KanjiWord('数字', 'すうじ', 'suuji', {'id': 'angka', 'en': 'numeral'}),
        ],
      ),
      KanjiEntry(
        '漢',
        'kan',
        ['カン'],
        [],
        {'id': 'Tiongkok (dinasti Han)', 'en': 'Han China'},
        [
          KanjiWord('漢字', 'かんじ', 'kanji', {'id': 'kanji', 'en': 'kanji'}),
          KanjiWord('漢方', 'かんぽう', 'kanpou', {
            'id': 'obat herbal Tiongkok',
            'en': 'Chinese herbal medicine',
          }),
        ],
      ),
      KanjiEntry(
        '文',
        'bun',
        ['ブン', 'モン'],
        ['ふみ'],
        {'id': 'tulisan; kalimat', 'en': 'sentence; writing'},
        [
          KanjiWord('文化', 'ぶんか', 'bunka', {'id': 'budaya', 'en': 'culture'}),
          KanjiWord('文法', 'ぶんぽう', 'bunpou', {
            'id': 'tata bahasa',
            'en': 'grammar',
          }),
        ],
      ),
      KanjiEntry(
        '英',
        'ei',
        ['エイ'],
        [],
        {'id': 'Inggris; unggul', 'en': 'English; excellent'},
        [
          KanjiWord('英会話', 'えいかいわ', 'eikaiwa', {
            'id': 'percakapan bahasa Inggris',
            'en': 'English conversation',
          }),
          KanjiWord('英国', 'えいこく', 'eikoku', {
            'id': 'Inggris (Britania)',
            'en': 'Britain',
          }),
        ],
      ),
      KanjiEntry(
        '説',
        'setsu',
        ['セツ', 'ゼイ'],
        ['と(く)'],
        {'id': 'menjelaskan; teori', 'en': 'explain; theory'},
        [
          KanjiWord('説明', 'せつめい', 'setsumei', {
            'id': 'penjelasan',
            'en': 'explanation',
          }),
          KanjiWord('小説', 'しょうせつ', 'shousetsu', {'id': 'novel', 'en': 'novel'}),
        ],
      ),
      KanjiEntry(
        '図',
        'zu',
        ['ズ', 'ト'],
        ['はか(る)'],
        {'id': 'gambar; bagan', 'en': 'diagram; drawing'},
        [
          KanjiWord('地図', 'ちず', 'chizu', {'id': 'peta', 'en': 'map'}),
          KanjiWord('図書館', 'としょかん', 'toshokan', {
            'id': 'perpustakaan',
            'en': 'library',
          }),
        ],
      ),
      KanjiEntry(
        '理',
        'ri',
        ['リ'],
        [],
        {'id': 'logika; alasan', 'en': 'reason; logic'},
        [
          KanjiWord('理由', 'りゆう', 'riyuu', {'id': 'alasan', 'en': 'reason'}),
          KanjiWord('無理', 'むり', 'muri', {
            'id': 'mustahil; terlalu memaksa',
            'en': 'impossible',
          }),
        ],
      ),
      KanjiEntry(
        '音',
        'oto',
        ['オン', 'イン'],
        ['おと', 'ね'],
        {'id': 'bunyi', 'en': 'sound'},
        [
          KanjiWord('音楽', 'おんがく', 'ongaku', {'id': 'musik', 'en': 'music'}),
          KanjiWord('足音', 'あしおと', 'ashioto', {
            'id': 'suara langkah',
            'en': 'footsteps',
          }),
        ],
      ),
      KanjiEntry(
        '声',
        'koe',
        ['セイ'],
        ['こえ'],
        {'id': 'suara (manusia)', 'en': 'voice'},
        [
          KanjiWord('声優', 'せいゆう', 'seiyuu', {
            'id': 'pengisi suara',
            'en': 'voice actor',
          }),
          KanjiWord('歌声', 'うたごえ', 'utagoe', {
            'id': 'suara nyanyian',
            'en': 'singing voice',
          }),
        ],
      ),
      KanjiEntry(
        '歌',
        'uta',
        ['カ'],
        ['うた', 'うた(う)'],
        {'id': 'lagu; bernyanyi', 'en': 'song; sing'},
        [
          KanjiWord('歌う', 'うたう', 'utau', {'id': 'bernyanyi', 'en': 'to sing'}),
          KanjiWord('歌手', 'かしゅ', 'kashu', {'id': 'penyanyi', 'en': 'singer'}),
        ],
      ),
      KanjiEntry(
        '楽',
        'tanoshii',
        ['ガク', 'ラク'],
        ['たの(しい)'],
        {'id': 'senang; musik', 'en': 'fun; music'},
        [
          KanjiWord('楽しい', 'たのしい', 'tanoshii', {
            'id': 'menyenangkan',
            'en': 'fun',
          }),
          KanjiWord('楽器', 'がっき', 'gakki', {
            'id': 'alat musik',
            'en': 'musical instrument',
          }),
        ],
      ),
      KanjiEntry(
        '画',
        'ga',
        ['ガ', 'カク'],
        [],
        {'id': 'gambar; rencana', 'en': 'picture; plan'},
        [
          KanjiWord('漫画', 'まんが', 'manga', {'id': 'komik', 'en': 'comics'}),
          KanjiWord('計画', 'けいかく', 'keikaku', {'id': 'rencana', 'en': 'plan'}),
        ],
      ),
      KanjiEntry(
        '映',
        'ei',
        ['エイ'],
        ['うつ(る)', 'うつ(す)'],
        {'id': 'memantulkan; menayangkan', 'en': 'reflect; project'},
        [
          KanjiWord('映画', 'えいが', 'eiga', {'id': 'film', 'en': 'movie'}),
          KanjiWord('上映', 'じょうえい', 'jouei', {
            'id': 'pemutaran film',
            'en': 'screening',
          }),
        ],
      ),
      KanjiEntry(
        '写',
        'utsusu',
        ['シャ'],
        ['うつ(す)', 'うつ(る)'],
        {'id': 'menyalin; memotret', 'en': 'copy; photograph'},
        [
          KanjiWord('写真', 'しゃしん', 'shashin', {'id': 'foto', 'en': 'photo'}),
          KanjiWord('写す', 'うつす', 'utsusu', {
            'id': 'menyalin; memotret',
            'en': 'to copy; to photograph',
          }),
        ],
      ),
      KanjiEntry(
        '紙',
        'kami',
        ['シ'],
        ['かみ'],
        {'id': 'kertas', 'en': 'paper'},
        [
          KanjiWord('手紙', 'てがみ', 'tegami', {'id': 'surat', 'en': 'letter'}),
          KanjiWord('和紙', 'わし', 'washi', {
            'id': 'kertas Jepang',
            'en': 'Japanese paper',
          }),
        ],
      ),
    ],
  ),
  KanjiSection(
    {'id': 'Makanan, belanja & barang', 'en': 'Food, shopping & goods'},
    null,
    [
      KanjiEntry('肉', 'niku', ['ニク'], [], {'id': 'daging', 'en': 'meat'}, [
        KanjiWord('鶏肉', 'とりにく', 'toriniku', {
          'id': 'daging ayam',
          'en': 'chicken (meat)',
        }),
        KanjiWord('豚肉', 'ぶたにく', 'butaniku', {
          'id': 'daging babi',
          'en': 'pork',
        }),
      ]),
      KanjiEntry(
        '飯',
        'han',
        ['ハン'],
        ['めし'],
        {'id': 'nasi; makanan', 'en': 'cooked rice; meal'},
        [
          KanjiWord('ご飯', 'ごはん', 'gohan', {
            'id': 'nasi; makan',
            'en': 'rice; meal',
          }),
          KanjiWord('晩ご飯', 'ばんごはん', 'bangohan', {
            'id': 'makan malam',
            'en': 'dinner',
          }),
        ],
      ),
      KanjiEntry('茶', 'cha', ['チャ', 'サ'], [], {'id': 'teh', 'en': 'tea'}, [
        KanjiWord('お茶', 'おちゃ', 'ocha', {'id': 'teh', 'en': 'tea'}),
        KanjiWord('茶色', 'ちゃいろ', 'chairo', {
          'id': 'cokelat (warna)',
          'en': 'brown',
        }),
      ]),
      KanjiEntry(
        '菜',
        'sai',
        ['サイ'],
        ['な'],
        {'id': 'sayuran', 'en': 'vegetable; greens'},
        [
          KanjiWord('野菜', 'やさい', 'yasai', {'id': 'sayur', 'en': 'vegetables'}),
          KanjiWord('菜の花', 'なのはな', 'nanohana', {
            'id': 'bunga sesawi',
            'en': 'rapeseed blossoms',
          }),
        ],
      ),
      KanjiEntry(
        '料',
        'ryou',
        ['リョウ'],
        [],
        {'id': 'bahan; tarif', 'en': 'materials; fee'},
        [
          KanjiWord('料理', 'りょうり', 'ryouri', {'id': 'masakan', 'en': 'cooking'}),
          KanjiWord('料金', 'りょうきん', 'ryoukin', {'id': 'tarif', 'en': 'charge'}),
        ],
      ),
      KanjiEntry(
        '味',
        'aji',
        ['ミ'],
        ['あじ', 'あじ(わう)'],
        {'id': 'rasa', 'en': 'taste'},
        [
          KanjiWord('意味', 'いみ', 'imi', {'id': 'arti', 'en': 'meaning'}),
          KanjiWord('趣味', 'しゅみ', 'shumi', {'id': 'hobi', 'en': 'hobby'}),
        ],
      ),
      KanjiEntry(
        '洋',
        'you',
        ['ヨウ'],
        [],
        {'id': 'samudra; Barat', 'en': 'ocean; Western'},
        [
          KanjiWord('洋服', 'ようふく', 'youfuku', {
            'id': 'pakaian (gaya Barat)',
            'en': 'Western clothes',
          }),
          KanjiWord('太平洋', 'たいへいよう', 'taiheiyou', {
            'id': 'Samudra Pasifik',
            'en': 'Pacific Ocean',
          }),
        ],
      ),
      KanjiEntry('服', 'fuku', ['フク'], [], {'id': 'pakaian', 'en': 'clothes'}, [
        KanjiWord('服', 'ふく', 'fuku', {'id': 'baju', 'en': 'clothes'}),
        KanjiWord('制服', 'せいふく', 'seifuku', {'id': 'seragam', 'en': 'uniform'}),
      ]),
      KanjiEntry(
        '品',
        'shina',
        ['ヒン'],
        ['しな'],
        {'id': 'barang; mutu', 'en': 'goods'},
        [
          KanjiWord('品物', 'しなもの', 'shinamono', {'id': 'barang', 'en': 'goods'}),
          KanjiWord('作品', 'さくひん', 'sakuhin', {
            'id': 'karya',
            'en': 'work (of art)',
          }),
        ],
      ),
      KanjiEntry(
        '物',
        'mono',
        ['ブツ', 'モツ'],
        ['もの'],
        {'id': 'benda', 'en': 'thing'},
        [
          KanjiWord('買い物', 'かいもの', 'kaimono', {
            'id': 'belanja',
            'en': 'shopping',
          }),
          KanjiWord('荷物', 'にもつ', 'nimotsu', {
            'id': 'barang bawaan',
            'en': 'luggage',
          }),
        ],
      ),
      KanjiEntry(
        '買',
        'kau',
        ['バイ'],
        ['か(う)'],
        {'id': 'membeli', 'en': 'buy'},
        [
          KanjiWord('買う', 'かう', 'kau', {'id': 'membeli', 'en': 'to buy'}),
          KanjiWord('売買', 'ばいばい', 'baibai', {'id': 'jual beli', 'en': 'trade'}),
        ],
      ),
      KanjiEntry(
        '売',
        'uru',
        ['バイ'],
        ['う(る)', 'う(れる)'],
        {'id': 'menjual', 'en': 'sell'},
        [
          KanjiWord('売る', 'うる', 'uru', {'id': 'menjual', 'en': 'to sell'}),
          KanjiWord('売り場', 'うりば', 'uriba', {
            'id': 'bagian penjualan',
            'en': 'sales counter',
          }),
        ],
      ),
      KanjiEntry(
        '貸',
        'kasu',
        ['タイ'],
        ['か(す)'],
        {'id': 'meminjamkan', 'en': 'lend'},
        [
          KanjiWord('貸す', 'かす', 'kasu', {'id': 'meminjamkan', 'en': 'to lend'}),
          KanjiWord('賃貸', 'ちんたい', 'chintai', {'id': 'sewa', 'en': 'rental'}),
        ],
      ),
      KanjiEntry(
        '借',
        'kariru',
        ['シャク'],
        ['か(りる)'],
        {'id': 'meminjam', 'en': 'borrow'},
        [
          KanjiWord('借りる', 'かりる', 'kariru', {
            'id': 'meminjam',
            'en': 'to borrow',
          }),
          KanjiWord('借金', 'しゃっきん', 'shakkin', {'id': 'utang', 'en': 'debt'}),
        ],
      ),
      KanjiEntry('銀', 'gin', ['ギン'], [], {'id': 'perak', 'en': 'silver'}, [
        KanjiWord('銀行', 'ぎんこう', 'ginkou', {'id': 'bank', 'en': 'bank'}),
        KanjiWord('銀色', 'ぎんいろ', 'gin\'iro', {
          'id': 'warna perak',
          'en': 'silver color',
        }),
      ]),
      KanjiEntry(
        '旅',
        'tabi',
        ['リョ'],
        ['たび'],
        {'id': 'perjalanan', 'en': 'travel'},
        [
          KanjiWord('旅行', 'りょこう', 'ryokou', {
            'id': 'wisata; perjalanan',
            'en': 'trip',
          }),
          KanjiWord('旅館', 'りょかん', 'ryokan', {
            'id': 'penginapan Jepang',
            'en': 'Japanese inn',
          }),
        ],
      ),
      KanjiEntry(
        '便',
        'ben',
        ['ベン', 'ビン'],
        ['たよ(り)'],
        {'id': 'praktis; pos', 'en': 'convenient; mail'},
        [
          KanjiWord('便利', 'べんり', 'benri', {
            'id': 'praktis',
            'en': 'convenient',
          }),
          KanjiWord('郵便局', 'ゆうびんきょく', 'yuubinkyoku', {
            'id': 'kantor pos',
            'en': 'post office',
          }),
        ],
      ),
      KanjiEntry(
        '利',
        'ri',
        ['リ'],
        ['き(く)'],
        {'id': 'manfaat; untung', 'en': 'benefit; profit'},
        [
          KanjiWord('利用', 'りよう', 'riyou', {'id': 'pemanfaatan', 'en': 'use'}),
          KanjiWord('有利', 'ゆうり', 'yuuri', {
            'id': 'menguntungkan',
            'en': 'advantageous',
          }),
        ],
      ),
      KanjiEntry(
        '有',
        'yuu',
        ['ユウ', 'ウ'],
        ['あ(る)'],
        {'id': 'ada; memiliki', 'en': 'have; exist'},
        [
          KanjiWord('有名', 'ゆうめい', 'yuumei', {'id': 'terkenal', 'en': 'famous'}),
          KanjiWord('有料', 'ゆうりょう', 'yuuryou', {
            'id': 'berbayar',
            'en': 'paid (not free)',
          }),
        ],
      ),
    ],
  ),
  KanjiSection(
    {'id': 'Pekerjaan & masyarakat', 'en': 'Work & society'},
    null,
    [
      KanjiEntry(
        '仕',
        'shi',
        ['シ', 'ジ'],
        ['つか(える)'],
        {'id': 'melayani', 'en': 'serve'},
        [
          KanjiWord('仕事', 'しごと', 'shigoto', {'id': 'pekerjaan', 'en': 'job'}),
          KanjiWord('仕方', 'しかた', 'shikata', {
            'id': 'cara',
            'en': 'way (of doing)',
          }),
        ],
      ),
      KanjiEntry(
        '事',
        'koto',
        ['ジ', 'ズ'],
        ['こと'],
        {'id': 'hal; urusan', 'en': 'matter; affair'},
        [
          KanjiWord('事故', 'じこ', 'jiko', {'id': 'kecelakaan', 'en': 'accident'}),
          KanjiWord('事務所', 'じむしょ', 'jimusho', {'id': 'kantor', 'en': 'office'}),
        ],
      ),
      KanjiEntry(
        '社',
        'sha',
        ['シャ', 'ジャ'],
        ['やしろ'],
        {'id': 'perusahaan; kuil', 'en': 'company; shrine'},
        [
          KanjiWord('会社', 'かいしゃ', 'kaisha', {
            'id': 'perusahaan',
            'en': 'company',
          }),
          KanjiWord('神社', 'じんじゃ', 'jinja', {
            'id': 'kuil Shinto',
            'en': 'Shinto shrine',
          }),
        ],
      ),
      KanjiEntry(
        '会',
        'kai',
        ['カイ', 'エ'],
        ['あ(う)'],
        {'id': 'bertemu; perkumpulan', 'en': 'meet; association'},
        [
          KanjiWord('会う', 'あう', 'au', {'id': 'bertemu', 'en': 'to meet'}),
          KanjiWord('会議', 'かいぎ', 'kaigi', {'id': 'rapat', 'en': 'meeting'}),
        ],
      ),
      KanjiEntry(
        '業',
        'gyou',
        ['ギョウ', 'ゴウ'],
        ['わざ'],
        {'id': 'usaha; industri', 'en': 'business; industry'},
        [
          KanjiWord('授業', 'じゅぎょう', 'jugyou', {
            'id': 'pelajaran (di kelas)',
            'en': 'class (lesson)',
          }),
          KanjiWord('卒業', 'そつぎょう', 'sotsugyou', {
            'id': 'lulus',
            'en': 'graduation',
          }),
        ],
      ),
      KanjiEntry(
        '工',
        'kou',
        ['コウ', 'ク'],
        [],
        {'id': 'kerajinan; teknik', 'en': 'craft; engineering'},
        [
          KanjiWord('工場', 'こうじょう', 'koujou', {'id': 'pabrik', 'en': 'factory'}),
          KanjiWord('工事', 'こうじ', 'kouji', {
            'id': 'pekerjaan konstruksi',
            'en': 'construction work',
          }),
        ],
      ),
      KanjiEntry(
        '働',
        'hataraku',
        ['ドウ'],
        ['はたら(く)'],
        {'id': 'bekerja', 'en': 'work'},
        [
          KanjiWord('働く', 'はたらく', 'hataraku', {
            'id': 'bekerja',
            'en': 'to work',
          }),
          KanjiWord('労働', 'ろうどう', 'roudou', {
            'id': 'kerja; buruh',
            'en': 'labor',
          }),
        ],
      ),
      KanjiEntry(
        '産',
        'san',
        ['サン'],
        ['う(む)'],
        {'id': 'melahirkan; menghasilkan', 'en': 'give birth; produce'},
        [
          KanjiWord('お土産', 'おみやげ', 'omiyage', {
            'id': 'oleh-oleh',
            'en': 'souvenir',
          }),
          KanjiWord('産業', 'さんぎょう', 'sangyou', {
            'id': 'industri',
            'en': 'industry (sector)',
          }),
        ],
      ),
      KanjiEntry(
        '公',
        'kou',
        ['コウ'],
        ['おおやけ'],
        {'id': 'umum; publik', 'en': 'public'},
        [
          KanjiWord('公園', 'こうえん', 'kouen', {'id': 'taman', 'en': 'park'}),
          KanjiWord('公務員', 'こうむいん', 'koumuin', {
            'id': 'pegawai negeri',
            'en': 'civil servant',
          }),
        ],
      ),
      KanjiEntry('特', 'toku', ['トク'], [], {'id': 'khusus', 'en': 'special'}, [
        KanjiWord('特に', 'とくに', 'tokuni', {
          'id': 'terutama',
          'en': 'especially',
        }),
        KanjiWord('特別', 'とくべつ', 'tokubetsu', {
          'id': 'istimewa',
          'en': 'special',
        }),
      ]),
      KanjiEntry(
        '別',
        'betsu',
        ['ベツ'],
        ['わか(れる)'],
        {'id': 'berbeda; berpisah', 'en': 'separate; different'},
        [
          KanjiWord('別れる', 'わかれる', 'wakareru', {
            'id': 'berpisah',
            'en': 'to part',
          }),
          KanjiWord('区別', 'くべつ', 'kubetsu', {
            'id': 'pembedaan',
            'en': 'distinction',
          }),
        ],
      ),
      KanjiEntry(
        '計',
        'kei',
        ['ケイ'],
        ['はか(る)'],
        {'id': 'mengukur; menghitung', 'en': 'measure; total'},
        [
          KanjiWord('合計', 'ごうけい', 'goukei', {
            'id': 'jumlah total',
            'en': 'total',
          }),
          KanjiWord('計算', 'けいさん', 'keisan', {
            'id': 'perhitungan',
            'en': 'calculation',
          }),
        ],
      ),
      KanjiEntry(
        '用',
        'you',
        ['ヨウ'],
        ['もち(いる)'],
        {'id': 'keperluan; guna', 'en': 'errand; utility'},
        [
          KanjiWord('用事', 'ようじ', 'youji', {'id': 'urusan', 'en': 'errand'}),
          KanjiWord('用意', 'ようい', 'youi', {
            'id': 'persiapan',
            'en': 'preparation',
          }),
        ],
      ),
      KanjiEntry(
        '使',
        'tsukau',
        ['シ'],
        ['つか(う)'],
        {'id': 'memakai; menggunakan', 'en': 'use'},
        [
          KanjiWord('使う', 'つかう', 'tsukau', {'id': 'memakai', 'en': 'to use'}),
          KanjiWord('使用', 'しよう', 'shiyou', {'id': 'pemakaian', 'en': 'usage'}),
        ],
      ),
      KanjiEntry(
        '以',
        'i',
        ['イ'],
        [],
        {'id': 'dari; sejak (patokan)', 'en': 'by means of; from'},
        [
          KanjiWord('以上', 'いじょう', 'ijou', {
            'id': 'lebih dari; sekian',
            'en': 'more than',
          }),
          KanjiWord('以外', 'いがい', 'igai', {'id': 'selain', 'en': 'except'}),
        ],
      ),
      KanjiEntry(
        '方',
        'kata',
        ['ホウ'],
        ['かた'],
        {'id': 'arah; cara', 'en': 'direction; way'},
        [
          KanjiWord('方法', 'ほうほう', 'houhou', {'id': 'metode', 'en': 'method'}),
          KanjiWord('両方', 'りょうほう', 'ryouhou', {'id': 'keduanya', 'en': 'both'}),
        ],
      ),
      KanjiEntry(
        '意',
        'i',
        ['イ'],
        [],
        {'id': 'maksud; pikiran', 'en': 'intention'},
        [
          KanjiWord('意見', 'いけん', 'iken', {'id': 'pendapat', 'en': 'opinion'}),
          KanjiWord('注意', 'ちゅうい', 'chuui', {
            'id': 'perhatian; peringatan',
            'en': 'caution',
          }),
        ],
      ),
      KanjiEntry(
        '注',
        'chuu',
        ['チュウ'],
        ['そそ(ぐ)'],
        {'id': 'menuang; memperhatikan', 'en': 'pour; note'},
        [
          KanjiWord('注文', 'ちゅうもん', 'chuumon', {'id': 'pesanan', 'en': 'order'}),
          KanjiWord('注射', 'ちゅうしゃ', 'chuusha', {
            'id': 'suntikan',
            'en': 'injection',
          }),
        ],
      ),
      KanjiEntry(
        '発',
        'hatsu',
        ['ハツ', 'ホツ'],
        [],
        {'id': 'berangkat; muncul', 'en': 'depart; emit'},
        [
          KanjiWord('発音', 'はつおん', 'hatsuon', {
            'id': 'pelafalan',
            'en': 'pronunciation',
          }),
          KanjiWord('発表', 'はっぴょう', 'happyou', {
            'id': 'presentasi; pengumuman',
            'en': 'presentation',
          }),
        ],
      ),
      KanjiEntry(
        '不',
        'fu',
        ['フ', 'ブ'],
        [],
        {'id': 'tidak; bukan', 'en': 'not; un-'},
        [
          KanjiWord('不便', 'ふべん', 'fuben', {
            'id': 'tidak praktis',
            'en': 'inconvenient',
          }),
          KanjiWord('不安', 'ふあん', 'fuan', {'id': 'cemas', 'en': 'anxiety'}),
        ],
      ),
    ],
  ),
  KanjiSection(
    {'id': 'Gerak & aktivitas', 'en': 'Movement & activities'},
    null,
    [
      KanjiEntry(
        '走',
        'hashiru',
        ['ソウ'],
        ['はし(る)'],
        {'id': 'berlari', 'en': 'run'},
        [
          KanjiWord('走る', 'はしる', 'hashiru', {'id': 'berlari', 'en': 'to run'}),
          KanjiWord('競走', 'きょうそう', 'kyousou', {
            'id': 'lomba lari',
            'en': 'race',
          }),
        ],
      ),
      KanjiEntry(
        '歩',
        'aruku',
        ['ホ', 'ブ', 'ポ'],
        ['ある(く)', 'あゆ(む)'],
        {'id': 'berjalan kaki', 'en': 'walk'},
        [
          KanjiWord('歩く', 'あるく', 'aruku', {'id': 'berjalan', 'en': 'to walk'}),
          KanjiWord('散歩', 'さんぽ', 'sanpo', {
            'id': 'jalan-jalan',
            'en': 'stroll',
          }),
        ],
      ),
      KanjiEntry(
        '起',
        'okiru',
        ['キ'],
        ['お(きる)', 'お(こす)'],
        {'id': 'bangun', 'en': 'wake up; rise'},
        [
          KanjiWord('起きる', 'おきる', 'okiru', {'id': 'bangun', 'en': 'to get up'}),
          KanjiWord('起こす', 'おこす', 'okosu', {
            'id': 'membangunkan',
            'en': 'to wake someone',
          }),
        ],
      ),
      KanjiEntry(
        '着',
        'kiru',
        ['チャク'],
        ['き(る)', 'つ(く)'],
        {'id': 'memakai (baju); tiba', 'en': 'wear; arrive'},
        [
          KanjiWord('着る', 'きる', 'kiru', {
            'id': 'memakai (baju)',
            'en': 'to wear',
          }),
          KanjiWord('着く', 'つく', 'tsuku', {'id': 'tiba', 'en': 'to arrive'}),
        ],
      ),
      KanjiEntry(
        '乗',
        'noru',
        ['ジョウ'],
        ['の(る)', 'の(せる)'],
        {'id': 'naik (kendaraan)', 'en': 'ride'},
        [
          KanjiWord('乗る', 'のる', 'noru', {'id': 'naik', 'en': 'to ride'}),
          KanjiWord('乗客', 'じょうきゃく', 'joukyaku', {
            'id': 'penumpang',
            'en': 'passenger',
          }),
        ],
      ),
      KanjiEntry(
        '送',
        'okuru',
        ['ソウ'],
        ['おく(る)'],
        {'id': 'mengirim', 'en': 'send'},
        [
          KanjiWord('送る', 'おくる', 'okuru', {
            'id': 'mengirim; mengantar',
            'en': 'to send',
          }),
          KanjiWord('放送', 'ほうそう', 'housou', {
            'id': 'siaran',
            'en': 'broadcast',
          }),
        ],
      ),
      KanjiEntry(
        '運',
        'un',
        ['ウン'],
        ['はこ(ぶ)'],
        {'id': 'mengangkut; nasib', 'en': 'carry; luck'},
        [
          KanjiWord('運ぶ', 'はこぶ', 'hakobu', {
            'id': 'mengangkut',
            'en': 'to carry',
          }),
          KanjiWord('運動', 'うんどう', 'undou', {
            'id': 'olahraga',
            'en': 'exercise',
          }),
        ],
      ),
      KanjiEntry(
        '転',
        'ten',
        ['テン'],
        ['ころ(ぶ)'],
        {'id': 'berguling; berpindah', 'en': 'roll; shift'},
        [
          KanjiWord('運転', 'うんてん', 'unten', {
            'id': 'mengemudi',
            'en': 'driving',
          }),
          KanjiWord('転ぶ', 'ころぶ', 'korobu', {
            'id': 'jatuh terjungkal',
            'en': 'to fall over',
          }),
        ],
      ),
      KanjiEntry(
        '動',
        'ugoku',
        ['ドウ'],
        ['うご(く)'],
        {'id': 'bergerak', 'en': 'move'},
        [
          KanjiWord('動く', 'うごく', 'ugoku', {'id': 'bergerak', 'en': 'to move'}),
          KanjiWord('動物', 'どうぶつ', 'doubutsu', {
            'id': 'binatang',
            'en': 'animal',
          }),
        ],
      ),
      KanjiEntry(
        '通',
        'tooru',
        ['ツウ'],
        ['とお(る)', 'かよ(う)'],
        {'id': 'melewati; pulang-pergi', 'en': 'pass through; commute'},
        [
          KanjiWord('通う', 'かよう', 'kayou', {
            'id': 'pulang-pergi rutin',
            'en': 'to commute',
          }),
          KanjiWord('交通', 'こうつう', 'koutsuu', {
            'id': 'lalu lintas',
            'en': 'traffic',
          }),
        ],
      ),
      KanjiEntry(
        '進',
        'susumu',
        ['シン'],
        ['すす(む)'],
        {'id': 'maju', 'en': 'advance'},
        [
          KanjiWord('進む', 'すすむ', 'susumu', {'id': 'maju', 'en': 'to advance'}),
          KanjiWord('進歩', 'しんぽ', 'shinpo', {
            'id': 'kemajuan',
            'en': 'progress',
          }),
        ],
      ),
      KanjiEntry(
        '引',
        'hiku',
        ['イン'],
        ['ひ(く)'],
        {'id': 'menarik', 'en': 'pull'},
        [
          KanjiWord('引く', 'ひく', 'hiku', {'id': 'menarik', 'en': 'to pull'}),
          KanjiWord('引っ越し', 'ひっこし', 'hikkoshi', {
            'id': 'pindah rumah',
            'en': 'moving house',
          }),
        ],
      ),
      KanjiEntry(
        '帰',
        'kaeru',
        ['キ'],
        ['かえ(る)', 'かえ(す)'],
        {'id': 'pulang', 'en': 'return home'},
        [
          KanjiWord('帰る', 'かえる', 'kaeru', {'id': 'pulang', 'en': 'to go home'}),
          KanjiWord('帰国', 'きこく', 'kikoku', {
            'id': 'pulang ke negeri asal',
            'en': 'return to one\'s country',
          }),
        ],
      ),
      KanjiEntry(
        '去',
        'kyo',
        ['キョ', 'コ'],
        ['さ(る)'],
        {'id': 'pergi; lampau', 'en': 'leave; past'},
        [
          KanjiWord('去年', 'きょねん', 'kyonen', {
            'id': 'tahun lalu',
            'en': 'last year',
          }),
          KanjiWord('過去', 'かこ', 'kako', {'id': 'masa lalu', 'en': 'the past'}),
        ],
      ),
      KanjiEntry(
        '開',
        'aku',
        ['カイ'],
        ['あ(く)', 'あ(ける)', 'ひら(く)'],
        {'id': 'membuka', 'en': 'open'},
        [
          KanjiWord('開ける', 'あける', 'akeru', {'id': 'membuka', 'en': 'to open'}),
          KanjiWord('公開', 'こうかい', 'koukai', {
            'id': 'dibuka untuk umum',
            'en': 'public release',
          }),
        ],
      ),
      KanjiEntry(
        '止',
        'tomaru',
        ['シ'],
        ['と(まる)', 'と(める)'],
        {'id': 'berhenti', 'en': 'stop'},
        [
          KanjiWord('止まる', 'とまる', 'tomaru', {
            'id': 'berhenti',
            'en': 'to stop',
          }),
          KanjiWord('中止', 'ちゅうし', 'chuushi', {
            'id': 'pembatalan',
            'en': 'cancellation',
          }),
        ],
      ),
      KanjiEntry(
        '待',
        'matsu',
        ['タイ'],
        ['ま(つ)'],
        {'id': 'menunggu', 'en': 'wait'},
        [
          KanjiWord('待つ', 'まつ', 'matsu', {'id': 'menunggu', 'en': 'to wait'}),
          KanjiWord('招待', 'しょうたい', 'shoutai', {
            'id': 'undangan',
            'en': 'invitation',
          }),
        ],
      ),
      KanjiEntry(
        '持',
        'motsu',
        ['ジ'],
        ['も(つ)'],
        {'id': 'memegang; membawa', 'en': 'hold'},
        [
          KanjiWord('持つ', 'もつ', 'motsu', {
            'id': 'memegang; membawa',
            'en': 'to hold',
          }),
          KanjiWord('持参', 'じさん', 'jisan', {
            'id': 'membawa sendiri',
            'en': 'bringing (with oneself)',
          }),
        ],
      ),
      KanjiEntry(
        '集',
        'atsumeru',
        ['シュウ'],
        ['あつ(まる)', 'あつ(める)'],
        {'id': 'mengumpulkan', 'en': 'gather'},
        [
          KanjiWord('集める', 'あつめる', 'atsumeru', {
            'id': 'mengumpulkan',
            'en': 'to collect',
          }),
          KanjiWord('集合', 'しゅうごう', 'shuugou', {
            'id': 'berkumpul',
            'en': 'assembly',
          }),
        ],
      ),
      KanjiEntry(
        '合',
        'au',
        ['ゴウ', 'ガッ'],
        ['あ(う)'],
        {'id': 'cocok; menggabung', 'en': 'fit; combine'},
        [
          KanjiWord('合う', 'あう', 'au', {'id': 'cocok', 'en': 'to fit'}),
          KanjiWord('合格', 'ごうかく', 'goukaku', {
            'id': 'lulus (ujian)',
            'en': 'passing an exam',
          }),
        ],
      ),
      KanjiEntry(
        '切',
        'kiru',
        ['セツ', 'サイ'],
        ['き(る)', 'き(れる)'],
        {'id': 'memotong', 'en': 'cut'},
        [
          KanjiWord('大切', 'たいせつ', 'taisetsu', {
            'id': 'penting; berharga',
            'en': 'precious',
          }),
          KanjiWord('切符', 'きっぷ', 'kippu', {'id': 'tiket', 'en': 'ticket'}),
        ],
      ),
      KanjiEntry(
        '作',
        'tsukuru',
        ['サク', 'サ'],
        ['つく(る)'],
        {'id': 'membuat', 'en': 'make'},
        [
          KanjiWord('作る', 'つくる', 'tsukuru', {'id': 'membuat', 'en': 'to make'}),
          KanjiWord('作文', 'さくぶん', 'sakubun', {'id': 'karangan', 'en': 'essay'}),
        ],
      ),
      KanjiEntry(
        '思',
        'omou',
        ['シ'],
        ['おも(う)'],
        {'id': 'berpikir; merasa', 'en': 'think (feel)'},
        [
          KanjiWord('思う', 'おもう', 'omou', {'id': 'berpikir', 'en': 'to think'}),
          KanjiWord('思い出', 'おもいで', 'omoide', {
            'id': 'kenangan',
            'en': 'memory',
          }),
        ],
      ),
      KanjiEntry(
        '考',
        'kangaeru',
        ['コウ'],
        ['かんが(える)'],
        {'id': 'menimbang; memikirkan', 'en': 'consider'},
        [
          KanjiWord('考える', 'かんがえる', 'kangaeru', {
            'id': 'memikirkan',
            'en': 'to consider',
          }),
          KanjiWord('参考', 'さんこう', 'sankou', {
            'id': 'referensi',
            'en': 'reference',
          }),
        ],
      ),
      KanjiEntry(
        '知',
        'shiru',
        ['チ'],
        ['し(る)'],
        {'id': 'mengetahui', 'en': 'know'},
        [
          KanjiWord('知り合い', 'しりあい', 'shiriai', {
            'id': 'kenalan',
            'en': 'acquaintance',
          }),
          KanjiWord('知識', 'ちしき', 'chishiki', {
            'id': 'pengetahuan',
            'en': 'knowledge',
          }),
        ],
      ),
      KanjiEntry(
        '急',
        'isogu',
        ['キュウ'],
        ['いそ(ぐ)'],
        {'id': 'bergegas; mendadak', 'en': 'hurry; sudden'},
        [
          KanjiWord('急ぐ', 'いそぐ', 'isogu', {'id': 'bergegas', 'en': 'to hurry'}),
          KanjiWord('急に', 'きゅうに', 'kyuuni', {
            'id': 'tiba-tiba',
            'en': 'suddenly',
          }),
        ],
      ),
      KanjiEntry(
        '洗',
        'arau',
        ['セン'],
        ['あら(う)'],
        {'id': 'mencuci', 'en': 'wash'},
        [
          KanjiWord('洗う', 'あらう', 'arau', {'id': 'mencuci', 'en': 'to wash'}),
          KanjiWord('洗濯', 'せんたく', 'sentaku', {'id': 'cucian', 'en': 'laundry'}),
        ],
      ),
    ],
  ),
  KanjiSection(
    {'id': 'Sifat & keadaan', 'en': 'Qualities & states'},
    null,
    [
      KanjiEntry(
        '同',
        'onaji',
        ['ドウ'],
        ['おな(じ)'],
        {'id': 'sama', 'en': 'same'},
        [
          KanjiWord('同じ', 'おなじ', 'onaji', {'id': 'sama', 'en': 'same'}),
          KanjiWord('同級生', 'どうきゅうせい', 'doukyuusei', {
            'id': 'teman sekelas',
            'en': 'classmate',
          }),
        ],
      ),
      KanjiEntry(
        '元',
        'moto',
        ['ゲン', 'ガン'],
        ['もと'],
        {'id': 'asal; dasar', 'en': 'origin'},
        [
          KanjiWord('地元', 'じもと', 'jimoto', {
            'id': 'kampung halaman',
            'en': 'hometown',
          }),
          KanjiWord('元日', 'がんじつ', 'ganjitsu', {
            'id': 'hari Tahun Baru',
            'en': 'New Year\'s Day',
          }),
        ],
      ),
      KanjiEntry(
        '重',
        'omoi',
        ['ジュウ', 'チョウ'],
        ['おも(い)', 'かさ(ねる)'],
        {'id': 'berat', 'en': 'heavy'},
        [
          KanjiWord('重い', 'おもい', 'omoi', {'id': 'berat', 'en': 'heavy'}),
          KanjiWord('貴重', 'きちょう', 'kichou', {
            'id': 'berharga',
            'en': 'valuable',
          }),
        ],
      ),
      KanjiEntry(
        '近',
        'chikai',
        ['キン'],
        ['ちか(い)'],
        {'id': 'dekat', 'en': 'near'},
        [
          KanjiWord('近い', 'ちかい', 'chikai', {'id': 'dekat', 'en': 'near'}),
          KanjiWord('最近', 'さいきん', 'saikin', {
            'id': 'akhir-akhir ini',
            'en': 'recently',
          }),
        ],
      ),
      KanjiEntry(
        '遠',
        'tooi',
        ['エン', 'オン'],
        ['とお(い)'],
        {'id': 'jauh', 'en': 'far'},
        [
          KanjiWord('遠い', 'とおい', 'tooi', {'id': 'jauh', 'en': 'far'}),
          KanjiWord('遠足', 'えんそく', 'ensoku', {
            'id': 'darmawisata',
            'en': 'school excursion',
          }),
        ],
      ),
      KanjiEntry(
        '足',
        'ashi',
        ['ソク'],
        ['あし', 'た(りる)'],
        {'id': 'kaki; cukup', 'en': 'foot; suffice'},
        [
          KanjiWord('足りる', 'たりる', 'tariru', {
            'id': 'cukup',
            'en': 'to be enough',
          }),
          KanjiWord('不足', 'ふそく', 'fusoku', {
            'id': 'kekurangan',
            'en': 'shortage',
          }),
        ],
      ),
      KanjiEntry(
        '寒',
        'samui',
        ['カン'],
        ['さむ(い)'],
        {'id': 'dingin (cuaca)', 'en': 'cold (weather)'},
        [
          KanjiWord('寒い', 'さむい', 'samui', {'id': 'dingin', 'en': 'cold'}),
          KanjiWord('寒さ', 'さむさ', 'samusa', {
            'id': 'hawa dingin',
            'en': 'coldness',
          }),
        ],
      ),
      KanjiEntry(
        '暑',
        'atsui',
        ['ショ'],
        ['あつ(い)'],
        {'id': 'panas (cuaca)', 'en': 'hot (weather)'},
        [
          KanjiWord('暑い', 'あつい', 'atsui', {'id': 'panas', 'en': 'hot'}),
          KanjiWord('暑さ', 'あつさ', 'atsusa', {'id': 'hawa panas', 'en': 'heat'}),
        ],
      ),
      KanjiEntry(
        '暗',
        'kurai',
        ['アン'],
        ['くら(い)'],
        {'id': 'gelap', 'en': 'dark'},
        [
          KanjiWord('暗い', 'くらい', 'kurai', {'id': 'gelap', 'en': 'dark'}),
          KanjiWord('暗記', 'あんき', 'anki', {
            'id': 'hafalan',
            'en': 'memorization',
          }),
        ],
      ),
      KanjiEntry(
        '明',
        'akarui',
        ['メイ', 'ミョウ'],
        ['あか(るい)', 'あ(ける)'],
        {'id': 'terang', 'en': 'bright'},
        [
          KanjiWord('明るい', 'あかるい', 'akarui', {
            'id': 'terang; ceria',
            'en': 'bright',
          }),
          KanjiWord('発明', 'はつめい', 'hatsumei', {
            'id': 'penemuan',
            'en': 'invention',
          }),
        ],
      ),
      KanjiEntry(
        '軽',
        'karui',
        ['ケイ'],
        ['かる(い)'],
        {'id': 'ringan', 'en': 'light (weight)'},
        [
          KanjiWord('軽い', 'かるい', 'karui', {'id': 'ringan', 'en': 'light'}),
          KanjiWord('手軽', 'てがる', 'tegaru', {
            'id': 'mudah; praktis',
            'en': 'easy; handy',
          }),
        ],
      ),
      KanjiEntry(
        '弱',
        'yowai',
        ['ジャク'],
        ['よわ(い)'],
        {'id': 'lemah', 'en': 'weak'},
        [
          KanjiWord('弱い', 'よわい', 'yowai', {'id': 'lemah', 'en': 'weak'}),
          KanjiWord('弱点', 'じゃくてん', 'jakuten', {
            'id': 'kelemahan',
            'en': 'weakness',
          }),
        ],
      ),
      KanjiEntry(
        '太',
        'futoi',
        ['タイ', 'タ'],
        ['ふと(い)', 'ふと(る)'],
        {'id': 'gemuk; tebal', 'en': 'fat; thick'},
        [
          KanjiWord('太る', 'ふとる', 'futoru', {
            'id': 'bertambah gemuk',
            'en': 'to gain weight',
          }),
          KanjiWord('太陽', 'たいよう', 'taiyou', {
            'id': 'matahari',
            'en': 'the sun',
          }),
        ],
      ),
      KanjiEntry(
        '低',
        'hikui',
        ['テイ'],
        ['ひく(い)'],
        {'id': 'rendah', 'en': 'low'},
        [
          KanjiWord('低い', 'ひくい', 'hikui', {'id': 'rendah', 'en': 'low'}),
          KanjiWord('最低', 'さいてい', 'saitei', {
            'id': 'paling rendah; terburuk',
            'en': 'lowest',
          }),
        ],
      ),
      KanjiEntry(
        '短',
        'mijikai',
        ['タン'],
        ['みじか(い)'],
        {'id': 'pendek', 'en': 'short'},
        [
          KanjiWord('短い', 'みじかい', 'mijikai', {'id': 'pendek', 'en': 'short'}),
          KanjiWord('短所', 'たんしょ', 'tansho', {
            'id': 'kekurangan',
            'en': 'shortcoming',
          }),
        ],
      ),
      KanjiEntry(
        '広',
        'hiroi',
        ['コウ'],
        ['ひろ(い)'],
        {'id': 'luas', 'en': 'wide'},
        [
          KanjiWord('広い', 'ひろい', 'hiroi', {'id': 'luas', 'en': 'wide'}),
          KanjiWord('広告', 'こうこく', 'koukoku', {
            'id': 'iklan',
            'en': 'advertisement',
          }),
        ],
      ),
      KanjiEntry(
        '多',
        'ooi',
        ['タ'],
        ['おお(い)'],
        {'id': 'banyak', 'en': 'many'},
        [
          KanjiWord('多い', 'おおい', 'ooi', {'id': 'banyak', 'en': 'many'}),
          KanjiWord('多分', 'たぶん', 'tabun', {'id': 'mungkin', 'en': 'probably'}),
        ],
      ),
      KanjiEntry(
        '少',
        'sukoshi',
        ['ショウ'],
        ['すく(ない)', 'すこ(し)'],
        {'id': 'sedikit', 'en': 'few; little'},
        [
          KanjiWord('少し', 'すこし', 'sukoshi', {
            'id': 'sedikit',
            'en': 'a little',
          }),
          KanjiWord('少年', 'しょうねん', 'shounen', {
            'id': 'anak laki-laki',
            'en': 'boy',
          }),
        ],
      ),
      KanjiEntry(
        '好',
        'suki',
        ['コウ'],
        ['す(き)', 'この(む)'],
        {'id': 'suka', 'en': 'like'},
        [
          KanjiWord('好き', 'すき', 'suki', {'id': 'suka', 'en': 'liked'}),
          KanjiWord('好物', 'こうぶつ', 'koubutsu', {
            'id': 'makanan kesukaan',
            'en': 'favorite food',
          }),
        ],
      ),
      KanjiEntry(
        '悪',
        'warui',
        ['アク', 'オ'],
        ['わる(い)'],
        {'id': 'buruk; jahat', 'en': 'bad'},
        [
          KanjiWord('悪い', 'わるい', 'warui', {'id': 'buruk', 'en': 'bad'}),
          KanjiWord('最悪', 'さいあく', 'saiaku', {
            'id': 'terburuk',
            'en': 'the worst',
          }),
        ],
      ),
      KanjiEntry(
        '正',
        'tadashii',
        ['セイ', 'ショウ'],
        ['ただ(しい)'],
        {'id': 'benar; lurus', 'en': 'correct'},
        [
          KanjiWord('正しい', 'ただしい', 'tadashii', {
            'id': 'benar',
            'en': 'correct',
          }),
          KanjiWord('正直', 'しょうじき', 'shoujiki', {'id': 'jujur', 'en': 'honest'}),
        ],
      ),
      KanjiEntry(
        '真',
        'ma',
        ['シン'],
        ['ま'],
        {'id': 'sejati; tepat', 'en': 'true; genuine'},
        [
          KanjiWord('真面目', 'まじめ', 'majime', {
            'id': 'serius; tekun',
            'en': 'earnest',
          }),
          KanjiWord('真夜中', 'まよなか', 'mayonaka', {
            'id': 'tengah malam buta',
            'en': 'dead of night',
          }),
        ],
      ),
      KanjiEntry(
        '早',
        'hayai',
        ['ソウ', 'サッ'],
        ['はや(い)'],
        {'id': 'cepat; awal', 'en': 'early'},
        [
          KanjiWord('早速', 'さっそく', 'sassoku', {'id': 'segera', 'en': 'at once'}),
          KanjiWord('早口', 'はやくち', 'hayakuchi', {
            'id': 'bicara cepat',
            'en': 'fast talking',
          }),
        ],
      ),
    ],
  ),
];
