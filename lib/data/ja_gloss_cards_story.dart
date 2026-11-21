// Kartu Kalimat Sehari-hari — cerita bersambung N5. Format & aturan: lihat
// ja_gloss_cards.dart (kana berspasi sejajar romaji, kosakata JLPT,
// `extra` untuk kata di luar JLPT / arti yang perlu dipaksa).
import 'ja_gloss_cards.dart';

const List<GlossCardData> kJaGlossCardsStory = [
  GlossCardData(
    id: 'story_tokyo',
    emoji: '✈️',
    level: 'N5',
    kind: GlossKind.story,
    title: {
      'id': 'Cerita 1: Hari pertama di Tokyo',
      'en': 'Story 1: First day in Tokyo',
    },
    lines: [
      GlossLine(
        '{name} は ひこうき で にほん へ きました',
        '{name} wa hikouki de nihon e kimashita',
        {
          'id': '{name} datang ke Jepang naik pesawat.',
          'en': '{name} came to Japan by plane.',
        },
      ),
      GlossLine('くうこう から でんしゃ に のりました', 'kuukou kara densha ni norimashita', {
        'id': 'Dari bandara, ia naik kereta.',
        'en': 'From the airport, they took a train.',
      }),
      GlossLine(
        'とうきょう は とても おおきい です',
        'toukyou wa totemo ookii desu',
        {'id': 'Tokyo sangat besar.', 'en': 'Tokyo is very big.'},
        extra: {
          'とうきょう': {'id': 'Tokyo', 'en': 'Tokyo'},
        },
      ),
      GlossLine('ホテル は えき の ちかく です', 'hoteru wa eki no chikaku desu', {
        'id': 'Hotelnya dekat stasiun.',
        'en': 'The hotel is near the station.',
      }),
      GlossLine('{name} は へや で やすみました', '{name} wa heya de yasumimashita', {
        'id': '{name} beristirahat di kamar.',
        'en': '{name} rested in the room.',
      }),
      GlossLine(
        'へや は せまい けど きれい です',
        'heya wa semai kedo kirei desu',
        {
          'id': 'Kamarnya sempit, tapi bersih.',
          'en': 'The room is small, but clean.',
        },
        extra: {
          'きれい': {'id': 'bersih', 'en': 'clean'},
        },
      ),
      GlossLine(
        'よる おなか が すきました',
        'yoru onaka ga sukimashita',
        {'id': 'Malamnya ia lapar.', 'en': 'In the evening, they got hungry.'},
        extra: {
          'すきました': {
            'id': '(perut) jadi kosong / lapar',
            'en': 'became empty (hungry)',
          },
        },
      ),
      GlossLine('ちかく の みせ へ いきました', 'chikaku no mise e ikimashita', {
        'id': 'Ia pergi ke toko terdekat.',
        'en': 'They went to a nearby shop.',
      }),
      GlossLine(
        '{name} は ラーメン を たべました',
        '{name} wa raamen o tabemashita',
        {'id': '{name} makan ramen.', 'en': '{name} ate ramen.'},
        extra: {
          'ラーメン': {'id': 'ramen', 'en': 'ramen'},
        },
      ),
      GlossLine('とても おいしかった です', 'totemo oishikatta desu', {
        'id': 'Enak sekali.',
        'en': 'It was very tasty.',
      }),
      GlossLine(
        '{name} は かぞく に でんわ しました',
        '{name} wa kazoku ni denwa shimashita',
        {
          'id': '{name} menelepon keluarga.',
          'en': '{name} called their family.',
        },
      ),
      GlossLine('つかれた ので はやく ねました', 'tsukareta node hayaku nemashita', {
        'id': 'Karena lelah, ia tidur cepat.',
        'en': 'Being tired, they went to bed early.',
      }),
    ],
  ),
  GlossCardData(
    id: 'story_school',
    emoji: '🏫',
    level: 'N5',
    kind: GlossKind.story,
    title: {
      'id': 'Cerita 2: Hari pertama sekolah bahasa',
      'en': 'Story 2: First day at language school',
    },
    lines: [
      GlossLine(
        'けさ {name} は しちじ に おきました',
        'kesa {name} wa shichiji ni okimashita',
        {
          'id': 'Pagi ini {name} bangun jam tujuh.',
          'en': 'This morning {name} got up at seven.',
        },
      ),
      GlossLine('あるいて がっこう へ いきました', 'aruite gakkou e ikimashita', {
        'id': 'Ia pergi ke sekolah jalan kaki.',
        'en': 'They walked to school.',
      }),
      GlossLine('きょう から にほんご の がっこう です', 'kyou kara nihongo no gakkou desu', {
        'id': 'Mulai hari ini sekolah bahasa Jepang.',
        'en': 'Japanese school starts today.',
      }),
      GlossLine('クラス に がくせい が じゅうにん います', 'kurasu ni gakusei ga juunin imasu', {
        'id': 'Di kelas ada sepuluh murid.',
        'en': 'There are ten students in the class.',
      }),
      GlossLine(
        'マリ さん は タイ から きました',
        'mari san wa tai kara kimashita',
        {'id': 'Mari datang dari Thailand.', 'en': 'Mari came from Thailand.'},
        extra: {
          'マリ': {'id': 'Mari (nama)', 'en': 'Mari (name)'},
          'さん': {'id': '(sapaan hormat)', 'en': '(honorific)'},
          'タイ': {'id': 'Thailand', 'en': 'Thailand'},
        },
      ),
      GlossLine('ふたり は ともだち に なりました', 'futari wa tomodachi ni narimashita', {
        'id': 'Mereka berdua menjadi teman.',
        'en': 'The two became friends.',
      }),
      GlossLine(
        'せんせい は やさしい ひと です',
        'sensei wa yasashii hito desu',
        {
          'id': 'Gurunya orang yang baik hati.',
          'en': 'The teacher is a kind person.',
        },
        extra: {
          'やさしい': {'id': 'baik hati', 'en': 'kind'},
        },
      ),
      GlossLine('きょう は ひらがな を ならいました', 'kyou wa hiragana o naraimashita', {
        'id': 'Hari ini mereka belajar hiragana.',
        'en': 'Today they learned hiragana.',
      }),
      GlossLine(
        'じゅぎょう は すこし むずかしかった です',
        'jugyou wa sukoshi muzukashikatta desu',
        {
          'id': 'Pelajarannya agak sulit.',
          'en': 'The lesson was a little difficult.',
        },
      ),
      GlossLine('ひる は いっしょ に たべました', 'hiru wa issho ni tabemashita', {
        'id': 'Siangnya mereka makan bersama.',
        'en': 'At noon they ate together.',
      }),
      GlossLine('しゅくだい が たくさん あります', 'shukudai ga takusan arimasu', {
        'id': 'Ada banyak PR.',
        'en': 'There is a lot of homework.',
      }),
      GlossLine(
        '{name} は よる しゅくだい を しました',
        '{name} wa yoru shukudai o shimashita',
        {
          'id': '{name} mengerjakan PR malam hari.',
          'en': '{name} did the homework at night.',
        },
      ),
    ],
  ),
  GlossCardData(
    id: 'story_shopping',
    emoji: '🛍️',
    level: 'N5',
    kind: GlossKind.story,
    title: {
      'id': 'Cerita 3: Belanja di Akihabara',
      'en': 'Story 3: Shopping in Akihabara',
    },
    lines: [
      GlossLine(
        'どようび {name} は あきはばら へ いきました',
        'doyoubi {name} wa akihabara e ikimashita',
        {
          'id': 'Hari Sabtu {name} pergi ke Akihabara.',
          'en': 'On Saturday {name} went to Akihabara.',
        },
        extra: {
          'あきはばら': {'id': 'Akihabara', 'en': 'Akihabara'},
        },
      ),
      GlossLine(
        'あきはばら は にぎやか な まち です',
        'akihabara wa nigiyaka na machi desu',
        {
          'id': 'Akihabara kota yang ramai.',
          'en': 'Akihabara is a lively town.',
        },
        extra: {
          'あきはばら': {'id': 'Akihabara', 'en': 'Akihabara'},
        },
      ),
      GlossLine('カメラ の みせ を さがしました', 'kamera no mise o sagashimashita', {
        'id': 'Ia mencari toko kamera.',
        'en': 'They looked for a camera shop.',
      }),
      GlossLine(
        'でも みち が わかりませんでした',
        'demo michi ga wakarimasendeshita',
        {
          'id': 'Tapi ia tidak tahu jalannya.',
          'en': "But they didn't know the way.",
        },
        extra: {
          'わかりませんでした': {'id': 'tidak tahu', 'en': "didn't know"},
        },
      ),
      GlossLine(
        '{name} は おまわりさん に ききました',
        '{name} wa omawarisan ni kikimashita',
        {
          'id': '{name} bertanya kepada polisi.',
          'en': '{name} asked a police officer.',
        },
        extra: {
          'ききました': {'id': 'bertanya', 'en': 'asked'},
        },
      ),
      GlossLine('まっすぐ いって ください', 'massugu itte kudasai', {
        'id': 'Silakan jalan lurus.',
        'en': 'Please go straight.',
      }),
      GlossLine('みせ は ぎんこう の となり でした', 'mise wa ginkou no tonari deshita', {
        'id': 'Tokonya di sebelah bank.',
        'en': 'The shop was next to the bank.',
      }),
      GlossLine(
        'あたらしい カメラ は たかかった です',
        'atarashii kamera wa takakatta desu',
        {'id': 'Kamera barunya mahal.', 'en': 'The new camera was expensive.'},
        extra: {
          'たかかった': {'id': 'mahal', 'en': 'expensive'},
        },
      ),
      GlossLine(
        '{name} は ちいさい カメラ を かいました',
        '{name} wa chiisai kamera o kaimashita',
        {
          'id': '{name} membeli kamera kecil.',
          'en': '{name} bought a small camera.',
        },
      ),
      GlossLine('それから スーパー へ いきました', 'sorekara suupaa e ikimashita', {
        'id': 'Lalu ia pergi ke supermarket.',
        'en': 'Then they went to the supermarket.',
      }),
      GlossLine('くだもの と ぎゅうにゅう を かいました', 'kudamono to gyuunyuu o kaimashita', {
        'id': 'Ia membeli buah dan susu.',
        'en': 'They bought fruit and milk.',
      }),
      GlossLine(
        'ぜんぶ で さんぜんえん でした',
        'zenbu de sanzen\'en deshita',
        {'id': 'Semuanya tiga ribu yen.', 'en': 'It was 3,000 yen in total.'},
        extra: {
          'さんぜんえん': {'id': '3.000 yen', 'en': '3,000 yen'},
        },
      ),
    ],
  ),
  GlossCardData(
    id: 'story_fuji',
    emoji: '🗻',
    level: 'N5',
    kind: GlossKind.story,
    title: {
      'id': 'Cerita 4: Akhir pekan ke Gunung Fuji',
      'en': 'Story 4: A weekend at Mount Fuji',
    },
    lines: [
      GlossLine(
        'にちようび {name} は ともだち と でかけました',
        'nichiyoubi {name} wa tomodachi to dekakemashita',
        {
          'id': 'Hari Minggu {name} pergi bersama teman.',
          'en': 'On Sunday {name} went out with a friend.',
        },
      ),
      GlossLine(
        'マリ さん と ふじさん へ いきました',
        'mari san to fujisan e ikimashita',
        {
          'id': 'Ia pergi ke Gunung Fuji bersama Mari.',
          'en': 'They went to Mount Fuji with Mari.',
        },
        extra: {
          'マリ': {'id': 'Mari (nama)', 'en': 'Mari (name)'},
          'さん': {'id': '(sapaan hormat)', 'en': '(honorific)'},
          'ふじさん': {'id': 'Gunung Fuji', 'en': 'Mount Fuji'},
        },
      ),
      GlossLine('あさ はやく でんしゃ に のりました', 'asa hayaku densha ni norimashita', {
        'id': 'Pagi-pagi mereka naik kereta.',
        'en': 'They took the train early in the morning.',
      }),
      GlossLine('でんしゃ で おかし を たべました', 'densha de okashi o tabemashita', {
        'id': 'Di kereta mereka makan kue.',
        'en': 'They ate snacks on the train.',
      }),
      GlossLine(
        'ふじさん は とても たかい やま です',
        'fujisan wa totemo takai yama desu',
        {
          'id': 'Gunung Fuji gunung yang sangat tinggi.',
          'en': 'Mount Fuji is a very tall mountain.',
        },
        extra: {
          'ふじさん': {'id': 'Gunung Fuji', 'en': 'Mount Fuji'},
          'たかい': {'id': 'tinggi', 'en': 'tall'},
        },
      ),
      GlossLine('やま に ゆき が ありました', 'yama ni yuki ga arimashita', {
        'id': 'Di gunung ada salju.',
        'en': 'There was snow on the mountain.',
      }),
      GlossLine(
        '{name} は しゃしん を たくさん とりました',
        '{name} wa shashin o takusan torimashita',
        {
          'id': '{name} mengambil banyak foto.',
          'en': '{name} took a lot of photos.',
        },
      ),
      GlossLine(
        'ひる は そば を たべました',
        'hiru wa soba o tabemashita',
        {'id': 'Siangnya mereka makan soba.', 'en': 'At lunch they ate soba.'},
        extra: {
          'そば': {'id': 'soba (mi)', 'en': 'soba (noodles)'},
        },
      ),
      GlossLine('ふたり は たくさん あるきました', 'futari wa takusan arukimashita', {
        'id': 'Mereka berdua banyak berjalan.',
        'en': 'The two walked a lot.',
      }),
      GlossLine('かえる とき でんしゃ で ねました', 'kaeru toki densha de nemashita', {
        'id': 'Saat pulang mereka tidur di kereta.',
        'en': 'On the way home they slept on the train.',
      }),
      GlossLine('つかれた けど たのしかった です', 'tsukareta kedo tanoshikatta desu', {
        'id': 'Lelah, tapi menyenangkan.',
        'en': 'They were tired, but it was fun.',
      }),
      GlossLine('{name} は また いきたい です', '{name} wa mata ikitai desu', {
        'id': '{name} ingin pergi lagi.',
        'en': '{name} wants to go again.',
      }),
    ],
  ),
];
