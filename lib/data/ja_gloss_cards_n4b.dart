// Kartu Kalimat Sehari-hari — situasi N4 (bagian 2). Format & aturan: lihat
// ja_gloss_cards.dart (kana berspasi sejajar romaji, kosakata JLPT,
// `extra` untuk kata di luar JLPT / arti yang perlu dipaksa).
import 'ja_gloss_cards.dart';

const List<GlossCardData> kJaGlossCardsN4b = [
  GlossCardData(
    id: 'n4b_matsuri',
    emoji: '🎌',
    level: 'N4',
    kind: GlossKind.situation,
    title: {'id': 'Festival Jepang', 'en': 'Japanese festival'},
    lines: [
      GlossLine(
        'こんばん じんじゃ で まつり が あります',
        'konban jinja de matsuri ga arimasu',
        {
          'id': 'Malam ini ada festival di kuil.',
          'en': 'There is a festival at the shrine tonight.',
        },
        extra: {
          'まつり': {'id': 'festival', 'en': 'festival'},
        },
      ),
      GlossLine(
        'ゆかた を きて いきたい です',
        'yukata o kite ikitai desu',
        {
          'id': 'Saya ingin pergi memakai yukata.',
          'en': 'I want to go wearing a yukata.',
        },
        extra: {
          'ゆかた': {'id': 'yukata (kimono musim panas)', 'en': 'yukata'},
          'きて': {'id': 'memakai (baju)', 'en': 'wearing'},
        },
      ),
      GlossLine(
        'ゆかた を きた こと が ありません',
        'yukata o kita koto ga arimasen',
        {
          'id': 'Saya belum pernah memakai yukata.',
          'en': 'I have never worn a yukata.',
        },
        extra: {
          'ゆかた': {'id': 'yukata (kimono musim panas)', 'en': 'yukata'},
          'きた': {'id': 'sudah memakai (baju)', 'en': 'wore'},
          'ありません': {'id': 'tidak ada (belum pernah)', 'en': 'have not'},
        },
      ),
      GlossLine('ともだち と いく つもり です', 'tomodachi to iku tsumori desu', {
        'id': 'Saya berencana pergi bersama teman.',
        'en': 'I plan to go with a friend.',
      }),
      GlossLine(
        'はなび は しちじ から です',
        'hanabi wa shichiji kara desu',
        {
          'id': 'Kembang api mulai jam tujuh.',
          'en': 'The fireworks start at seven.',
        },
        extra: {
          'はなび': {'id': 'kembang api', 'en': 'fireworks'},
        },
      ),
      GlossLine(
        'ひと が おおい ので はやく いきましょう',
        'hito ga ooi node hayaku ikimashou',
        {
          'id': 'Karena ramai orang, ayo berangkat lebih awal.',
          'en': "There are many people, so let's go early.",
        },
        extra: {
          'はやく': {'id': 'lebih awal', 'en': 'early'},
        },
      ),
      GlossLine(
        'やたい で たこやき を かいます',
        'yatai de takoyaki o kaimasu',
        {
          'id': 'Saya membeli takoyaki di kios.',
          'en': 'I buy takoyaki at a stall.',
        },
        extra: {
          'やたい': {'id': 'kios (warung tenda)', 'en': 'food stall'},
          'たこやき': {'id': 'takoyaki', 'en': 'takoyaki'},
        },
      ),
      GlossLine(
        'おどったり たべたり しました',
        'odottari tabetari shimashita',
        {
          'id': 'Kami menari, makan, dan sebagainya.',
          'en': 'We danced, ate, and so on.',
        },
        extra: {
          'おどったり': {'id': 'menari, dll.', 'en': 'dancing, etc.'},
          'たべたり': {'id': 'makan, dll.', 'en': 'eating, etc.'},
        },
      ),
      GlossLine(
        'はなび が とても きれい でした',
        'hanabi ga totemo kirei deshita',
        {
          'id': 'Kembang apinya sangat indah.',
          'en': 'The fireworks were very beautiful.',
        },
        extra: {
          'はなび': {'id': 'kembang api', 'en': 'fireworks'},
        },
      ),
      GlossLine(
        'ここ で しゃしん を とっても いい です か',
        'koko de shashin o tottemo ii desu ka',
        {
          'id': 'Bolehkah saya memotret di sini?',
          'en': 'May I take photos here?',
        },
        extra: {
          'とっても': {'id': 'boleh mengambil (foto)', 'en': 'may take (photos)'},
          'いい': {'id': 'baik (boleh)', 'en': 'fine (okay)'},
        },
      ),
      GlossLine(
        'ごみ を すてて は いけません',
        'gomi o sutete wa ikemasen',
        {
          'id': 'Tidak boleh membuang sampah.',
          'en': 'You must not throw away trash.',
        },
        extra: {
          'いけません': {'id': 'tidak boleh', 'en': 'must not'},
        },
      ),
      GlossLine(
        'らいねん も きたい と おもいます',
        'rainen mo kitai to omoimasu',
        {
          'id': 'Saya rasa saya ingin datang lagi tahun depan.',
          'en': 'I think I want to come again next year.',
        },
        extra: {
          'おもいます': {'id': 'berpikir (rasa)', 'en': 'think'},
        },
      ),
    ],
  ),
  GlossCardData(
    id: 'n4b_accident',
    emoji: '🏥',
    level: 'N4',
    kind: GlossKind.situation,
    title: {
      'id': 'Kecelakaan kecil & minta tolong',
      'en': 'A small accident & asking for help',
    },
    lines: [
      GlossLine('じてんしゃ から おちました', 'jitensha kara ochimashita', {
        'id': 'Saya jatuh dari sepeda.',
        'en': 'I fell off my bicycle.',
      }),
      GlossLine('あし が とても いたい です', 'ashi ga totemo itai desu', {
        'id': 'Kaki saya sangat sakit.',
        'en': 'My leg hurts a lot.',
      }),
      GlossLine('すみません てつだって ください', 'sumimasen tetsudatte kudasai', {
        'id': 'Permisi, tolong bantu saya.',
        'en': 'Excuse me, please help me.',
      }),
      GlossLine('だいじょうぶ です か', 'daijoubu desu ka', {
        'id': 'Anda tidak apa-apa?',
        'en': 'Are you all right?',
      }),
      GlossLine(
        'きゅうきゅうしゃ を よびましょう か',
        'kyuukyuusha o yobimashou ka',
        {
          'id': 'Perlu saya panggilkan ambulans?',
          'en': 'Shall I call an ambulance?',
        },
        extra: {
          'きゅうきゅうしゃ': {'id': 'ambulans', 'en': 'ambulance'},
        },
      ),
      GlossLine(
        'いいえ あるく こと が できます',
        'iie aruku koto ga dekimasu',
        {'id': 'Tidak, saya bisa berjalan.', 'en': 'No, I can walk.'},
        extra: {
          'できます': {'id': 'bisa', 'en': 'can'},
        },
      ),
      GlossLine('ちかく に びょういん が あります', 'chikaku ni byouin ga arimasu', {
        'id': 'Ada rumah sakit di dekat sini.',
        'en': 'There is a hospital nearby.',
      }),
      GlossLine(
        'いしゃ に みて もらいました',
        'isha ni mite moraimashita',
        {
          'id': 'Saya diperiksa oleh dokter.',
          'en': 'I had a doctor examine me.',
        },
        extra: {
          'みて': {'id': 'memeriksa', 'en': 'examine'},
          'もらいました': {
            'id': 'menerima (jasa) — diperiksa',
            'en': 'had (it done)',
          },
        },
      ),
      GlossLine(
        'ほね は だいじょうぶ でした',
        'hone wa daijoubu deshita',
        {'id': 'Tulangnya tidak apa-apa.', 'en': 'The bone was fine.'},
        extra: {
          'ほね': {'id': 'tulang', 'en': 'bone'},
        },
      ),
      GlossLine(
        'くすり を のんだ ほう が いい です',
        'kusuri o nonda hou ga ii desu',
        {'id': 'Sebaiknya minum obat.', 'en': 'You should take medicine.'},
        extra: {
          'ほう': {'id': '(lebih baik) sebaiknya', 'en': 'had better'},
        },
      ),
      GlossLine(
        'しばらく うんどう して は いけません',
        'shibaraku undou shite wa ikemasen',
        {
          'id': 'Untuk sementara tidak boleh berolahraga.',
          'en': 'You must not exercise for a while.',
        },
        extra: {
          'いけません': {'id': 'tidak boleh', 'en': 'must not'},
        },
      ),
      GlossLine(
        'たすけて くれて ありがとう ございました',
        'tasukete kurete arigatou gozaimashita',
        {
          'id': 'Terima kasih sudah menolong saya.',
          'en': 'Thank you for helping me.',
        },
        extra: {
          'たすけて': {'id': 'menolong', 'en': 'helping'},
          'くれて': {'id': '(untuk saya)', 'en': 'for me'},
          'ございました': {'id': '(sopan, lampau)', 'en': '(polite, past)'},
        },
      ),
    ],
  ),
  GlossCardData(
    id: 'n4b_cooking',
    emoji: '🍱',
    level: 'N4',
    kind: GlossKind.situation,
    title: {'id': 'Memasak bersama', 'en': 'Cooking together'},
    lines: [
      GlossLine('きょう は みんな で りょうり を します', 'kyou wa minna de ryouri o shimasu', {
        'id': 'Hari ini kita memasak bersama-sama.',
        'en': 'Today we cook together.',
      }),
      GlossLine(
        'まず レシピ を よみましょう',
        'mazu reshipi o yomimashou',
        {
          'id': 'Pertama, ayo baca resepnya.',
          'en': "First, let's read the recipe.",
        },
        extra: {
          'レシピ': {'id': 'resep', 'en': 'recipe'},
        },
      ),
      GlossLine('やさい を あらって ください', 'yasai o aratte kudasai', {
        'id': 'Tolong cuci sayurannya.',
        'en': 'Please wash the vegetables.',
      }),
      GlossLine(
        'にんじん を ちいさく きります',
        'ninjin o chiisaku kirimasu',
        {
          'id': 'Wortelnya dipotong kecil-kecil.',
          'en': 'Cut the carrots into small pieces.',
        },
        extra: {
          'にんじん': {'id': 'wortel', 'en': 'carrot'},
          'きります': {'id': 'memotong', 'en': 'cut'},
        },
      ),
      GlossLine(
        'ほうちょう は あぶない です',
        'houchou wa abunai desu',
        {
          'id': 'Pisau dapur itu berbahaya.',
          'en': 'Kitchen knives are dangerous.',
        },
        extra: {
          'ほうちょう': {'id': 'pisau dapur', 'en': 'kitchen knife'},
        },
      ),
      GlossLine(
        'なべ に みず を いれます',
        'nabe ni mizu o iremasu',
        {'id': 'Masukkan air ke dalam panci.', 'en': 'Put water into the pot.'},
        extra: {
          'なべ': {'id': 'panci', 'en': 'pot'},
        },
      ),
      GlossLine(
        'じゅっぷん ぐらい にます',
        'juppun gurai nimasu',
        {
          'id': 'Rebus sekitar sepuluh menit.',
          'en': 'Boil for about ten minutes.',
        },
        extra: {
          'にます': {'id': 'merebus', 'en': 'boil'},
        },
      ),
      GlossLine(
        'しお を いれても いい です か',
        'shio o iretemo ii desu ka',
        {'id': 'Bolehkah saya menambahkan garam?', 'en': 'May I add salt?'},
        extra: {
          'いれても': {'id': 'boleh memasukkan', 'en': 'may add'},
          'いい': {'id': 'baik (boleh)', 'en': 'fine (okay)'},
        },
      ),
      GlossLine(
        'ちょっと あじ を みて ください',
        'chotto aji o mite kudasai',
        {
          'id': 'Tolong cicipi rasanya sebentar.',
          'en': 'Please taste it a little.',
        },
        extra: {
          'みて': {'id': 'mencicipi', 'en': 'taste'},
        },
      ),
      GlossLine(
        'かんたん なのに おいしい です',
        'kantan nanoni oishii desu',
        {
          'id': 'Walaupun mudah, rasanya enak.',
          'en': "It's easy, yet delicious.",
        },
        extra: {
          'なのに': {'id': 'walaupun', 'en': 'even though'},
        },
      ),
      GlossLine('おさら を ならべましょう', 'osara o narabemashou', {
        'id': 'Ayo tata piring-piringnya.',
        'en': "Let's set out the plates.",
      }),
      GlossLine(
        'では いただきます',
        'dewa itadakimasu',
        {'id': 'Baiklah, selamat makan.', 'en': "Well then, let's eat."},
        extra: {
          'では': {'id': 'baiklah', 'en': 'well then'},
        },
      ),
    ],
  ),
  GlossCardData(
    id: 'n4b_driving',
    emoji: '🚗',
    level: 'N4',
    kind: GlossKind.situation,
    title: {'id': 'Kursus mengemudi', 'en': 'Driving school'},
    lines: [
      GlossLine(
        'うんてん を ならう つもり です',
        'unten o narau tsumori desu',
        {
          'id': 'Saya berencana belajar menyetir.',
          'en': 'I plan to learn to drive.',
        },
        extra: {
          'うんてん': {'id': 'menyetir', 'en': 'driving'},
        },
      ),
      GlossLine(
        'くるま を うんてん した こと が ありません',
        'kuruma o unten shita koto ga arimasen',
        {
          'id': 'Saya belum pernah menyetir mobil.',
          'en': 'I have never driven a car.',
        },
        extra: {
          'うんてん': {'id': 'menyetir', 'en': 'driving'},
          'ありません': {'id': 'tidak ada (belum pernah)', 'en': 'have not'},
        },
      ),
      GlossLine('せんせい は とても きびしい です', 'sensei wa totemo kibishii desu', {
        'id': 'Gurunya sangat tegas.',
        'en': 'The instructor is very strict.',
      }),
      GlossLine(
        'シートベルト を しなければ なりません',
        'shiitoberuto o shinakereba narimasen',
        {
          'id': 'Harus memakai sabuk pengaman.',
          'en': 'You must wear a seatbelt.',
        },
        extra: {
          'シートベルト': {'id': 'sabuk pengaman', 'en': 'seatbelt'},
          'しなければ': {'id': 'kalau tidak memakai', 'en': 'if (you) do not wear'},
          'なりません': {'id': 'tidak bisa (harus)', 'en': 'must'},
        },
      ),
      GlossLine(
        'しんごう を よく みて ください',
        'shingou o yoku mite kudasai',
        {
          'id': 'Tolong perhatikan lampu lalu lintas baik-baik.',
          'en': 'Please watch the traffic lights carefully.',
        },
        extra: {
          'よく': {'id': 'baik-baik', 'en': 'carefully'},
        },
      ),
      GlossLine(
        'あか の とき は とまらなければ なりません',
        'aka no toki wa tomaranakereba narimasen',
        {
          'id': 'Saat merah, harus berhenti.',
          'en': 'When it is red, you must stop.',
        },
        extra: {
          'とまらなければ': {
            'id': 'kalau tidak berhenti',
            'en': 'if (you) do not stop',
          },
          'なりません': {'id': 'tidak bisa (harus)', 'en': 'must'},
        },
      ),
      GlossLine(
        'ここ に とめて は いけません',
        'koko ni tomete wa ikemasen',
        {'id': 'Tidak boleh parkir di sini.', 'en': 'You must not park here.'},
        extra: {
          'とめて': {'id': 'memarkir', 'en': 'parking'},
          'いけません': {'id': 'tidak boleh', 'en': 'must not'},
        },
      ),
      GlossLine(
        'ゆっくり はしった ほう が いい です',
        'yukkuri hashitta hou ga ii desu',
        {
          'id': 'Sebaiknya melaju pelan-pelan.',
          'en': 'You should drive slowly.',
        },
        extra: {
          'はしった': {'id': 'melaju', 'en': 'drove'},
          'ほう': {'id': '(lebih baik) sebaiknya', 'en': 'had better'},
        },
      ),
      GlossLine('きょう は みち を まちがえました', 'kyou wa michi o machigaemashita', {
        'id': 'Hari ini saya salah jalan.',
        'en': 'Today I took the wrong road.',
      }),
      GlossLine('でも だんだん じょうず に なりました', 'demo dandan jouzu ni narimashita', {
        'id': 'Tapi lama-lama saya jadi mahir.',
        'en': 'But I gradually got better.',
      }),
      GlossLine(
        'らいげつ しけん を うける つもり です',
        'raigetsu shiken o ukeru tsumori desu',
        {
          'id': 'Saya berencana ikut ujian bulan depan.',
          'en': 'I plan to take the test next month.',
        },
        extra: {
          'うける': {'id': 'mengikuti (ujian)', 'en': 'take (an exam)'},
        },
      ),
      GlossLine(
        'ごうかく できる と おもいます',
        'goukaku dekiru to omoimasu',
        {'id': 'Saya rasa saya bisa lulus.', 'en': 'I think I can pass.'},
        extra: {
          'ごうかく': {'id': 'lulus (ujian)', 'en': 'passing (an exam)'},
          'できる': {'id': 'bisa', 'en': 'can'},
          'おもいます': {'id': 'berpikir (rasa)', 'en': 'think'},
        },
      ),
    ],
  ),
  GlossCardData(
    id: 'n4b_hanami',
    emoji: '🌸',
    level: 'N4',
    kind: GlossKind.situation,
    title: {'id': 'Hanami & musim semi', 'en': 'Hanami & spring'},
    lines: [
      GlossLine('はる に なりました', 'haru ni narimashita', {
        'id': 'Musim semi telah tiba.',
        'en': 'Spring has come.',
      }),
      GlossLine(
        'さくら が さいて います',
        'sakura ga saite imasu',
        {
          'id': 'Bunga sakura sedang mekar.',
          'en': 'The cherry blossoms are blooming.',
        },
        extra: {
          'さくら': {'id': 'bunga sakura', 'en': 'cherry blossoms'},
          'さいて': {'id': 'mekar', 'en': 'blooming'},
        },
      ),
      GlossLine('こうえん で はなみ を しましょう', 'kouen de hanami o shimashou', {
        'id': 'Ayo hanami di taman.',
        'en': "Let's go cherry-blossom viewing in the park.",
      }),
      GlossLine(
        'あさ はやく ばしょ を とります',
        'asa hayaku basho o torimasu',
        {
          'id': 'Pagi-pagi kami mengambil tempat.',
          'en': 'We save a spot early in the morning.',
        },
        extra: {
          'はやく': {'id': 'awal (pagi-pagi)', 'en': 'early'},
        },
      ),
      GlossLine('おべんとう を つくって いきます', 'obentou o tsukutte ikimasu', {
        'id': 'Saya membuat bekal lalu berangkat.',
        'en': 'I make a boxed lunch and go.',
      }),
      GlossLine(
        'さくら の はな が きれい です ね',
        'sakura no hana ga kirei desu ne',
        {
          'id': 'Bunga sakuranya indah, ya.',
          'en': 'The cherry blossoms are beautiful, aren\'t they?',
        },
        extra: {
          'さくら': {'id': 'sakura', 'en': 'cherry'},
          'はな': {'id': 'bunga', 'en': 'flower'},
        },
      ),
      GlossLine(
        'みんな で たべたり のんだり しました',
        'minna de tabetari nondari shimashita',
        {
          'id': 'Kami semua makan, minum, dan sebagainya.',
          'en': 'We all ate, drank, and so on.',
        },
        extra: {
          'たべたり': {'id': 'makan, dll.', 'en': 'eating, etc.'},
          'のんだり': {'id': 'minum, dll.', 'en': 'drinking, etc.'},
        },
      ),
      GlossLine('でも かぜ が すこし つめたい です', 'demo kaze ga sukoshi tsumetai desu', {
        'id': 'Tapi anginnya agak dingin.',
        'en': 'But the wind is a little cold.',
      }),
      GlossLine(
        'うわぎ を きた ほう が いい です',
        'uwagi o kita hou ga ii desu',
        {'id': 'Sebaiknya memakai jaket.', 'en': 'You should wear a jacket.'},
        extra: {
          'きた': {'id': 'memakai (baju)', 'en': 'wore'},
          'ほう': {'id': '(lebih baik) sebaiknya', 'en': 'had better'},
        },
      ),
      GlossLine('はる は あたたかい ので すき です', 'haru wa atatakai node suki desu', {
        'id': 'Saya suka musim semi karena hangat.',
        'en': 'I like spring because it is warm.',
      }),
      GlossLine(
        'さくら は すぐ ちります',
        'sakura wa sugu chirimasu',
        {
          'id': 'Bunga sakura cepat berguguran.',
          'en': 'Cherry blossoms fall quickly.',
        },
        extra: {
          'さくら': {'id': 'bunga sakura', 'en': 'cherry blossoms'},
          'ちります': {'id': 'berguguran', 'en': 'fall (scatter)'},
        },
      ),
      GlossLine('らいねん も みんな で きましょう', 'rainen mo minna de kimashou', {
        'id': 'Tahun depan ayo datang bersama lagi.',
        'en': "Let's all come again next year.",
      }),
    ],
  ),
  GlossCardData(
    id: 'n4b_jlpt',
    emoji: '🎓',
    level: 'N4',
    kind: GlossKind.situation,
    title: {'id': 'Persiapan ujian JLPT', 'en': 'Preparing for the JLPT'},
    lines: [
      GlossLine('じゅうにがつ に しけん が あります', 'juunigatsu ni shiken ga arimasu', {
        'id': 'Bulan Desember ada ujian.',
        'en': 'There is an exam in December.',
      }),
      GlossLine(
        'エヌよん を うける つもり です',
        'enuyon o ukeru tsumori desu',
        {'id': 'Saya berencana ikut ujian N4.', 'en': 'I plan to take the N4.'},
        extra: {
          'エヌよん': {'id': 'N4 (JLPT)', 'en': 'N4 (JLPT)'},
          'うける': {'id': 'mengikuti (ujian)', 'en': 'take (an exam)'},
        },
      ),
      GlossLine(
        'まいにち べんきょう しなければ なりません',
        'mainichi benkyou shinakereba narimasen',
        {
          'id': 'Saya harus belajar setiap hari.',
          'en': 'I have to study every day.',
        },
        extra: {
          'しなければ': {'id': 'kalau tidak melakukan', 'en': 'if (I) do not do'},
          'なりません': {'id': 'tidak bisa (harus)', 'en': 'must'},
        },
      ),
      GlossLine('かんじ を ひゃく おぼえました', 'kanji o hyaku oboemashita', {
        'id': 'Saya sudah menghafal seratus kanji.',
        'en': 'I have memorized a hundred kanji.',
      }),
      GlossLine(
        'ちょうかい が いちばん むずかしい です',
        'choukai ga ichiban muzukashii desu',
        {
          'id': 'Bagian menyimak paling sulit.',
          'en': 'Listening is the hardest part.',
        },
        extra: {
          'ちょうかい': {'id': 'menyimak (choukai)', 'en': 'listening'},
        },
      ),
      GlossLine('ひま な とき ドラマ を みます', 'hima na toki dorama o mimasu', {
        'id': 'Saat senggang saya menonton drama.',
        'en': 'In my free time I watch dramas.',
      }),
      GlossLine(
        'ふるい しけん を にかい やりました',
        'furui shiken o nikai yarimashita',
        {
          'id': 'Saya sudah mengerjakan soal ujian lama dua kali.',
          'en': 'I did past exams twice.',
        },
        extra: {
          'にかい': {'id': '2 kali', 'en': 'twice'},
          'やりました': {'id': 'sudah mengerjakan', 'en': 'did'},
        },
      ),
      GlossLine(
        'おそく まで おきて は いけません',
        'osoku made okite wa ikemasen',
        {
          'id': 'Tidak boleh begadang sampai larut.',
          'en': 'You must not stay up late.',
        },
        extra: {
          'おそく': {'id': 'larut (malam)', 'en': 'late'},
          'おきて': {'id': 'terjaga', 'en': 'staying up'},
          'いけません': {'id': 'tidak boleh', 'en': 'must not'},
        },
      ),
      GlossLine(
        'まえ の ひ は よく ねた ほう が いい です',
        'mae no hi wa yoku neta hou ga ii desu',
        {
          'id': 'Sehari sebelumnya sebaiknya tidur nyenyak.',
          'en': 'You should sleep well the day before.',
        },
        extra: {
          'まえ': {'id': 'sebelum', 'en': 'before'},
          'ひ': {'id': 'hari', 'en': 'day'},
          'よく': {'id': 'nyenyak', 'en': 'well'},
          'ねた': {'id': 'tidur', 'en': 'slept'},
          'ほう': {'id': '(lebih baik) sebaiknya', 'en': 'had better'},
        },
      ),
      GlossLine(
        'じゅけんひょう を わすれて は いけません',
        'jukenhyou o wasurete wa ikemasen',
        {
          'id': 'Tidak boleh lupa kartu ujian.',
          'en': "Don't forget your exam voucher.",
        },
        extra: {
          'じゅけんひょう': {'id': 'kartu ujian', 'en': 'exam voucher'},
          'いけません': {'id': 'tidak boleh', 'en': 'must not'},
        },
      ),
      GlossLine(
        'べんきょう した のに ふあん です',
        'benkyou shita noni fuan desu',
        {
          'id': 'Walaupun sudah belajar, saya cemas.',
          'en': "Even though I studied, I'm anxious.",
        },
        extra: {
          'した': {'id': 'sudah melakukan', 'en': 'did'},
        },
      ),
      GlossLine(
        'きっと ごうかく できる と おもいます',
        'kitto goukaku dekiru to omoimasu',
        {
          'id': 'Saya rasa pasti bisa lulus.',
          'en': 'I think I can surely pass.',
        },
        extra: {
          'ごうかく': {'id': 'lulus (ujian)', 'en': 'passing (an exam)'},
          'できる': {'id': 'bisa', 'en': 'can'},
          'おもいます': {'id': 'berpikir (rasa)', 'en': 'think'},
        },
      ),
    ],
  ),
];
