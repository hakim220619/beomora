// Kartu Kalimat Sehari-hari — fokus partikel N5. Format & aturan: lihat
// ja_gloss_cards.dart (kana berspasi sejajar romaji, kosakata JLPT,
// `extra` untuk kata di luar JLPT / arti yang perlu dipaksa).
import 'ja_gloss_cards.dart';

const List<GlossCardData> kJaGlossCardsParticle = [
  GlossCardData(
    id: 'particle_wa_ga',
    emoji: '🎯',
    level: 'N5',
    kind: GlossKind.particle,
    title: {'id': 'は vs が', 'en': 'は vs が'},
    lines: [
      GlossLine('わたし は がくせい です', 'watashi wa gakusei desu', {
        'id': 'Saya (topiknya) adalah pelajar.',
        'en': 'As for me, I am a student.',
      }),
      GlossLine('これ は わたし の ほん です', 'kore wa watashi no hon desu', {
        'id': 'Ini (topiknya) buku saya.',
        'en': 'This is my book.',
      }),
      GlossLine('だれ が きました か', 'dare ga kimashita ka', {
        'id': 'Siapa yang datang?',
        'en': 'Who came?',
      }),
      GlossLine('せんせい が きました', 'sensei ga kimashita', {
        'id': 'Gurulah yang datang.',
        'en': 'The teacher came.',
      }),
      GlossLine('わたし は ねこ が すき です', 'watashi wa neko ga suki desu', {
        'id': 'Saya suka kucing.',
        'en': 'I like cats.',
      }),
      GlossLine('あに は テニス が じょうず です', 'ani wa tenisu ga jouzu desu', {
        'id': 'Kakak laki-laki saya pandai tenis.',
        'en': 'My older brother is good at tennis.',
      }),
      GlossLine('わたし は うた が へた です', 'watashi wa uta ga heta desu', {
        'id': 'Saya tidak pandai menyanyi.',
        'en': 'I am bad at singing.',
      }),
      GlossLine('つくえ の うえ に ほん が あります', 'tsukue no ue ni hon ga arimasu', {
        'id': 'Ada buku di atas meja.',
        'en': 'There is a book on the desk.',
      }),
      GlossLine('わたし は おかね が ありません', 'watashi wa okane ga arimasen', {
        'id': 'Saya tidak punya uang.',
        'en': 'I have no money.',
      }),
      GlossLine(
        'ぞう は はな が ながい です',
        'zou wa hana ga nagai desu',
        {'id': 'Gajah, hidungnya panjang.', 'en': 'Elephants have long noses.'},
        extra: {
          'ぞう': {'id': 'gajah', 'en': 'elephant'},
          'はな': {'id': 'hidung', 'en': 'nose'},
        },
      ),
      GlossLine('きょう は あめ が ふって います', 'kyou wa ame ga futte imasu', {
        'id': 'Hari ini hujan sedang turun.',
        'en': 'Today it is raining.',
      }),
      GlossLine('どれ が あなた の かさ です か', 'dore ga anata no kasa desu ka', {
        'id': 'Yang mana payungmu?',
        'en': 'Which one is your umbrella?',
      }),
    ],
  ),
  GlossCardData(
    id: 'particle_o',
    emoji: '🎯',
    level: 'N5',
    kind: GlossKind.particle,
    title: {'id': 'を', 'en': 'を'},
    lines: [
      GlossLine('あさごはん を たべます', 'asagohan o tabemasu', {
        'id': 'Saya makan sarapan.',
        'en': 'I eat breakfast.',
      }),
      GlossLine('コーヒー を のみます', 'koohii o nomimasu', {
        'id': 'Saya minum kopi.',
        'en': 'I drink coffee.',
      }),
      GlossLine('しんぶん を よみます', 'shinbun o yomimasu', {
        'id': 'Saya membaca koran.',
        'en': 'I read the newspaper.',
      }),
      GlossLine('てがみ を かきます', 'tegami o kakimasu', {
        'id': 'Saya menulis surat.',
        'en': 'I write a letter.',
      }),
      GlossLine('ともだち に でんわ を かけます', 'tomodachi ni denwa o kakemasu', {
        'id': 'Saya menelepon teman.',
        'en': 'I call a friend.',
      }),
      GlossLine('へや を そうじ します', 'heya o souji shimasu', {
        'id': 'Saya membersihkan kamar.',
        'en': 'I clean my room.',
      }),
      GlossLine('いえ を でます', 'ie o demasu', {
        'id': 'Saya keluar dari rumah.',
        'en': 'I leave the house.',
      }),
      GlossLine('こうえん を あるきます', 'kouen o arukimasu', {
        'id': 'Saya berjalan melewati taman.',
        'en': 'I walk through the park.',
      }),
      GlossLine('みち を わたります', 'michi o watarimasu', {
        'id': 'Saya menyeberang jalan.',
        'en': 'I cross the road.',
      }),
      GlossLine('かど を まがります', 'kado o magarimasu', {
        'id': 'Saya berbelok di tikungan.',
        'en': 'I turn at the corner.',
      }),
      GlossLine('でんしゃ を おります', 'densha o orimasu', {
        'id': 'Saya turun dari kereta.',
        'en': 'I get off the train.',
      }),
      GlossLine('よる テレビ を みます', 'yoru terebi o mimasu', {
        'id': 'Malam hari saya menonton TV.',
        'en': 'At night I watch TV.',
      }),
    ],
  ),
  GlossCardData(
    id: 'particle_ni_de',
    emoji: '🎯',
    level: 'N5',
    kind: GlossKind.particle,
    title: {'id': 'に vs で', 'en': 'に vs で'},
    lines: [
      GlossLine('まいあさ しちじ に おきます', 'maiasa shichiji ni okimasu', {
        'id': 'Setiap pagi saya bangun pada jam tujuh.',
        'en': 'I get up at seven every morning.',
      }),
      GlossLine('にちようび に デパート に いきます', 'nichiyoubi ni depaato ni ikimasu', {
        'id': 'Hari Minggu saya pergi ke toserba.',
        'en': 'On Sunday I go to the department store.',
      }),
      GlossLine('デパート で くつ を かいます', 'depaato de kutsu o kaimasu', {
        'id': 'Saya membeli sepatu di toserba.',
        'en': 'I buy shoes at the department store.',
      }),
      GlossLine('バス で がっこう に いきます', 'basu de gakkou ni ikimasu', {
        'id': 'Saya pergi ke sekolah naik bus.',
        'en': 'I go to school by bus.',
      }),
      GlossLine('がっこう で べんきょう します', 'gakkou de benkyou shimasu', {
        'id': 'Saya belajar di sekolah.',
        'en': 'I study at school.',
      }),
      GlossLine('としょかん で ほん を かります', 'toshokan de hon o karimasu', {
        'id': 'Saya meminjam buku di perpustakaan.',
        'en': 'I borrow a book at the library.',
      }),
      GlossLine('ペン で なまえ を かきます', 'pen de namae o kakimasu', {
        'id': 'Saya menulis nama dengan pena.',
        'en': 'I write my name with a pen.',
      }),
      GlossLine(
        'はし で ごはん を たべます',
        'hashi de gohan o tabemasu',
        {
          'id': 'Saya makan nasi dengan sumpit.',
          'en': 'I eat rice with chopsticks.',
        },
        extra: {
          'はし': {'id': 'sumpit', 'en': 'chopsticks'},
        },
      ),
      GlossLine('へや に ねこ が います', 'heya ni neko ga imasu', {
        'id': 'Ada kucing di kamar.',
        'en': 'There is a cat in the room.',
      }),
      GlossLine('にわ で こども が あそびます', 'niwa de kodomo ga asobimasu', {
        'id': 'Anak-anak bermain di halaman.',
        'en': 'The children play in the yard.',
      }),
      GlossLine(
        'ともだち に てがみ を だします',
        'tomodachi ni tegami o dashimasu',
        {
          'id': 'Saya mengirim surat kepada teman.',
          'en': 'I send a letter to a friend.',
        },
        extra: {
          'だします': {'id': 'mengirim', 'en': 'send'},
        },
      ),
      GlossLine('よる じゅういちじ に ねます', 'yoru juuichiji ni nemasu', {
        'id': 'Malam saya tidur pada jam sebelas.',
        'en': 'I go to bed at eleven at night.',
      }),
    ],
  ),
  GlossCardData(
    id: 'particle_e_to_mo',
    emoji: '🎯',
    level: 'N5',
    kind: GlossKind.particle,
    title: {'id': 'へ, と, も', 'en': 'へ, と, も'},
    lines: [
      GlossLine('あした うみ へ いきます', 'ashita umi e ikimasu', {
        'id': 'Besok saya pergi ke laut.',
        'en': 'Tomorrow I am going to the sea.',
      }),
      GlossLine('ともだち と いきます', 'tomodachi to ikimasu', {
        'id': 'Saya pergi bersama teman.',
        'en': 'I am going with a friend.',
      }),
      GlossLine('あに も いきます', 'ani mo ikimasu', {
        'id': 'Kakak laki-laki saya juga pergi.',
        'en': 'My older brother is going too.',
      }),
      GlossLine('あなた も いきます か', 'anata mo ikimasu ka', {
        'id': 'Kamu juga ikut?',
        'en': 'Are you coming too?',
      }),
      GlossLine('わたし も およぎたい です', 'watashi mo oyogitai desu', {
        'id': 'Saya juga ingin berenang.',
        'en': 'I want to swim too.',
      }),
      GlossLine('えき へ あるいて いきます', 'eki e aruite ikimasu', {
        'id': 'Saya pergi ke stasiun dengan berjalan kaki.',
        'en': 'I walk to the station.',
      }),
      GlossLine('パン と ぎゅうにゅう を かいます', 'pan to gyuunyuu o kaimasu', {
        'id': 'Saya membeli roti dan susu.',
        'en': 'I buy bread and milk.',
      }),
      GlossLine('くだもの も かいます', 'kudamono mo kaimasu', {
        'id': 'Saya juga membeli buah.',
        'en': 'I buy fruit too.',
      }),
      GlossLine('はは と でんわ で はなします', 'haha to denwa de hanashimasu', {
        'id': 'Saya bicara dengan ibu lewat telepon.',
        'en': 'I talk with my mother on the phone.',
      }),
      GlossLine('ちち も げんき です', 'chichi mo genki desu', {
        'id': 'Ayah juga sehat.',
        'en': 'My father is well too.',
      }),
      GlossLine('らいしゅう は やま へ いきましょう', 'raishuu wa yama e ikimashou', {
        'id': 'Minggu depan ayo pergi ke gunung.',
        'en': 'Let\'s go to the mountains next week.',
      }),
      GlossLine('らいねん にほん へ いきたい です', 'rainen nihon e ikitai desu', {
        'id': 'Tahun depan saya ingin pergi ke Jepang.',
        'en': 'Next year I want to go to Japan.',
      }),
    ],
  ),
  GlossCardData(
    id: 'particle_kara_made',
    emoji: '🎯',
    level: 'N5',
    kind: GlossKind.particle,
    title: {'id': 'から, まで', 'en': 'から, まで'},
    lines: [
      GlossLine('ぎんこう は くじ から です', 'ginkou wa kuji kara desu', {
        'id': 'Bank buka mulai jam sembilan.',
        'en': 'The bank opens from nine.',
      }),
      GlossLine('ごご さんじ まで です', 'gogo sanji made desu', {
        'id': 'Sampai jam tiga sore.',
        'en': 'Until three in the afternoon.',
      }),
      GlossLine('くじ から ごじ まで はたらきます', 'kuji kara goji made hatarakimasu', {
        'id': 'Saya bekerja dari jam sembilan sampai jam lima.',
        'en': 'I work from nine to five.',
      }),
      GlossLine('やすみ は どようび から です', 'yasumi wa doyoubi kara desu', {
        'id': 'Liburnya mulai hari Sabtu.',
        'en': 'The holiday starts on Saturday.',
      }),
      GlossLine('あさ から ばん まで べんきょう します', 'asa kara ban made benkyou shimasu', {
        'id': 'Saya belajar dari pagi sampai malam.',
        'en': 'I study from morning till night.',
      }),
      GlossLine('いえ から えき まで あるきます', 'ie kara eki made arukimasu', {
        'id': 'Saya berjalan dari rumah sampai stasiun.',
        'en': 'I walk from home to the station.',
      }),
      GlossLine('えき まで じゅっぷん かかります', 'eki made juppun kakarimasu', {
        'id': 'Sampai stasiun butuh sepuluh menit.',
        'en': 'It takes ten minutes to the station.',
      }),
      GlossLine('ここ から がっこう まで とおい です', 'koko kara gakkou made tooi desu', {
        'id': 'Dari sini sampai sekolah jauh.',
        'en': 'It is far from here to the school.',
      }),
      GlossLine('これ は はは から の てがみ です', 'kore wa haha kara no tegami desu', {
        'id': 'Ini surat dari ibu.',
        'en': 'This is a letter from my mother.',
      }),
      GlossLine('さむい です から まど を しめます', 'samui desu kara mado o shimemasu', {
        'id': 'Karena dingin, saya menutup jendela.',
        'en': 'It\'s cold, so I close the window.',
      }),
      GlossLine('あつい です から みず を のみます', 'atsui desu kara mizu o nomimasu', {
        'id': 'Karena panas, saya minum air.',
        'en': 'It\'s hot, so I drink water.',
      }),
      GlossLine('じかん が ありません から いそぎます', 'jikan ga arimasen kara isogimasu', {
        'id': 'Karena tidak ada waktu, saya bergegas.',
        'en': 'I have no time, so I hurry.',
      }),
    ],
  ),
  GlossCardData(
    id: 'particle_no_ka_ne_yo',
    emoji: '🎯',
    level: 'N5',
    kind: GlossKind.particle,
    title: {'id': 'の, か, ね, よ', 'en': 'の, か, ね, よ'},
    lines: [
      GlossLine('だれ の かばん です か', 'dare no kaban desu ka', {
        'id': 'Tas siapa ini?',
        'en': 'Whose bag is this?',
      }),
      GlossLine('わたし の かばん です', 'watashi no kaban desu', {
        'id': 'Itu tas saya.',
        'en': 'It is my bag.',
      }),
      GlossLine('なまえ は なん です か', 'namae wa nan desu ka', {
        'id': 'Siapa namamu?',
        'en': 'What is your name?',
      }),
      GlossLine('にほんご の ほん です か', 'nihongo no hon desu ka', {
        'id': 'Apakah itu buku bahasa Jepang?',
        'en': 'Is it a Japanese book?',
      }),
      GlossLine('おちゃ を のみます か', 'ocha o nomimasu ka', {
        'id': 'Mau minum teh?',
        'en': 'Will you have some tea?',
      }),
      GlossLine('いい てんき です ね', 'ii tenki desu ne', {
        'id': 'Cuacanya bagus, ya.',
        'en': 'Nice weather, isn\'t it?',
      }),
      GlossLine('そう です ね', 'sou desu ne', {
        'id': 'Iya, betul ya.',
        'en': 'Yes, that is right.',
      }),
      GlossLine('この ケーキ おいしい です ね', 'kono keeki oishii desu ne', {
        'id': 'Kue ini enak, ya.',
        'en': 'This cake is tasty, isn\'t it?',
      }),
      GlossLine('あした は やすみ です よ', 'ashita wa yasumi desu yo', {
        'id': 'Besok libur, lho.',
        'en': 'Tomorrow is a day off, you know.',
      }),
      GlossLine(
        'その みせ は たかい です よ',
        'sono mise wa takai desu yo',
        {
          'id': 'Toko itu mahal, lho.',
          'en': 'That shop is expensive, you know.',
        },
        extra: {
          'たかい': {'id': 'mahal', 'en': 'expensive'},
        },
      ),
      GlossLine('えき は あそこ です よ', 'eki wa asoko desu yo', {
        'id': 'Stasiunnya di sana, kok.',
        'en': 'The station is over there.',
      }),
      GlossLine('せんせい の いえ は ちかい です か', 'sensei no ie wa chikai desu ka', {
        'id': 'Apakah rumah guru dekat?',
        'en': 'Is the teacher\'s house near?',
      }),
    ],
  ),
];
