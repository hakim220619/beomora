// Kartu Kalimat Sehari-hari — situasi N5 (bagian 3). Format & aturan: lihat
// ja_gloss_cards.dart (kana berspasi sejajar romaji, kosakata JLPT,
// `extra` untuk kata di luar JLPT / arti yang perlu dipaksa).
import 'ja_gloss_cards.dart';

const List<GlossCardData> kJaGlossCardsN5c = [
  GlossCardData(
    id: 'n5c_sports',
    emoji: '⚽',
    level: 'N5',
    title: {'id': 'Olahraga', 'en': 'Sports'},
    lines: [
      GlossLine('わたし は スポーツ が すき です', 'watashi wa supootsu ga suki desu', {
        'id': 'Saya suka olahraga.',
        'en': 'I like sports.',
      }),
      GlossLine('まいあさ こうえん を はしります', 'maiasa kouen o hashirimasu', {
        'id': 'Setiap pagi saya berlari di taman.',
        'en': 'I run in the park every morning.',
      }),
      GlossLine('どようび は サッカー を します', 'doyoubi wa sakkaa o shimasu', {
        'id': 'Hari Sabtu saya main sepak bola.',
        'en': 'On Saturdays I play soccer.',
      }),
      GlossLine('きょう は しあい が あります', 'kyou wa shiai ga arimasu', {
        'id': 'Hari ini ada pertandingan.',
        'en': 'There is a match today.',
      }),
      GlossLine(
        'あいて の チーム は つよい です',
        'aite no chiimu wa tsuyoi desu',
        {'id': 'Tim lawan kuat.', 'en': 'The other team is strong.'},
        extra: {
          'チーム': {'id': 'tim', 'en': 'team'},
        },
      ),
      GlossLine(
        'みんな で いっしょうけんめい はしりました',
        'minna de isshoukenmei hashirimashita',
        {
          'id': 'Kami semua berlari sekuat tenaga.',
          'en': 'We all ran as hard as we could.',
        },
      ),
      GlossLine(
        'わたしたち が かちました',
        'watashitachi ga kachimashita',
        {'id': 'Kami menang.', 'en': 'We won.'},
        extra: {
          'わたしたち': {'id': 'kami', 'en': 'we'},
        },
      ),
      GlossLine(
        'とても うれしかった です',
        'totemo ureshikatta desu',
        {'id': 'Saya sangat senang.', 'en': 'I was very happy.'},
        extra: {
          'うれしかった': {'id': 'senang (lampau)', 'en': 'was happy'},
        },
      ),
      GlossLine('せんしゅう は まけました', 'senshuu wa makemashita', {
        'id': 'Minggu lalu kami kalah.',
        'en': 'Last week we lost.',
      }),
      GlossLine('しあい の あと プール で およぎます', 'shiai no ato puuru de oyogimasu', {
        'id': 'Setelah pertandingan saya berenang di kolam.',
        'en': 'After the match I swim in the pool.',
      }),
      GlossLine('すいえい は からだ に いい です', 'suiei wa karada ni ii desu', {
        'id': 'Berenang baik untuk tubuh.',
        'en': 'Swimming is good for your body.',
      }),
      GlossLine('また らいしゅう しましょう', 'mata raishuu shimashou', {
        'id': 'Ayo main lagi minggu depan.',
        'en': "Let's play again next week.",
      }),
    ],
  ),
  GlossCardData(
    id: 'n5c_cafe',
    emoji: '☕',
    level: 'N5',
    title: {'id': 'Di kafe', 'en': 'At a café'},
    lines: [
      GlossLine(
        'えき の ちかく に きっさてん が あります',
        'eki no chikaku ni kissaten ga arimasu',
        {
          'id': 'Ada kafe di dekat stasiun.',
          'en': "There's a café near the station.",
        },
      ),
      GlossLine('ともだち と きっさてん に はいります', 'tomodachi to kissaten ni hairimasu', {
        'id': 'Saya masuk ke kafe dengan teman.',
        'en': 'I go into the café with a friend.',
      }),
      GlossLine('まど の そば に すわりましょう', 'mado no soba ni suwarimashou', {
        'id': 'Ayo duduk di dekat jendela.',
        'en': "Let's sit by the window.",
      }),
      GlossLine('コーヒー を ふたつ ください', 'koohii o futatsu kudasai', {
        'id': 'Minta kopi dua.',
        'en': 'Two coffees, please.',
      }),
      GlossLine('ケーキ も たべたい です', 'keeki mo tabetai desu', {
        'id': 'Saya juga ingin makan kue.',
        'en': 'I want to eat cake too.',
      }),
      GlossLine('この ケーキ は あまい です ね', 'kono keeki wa amai desu ne', {
        'id': 'Kue ini manis, ya.',
        'en': 'This cake is sweet, isn\'t it?',
      }),
      GlossLine('とても おいしい です', 'totemo oishii desu', {
        'id': 'Enak sekali.',
        'en': "It's really delicious.",
      }),
      GlossLine('コーヒー は すこし にがい です', 'koohii wa sukoshi nigai desu', {
        'id': 'Kopinya agak pahit.',
        'en': 'The coffee is a little bitter.',
      }),
      GlossLine('さとう を いれます か', 'satou o iremasu ka', {
        'id': 'Mau pakai gula?',
        'en': 'Do you take sugar?',
      }),
      GlossLine('ここ は しずか です ね', 'koko wa shizuka desu ne', {
        'id': 'Di sini tenang, ya.',
        'en': "It's quiet here, isn't it?",
      }),
      GlossLine('きょう は わたし が はらいます', 'kyou wa watashi ga haraimasu', {
        'id': 'Hari ini saya yang bayar.',
        'en': "I'll pay today.",
      }),
      GlossLine(
        'ぜんぶ で はっぴゃくえん です',
        'zenbu de happyakuen desu',
        {'id': 'Semuanya delapan ratus yen.', 'en': "It's 800 yen altogether."},
        extra: {
          'はっぴゃくえん': {'id': '800 yen', 'en': '800 yen'},
        },
      ),
    ],
  ),
  GlossCardData(
    id: 'n5c_birthday',
    emoji: '🎂',
    level: 'N5',
    title: {'id': 'Ulang tahun', 'en': 'A birthday'},
    lines: [
      GlossLine('きょう は いもうと の たんじょうび です', 'kyou wa imouto no tanjoubi desu', {
        'id': 'Hari ini ulang tahun adik perempuan saya.',
        'en': "Today is my little sister's birthday.",
      }),
      GlossLine('いもうと は ななさい に なりました', 'imouto wa nanasai ni narimashita', {
        'id': 'Adik saya sudah berumur tujuh tahun.',
        'en': 'My sister turned seven.',
      }),
      GlossLine('うち で パーティー を します', 'uchi de paatii o shimasu', {
        'id': 'Kami mengadakan pesta di rumah.',
        'en': "We're having a party at home.",
      }),
      GlossLine('はは が ケーキ を つくりました', 'haha ga keeki o tsukurimashita', {
        'id': 'Ibu membuat kue.',
        'en': 'My mother made a cake.',
      }),
      GlossLine('ともだち が たくさん きました', 'tomodachi ga takusan kimashita', {
        'id': 'Banyak teman yang datang.',
        'en': 'Lots of friends came.',
      }),
      GlossLine(
        'たんじょうび おめでとう',
        'tanjoubi omedetou',
        {'id': 'Selamat ulang tahun!', 'en': 'Happy birthday!'},
        extra: {
          'おめでとう': {'id': 'selamat', 'en': 'congratulations'},
        },
      ),
      GlossLine('これ は わたし の プレゼント です', 'kore wa watashi no purezento desu', {
        'id': 'Ini hadiah dari saya.',
        'en': 'This is my present.',
      }),
      GlossLine(
        'あけて も いい です か',
        'akete mo ii desu ka',
        {'id': 'Boleh saya buka?', 'en': 'May I open it?'},
        extra: {
          'いい': {'id': 'boleh (～てもいい)', 'en': 'all right (～てもいい)'},
        },
      ),
      GlossLine('かわいい ぼうし です ね', 'kawaii boushi desu ne', {
        'id': 'Topinya lucu, ya.',
        'en': "What a cute hat.",
      }),
      GlossLine(
        'ありがとう とても うれしい です',
        'arigatou totemo ureshii desu',
        {
          'id': 'Terima kasih, saya senang sekali.',
          'en': "Thank you, I'm so happy.",
        },
        extra: {
          'うれしい': {'id': 'senang', 'en': 'happy'},
        },
      ),
      GlossLine('みんな で うた を うたいました', 'minna de uta o utaimashita', {
        'id': 'Kami semua bernyanyi.',
        'en': 'We all sang a song.',
      }),
      GlossLine('たのしい パーティー でした', 'tanoshii paatii deshita', {
        'id': 'Pestanya menyenangkan.',
        'en': 'It was a fun party.',
      }),
    ],
  ),
  GlossCardData(
    id: 'n5c_language_class',
    emoji: '📝',
    level: 'N5',
    title: {'id': 'Di kelas bahasa', 'en': 'In language class'},
    lines: [
      GlossLine(
        'ごご に にほんご の クラス が あります',
        'gogo ni nihongo no kurasu ga arimasu',
        {
          'id': 'Sore ada kelas bahasa Jepang.',
          'en': "There's a Japanese class in the afternoon.",
        },
      ),
      GlossLine(
        'せんせい は やさしい です',
        'sensei wa yasashii desu',
        {'id': 'Gurunya baik hati.', 'en': 'The teacher is kind.'},
        extra: {
          'やさしい': {'id': 'baik hati', 'en': 'kind'},
        },
      ),
      GlossLine(
        'きょうかしょ の じゅうページ を あけて ください',
        'kyoukasho no juupeeji o akete kudasai',
        {
          'id': 'Tolong buka buku pelajaran halaman sepuluh.',
          'en': 'Please open your textbook to page ten.',
        },
        extra: {
          'じゅうページ': {'id': 'halaman 10', 'en': 'page 10'},
        },
      ),
      GlossLine(
        'せんせい の あと に いって ください',
        'sensei no ato ni itte kudasai',
        {
          'id': 'Tolong ucapkan setelah guru.',
          'en': 'Please repeat after the teacher.',
        },
        extra: {
          'いって': {'id': 'mengucapkan', 'en': 'say'},
        },
      ),
      GlossLine(
        'もう いちど おねがいします',
        'mou ichido onegaishimasu',
        {'id': 'Tolong sekali lagi.', 'en': 'Once more, please.'},
        extra: {
          'いちど': {'id': 'sekali', 'en': 'once'},
        },
      ),
      GlossLine('ゆっくり はなして ください', 'yukkuri hanashite kudasai', {
        'id': 'Tolong bicara pelan-pelan.',
        'en': 'Please speak slowly.',
      }),
      GlossLine('この ことば が わかりません', 'kono kotoba ga wakarimasen', {
        'id': 'Saya tidak mengerti kata ini.',
        'en': "I don't understand this word.",
      }),
      GlossLine(
        'せんせい に ききます',
        'sensei ni kikimasu',
        {'id': 'Saya bertanya kepada guru.', 'en': 'I ask the teacher.'},
        extra: {
          'ききます': {'id': 'bertanya', 'en': 'ask'},
        },
      ),
      GlossLine(
        'いみ を おしえて ください',
        'imi o oshiete kudasai',
        {
          'id': 'Tolong beri tahu artinya.',
          'en': 'Please tell me the meaning.',
        },
        extra: {
          'おしえて': {'id': 'memberi tahu', 'en': 'tell'},
        },
      ),
      GlossLine(
        'ああ わかりました',
        'aa wakarimashita',
        {'id': 'Oh, saya mengerti.', 'en': 'Oh, I understand.'},
        extra: {
          'ああ': {'id': 'oh', 'en': 'oh'},
        },
      ),
      GlossLine('みんな で きょうかしょ を よみます', 'minna de kyoukasho o yomimasu', {
        'id': 'Kami semua membaca buku pelajaran.',
        'en': 'We all read the textbook together.',
      }),
      GlossLine(
        'ありがとう ございました',
        'arigatou gozaimashita',
        {'id': 'Terima kasih banyak.', 'en': 'Thank you very much.'},
        extra: {
          'ございました': {
            'id': '(sangat sopan, lampau)',
            'en': '(very polite, past)',
          },
        },
      ),
    ],
  ),
  GlossCardData(
    id: 'n5c_office',
    emoji: '🏢',
    level: 'N5',
    title: {'id': 'Di kantor', 'en': 'At the office'},
    lines: [
      GlossLine('はちじ に かいしゃ に つきます', 'hachiji ni kaisha ni tsukimasu', {
        'id': 'Saya tiba di kantor jam delapan.',
        'en': 'I arrive at the office at eight.',
      }),
      GlossLine('どうりょう に あいさつ します', 'douryou ni aisatsu shimasu', {
        'id': 'Saya menyapa rekan kerja.',
        'en': 'I greet my colleagues.',
      }),
      GlossLine('おはよう ございます', 'ohayou gozaimasu', {
        'id': 'Selamat pagi.',
        'en': 'Good morning.',
      }),
      GlossLine('まず メール を よみます', 'mazu meeru o yomimasu', {
        'id': 'Pertama saya membaca email.',
        'en': 'First I read my emails.',
      }),
      GlossLine('じゅうじ から かいぎ が あります', 'juuji kara kaigi ga arimasu', {
        'id': 'Ada rapat mulai jam sepuluh.',
        'en': "There's a meeting from ten.",
      }),
      GlossLine('きょう は しごと が おおい です', 'kyou wa shigoto ga ooi desu', {
        'id': 'Hari ini pekerjaannya banyak.',
        'en': 'I have a lot of work today.',
      }),
      GlossLine('とても いそがしい です', 'totemo isogashii desu', {
        'id': 'Sangat sibuk.',
        'en': "I'm very busy.",
      }),
      GlossLine('どうりょう と ひるごはん を たべます', 'douryou to hirugohan o tabemasu', {
        'id': 'Saya makan siang dengan rekan kerja.',
        'en': 'I have lunch with a colleague.',
      }),
      GlossLine('なんじ に かえります か', 'nanji ni kaerimasu ka', {
        'id': 'Jam berapa kamu pulang?',
        'en': 'What time are you going home?',
      }),
      GlossLine('きょう は ざんぎょう です', 'kyou wa zangyou desu', {
        'id': 'Hari ini saya lembur.',
        'en': "I'm working overtime today.",
      }),
      GlossLine('くじ ごろ かえります', 'kuji goro kaerimasu', {
        'id': 'Saya pulang sekitar jam sembilan.',
        'en': "I'll go home around nine.",
      }),
      GlossLine('おさき に しつれいします', 'osaki ni shitsureishimasu', {
        'id': 'Saya pulang duluan, ya.',
        'en': "Excuse me for leaving first.",
      }),
    ],
  ),
  GlossCardData(
    id: 'n5c_holiday',
    emoji: '🏖️',
    level: 'N5',
    title: {'id': 'Liburan', 'en': 'A holiday trip'},
    lines: [
      GlossLine('なつやすみ に りょこう を しました', 'natsuyasumi ni ryokou o shimashita', {
        'id': 'Saya berwisata saat liburan musim panas.',
        'en': 'I went on a trip during the summer holiday.',
      }),
      GlossLine('かぞく と ひこうき で いきました', 'kazoku to hikouki de ikimashita', {
        'id': 'Saya pergi naik pesawat dengan keluarga.',
        'en': 'I went by plane with my family.',
      }),
      GlossLine('まいにち いい てんき でした', 'mainichi ii tenki deshita', {
        'id': 'Setiap hari cuacanya bagus.',
        'en': 'The weather was nice every day.',
      }),
      GlossLine('あさ は うみ で およぎました', 'asa wa umi de oyogimashita', {
        'id': 'Pagi hari saya berenang di laut.',
        'en': 'In the morning I swam in the sea.',
      }),
      GlossLine(
        'うみ の みず は きれい でした',
        'umi no mizu wa kirei deshita',
        {'id': 'Air lautnya jernih.', 'en': 'The sea water was clear.'},
        extra: {
          'きれい': {'id': 'jernih; bersih', 'en': 'clear; clean'},
        },
      ),
      GlossLine(
        'つぎ の ひ は やま に のぼりました',
        'tsugi no hi wa yama ni noborimashita',
        {
          'id': 'Keesokan harinya saya naik gunung.',
          'en': 'The next day I climbed a mountain.',
        },
        extra: {
          'ひ': {'id': 'hari', 'en': 'day'},
        },
      ),
      GlossLine('やま の うえ は すずしかった です', 'yama no ue wa suzushikatta desu', {
        'id': 'Di atas gunung sejuk.',
        'en': 'It was cool at the top of the mountain.',
      }),
      GlossLine('けしき が とても きれい でした', 'keshiki ga totemo kirei deshita', {
        'id': 'Pemandangannya sangat indah.',
        'en': 'The scenery was very beautiful.',
      }),
      GlossLine('しゃしん を たくさん とりました', 'shashin o takusan torimashita', {
        'id': 'Saya mengambil banyak foto.',
        'en': 'I took lots of photos.',
      }),
      GlossLine('ともだち に おみやげ を かいました', 'tomodachi ni omiyage o kaimashita', {
        'id': 'Saya membeli oleh-oleh untuk teman.',
        'en': 'I bought souvenirs for my friends.',
      }),
      GlossLine('ほんとう に たのしかった です', 'hontou ni tanoshikatta desu', {
        'id': 'Sungguh menyenangkan.',
        'en': 'It was really fun.',
      }),
      GlossLine('らいねん も また いきたい です', 'rainen mo mata ikitai desu', {
        'id': 'Tahun depan saya ingin pergi lagi.',
        'en': 'I want to go again next year.',
      }),
    ],
  ),
];
