import 'ja_gloss_cards_n4a.dart';
import 'ja_gloss_cards_n4b.dart';
import 'ja_gloss_cards_n5b.dart';
import 'ja_gloss_cards_n5c.dart';
import 'ja_gloss_cards_particle.dart';
import 'ja_gloss_cards_story.dart';

/// Kartu "Kalimat Sehari-hari" (Latihan, kursus Jepang): tiap kartu satu
/// situasi berisi 10–12 kalimat pendek yang saling berhubungan. Kalimat
/// ditulis kana dengan spasi antarkata (sejajar dengan romaji) dan hanya
/// memakai kosakata JLPT di jlpt_vocab.dart, supaya arti per kata dibuat
/// otomatis oleh services/ja_gloss.dart (dicek di test/sentence_gloss_test).
/// Penanda nama pengguna di [GlossLine] (teks, romaji & arti).
const kGlossNameSlot = '{name}';

class GlossLine {
  final String text;
  final String romaji;
  final Map<String, String> meaning;

  /// Arti kata di luar JLPT (nama diri, kata serapan): kata → {id, en}.
  final Map<String, Map<String, String>> extra;
  const GlossLine(
    this.text,
    this.romaji,
    this.meaning, {
    this.extra = const {},
  });
}

/// Jenis kartu → bagian di grid Kalimat Sehari-hari.
enum GlossKind { situation, story, particle }

class GlossCardData {
  final String id;
  final String emoji;
  final String level; // 'N5' / 'N4'
  final GlossKind kind;
  final Map<String, String> title;
  final List<GlossLine> lines;
  const GlossCardData({
    required this.id,
    required this.emoji,
    required this.level,
    this.kind = GlossKind.situation,
    required this.title,
    required this.lines,
  });
}

/// Semua kartu, urut tampil (level → jenis → urutan di daftar).
const List<GlossCardData> kJaGlossCards = [
  ..._n5Situations,
  ...kJaGlossCardsN5b,
  ...kJaGlossCardsN5c,
  ...kJaGlossCardsStory,
  ...kJaGlossCardsParticle,
  ...kJaGlossCardsN4a,
  ...kJaGlossCardsN4b,
];

