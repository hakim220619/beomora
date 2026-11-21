// Kartu Kalimat Sehari-hari — situasi N4 (bagian 1). Format & aturan: lihat
// ja_gloss_cards.dart (kana berspasi sejajar romaji, kosakata JLPT,
// `extra` untuk kata di luar JLPT / arti yang perlu dipaksa).
import 'ja_gloss_cards.dart';

const List<GlossCardData> kJaGlossCardsN4a = [
  GlossCardData(
    id: 'n4a_airport',
    emoji: '✈️',
    level: 'N4',
    kind: GlossKind.situation,
    title: {'id': 'Di bandara', 'en': 'At the airport'},
    lines: [
      GlossLine('くうこう に つきました', 'kuukou ni tsukimashita', {
        'id': 'Saya sudah tiba di bandara.',
        'en': 'I arrived at the airport.',
      }),
      GlossLine(
        'パスポート を みせて ください',
        'pasupooto o misete kudasai',
        {
          'id': 'Tolong perlihatkan paspor Anda.',
          'en': 'Please show your passport.',
        },
        extra: {
          'パスポート': {'id': 'paspor', 'en': 'passport'},
        },
      ),
      GlossLine('にもつ を あずけたい です', 'nimotsu o azuketai desu', {
        'id': 'Saya ingin menitipkan bagasi.',
        'en': 'I want to check in my luggage.',
      }),
      GlossLine(
        'この かばん は ちょっと おもい です',
        'kono kaban wa chotto omoi desu',
        {'id': 'Tas ini agak berat.', 'en': 'This bag is a bit heavy.'},
        extra: {
          'ちょっと': {'id': 'agak; sedikit', 'en': 'a little'},
        },
      ),
      GlossLine(
        'ナイフ を もって は いけません',
        'naifu o motte wa ikemasen',
        {
          'id': 'Tidak boleh membawa pisau.',
          'en': 'You must not carry a knife.',
        },
        extra: {
          'いけません': {
            'id': 'tidak boleh (～てはいけません)',
            'en': 'must not (～てはいけません)',
          },
        },
      ),
      GlossLine(
        'みず も すてなければ なりません',
        'mizu mo sutenakereba narimasen',
        {
          'id': 'Air juga harus dibuang.',
          'en': 'Water must be thrown away too.',
        },
        extra: {
          'すてなければ': {
            'id': 'kalau tidak membuang',
            'en': 'if (you) don\'t throw away',
          },
          'なりません': {'id': 'harus (～なければなりません)', 'en': 'must (～なければなりません)'},
        },
      ),
      GlossLine(
        'ここ に すわって も いい です か',
        'koko ni suwatte mo ii desu ka',
        {'id': 'Bolehkah saya duduk di sini?', 'en': 'May I sit here?'},
        extra: {
          'いい': {'id': 'boleh (～てもいい)', 'en': 'all right (～てもいい)'},
        },
      ),
      GlossLine(
        'ひこうき は さんじ に でます',
        'hikouki wa sanji ni demasu',
        {
          'id': 'Pesawatnya berangkat jam tiga.',
          'en': 'The plane departs at three.',
        },
        extra: {
          'でます': {'id': 'berangkat', 'en': 'departs'},
        },
      ),
      GlossLine(
        'まど の ちかく が いい です',
        'mado no chikaku ga ii desu',
        {
          'id': 'Saya mau (kursi) dekat jendela.',
          'en': "I'd like a seat near the window.",
        },
        extra: {
          'ちかく': {'id': 'dekat', 'en': 'near'},
        },
      ),
      GlossLine('がいこく へ いった こと が あります', 'gaikoku e itta koto ga arimasu', {
        'id': 'Saya pernah pergi ke luar negeri.',
        'en': 'I have been abroad before.',
      }),
      GlossLine('ひこうき で ずっと ねる つもり です', 'hikouki de zutto neru tsumori desu', {
        'id': 'Saya berencana tidur terus di pesawat.',
        'en': 'I plan to sleep the whole flight.',
      }),
      GlossLine('あした の あさ に つきます', 'ashita no asa ni tsukimasu', {
        'id': 'Saya tiba besok pagi.',
        'en': 'I arrive tomorrow morning.',
      }),
    ],
  ),
  GlossCardData(
    id: 'n4a_doctor',
    emoji: '🩺',
    level: 'N4',
    kind: GlossKind.situation,
    title: {'id': 'Ke dokter', 'en': 'Seeing a doctor'},
    lines: [
      GlossLine('きのう から ねつ が あります', 'kinou kara netsu ga arimasu', {
        'id': 'Saya demam sejak kemarin.',
        'en': "I've had a fever since yesterday.",
      }),
      GlossLine('びょういん へ いきました', 'byouin e ikimashita', {
        'id': 'Saya pergi ke rumah sakit.',
        'en': 'I went to the hospital.',
      }),
      GlossLine(
        'どう しました か',
        'dou shimashita ka',
        {'id': 'Ada apa? (Sakit apa?)', 'en': "What's the matter?"},
        extra: {
          'しました': {'id': 'terjadi', 'en': 'happened'},
        },
      ),
      GlossLine('のど と あたま が いたい です', 'nodo to atama ga itai desu', {
        'id': 'Tenggorokan dan kepala saya sakit.',
        'en': 'My throat and head hurt.',
      }),
      GlossLine(
        'かぜ です ね',
        'kaze desu ne',
        {'id': 'Ini flu, ya.', 'en': "It's a cold."},
        extra: {
          'かぜ': {'id': 'flu; pilek', 'en': 'a cold'},
        },
      ),
      GlossLine('この くすり を のんで ください', 'kono kusuri o nonde kudasai', {
        'id': 'Tolong minum obat ini.',
        'en': 'Please take this medicine.',
      }),
      GlossLine(
        'ごはん の あと に のんで ください',
        'gohan no ato ni nonde kudasai',
        {'id': 'Minumlah setelah makan.', 'en': 'Take it after meals.'},
        extra: {
          'ごはん': {'id': 'makan; nasi', 'en': 'meal'},
        },
      ),
      GlossLine(
        'ぜんぶ のまなければ なりません',
        'zenbu nomanakereba narimasen',
        {'id': 'Harus diminum sampai habis.', 'en': 'You must take all of it.'},
        extra: {
          'のまなければ': {'id': 'kalau tidak minum', 'en': "if (you) don't take"},
          'なりません': {'id': 'harus (～なければなりません)', 'en': 'must (～なければなりません)'},
        },
      ),
      GlossLine(
        'おさけ を のんで は いけません',
        'osake o nonde wa ikemasen',
        {
          'id': 'Tidak boleh minum alkohol.',
          'en': 'You must not drink alcohol.',
        },
        extra: {
          'おさけ': {'id': 'minuman keras', 'en': 'alcohol'},
          'いけません': {
            'id': 'tidak boleh (～てはいけません)',
            'en': 'must not (～てはいけません)',
          },
        },
      ),
      GlossLine(
        'さんぽ して も いい です か',
        'sanpo shite mo ii desu ka',
        {'id': 'Bolehkah saya jalan-jalan?', 'en': 'May I go for a walk?'},
        extra: {
          'いい': {'id': 'boleh (～てもいい)', 'en': 'all right (～てもいい)'},
        },
      ),
      GlossLine(
        'ゆっくり やすんだ ほう が いい です',
        'yukkuri yasunda hou ga ii desu',
        {
          'id': 'Sebaiknya istirahat yang cukup.',
          'en': 'You had better rest well.',
        },
        extra: {
          'ゆっくり': {'id': 'dengan tenang', 'en': 'well; leisurely'},
          'ほう': {'id': 'lebih baik (～ほうがいい)', 'en': 'better (～ほうがいい)'},
        },
      ),
      GlossLine('おだいじに して ください', 'odaijini shite kudasai', {
        'id': 'Semoga lekas sembuh.',
        'en': 'Please take care of yourself.',
      }),
    ],
  ),
  GlossCardData(
    id: 'n4a_parttime',
    emoji: '💼',
    level: 'N4',
    kind: GlossKind.situation,
    title: {'id': 'Kerja paruh waktu', 'en': 'Part-time job'},
    lines: [
      GlossLine('アルバイト を さがして います', 'arubaito o sagashite imasu', {
        'id': 'Saya sedang mencari kerja sambilan.',
        'en': "I'm looking for a part-time job.",
      }),
      GlossLine(
        'コンビニ で はたらきたい です',
        'konbini de hatarakitai desu',
        {
          'id': 'Saya ingin bekerja di minimarket.',
          'en': 'I want to work at a convenience store.',
        },
        extra: {
          'コンビニ': {'id': 'minimarket', 'en': 'convenience store'},
        },
      ),
      GlossLine(
        'しゅう に みっか はたらきます',
        'shuu ni mikka hatarakimasu',
        {
          'id': 'Saya bekerja tiga hari seminggu.',
          'en': 'I work three days a week.',
        },
        extra: {
          'みっか': {'id': 'tiga hari', 'en': 'three days'},
        },
      ),
      GlossLine(
        'じきゅう は せんえん です',
        'jikyuu wa senen desu',
        {
          'id': 'Upahnya 1000 yen per jam.',
          'en': 'The pay is 1000 yen an hour.',
        },
        extra: {
          'じきゅう': {'id': 'upah per jam', 'en': 'hourly wage'},
        },
      ),
      GlossLine('ゆうがた から よる まで です', 'yuugata kara yoru made desu', {
        'id': 'Dari sore sampai malam.',
        'en': 'From evening until night.',
      }),
      GlossLine(
        'ユニフォーム を きなければ なりません',
        'yunifoomu o kinakereba narimasen',
        {'id': 'Harus memakai seragam.', 'en': 'You must wear a uniform.'},
        extra: {
          'ユニフォーム': {'id': 'seragam', 'en': 'uniform'},
          'きなければ': {'id': 'kalau tidak memakai', 'en': "if (you) don't wear"},
          'なりません': {'id': 'harus (～なければなりません)', 'en': 'must (～なければなりません)'},
        },
      ),
      GlossLine(
        'おくれて は いけません',
        'okurete wa ikemasen',
        {'id': 'Tidak boleh terlambat.', 'en': 'You must not be late.'},
        extra: {
          'いけません': {
            'id': 'tidak boleh (～てはいけません)',
            'en': 'must not (～てはいけません)',
          },
        },
      ),
      GlossLine(
        'おきゃくさん に あいさつ します',
        'okyakusan ni aisatsu shimasu',
        {'id': 'Saya menyapa pelanggan.', 'en': 'I greet the customers.'},
        extra: {
          'おきゃくさん': {'id': 'pelanggan; tamu', 'en': 'customer'},
        },
      ),
      GlossLine(
        'しなもの を ならべたり そうじ したり します',
        'shinamono o narabetari souji shitari shimasu',
        {
          'id': 'Saya menata barang, bersih-bersih, dan lain-lain.',
          'en': 'I arrange goods, clean, and so on.',
        },
        extra: {
          'ならべたり': {'id': 'menata (～たり)', 'en': 'arranging (～たり)'},
          'したり': {'id': 'melakukan (～たり)', 'en': 'doing (～たり)'},
        },
      ),
      GlossLine(
        'すこし たいへん です けど たのしい です',
        'sukoshi taihen desu kedo tanoshii desu',
        {
          'id': 'Agak berat, tapi menyenangkan.',
          'en': "It's a bit hard, but fun.",
        },
      ),
      GlossLine(
        'てんちょう は とても しんせつ です',
        'tenchou wa totemo shinsetsu desu',
        {
          'id': 'Manajer tokonya sangat baik.',
          'en': 'The store manager is very kind.',
        },
        extra: {
          'てんちょう': {'id': 'manajer toko', 'en': 'store manager'},
        },
      ),
      GlossLine('おかね を ためる つもり です', 'okane o tameru tsumori desu', {
        'id': 'Saya berencana menabung uang.',
        'en': 'I plan to save money.',
      }),
    ],
  ),
  GlossCardData(
    id: 'n4a_interview',
    emoji: '🤝',
    level: 'N4',
    kind: GlossKind.situation,
    title: {'id': 'Wawancara kerja', 'en': 'Job interview'},
    lines: [
      GlossLine(
        'あした めんせつ が あります',
        'ashita mensetsu ga arimasu',
        {
          'id': 'Besok ada wawancara kerja.',
          'en': 'I have a job interview tomorrow.',
        },
        extra: {
          'めんせつ': {'id': 'wawancara', 'en': 'interview'},
        },
      ),
      GlossLine(
        'スーツ を きて いきます',
        'suutsu o kite ikimasu',
        {'id': 'Saya pergi memakai jas.', 'en': "I'll go wearing a suit."},
        extra: {
          'きて': {'id': 'memakai', 'en': 'wearing'},
        },
      ),
      GlossLine(
        'じゅっぷん まえ に つかなければ なりません',
        'juppun mae ni tsukanakereba narimasen',
        {
          'id': 'Saya harus tiba sepuluh menit sebelumnya.',
          'en': 'I must arrive ten minutes early.',
        },
        extra: {
          'まえ': {'id': 'sebelum', 'en': 'before'},
          'つかなければ': {'id': 'kalau tidak tiba', 'en': "if (I) don't arrive"},
          'なりません': {'id': 'harus (～なければなりません)', 'en': 'must (～なければなりません)'},
        },
      ),
      GlossLine(
        'どうぞ おかけ ください',
        'douzo okake kudasai',
        {'id': 'Silakan duduk.', 'en': 'Please have a seat.'},
        extra: {
          'おかけ': {'id': 'duduk (sopan)', 'en': 'sit (polite)'},
        },
      ),
      GlossLine(
        'じこしょうかい を して ください',
        'jikoshoukai o shite kudasai',
        {'id': 'Silakan perkenalkan diri.', 'en': 'Please introduce yourself.'},
        extra: {
          'じこしょうかい': {'id': 'perkenalan diri', 'en': 'self-introduction'},
        },
      ),
      GlossLine(
        'にほんご を はなす こと が できます',
        'nihongo o hanasu koto ga dekimasu',
        {
          'id': 'Saya bisa berbicara bahasa Jepang.',
          'en': 'I can speak Japanese.',
        },
        extra: {
          'できます': {'id': 'bisa (～ことができます)', 'en': 'can (～ことができます)'},
        },
      ),
      GlossLine(
        'パソコン も つかう こと が できます',
        'pasokon mo tsukau koto ga dekimasu',
        {
          'id': 'Saya juga bisa memakai komputer.',
          'en': 'I can also use a computer.',
        },
        extra: {
          'できます': {'id': 'bisa (～ことができます)', 'en': 'can (～ことができます)'},
        },
      ),
      GlossLine(
        'ホテル で はたらいた こと が あります',
        'hoteru de hataraita koto ga arimasu',
        {
          'id': 'Saya pernah bekerja di hotel.',
          'en': 'I have worked at a hotel.',
        },
      ),
      GlossLine(
        'どうして この かいしゃ を えらびました か',
        'doushite kono kaisha o erabimashita ka',
        {
          'id': 'Kenapa Anda memilih perusahaan ini?',
          'en': 'Why did you choose this company?',
        },
      ),
      GlossLine(
        'この しごと が すき だ と おもいます',
        'kono shigoto ga suki da to omoimasu',
        {
          'id': 'Saya rasa saya suka pekerjaan ini.',
          'en': 'I think I like this job.',
        },
        extra: {
          'おもいます': {'id': 'pikir; rasa (～とおもいます)', 'en': 'think (～とおもいます)'},
          'だ': {'id': '(adalah)', 'en': '(is)'},
        },
      ),
      GlossLine(
        'ながく はたらく つもり です',
        'nagaku hataraku tsumori desu',
        {
          'id': 'Saya berencana bekerja lama.',
          'en': 'I plan to work here for a long time.',
        },
        extra: {
          'ながく': {'id': 'lama', 'en': 'for a long time'},
        },
      ),
      GlossLine('けっか は らいしゅう でんわ します', 'kekka wa raishuu denwa shimasu', {
        'id': 'Hasilnya kami telepon minggu depan.',
        'en': "We'll call you with the result next week.",
      }),
    ],
  ),
  GlossCardData(
    id: 'n4a_moving',
    emoji: '📦',
    level: 'N4',
    kind: GlossKind.situation,
    title: {'id': 'Pindahan rumah', 'en': 'Moving house'},
    lines: [
      GlossLine('らいげつ ひっこします', 'raigetsu hikkoshimasu', {
        'id': 'Bulan depan saya pindah rumah.',
        'en': "I'm moving next month.",
      }),
      GlossLine('あたらしい へや は ひろい です', 'atarashii heya wa hiroi desu', {
        'id': 'Kamar barunya luas.',
        'en': 'The new room is spacious.',
      }),
      GlossLine('にもつ を はこ に いれます', 'nimotsu o hako ni iremasu', {
        'id': 'Saya memasukkan barang ke kardus.',
        'en': 'I put my things in boxes.',
      }),
      GlossLine(
        'ふるい ふく は すてた ほう が いい です',
        'furui fuku wa suteta hou ga ii desu',
        {
          'id': 'Baju lama sebaiknya dibuang.',
          'en': "It's better to throw away old clothes.",
        },
        extra: {
          'ほう': {'id': 'lebih baik (～ほうがいい)', 'en': 'better (～ほうがいい)'},
        },
      ),
      GlossLine(
        'じゅうしょ を かえなければ なりません',
        'juusho o kaenakereba narimasen',
        {
          'id': 'Saya harus mengganti alamat.',
          'en': 'I have to change my address.',
        },
        extra: {
          'かえなければ': {
            'id': 'kalau tidak mengganti',
            'en': "if (I) don't change",
          },
          'なりません': {'id': 'harus (～なければなりません)', 'en': 'must (～なければなりません)'},
        },
      ),
      GlossLine(
        'ともだち が てつだって くれました',
        'tomodachi ga tetsudatte kuremashita',
        {'id': 'Teman membantu saya.', 'en': 'My friend helped me.'},
        extra: {
          'くれました': {'id': 'memberi (untuk saya)', 'en': 'did for me'},
        },
      ),
      GlossLine('れいぞうこ は とても おもい です', 'reizouko wa totemo omoi desu', {
        'id': 'Kulkasnya sangat berat.',
        'en': 'The fridge is very heavy.',
      }),
      GlossLine(
        'ここ に おいて も いい です か',
        'koko ni oite mo ii desu ka',
        {'id': 'Boleh saya taruh di sini?', 'en': 'May I put it here?'},
        extra: {
          'いい': {'id': 'boleh (～てもいい)', 'en': 'all right (～てもいい)'},
        },
      ),
      GlossLine(
        'へや が きれい に なりました',
        'heya ga kirei ni narimashita',
        {'id': 'Kamarnya jadi rapi.', 'en': 'The room became tidy.'},
        extra: {
          'きれい': {'id': 'bersih; rapi', 'en': 'clean; tidy'},
        },
      ),
      GlossLine(
        'きんじょ の ひと に あいさつ しました',
        'kinjo no hito ni aisatsu shimashita',
        {'id': 'Saya menyapa tetangga.', 'en': 'I greeted the neighbors.'},
      ),
      GlossLine(
        'こんど パーティー を する つもり です',
        'kondo paatii o suru tsumori desu',
        {
          'id': 'Saya berencana mengadakan pesta.',
          'en': 'I plan to throw a party.',
        },
        extra: {
          'こんど': {'id': 'nanti; lain kali', 'en': 'soon; next time'},
        },
      ),
      GlossLine(
        'あたらしい せいかつ が たのしみ です',
        'atarashii seikatsu ga tanoshimi desu',
        {
          'id': 'Saya menantikan hidup baru.',
          'en': "I'm looking forward to my new life.",
        },
      ),
    ],
  ),
  GlossCardData(
    id: 'n4a_online',
    emoji: '🛍️',
    level: 'N4',
    kind: GlossKind.situation,
    title: {'id': 'Belanja online', 'en': 'Online shopping'},
    lines: [
      GlossLine('インターネット で かいもの を します', 'intaanetto de kaimono o shimasu', {
        'id': 'Saya belanja lewat internet.',
        'en': 'I shop on the internet.',
      }),
      GlossLine(
        'スマホ で くつ を さがします',
        'sumaho de kutsu o sagashimasu',
        {
          'id': 'Saya mencari sepatu lewat ponsel.',
          'en': 'I look for shoes on my phone.',
        },
        extra: {
          'スマホ': {'id': 'ponsel pintar', 'en': 'smartphone'},
        },
      ),
      GlossLine('いろいろな いろ が あります', 'iroirona iro ga arimasu', {
        'id': 'Ada berbagai warna.',
        'en': 'There are many colors.',
      }),
      GlossLine(
        'あかい ほう が いい と おもいます',
        'akai hou ga ii to omoimasu',
        {
          'id': 'Saya rasa yang merah lebih bagus.',
          'en': 'I think the red one is better.',
        },
        extra: {
          'おもいます': {'id': 'pikir; rasa (～とおもいます)', 'en': 'think (～とおもいます)'},
          'ほう': {'id': 'yang (lebih)', 'en': 'the one (more)'},
        },
      ),
      GlossLine(
        'サイズ を よく たしかめます',
        'saizu o yoku tashikamemasu',
        {
          'id': 'Saya memeriksa ukurannya baik-baik.',
          'en': 'I check the size carefully.',
        },
        extra: {
          'よく': {'id': 'baik-baik; teliti', 'en': 'carefully'},
        },
      ),
      GlossLine(
        'カード で はらう こと が できます',
        'kaado de harau koto ga dekimasu',
        {'id': 'Bisa bayar pakai kartu.', 'en': 'You can pay by card.'},
        extra: {
          'できます': {'id': 'bisa (～ことができます)', 'en': 'can (～ことができます)'},
        },
      ),
      GlossLine(
        'みっか で とどきます',
        'mikka de todokimasu',
        {'id': 'Sampai dalam tiga hari.', 'en': 'It arrives in three days.'},
        extra: {
          'みっか': {'id': 'tiga hari', 'en': 'three days'},
        },
      ),
      GlossLine('にもつ が とどきました', 'nimotsu ga todokimashita', {
        'id': 'Paketnya sudah sampai.',
        'en': 'The package has arrived.',
      }),
      GlossLine(
        'はこ を あけて みました',
        'hako o akete mimashita',
        {
          'id': 'Saya coba membuka kardusnya.',
          'en': 'I tried opening the box.',
        },
        extra: {
          'みました': {'id': 'mencoba (～てみる)', 'en': 'tried (～てみる)'},
        },
      ),
      GlossLine(
        'おもった より ちいさかった です',
        'omotta yori chiisakatta desu',
        {
          'id': 'Ternyata lebih kecil dari dugaan.',
          'en': 'It was smaller than I thought.',
        },
        extra: {
          'おもった': {'id': 'sudah mengira', 'en': 'thought'},
        },
      ),
      GlossLine(
        'へんぴん して も いい です か',
        'henpin shite mo ii desu ka',
        {'id': 'Bolehkah saya mengembalikannya?', 'en': 'May I return it?'},
        extra: {
          'いい': {'id': 'boleh (～てもいい)', 'en': 'all right (～てもいい)'},
          'へんぴん': {'id': 'pengembalian barang', 'en': 'returning goods'},
        },
      ),
      GlossLine('つぎ は みせ で かう つもり です', 'tsugi wa mise de kau tsumori desu', {
        'id': 'Lain kali saya berencana beli di toko.',
        'en': 'Next time I plan to buy at a store.',
      }),
    ],
  ),
];
