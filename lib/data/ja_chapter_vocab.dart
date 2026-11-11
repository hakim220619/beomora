import '../models/guide.dart';

// Kosakata pemula Bab 1–25: urutan kata per bab untuk pelajar yang
// belajar bertahap. Arti (id/en) ditulis sendiri / dari data aplikasi.
const GuideTopic kJaChapterVocabTopic = GuideTopic(
  id: 'vocab_chapters',
  emoji: '📖',
  title: {'id': 'Kosakata Pemula Bab 1–25', 'en': 'Beginner Words, Ch. 1–25'},
  subtitle: {
    'id': '982 kosakata urut per bab, ketuk untuk dengar',
    'en': '982 words in chapter order, tap to listen',
  },
  sections: [
    GuideSection(
      title: {'id': 'Bab 1', 'en': 'Chapter 1'},
      examples: [
        GuideExample('わたし', {'id': 'saya', 'en': 'I'}, romaji: 'watashi'),
        GuideExample('わたしたち', {
          'id': 'kami / kita',
          'en': 'we',
        }, romaji: 'watashitachi'),
        GuideExample('あなた', {'id': 'kamu', 'en': 'you'}, romaji: 'anata'),
        GuideExample('あのひと', {
          'id': 'orang itu',
          'en': 'that person',
        }, romaji: 'ano hito'),
        GuideExample('あのかた', {
          'id': 'beliau / orang itu (sopan)',
          'en': 'that person (polite)',
        }, romaji: 'ano kata'),
        GuideExample('みなさん', {
          'id': 'semuanya; hadirin',
          'en': 'everyone (polite)',
        }, romaji: 'minasan'),
        GuideExample('～さん', {
          'id': 'Tuan/Nyonya ~ (akhiran sopan)',
          'en': 'Mr./Ms. ~ (polite suffix)',
        }, romaji: '~san'),
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
        GuideExample('せんせい', {'id': 'guru', 'en': 'teacher'}, romaji: 'sensei'),
        GuideExample('きょうし', {
          'id': 'guru (sebagai profesi)',
          'en': 'teacher (occupation)',
        }, romaji: 'kyoushi'),
        GuideExample('がくせい', {
          'id': 'pelajar',
          'en': 'student',
        }, romaji: 'gakusei'),
        GuideExample('かいしゃいん', {
          'id': 'karyawan perusahaan',
          'en': 'company employee',
        }, romaji: 'kaishain'),
        GuideExample('しゃいん', {
          'id': 'karyawan',
          'en': 'employee',
        }, romaji: 'shain'),
        GuideExample('ぎんこういん', {
          'id': 'pegawai bank',
          'en': 'bank clerk',
        }, romaji: 'ginkouin'),
        GuideExample('いしゃ', {'id': 'dokter', 'en': 'doctor'}, romaji: 'isha'),
        GuideExample('けんきゅうしゃ', {
          'id': 'peneliti',
          'en': 'researcher',
        }, romaji: 'kenkyuusha'),
        GuideExample('エンジニア', {
          'id': 'insinyur',
          'en': 'engineer',
        }, romaji: 'enjinia'),
        GuideExample('だいがく', {
          'id': 'universitas',
          'en': 'university',
        }, romaji: 'daigaku'),
        GuideExample('びょういん', {
          'id': 'rumah sakit',
          'en': 'hospital',
        }, romaji: 'byouin'),
        GuideExample('でんき', {
          'id': 'listrik; lampu',
          'en': 'electricity; light',
        }, romaji: 'denki'),
        GuideExample('だれ', {'id': 'siapa', 'en': 'who'}, romaji: 'dare'),
        GuideExample('どなた', {
          'id': 'siapa (sopan)',
          'en': 'who (polite)',
        }, romaji: 'donata'),
        GuideExample('～さい', {
          'id': '… tahun (umur)',
          'en': '… years old',
        }, romaji: '~sai'),
        GuideExample('なんさい', {
          'id': 'umur berapa',
          'en': 'how old',
        }, romaji: 'nansai'),
        GuideExample('おいくつ', {
          'id': 'berapa umur (sopan) / berapa buah',
          'en': 'how old (polite) / how many',
        }, romaji: 'oikutsu'),
        GuideExample('はい', {'id': 'ya', 'en': 'yes'}, romaji: 'hai'),
        GuideExample('いいえ', {'id': 'tidak', 'en': 'no'}, romaji: 'iie'),
        GuideExample('しつれい', {
          'id': 'permisi; tidak sopan',
          'en': 'excuse me; rude',
        }, romaji: 'shitsurei'),
        GuideExample('はじめまして', {
          'id': 'salam kenal',
          'en': 'nice to meet you',
        }, romaji: 'hajimemashite'),
        GuideExample('どうぞよろしくおねがいします', {
          'id': 'senang berkenalan, mohon bantuannya',
          'en': 'nice to meet you (please treat me well)',
        }, romaji: 'douzo yoroshiku onegaishimasu'),
        GuideExample('こちらは～さんです', {
          'id': 'ini adalah Tuan/Nyonya ~',
          'en': 'this is Mr./Ms. ~',
        }, romaji: 'kochira wa ~san desu'),
        GuideExample('～からきました', {
          'id': 'saya datang dari ~',
          'en': 'I came from ~',
        }, romaji: '~karakimashita'),
        GuideExample('アメリカ', {
          'id': 'Amerika Serikat',
          'en': 'USA',
        }, romaji: 'amerika'),
        GuideExample('イギリス', {'id': 'Inggris', 'en': 'UK'}, romaji: 'igirisu'),
        GuideExample('インドネシア', {
          'id': 'Indonesia',
          'en': 'Indonesia',
        }, romaji: 'indoneshia'),
        GuideExample('かんこく', {
          'id': 'Korea Selatan',
          'en': 'South Korea',
        }, romaji: 'kankoku'),
        GuideExample('タイ', {'id': 'Thailand', 'en': 'Thailand'}, romaji: 'tai'),
        GuideExample('ちゅうごく', {
          'id': 'Tiongkok',
          'en': 'China',
        }, romaji: 'chuugoku'),
        GuideExample('ドイツ', {
          'id': 'Jerman',
          'en': 'Germany',
        }, romaji: 'doitsu'),
        GuideExample('にほん', {'id': 'Jepang', 'en': 'Japan'}, romaji: 'nihon'),
        GuideExample('フランス', {
          'id': 'Prancis',
          'en': 'France',
        }, romaji: 'furansu'),
        GuideExample('ブラジル', {
          'id': 'Brasil',
          'en': 'Brazil',
        }, romaji: 'burajiru'),
      ],
    ),
    GuideSection(
      title: {'id': 'Bab 2', 'en': 'Chapter 2'},
      examples: [
        GuideExample('これ', {'id': 'ini', 'en': 'this'}, romaji: 'kore'),
        GuideExample('それ', {'id': 'itu', 'en': 'that'}, romaji: 'sore'),
        GuideExample('あれ', {
          'id': 'itu (jauh)',
          'en': 'that over there',
        }, romaji: 'are'),
        GuideExample('この', {
          'id': '~ ini',
          'en': 'this (+ noun)',
        }, romaji: 'kono'),
        GuideExample('その', {
          'id': '~ itu',
          'en': 'that (+ noun)',
        }, romaji: 'sono'),
        GuideExample('あの', {
          'id': '~ itu (jauh)',
          'en': 'that (+ noun) over there',
        }, romaji: 'ano'),
        GuideExample('ほん', {'id': 'buku', 'en': 'book'}, romaji: 'hon'),
        GuideExample('じしょ', {
          'id': 'kamus',
          'en': 'dictionary',
        }, romaji: 'jisho'),
        GuideExample('ざっし', {
          'id': 'majalah',
          'en': 'magazine',
        }, romaji: 'zasshi'),
        GuideExample('しんぶん', {
          'id': 'koran',
          'en': 'newspaper',
        }, romaji: 'shinbun'),
        GuideExample('ノート', {
          'id': 'buku catatan',
          'en': 'notebook',
        }, romaji: 'nooto'),
        GuideExample('てちょう', {
          'id': 'buku agenda',
          'en': 'pocket diary',
        }, romaji: 'techou'),
        GuideExample('めいし', {
          'id': 'kartu nama',
          'en': 'business card',
        }, romaji: 'meishi'),
        GuideExample('カード', {'id': 'kartu', 'en': 'card'}, romaji: 'kaado'),
        GuideExample('テレホンカード', {
          'id': 'kartu telepon',
          'en': 'telephone card',
        }, romaji: 'terehonkaado'),
        GuideExample('えんぴつ', {
          'id': 'pensil',
          'en': 'pencil',
        }, romaji: 'enpitsu'),
        GuideExample('ボールペン', {
          'id': 'pulpen',
          'en': 'ballpoint pen',
        }, romaji: 'boorupen'),
        GuideExample('かぎ', {'id': 'kunci', 'en': 'key'}, romaji: 'kagi'),
        GuideExample('とけい', {
          'id': 'jam',
          'en': 'watch; clock',
        }, romaji: 'tokei'),
        GuideExample('かさ', {'id': 'payung', 'en': 'umbrella'}, romaji: 'kasa'),
        GuideExample('かばん', {'id': 'tas', 'en': 'bag'}, romaji: 'kaban'),
        GuideExample('テープ', {
          'id': 'kaset; pita',
          'en': 'tape',
        }, romaji: 'teepu'),
        GuideExample('テープレコーダー', {
          'id': 'perekam kaset',
          'en': 'tape recorder',
        }, romaji: 'teepurekoodaa'),
        GuideExample('テレビ', {
          'id': 'televisi',
          'en': 'television',
        }, romaji: 'terebi'),
        GuideExample('ラジオ', {'id': 'radio', 'en': 'radio'}, romaji: 'rajio'),
        GuideExample('カメラ', {'id': 'kamera', 'en': 'camera'}, romaji: 'kamera'),
        GuideExample('コンピューター', {
          'id': 'komputer',
          'en': 'computer',
        }, romaji: 'konpyuutaa'),
        GuideExample('じどうしゃ', {
          'id': 'mobil (resmi)',
          'en': 'automobile',
        }, romaji: 'jidousha'),
        GuideExample('つくえ', {'id': 'meja', 'en': 'desk'}, romaji: 'tsukue'),
        GuideExample('いす', {'id': 'kursi', 'en': 'chair'}, romaji: 'isu'),
        GuideExample('チョコレート', {
          'id': 'cokelat',
          'en': 'chocolate',
        }, romaji: 'chokoreeto'),
        GuideExample('コーヒー', {'id': 'kopi', 'en': 'coffee'}, romaji: 'koohii'),
        GuideExample('えいご', {
          'id': 'bahasa Inggris',
          'en': 'English language',
        }, romaji: 'eigo'),
        GuideExample('にほんご', {
          'id': 'bahasa Jepang',
          'en': 'Japanese language',
        }, romaji: 'nihongo'),
        GuideExample('～ご', {
          'id': 'bahasa ~',
          'en': '~ language',
        }, romaji: '~go'),
        GuideExample('なん', {
          'id': 'apa (sebelum kata bantu)',
          'en': 'what',
        }, romaji: 'nan'),
        GuideExample('そう', {
          'id': 'begitu',
          'en': 'so; like that',
        }, romaji: 'sou'),
        GuideExample('ちがいます', {
          'id': 'berbeda; salah',
          'en': 'to differ; to be wrong',
        }, romaji: 'chigaimasu'),
        GuideExample('そうですか', {
          'id': 'oh, begitu',
          'en': 'is that so?',
        }, romaji: 'soudesuka'),
        GuideExample('あのう', {
          'id': 'anu; begini... (pembuka)',
          'en': 'um; excuse me',
        }, romaji: 'anou'),
        GuideExample('ほんのきもちです', {
          'id': 'ini sekadar tanda terima kasih',
          'en': 'just a small token',
        }, romaji: 'hon no kimochi desu'),
        GuideExample('どうぞ', {
          'id': 'silakan',
          'en': 'please (go ahead)',
        }, romaji: 'douzo'),
        GuideExample('どうも', {
          'id': 'terima kasih; sangat',
          'en': 'thanks; very',
        }, romaji: 'doumo'),
        GuideExample('ありがとう', {
          'id': 'terima kasih',
          'en': 'thank you',
        }, romaji: 'arigatou'),
        GuideExample('どうもありがとうございます', {
          'id': 'terima kasih banyak',
          'en': 'thank you very much',
        }, romaji: 'doumo arigatou gozaimasu'),
        GuideExample('これからおせわになります', {
          'id': 'mohon bimbingannya mulai sekarang',
          'en': 'thank you in advance for your help',
        }, romaji: 'kore kara osewa ni narimasu'),
        GuideExample('こちらこそよろしく', {
          'id': 'saya juga, senang berkenalan',
          'en': 'likewise, nice to meet you',
        }, romaji: 'kochira koso yoroshiku'),
      ],
    ),
    GuideSection(
      title: {'id': 'Bab 3', 'en': 'Chapter 3'},
      examples: [
        GuideExample('ここ', {'id': 'di sini', 'en': 'here'}, romaji: 'koko'),
        GuideExample('そこ', {'id': 'di situ', 'en': 'there'}, romaji: 'soko'),
        GuideExample('どこ', {'id': 'di mana', 'en': 'where'}, romaji: 'doko'),
        GuideExample('こちら', {
          'id': 'sebelah sini (sopan)',
          'en': 'this way (polite)',
        }, romaji: 'kochira'),
        GuideExample('そちら', {
          'id': 'sebelah situ (sopan)',
          'en': 'that way (polite)',
        }, romaji: 'sochira'),
        GuideExample('あちら', {
          'id': 'sebelah sana (sopan)',
          'en': 'that way over there (polite)',
        }, romaji: 'achira'),
        GuideExample('どちら', {
          'id': 'sebelah mana; yang mana (sopan)',
          'en': 'which way; which (polite)',
        }, romaji: 'dochira'),
        GuideExample('きょうしつ', {
          'id': 'ruang kelas',
          'en': 'classroom',
        }, romaji: 'kyoushitsu'),
        GuideExample('しょくどう', {
          'id': 'kantin; rumah makan',
          'en': 'cafeteria; diner',
        }, romaji: 'shokudou'),
        GuideExample('じむしょ', {
          'id': 'kantor',
          'en': 'office',
        }, romaji: 'jimusho'),
        GuideExample('かいぎしつ', {
          'id': 'ruang rapat',
          'en': 'meeting room',
        }, romaji: 'kaigishitsu'),
        GuideExample('うけつけ', {
          'id': 'resepsionis',
          'en': 'reception',
        }, romaji: 'uketsuke'),
        GuideExample('ロビー', {'id': 'lobi', 'en': 'lobby'}, romaji: 'robii'),
        GuideExample('へや', {'id': 'kamar', 'en': 'room'}, romaji: 'heya'),
        GuideExample('トイレ', {'id': 'toilet', 'en': 'toilet'}, romaji: 'toire'),
        GuideExample('おてあらい', {
          'id': 'kamar kecil',
          'en': 'restroom',
        }, romaji: 'otearai'),
        GuideExample('かいだん', {
          'id': 'tangga',
          'en': 'stairs',
        }, romaji: 'kaidan'),
        GuideExample('エレベーター', {
          'id': 'lift',
          'en': 'elevator',
        }, romaji: 'erebeetaa'),
        GuideExample('エスカレーター', {
          'id': 'eskalator',
          'en': 'escalator',
        }, romaji: 'esukareetaa'),
        GuideExample('くに', {'id': 'negara', 'en': 'country'}, romaji: 'kuni'),
        GuideExample('かいしゃ', {
          'id': 'perusahaan',
          'en': 'company',
        }, romaji: 'kaisha'),
        GuideExample('うち', {
          'id': 'rumah; kediaman',
          'en': 'home',
        }, romaji: 'uchi'),
        GuideExample('でんわ', {
          'id': 'telepon',
          'en': 'telephone',
        }, romaji: 'denwa'),
        GuideExample('くつ', {'id': 'sepatu', 'en': 'shoes'}, romaji: 'kutsu'),
        GuideExample('ネクタイ', {
          'id': 'dasi',
          'en': 'necktie',
        }, romaji: 'nekutai'),
        GuideExample('ワイン', {
          'id': 'anggur (minuman)',
          'en': 'wine',
        }, romaji: 'wain'),
        GuideExample('たばこ', {
          'id': 'rokok',
          'en': 'cigarette; tobacco',
        }, romaji: 'tabako'),
        GuideExample('うりば', {
          'id': 'bagian penjualan (konter)',
          'en': 'sales counter',
        }, romaji: 'uriba'),
        GuideExample('ちか', {
          'id': 'ruang bawah tanah',
          'en': 'basement',
        }, romaji: 'chika'),
        GuideExample('いっかい', {
          'id': 'satu kali; lantai satu',
          'en': 'once; first floor',
        }, romaji: 'ikkai'),
        GuideExample('なんがい', {
          'id': 'lantai berapa',
          'en': 'which floor',
        }, romaji: 'nangai'),
        GuideExample('いくら', {
          'id': 'berapa (harga)',
          'en': 'how much',
        }, romaji: 'ikura'),
        GuideExample('ひゃく', {
          'id': 'seratus',
          'en': 'hundred',
        }, romaji: 'hyaku'),
        GuideExample('せん', {'id': 'seribu', 'en': 'thousand'}, romaji: 'sen'),
        GuideExample('まん', {
          'id': 'sepuluh ribu',
          'en': 'ten thousand',
        }, romaji: 'man'),
        GuideExample('すみません', {
          'id': 'permisi; maaf',
          'en': 'excuse me',
        }, romaji: 'sumimasen'),
        GuideExample('～でございます', {
          'id': 'bentuk sangat sopan dari ~です',
          'en': 'very polite form of ~です',
        }, romaji: '~degozaimasu'),
        GuideExample('～をみせてください', {
          'id': 'tolong perlihatkan ~',
          'en': 'please show me ~',
        }, romaji: '~o misete kudasai'),
        GuideExample('じゃ', {
          'id': 'kalau begitu',
          'en': 'well then',
        }, romaji: 'ja'),
        GuideExample('～をください', {
          'id': 'tolong beri saya ~',
          'en': 'please give me ~',
        }, romaji: '~o kudasai'),
      ],
    ),
    GuideSection(
      title: {'id': 'Bab 4', 'en': 'Chapter 4'},
      examples: [
        GuideExample('おきます', {
          'id': 'bangun',
          'en': 'to wake up',
        }, romaji: 'okimasu'),
        GuideExample('ねます', {
          'id': 'tidur',
          'en': 'to sleep',
        }, romaji: 'nemasu'),
        GuideExample('はたらきます', {
          'id': 'bekerja',
          'en': 'to work',
        }, romaji: 'hatarakimasu'),
        GuideExample('やすみます', {
          'id': 'beristirahat',
          'en': 'to rest',
        }, romaji: 'yasumimasu'),
        GuideExample('べんきょうします', {
          'id': 'belajar',
          'en': 'to study',
        }, romaji: 'benkyoushimasu'),
        GuideExample('おわります', {
          'id': 'berakhir',
          'en': 'to end',
        }, romaji: 'owarimasu'),
        GuideExample('デパート', {
          'id': 'toserba; mal',
          'en': 'department store',
        }, romaji: 'depaato'),
        GuideExample('ぎんこう', {'id': 'bank', 'en': 'bank'}, romaji: 'ginkou'),
        GuideExample('ゆうびんきょく', {
          'id': 'kantor pos',
          'en': 'post office',
        }, romaji: 'yuubinkyoku'),
        GuideExample('としょかん', {
          'id': 'perpustakaan',
          'en': 'library',
        }, romaji: 'toshokan'),
        GuideExample('びじゅつかん', {
          'id': 'museum seni',
          'en': 'art museum',
        }, romaji: 'bijutsukan'),
        GuideExample('いま', {'id': 'sekarang', 'en': 'now'}, romaji: 'ima'),
        GuideExample('～じ', {
          'id': 'pukul ~',
          'en': '~ o\'clock',
        }, romaji: '~ji'),
        GuideExample('～ふん', {'id': 'menit', 'en': 'minute'}, romaji: '~fun'),
        GuideExample('はん', {
          'id': 'setengah (jam)',
          'en': 'half past',
        }, romaji: 'han'),
        GuideExample('なんじ', {
          'id': 'jam berapa',
          'en': 'what time',
        }, romaji: 'nanji'),
        GuideExample('なんぷん', {
          'id': 'berapa menit',
          'en': 'how many minutes',
        }, romaji: 'nanpun'),
        GuideExample('ごぜん', {'id': 'pagi (AM)', 'en': 'a.m.'}, romaji: 'gozen'),
        GuideExample('ごご', {'id': 'siang (PM)', 'en': 'p.m.'}, romaji: 'gogo'),
        GuideExample('あさ', {'id': 'pagi', 'en': 'morning'}, romaji: 'asa'),
        GuideExample('ひる', {'id': 'siang', 'en': 'noon'}, romaji: 'hiru'),
        GuideExample('ばん', {
          'id': 'malam hari',
          'en': 'evening',
        }, romaji: 'ban'),
        GuideExample('おととい', {
          'id': 'kemarin lusa',
          'en': 'day before yesterday',
        }, romaji: 'ototoi'),
        GuideExample('きのう', {
          'id': 'kemarin',
          'en': 'yesterday',
        }, romaji: 'kinou'),
        GuideExample('きょう', {'id': 'hari ini', 'en': 'today'}, romaji: 'kyou'),
        GuideExample('あした', {
          'id': 'besok',
          'en': 'tomorrow',
        }, romaji: 'ashita'),
        GuideExample('あさって', {
          'id': 'lusa',
          'en': 'day after tomorrow',
        }, romaji: 'asatte'),
        GuideExample('けさ', {
          'id': 'tadi pagi',
          'en': 'this morning',
        }, romaji: 'kesa'),
        GuideExample('こんばん', {
          'id': 'malam ini',
          'en': 'tonight',
        }, romaji: 'konban'),
        GuideExample('やすみ', {
          'id': 'libur; istirahat',
          'en': 'holiday; rest',
        }, romaji: 'yasumi'),
        GuideExample('ひるやすみ', {
          'id': 'istirahat siang',
          'en': 'lunch break',
        }, romaji: 'hiruyasumi'),
        GuideExample('まいあさ', {
          'id': 'setiap pagi',
          'en': 'every morning',
        }, romaji: 'maiasa'),
        GuideExample('まいばん', {
          'id': 'setiap malam',
          'en': 'every night',
        }, romaji: 'maiban'),
        GuideExample('まいにち', {
          'id': 'setiap hari',
          'en': 'every day',
        }, romaji: 'mainichi'),
        GuideExample('げつようび', {
          'id': 'Senin',
          'en': 'Monday',
        }, romaji: 'getsuyoubi'),
        GuideExample('かようび', {
          'id': 'Selasa',
          'en': 'Tuesday',
        }, romaji: 'kayoubi'),
        GuideExample('すいようび', {
          'id': 'Rabu',
          'en': 'Wednesday',
        }, romaji: 'suiyoubi'),
        GuideExample('もくようび', {
          'id': 'Kamis',
          'en': 'Thursday',
        }, romaji: 'mokuyoubi'),
        GuideExample('きんようび', {
          'id': 'Jumat',
          'en': 'Friday',
        }, romaji: 'kinyoubi'),
        GuideExample('どようび', {
          'id': 'Sabtu',
          'en': 'Saturday',
        }, romaji: 'doyoubi'),
        GuideExample('にちようび', {
          'id': 'Minggu',
          'en': 'Sunday',
        }, romaji: 'nichiyoubi'),
        GuideExample('なんようび', {
          'id': 'hari apa',
          'en': 'what day of the week',
        }, romaji: 'nanyoubi'),
        GuideExample('ばんごう', {'id': 'nomor', 'en': 'number'}, romaji: 'bangou'),
        GuideExample('なんばん', {
          'id': 'nomor berapa',
          'en': 'what number',
        }, romaji: 'nanban'),
        GuideExample('～から', {'id': 'dari ~', 'en': 'from ~'}, romaji: '~kara'),
        GuideExample('～まで', {
          'id': 'sampai ~',
          'en': 'until ~',
        }, romaji: '~made'),
        GuideExample('～と～', {'id': '~ dan ~', 'en': '~ and ~'}, romaji: '~to~'),
        GuideExample('そちら', {
          'id': 'sebelah situ (sopan)',
          'en': 'that way (polite)',
        }, romaji: 'sochira'),
        GuideExample('たいへんですね', {
          'id': 'wah, berat ya',
          'en': 'that must be hard',
        }, romaji: 'taihen desu ne'),
        GuideExample('えーと', {
          'id': 'emm… (sambil berpikir)',
          'en': 'um, let me see',
        }, romaji: 'eeto'),
        GuideExample('おねがいします', {
          'id': 'tolong; mohon',
          'en': 'please',
        }, romaji: 'onegaishimasu'),
        GuideExample('かしこまりました', {
          'id': 'baik, saya mengerti (sangat sopan)',
          'en': 'certainly, understood (very polite)',
        }, romaji: 'kashikomarimashita'),
        GuideExample('おといあわせのばんごう', {
          'id': 'nomor untuk pertanyaan',
          'en': 'inquiry number',
        }, romaji: 'otoiawase no bangou'),
        GuideExample('した', {
          'id': 'bawah',
          'en': 'below; under',
        }, romaji: 'shita'),
        GuideExample('ニューヨーク', {
          'id': 'New York',
          'en': 'New York',
        }, romaji: 'nyuuyooku'),
        GuideExample('ペキン', {
          'id': 'Beijing',
          'en': 'Beijing',
        }, romaji: 'pekin'),
        GuideExample('ロンドン', {
          'id': 'London',
          'en': 'London',
        }, romaji: 'rondon'),
        GuideExample('バンコク', {
          'id': 'Bangkok',
          'en': 'Bangkok',
        }, romaji: 'bankoku'),
        GuideExample('ロサンゼルス', {
          'id': 'Los Angeles',
          'en': 'Los Angeles',
        }, romaji: 'rosanzerusu'),
      ],
    ),
    GuideSection(
      title: {'id': 'Bab 5', 'en': 'Chapter 5'},
      examples: [
        GuideExample('いきます', {'id': 'pergi', 'en': 'to go'}, romaji: 'ikimasu'),
        GuideExample('きます', {
          'id': 'datang',
          'en': 'to come',
        }, romaji: 'kimasu'),
        GuideExample('かえります', {
          'id': 'pulang',
          'en': 'to return',
        }, romaji: 'kaerimasu'),
        GuideExample('がっこう', {
          'id': 'sekolah',
          'en': 'school',
        }, romaji: 'gakkou'),
        GuideExample('スーパー', {
          'id': 'supermarket',
          'en': 'supermarket',
        }, romaji: 'suupaa'),
        GuideExample('えき', {'id': 'stasiun', 'en': 'station'}, romaji: 'eki'),
        GuideExample('ひこうき', {
          'id': 'pesawat terbang',
          'en': 'airplane',
        }, romaji: 'hikouki'),
        GuideExample('ふね', {'id': 'kapal', 'en': 'ship'}, romaji: 'fune'),
        GuideExample('でんしゃ', {'id': 'kereta', 'en': 'train'}, romaji: 'densha'),
        GuideExample('ちかてつ', {
          'id': 'kereta bawah tanah',
          'en': 'subway',
        }, romaji: 'chikatetsu'),
        GuideExample('しんかんせん', {
          'id': 'kereta peluru',
          'en': 'bullet train',
        }, romaji: 'shinkansen'),
        GuideExample('バス', {'id': 'bus', 'en': 'bus'}, romaji: 'basu'),
        GuideExample('タクシー', {'id': 'taksi', 'en': 'taxi'}, romaji: 'takushii'),
        GuideExample('じてんしゃ', {
          'id': 'sepeda',
          'en': 'bicycle',
        }, romaji: 'jitensha'),
        GuideExample('あるいて', {
          'id': 'berjalan kaki',
          'en': 'on foot',
        }, romaji: 'aruite'),
        GuideExample('ひと', {'id': 'orang', 'en': 'person'}, romaji: 'hito'),
        GuideExample('ともだち', {
          'id': 'teman',
          'en': 'friend',
        }, romaji: 'tomodachi'),
        GuideExample('かれ', {'id': 'dia (lk)', 'en': 'he'}, romaji: 'kare'),
        GuideExample('かのじょ', {'id': 'dia (pr)', 'en': 'she'}, romaji: 'kanojo'),
        GuideExample('かぞく', {
          'id': 'keluarga',
          'en': 'family',
        }, romaji: 'kazoku'),
        GuideExample('ひとりで', {
          'id': 'sendirian',
          'en': 'alone',
        }, romaji: 'hitori de'),
        GuideExample('せんしゅう', {
          'id': 'minggu lalu',
          'en': 'last week',
        }, romaji: 'senshuu'),
        GuideExample('こんしゅう', {
          'id': 'minggu ini',
          'en': 'this week',
        }, romaji: 'konshuu'),
        GuideExample('らいしゅう', {
          'id': 'minggu depan',
          'en': 'next week',
        }, romaji: 'raishuu'),
        GuideExample('せんげつ', {
          'id': 'bulan lalu',
          'en': 'last month',
        }, romaji: 'sengetsu'),
        GuideExample('こんげつ', {
          'id': 'bulan ini',
          'en': 'this month',
        }, romaji: 'kongetsu'),
        GuideExample('らいげつ', {
          'id': 'bulan depan',
          'en': 'next month',
        }, romaji: 'raigetsu'),
        GuideExample('きょねん', {
          'id': 'tahun lalu',
          'en': 'last year',
        }, romaji: 'kyonen'),
        GuideExample('ことし', {
          'id': 'tahun ini',
          'en': 'this year',
        }, romaji: 'kotoshi'),
        GuideExample('らいねん', {
          'id': 'tahun depan',
          'en': 'next year',
        }, romaji: 'rainen'),
        GuideExample('～がつ', {
          'id': 'bulan ~ (nama bulan)',
          'en': '~ (month name)',
        }, romaji: '~gatsu'),
        GuideExample('なんがつ', {
          'id': 'bulan apa',
          'en': 'what month',
        }, romaji: 'nangatsu'),
        GuideExample('ついたち', {
          'id': 'tanggal 1',
          'en': '1st day of the month',
        }, romaji: 'tsuitachi'),
        GuideExample('ふつか', {
          'id': 'tanggal 2; dua hari',
          'en': '2nd day; two days',
        }, romaji: 'futsuka'),
        GuideExample('みっか', {
          'id': 'tanggal 3; tiga hari',
          'en': '3rd day; three days',
        }, romaji: 'mikka'),
        GuideExample('いつか', {
          'id': 'tanggal 5; lima hari',
          'en': '5th day; five days',
        }, romaji: 'itsuka'),
        GuideExample('むいか', {
          'id': 'tanggal 6; enam hari',
          'en': '6th day; six days',
        }, romaji: 'muika'),
        GuideExample('なのか', {
          'id': 'tanggal 7; tujuh hari',
          'en': '7th day; seven days',
        }, romaji: 'nanoka'),
        GuideExample('ようか', {
          'id': 'tanggal 8; delapan hari',
          'en': '8th day; eight days',
        }, romaji: 'youka'),
        GuideExample('ここのか', {
          'id': 'tanggal 9; sembilan hari',
          'en': '9th day; nine days',
        }, romaji: 'kokonoka'),
        GuideExample('とおか', {
          'id': 'tanggal 10; sepuluh hari',
          'en': '10th day; ten days',
        }, romaji: 'tooka'),
        GuideExample('じゅうよっか', {
          'id': 'tanggal 14',
          'en': '14th day of the month',
        }, romaji: 'juuyokka'),
        GuideExample('はつか', {
          'id': 'tanggal 20; dua puluh hari',
          'en': '20th day; twenty days',
        }, romaji: 'hatsuka'),
        GuideExample('にじゅうよっか', {
          'id': 'tanggal 24',
          'en': 'the 24th (date)',
        }, romaji: 'nijuuyokka'),
        GuideExample('～にち', {
          'id': 'tanggal ~ / ~ hari',
          'en': 'the ~th / ~ days',
        }, romaji: '~nichi'),
        GuideExample('なんにち', {
          'id': 'tanggal berapa',
          'en': 'what day of the month',
        }, romaji: 'nannichi'),
        GuideExample('いつ', {'id': 'kapan', 'en': 'when'}, romaji: 'itsu'),
        GuideExample('たんじょうび', {
          'id': 'hari ulang tahun',
          'en': 'birthday',
        }, romaji: 'tanjoubi'),
        GuideExample('ふつう', {
          'id': 'biasa; kereta lokal',
          'en': 'ordinary; local train',
        }, romaji: 'futsuu'),
        GuideExample('きゅうこう', {
          'id': 'kereta ekspres',
          'en': 'express train',
        }, romaji: 'kyuukou'),
        GuideExample('とっきゅう', {
          'id': 'kereta ekspres terbatas',
          'en': 'limited express',
        }, romaji: 'tokkyuu'),
        GuideExample('つぎの', {
          'id': 'berikutnya',
          'en': 'next',
        }, romaji: 'tsugi no'),
        GuideExample('どういたしまして', {
          'id': 'sama-sama',
          'en': 'you\'re welcome',
        }, romaji: 'douitashimashite'),
        GuideExample('～ばんせん', {
          'id': 'peron / jalur nomor ~',
          'en': 'platform no. ~',
        }, romaji: '~bansen'),
      ],
    ),
    GuideSection(
      title: {'id': 'Bab 6', 'en': 'Chapter 6'},
      examples: [
        GuideExample('たべます', {
          'id': 'makan',
          'en': 'to eat',
        }, romaji: 'tabemasu'),
        GuideExample('のみます', {
          'id': 'minum',
          'en': 'to drink',
        }, romaji: 'nomimasu'),
        GuideExample('すいます', {
          'id': 'mengisap; menghirup',
          'en': 'to smoke; to inhale',
        }, romaji: 'suimasu'),
        GuideExample('たばこをすいます', {
          'id': 'merokok',
          'en': 'to smoke',
        }, romaji: 'tabako o suimasu'),
        GuideExample('みます', {
          'id': 'melihat; menonton',
          'en': 'to see; to watch',
        }, romaji: 'mimasu'),
        GuideExample('ききます', {
          'id': 'mendengar; bertanya',
          'en': 'to listen; to ask',
        }, romaji: 'kikimasu'),
        GuideExample('よみます', {
          'id': 'membaca',
          'en': 'to read',
        }, romaji: 'yomimasu'),
        GuideExample('かきます', {
          'id': 'menulis',
          'en': 'to write',
        }, romaji: 'kakimasu'),
        GuideExample('かいます', {
          'id': 'membeli',
          'en': 'to buy',
        }, romaji: 'kaimasu'),
        GuideExample('とります', {
          'id': 'mengambil',
          'en': 'to take',
        }, romaji: 'torimasu'),
        GuideExample('しゃしんをとります', {
          'id': 'memotret',
          'en': 'to take a photo',
        }, romaji: 'shashin o torimasu'),
        GuideExample('します', {
          'id': 'melakukan',
          'en': 'to do',
        }, romaji: 'shimasu'),
        GuideExample('あいます', {
          'id': 'bertemu',
          'en': 'to meet',
        }, romaji: 'aimasu'),
        GuideExample('ともだちにあいます', {
          'id': 'bertemu teman',
          'en': 'to meet a friend',
        }, romaji: 'tomodachi ni aimasu'),
        GuideExample('ごはん', {
          'id': 'nasi; makanan',
          'en': 'rice; meal',
        }, romaji: 'gohan'),
        GuideExample('あさごはん', {
          'id': 'sarapan',
          'en': 'breakfast',
        }, romaji: 'asagohan'),
        GuideExample('ひるごはん', {
          'id': 'makan siang',
          'en': 'lunch',
        }, romaji: 'hirugohan'),
        GuideExample('ばんごはん', {
          'id': 'makan malam',
          'en': 'dinner',
        }, romaji: 'bangohan'),
        GuideExample('パン', {'id': 'roti', 'en': 'bread'}, romaji: 'pan'),
        GuideExample('たまご', {'id': 'telur', 'en': 'egg'}, romaji: 'tamago'),
        GuideExample('にく', {'id': 'daging', 'en': 'meat'}, romaji: 'niku'),
        GuideExample('さかな', {'id': 'ikan', 'en': 'fish'}, romaji: 'sakana'),
        GuideExample('やさい', {
          'id': 'sayur',
          'en': 'vegetable',
        }, romaji: 'yasai'),
        GuideExample('くだもの', {'id': 'buah', 'en': 'fruit'}, romaji: 'kudamono'),
        GuideExample('みず', {'id': 'air', 'en': 'water'}, romaji: 'mizu'),
        GuideExample('おちゃ', {'id': 'teh', 'en': 'tea'}, romaji: 'ocha'),
        GuideExample('こうちゃ', {
          'id': 'teh hitam',
          'en': 'black tea',
        }, romaji: 'koucha'),
        GuideExample('ぎゅうにゅう', {
          'id': 'susu',
          'en': 'milk',
        }, romaji: 'gyuunyuu'),
        GuideExample('ミルク', {'id': 'susu', 'en': 'milk'}, romaji: 'miruku'),
        GuideExample('ジュース', {'id': 'jus', 'en': 'juice'}, romaji: 'juusu'),
        GuideExample('ビール', {'id': 'bir', 'en': 'beer'}, romaji: 'biiru'),
        GuideExample('さけ', {
          'id': 'minuman beralkohol / sake',
          'en': 'alcohol, sake',
        }, romaji: 'sake'),
        GuideExample('ビデオ', {'id': 'video', 'en': 'video'}, romaji: 'bideo'),
        GuideExample('えいが', {
          'id': 'film (bioskop)',
          'en': 'movie',
        }, romaji: 'eiga'),
        GuideExample('てがみ', {'id': 'surat', 'en': 'letter'}, romaji: 'tegami'),
        GuideExample('レポート', {
          'id': 'laporan (tugas)',
          'en': 'report; paper',
        }, romaji: 'repooto'),
        GuideExample('しゃしん', {
          'id': 'foto',
          'en': 'photograph',
        }, romaji: 'shashin'),
        GuideExample('みせ', {'id': 'toko', 'en': 'shop'}, romaji: 'mise'),
        GuideExample('レストラン', {
          'id': 'restoran',
          'en': 'restaurant',
        }, romaji: 'resutoran'),
        GuideExample('にわ', {
          'id': 'kebun; halaman',
          'en': 'garden',
        }, romaji: 'niwa'),
        GuideExample('しゅくだい', {
          'id': 'PR; pekerjaan rumah',
          'en': 'homework',
        }, romaji: 'shukudai'),
        GuideExample('しゅくだいをします', {
          'id': 'mengerjakan PR',
          'en': 'to do homework',
        }, romaji: 'shukudai o shimasu'),
        GuideExample('テニス', {'id': 'tenis', 'en': 'tennis'}, romaji: 'tenisu'),
        GuideExample('サッカー', {
          'id': 'sepak bola',
          'en': 'soccer',
        }, romaji: 'sakkaa'),
        GuideExample('サッカーをします', {
          'id': 'bermain sepak bola',
          'en': 'to play soccer',
        }, romaji: 'sakkaa o shimasu'),
        GuideExample('はなみ', {
          'id': 'melihat bunga sakura',
          'en': 'cherry-blossom viewing',
        }, romaji: 'hanami'),
        GuideExample('はなみをします', {
          'id': 'pergi melihat bunga sakura',
          'en': 'to go cherry-blossom viewing',
        }, romaji: 'hanami o shimasu'),
        GuideExample('なに', {'id': 'apa', 'en': 'what'}, romaji: 'nani'),
        GuideExample('いっしょに', {
          'id': 'bersama-sama',
          'en': 'together',
        }, romaji: 'isshoni'),
        GuideExample('ちょっと', {
          'id': 'sebentar',
          'en': 'a moment',
        }, romaji: 'chotto'),
        GuideExample('いつも', {'id': 'selalu', 'en': 'always'}, romaji: 'itsumo'),
        GuideExample('ときどき', {
          'id': 'kadang-kadang',
          'en': 'sometimes',
        }, romaji: 'tokidoki'),
        GuideExample('それから', {
          'id': 'setelah itu',
          'en': 'after that',
        }, romaji: 'sorekara'),
        GuideExample('ええ', {
          'id': 'ya (santai)',
          'en': 'yes (casual)',
        }, romaji: 'ee'),
        GuideExample('いいですね', {
          'id': 'bagus ya',
          'en': 'sounds good',
        }, romaji: 'ii desu ne'),
        GuideExample('なんですか', {
          'id': 'apa itu? / ada apa?',
          'en': 'what is it?',
        }, romaji: 'nan desu ka'),
        GuideExample('じゃ、またあした', {
          'id': 'sampai jumpa besok',
          'en': 'see you tomorrow',
        }, romaji: 'ja, mata ashita'),
      ],
    ),
    GuideSection(
      title: {'id': 'Bab 7', 'en': 'Chapter 7'},
      examples: [
        GuideExample('きります', {
          'id': 'memotong',
          'en': 'to cut',
        }, romaji: 'kirimasu'),
        GuideExample('おくります', {
          'id': 'mengirim',
          'en': 'to send',
        }, romaji: 'okurimasu'),
        GuideExample('あげます', {
          'id': 'memberi (kepada orang lain)',
          'en': 'to give',
        }, romaji: 'agemasu'),
        GuideExample('もらいます', {
          'id': 'menerima (pemberian)',
          'en': 'to receive',
        }, romaji: 'moraimasu'),
        GuideExample('かります', {
          'id': 'meminjam',
          'en': 'to borrow',
        }, romaji: 'karimasu'),
        GuideExample('おしえます', {
          'id': 'mengajar',
          'en': 'to teach',
        }, romaji: 'oshiemasu'),
        GuideExample('ならいます', {
          'id': 'belajar',
          'en': 'to learn',
        }, romaji: 'naraimasu'),
        GuideExample('でんわをかけます', {
          'id': 'menelepon',
          'en': 'to make a phone call',
        }, romaji: 'denwa o kakemasu'),
        GuideExample('て', {'id': 'tangan', 'en': 'hand'}, romaji: 'te'),
        GuideExample('はし', {
          'id': 'sumpit',
          'en': 'chopsticks',
        }, romaji: 'hashi'),
        GuideExample('スプーン', {'id': 'sendok', 'en': 'spoon'}, romaji: 'supuun'),
        GuideExample('ナイフ', {'id': 'pisau', 'en': 'knife'}, romaji: 'naifu'),
        GuideExample('フォーク', {'id': 'garpu', 'en': 'fork'}, romaji: 'fooku'),
        GuideExample('はさみ', {
          'id': 'gunting',
          'en': 'scissors',
        }, romaji: 'hasami'),
        GuideExample('ファクス', {'id': 'faks', 'en': 'fax'}, romaji: 'fakusu'),
        GuideExample('ワープロ', {
          'id': 'pengolah kata',
          'en': 'word processor',
        }, romaji: 'waapuro'),
        GuideExample('パソコン', {
          'id': 'komputer pribadi',
          'en': 'personal computer',
        }, romaji: 'pasokon'),
        GuideExample('パンチ', {
          'id': 'pelubang kertas',
          'en': 'hole punch',
        }, romaji: 'panchi'),
        GuideExample('ホッチキス', {
          'id': 'stapler',
          'en': 'stapler',
        }, romaji: 'hotchikisu'),
        GuideExample('セロテープ', {
          'id': 'selotip',
          'en': 'sticky tape',
        }, romaji: 'serotepu'),
        GuideExample('けしゴム', {
          'id': 'penghapus',
          'en': 'eraser',
        }, romaji: 'keshigomu'),
        GuideExample('かみ', {'id': 'kertas', 'en': 'paper'}, romaji: 'kami'),
        GuideExample('はな', {'id': 'bunga', 'en': 'flower'}, romaji: 'hana'),
        GuideExample('シャツ', {
          'id': 'kemeja; kaos',
          'en': 'shirt',
        }, romaji: 'shatsu'),
        GuideExample('プレゼント', {
          'id': 'kado',
          'en': 'present',
        }, romaji: 'purezento'),
        GuideExample('にもつ', {
          'id': 'barang bawaan',
          'en': 'luggage',
        }, romaji: 'nimotsu'),
        GuideExample('おかね', {'id': 'uang', 'en': 'money'}, romaji: 'okane'),
        GuideExample('きっぷ', {
          'id': 'tiket (karcis)',
          'en': 'ticket',
        }, romaji: 'kippu'),
        GuideExample('クリスマス', {
          'id': 'Natal',
          'en': 'Christmas',
        }, romaji: 'kurisumasu'),
        GuideExample('ちち', {
          'id': 'ayah (sendiri)',
          'en': 'father',
        }, romaji: 'chichi'),
        GuideExample('はは', {
          'id': 'ibu (sendiri)',
          'en': 'mother',
        }, romaji: 'haha'),
        GuideExample('おとうさん', {
          'id': 'ayah (sopan)',
          'en': 'father (polite)',
        }, romaji: 'otousan'),
        GuideExample('おかあさん', {
          'id': 'ibu (sopan)',
          'en': 'mother (polite)',
        }, romaji: 'okaasan'),
        GuideExample('もう', {'id': 'sudah', 'en': 'already'}, romaji: 'mou'),
        GuideExample('まだ', {'id': 'belum', 'en': 'not yet'}, romaji: 'mada'),
        GuideExample('これから', {
          'id': 'mulai sekarang; setelah ini',
          'en': 'from now on',
        }, romaji: 'korekara'),
        GuideExample('すてきですね', {
          'id': 'bagus sekali ya',
          'en': 'how lovely',
        }, romaji: 'suteki desu ne'),
        GuideExample('おじゃましてもいいですか', {
          'id': 'boleh saya masuk?',
          'en': 'may I come in?',
        }, romaji: 'ojama shite mo ii desu ka'),
        GuideExample('いらっしゃい', {
          'id': 'selamat datang (santai)',
          'en': 'welcome (casual)',
        }, romaji: 'irasshai'),
      ],
    ),
    GuideSection(
      title: {'id': 'Bab 8', 'en': 'Chapter 8'},
      examples: [
        GuideExample('ハンサム', {
          'id': 'tampan',
          'en': 'handsome',
        }, romaji: 'hansamu'),
        GuideExample('きれい', {
          'id': 'cantik; bersih',
          'en': 'pretty; clean',
        }, romaji: 'kirei'),
        GuideExample('しずか', {
          'id': 'tenang; sepi',
          'en': 'quiet',
        }, romaji: 'shizuka'),
        GuideExample('にぎやか', {
          'id': 'ramai',
          'en': 'lively',
        }, romaji: 'nigiyaka'),
        GuideExample('ゆうめい', {
          'id': 'terkenal',
          'en': 'famous',
        }, romaji: 'yuumei'),
        GuideExample('しんせつ', {
          'id': 'baik hati',
          'en': 'kind',
        }, romaji: 'shinsetsu'),
        GuideExample('げんき', {
          'id': 'sehat; bersemangat',
          'en': 'healthy; energetic',
        }, romaji: 'genki'),
        GuideExample('ひま', {
          'id': 'senggang',
          'en': 'free (time)',
        }, romaji: 'hima'),
        GuideExample('べんり', {
          'id': 'praktis',
          'en': 'convenient',
        }, romaji: 'benri'),
        GuideExample('すてき', {
          'id': 'menawan',
          'en': 'lovely',
        }, romaji: 'suteki'),
        GuideExample('おおきい', {'id': 'besar', 'en': 'big'}, romaji: 'ookii'),
        GuideExample('ちいさい', {'id': 'kecil', 'en': 'small'}, romaji: 'chiisai'),
        GuideExample('あたらしい', {'id': 'baru', 'en': 'new'}, romaji: 'atarashii'),
        GuideExample('ふるい', {'id': 'lama', 'en': 'old'}, romaji: 'furui'),
        GuideExample('いい', {'id': 'bagus', 'en': 'good'}, romaji: 'ii'),
        GuideExample('わるい', {'id': 'buruk', 'en': 'bad'}, romaji: 'warui'),
        GuideExample('あつい', {'id': 'tebal', 'en': 'thick'}, romaji: 'atsui'),
        GuideExample('あつい', {'id': 'panas', 'en': 'hot'}, romaji: 'atsui'),
        GuideExample('さむい', {'id': 'dingin', 'en': 'cold'}, romaji: 'samui'),
        GuideExample('つめたい', {
          'id': 'dingin (saat disentuh)',
          'en': 'cold (to the touch)',
        }, romaji: 'tsumetai'),
        GuideExample('むずかしい', {
          'id': 'sulit',
          'en': 'difficult',
        }, romaji: 'muzukashii'),
        GuideExample('やさしい', {
          'id': 'mudah; ramah',
          'en': 'easy; kind',
        }, romaji: 'yasashii'),
        GuideExample('たかい', {
          'id': 'tinggi; mahal',
          'en': 'tall; expensive',
        }, romaji: 'takai'),
        GuideExample('やすい', {'id': 'murah', 'en': 'cheap'}, romaji: 'yasui'),
        GuideExample('ひくい', {'id': 'rendah', 'en': 'low'}, romaji: 'hikui'),
        GuideExample('おもしろい', {
          'id': 'menarik; lucu',
          'en': 'interesting; funny',
        }, romaji: 'omoshiroi'),
        GuideExample('おいしい', {
          'id': 'enak',
          'en': 'delicious',
        }, romaji: 'oishii'),
        GuideExample('たのしい', {
          'id': 'menyenangkan',
          'en': 'fun',
        }, romaji: 'tanoshii'),
        GuideExample('しろい', {'id': 'putih', 'en': 'white'}, romaji: 'shiroi'),
        GuideExample('くろい', {'id': 'hitam', 'en': 'black'}, romaji: 'kuroi'),
        GuideExample('あかい', {'id': 'merah', 'en': 'red'}, romaji: 'akai'),
        GuideExample('あおい', {'id': 'biru', 'en': 'blue'}, romaji: 'aoi'),
        GuideExample('さくら', {
          'id': 'bunga sakura',
          'en': 'cherry blossom',
        }, romaji: 'sakura'),
        GuideExample('やま', {'id': 'gunung', 'en': 'mountain'}, romaji: 'yama'),
        GuideExample('まち', {'id': 'kota', 'en': 'town'}, romaji: 'machi'),
        GuideExample('たべもの', {
          'id': 'makanan',
          'en': 'food',
        }, romaji: 'tabemono'),
        GuideExample('くるま', {'id': 'mobil', 'en': 'car'}, romaji: 'kuruma'),
        GuideExample('ところ', {'id': 'tempat', 'en': 'place'}, romaji: 'tokoro'),
        GuideExample('りょう', {
          'id': 'asrama',
          'en': 'dormitory',
        }, romaji: 'ryou'),
        GuideExample('べんきょう', {
          'id': 'belajar (kata benda)',
          'en': 'study',
        }, romaji: 'benkyou'),
        GuideExample('せいかつ', {
          'id': 'kehidupan',
          'en': 'life',
        }, romaji: 'seikatsu'),
        GuideExample('しごと', {
          'id': 'pekerjaan',
          'en': 'work',
        }, romaji: 'shigoto'),
        GuideExample('しごとをします', {
          'id': 'bekerja',
          'en': 'to work',
        }, romaji: 'shigoto o shimasu'),
        GuideExample('どう', {'id': 'bagaimana', 'en': 'how'}, romaji: 'dou'),
        GuideExample('どんな', {
          'id': 'seperti apa',
          'en': 'what kind of',
        }, romaji: 'donna'),
        GuideExample('どれ', {
          'id': 'yang mana (dari banyak)',
          'en': 'which one',
        }, romaji: 'dore'),
        GuideExample('とても', {'id': 'sangat', 'en': 'very'}, romaji: 'totemo'),
        GuideExample('あまり', {
          'id': 'tidak begitu (+ negatif)',
          'en': 'not very',
        }, romaji: 'amari'),
        GuideExample('そして', {
          'id': 'lalu; dan',
          'en': 'and then',
        }, romaji: 'soshite'),
        GuideExample('～が、～', {
          'id': '~, tetapi ~',
          'en': '~, but ~',
        }, romaji: '~ga, ~'),
        GuideExample('おげんきですか', {
          'id': 'apa kabar?',
          'en': 'how are you?',
        }, romaji: 'ogenki desu ka'),
        GuideExample('そうですね', {
          'id': 'benar juga ya',
          'en': 'that\'s right; let me see',
        }, romaji: 'soudesune'),
        GuideExample('にほんのせいかつになれましたか', {
          'id': 'sudah terbiasa dengan kehidupan di Jepang?',
          'en': 'have you got used to life in Japan?',
        }, romaji: 'nihon no seikatsu ni naremashita ka'),
        GuideExample('もういっぱいいかがですか', {
          'id': 'mau tambah satu gelas lagi?',
          'en': 'how about another cup?',
        }, romaji: 'mou ippai ikaga desu ka'),
        GuideExample('いいえ、けっこうです', {
          'id': 'tidak, terima kasih',
          'en': 'no, thank you',
        }, romaji: 'iie, kekkou desu'),
        GuideExample('そろそろしつれいします', {
          'id': 'saya pamit dulu',
          'en': 'I should be going',
        }, romaji: 'sorosoro shitsurei shimasu'),
        GuideExample('またいらっしゃってください', {
          'id': 'silakan datang lagi',
          'en': 'please come again',
        }, romaji: 'mata irasshatte kudasai'),
      ],
    ),
    GuideSection(
      title: {'id': 'Bab 9', 'en': 'Chapter 9'},
      examples: [
        GuideExample('わかります', {
          'id': 'mengerti; paham',
          'en': 'to understand',
        }, romaji: 'wakarimasu'),
        GuideExample('あります', {
          'id': 'ada (benda)',
          'en': 'to exist (things)',
        }, romaji: 'arimasu'),
        GuideExample('すき', {'id': 'suka', 'en': 'liked'}, romaji: 'suki'),
        GuideExample('きらい', {
          'id': 'benci; tidak suka',
          'en': 'disliked',
        }, romaji: 'kirai'),
        GuideExample('じょうず', {
          'id': 'pandai; mahir',
          'en': 'skillful',
        }, romaji: 'jouzu'),
        GuideExample('へた', {
          'id': 'tidak pandai',
          'en': 'unskillful',
        }, romaji: 'heta'),
        GuideExample('りょうり', {
          'id': 'masakan; memasak',
          'en': 'cooking; dish',
        }, romaji: 'ryouri'),
        GuideExample('のみもの', {
          'id': 'minuman',
          'en': 'drink',
        }, romaji: 'nomimono'),
        GuideExample('スポーツ', {
          'id': 'olahraga',
          'en': 'sport',
        }, romaji: 'supootsu'),
        GuideExample('スポーツをします', {
          'id': 'berolahraga',
          'en': 'to play sports',
        }, romaji: 'supootsu o shimasu'),
        GuideExample('やきゅう', {
          'id': 'bisbol',
          'en': 'baseball',
        }, romaji: 'yakyuu'),
        GuideExample('やきゅうをします', {
          'id': 'bermain bisbol',
          'en': 'to play baseball',
        }, romaji: 'yakyuu o shimasu'),
        GuideExample('ダンス', {
          'id': 'tari / dansa',
          'en': 'dance',
        }, romaji: 'dansu'),
        GuideExample('ダンスをします', {
          'id': 'berdansa',
          'en': 'to dance',
        }, romaji: 'dansu o shimasu'),
        GuideExample('おんがく', {'id': 'musik', 'en': 'music'}, romaji: 'ongaku'),
        GuideExample('うた', {'id': 'lagu', 'en': 'song'}, romaji: 'uta'),
        GuideExample('クラシック', {
          'id': 'musik klasik',
          'en': 'classical music',
        }, romaji: 'kurashikku'),
        GuideExample('ジャズ', {'id': 'musik jazz', 'en': 'jazz'}, romaji: 'jazu'),
        GuideExample('コンサート', {
          'id': 'konser',
          'en': 'concert',
        }, romaji: 'konsaato'),
        GuideExample('カラオケ', {
          'id': 'karaoke',
          'en': 'karaoke',
        }, romaji: 'karaoke'),
        GuideExample('かぶき', {
          'id': 'kabuki (teater tradisional)',
          'en': 'kabuki',
        }, romaji: 'kabuki'),
        GuideExample('え', {
          'id': 'gambar; lukisan',
          'en': 'picture; painting',
        }, romaji: 'e'),
        GuideExample('じ', {
          'id': 'huruf; tulisan tangan',
          'en': 'character; handwriting',
        }, romaji: 'ji'),
        GuideExample('かんじ', {
          'id': 'huruf kanji',
          'en': 'kanji',
        }, romaji: 'kanji'),
        GuideExample('ひらがな', {
          'id': 'huruf hiragana',
          'en': 'hiragana',
        }, romaji: 'hiragana'),
        GuideExample('カタカナ', {
          'id': 'huruf katakana',
          'en': 'katakana',
        }, romaji: 'katakana'),
        GuideExample('ローマじ', {
          'id': 'huruf Latin (romaji)',
          'en': 'romanized Japanese',
        }, romaji: 'roomaji'),
        GuideExample('こまかいおかね', {
          'id': 'uang receh',
          'en': 'small change',
        }, romaji: 'komakai okane'),
        GuideExample('チケット', {
          'id': 'tiket',
          'en': 'ticket',
        }, romaji: 'chiketto'),
        GuideExample('じかん', {
          'id': 'waktu; jam',
          'en': 'time; hour',
        }, romaji: 'jikan'),
        GuideExample('ようじ', {
          'id': 'urusan; keperluan',
          'en': 'errand; business',
        }, romaji: 'youji'),
        GuideExample('やくそく', {
          'id': 'janji',
          'en': 'promise',
        }, romaji: 'yakusoku'),
        GuideExample('ごしゅじん', {
          'id': 'suami (orang lain)',
          'en': '(someone\'s) husband',
        }, romaji: 'goshujin'),
        GuideExample('おっと', {'id': 'suami', 'en': 'husband'}, romaji: 'otto'),
        GuideExample('しゅじん', {
          'id': 'suami (sendiri)',
          'en': '(my) husband',
        }, romaji: 'shujin'),
        GuideExample('おくさん', {
          'id': 'istri (orang lain)',
          'en': '(someone\'s) wife',
        }, romaji: 'okusan'),
        GuideExample('つま', {'id': 'istri', 'en': 'wife'}, romaji: 'tsuma'),
        GuideExample('かない', {
          'id': 'istri saya (ke orang lain)',
          'en': 'my wife',
        }, romaji: 'kanai'),
        GuideExample('こども', {'id': 'anak', 'en': 'child'}, romaji: 'kodomo'),
        GuideExample('よく', {
          'id': 'sering; baik',
          'en': 'often; well',
        }, romaji: 'yoku'),
        GuideExample('だいたい', {
          'id': 'kira-kira',
          'en': 'roughly',
        }, romaji: 'daitai'),
        GuideExample('たくさん', {'id': 'banyak', 'en': 'many'}, romaji: 'takusan'),
        GuideExample('すこし', {
          'id': 'sedikit',
          'en': 'a little',
        }, romaji: 'sukoshi'),
        GuideExample('ぜんぜん', {
          'id': 'sama sekali (+ negatif)',
          'en': 'not at all',
        }, romaji: 'zenzen'),
        GuideExample('はやく', {
          'id': 'cepat; lebih awal',
          'en': 'early, quickly',
        }, romaji: 'hayaku'),
        GuideExample('はやく', {
          'id': 'cepat (kecepatan)',
          'en': 'fast',
        }, romaji: 'hayaku'),
        GuideExample('～から', {
          'id': 'karena ~',
          'en': 'because ~',
        }, romaji: '~kara'),
        GuideExample('どうして', {
          'id': 'kenapa',
          'en': 'why; how come',
        }, romaji: 'doushite'),
        GuideExample('ざんねんです', {
          'id': 'sayang sekali',
          'en': 'regrettable',
        }, romaji: 'zannen desu'),
        GuideExample('すみません', {
          'id': 'permisi; maaf',
          'en': 'excuse me',
        }, romaji: 'sumimasen'),
        GuideExample('もしもし', {
          'id': 'halo (di telepon)',
          'en': 'hello (on the phone)',
        }, romaji: 'moshimoshi'),
        GuideExample('いっしょにいかがですか', {
          'id': 'mau ikut bersama?',
          'en': 'would you like to join?',
        }, romaji: 'issho ni ikaga desu ka'),
        GuideExample('～はちょっと', {
          'id': '~ agak kurang… (menolak halus)',
          'en': '~ is a bit… (polite refusal)',
        }, romaji: '~wa chotto'),
        GuideExample('だめですか', {
          'id': 'tidak bisa ya?',
          'en': 'is it no good?',
        }, romaji: 'dame desu ka'),
        GuideExample('またこんどおねがいします', {
          'id': 'lain kali saja ya',
          'en': 'maybe next time',
        }, romaji: 'mata kondo onegaishimasu'),
      ],
    ),
    GuideSection(
      title: {'id': 'Bab 10', 'en': 'Chapter 10'},
      examples: [
        GuideExample('います', {
          'id': 'ada (orang/hewan)',
          'en': 'to exist (living things)',
        }, romaji: 'imasu'),
        GuideExample('あります', {
          'id': 'ada (benda)',
          'en': 'to exist (things)',
        }, romaji: 'arimasu'),
        GuideExample('いろいろ', {
          'id': 'bermacam-macam',
          'en': 'various',
        }, romaji: 'iroiro'),
        GuideExample('おとこのひと', {
          'id': 'pria (dewasa)',
          'en': 'man',
        }, romaji: 'otokonohito'),
        GuideExample('おんなのひと', {
          'id': 'wanita (dewasa)',
          'en': 'woman',
        }, romaji: 'onnanohito'),
        GuideExample('おとこのこ', {
          'id': 'anak laki-laki',
          'en': 'boy',
        }, romaji: 'otokonoko'),
        GuideExample('おんなのこ', {
          'id': 'anak perempuan',
          'en': 'girl',
        }, romaji: 'onnanoko'),
        GuideExample('いぬ', {'id': 'anjing', 'en': 'dog'}, romaji: 'inu'),
        GuideExample('ねこ', {'id': 'kucing', 'en': 'cat'}, romaji: 'neko'),
        GuideExample('き', {'id': 'pohon', 'en': 'tree'}, romaji: 'ki'),
        GuideExample('もの', {
          'id': 'barang; benda',
          'en': 'thing',
        }, romaji: 'mono'),
        GuideExample('フィルム', {
          'id': 'film (rol kamera)',
          'en': 'film (camera)',
        }, romaji: 'firumu'),
        GuideExample('でんち', {
          'id': 'baterai',
          'en': 'battery',
        }, romaji: 'denchi'),
        GuideExample('はこ', {'id': 'kotak', 'en': 'box'}, romaji: 'hako'),
        GuideExample('スイッチ', {
          'id': 'sakelar',
          'en': 'switch',
        }, romaji: 'suicchi'),
        GuideExample('れいぞうこ', {
          'id': 'kulkas',
          'en': 'refrigerator',
        }, romaji: 'reizouko'),
        GuideExample('テーブル', {
          'id': 'meja (makan)',
          'en': 'table',
        }, romaji: 'teeburu'),
        GuideExample('ベッド', {
          'id': 'tempat tidur',
          'en': 'bed',
        }, romaji: 'beddo'),
        GuideExample('たな', {'id': 'rak', 'en': 'shelf'}, romaji: 'tana'),
        GuideExample('ドア', {'id': 'pintu', 'en': 'door'}, romaji: 'doa'),
        GuideExample('まど', {'id': 'jendela', 'en': 'window'}, romaji: 'mado'),
        GuideExample('ポスト', {
          'id': 'kotak pos',
          'en': 'mailbox',
        }, romaji: 'posuto'),
        GuideExample('ビル', {
          'id': 'gedung',
          'en': 'building (modern)',
        }, romaji: 'biru'),
        GuideExample('こうえん', {'id': 'taman', 'en': 'park'}, romaji: 'kouen'),
        GuideExample('きっさてん', {
          'id': 'kedai kopi',
          'en': 'coffee shop',
        }, romaji: 'kissaten'),
        GuideExample('ほんや', {
          'id': 'toko buku',
          'en': 'bookstore',
        }, romaji: 'honya'),
        GuideExample('～や', {'id': 'toko ~', 'en': '~ shop'}, romaji: '~ya'),
        GuideExample('のりば', {
          'id': 'tempat naik (halte, peron)',
          'en': 'boarding place (stop, platform)',
        }, romaji: 'noriba'),
        GuideExample('けん', {
          'id': 'prefektur (provinsi)',
          'en': 'prefecture',
        }, romaji: 'ken'),
        GuideExample('うえ', {'id': 'atas', 'en': 'above; on'}, romaji: 'ue'),
        GuideExample('した', {
          'id': 'bawah',
          'en': 'below; under',
        }, romaji: 'shita'),
        GuideExample('まえ', {
          'id': 'depan; sebelum',
          'en': 'front; before',
        }, romaji: 'mae'),
        GuideExample('うしろ', {
          'id': 'belakang',
          'en': 'behind',
        }, romaji: 'ushiro'),
        GuideExample('みぎ', {'id': 'kanan', 'en': 'right'}, romaji: 'migi'),
        GuideExample('ひだり', {'id': 'kiri', 'en': 'left'}, romaji: 'hidari'),
        GuideExample('なか', {
          'id': 'dalam; tengah',
          'en': 'inside',
        }, romaji: 'naka'),
        GuideExample('そと', {'id': 'luar', 'en': 'outside'}, romaji: 'soto'),
        GuideExample('となり', {
          'id': 'sebelah',
          'en': 'next to',
        }, romaji: 'tonari'),
        GuideExample('ちかく', {
          'id': 'dekat sini; sekitar',
          'en': 'nearby',
        }, romaji: 'chikaku'),
        GuideExample('あいだ', {'id': 'antara', 'en': 'between'}, romaji: 'aida'),
        GuideExample('～や～など', {
          'id': '~, ~, dan lain-lain',
          'en': '~, ~, and so on',
        }, romaji: '~ya ~nado'),
        GuideExample('いちばん', {
          'id': 'paling; nomor satu',
          'en': 'the most; number one',
        }, romaji: 'ichiban'),
        GuideExample('いちばんうえ', {
          'id': 'paling atas',
          'en': 'the very top',
        }, romaji: 'ichiban ue'),
        GuideExample('～だんめ', {
          'id': 'tingkat/rak ke-~',
          'en': 'the ~th shelf',
        }, romaji: '~danme'),
        GuideExample('だん', {
          'id': 'tingkat / rak',
          'en': 'shelf, level',
        }, romaji: 'dan'),
        GuideExample('どうもすみません', {
          'id': 'maaf sekali / terima kasih banyak',
          'en': 'I\'m very sorry / thank you',
        }, romaji: 'doumo sumimasen'),
        GuideExample('チリソース', {
          'id': 'saus cabai',
          'en': 'chili sauce',
        }, romaji: 'chirisoosu'),
        GuideExample('おく', {
          'id': 'bagian dalam / belakang',
          'en': 'interior, back part',
        }, romaji: 'oku'),
        GuideExample('スパイスコーナー', {
          'id': 'bagian rempah-rempah',
          'en': 'spice corner',
        }, romaji: 'supaisukoonaa'),
      ],
    ),
    GuideSection(
      title: {'id': 'Bab 11', 'en': 'Chapter 11'},
      examples: [
        GuideExample('います', {
          'id': 'mempunyai (anak)',
          'en': 'to have (children)',
        }, romaji: 'imasu'),
        GuideExample('います', {
          'id': 'tinggal / berada (di suatu tempat)',
          'en': 'to be, to stay (somewhere)',
        }, romaji: 'imasu'),
        GuideExample('かかります', {
          'id': 'memakan (waktu/biaya)',
          'en': 'to take (time/money)',
        }, romaji: 'kakarimasu'),
        GuideExample('やすみます', {
          'id': 'beristirahat',
          'en': 'to rest',
        }, romaji: 'yasumimasu'),
        GuideExample('かいしゃをやすみます', {
          'id': 'tidak masuk kerja',
          'en': 'to take a day off work',
        }, romaji: 'kaisha o yasumimasu'),
        GuideExample('ひとつ', {
          'id': 'satu (buah)',
          'en': 'one (thing)',
        }, romaji: 'hitotsu'),
        GuideExample('ふたつ', {
          'id': 'dua (buah)',
          'en': 'two (things)',
        }, romaji: 'futatsu'),
        GuideExample('みっつ', {
          'id': 'tiga (buah)',
          'en': 'three (things)',
        }, romaji: 'mittsu'),
        GuideExample('よっつ', {
          'id': 'empat (buah)',
          'en': 'four (things)',
        }, romaji: 'yottsu'),
        GuideExample('いつつ', {
          'id': 'lima (buah)',
          'en': 'five (things)',
        }, romaji: 'itsutsu'),
        GuideExample('むっつ', {
          'id': 'enam (buah)',
          'en': 'six (things)',
        }, romaji: 'muttsu'),
        GuideExample('ななつ', {
          'id': 'tujuh (buah)',
          'en': 'seven (things)',
        }, romaji: 'nanatsu'),
        GuideExample('やっつ', {
          'id': 'delapan (buah)',
          'en': 'eight (things)',
        }, romaji: 'yattsu'),
        GuideExample('ここのつ', {
          'id': 'sembilan (buah)',
          'en': 'nine (things)',
        }, romaji: 'kokonotsu'),
        GuideExample('とお', {
          'id': 'sepuluh (buah)',
          'en': 'ten (things)',
        }, romaji: 'too'),
        GuideExample('いくつ', {
          'id': 'berapa (buah); berapa umur',
          'en': 'how many; how old',
        }, romaji: 'ikutsu'),
        GuideExample('ひとり', {
          'id': 'satu orang; sendirian',
          'en': 'one person; alone',
        }, romaji: 'hitori'),
        GuideExample('ふたり', {
          'id': 'dua orang',
          'en': 'two people',
        }, romaji: 'futari'),
        GuideExample('～にん', {
          'id': '~ orang',
          'en': '~ people',
        }, romaji: '~nin'),
        GuideExample('～だい', {
          'id': '… unit (mesin, kendaraan)',
          'en': 'counter for machines, vehicles',
        }, romaji: '~dai'),
        GuideExample('～まい', {
          'id': '… lembar (benda tipis)',
          'en': 'counter for flat things',
        }, romaji: '~mai'),
        GuideExample('～かい', {'id': '~ kali', 'en': '~ times'}, romaji: '~kai'),
        GuideExample('りんご', {'id': 'apel', 'en': 'apple'}, romaji: 'ringo'),
        GuideExample('みかん', {
          'id': 'jeruk mandarin',
          'en': 'mandarin orange',
        }, romaji: 'mikan'),
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
        GuideExample('きって', {
          'id': 'perangko',
          'en': 'postage stamp',
        }, romaji: 'kitte'),
        GuideExample('はがき', {
          'id': 'kartu pos',
          'en': 'postcard',
        }, romaji: 'hagaki'),
        GuideExample('ふうとう', {
          'id': 'amplop',
          'en': 'envelope',
        }, romaji: 'fuutou'),
        GuideExample('そくたつ', {
          'id': 'kilat khusus (pos)',
          'en': 'express mail',
        }, romaji: 'sokutatsu'),
        GuideExample('かきとめ', {
          'id': 'surat tercatat',
          'en': 'registered mail',
        }, romaji: 'kakitome'),
        GuideExample('こうくうびん', {
          'id': 'pos udara',
          'en': 'airmail',
        }, romaji: 'koukuubin'),
        GuideExample('ふなびん', {
          'id': 'pos laut',
          'en': 'sea mail',
        }, romaji: 'funabin'),
        GuideExample('りょうしん', {
          'id': 'orang tua (ayah-ibu)',
          'en': 'parents',
        }, romaji: 'ryoushin'),
        GuideExample('きょうだい', {
          'id': 'saudara kandung',
          'en': 'siblings',
        }, romaji: 'kyoudai'),
        GuideExample('あに', {
          'id': 'kakak laki-laki',
          'en': 'older brother',
        }, romaji: 'ani'),
        GuideExample('おにいさん', {
          'id': 'kakak lk (sopan)',
          'en': 'older brother (polite)',
        }, romaji: 'oniisan'),
        GuideExample('あね', {
          'id': 'kakak perempuan',
          'en': 'older sister',
        }, romaji: 'ane'),
        GuideExample('おねえさん', {
          'id': 'kakak pr (sopan)',
          'en': 'older sister (polite)',
        }, romaji: 'oneesan'),
        GuideExample('おとうと', {
          'id': 'adik laki-laki',
          'en': 'younger brother',
        }, romaji: 'otouto'),
        GuideExample('おとうとさん', {
          'id': 'adik laki-laki (orang lain)',
          'en': '(someone\'s) younger brother',
        }, romaji: 'otoutosan'),
        GuideExample('いもうと', {
          'id': 'adik perempuan',
          'en': 'younger sister',
        }, romaji: 'imouto'),
        GuideExample('いもうとさん', {
          'id': 'adik perempuan (orang lain)',
          'en': '(someone\'s) younger sister',
        }, romaji: 'imoutosan'),
        GuideExample('がいこく', {
          'id': 'luar negeri',
          'en': 'foreign country',
        }, romaji: 'gaikoku'),
        GuideExample('～じかん', {
          'id': '~ jam (lamanya)',
          'en': '~ hours',
        }, romaji: '~jikan'),
        GuideExample('～しゅうかん', {
          'id': '~ minggu (lamanya)',
          'en': '~ weeks',
        }, romaji: '~shuukan'),
        GuideExample('～かげつ', {
          'id': '… bulan (lamanya)',
          'en': '… months (duration)',
        }, romaji: '~kagetsu'),
        GuideExample('～ねん', {'id': '… tahun', 'en': '… years'}, romaji: '~nen'),
        GuideExample('～ぐらい', {
          'id': 'kira-kira (jumlah)',
          'en': 'about (amount)',
        }, romaji: '~gurai'),
        GuideExample('どのぐらい', {
          'id': 'berapa lama / banyak',
          'en': 'how long, how much',
        }, romaji: 'dono gurai'),
        GuideExample('ぜんぶで', {
          'id': 'semuanya (total)',
          'en': 'in total',
        }, romaji: 'zenbu de'),
        GuideExample('みんな', {
          'id': 'semua orang',
          'en': 'everyone',
        }, romaji: 'minna'),
        GuideExample('～だけ', {'id': 'hanya …', 'en': 'only …'}, romaji: '~dake'),
        GuideExample('いらっしゃいませ', {
          'id': 'selamat datang (di toko)',
          'en': 'welcome (to a shop)',
        }, romaji: 'irasshaimase'),
        GuideExample('いいてんきですね', {
          'id': 'cuacanya cerah ya',
          'en': 'nice weather, isn\'t it?',
        }, romaji: 'ii tenki desu ne'),
        GuideExample('おでかけですか', {
          'id': 'mau pergi keluar?',
          'en': 'are you going out?',
        }, romaji: 'odekake desu ka'),
        GuideExample('ちょっと～まで', {
          'id': 'sebentar ke ~',
          'en': 'just to ~',
        }, romaji: 'chotto ~made'),
        GuideExample('いってらっしゃい', {
          'id': 'hati-hati di jalan',
          'en': 'take care (see you)',
        }, romaji: 'itterasshai'),
        GuideExample('いってまいります', {
          'id': 'saya berangkat dulu (sopan)',
          'en': 'I\'ll be going now (humble)',
        }, romaji: 'itte mairimasu'),
        GuideExample('それから', {
          'id': 'setelah itu',
          'en': 'after that',
        }, romaji: 'sorekara'),
        GuideExample('オーストラリア', {
          'id': 'Australia',
          'en': 'Australia',
        }, romaji: 'oosutoraria'),
      ],
    ),
    GuideSection(
      title: {'id': 'Bab 12', 'en': 'Chapter 12'},
      examples: [
        GuideExample('かんたん', {
          'id': 'sederhana',
          'en': 'simple',
        }, romaji: 'kantan'),
        GuideExample('ちかい', {'id': 'dekat', 'en': 'near'}, romaji: 'chikai'),
        GuideExample('とおい', {'id': 'jauh', 'en': 'far'}, romaji: 'tooi'),
        GuideExample('はやい', {'id': 'cepat', 'en': 'fast'}, romaji: 'hayai'),
        GuideExample('おそい', {
          'id': 'lambat; terlambat',
          'en': 'slow; late',
        }, romaji: 'osoi'),
        GuideExample('おおい', {
          'id': 'banyak (jumlahnya)',
          'en': 'many; numerous',
        }, romaji: 'ooi'),
        GuideExample('すくない', {
          'id': 'sedikit (jumlahnya)',
          'en': 'few',
        }, romaji: 'sukunai'),
        GuideExample('あたたかい', {
          'id': 'hangat',
          'en': 'warm',
        }, romaji: 'atatakai'),
        GuideExample('すずしい', {'id': 'sejuk', 'en': 'cool'}, romaji: 'suzushii'),
        GuideExample('あまい', {'id': 'manis', 'en': 'sweet'}, romaji: 'amai'),
        GuideExample('からい', {'id': 'pedas', 'en': 'spicy'}, romaji: 'karai'),
        GuideExample('おもい', {'id': 'berat', 'en': 'heavy'}, romaji: 'omoi'),
        GuideExample('かるい', {'id': 'ringan', 'en': 'light'}, romaji: 'karui'),
        GuideExample('いい', {'id': 'bagus', 'en': 'good'}, romaji: 'ii'),
        GuideExample('きせつ', {'id': 'musim', 'en': 'season'}, romaji: 'kisetsu'),
        GuideExample('はる', {
          'id': 'musim semi',
          'en': 'spring',
        }, romaji: 'haru'),
        GuideExample('なつ', {
          'id': 'musim panas',
          'en': 'summer',
        }, romaji: 'natsu'),
        GuideExample('あき', {
          'id': 'musim gugur',
          'en': 'autumn',
        }, romaji: 'aki'),
        GuideExample('ふゆ', {
          'id': 'musim dingin',
          'en': 'winter',
        }, romaji: 'fuyu'),
        GuideExample('てんき', {'id': 'cuaca', 'en': 'weather'}, romaji: 'tenki'),
        GuideExample('あめ', {'id': 'hujan', 'en': 'rain'}, romaji: 'ame'),
        GuideExample('ゆき', {'id': 'salju', 'en': 'snow'}, romaji: 'yuki'),
        GuideExample('くもり', {
          'id': 'berawan; mendung',
          'en': 'cloudy weather',
        }, romaji: 'kumori'),
        GuideExample('ホテル', {'id': 'hotel', 'en': 'hotel'}, romaji: 'hoteru'),
        GuideExample('くうこう', {
          'id': 'bandara',
          'en': 'airport',
        }, romaji: 'kuukou'),
        GuideExample('うみ', {'id': 'laut', 'en': 'sea'}, romaji: 'umi'),
        GuideExample('せかい', {'id': 'dunia', 'en': 'world'}, romaji: 'sekai'),
        GuideExample('パーティー', {'id': 'pesta', 'en': 'party'}, romaji: 'paatii'),
        GuideExample('まつり', {
          'id': 'festival',
          'en': 'festival',
        }, romaji: 'matsuri'),
        GuideExample('しけん', {'id': 'ujian', 'en': 'exam'}, romaji: 'shiken'),
        GuideExample('すきやき', {
          'id': 'sukiyaki (rebusan daging)',
          'en': 'sukiyaki',
        }, romaji: 'sukiyaki'),
        GuideExample('さしみ', {
          'id': 'irisan ikan mentah',
          'en': 'sashimi',
        }, romaji: 'sashimi'),
        GuideExample('すし', {'id': 'sushi', 'en': 'sushi'}, romaji: 'sushi'),
        GuideExample('てんぷら', {
          'id': 'gorengan tepung ala Jepang',
          'en': 'tempura',
        }, romaji: 'tenpura'),
        GuideExample('いけばな', {
          'id': 'seni merangkai bunga',
          'en': 'flower arranging',
        }, romaji: 'ikebana'),
        GuideExample('もみじ', {
          'id': 'daun merah musim gugur',
          'en': 'autumn leaves',
        }, romaji: 'momiji'),
        GuideExample('どちら', {
          'id': 'sebelah mana; yang mana (sopan)',
          'en': 'which way; which (polite)',
        }, romaji: 'dochira'),
        GuideExample('どちらも', {
          'id': 'dua-duanya',
          'en': 'both',
        }, romaji: 'dochira mo'),
        GuideExample('ずっと', {
          'id': 'terus-menerus; jauh (lebih)',
          'en': 'all along; by far',
        }, romaji: 'zutto'),
        GuideExample('はじめて', {
          'id': 'pertama kali',
          'en': 'for the first time',
        }, romaji: 'hajimete'),
        GuideExample('ただいま', {
          'id': 'saya pulang',
          'en': 'I\'m home',
        }, romaji: 'tadaima'),
        GuideExample('おかえりなさい', {
          'id': 'selamat datang kembali',
          'en': 'welcome home',
        }, romaji: 'okaerinasai'),
        GuideExample('でも', {'id': 'tetapi', 'en': 'but'}, romaji: 'demo'),
        GuideExample('つかれました', {
          'id': 'saya capek',
          'en': 'I\'m tired',
        }, romaji: 'tsukaremashita'),
      ],
    ),
    GuideSection(
      title: {'id': 'Bab 13', 'en': 'Chapter 13'},
      examples: [
        GuideExample('あそびます', {
          'id': 'bermain',
          'en': 'to play',
        }, romaji: 'asobimasu'),
        GuideExample('およぎます', {
          'id': 'berenang',
          'en': 'to swim',
        }, romaji: 'oyogimasu'),
        GuideExample('むかえます', {
          'id': 'menjemput; menyambut',
          'en': 'to meet; to welcome',
        }, romaji: 'mukaemasu'),
        GuideExample('つかれます', {
          'id': 'lelah',
          'en': 'to get tired',
        }, romaji: 'tsukaremasu'),
        GuideExample('だします', {
          'id': 'mengeluarkan; mengirim (surat)',
          'en': 'to take out; to send',
        }, romaji: 'dashimasu'),
        GuideExample('はいります', {
          'id': 'masuk',
          'en': 'to enter',
        }, romaji: 'hairimasu'),
        GuideExample('でます', {
          'id': 'keluar',
          'en': 'to go out; to leave',
        }, romaji: 'demasu'),
        GuideExample('けっこんします', {
          'id': 'menikah',
          'en': 'to marry',
        }, romaji: 'kekkonshimasu'),
        GuideExample('かいものします', {
          'id': 'belanja',
          'en': 'shopping',
        }, romaji: 'kaimonoshimasu'),
        GuideExample('しょくじします', {
          'id': 'makan (bersantap)',
          'en': 'to have a meal',
        }, romaji: 'shokujishimasu'),
        GuideExample('さんぽします', {
          'id': 'berjalan-jalan',
          'en': 'to take a walk',
        }, romaji: 'sanposhimasu'),
        GuideExample('たいへん', {
          'id': 'berat; gawat; sangat',
          'en': 'hard; terrible; very',
        }, romaji: 'taihen'),
        GuideExample('ほしい', {
          'id': 'ingin (memiliki)',
          'en': 'wanted; desired',
        }, romaji: 'hoshii'),
        GuideExample('さびしい', {
          'id': 'kesepian',
          'en': 'lonely',
        }, romaji: 'sabishii'),
        GuideExample('ひろい', {
          'id': 'luas',
          'en': 'wide; spacious',
        }, romaji: 'hiroi'),
        GuideExample('せまい', {
          'id': 'sempit',
          'en': 'narrow; cramped',
        }, romaji: 'semai'),
        GuideExample('しやくしょ', {
          'id': 'kantor wali kota',
          'en': 'city hall',
        }, romaji: 'shiyakusho'),
        GuideExample('プール', {
          'id': 'kolam renang',
          'en': 'swimming pool',
        }, romaji: 'puuru'),
        GuideExample('かわ', {'id': 'sungai', 'en': 'river'}, romaji: 'kawa'),
        GuideExample('けいざい', {
          'id': 'ekonomi',
          'en': 'economy',
        }, romaji: 'keizai'),
        GuideExample('びじゅつ', {
          'id': 'seni rupa',
          'en': 'fine arts',
        }, romaji: 'bijutsu'),
        GuideExample('つり', {
          'id': 'memancing',
          'en': 'fishing',
        }, romaji: 'tsuri'),
        GuideExample('スキー', {'id': 'ski', 'en': 'skiing'}, romaji: 'sukii'),
        GuideExample('かいぎ', {'id': 'rapat', 'en': 'meeting'}, romaji: 'kaigi'),
        GuideExample('とうろく', {
          'id': 'mendaftar',
          'en': 'to register',
        }, romaji: 'touroku'),
        GuideExample('しゅうまつ', {
          'id': 'akhir pekan',
          'en': 'weekend',
        }, romaji: 'shuumatsu'),
        GuideExample('～ごろ', {
          'id': 'sekitar (waktu)',
          'en': 'about (time)',
        }, romaji: '~goro'),
        GuideExample('なにか', {
          'id': 'sesuatu',
          'en': 'something',
        }, romaji: 'nanika'),
        GuideExample('どこか', {
          'id': 'suatu tempat',
          'en': 'somewhere',
        }, romaji: 'dokoka'),
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
        GuideExample('そうですね', {
          'id': 'benar juga ya',
          'en': 'that\'s right; let me see',
        }, romaji: 'soudesune'),
        GuideExample('そうしましょう', {
          'id': 'ayo begitu saja',
          'en': 'let\'s do that',
        }, romaji: 'sou shimashou'),
        GuideExample('ごちゅうもんは', {
          'id': 'mau pesan apa?',
          'en': 'what would you like to order?',
        }, romaji: 'gochuumon wa'),
        GuideExample('ていしょく', {
          'id': 'paket makan (nasi + lauk)',
          'en': 'set meal',
        }, romaji: 'teishoku'),
        GuideExample('ぎゅうどん', {
          'id': 'nasi daging sapi',
          'en': 'beef bowl',
        }, romaji: 'gyuudon'),
        GuideExample('しょうしょうおまちください', {
          'id': 'mohon tunggu sebentar',
          'en': 'please wait a moment',
        }, romaji: 'shoushou omachi kudasai'),
      ],
    ),
    GuideSection(
      title: {'id': 'Bab 14', 'en': 'Chapter 14'},
      examples: [
        GuideExample('つけます', {
          'id': 'menyalakan',
          'en': 'to turn on',
        }, romaji: 'tsukemasu'),
        GuideExample('けします', {
          'id': 'mematikan; menghapus',
          'en': 'to turn off; to erase',
        }, romaji: 'keshimasu'),
        GuideExample('あけます', {
          'id': 'membuka',
          'en': 'to open',
        }, romaji: 'akemasu'),
        GuideExample('しめます', {
          'id': 'menutup',
          'en': 'to close',
        }, romaji: 'shimemasu'),
        GuideExample('いそぎます', {
          'id': 'bergegas',
          'en': 'to hurry',
        }, romaji: 'isogimasu'),
        GuideExample('まちます', {
          'id': 'menunggu',
          'en': 'to wait',
        }, romaji: 'machimasu'),
        GuideExample('とめます', {
          'id': 'menghentikan',
          'en': 'to stop (something)',
        }, romaji: 'tomemasu'),
        GuideExample('まがります', {
          'id': 'berbelok',
          'en': 'to turn',
        }, romaji: 'magarimasu'),
        GuideExample('もちます', {
          'id': 'membawa; memegang',
          'en': 'to hold; to have',
        }, romaji: 'mochimasu'),
        GuideExample('てつだいます', {
          'id': 'membantu',
          'en': 'to help',
        }, romaji: 'tetsudaimasu'),
        GuideExample('よびます', {
          'id': 'memanggil',
          'en': 'to call',
        }, romaji: 'yobimasu'),
        GuideExample('はなします', {
          'id': 'berbicara',
          'en': 'to speak',
        }, romaji: 'hanashimasu'),
        GuideExample('みせます', {
          'id': 'memperlihatkan',
          'en': 'to show',
        }, romaji: 'misemasu'),
        GuideExample('おしえます', {
          'id': 'mengajar',
          'en': 'to teach',
        }, romaji: 'oshiemasu'),
        GuideExample('はじめます', {
          'id': 'memulai',
          'en': 'to begin',
        }, romaji: 'hajimemasu'),
        GuideExample('ふります', {
          'id': 'turun (hujan/salju)',
          'en': 'to fall (rain/snow)',
        }, romaji: 'furimasu'),
        GuideExample('コピーします', {
          'id': 'memfotokopi',
          'en': 'to copy',
        }, romaji: 'kopiishimasu'),
        GuideExample('エアコン', {
          'id': 'AC',
          'en': 'air conditioner',
        }, romaji: 'eakon'),
        GuideExample('パスポート', {
          'id': 'paspor',
          'en': 'passport',
        }, romaji: 'pasupooto'),
        GuideExample('なまえ', {'id': 'nama', 'en': 'name'}, romaji: 'namae'),
        GuideExample('じゅうしょ', {
          'id': 'alamat',
          'en': 'address',
        }, romaji: 'juusho'),
        GuideExample('ちず', {'id': 'peta', 'en': 'map'}, romaji: 'chizu'),
        GuideExample('しお', {'id': 'garam', 'en': 'salt'}, romaji: 'shio'),
        GuideExample('さとう', {'id': 'gula', 'en': 'sugar'}, romaji: 'satou'),
        GuideExample('よみかた', {
          'id': 'cara membaca',
          'en': 'way of reading',
        }, romaji: 'yomikata'),
        GuideExample('～かた', {
          'id': 'cara ~',
          'en': 'how to ~',
        }, romaji: '~kata'),
        GuideExample('ゆっくり', {
          'id': 'pelan-pelan',
          'en': 'slowly',
        }, romaji: 'yukkuri'),
        GuideExample('すぐ', {
          'id': 'segera',
          'en': 'immediately',
        }, romaji: 'sugu'),
        GuideExample('また', {
          'id': 'lagi; juga',
          'en': 'again; also',
        }, romaji: 'mata'),
        GuideExample('あとで', {'id': 'nanti', 'en': 'later'}, romaji: 'ato de'),
        GuideExample('もうすこし', {
          'id': 'sedikit lagi',
          'en': 'a little more',
        }, romaji: 'mou sukoshi'),
        GuideExample('もう～', {'id': '~ lagi', 'en': '~ more'}, romaji: 'mou'),
        GuideExample('いいですよ', {
          'id': 'boleh / tentu saja',
          'en': 'sure, OK',
        }, romaji: 'ii desu yo'),
        GuideExample('さあ', {
          'id': 'ayo; entahlah',
          'en': 'come on; well',
        }, romaji: 'saa'),
        GuideExample('あれ', {
          'id': 'itu (jauh)',
          'en': 'that over there',
        }, romaji: 'are'),
        GuideExample('しんごうをみぎへまがってください', {
          'id': 'belok kanan di lampu merah',
          'en': 'please turn right at the traffic light',
        }, romaji: 'shingou o migi e magatte kudasai'),
        GuideExample('まっすぐ', {
          'id': 'lurus',
          'en': 'straight',
        }, romaji: 'massugu'),
        GuideExample('これでおねがいします', {
          'id': 'saya bayar dengan ini',
          'en': 'I\'ll pay with this',
        }, romaji: 'kore de onegaishimasu'),
        GuideExample('おつり', {
          'id': 'uang kembalian',
          'en': 'change (money)',
        }, romaji: 'otsuri'),
      ],
    ),
    GuideSection(
      title: {'id': 'Bab 15', 'en': 'Chapter 15'},
      examples: [
        GuideExample('たちます', {
          'id': 'berdiri',
          'en': 'to stand',
        }, romaji: 'tachimasu'),
        GuideExample('すわります', {
          'id': 'duduk',
          'en': 'to sit',
        }, romaji: 'suwarimasu'),
        GuideExample('つかいます', {
          'id': 'memakai',
          'en': 'to use',
        }, romaji: 'tsukaimasu'),
        GuideExample('おきます', {
          'id': 'menaruh; meletakkan',
          'en': 'to put, to place',
        }, romaji: 'okimasu'),
        GuideExample('つくります', {
          'id': 'membuat',
          'en': 'to make',
        }, romaji: 'tsukurimasu'),
        GuideExample('うります', {
          'id': 'menjual',
          'en': 'to sell',
        }, romaji: 'urimasu'),
        GuideExample('しります', {
          'id': 'tahu',
          'en': 'to know',
        }, romaji: 'shirimasu'),
        GuideExample('すみます', {
          'id': 'tinggal; menetap',
          'en': 'to live; to reside',
        }, romaji: 'sumimasu'),
        GuideExample('けんきゅうします', {
          'id': 'meneliti',
          'en': 'to research',
        }, romaji: 'kenkyuushimasu'),
        GuideExample('しりません', {
          'id': 'tidak tahu',
          'en': 'I don\'t know',
        }, romaji: 'shirimasen'),
        GuideExample('すんでいます', {
          'id': 'tinggal (di suatu tempat)',
          'en': 'to live (in)',
        }, romaji: 'sundeimasu'),
        GuideExample('しりょう', {
          'id': 'bahan / data',
          'en': 'materials, data',
        }, romaji: 'shiryou'),
        GuideExample('カタログ', {
          'id': 'katalog',
          'en': 'catalog',
        }, romaji: 'katarogu'),
        GuideExample('じこくひょう', {
          'id': 'jadwal (kereta, bus)',
          'en': 'timetable',
        }, romaji: 'jikokuhyou'),
        GuideExample('ふく', {'id': 'baju', 'en': 'clothes'}, romaji: 'fuku'),
        GuideExample('せいひん', {
          'id': 'produk',
          'en': 'product',
        }, romaji: 'seihin'),
        GuideExample('ソフト', {
          'id': 'perangkat lunak',
          'en': 'software',
        }, romaji: 'sofuto'),
        GuideExample('せんもん', {
          'id': 'bidang keahlian',
          'en': 'specialty',
        }, romaji: 'senmon'),
        GuideExample('はいしゃ', {
          'id': 'dokter gigi',
          'en': 'dentist',
        }, romaji: 'haisha'),
        GuideExample('とこや', {
          'id': 'tukang cukur',
          'en': 'barbershop',
        }, romaji: 'tokoya'),
        GuideExample('プレイガイド', {
          'id': 'agen tiket',
          'en': 'ticket agency',
        }, romaji: 'pureigaido'),
        GuideExample('どくしん', {
          'id': 'lajang / belum menikah',
          'en': 'single (unmarried)',
        }, romaji: 'dokushin'),
        GuideExample('とくに', {
          'id': 'khususnya',
          'en': 'especially',
        }, romaji: 'tokuni'),
        GuideExample('おもいだします', {
          'id': 'teringat',
          'en': 'to recall',
        }, romaji: 'omoidashimasu'),
        GuideExample('ごかぞく', {
          'id': 'keluarga (orang lain, sopan)',
          'en': '(your) family',
        }, romaji: 'gokazoku'),
        GuideExample('いらっしゃいます', {
          'id': 'ada / datang / pergi (hormat)',
          'en': 'to be, come, go (honorific)',
        }, romaji: 'irasshaimasu'),
        GuideExample('こうこう', {
          'id': 'SMA',
          'en': 'high school',
        }, romaji: 'koukou'),
      ],
    ),
    GuideSection(
      title: {'id': 'Bab 16', 'en': 'Chapter 16'},
      examples: [
        GuideExample('のります', {
          'id': 'naik (kendaraan)',
          'en': 'to ride; to get on',
        }, romaji: 'norimasu'),
        GuideExample('おります', {
          'id': 'turun (dari kendaraan)',
          'en': 'to get off',
        }, romaji: 'orimasu'),
        GuideExample('のりかえます', {
          'id': 'ganti kendaraan',
          'en': 'to transfer',
        }, romaji: 'norikaemasu'),
        GuideExample('あびます', {
          'id': 'mandi (shower)',
          'en': 'to bathe; to shower',
        }, romaji: 'abimasu'),
        GuideExample('いれます', {
          'id': 'memasukkan',
          'en': 'to put in',
        }, romaji: 'iremasu'),
        GuideExample('だします', {
          'id': 'mengeluarkan; mengirim (surat)',
          'en': 'to take out; to send',
        }, romaji: 'dashimasu'),
        GuideExample('でます', {
          'id': 'keluar',
          'en': 'to go out; to leave',
        }, romaji: 'demasu'),
        GuideExample('やめます', {
          'id': 'berhenti',
          'en': 'to quit',
        }, romaji: 'yamemasu'),
        GuideExample('おします', {
          'id': 'mendorong; menekan',
          'en': 'to push; to press',
        }, romaji: 'oshimasu'),
        GuideExample('わかい', {'id': 'muda', 'en': 'young'}, romaji: 'wakai'),
        GuideExample('ながい', {'id': 'panjang', 'en': 'long'}, romaji: 'nagai'),
        GuideExample('みじかい', {
          'id': 'pendek',
          'en': 'short',
        }, romaji: 'mijikai'),
        GuideExample('あかるい', {
          'id': 'terang; ceria',
          'en': 'bright; cheerful',
        }, romaji: 'akarui'),
        GuideExample('くらい', {'id': 'gelap', 'en': 'dark'}, romaji: 'kurai'),
        GuideExample('せがたかい', {
          'id': 'bertubuh tinggi',
          'en': 'tall (person)',
        }, romaji: 'se ga takai'),
        GuideExample('あたまがいい', {
          'id': 'pintar',
          'en': 'smart',
        }, romaji: 'atama ga ii'),
        GuideExample('からだ', {'id': 'tubuh', 'en': 'body'}, romaji: 'karada'),
        GuideExample('あたま', {'id': 'kepala', 'en': 'head'}, romaji: 'atama'),
        GuideExample('かみ', {'id': 'rambut', 'en': 'hair'}, romaji: 'kami'),
        GuideExample('かお', {'id': 'wajah', 'en': 'face'}, romaji: 'kao'),
        GuideExample('め', {'id': 'mata', 'en': 'eye'}, romaji: 'me'),
        GuideExample('みみ', {'id': 'telinga', 'en': 'ear'}, romaji: 'mimi'),
        GuideExample('くち', {'id': 'mulut', 'en': 'mouth'}, romaji: 'kuchi'),
        GuideExample('は', {'id': 'gigi', 'en': 'tooth'}, romaji: 'ha'),
        GuideExample('おなか', {'id': 'perut', 'en': 'stomach'}, romaji: 'onaka'),
        GuideExample('あし', {'id': 'kaki', 'en': 'leg; foot'}, romaji: 'ashi'),
        GuideExample('サービス', {
          'id': 'pelayanan',
          'en': 'service',
        }, romaji: 'saabisu'),
        GuideExample('ジョギング', {
          'id': 'jogging',
          'en': 'jogging',
        }, romaji: 'jogingu'),
        GuideExample('シャワー', {
          'id': 'pancuran (shower)',
          'en': 'shower',
        }, romaji: 'shawaa'),
        GuideExample('みどり', {'id': 'hijau', 'en': 'green'}, romaji: 'midori'),
        GuideExample('おてら', {
          'id': 'kuil Buddha',
          'en': 'Buddhist temple',
        }, romaji: 'otera'),
        GuideExample('じんじゃ', {
          'id': 'kuil Shinto',
          'en': 'Shinto shrine',
        }, romaji: 'jinja'),
        GuideExample('りゅうがくせい', {
          'id': 'pelajar asing',
          'en': 'foreign student',
        }, romaji: 'ryuugakusei'),
        GuideExample('～ばん', {
          'id': 'nomor ke-~',
          'en': 'number ~',
        }, romaji: '~ban'),
        GuideExample('どうやって', {
          'id': 'bagaimana caranya',
          'en': 'how (by what means)',
        }, romaji: 'douyatte'),
        GuideExample('どの', {
          'id': '~ yang mana',
          'en': 'which (+ noun)',
        }, romaji: 'dono'),
        GuideExample('～です', {
          'id': '(penjelasan) ~ adalah',
          'en': 'it\'s ~ (explanation)',
        }, romaji: '~ desu'),
        GuideExample('おひきだしですか', {
          'id': 'mau tarik uang?',
          'en': 'are you making a withdrawal?',
        }, romaji: 'ohikidashi desu ka'),
        GuideExample('まず', {
          'id': 'pertama-tama',
          'en': 'first of all',
        }, romaji: 'mazu'),
        GuideExample('キャッシュカード', {
          'id': 'kartu ATM',
          'en': 'bank card',
        }, romaji: 'kyasshu kaado'),
        GuideExample('あんしょうばんごう', {
          'id': 'nomor PIN',
          'en': 'PIN number',
        }, romaji: 'anshou bangou'),
        GuideExample('つぎに', {
          'id': 'selanjutnya',
          'en': 'next',
        }, romaji: 'tsugi ni'),
        GuideExample('きんがく', {
          'id': 'jumlah uang',
          'en': 'amount of money',
        }, romaji: 'kingaku'),
        GuideExample('かくにん', {
          'id': 'mengonfirmasi',
          'en': 'to verify',
        }, romaji: 'kakunin'),
        GuideExample('ボタン', {
          'id': 'kancing; tombol',
          'en': 'button',
        }, romaji: 'botan'),
      ],
    ),
    GuideSection(
      title: {'id': 'Bab 17', 'en': 'Chapter 17'},
      examples: [
        GuideExample('おぼえます', {
          'id': 'mengingat',
          'en': 'to memorize',
        }, romaji: 'oboemasu'),
        GuideExample('わすれます', {
          'id': 'lupa',
          'en': 'to forget',
        }, romaji: 'wasuremasu'),
        GuideExample('なくします', {
          'id': 'kehilangan',
          'en': 'to lose',
        }, romaji: 'nakushimasu'),
        GuideExample('だします', {
          'id': 'mengeluarkan; mengirim (surat)',
          'en': 'to take out; to send',
        }, romaji: 'dashimasu'),
        GuideExample('はらいます', {
          'id': 'membayar',
          'en': 'to pay',
        }, romaji: 'haraimasu'),
        GuideExample('かえします', {
          'id': 'mengembalikan',
          'en': 'to return (something)',
        }, romaji: 'kaeshimasu'),
        GuideExample('ぬぎます', {
          'id': 'melepas (pakaian/sepatu)',
          'en': 'to take off (clothes)',
        }, romaji: 'nugimasu'),
        GuideExample('もっていきます', {
          'id': 'membawa pergi (barang)',
          'en': 'to take (something)',
        }, romaji: 'motteikimasu'),
        GuideExample('もってきます', {
          'id': 'membawa datang (barang)',
          'en': 'to bring (something)',
        }, romaji: 'mottekimasu'),
        GuideExample('しんぱいします', {
          'id': 'khawatir',
          'en': 'to worry',
        }, romaji: 'shinpaishimasu'),
        GuideExample('ざんぎょうします', {
          'id': 'lembur',
          'en': 'overtime work',
        }, romaji: 'zangyoushimasu'),
        GuideExample('しゅっちょうします', {
          'id': 'dinas luar kota',
          'en': 'business trip',
        }, romaji: 'shutchoushimasu'),
        GuideExample('くすりをのみます', {
          'id': 'minum obat',
          'en': 'to take medicine',
        }, romaji: 'kusuri o nomimasu'),
        GuideExample('おふろにはいります', {
          'id': 'mandi berendam',
          'en': 'to take a bath',
        }, romaji: 'ofuro ni hairimasu'),
        GuideExample('たいせつ', {
          'id': 'penting',
          'en': 'important',
        }, romaji: 'taisetsu'),
        GuideExample('だいじょうぶ', {
          'id': 'tidak apa-apa',
          'en': 'all right',
        }, romaji: 'daijoubu'),
        GuideExample('あぶない', {
          'id': 'berbahaya; awas',
          'en': 'dangerous',
        }, romaji: 'abunai'),
        GuideExample('もんだい', {
          'id': 'masalah; soal',
          'en': 'problem',
        }, romaji: 'mondai'),
        GuideExample('こたえ', {'id': 'jawaban', 'en': 'answer'}, romaji: 'kotae'),
        GuideExample('きんえん', {
          'id': 'dilarang merokok',
          'en': 'no smoking',
        }, romaji: 'kin\'en'),
        GuideExample('けんこうほけんしょう', {
          'id': 'kartu asuransi kesehatan',
          'en': 'health insurance card',
        }, romaji: 'kenkou hokenshou'),
        GuideExample('かぜ', {'id': 'angin', 'en': 'wind'}, romaji: 'kaze'),
        GuideExample('ねつ', {
          'id': 'demam; panas',
          'en': 'fever; heat',
        }, romaji: 'netsu'),
        GuideExample('びょうき', {
          'id': 'sakit; penyakit',
          'en': 'illness',
        }, romaji: 'byouki'),
        GuideExample('くすり', {'id': 'obat', 'en': 'medicine'}, romaji: 'kusuri'),
        GuideExample('おふろ', {
          'id': 'kamar mandi',
          'en': 'bath',
        }, romaji: 'ofuro'),
        GuideExample('うわぎ', {
          'id': 'jaket; baju luar',
          'en': 'jacket',
        }, romaji: 'uwagi'),
        GuideExample('したぎ', {
          'id': 'pakaian dalam',
          'en': 'underwear',
        }, romaji: 'shitagi'),
        GuideExample('せんせい', {'id': 'guru', 'en': 'teacher'}, romaji: 'sensei'),
        GuideExample('～までに', {
          'id': 'sebelum ~ / paling lambat ~',
          'en': 'by ~ (deadline)',
        }, romaji: '~madeni'),
        GuideExample('ですから', {
          'id': 'oleh karena itu',
          'en': 'therefore',
        }, romaji: 'desukara'),
        GuideExample('どうしましたか', {
          'id': 'ada apa? / kenapa?',
          'en': 'what\'s wrong?',
        }, romaji: 'dou shimashita ka'),
        GuideExample('～がいたいです', {
          'id': '~ saya sakit',
          'en': 'my ~ hurts',
        }, romaji: '~ga itai desu'),
        GuideExample('おだいじに', {
          'id': 'semoga lekas sembuh',
          'en': 'get well soon',
        }, romaji: 'odaiji ni'),
      ],
    ),
    GuideSection(
      title: {'id': 'Bab 18', 'en': 'Chapter 18'},
      examples: [
        GuideExample('できます', {
          'id': 'bisa; dapat; jadi',
          'en': 'can; to be able; to be done',
        }, romaji: 'dekimasu'),
        GuideExample('あらいます', {
          'id': 'mencuci',
          'en': 'to wash',
        }, romaji: 'araimasu'),
        GuideExample('ひきます', {
          'id': 'memainkan (alat musik)',
          'en': 'to play (an instrument)',
        }, romaji: 'hikimasu'),
        GuideExample('うたいます', {
          'id': 'bernyanyi',
          'en': 'to sing',
        }, romaji: 'utaimasu'),
        GuideExample('あつめます', {
          'id': 'mengumpulkan',
          'en': 'to collect',
        }, romaji: 'atsumemasu'),
        GuideExample('すてます', {
          'id': 'membuang',
          'en': 'to throw away',
        }, romaji: 'sutemasu'),
        GuideExample('かえます', {
          'id': 'menukar; mengganti',
          'en': 'to change, exchange',
        }, romaji: 'kaemasu'),
        GuideExample('うんてんします', {
          'id': 'mengemudi',
          'en': 'to drive',
        }, romaji: 'untenshimasu'),
        GuideExample('よやくします', {
          'id': 'memesan',
          'en': 'to reserve',
        }, romaji: 'yoyakushimasu'),
        GuideExample('けんがくします', {
          'id': 'kunjungan belajar',
          'en': 'to visit and observe',
        }, romaji: 'kengakushimasu'),
        GuideExample('ピアノ', {'id': 'piano', 'en': 'piano'}, romaji: 'piano'),
        GuideExample('～メートル', {
          'id': 'meter',
          'en': 'meter',
        }, romaji: '~meetoru'),
        GuideExample('こくさい', {
          'id': 'internasional',
          'en': 'international',
        }, romaji: 'kokusai'),
        GuideExample('げんきん', {
          'id': 'uang tunai',
          'en': 'cash',
        }, romaji: 'genkin'),
        GuideExample('しゅみ', {'id': 'hobi', 'en': 'hobby'}, romaji: 'shumi'),
        GuideExample('にっき', {
          'id': 'buku harian',
          'en': 'diary',
        }, romaji: 'nikki'),
        GuideExample('おいのり', {'id': 'doa', 'en': 'prayer'}, romaji: 'oinori'),
        GuideExample('かちょう', {
          'id': 'kepala bagian',
          'en': 'section manager',
        }, romaji: 'kachou'),
        GuideExample('ぶちょう', {
          'id': 'kepala departemen',
          'en': 'department manager',
        }, romaji: 'buchou'),
        GuideExample('しゃちょう', {
          'id': 'direktur',
          'en': 'company president',
        }, romaji: 'shachou'),
        GuideExample('どうぶつ', {
          'id': 'hewan',
          'en': 'animal',
        }, romaji: 'doubutsu'),
        GuideExample('うま', {'id': 'kuda', 'en': 'horse'}, romaji: 'uma'),
        GuideExample('へえ', {
          'id': 'oh ya? wah (tertarik)',
          'en': 'oh really? huh (interested)',
        }, romaji: 'hee'),
        GuideExample('それはおもしろいですね', {
          'id': 'wah, itu menarik ya',
          'en': 'that\'s interesting',
        }, romaji: 'sore wa omoshiroi desu ne'),
        GuideExample('なかなか', {
          'id': 'cukup; (tidak) mudah',
          'en': 'quite; (not) easily',
        }, romaji: 'nakanaka'),
        GuideExample('ぼくじょう', {
          'id': 'peternakan',
          'en': 'ranch / farm',
        }, romaji: 'bokujou'),
        GuideExample('ほんとうですか', {
          'id': 'benarkah? (sopan)',
          'en': 'really? is that true? (polite)',
        }, romaji: 'hontou desu ka'),
      ],
    ),
    GuideSection(
      title: {'id': 'Bab 19', 'en': 'Chapter 19'},
      examples: [
        GuideExample('のぼります', {
          'id': 'mendaki; naik',
          'en': 'to climb',
        }, romaji: 'noborimasu'),
        GuideExample('とまります', {
          'id': 'menginap',
          'en': 'to stay (overnight)',
        }, romaji: 'tomarimasu'),
        GuideExample('そうじします', {
          'id': 'membersihkan',
          'en': 'to clean',
        }, romaji: 'soujishimasu'),
        GuideExample('せんたくします', {
          'id': 'mencuci pakaian',
          'en': 'to do laundry',
        }, romaji: 'sentakushimasu'),
        GuideExample('れんしゅうします', {
          'id': 'berlatih',
          'en': 'to practice',
        }, romaji: 'renshuushimasu'),
        GuideExample('なります', {
          'id': 'menjadi',
          'en': 'to become',
        }, romaji: 'narimasu'),
        GuideExample('ねむい', {
          'id': 'mengantuk',
          'en': 'sleepy',
        }, romaji: 'nemui'),
        GuideExample('つよい', {'id': 'kuat', 'en': 'strong'}, romaji: 'tsuyoi'),
        GuideExample('よわい', {'id': 'lemah', 'en': 'weak'}, romaji: 'yowai'),
        GuideExample('ちょうしがいい', {
          'id': 'kondisinya bagus',
          'en': 'in good condition',
        }, romaji: 'choushi ga ii'),
        GuideExample('ちょうしがわるい', {
          'id': 'kondisinya buruk',
          'en': 'in bad condition',
        }, romaji: 'choushi ga warui'),
        GuideExample('ちょうし', {
          'id': 'kondisi',
          'en': 'condition',
        }, romaji: 'choushi'),
        GuideExample('ゴルフ', {'id': 'golf', 'en': 'golf'}, romaji: 'gorufu'),
        GuideExample('すもう', {
          'id': 'sumo',
          'en': 'sumo wrestling',
        }, romaji: 'sumou'),
        GuideExample('パチンコ', {
          'id': 'pachinko',
          'en': 'pachinko',
        }, romaji: 'pachinko'),
        GuideExample('おちゃ', {'id': 'teh', 'en': 'tea'}, romaji: 'ocha'),
        GuideExample('ひ', {
          'id': 'hari; tanggal',
          'en': 'day, date',
        }, romaji: 'hi'),
        GuideExample('いちど', {'id': 'sekali', 'en': 'once'}, romaji: 'ichido'),
        GuideExample('いちども', {
          'id': 'tidak pernah sekali pun (+ negatif)',
          'en': 'never once (+ negative)',
        }, romaji: 'ichido mo'),
        GuideExample('だんだん', {
          'id': 'berangsur-angsur',
          'en': 'gradually',
        }, romaji: 'dandan'),
        GuideExample('もうすぐ', {
          'id': 'sebentar lagi',
          'en': 'soon',
        }, romaji: 'mousugu'),
        GuideExample('おかげさまで', {
          'id': 'berkat Anda (saya baik-baik saja)',
          'en': 'thanks to you',
        }, romaji: 'okagesama de'),
        GuideExample('かんぱい', {
          'id': 'bersulang!',
          'en': 'cheers!',
        }, romaji: 'kanpai'),
        GuideExample('じつは', {
          'id': 'sebenarnya',
          'en': 'actually',
        }, romaji: 'jitsu wa'),
        GuideExample('ダイエット', {
          'id': 'berdiet',
          'en': 'to go on a diet',
        }, romaji: 'daietto'),
        GuideExample('なんかいも', {
          'id': 'berkali-kali',
          'en': 'many times',
        }, romaji: 'nankai mo'),
        GuideExample('しかし', {
          'id': 'akan tetapi',
          'en': 'however',
        }, romaji: 'shikashi'),
        GuideExample('むり', {
          'id': 'mustahil / terlalu memaksa',
          'en': 'impossible, unreasonable',
        }, romaji: 'muri'),
        GuideExample('からだにいい', {
          'id': 'baik untuk kesehatan',
          'en': 'good for your health',
        }, romaji: 'karada ni ii'),
        GuideExample('ケーキ', {'id': 'kue', 'en': 'cake'}, romaji: 'keeki'),
      ],
    ),
    GuideSection(
      title: {'id': 'Bab 20', 'en': 'Chapter 20'},
      examples: [
        GuideExample('いります', {
          'id': 'memerlukan',
          'en': 'to need',
        }, romaji: 'irimasu'),
        GuideExample('しらべます', {
          'id': 'memeriksa',
          'en': 'to investigate',
        }, romaji: 'shirabemasu'),
        GuideExample('なおします', {
          'id': 'memperbaiki',
          'en': 'to fix',
        }, romaji: 'naoshimasu'),
        GuideExample('しゅうりします', {
          'id': 'mereparasi (servis)',
          'en': 'to repair',
        }, romaji: 'shuurishimasu'),
        GuideExample('でんわします', {
          'id': 'menelepon',
          'en': 'to make a phone call',
        }, romaji: 'denwashimasu'),
        GuideExample('ぼく', {
          'id': 'aku (pria)',
          'en': 'I (male)',
        }, romaji: 'boku'),
        GuideExample('きみ', {
          'id': 'kamu (akrab)',
          'en': 'you (familiar)',
        }, romaji: 'kimi'),
        GuideExample('～くん', {
          'id': 'akhiran untuk anak laki-laki / bawahan',
          'en': 'suffix for boys, juniors',
        }, romaji: '~kun'),
        GuideExample('うん', {
          'id': 'iya/he\'eh (tanda menyimak, santai)',
          'en': 'yeah/uh-huh (casual listening cue)',
        }, romaji: 'un'),
        GuideExample('ううん', {
          'id': 'tidak (santai)',
          'en': 'no (casual)',
        }, romaji: 'uun'),
        GuideExample('サラリーマン', {
          'id': 'karyawan kantoran',
          'en': 'office worker',
        }, romaji: 'sarariiman'),
        GuideExample('ことば', {
          'id': 'kata; bahasa',
          'en': 'word; language',
        }, romaji: 'kotoba'),
        GuideExample('ぶっか', {
          'id': 'harga barang (biaya hidup)',
          'en': 'prices, cost of living',
        }, romaji: 'bukka'),
        GuideExample('きもの', {'id': 'kimono', 'en': 'kimono'}, romaji: 'kimono'),
        GuideExample('ビザ', {'id': 'visa', 'en': 'visa'}, romaji: 'biza'),
        GuideExample('はじめ', {
          'id': 'awal; permulaan',
          'en': 'beginning',
        }, romaji: 'hajime'),
        GuideExample('おわり', {'id': 'akhir', 'en': 'end'}, romaji: 'owari'),
        GuideExample('こっち', {
          'id': 'sebelah sini (santai)',
          'en': 'this way (casual)',
        }, romaji: 'kocchi'),
        GuideExample('あっち', {
          'id': 'sebelah sana (santai)',
          'en': 'over there (casual)',
        }, romaji: 'acchi'),
        GuideExample('どっち', {
          'id': 'yang mana (santai)',
          'en': 'which (casual)',
        }, romaji: 'docchi'),
        GuideExample('このあいだ', {
          'id': 'beberapa waktu lalu',
          'en': 'the other day',
        }, romaji: 'konoaida'),
        GuideExample('みんなで', {
          'id': 'bersama-sama (semua)',
          'en': 'all together',
        }, romaji: 'minna de'),
        GuideExample('～けど', {'id': '~, tapi', 'en': '~, but'}, romaji: '~kedo'),
        GuideExample('くにへかえるの', {
          'id': 'mau pulang ke negara asal?',
          'en': 'going back to your country?',
        }, romaji: 'kuni e kaeru no'),
        GuideExample('どうするの', {
          'id': 'mau bagaimana?',
          'en': 'what will you do?',
        }, romaji: 'dousuruno'),
        GuideExample('どうしようかな', {
          'id': 'bagaimana ya?',
          'en': 'what should I do?',
        }, romaji: 'doushiyoukana'),
        GuideExample('よかったら', {
          'id': 'kalau berkenan',
          'en': 'if you like',
        }, romaji: 'yokattara'),
        GuideExample('いろいろ', {
          'id': 'bermacam-macam',
          'en': 'various',
        }, romaji: 'iroiro'),
      ],
    ),
    GuideSection(
      title: {'id': 'Bab 21', 'en': 'Chapter 21'},
      examples: [
        GuideExample('おもいます', {
          'id': 'berpikir / merasa',
          'en': 'to think',
        }, romaji: 'omoimasu'),
        GuideExample('いいます', {
          'id': 'berkata',
          'en': 'to say',
        }, romaji: 'iimasu'),
        GuideExample('たります', {
          'id': 'mencukupi',
          'en': 'to be enough',
        }, romaji: 'tarimasu'),
        GuideExample('かちます', {
          'id': 'menang',
          'en': 'to win',
        }, romaji: 'kachimasu'),
        GuideExample('まけます', {
          'id': 'kalah',
          'en': 'to lose (a game)',
        }, romaji: 'makemasu'),
        GuideExample('あります', {
          'id': 'ada; diadakan (acara)',
          'en': 'to be held (event)',
        }, romaji: 'arimasu'),
        GuideExample('やくにたちます', {
          'id': 'berguna',
          'en': 'to be useful',
        }, romaji: 'yaku ni tachimasu'),
        GuideExample('むだ', {
          'id': 'sia-sia',
          'en': 'useless; wasteful',
        }, romaji: 'muda'),
        GuideExample('ふべん', {
          'id': 'tidak praktis',
          'en': 'inconvenient',
        }, romaji: 'fuben'),
        GuideExample('おなじ', {'id': 'sama', 'en': 'same'}, romaji: 'onaji'),
        GuideExample('すごい', {'id': 'hebat', 'en': 'amazing'}, romaji: 'sugoi'),
        GuideExample('しゅしょう', {
          'id': 'perdana menteri',
          'en': 'prime minister',
        }, romaji: 'shushou'),
        GuideExample('だいとうりょう', {
          'id': 'presiden',
          'en': 'president',
        }, romaji: 'daitouryou'),
        GuideExample('せいじ', {
          'id': 'politik',
          'en': 'politics',
        }, romaji: 'seiji'),
        GuideExample('ニュース', {'id': 'berita', 'en': 'news'}, romaji: 'nyuusu'),
        GuideExample('スピーチ', {
          'id': 'pidato',
          'en': 'speech',
        }, romaji: 'supiichi'),
        GuideExample('アルバイト', {
          'id': 'kerja paruh waktu',
          'en': 'part-time job',
        }, romaji: 'arubaito'),
        GuideExample('いけん', {
          'id': 'pendapat',
          'en': 'opinion',
        }, romaji: 'iken'),
        GuideExample('おはなし', {
          'id': 'cerita / pembicaraan',
          'en': 'story, talk',
        }, romaji: 'ohanashi'),
        GuideExample('ユーモア', {'id': 'humor', 'en': 'humor'}, romaji: 'yuumoa'),
        GuideExample('むだ', {
          'id': 'sia-sia',
          'en': 'useless; wasteful',
        }, romaji: 'muda'),
        GuideExample('デザイン', {
          'id': 'desain',
          'en': 'design',
        }, romaji: 'dezain'),
        GuideExample('こうつう', {
          'id': 'lalu lintas',
          'en': 'traffic',
        }, romaji: 'koutsuu'),
        GuideExample('ラッシュ', {
          'id': 'jam sibuk',
          'en': 'rush hour',
        }, romaji: 'rasshu'),
        GuideExample('さいきん', {
          'id': 'baru-baru ini',
          'en': 'recently',
        }, romaji: 'saikin'),
        GuideExample('たぶん', {
          'id': 'mungkin',
          'en': 'probably',
        }, romaji: 'tabun'),
        GuideExample('きっと', {
          'id': 'pasti (yakin)',
          'en': 'surely',
        }, romaji: 'kitto'),
        GuideExample('ほんとうに', {
          'id': 'sungguh-sungguh',
          'en': 'truly',
        }, romaji: 'hontouni'),
        GuideExample('そんなに', {
          'id': 'sebegitu',
          'en': 'so much',
        }, romaji: 'sonnani'),
        GuideExample('～について', {
          'id': 'tentang ~',
          'en': 'about ~',
        }, romaji: '~nitsuite'),
        GuideExample('しかたがありません', {
          'id': 'apa boleh buat',
          'en': 'it can\'t be helped',
        }, romaji: 'shikata ga arimasen'),
        GuideExample('しばらくですね', {
          'id': 'lama tidak bertemu ya',
          'en': 'long time no see',
        }, romaji: 'shibaraku desu ne'),
        GuideExample('～でものみませんか', {
          'id': 'bagaimana kalau minum ~?',
          'en': 'how about drinking ~?',
        }, romaji: '~demo nomimasen ka'),
        GuideExample('みないと', {
          'id': 'kalau tidak melihat…',
          'en': 'unless I see…',
        }, romaji: 'minai to'),
        GuideExample('もちろん', {
          'id': 'tentu saja',
          'en': 'of course',
        }, romaji: 'mochiron'),
      ],
    ),
    GuideSection(
      title: {'id': 'Bab 22', 'en': 'Chapter 22'},
      examples: [
        GuideExample('きます', {
          'id': 'memakai (baju atasan)',
          'en': 'to wear (upper body)',
        }, romaji: 'kimasu'),
        GuideExample('はきます', {
          'id': 'memakai (celana/sepatu)',
          'en': 'to wear (lower body)',
        }, romaji: 'hakimasu'),
        GuideExample('かぶります', {
          'id': 'memakai (topi)',
          'en': 'to wear (hat)',
        }, romaji: 'kaburimasu'),
        GuideExample('かけます', {
          'id': 'menelepon; memakai (kacamata); menggantung',
          'en': 'to call; to wear (glasses); to hang',
        }, romaji: 'kakemasu'),
        GuideExample('うまれます', {
          'id': 'lahir',
          'en': 'to be born',
        }, romaji: 'umaremasu'),
        GuideExample('コート', {'id': 'mantel', 'en': 'coat'}, romaji: 'kooto'),
        GuideExample('スーツ', {
          'id': 'setelan jas',
          'en': 'suit',
        }, romaji: 'suutsu'),
        GuideExample('セーター', {
          'id': 'sweter',
          'en': 'sweater',
        }, romaji: 'seetaa'),
        GuideExample('ぼうし', {'id': 'topi', 'en': 'hat'}, romaji: 'boushi'),
      ],
    ),
    GuideSection(
      title: {'id': 'Bab 23', 'en': 'Chapter 23'},
      examples: [
        GuideExample('ききます', {
          'id': 'mendengar; bertanya',
          'en': 'to listen; to ask',
        }, romaji: 'kikimasu'),
        GuideExample('まわします', {
          'id': 'memutar',
          'en': 'to turn (something)',
        }, romaji: 'mawashimasu'),
        GuideExample('ひきます', {
          'id': 'menarik; mengidap (flu)',
          'en': 'to pull; to catch (a cold)',
        }, romaji: 'hikimasu'),
        GuideExample('かえます', {
          'id': 'menukar; mengganti',
          'en': 'to change, exchange',
        }, romaji: 'kaemasu'),
        GuideExample('さわります', {
          'id': 'menyentuh',
          'en': 'to touch',
        }, romaji: 'sawarimasu'),
        GuideExample('でます', {
          'id': 'keluar',
          'en': 'to go out; to leave',
        }, romaji: 'demasu'),
        GuideExample('うごきます', {
          'id': 'bergerak',
          'en': 'to move (intr.)',
        }, romaji: 'ugokimasu'),
        GuideExample('あるきます', {
          'id': 'berjalan',
          'en': 'to walk',
        }, romaji: 'arukimasu'),
        GuideExample('きをつけます', {
          'id': 'berhati-hati',
          'en': 'to be careful',
        }, romaji: 'ki o tsukemasu'),
        GuideExample('ひっこしします', {
          'id': 'pindah rumah',
          'en': 'to move house',
        }, romaji: 'hikkoshishimasu'),
        GuideExample('でんきや', {
          'id': 'toko elektronik',
          'en': 'electronics store',
        }, romaji: 'denkiya'),
        GuideExample('～や', {'id': 'toko ~', 'en': '~ shop'}, romaji: '~ya'),
        GuideExample('サイズ', {'id': 'ukuran', 'en': 'size'}, romaji: 'saizu'),
        GuideExample('おと', {'id': 'bunyi', 'en': 'sound'}, romaji: 'oto'),
        GuideExample('きかい', {'id': 'mesin', 'en': 'machine'}, romaji: 'kikai'),
        GuideExample('つまみ', {
          'id': 'kenop / tombol putar',
          'en': 'knob',
        }, romaji: 'tsumami'),
        GuideExample('こしょう', {
          'id': 'merica',
          'en': 'pepper',
        }, romaji: 'koshou'),
        GuideExample('みち', {'id': 'jalan', 'en': 'road; way'}, romaji: 'michi'),
        GuideExample('こうさてん', {
          'id': 'perempatan',
          'en': 'intersection',
        }, romaji: 'kousaten'),
        GuideExample('しんごう', {
          'id': 'lampu lalu lintas',
          'en': 'traffic light',
        }, romaji: 'shingou'),
        GuideExample('かど', {
          'id': 'sudut; tikungan',
          'en': 'corner',
        }, romaji: 'kado'),
        GuideExample('はし', {'id': 'jembatan', 'en': 'bridge'}, romaji: 'hashi'),
        GuideExample('ちゅうしゃじょう', {
          'id': 'tempat parkir',
          'en': 'parking lot',
        }, romaji: 'chuushajou'),
        GuideExample('いちにち', {
          'id': 'satu hari',
          'en': 'one day',
        }, romaji: 'ichinichi'),
        GuideExample('おしょうがつ', {
          'id': 'Tahun Baru',
          'en': 'New Year',
        }, romaji: 'oshougatsu'),
        GuideExample('ごちそうさまでした', {
          'id': 'terima kasih atas makanannya',
          'en': 'said after eating',
        }, romaji: 'gochisousama deshita'),
        GuideExample('たてもの', {
          'id': 'bangunan',
          'en': 'building',
        }, romaji: 'tatemono'),
        GuideExample('がいこくじんとうろくしょう', {
          'id': 'kartu registrasi orang asing',
          'en': 'alien registration card',
        }, romaji: 'gaikokujin tourokushou'),
      ],
    ),
    GuideSection(
      title: {'id': 'Bab 24', 'en': 'Chapter 24'},
      examples: [
        GuideExample('くれます', {
          'id': 'memberi (kepada saya)',
          'en': 'to give (to me)',
        }, romaji: 'kuremasu'),
        GuideExample('つれていきます', {
          'id': 'mengajak pergi (orang)',
          'en': 'to take (someone) along',
        }, romaji: 'tsureteikimasu'),
        GuideExample('つれてきます', {
          'id': 'membawa datang (orang)',
          'en': 'to bring (someone)',
        }, romaji: 'tsuretekimasu'),
        GuideExample('おくります', {
          'id': 'mengirim',
          'en': 'to send',
        }, romaji: 'okurimasu'),
        GuideExample('しょうかいします', {
          'id': 'memperkenalkan',
          'en': 'to introduce',
        }, romaji: 'shoukaishimasu'),
        GuideExample('あんないします', {
          'id': 'memandu',
          'en': 'to guide',
        }, romaji: 'annaishimasu'),
        GuideExample('せつめいします', {
          'id': 'menjelaskan',
          'en': 'to explain',
        }, romaji: 'setsumeishimasu'),
        GuideExample('いれます', {
          'id': 'membuat / menyeduh (kopi, teh)',
          'en': 'to make (coffee, tea)',
        }, romaji: 'iremasu'),
        GuideExample('おじいさん・おじいちゃん', {
          'id': 'kakek',
          'en': 'grandfather',
        }, romaji: 'ojiisan / ojiichan'),
        GuideExample('おばあさん・おばあちゃん', {
          'id': 'nenek',
          'en': 'grandmother',
        }, romaji: 'obaasan / obaachan'),
        GuideExample('じゅんび', {
          'id': 'persiapan',
          'en': 'preparation',
        }, romaji: 'junbi'),
        GuideExample('いみ', {'id': 'arti', 'en': 'meaning'}, romaji: 'imi'),
        GuideExample('おかし', {
          'id': 'kudapan; manisan',
          'en': 'sweets; snack',
        }, romaji: 'okashi'),
        GuideExample('ぜんぶ', {'id': 'semuanya', 'en': 'all'}, romaji: 'zenbu'),
        GuideExample('じぶんで', {
          'id': 'sendiri',
          'en': 'by oneself',
        }, romaji: 'jibun de'),
        GuideExample('ほかに', {
          'id': 'selain itu / lainnya',
          'en': 'besides, else',
        }, romaji: 'hoka ni'),
        GuideExample('ワゴンしゃ', {
          'id': 'mobil van',
          'en': 'station wagon',
        }, romaji: 'wagonsha'),
        GuideExample('おべんとう', {
          'id': 'bekal makanan',
          'en': 'boxed lunch',
        }, romaji: 'obentou'),
      ],
    ),
    GuideSection(
      title: {'id': 'Bab 25', 'en': 'Chapter 25'},
      examples: [
        GuideExample('かんがえます', {
          'id': 'memikirkan',
          'en': 'to think',
        }, romaji: 'kangaemasu'),
        GuideExample('つきます', {
          'id': 'tiba',
          'en': 'to arrive',
        }, romaji: 'tsukimasu'),
        GuideExample('りゅうがくします', {
          'id': 'studi di luar negeri',
          'en': 'to study abroad',
        }, romaji: 'ryuugakushimasu'),
        GuideExample('とります', {
          'id': 'mengambil',
          'en': 'to take',
        }, romaji: 'torimasu'),
        GuideExample('いなか', {
          'id': 'pedesaan; kampung halaman',
          'en': 'countryside; hometown',
        }, romaji: 'inaka'),
        GuideExample('たいしかん', {
          'id': 'kedutaan besar',
          'en': 'embassy',
        }, romaji: 'taishikan'),
        GuideExample('グループ', {
          'id': 'kelompok',
          'en': 'group',
        }, romaji: 'guruupu'),
        GuideExample('チャンス', {
          'id': 'kesempatan',
          'en': 'chance',
        }, romaji: 'chansu'),
        GuideExample('おく', {
          'id': 'seratus juta',
          'en': 'hundred million',
        }, romaji: 'oku'),
        GuideExample('もし', {'id': 'jika', 'en': 'if'}, romaji: 'moshi'),
        GuideExample('いくら', {
          'id': 'sebanyak apa pun / berapa pun',
          'en': 'no matter how much',
        }, romaji: 'ikura'),
        GuideExample('てんきん', {
          'id': 'mutasi kerja',
          'en': 'job transfer',
        }, romaji: 'tenkin'),
        GuideExample('こと', {
          'id': 'hal; perkara',
          'en': 'thing; matter',
        }, romaji: 'koto'),
        GuideExample('いっぱいのみましょう', {
          'id': 'mari minum bersama',
          'en': 'let\'s have a drink',
        }, romaji: 'ippai nomimashou'),
        GuideExample('おせわになりました', {
          'id': 'terima kasih atas bimbingan selama ini (saat pamit)',
          'en': 'thank you for everything (when leaving)',
        }, romaji: 'osewa ni narimashita'),
        GuideExample('がんばります', {
          'id': 'berusaha keras',
          'en': 'to do one\'s best',
        }, romaji: 'ganbarimasu'),
        GuideExample('どうぞおげんきで', {
          'id': 'semoga sehat selalu',
          'en': 'take care',
        }, romaji: 'douzo ogenki de'),
      ],
    ),
  ],
);
