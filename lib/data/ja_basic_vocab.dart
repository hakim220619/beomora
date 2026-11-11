import '../models/guide.dart';

// Kosakata dasar sehari-hari (tingkat pemula) yang melengkapi daftar
// JLPT N5/N4: orang, negara, tempat, makanan, hobi, ungkapan, dll.
// Disusun per tema; arti & contoh kalimat ditulis sendiri.

const GuideTopic kJaBasicVocabTopic = GuideTopic(
  id: 'vocab_basic',
  emoji: '🌱',
  title: {'id': 'Kosakata Dasar Sehari-hari', 'en': 'Everyday Basic Words'},
  subtitle: {
    'id': '172 kosakata pemula per tema, ketuk untuk dengar',
    'en': '172 beginner words by theme, tap to listen',
  },
  sections: [
    GuideSection(
      title: {'id': 'Orang & Keluarga', 'en': 'People & Family'},
      examples: [
        GuideExample('わたしたち', {
          'id': 'kami / kita',
          'en': 'we',
        }, romaji: 'watashitachi'),
        GuideExample('あのひと', {
          'id': 'orang itu',
          'en': 'that person',
        }, romaji: 'ano hito'),
        GuideExample('あのかた', {
          'id': 'beliau / orang itu (sopan)',
          'en': 'that person (polite)',
        }, romaji: 'ano kata'),
        GuideExample('きょうし', {
          'id': 'guru (sebagai profesi)',
          'en': 'teacher (occupation)',
        }, romaji: 'kyoushi'),
        GuideExample('ぎんこういん', {
          'id': 'pegawai bank',
          'en': 'bank clerk',
        }, romaji: 'ginkouin'),
        GuideExample('けんきゅうしゃ', {
          'id': 'peneliti',
          'en': 'researcher',
        }, romaji: 'kenkyuusha'),
        GuideExample('サラリーマン', {
          'id': 'karyawan kantoran',
          'en': 'office worker',
        }, romaji: 'sarariiman'),
        GuideExample('かちょう', {
          'id': 'kepala bagian',
          'en': 'section manager',
        }, romaji: 'kachou'),
        GuideExample('しゅじん', {
          'id': 'suami (sendiri)',
          'en': '(my) husband',
        }, romaji: 'shujin'),
        GuideExample('ごかぞく', {
          'id': 'keluarga (orang lain, sopan)',
          'en': '(your) family',
        }, romaji: 'gokazoku'),
        GuideExample('おとうとさん', {
          'id': 'adik laki-laki (orang lain)',
          'en': '(someone\'s) younger brother',
        }, romaji: 'otoutosan'),
        GuideExample('いもうとさん', {
          'id': 'adik perempuan (orang lain)',
          'en': '(someone\'s) younger sister',
        }, romaji: 'imoutosan'),
        GuideExample('どくしん', {
          'id': 'lajang / belum menikah',
          'en': 'single (unmarried)',
        }, romaji: 'dokushin'),
        GuideExample('しゅしょう', {
          'id': 'perdana menteri',
          'en': 'prime minister',
        }, romaji: 'shushou'),
        GuideExample('だいとうりょう', {
          'id': 'presiden',
          'en': 'president',
        }, romaji: 'daitouryou'),
        GuideExample('あの ひと は ぎんこういん です', {
          'id': 'Orang itu pegawai bank.',
          'en': 'That person is a bank clerk.',
        }, romaji: 'ano hito wa ginkouin desu'),
      ],
    ),
    GuideSection(
      title: {'id': 'Negara & Kota', 'en': 'Countries & Cities'},
      examples: [
        GuideExample('アメリカ', {
          'id': 'Amerika Serikat',
          'en': 'USA',
        }, romaji: 'amerika'),
        GuideExample('イギリス', {'id': 'Inggris', 'en': 'UK'}, romaji: 'igirisu'),
        GuideExample('かんこく', {
          'id': 'Korea Selatan',
          'en': 'South Korea',
        }, romaji: 'kankoku'),
        GuideExample('ちゅうごく', {
          'id': 'Tiongkok',
          'en': 'China',
        }, romaji: 'chuugoku'),
        GuideExample('ドイツ', {
          'id': 'Jerman',
          'en': 'Germany',
        }, romaji: 'doitsu'),
        GuideExample('フランス', {
          'id': 'Prancis',
          'en': 'France',
        }, romaji: 'furansu'),
        GuideExample('タイ', {'id': 'Thailand', 'en': 'Thailand'}, romaji: 'tai'),
        GuideExample('ブラジル', {
          'id': 'Brasil',
          'en': 'Brazil',
        }, romaji: 'burajiru'),
        GuideExample('オーストラリア', {
          'id': 'Australia',
          'en': 'Australia',
        }, romaji: 'oosutoraria'),
        GuideExample('ニューヨーク', {
          'id': 'New York',
          'en': 'New York',
        }, romaji: 'nyuuyooku'),
        GuideExample('ロンドン', {
          'id': 'London',
          'en': 'London',
        }, romaji: 'rondon'),
        GuideExample('ペキン', {
          'id': 'Beijing',
          'en': 'Beijing',
        }, romaji: 'pekin'),
        GuideExample('バンコク', {
          'id': 'Bangkok',
          'en': 'Bangkok',
        }, romaji: 'bankoku'),
        GuideExample('ロサンゼルス', {
          'id': 'Los Angeles',
          'en': 'Los Angeles',
        }, romaji: 'rosanzerusu'),
        GuideExample('わたし は インドネシア から きました', {
          'id': 'Saya berasal dari Indonesia.',
          'en': 'I am from Indonesia.',
        }, romaji: 'watashi wa indoneshia kara kimashita'),
      ],
    ),
    GuideSection(
      title: {'id': 'Tempat di Kota & Gedung', 'en': 'Places & Buildings'},
      examples: [
        GuideExample('ロビー', {'id': 'lobi', 'en': 'lobby'}, romaji: 'robii'),
        GuideExample('ちか', {
          'id': 'ruang bawah tanah',
          'en': 'basement',
        }, romaji: 'chika'),
        GuideExample('なんがい', {
          'id': 'lantai berapa',
          'en': 'which floor',
        }, romaji: 'nangai'),
        GuideExample('のりば', {
          'id': 'tempat naik (halte, peron)',
          'en': 'boarding place (stop, platform)',
        }, romaji: 'noriba'),
        GuideExample('しやくしょ', {
          'id': 'kantor wali kota',
          'en': 'city hall',
        }, romaji: 'shiyakusho'),
        GuideExample('おてら', {
          'id': 'kuil Buddha',
          'en': 'Buddhist temple',
        }, romaji: 'otera'),
        GuideExample('でんきや', {
          'id': 'toko elektronik',
          'en': 'electronics store',
        }, romaji: 'denkiya'),
        GuideExample('けん', {
          'id': 'prefektur (provinsi)',
          'en': 'prefecture',
        }, romaji: 'ken'),
        GuideExample('いちばんうえ', {
          'id': 'paling atas',
          'en': 'the very top',
        }, romaji: 'ichiban ue'),
        GuideExample('だん', {
          'id': 'tingkat / rak',
          'en': 'shelf, level',
        }, romaji: 'dan'),
        GuideExample('トイレ は ちか に あります', {
          'id': 'Toiletnya ada di lantai bawah tanah.',
          'en': 'The toilet is in the basement.',
        }, romaji: 'toire wa chika ni arimasu'),
      ],
    ),
    GuideSection(
      title: {'id': 'Benda & Dokumen', 'en': 'Things & Documents'},
      examples: [
        GuideExample('パスポート', {
          'id': 'paspor',
          'en': 'passport',
        }, romaji: 'pasupooto'),
        GuideExample('ビザ', {'id': 'visa', 'en': 'visa'}, romaji: 'biza'),
        GuideExample('キャッシュカード', {
          'id': 'kartu ATM',
          'en': 'bank card',
        }, romaji: 'kyasshu kaado'),
        GuideExample('あんしょうばんごう', {
          'id': 'nomor PIN',
          'en': 'PIN number',
        }, romaji: 'anshou bangou'),
        GuideExample('きんがく', {
          'id': 'jumlah uang',
          'en': 'amount of money',
        }, romaji: 'kingaku'),
        GuideExample('けしゴム', {
          'id': 'penghapus',
          'en': 'eraser',
        }, romaji: 'keshigomu'),
        GuideExample('セロテープ', {
          'id': 'selotip',
          'en': 'sticky tape',
        }, romaji: 'serotepu'),
        GuideExample('スイッチ', {
          'id': 'sakelar',
          'en': 'switch',
        }, romaji: 'suicchi'),
        GuideExample('カタログ', {
          'id': 'katalog',
          'en': 'catalog',
        }, romaji: 'katarogu'),
        GuideExample('しりょう', {
          'id': 'bahan / data',
          'en': 'materials, data',
        }, romaji: 'shiryou'),
        GuideExample('じこくひょう', {
          'id': 'jadwal (kereta, bus)',
          'en': 'timetable',
        }, romaji: 'jikokuhyou'),
        GuideExample('チケット', {
          'id': 'tiket',
          'en': 'ticket',
        }, romaji: 'chiketto'),
        GuideExample('てちょう', {
          'id': 'buku agenda',
          'en': 'pocket diary',
        }, romaji: 'techou'),
        GuideExample('こまかいおかね', {
          'id': 'uang receh',
          'en': 'small change',
        }, romaji: 'komakai okane'),
        GuideExample('つまみ', {
          'id': 'kenop / tombol putar',
          'en': 'knob',
        }, romaji: 'tsumami'),
        GuideExample('パスポート を みせて ください', {
          'id': 'Tolong perlihatkan paspor Anda.',
          'en': 'Please show your passport.',
        }, romaji: 'pasupooto o misete kudasai'),
      ],
    ),
    GuideSection(
      title: {'id': 'Makanan & Minuman', 'en': 'Food & Drinks'},
      examples: [
        GuideExample('さけ', {
          'id': 'minuman beralkohol / sake',
          'en': 'alcohol, sake',
        }, romaji: 'sake'),
        GuideExample('ワイン', {
          'id': 'anggur (minuman)',
          'en': 'wine',
        }, romaji: 'wain'),
        GuideExample('さしみ', {
          'id': 'irisan ikan mentah',
          'en': 'sashimi',
        }, romaji: 'sashimi'),
        GuideExample('てんぷら', {
          'id': 'gorengan tepung ala Jepang',
          'en': 'tempura',
        }, romaji: 'tenpura'),
        GuideExample('すきやき', {
          'id': 'sukiyaki (rebusan daging)',
          'en': 'sukiyaki',
        }, romaji: 'sukiyaki'),
        GuideExample('ていしょく', {
          'id': 'paket makan (nasi + lauk)',
          'en': 'set meal',
        }, romaji: 'teishoku'),
        GuideExample('ぎゅうどん', {
          'id': 'nasi daging sapi',
          'en': 'beef bowl',
        }, romaji: 'gyuudon'),
        GuideExample('サンドイッチ', {
          'id': 'roti lapis',
          'en': 'sandwich',
        }, romaji: 'sandoicchi'),
        GuideExample('カレーライス', {
          'id': 'nasi kari',
          'en': 'curry rice',
        }, romaji: 'karee raisu'),
        GuideExample('アイスクリーム', {
          'id': 'es krim',
          'en': 'ice cream',
        }, romaji: 'aisukuriimu'),
        GuideExample('かんぱい', {
          'id': 'bersulang!',
          'en': 'cheers!',
        }, romaji: 'kanpai'),
        GuideExample('きょう の ひるごはん は ぎゅうどん です', {
          'id': 'Makan siang hari ini nasi daging sapi.',
          'en': 'Today\'s lunch is a beef bowl.',
        }, romaji: 'kyou no hirugohan wa gyuudon desu'),
      ],
    ),
    GuideSection(
      title: {
        'id': 'Hobi, Olahraga & Budaya',
        'en': 'Hobbies, Sports & Culture',
      },
      examples: [
        GuideExample('やきゅう', {
          'id': 'bisbol',
          'en': 'baseball',
        }, romaji: 'yakyuu'),
        GuideExample('ダンス', {
          'id': 'tari / dansa',
          'en': 'dance',
        }, romaji: 'dansu'),
        GuideExample('ジャズ', {'id': 'musik jazz', 'en': 'jazz'}, romaji: 'jazu'),
        GuideExample('クラシック', {
          'id': 'musik klasik',
          'en': 'classical music',
        }, romaji: 'kurashikku'),
        GuideExample('カラオケ', {
          'id': 'karaoke',
          'en': 'karaoke',
        }, romaji: 'karaoke'),
        GuideExample('かぶき', {
          'id': 'kabuki (teater tradisional)',
          'en': 'kabuki',
        }, romaji: 'kabuki'),
        GuideExample('スキー', {'id': 'ski', 'en': 'skiing'}, romaji: 'sukii'),
        GuideExample('ゴルフ', {'id': 'golf', 'en': 'golf'}, romaji: 'gorufu'),
        GuideExample('すもう', {
          'id': 'sumo',
          'en': 'sumo wrestling',
        }, romaji: 'sumou'),
        GuideExample('つり', {
          'id': 'memancing',
          'en': 'fishing',
        }, romaji: 'tsuri'),
        GuideExample('ジョギング', {
          'id': 'jogging',
          'en': 'jogging',
        }, romaji: 'jogingu'),
        GuideExample('まつり', {
          'id': 'festival',
          'en': 'festival',
        }, romaji: 'matsuri'),
        GuideExample('いけばな', {
          'id': 'seni merangkai bunga',
          'en': 'flower arranging',
        }, romaji: 'ikebana'),
        GuideExample('さくら', {
          'id': 'bunga sakura',
          'en': 'cherry blossom',
        }, romaji: 'sakura'),
        GuideExample('もみじ', {
          'id': 'daun merah musim gugur',
          'en': 'autumn leaves',
        }, romaji: 'momiji'),
        GuideExample('おしょうがつ', {
          'id': 'Tahun Baru',
          'en': 'New Year',
        }, romaji: 'oshougatsu'),
        GuideExample('しゅうまつ に つり に いきます', {
          'id': 'Akhir pekan saya pergi memancing.',
          'en': 'I go fishing on the weekend.',
        }, romaji: 'shuumatsu ni tsuri ni ikimasu'),
      ],
    ),
    GuideSection(
      title: {'id': 'Kata Kerja', 'en': 'Verbs'},
      examples: [
        GuideExample('おもう', {
          'id': 'berpikir / merasa',
          'en': 'to think',
        }, romaji: 'omou'),
        GuideExample('くれる', {
          'id': 'memberi (kepada saya)',
          'en': 'to give (to me)',
        }, romaji: 'kureru'),
        GuideExample('つれていく', {
          'id': 'mengajak pergi (orang)',
          'en': 'to take (someone) along',
        }, romaji: 'tsurete iku'),
        GuideExample('つれてくる', {
          'id': 'membawa datang (orang)',
          'en': 'to bring (someone)',
        }, romaji: 'tsurete kuru'),
        GuideExample('もっていく', {
          'id': 'membawa pergi (barang)',
          'en': 'to take (something)',
        }, romaji: 'motte iku'),
        GuideExample('もってくる', {
          'id': 'membawa datang (barang)',
          'en': 'to bring (something)',
        }, romaji: 'motte kuru'),
        GuideExample('やくにたつ', {
          'id': 'berguna',
          'en': 'to be useful',
        }, romaji: 'yaku ni tatsu'),
        GuideExample('ひっこしする', {
          'id': 'pindah rumah',
          'en': 'to move house',
        }, romaji: 'hikkoshi suru'),
        GuideExample('しょくじする', {
          'id': 'makan (bersantap)',
          'en': 'to have a meal',
        }, romaji: 'shokuji suru'),
        GuideExample('けんがくする', {
          'id': 'kunjungan belajar',
          'en': 'to visit and observe',
        }, romaji: 'kengaku suru'),
        GuideExample('とうろくする', {
          'id': 'mendaftar',
          'en': 'to register',
        }, romaji: 'touroku suru'),
        GuideExample('ダイエットする', {
          'id': 'berdiet',
          'en': 'to go on a diet',
        }, romaji: 'daietto suru'),
        GuideExample('でんわをかける', {
          'id': 'menelepon',
          'en': 'to make a phone call',
        }, romaji: 'denwa o kakeru'),
        GuideExample('くすりをのむ', {
          'id': 'minum obat',
          'en': 'to take medicine',
        }, romaji: 'kusuri o nomu'),
        GuideExample('おふろにはいる', {
          'id': 'mandi berendam',
          'en': 'to take a bath',
        }, romaji: 'ofuro ni hairu'),
        GuideExample('ともだち が ほん を くれました', {
          'id': 'Teman memberi saya buku.',
          'en': 'My friend gave me a book.',
        }, romaji: 'tomodachi ga hon o kuremashita'),
      ],
    ),
    GuideSection(
      title: {
        'id': 'Keterangan & Kata Tanya',
        'en': 'Adverbs & Question Words',
      },
      examples: [
        GuideExample('いちど', {'id': 'sekali', 'en': 'once'}, romaji: 'ichido'),
        GuideExample('おいくつ', {
          'id': 'berapa umur (sopan) / berapa buah',
          'en': 'how old (polite) / how many',
        }, romaji: 'oikutsu'),
        GuideExample('ぜんぶで', {
          'id': 'semuanya (total)',
          'en': 'in total',
        }, romaji: 'zenbu de'),
        GuideExample('いちども', {
          'id': 'tidak pernah sekali pun (+ negatif)',
          'en': 'never once (+ negative)',
        }, romaji: 'ichido mo'),
        GuideExample('いちにち', {
          'id': 'satu hari',
          'en': 'one day',
        }, romaji: 'ichinichi'),
        GuideExample('なんかいも', {
          'id': 'berkali-kali',
          'en': 'many times',
        }, romaji: 'nankai mo'),
        GuideExample('あとで', {'id': 'nanti', 'en': 'later'}, romaji: 'ato de'),
        GuideExample('もうすこし', {
          'id': 'sedikit lagi',
          'en': 'a little more',
        }, romaji: 'mou sukoshi'),
        GuideExample('つぎに', {
          'id': 'selanjutnya',
          'en': 'next',
        }, romaji: 'tsugi ni'),
        GuideExample('じぶんで', {
          'id': 'sendiri',
          'en': 'by oneself',
        }, romaji: 'jibun de'),
        GuideExample('ほかに', {
          'id': 'selain itu / lainnya',
          'en': 'besides, else',
        }, romaji: 'hoka ni'),
        GuideExample('どこか', {
          'id': 'suatu tempat',
          'en': 'somewhere',
        }, romaji: 'dokoka'),
        GuideExample('どちらも', {
          'id': 'dua-duanya',
          'en': 'both',
        }, romaji: 'dochira mo'),
        GuideExample('みんなで', {
          'id': 'bersama-sama (semua)',
          'en': 'all together',
        }, romaji: 'minna de'),
        GuideExample('どのぐらい', {
          'id': 'berapa lama / banyak',
          'en': 'how long, how much',
        }, romaji: 'dono gurai'),
        GuideExample('なんぷん', {
          'id': 'berapa menit',
          'en': 'how many minutes',
        }, romaji: 'nanpun'),
        GuideExample('ううん', {
          'id': 'tidak (santai)',
          'en': 'no (casual)',
        }, romaji: 'uun'),
        GuideExample('あとで でんわ します', {
          'id': 'Nanti saya telepon.',
          'en': 'I will call later.',
        }, romaji: 'atode denwa shimasu'),
      ],
    ),
    GuideSection(
      title: {'id': 'Kata Benda Umum', 'en': 'Common Nouns'},
      examples: [
        GuideExample('おわり', {'id': 'akhir', 'en': 'end'}, romaji: 'owari'),
        GuideExample('むり', {
          'id': 'mustahil / terlalu memaksa',
          'en': 'impossible, unreasonable',
        }, romaji: 'muri'),
        GuideExample('ちょうし', {
          'id': 'kondisi',
          'en': 'condition',
        }, romaji: 'choushi'),
        GuideExample('ぶっか', {
          'id': 'harga barang (biaya hidup)',
          'en': 'prices, cost of living',
        }, romaji: 'bukka'),
        GuideExample('きんえん', {
          'id': 'dilarang merokok',
          'en': 'no smoking',
        }, romaji: 'kin\'en'),
        GuideExample('チャンス', {
          'id': 'kesempatan',
          'en': 'chance',
        }, romaji: 'chansu'),
        GuideExample('グループ', {
          'id': 'kelompok',
          'en': 'group',
        }, romaji: 'guruupu'),
        GuideExample('サービス', {
          'id': 'pelayanan',
          'en': 'service',
        }, romaji: 'saabisu'),
        GuideExample('デザイン', {
          'id': 'desain',
          'en': 'design',
        }, romaji: 'dezain'),
        GuideExample('スピーチ', {
          'id': 'pidato',
          'en': 'speech',
        }, romaji: 'supiichi'),
        GuideExample('ユーモア', {'id': 'humor', 'en': 'humor'}, romaji: 'yuumoa'),
        GuideExample('ラッシュ', {
          'id': 'jam sibuk',
          'en': 'rush hour',
        }, romaji: 'rasshu'),
        GuideExample('うま', {'id': 'kuda', 'en': 'horse'}, romaji: 'uma'),
        GuideExample('ハンサム', {
          'id': 'tampan',
          'en': 'handsome',
        }, romaji: 'hansamu'),
        GuideExample('びじゅつ', {
          'id': 'seni rupa',
          'en': 'fine arts',
        }, romaji: 'bijutsu'),
        GuideExample('ローマじ', {
          'id': 'huruf Latin (romaji)',
          'en': 'romanized Japanese',
        }, romaji: 'roomaji'),
        GuideExample('よみかた', {
          'id': 'cara membaca',
          'en': 'way of reading',
        }, romaji: 'yomikata'),
        GuideExample('おいのり', {'id': 'doa', 'en': 'prayer'}, romaji: 'oinori'),
        GuideExample('けんこうほけんしょう', {
          'id': 'kartu asuransi kesehatan',
          'en': 'health insurance card',
        }, romaji: 'kenkou hokenshou'),
        GuideExample('りょう', {
          'id': 'asrama',
          'en': 'dormitory',
        }, romaji: 'ryou'),
        GuideExample('おはなし', {
          'id': 'cerita / pembicaraan',
          'en': 'story, talk',
        }, romaji: 'ohanashi'),
        GuideExample('クリスマス', {
          'id': 'Natal',
          'en': 'Christmas',
        }, romaji: 'kurisumasu'),
        GuideExample('ビデオ', {'id': 'video', 'en': 'video'}, romaji: 'bideo'),
        GuideExample('きょう は ちょうし が いい です', {
          'id': 'Hari ini kondisi saya bagus.',
          'en': 'I\'m in good shape today.',
        }, romaji: 'kyou wa choushi ga ii desu'),
      ],
    ),
    GuideSection(
      title: {'id': 'Akhiran & Penghitung', 'en': 'Suffixes & Counters'},
      examples: [
        GuideExample('～ちゃん', {
          'id': 'akhiran akrab (anak, teman dekat)',
          'en': 'friendly suffix (kids, close friends)',
        }, romaji: '~chan'),
        GuideExample('～くん', {
          'id': 'akhiran untuk anak laki-laki / bawahan',
          'en': 'suffix for boys, juniors',
        }, romaji: '~kun'),
        GuideExample('～じん', {
          'id': 'orang (dari negara …)',
          'en': 'person from (country)',
        }, romaji: '~jin'),
        GuideExample('～さい', {
          'id': '… tahun (umur)',
          'en': '… years old',
        }, romaji: '~sai'),
        GuideExample('～まい', {
          'id': '… lembar (benda tipis)',
          'en': 'counter for flat things',
        }, romaji: '~mai'),
        GuideExample('～だい', {
          'id': '… unit (mesin, kendaraan)',
          'en': 'counter for machines, vehicles',
        }, romaji: '~dai'),
        GuideExample('～かげつ', {
          'id': '… bulan (lamanya)',
          'en': '… months (duration)',
        }, romaji: '~kagetsu'),
        GuideExample('～ねん', {'id': '… tahun', 'en': '… years'}, romaji: '~nen'),
        GuideExample('～だけ', {'id': 'hanya …', 'en': 'only …'}, romaji: '~dake'),
        GuideExample('わたし は インドネシアじん です', {
          'id': 'Saya orang Indonesia.',
          'en': 'I am Indonesian.',
        }, romaji: 'watashi wa indoneshiajin desu'),
      ],
    ),
    GuideSection(
      title: {'id': 'Ungkapan Sehari-hari', 'en': 'Everyday Expressions'},
      examples: [
        GuideExample('どうぞよろしくおねがいします', {
          'id': 'senang berkenalan, mohon bantuannya',
          'en': 'nice to meet you (please treat me well)',
        }, romaji: 'douzo yoroshiku onegaishimasu'),
        GuideExample('こちらこそよろしく', {
          'id': 'saya juga, senang berkenalan',
          'en': 'likewise, nice to meet you',
        }, romaji: 'kochira koso yoroshiku'),
        GuideExample('これからおせわになります', {
          'id': 'mohon bimbingannya mulai sekarang',
          'en': 'thank you in advance for your help',
        }, romaji: 'kore kara osewa ni narimasu'),
        GuideExample('ほんのきもちです', {
          'id': 'ini sekadar tanda terima kasih',
          'en': 'just a small token',
        }, romaji: 'hon no kimochi desu'),
        GuideExample('どうもありがとうございます', {
          'id': 'terima kasih banyak',
          'en': 'thank you very much',
        }, romaji: 'doumo arigatou gozaimasu'),
        GuideExample('どうもすみません', {
          'id': 'maaf sekali / terima kasih banyak',
          'en': 'I\'m very sorry / thank you',
        }, romaji: 'doumo sumimasen'),
        GuideExample('いらっしゃい', {
          'id': 'selamat datang (santai)',
          'en': 'welcome (casual)',
        }, romaji: 'irasshai'),
        GuideExample('おじゃまします', {
          'id': 'permisi (masuk rumah orang)',
          'en': 'excuse me (entering a home)',
        }, romaji: 'ojama shimasu'),
        GuideExample('そろそろしつれいします', {
          'id': 'saya pamit dulu',
          'en': 'I should be going',
        }, romaji: 'sorosoro shitsurei shimasu'),
        GuideExample('いいえ、けっこうです', {
          'id': 'tidak, terima kasih',
          'en': 'no, thank you',
        }, romaji: 'iie, kekkou desu'),
        GuideExample('おでかけですか', {
          'id': 'mau pergi keluar?',
          'en': 'are you going out?',
        }, romaji: 'odekake desu ka'),
        GuideExample('いっしょにいかがですか', {
          'id': 'mau ikut bersama?',
          'en': 'would you like to join?',
        }, romaji: 'issho ni ikaga desu ka'),
        GuideExample('よかったら', {
          'id': 'kalau berkenan',
          'en': 'if you like',
        }, romaji: 'yokattara'),
        GuideExample('いいですよ', {
          'id': 'boleh / tentu saja',
          'en': 'sure, OK',
        }, romaji: 'ii desu yo'),
        GuideExample('そうしましょう', {
          'id': 'ayo begitu saja',
          'en': 'let\'s do that',
        }, romaji: 'sou shimashou'),
        GuideExample('つかれました', {
          'id': 'saya capek',
          'en': 'I\'m tired',
        }, romaji: 'tsukaremashita'),
        GuideExample('おなかがすきました', {
          'id': 'saya lapar',
          'en': 'I\'m hungry',
        }, romaji: 'onaka ga sukimashita'),
        GuideExample('おなかがいっぱいです', {
          'id': 'saya kenyang',
          'en': 'I\'m full',
        }, romaji: 'onaka ga ippai desu'),
        GuideExample('のどがかわきました', {
          'id': 'saya haus',
          'en': 'I\'m thirsty',
        }, romaji: 'nodo ga kawakimashita'),
        GuideExample('どうしましたか', {
          'id': 'ada apa? / kenapa?',
          'en': 'what\'s wrong?',
        }, romaji: 'dou shimashita ka'),
        GuideExample('しかたがありません', {
          'id': 'apa boleh buat',
          'en': 'it can\'t be helped',
        }, romaji: 'shikata ga arimasen'),
        GuideExample('しばらくですね', {
          'id': 'lama tidak bertemu ya',
          'en': 'long time no see',
        }, romaji: 'shibaraku desu ne'),
        GuideExample('どうぞおげんきで', {
          'id': 'semoga sehat selalu',
          'en': 'take care',
        }, romaji: 'douzo ogenki de'),
        GuideExample('えーと', {
          'id': 'emm… (sambil berpikir)',
          'en': 'um, let me see',
        }, romaji: 'eeto'),
        GuideExample('せがたかい', {
          'id': 'bertubuh tinggi',
          'en': 'tall (person)',
        }, romaji: 'se ga takai'),
        GuideExample('あたまがいい', {
          'id': 'pintar',
          'en': 'smart',
        }, romaji: 'atama ga ii'),
        GuideExample('からだにいい', {
          'id': 'baik untuk kesehatan',
          'en': 'good for your health',
        }, romaji: 'karada ni ii'),
      ],
    ),
  ],
);