const List<GlossCardData> _n5Situations = [
  GlossCardData(
    id: 'n5_morning',
    emoji: '🌅',
    level: 'N5',
    title: {'id': 'Pagi hari', 'en': 'In the morning'},
    lines: [
      GlossLine('まいあさ ろくじ に おきます', 'maiasa rokuji ni okimasu', {
        'id': 'Setiap pagi saya bangun jam enam.',
        'en': 'I get up at six every morning.',
      }),
      GlossLine('まど を あけます', 'mado o akemasu', {
        'id': 'Saya membuka jendela.',
        'en': 'I open the window.',
      }),
      GlossLine('かお を あらいます', 'kao o araimasu', {
        'id': 'Saya mencuci muka.',
        'en': 'I wash my face.',
      }),
      GlossLine('は を みがきます', 'ha o migakimasu', {
        'id': 'Saya menggosok gigi.',
        'en': 'I brush my teeth.',
      }),
      GlossLine('あさごはん を たべます', 'asagohan o tabemasu', {
        'id': 'Saya sarapan.',
        'en': 'I eat breakfast.',
      }),
      GlossLine('パン と たまご を たべます', 'pan to tamago o tabemasu', {
        'id': 'Saya makan roti dan telur.',
        'en': 'I eat bread and eggs.',
      }),
      GlossLine('ぎゅうにゅう を のみます', 'gyuunyuu o nomimasu', {
        'id': 'Saya minum susu.',
        'en': 'I drink milk.',
      }),
      GlossLine('しんぶん を よみます', 'shinbun o yomimasu', {
        'id': 'Saya membaca koran.',
        'en': 'I read the newspaper.',
      }),
      GlossLine('きょう は いい てんき です', 'kyou wa ii tenki desu', {
        'id': 'Hari ini cuacanya bagus.',
        'en': 'The weather is nice today.',
      }),
      GlossLine(
        'ふく を きます',
        'fuku o kimasu',
        {'id': 'Saya memakai baju.', 'en': 'I put on my clothes.'},
        extra: {
          'きます': {'id': 'memakai (baju)', 'en': 'put on (clothes)'},
        },
      ),
      GlossLine('しちじ に うち を でます', 'shichiji ni uchi o demasu', {
        'id': 'Saya keluar rumah jam tujuh.',
        'en': 'I leave home at seven.',
      }),
      GlossLine('えき まで あるきます', 'eki made arukimasu', {
        'id': 'Saya berjalan sampai stasiun.',
        'en': 'I walk to the station.',
      }),
    ],
  ),
  GlossCardData(
    id: 'n5_school',
    emoji: '🏫',
    level: 'N5',
    title: {'id': 'Di sekolah', 'en': 'At school'},
    lines: [
      GlossLine('わたし は がくせい です', 'watashi wa gakusei desu', {
        'id': 'Saya pelajar.',
        'en': 'I am a student.',
      }),
      GlossLine('がっこう へ いきます', 'gakkou e ikimasu', {
        'id': 'Saya pergi ke sekolah.',
        'en': 'I go to school.',
      }),
      GlossLine('きょうしつ は にかい です', 'kyoushitsu wa nikai desu', {
        'id': 'Ruang kelasnya di lantai dua.',
        'en': 'The classroom is on the second floor.',
      }),
      GlossLine(
        'せんせい は やさしい です',
        'sensei wa yasashii desu',
        {'id': 'Gurunya baik hati.', 'en': 'The teacher is kind.'},
        extra: {
          'やさしい': {'id': 'baik hati', 'en': 'kind'},
        },
      ),
      GlossLine('にほんご を べんきょうします', 'nihongo o benkyoushimasu', {
        'id': 'Saya belajar bahasa Jepang.',
        'en': 'I study Japanese.',
      }),
      GlossLine('ノート に かきます', 'nooto ni kakimasu', {
        'id': 'Saya menulis di buku catatan.',
        'en': 'I write in my notebook.',
      }),
      GlossLine('えんぴつ を かして ください', 'enpitsu o kashite kudasai', {
        'id': 'Tolong pinjamkan pensilnya.',
        'en': 'Please lend me a pencil.',
      }),
      GlossLine('しつもん が あります', 'shitsumon ga arimasu', {
        'id': 'Saya ada pertanyaan.',
        'en': 'I have a question.',
      }),
      GlossLine('この かんじ は むずかしい です', 'kono kanji wa muzukashii desu', {
        'id': 'Kanji ini sulit.',
        'en': 'This kanji is difficult.',
      }),
      GlossLine('ともだち と ひるごはん を たべます', 'tomodachi to hirugohan o tabemasu', {
        'id': 'Saya makan siang dengan teman.',
        'en': 'I eat lunch with a friend.',
      }),
      GlossLine('としょかん で ほん を よみます', 'toshokan de hon o yomimasu', {
        'id': 'Saya membaca buku di perpustakaan.',
        'en': 'I read books in the library.',
      }),
      GlossLine('しゅくだい を わすれました', 'shukudai o wasuremashita', {
        'id': 'Saya lupa PR.',
        'en': 'I forgot my homework.',
      }),
    ],
  ),
  GlossCardData(
    id: 'n5_shopping',
    emoji: '🛒',
    level: 'N5',
    title: {'id': 'Belanja', 'en': 'Shopping'},
    lines: [
      GlossLine('デパート へ いきます', 'depaato e ikimasu', {
        'id': 'Saya pergi ke department store.',
        'en': 'I go to the department store.',
      }),
      GlossLine('あたらしい くつ が ほしい です', 'atarashii kutsu ga hoshii desu', {
        'id': 'Saya ingin sepatu baru.',
        'en': 'I want new shoes.',
      }),
      GlossLine('これ は いくら です か', 'kore wa ikura desu ka', {
        'id': 'Ini berapa harganya?',
        'en': 'How much is this?',
      }),
      GlossLine(
        'ちょっと たかい です',
        'chotto takai desu',
        {'id': 'Agak mahal.', 'en': "It's a bit expensive."},
        extra: {
          'ちょっと': {'id': 'agak', 'en': 'a bit'},
          'たかい': {'id': 'mahal', 'en': 'expensive'},
        },
      ),
      GlossLine('もっと やすい の が あります か', 'motto yasui no ga arimasu ka', {
        'id': 'Ada yang lebih murah?',
        'en': 'Do you have a cheaper one?',
      }),
      GlossLine('あの あおい セーター を みせて ください', 'ano aoi seetaa o misete kudasai', {
        'id': 'Tolong perlihatkan sweter biru itu.',
        'en': 'Please show me that blue sweater.',
      }),
      GlossLine('これ を ください', 'kore o kudasai', {
        'id': 'Saya ambil yang ini.',
        'en': "I'll take this one.",
      }),
      GlossLine(
        'ふくろ は いりません',
        'fukuro wa irimasen',
        {'id': 'Tidak perlu kantong.', 'en': "I don't need a bag."},
        extra: {
          'いりません': {'id': 'tidak perlu', 'en': 'not needed'},
        },
      ),
      GlossLine('スーパー で やさい を かいます', 'suupaa de yasai o kaimasu', {
        'id': 'Saya membeli sayur di supermarket.',
        'en': 'I buy vegetables at the supermarket.',
      }),
      GlossLine('りんご を みっつ かいました', 'ringo o mittsu kaimashita', {
        'id': 'Saya membeli tiga buah apel.',
        'en': 'I bought three apples.',
      }),
      GlossLine('さいふ に おかね が ありません', 'saifu ni okane ga arimasen', {
        'id': 'Di dompet tidak ada uang.',
        'en': "There's no money in my wallet.",
      }),
      GlossLine('カード で はらいます', 'kaado de haraimasu', {
        'id': 'Saya bayar dengan kartu.',
        'en': 'I pay by card.',
      }),
    ],
  ),
  GlossCardData(
    id: 'n5_weather',
    emoji: '⛅',
    level: 'N5',
    title: {'id': 'Cuaca & musim', 'en': 'Weather & seasons'},
    lines: [
      GlossLine('きょう は あめ が ふって います', 'kyou wa ame ga futte imasu', {
        'id': 'Hari ini sedang hujan.',
        'en': "It's raining today.",
      }),
      GlossLine('かさ を もって いきます', 'kasa o motte ikimasu', {
        'id': 'Saya pergi membawa payung.',
        'en': "I'll take an umbrella.",
      }),
      GlossLine('きのう は さむかった です', 'kinou wa samukatta desu', {
        'id': 'Kemarin dingin.',
        'en': 'It was cold yesterday.',
      }),
      GlossLine('あした は はれ です', 'ashita wa hare desu', {
        'id': 'Besok cerah.',
        'en': 'It will be sunny tomorrow.',
      }),
      GlossLine('なつ は とても あつい です', 'natsu wa totemo atsui desu', {
        'id': 'Musim panas sangat panas.',
        'en': 'Summer is very hot.',
      }),
      GlossLine('ふゆ は ゆき が ふります', 'fuyu wa yuki ga furimasu', {
        'id': 'Di musim dingin turun salju.',
        'en': 'It snows in winter.',
      }),
      GlossLine('はる は あたたかい です', 'haru wa atatakai desu', {
        'id': 'Musim semi hangat.',
        'en': 'Spring is warm.',
      }),
      GlossLine('あき は すずしい です', 'aki wa suzushii desu', {
        'id': 'Musim gugur sejuk.',
        'en': 'Autumn is cool.',
      }),
      GlossLine('かぜ が つよい です', 'kaze ga tsuyoi desu', {
        'id': 'Anginnya kencang.',
        'en': 'The wind is strong.',
      }),
      GlossLine('そら が あおい です', 'sora ga aoi desu', {
        'id': 'Langitnya biru.',
        'en': 'The sky is blue.',
      }),
      GlossLine('きょう は くもり です', 'kyou wa kumori desu', {
        'id': 'Hari ini mendung.',
        'en': "It's cloudy today.",
      }),
      GlossLine('わたし は なつ が すき です', 'watashi wa natsu ga suki desu', {
        'id': 'Saya suka musim panas.',
        'en': 'I like summer.',
      }),
    ],
  ),
  GlossCardData(
    id: 'n5_restaurant',
    emoji: '🍜',
    level: 'N5',
    title: {'id': 'Di restoran', 'en': 'At a restaurant'},
    lines: [
      GlossLine('おなか が すきました', 'onaka ga sukimashita', {
        'id': 'Saya lapar.',
        'en': "I'm hungry.",
      }),
      GlossLine('レストラン に はいります', 'resutoran ni hairimasu', {
        'id': 'Saya masuk ke restoran.',
        'en': 'I enter a restaurant.',
      }),
      GlossLine(
        'メニュー を みます',
        'menyuu o mimasu',
        {'id': 'Saya melihat menu.', 'en': 'I look at the menu.'},
        extra: {
          'メニュー': {'id': 'menu', 'en': 'menu'},
        },
      ),
      GlossLine('なに を たべます か', 'nani o tabemasu ka', {
        'id': 'Mau makan apa?',
        'en': 'What will you eat?',
      }),
      GlossLine(
        'わたし は さかな に します',
        'watashi wa sakana ni shimasu',
        {'id': 'Saya pilih ikan.', 'en': "I'll have the fish."},
        extra: {
          'します': {'id': 'memilih (～にします)', 'en': 'choose (～にします)'},
        },
      ),
      GlossLine('おちゃ を ふたつ ください', 'ocha o futatsu kudasai', {
        'id': 'Minta teh dua.',
        'en': 'Two teas, please.',
      }),
      GlossLine('この りょうり は おいしい です', 'kono ryouri wa oishii desu', {
        'id': 'Masakan ini enak.',
        'en': 'This dish is delicious.',
      }),
      GlossLine('すこし からい です', 'sukoshi karai desu', {
        'id': 'Agak pedas.',
        'en': "It's a little spicy.",
      }),
      GlossLine('みず を ください', 'mizu o kudasai', {
        'id': 'Minta air.',
        'en': 'Water, please.',
      }),
      GlossLine('おなか が いっぱい です', 'onaka ga ippai desu', {
        'id': 'Saya sudah kenyang.',
        'en': "I'm full.",
      }),
      GlossLine('ごちそうさま でした', 'gochisousama deshita', {
        'id': 'Terima kasih atas makanannya.',
        'en': 'Thank you for the meal.',
      }),
      GlossLine('ぜんぶ で せんえん です', 'zenbu de sen\'en desu', {
        'id': 'Semuanya seribu yen.',
        'en': "It's 1,000 yen altogether.",
      }),
    ],
  ),
  GlossCardData(
    id: 'n5_transport',
    emoji: '🚃',
    level: 'N5',
    title: {'id': 'Naik kendaraan', 'en': 'Getting around'},
    lines: [
      GlossLine('えき は どこ です か', 'eki wa doko desu ka', {
        'id': 'Stasiun di mana?',
        'en': 'Where is the station?',
      }),
      GlossLine('まっすぐ いって ください', 'massugu itte kudasai', {
        'id': 'Silakan jalan lurus.',
        'en': 'Please go straight.',
      }),
      GlossLine('つぎ の かど を みぎ へ まがります', 'tsugi no kado o migi e magarimasu', {
        'id': 'Belok kanan di tikungan berikutnya.',
        'en': 'Turn right at the next corner.',
      }),
      GlossLine('きっぷ を かいます', 'kippu o kaimasu', {
        'id': 'Saya membeli tiket.',
        'en': 'I buy a ticket.',
      }),
      GlossLine('でんしゃ に のります', 'densha ni norimasu', {
        'id': 'Saya naik kereta.',
        'en': 'I get on the train.',
      }),
      GlossLine('でんしゃ は とても こんで います', 'densha wa totemo konde imasu', {
        'id': 'Keretanya sangat penuh.',
        'en': 'The train is very crowded.',
      }),
      GlossLine('つぎ の えき で おります', 'tsugi no eki de orimasu', {
        'id': 'Saya turun di stasiun berikutnya.',
        'en': 'I get off at the next station.',
      }),
      GlossLine('バス を まちます', 'basu o machimasu', {
        'id': 'Saya menunggu bus.',
        'en': 'I wait for the bus.',
      }),
      GlossLine('バス は おそい です', 'basu wa osoi desu', {
        'id': 'Busnya lambat.',
        'en': 'The bus is slow.',
      }),
      GlossLine('タクシー で かえります', 'takushii de kaerimasu', {
        'id': 'Saya pulang naik taksi.',
        'en': 'I go home by taxi.',
      }),
      GlossLine('くうこう まで いちじかん かかります', 'kuukou made ichijikan kakarimasu', {
        'id': 'Sampai bandara butuh satu jam.',
        'en': 'It takes an hour to the airport.',
      }),
      GlossLine('じてんしゃ で こうえん へ いきます', 'jitensha de kouen e ikimasu', {
        'id': 'Saya ke taman naik sepeda.',
        'en': 'I go to the park by bike.',
      }),
    ],
  ),
  GlossCardData(
    id: 'n5_family',
    emoji: '👨‍👩‍👧',
    level: 'N5',
    title: {'id': 'Keluarga saya', 'en': 'My family'},
    lines: [
      GlossLine('わたし の かぞく は よにん です', 'watashi no kazoku wa yonin desu', {
        'id': 'Keluarga saya berempat.',
        'en': 'There are four people in my family.',
      }),
      GlossLine('ちち は かいしゃいん です', 'chichi wa kaishain desu', {
        'id': 'Ayah saya pegawai kantor.',
        'en': 'My father is an office worker.',
      }),
      GlossLine('はは は りょうり が じょうず です', 'haha wa ryouri ga jouzu desu', {
        'id': 'Ibu saya pandai memasak.',
        'en': 'My mother is good at cooking.',
      }),
      GlossLine('あに は せ が たかい です', 'ani wa se ga takai desu', {
        'id': 'Kakak laki-laki saya tinggi.',
        'en': 'My older brother is tall.',
      }),
      GlossLine('いもうと は じゅうさい です', 'imouto wa juussai desu', {
        'id': 'Adik perempuan saya sepuluh tahun.',
        'en': 'My younger sister is ten.',
      }),
      GlossLine('いぬ も います', 'inu mo imasu', {
        'id': 'Ada anjing juga.',
        'en': 'We have a dog too.',
      }),
      GlossLine('そふ と そぼ は いなか に います', 'sofu to sobo wa inaka ni imasu', {
        'id': 'Kakek dan nenek ada di kampung.',
        'en': 'My grandparents live in the countryside.',
      }),
      GlossLine('よる は みんな で ごはん を たべます', 'yoru wa minna de gohan o tabemasu', {
        'id': 'Malam hari kami makan bersama.',
        'en': 'At night we all eat together.',
      }),
      GlossLine('ちち は テレビ を みて います', 'chichi wa terebi o mite imasu', {
        'id': 'Ayah sedang menonton TV.',
        'en': 'My father is watching TV.',
      }),
      GlossLine('はは と かいもの に いきます', 'haha to kaimono ni ikimasu', {
        'id': 'Saya pergi belanja dengan ibu.',
        'en': 'I go shopping with my mother.',
      }),
      GlossLine('あに の しゃしん を みせます', 'ani no shashin o misemasu', {
        'id': 'Saya menunjukkan foto kakak.',
        'en': "I show my brother's photo.",
      }),
      GlossLine('わたし は かぞく が だいすき です', 'watashi wa kazoku ga daisuki desu', {
        'id': 'Saya sangat sayang keluarga.',
        'en': 'I love my family.',
      }),
    ],
  ),
  GlossCardData(
    id: 'n5_home',
    emoji: '🏠',
    level: 'N5',
    title: {'id': 'Di rumah', 'en': 'At home'},
    lines: [
      GlossLine('わたし の うち は ちいさい です', 'watashi no uchi wa chiisai desu', {
        'id': 'Rumah saya kecil.',
        'en': 'My house is small.',
      }),
      GlossLine('へや に つくえ が あります', 'heya ni tsukue ga arimasu', {
        'id': 'Di kamar ada meja.',
        'en': "There's a desk in my room.",
      }),
      GlossLine('ベッド の うえ に ねこ が います', 'beddo no ue ni neko ga imasu', {
        'id': 'Di atas kasur ada kucing.',
        'en': "There's a cat on the bed.",
      }),
      GlossLine('だいどころ で りょうり を します', 'daidokoro de ryouri o shimasu', {
        'id': 'Saya memasak di dapur.',
        'en': 'I cook in the kitchen.',
      }),
      GlossLine('おふろ に はいります', 'ofuro ni hairimasu', {
        'id': 'Saya berendam (mandi).',
        'en': 'I take a bath.',
      }),
      GlossLine('へや を そうじします', 'heya o soujishimasu', {
        'id': 'Saya membersihkan kamar.',
        'en': 'I clean my room.',
      }),
      GlossLine('せんたく を します', 'sentaku o shimasu', {
        'id': 'Saya mencuci baju.',
        'en': 'I do the laundry.',
      }),
      GlossLine('でんき を つけます', 'denki o tsukemasu', {
        'id': 'Saya menyalakan lampu.',
        'en': 'I turn on the light.',
      }),
      GlossLine('おんがく を ききます', 'ongaku o kikimasu', {
        'id': 'Saya mendengarkan musik.',
        'en': 'I listen to music.',
      }),
      GlossLine('ともだち に でんわ を かけます', 'tomodachi ni denwa o kakemasu', {
        'id': 'Saya menelepon teman.',
        'en': 'I call a friend.',
      }),
      GlossLine('じゅういちじ に ねます', 'juuichiji ni nemasu', {
        'id': 'Saya tidur jam sebelas.',
        'en': 'I go to bed at eleven.',
      }),
      GlossLine('おやすみなさい', 'oyasuminasai', {
        'id': 'Selamat tidur.',
        'en': 'Good night.',
      }),
    ],
  ),
  GlossCardData(
    id: 'n5_intro',
    emoji: '🙋',
    level: 'N5',
    title: {'id': 'Perkenalan', 'en': 'Introducing yourself'},
    lines: [
      GlossLine('はじめまして', 'hajimemashite', {
        'id': 'Salam kenal.',
        'en': 'Nice to meet you.',
      }),
      // {name} diganti nama pengguna yang login (katakana), lihat
      // glossCardLines di services/ja_gloss.dart.
      GlossLine('わたし の なまえ は {name} です', 'watashi no namae wa {name} desu', {
        'id': 'Nama saya {name}.',
        'en': 'My name is {name}.',
      }),
      GlossLine(
        'インドネシア から きました',
        'indoneshia kara kimashita',
        {'id': 'Saya datang dari Indonesia.', 'en': 'I came from Indonesia.'},
        extra: {
          'インドネシア': {'id': 'Indonesia', 'en': 'Indonesia'},
        },
      ),
      GlossLine('はたち です', 'hatachi desu', {
        'id': 'Saya dua puluh tahun.',
        'en': "I'm twenty years old.",
      }),
      GlossLine('だいがく で えいご を べんきょうします', 'daigaku de eigo o benkyoushimasu', {
        'id': 'Saya belajar bahasa Inggris di universitas.',
        'en': 'I study English at university.',
      }),
      GlossLine('しゅみ は りょうり です', 'shumi wa ryouri desu', {
        'id': 'Hobi saya memasak.',
        'en': 'My hobby is cooking.',
      }),
      GlossLine('にほん の えいが が すき です', 'nihon no eiga ga suki desu', {
        'id': 'Saya suka film Jepang.',
        'en': 'I like Japanese films.',
      }),
      GlossLine('にほんご は すこし わかります', 'nihongo wa sukoshi wakarimasu', {
        'id': 'Saya sedikit mengerti bahasa Jepang.',
        'en': 'I understand a little Japanese.',
      }),
      GlossLine(
        'いま とうきょう に すんで います',
        'ima toukyou ni sunde imasu',
        {'id': 'Sekarang saya tinggal di Tokyo.', 'en': 'I live in Tokyo now.'},
        extra: {
          'とうきょう': {'id': 'Tokyo', 'en': 'Tokyo'},
        },
      ),
      GlossLine('どうぞ よろしく おねがいします', 'douzo yoroshiku onegaishimasu', {
        'id': 'Mohon bantuannya.',
        'en': 'Pleased to meet you.',
      }),
      GlossLine('あなた の なまえ は なん です か', 'anata no namae wa nan desu ka', {
        'id': 'Nama Anda siapa?',
        'en': 'What is your name?',
      }),
      GlossLine('おしごと は なん です か', 'oshigoto wa nan desu ka', {
        'id': 'Pekerjaan Anda apa?',
        'en': 'What do you do for work?',
      }),
    ],
  ),
  GlossCardData(
    id: 'n5_time',
    emoji: '⏰',
    level: 'N5',
    title: {'id': 'Waktu & janji', 'en': 'Time & plans'},
    lines: [
      GlossLine('いま なんじ です か', 'ima nanji desu ka', {
        'id': 'Sekarang jam berapa?',
        'en': 'What time is it now?',
      }),
      GlossLine('さんじ はん です', 'sanji han desu', {
        'id': 'Jam setengah empat.',
        'en': "It's half past three.",
      }),
      GlossLine('きょう は なんようび です か', 'kyou wa nan\'youbi desu ka', {
        'id': 'Hari ini hari apa?',
        'en': 'What day is it today?',
      }),
      GlossLine('きょう は きんようび です', 'kyou wa kin\'youbi desu', {
        'id': 'Hari ini hari Jumat.',
        'en': "Today is Friday.",
      }),
      GlossLine('どようび に えいが を みましょう', 'doyoubi ni eiga o mimashou', {
        'id': 'Hari Sabtu ayo nonton film.',
        'en': "Let's watch a movie on Saturday.",
      }),
      GlossLine('なんじ に あいましょう か', 'nanji ni aimashou ka', {
        'id': 'Mau ketemu jam berapa?',
        'en': 'What time shall we meet?',
      }),
      GlossLine('ごご にじ は どう です か', 'gogo niji wa dou desu ka', {
        'id': 'Bagaimana kalau jam dua siang?',
        'en': 'How about 2 p.m.?',
      }),
      GlossLine('えき の まえ で まって います', 'eki no mae de matte imasu', {
        'id': 'Saya tunggu di depan stasiun.',
        'en': "I'll be waiting in front of the station.",
      }),
      GlossLine('すこし おそく なります', 'sukoshi osoku narimasu', {
        'id': 'Saya akan sedikit terlambat.',
        'en': "I'll be a little late.",
      }),
      GlossLine('ごふん まって ください', 'gofun matte kudasai', {
        'id': 'Tolong tunggu lima menit.',
        'en': 'Please wait five minutes.',
      }),
      GlossLine('らいしゅう は いそがしい です', 'raishuu wa isogashii desu', {
        'id': 'Minggu depan saya sibuk.',
        'en': "I'm busy next week.",
      }),
      GlossLine('また あした', 'mata ashita', {
        'id': 'Sampai besok.',
        'en': 'See you tomorrow.',
      }),
    ],
  ),
  GlossCardData(
    id: 'n5_health',
    emoji: '🏥',
    level: 'N5',
    title: {'id': 'Badan & kesehatan', 'en': 'Body & health'},
    lines: [
      GlossLine('きょう は げんき が ありません', 'kyou wa genki ga arimasen', {
        'id': 'Hari ini saya tidak bersemangat.',
        'en': "I don't feel well today.",
      }),
      GlossLine('あたま が いたい です', 'atama ga itai desu', {
        'id': 'Kepala saya sakit.',
        'en': 'I have a headache.',
      }),
      GlossLine('のど も いたい です', 'nodo mo itai desu', {
        'id': 'Tenggorokan juga sakit.',
        'en': 'My throat hurts too.',
      }),
      GlossLine('ねつ が あります', 'netsu ga arimasu', {
        'id': 'Saya demam.',
        'en': 'I have a fever.',
      }),
      GlossLine(
        'かぜ を ひきました',
        'kaze o hikimashita',
        {'id': 'Saya masuk angin.', 'en': 'I caught a cold.'},
        extra: {
          'かぜ': {'id': 'flu; masuk angin', 'en': 'a cold'},
          'ひきました': {'id': 'terkena', 'en': 'caught'},
        },
      ),
      GlossLine('びょういん へ いきます', 'byouin e ikimasu', {
        'id': 'Saya pergi ke rumah sakit.',
        'en': 'I go to the hospital.',
      }),
      GlossLine('いしゃ に みて もらいます', 'isha ni mite moraimasu', {
        'id': 'Saya diperiksa dokter.',
        'en': 'I get examined by a doctor.',
      }),
      GlossLine('くすり を のみます', 'kusuri o nomimasu', {
        'id': 'Saya minum obat.',
        'en': 'I take medicine.',
      }),
      GlossLine('きょう は がっこう を やすみます', 'kyou wa gakkou o yasumimasu', {
        'id': 'Hari ini saya tidak masuk sekolah.',
        'en': "I'm staying home from school today.",
      }),
      GlossLine('たくさん ねて ください', 'takusan nete kudasai', {
        'id': 'Banyak-banyaklah tidur.',
        'en': 'Get plenty of sleep.',
      }),
      GlossLine('あした は げんき に なります', 'ashita wa genki ni narimasu', {
        'id': 'Besok pasti sudah sehat.',
        'en': "You'll be fine tomorrow.",
      }),
      GlossLine('おだいじに', 'odaijini', {
        'id': 'Semoga lekas sembuh.',
        'en': 'Get well soon.',
      }),
    ],
  ),
  GlossCardData(
    id: 'n5_weekend',
    emoji: '🎉',
    level: 'N5',
    title: {'id': 'Akhir pekan', 'en': 'The weekend'},
    lines: [
      GlossLine('にちようび は やすみ です', 'nichiyoubi wa yasumi desu', {
        'id': 'Hari Minggu libur.',
        'en': 'Sunday is a day off.',
      }),
      GlossLine('おそく おきました', 'osoku okimashita', {
        'id': 'Saya bangun siang.',
        'en': 'I got up late.',
      }),
      GlossLine('ともだち と こうえん へ いきました', 'tomodachi to kouen e ikimashita', {
        'id': 'Saya pergi ke taman dengan teman.',
        'en': 'I went to the park with a friend.',
      }),
      GlossLine('こうえん で しゃしん を とりました', 'kouen de shashin o torimashita', {
        'id': 'Saya memotret di taman.',
        'en': 'I took photos in the park.',
      }),
      GlossLine(
        'はな が きれい でした',
        'hana ga kirei deshita',
        {'id': 'Bunganya indah.', 'en': 'The flowers were beautiful.'},
        extra: {
          'はな': {'id': 'bunga', 'en': 'flower'},
        },
      ),
      GlossLine('きっさてん で コーヒー を のみました', 'kissaten de koohii o nomimashita', {
        'id': 'Saya minum kopi di kafe.',
        'en': 'I drank coffee at a café.',
      }),
      GlossLine('ゆうがた プール で およぎました', 'yuugata puuru de oyogimashita', {
        'id': 'Sore hari saya berenang di kolam.',
        'en': 'In the evening I swam in the pool.',
      }),
      GlossLine(
        'よる は ギター を ひきました',
        'yoru wa gitaa o hikimashita',
        {
          'id': 'Malamnya saya main gitar.',
          'en': 'At night I played the guitar.',
        },
        extra: {
          'ひきました': {
            'id': 'memainkan (alat musik)',
            'en': 'played (an instrument)',
          },
        },
      ),
      GlossLine('とても たのしかった です', 'totemo tanoshikatta desu', {
        'id': 'Sangat menyenangkan.',
        'en': 'It was a lot of fun.',
      }),
      GlossLine('でも すこし つかれました', 'demo sukoshi tsukaremashita', {
        'id': 'Tapi saya agak capek.',
        'en': 'But I got a little tired.',
      }),
      GlossLine('らいしゅう は うみ へ いきたい です', 'raishuu wa umi e ikitai desu', {
        'id': 'Minggu depan saya ingin ke laut.',
        'en': 'I want to go to the sea next week.',
      }),
      GlossLine('いっしょ に いきましょう', 'issho ni ikimashou', {
        'id': 'Ayo pergi bersama.',
        'en': "Let's go together.",
      }),
    ],
  ),
];
