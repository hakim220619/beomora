// Kartu Kalimat Sehari-hari — situasi N5 (bagian 2). Format & aturan: lihat
// ja_gloss_cards.dart (kana berspasi sejajar romaji, kosakata JLPT,
// `extra` untuk kata di luar JLPT / arti yang perlu dipaksa).
import 'ja_gloss_cards.dart';

const List<GlossCardData> kJaGlossCardsN5b = [
  GlossCardData(
    id: 'n5b_station',
    emoji: '🚉',
    level: 'N5',
    kind: GlossKind.situation,
    title: {'id': 'Di stasiun', 'en': 'At the station'},
    lines: [
      GlossLine('えき に つきました', 'eki ni tsukimashita', {
        'id': 'Saya tiba di stasiun.',
        'en': 'I arrived at the station.',
      }),
      GlossLine('きっぷ は どこ で かいます か', 'kippu wa doko de kaimasu ka', {
        'id': 'Tiket dibeli di mana?',
        'en': 'Where do I buy a ticket?',
      }),
      GlossLine(
        'おおさか まで いくら です か',
        'oosaka made ikura desu ka',
        {'id': 'Sampai Osaka berapa?', 'en': 'How much is it to Osaka?'},
        extra: {
          'おおさか': {'id': 'Osaka (kota)', 'en': 'Osaka (city)'},
        },
      ),
      GlossLine('おとな いちまい ください', 'otona ichimai kudasai', {
        'id': 'Minta satu (tiket) dewasa.',
        'en': 'One adult ticket, please.',
      }),
      GlossLine(
        'でんしゃ は なんじ に でます か',
        'densha wa nanji ni demasu ka',
        {
          'id': 'Keretanya berangkat jam berapa?',
          'en': 'What time does the train leave?',
        },
        extra: {
          'でます': {'id': 'berangkat', 'en': 'leave, depart'},
        },
      ),
      GlossLine(
        'にばんせん から でます',
        'nibansen kara demasu',
        {'id': 'Berangkat dari jalur dua.', 'en': 'It leaves from track two.'},
        extra: {
          'にばんせん': {'id': 'jalur (peron) dua', 'en': 'track two'},
          'でます': {'id': 'berangkat', 'en': 'leave, depart'},
        },
      ),
      GlossLine(
        'かいだん を のぼります',
        'kaidan o noborimasu',
        {'id': 'Saya naik tangga.', 'en': 'I go up the stairs.'},
        extra: {
          'のぼります': {'id': 'naik', 'en': 'go up'},
        },
      ),
      GlossLine(
        'ホーム で でんしゃ を まちます',
        'hoomu de densha o machimasu',
        {
          'id': 'Saya menunggu kereta di peron.',
          'en': 'I wait for the train on the platform.',
        },
        extra: {
          'ホーム': {'id': 'peron', 'en': 'platform'},
        },
      ),
      GlossLine(
        'アナウンス を よく きいて ください',
        'anaunsu o yoku kiite kudasai',
        {
          'id': 'Dengarkan pengumumannya baik-baik.',
          'en': 'Listen carefully to the announcement.',
        },
        extra: {
          'アナウンス': {'id': 'pengumuman', 'en': 'announcement'},
          'よく': {'id': 'baik-baik', 'en': 'carefully'},
        },
      ),
      GlossLine('でんしゃ が きました', 'densha ga kimashita', {
        'id': 'Keretanya datang.',
        'en': 'The train has come.',
      }),
      GlossLine('ドア が しまります', 'doa ga shimarimasu', {
        'id': 'Pintunya menutup.',
        'en': 'The doors are closing.',
      }),
      GlossLine('まど の そば に すわりました', 'mado no soba ni suwarimashita', {
        'id': 'Saya duduk di dekat jendela.',
        'en': 'I sat by the window.',
      }),
    ],
  ),
  GlossCardData(
    id: 'n5b_post_office',
    emoji: '🏤',
    level: 'N5',
    kind: GlossKind.situation,
    title: {'id': 'Di kantor pos', 'en': 'At the post office'},
    lines: [
      GlossLine('ゆうびんきょく へ いきます', 'yuubinkyoku e ikimasu', {
        'id': 'Saya pergi ke kantor pos.',
        'en': 'I go to the post office.',
      }),
      GlossLine(
        'てがみ を だしたい です',
        'tegami o dashitai desu',
        {'id': 'Saya ingin mengirim surat.', 'en': 'I want to send a letter.'},
        extra: {
          'だしたい': {'id': 'ingin mengirim (surat)', 'en': 'want to send (mail)'},
        },
      ),
      GlossLine('きって を さんまい ください', 'kitte o sanmai kudasai', {
        'id': 'Minta tiga perangko.',
        'en': 'Three stamps, please.',
      }),
      GlossLine('ふうとう も ください', 'fuutou mo kudasai', {
        'id': 'Minta amplop juga.',
        'en': 'An envelope too, please.',
      }),
      GlossLine(
        'この にもつ を インドネシア へ おくりたい です',
        'kono nimotsu o indoneshia e okuritai desu',
        {
          'id': 'Saya ingin mengirim paket ini ke Indonesia.',
          'en': 'I want to send this parcel to Indonesia.',
        },
        extra: {
          'インドネシア': {'id': 'Indonesia', 'en': 'Indonesia'},
          'にもつ': {'id': 'barang, paket', 'en': 'parcel, package'},
        },
      ),
      GlossLine(
        'なか は なん です か',
        'naka wa nan desu ka',
        {'id': 'Isinya apa?', 'en': "What's inside?"},
        extra: {
          'なか': {'id': 'isi (bagian dalam)', 'en': 'inside, contents'},
        },
      ),
      GlossLine('ほん と ふく です', 'hon to fuku desu', {
        'id': 'Buku dan baju.',
        'en': 'Books and clothes.',
      }),
      GlossLine(
        'ひこうき で おねがいします',
        'hikouki de onegaishimasu',
        {'id': 'Lewat pos udara, ya.', 'en': 'By airmail, please.'},
        extra: {
          'ひこうき': {'id': 'pesawat (pos udara)', 'en': 'airplane (airmail)'},
          'おねがいします': {'id': 'mohon', 'en': 'please'},
        },
      ),
      GlossLine(
        'なんにち かかります か',
        'nannichi kakarimasu ka',
        {'id': 'Butuh berapa hari?', 'en': 'How many days does it take?'},
        extra: {
          'なんにち': {'id': 'berapa hari', 'en': 'how many days'},
        },
      ),
      GlossLine('いっしゅうかん ぐらい です', 'isshuukan gurai desu', {
        'id': 'Sekitar satu minggu.',
        'en': 'About a week.',
      }),
      GlossLine('ぜんぶ で いくら です か', 'zenbu de ikura desu ka', {
        'id': 'Semuanya berapa?',
        'en': 'How much is it altogether?',
      }),
      GlossLine('にせんえん です', 'nisen\'en desu', {
        'id': 'Dua ribu yen.',
        'en': "It's 2,000 yen.",
      }),
    ],
  ),
  GlossCardData(
    id: 'n5b_hotel',
    emoji: '🏨',
    level: 'N5',
    kind: GlossKind.situation,
    title: {'id': 'Di hotel', 'en': 'At the hotel'},
    lines: [
      GlossLine('ホテル に つきました', 'hoteru ni tsukimashita', {
        'id': 'Saya tiba di hotel.',
        'en': 'I arrived at the hotel.',
      }),
      GlossLine(
        'こんばん へや を よやく しました',
        'konban heya o yoyaku shimashita',
        {
          'id': 'Saya sudah memesan kamar untuk malam ini.',
          'en': "I've booked a room for tonight.",
        },
        extra: {
          'よやく': {'id': 'memesan (reservasi)', 'en': 'reservation, booking'},
        },
      ),
      GlossLine('なまえ を ここ に かいて ください', 'namae o koko ni kaite kudasai', {
        'id': 'Silakan tulis nama di sini.',
        'en': 'Please write your name here.',
      }),
      GlossLine(
        'パスポート を みせて ください',
        'pasupooto o misete kudasai',
        {'id': 'Tolong tunjukkan paspor.', 'en': 'Please show your passport.'},
        extra: {
          'パスポート': {'id': 'paspor', 'en': 'passport'},
        },
      ),
      GlossLine(
        'へや は ごかい です',
        'heya wa gokai desu',
        {
          'id': 'Kamarnya di lantai lima.',
          'en': 'Your room is on the fifth floor.',
        },
        extra: {
          'ごかい': {'id': 'lantai 5', 'en': '5th floor'},
        },
      ),
      GlossLine('これ は へや の かぎ です', 'kore wa heya no kagi desu', {
        'id': 'Ini kunci kamarnya.',
        'en': 'This is the room key.',
      }),
      GlossLine('エレベーター は あちら です', 'erebeetaa wa achira desu', {
        'id': 'Lift ada di sebelah sana.',
        'en': 'The elevator is over there.',
      }),
      GlossLine('へや は ひろい です', 'heya wa hiroi desu', {
        'id': 'Kamarnya luas.',
        'en': 'The room is spacious.',
      }),
      GlossLine('あさごはん は なんじ から です か', 'asagohan wa nanji kara desu ka', {
        'id': 'Sarapan mulai jam berapa?',
        'en': 'What time does breakfast start?',
      }),
      GlossLine('しちじ から くじ まで です', 'shichiji kara kuji made desu', {
        'id': 'Dari jam tujuh sampai jam sembilan.',
        'en': 'From seven to nine.',
      }),
      GlossLine(
        'いっかい の レストラン です',
        'ikkai no resutoran desu',
        {
          'id': 'Di restoran lantai satu.',
          'en': "It's in the restaurant on the first floor.",
        },
        extra: {
          'いっかい': {'id': 'lantai 1', 'en': '1st floor'},
        },
      ),
      GlossLine(
        'ゆっくり やすんで ください',
        'yukkuri yasunde kudasai',
        {
          'id': 'Silakan beristirahat dengan santai.',
          'en': 'Please have a good rest.',
        },
        extra: {
          'ゆっくり': {'id': 'dengan santai', 'en': 'leisurely, well'},
        },
      ),
    ],
  ),
  GlossCardData(
    id: 'n5b_directions',
    emoji: '🧭',
    level: 'N5',
    kind: GlossKind.situation,
    title: {'id': 'Bertanya arah', 'en': 'Asking for directions'},
    lines: [
      GlossLine(
        'すみません ちょっと いい です か',
        'sumimasen chotto ii desu ka',
        {
          'id': 'Permisi, boleh minta waktu sebentar?',
          'en': 'Excuse me, do you have a moment?',
        },
        extra: {
          'いい': {'id': 'boleh', 'en': 'OK, all right'},
        },
      ),
      GlossLine('としょかん は どこ です か', 'toshokan wa doko desu ka', {
        'id': 'Perpustakaan di mana?',
        'en': 'Where is the library?',
      }),
      GlossLine('この みち を まっすぐ いきます', 'kono michi o massugu ikimasu', {
        'id': 'Jalan lurus di jalan ini.',
        'en': 'Go straight along this road.',
      }),
      GlossLine('しんごう を ひだり へ まがります', 'shingou o hidari e magarimasu', {
        'id': 'Belok kiri di lampu merah.',
        'en': 'Turn left at the traffic light.',
      }),
      GlossLine(
        'はし を わたります',
        'hashi o watarimasu',
        {'id': 'Menyeberangi jembatan.', 'en': 'Cross the bridge.'},
        extra: {
          'はし': {'id': 'jembatan', 'en': 'bridge'},
        },
      ),
      GlossLine('ぎんこう の となり に あります', 'ginkou no tonari ni arimasu', {
        'id': 'Ada di sebelah bank.',
        'en': "It's next to the bank.",
      }),
      GlossLine('ここ から ちかい です か', 'koko kara chikai desu ka', {
        'id': 'Dekat dari sini?',
        'en': 'Is it close to here?',
      }),
      GlossLine('いいえ すこし とおい です', 'iie sukoshi tooi desu', {
        'id': 'Tidak, agak jauh.',
        'en': "No, it's a bit far.",
      }),
      GlossLine('あるいて じゅっぷん ぐらい です', 'aruite juppun gurai desu', {
        'id': 'Sekitar sepuluh menit jalan kaki.',
        'en': "It's about ten minutes on foot.",
      }),
      GlossLine(
        'ちず を かいて ください',
        'chizu o kaite kudasai',
        {'id': 'Tolong gambarkan petanya.', 'en': 'Please draw me a map.'},
        extra: {
          'かいて': {'id': 'menggambar', 'en': 'draw'},
        },
      ),
      GlossLine(
        'よく わかりました',
        'yoku wakarimashita',
        {'id': 'Saya sudah paham.', 'en': 'I understand now.'},
        extra: {
          'よく': {'id': 'dengan baik', 'en': 'well'},
        },
      ),
      GlossLine(
        'どうも ありがとう ございました',
        'doumo arigatou gozaimashita',
        {'id': 'Terima kasih banyak.', 'en': 'Thank you very much.'},
        extra: {
          'どうも': {'id': 'sangat', 'en': 'very much'},
          'ございました': {'id': '(sangat sopan)', 'en': '(very polite)'},
        },
      ),
    ],
  ),
  GlossCardData(
    id: 'n5b_phone',
    emoji: '📞',
    level: 'N5',
    kind: GlossKind.situation,
    title: {'id': 'Menelepon', 'en': 'On the phone'},
    lines: [
      GlossLine(
        'もしもし やまだ です',
        'moshimoshi yamada desu',
        {'id': 'Halo, ini Yamada.', 'en': "Hello, it's Yamada."},
        extra: {
          'やまだ': {'id': 'Yamada (nama)', 'en': 'Yamada (name)'},
        },
      ),
      GlossLine('すみません どなた です か', 'sumimasen donata desu ka', {
        'id': 'Maaf, siapa ya?',
        'en': "Sorry, who's calling?",
      }),
      GlossLine(
        'クラス の やまだ です',
        'kurasu no yamada desu',
        {'id': 'Yamada, teman sekelas.', 'en': "It's Yamada from class."},
        extra: {
          'やまだ': {'id': 'Yamada (nama)', 'en': 'Yamada (name)'},
        },
      ),
      GlossLine('いま なに を して います か', 'ima nani o shite imasu ka', {
        'id': 'Sekarang sedang apa?',
        'en': 'What are you doing now?',
      }),
      GlossLine('へや で テレビ を みて います', 'heya de terebi o mite imasu', {
        'id': 'Sedang nonton TV di kamar.',
        'en': "I'm watching TV in my room.",
      }),
      GlossLine('あした ひま です か', 'ashita hima desu ka', {
        'id': 'Besok kamu senggang?',
        'en': 'Are you free tomorrow?',
      }),
      GlossLine('はい ひま です', 'hai hima desu', {
        'id': 'Ya, senggang.',
        'en': "Yes, I'm free.",
      }),
      GlossLine(
        'いっしょ に えいが を みません か',
        'issho ni eiga o mimasen ka',
        {
          'id': 'Mau nonton film bareng?',
          'en': "Won't you watch a movie with me?",
        },
        extra: {
          'みません': {
            'id': 'menonton (ajakan: ～ませんか)',
            'en': 'watch (invitation: ～ませんか)',
          },
        },
      ),
      GlossLine('いい です ね', 'ii desu ne', {
        'id': 'Boleh juga, ya.',
        'en': 'Sounds good.',
      }),
      GlossLine('じゅうじ に えき で あいましょう', 'juuji ni eki de aimashou', {
        'id': 'Ayo ketemu di stasiun jam sepuluh.',
        'en': "Let's meet at the station at ten.",
      }),
      GlossLine('はい わかりました', 'hai wakarimashita', {
        'id': 'Ya, baik.',
        'en': 'OK, got it.',
      }),
      GlossLine(
        'じゃあ また あとで',
        'jaa mata atode',
        {
          'id': 'Kalau begitu, sampai nanti.',
          'en': 'Well then, see you later.',
        },
        extra: {
          'あとで': {'id': 'nanti', 'en': 'later'},
        },
      ),
    ],
  ),
  GlossCardData(
    id: 'n5b_hobby',
    emoji: '🎨',
    level: 'N5',
    kind: GlossKind.situation,
    title: {'id': 'Hobi', 'en': 'Hobbies'},
    lines: [
      GlossLine('しゅみ は なん です か', 'shumi wa nan desu ka', {
        'id': 'Hobimu apa?',
        'en': 'What are your hobbies?',
      }),
      GlossLine(
        'わたし の しゅみ は どくしょ です',
        'watashi no shumi wa dokusho desu',
        {'id': 'Hobi saya membaca.', 'en': 'My hobby is reading.'},
        extra: {
          'どくしょ': {'id': 'membaca (buku)', 'en': 'reading'},
        },
      ),
      GlossLine('まいばん ほん を よみます', 'maiban hon o yomimasu', {
        'id': 'Setiap malam saya membaca buku.',
        'en': 'I read books every night.',
      }),
      GlossLine('どんな ほん が すき です か', 'donna hon ga suki desu ka', {
        'id': 'Suka buku seperti apa?',
        'en': 'What kind of books do you like?',
      }),
      GlossLine('まんが が いちばん すき です', 'manga ga ichiban suki desu', {
        'id': 'Paling suka komik.',
        'en': 'I like manga the most.',
      }),
      GlossLine(
        'りょうり も すき です',
        'ryouri mo suki desu',
        {'id': 'Saya juga suka memasak.', 'en': 'I also like cooking.'},
        extra: {
          'りょうり': {'id': 'memasak', 'en': 'cooking'},
        },
      ),
      GlossLine('にちようび に ケーキ を つくります', 'nichiyoubi ni keeki o tsukurimasu', {
        'id': 'Hari Minggu saya membuat kue.',
        'en': 'I make cakes on Sundays.',
      }),
      GlossLine(
        'いもうと は え を かきます',
        'imouto wa e o kakimasu',
        {
          'id': 'Adik perempuan saya menggambar.',
          'en': 'My younger sister draws pictures.',
        },
        extra: {
          'かきます': {'id': 'menggambar', 'en': 'draw'},
        },
      ),
      GlossLine('え が とても じょうず です', 'e ga totemo jouzu desu', {
        'id': 'Gambarnya sangat bagus.',
        'en': "She's very good at drawing.",
      }),
      GlossLine('あに は よく おんがく を ききます', 'ani wa yoku ongaku o kikimasu', {
        'id': 'Kakak laki-laki saya sering mendengarkan musik.',
        'en': 'My older brother often listens to music.',
      }),
      GlossLine('わたし は うた が へた です', 'watashi wa uta ga heta desu', {
        'id': 'Saya tidak pandai menyanyi.',
        'en': "I'm bad at singing.",
      }),
      GlossLine('いっしょ に うた を うたいましょう', 'issho ni uta o utaimashou', {
        'id': 'Ayo bernyanyi bersama.',
        'en': "Let's sing together.",
      }),
    ],
  ),
];
