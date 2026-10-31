"""Kanji JLPT N5 (±100): bacaan on/kun, arti, contoh kata."""

SECTIONS = [
    ('Angka & uang', 'Numbers & money',
     '四 bisa dibaca yon atau shi, 七 nana atau shichi, 九 kyuu atau ku. Dalam percakapan sehari-hari yon dan nana lebih sering dipakai.',
     '四 can be read yon or shi, 七 nana or shichi, 九 kyuu or ku. In everyday speech yon and nana are more common.',
     [
        K('一', 'ichi', ['イチ', 'イツ'], ['ひと(つ)'], 'satu', 'one', [
            W('一つ', 'ひとつ', 'hitotsu', 'satu (buah)', 'one (thing)'),
            W('一月', 'いちがつ', 'ichigatsu', 'Januari', 'January'),
        ]),
        K('二', 'ni', ['ニ'], ['ふた(つ)'], 'dua', 'two', [
            W('二つ', 'ふたつ', 'futatsu', 'dua (buah)', 'two (things)'),
            W('二月', 'にがつ', 'nigatsu', 'Februari', 'February'),
        ]),
        K('三', 'san', ['サン'], ['みっ(つ)'], 'tiga', 'three', [
            W('三つ', 'みっつ', 'mittsu', 'tiga (buah)', 'three (things)'),
            W('三月', 'さんがつ', 'sangatsu', 'Maret', 'March'),
        ]),
        K('四', 'yon', ['シ'], ['よん', 'よ', 'よっ(つ)'], 'empat', 'four', [
            W('四つ', 'よっつ', 'yottsu', 'empat (buah)', 'four (things)'),
            W('四月', 'しがつ', 'shigatsu', 'April', 'April'),
        ]),
        K('五', 'go', ['ゴ'], ['いつ(つ)'], 'lima', 'five', [
            W('五つ', 'いつつ', 'itsutsu', 'lima (buah)', 'five (things)'),
            W('五月', 'ごがつ', 'gogatsu', 'Mei', 'May'),
        ]),
        K('六', 'roku', ['ロク'], ['むっ(つ)'], 'enam', 'six', [
            W('六つ', 'むっつ', 'muttsu', 'enam (buah)', 'six (things)'),
            W('六月', 'ろくがつ', 'rokugatsu', 'Juni', 'June'),
        ]),
        K('七', 'nana', ['シチ'], ['なな', 'なな(つ)'], 'tujuh', 'seven', [
            W('七つ', 'ななつ', 'nanatsu', 'tujuh (buah)', 'seven (things)'),
            W('七月', 'しちがつ', 'shichigatsu', 'Juli', 'July'),
        ]),
        K('八', 'hachi', ['ハチ'], ['やっ(つ)'], 'delapan', 'eight', [
            W('八つ', 'やっつ', 'yattsu', 'delapan (buah)', 'eight (things)'),
            W('八月', 'はちがつ', 'hachigatsu', 'Agustus', 'August'),
        ]),
        K('九', 'kyuu', ['キュウ', 'ク'], ['ここの(つ)'], 'sembilan', 'nine', [
            W('九つ', 'ここのつ', 'kokonotsu', 'sembilan (buah)', 'nine (things)'),
            W('九月', 'くがつ', 'kugatsu', 'September', 'September'),
        ]),
        K('十', 'juu', ['ジュウ'], ['とお'], 'sepuluh', 'ten', [
            W('十日', 'とおか', 'tooka', 'tanggal sepuluh; sepuluh hari', 'the 10th (day); ten days'),
            W('十月', 'じゅうがつ', 'juugatsu', 'Oktober', 'October'),
        ]),
        K('百', 'hyaku', ['ヒャク'], [], 'seratus', 'hundred', [
            W('三百円', 'さんびゃくえん', 'sanbyaku en', '300 yen', '300 yen'),
            W('百人', 'ひゃくにん', 'hyakunin', 'seratus orang', 'a hundred people'),
        ]),
        K('千', 'sen', ['セン'], ['ち'], 'seribu', 'thousand', [
            W('三千', 'さんぜん', 'sanzen', 'tiga ribu', 'three thousand'),
            W('千葉', 'ちば', 'chiba', 'Chiba (prefektur)', 'Chiba (prefecture)'),
        ]),
        K('万', 'man', ['マン', 'バン'], [], 'sepuluh ribu', 'ten thousand', [
            W('一万円', 'いちまんえん', 'ichiman en', '10.000 yen', '10,000 yen'),
            W('万年筆', 'まんねんひつ', 'mannenhitsu', 'pulpen tinta', 'fountain pen'),
        ]),
        K('円', 'en', ['エン'], ['まる(い)'], 'yen; lingkaran', 'yen; circle', [
            W('百円', 'ひゃくえん', 'hyakuen', 'seratus yen', '100 yen'),
            W('円い', 'まるい', 'marui', 'bulat', 'round'),
        ]),
        K('何', 'nani', ['カ'], ['なに', 'なん'], 'apa', 'what', [
            W('何時', 'なんじ', 'nanji', 'jam berapa', 'what time'),
            W('何人', 'なんにん', 'nannin', 'berapa orang', 'how many people'),
        ]),
     ]),
    ('Waktu & hari', 'Time & days',
     'Nama hari = kanji elemen + 曜日 (youbi): 日 Minggu, 月 Senin, 火 Selasa, 水 Rabu, 木 Kamis, 金 Jumat, 土 Sabtu.',
     'Day names = element kanji + 曜日 (youbi): 日 Sunday, 月 Monday, 火 Tuesday, 水 Wednesday, 木 Thursday, 金 Friday, 土 Saturday.',
     [
        K('日', 'hi', ['ニチ', 'ジツ'], ['ひ', 'か'], 'hari; matahari', 'day; sun', [
            W('日曜日', 'にちようび', 'nichiyoubi', 'hari Minggu', 'Sunday'),
            W('三日', 'みっか', 'mikka', 'tanggal tiga; tiga hari', 'the 3rd (day); three days'),
        ]),
        K('月', 'tsuki', ['ゲツ', 'ガツ'], ['つき'], 'bulan', 'month; moon', [
            W('月曜日', 'げつようび', 'getsuyoubi', 'hari Senin', 'Monday'),
            W('今月', 'こんげつ', 'kongetsu', 'bulan ini', 'this month'),
        ]),
        K('火', 'hi', ['カ'], ['ひ'], 'api', 'fire', [
            W('火曜日', 'かようび', 'kayoubi', 'hari Selasa', 'Tuesday'),
            W('火山', 'かざん', 'kazan', 'gunung berapi', 'volcano'),
        ]),
        K('水', 'mizu', ['スイ'], ['みず'], 'air', 'water', [
            W('水曜日', 'すいようび', 'suiyoubi', 'hari Rabu', 'Wednesday'),
            W('水道', 'すいどう', 'suidou', 'saluran air (ledeng)', 'water supply'),
        ]),
        K('木', 'ki', ['モク', 'ボク'], ['き'], 'pohon; kayu', 'tree; wood', [
            W('木曜日', 'もくようび', 'mokuyoubi', 'hari Kamis', 'Thursday'),
            W('木の下', 'きのした', 'ki no shita', 'di bawah pohon', 'under the tree'),
        ]),
        K('金', 'kane', ['キン'], ['かね'], 'uang; emas', 'money; gold', [
            W('金曜日', 'きんようび', 'kinyoubi', 'hari Jumat', 'Friday'),
            W('お金', 'おかね', 'okane', 'uang', 'money'),
        ]),
        K('土', 'tsuchi', ['ド', 'ト'], ['つち'], 'tanah', 'soil; earth', [
            W('土曜日', 'どようび', 'doyoubi', 'hari Sabtu', 'Saturday'),
            W('土地', 'とち', 'tochi', 'lahan; tanah', 'land; plot'),
        ]),
        K('年', 'toshi', ['ネン'], ['とし'], 'tahun', 'year', [
            W('一年', 'いちねん', 'ichinen', 'satu tahun', 'one year'),
            W('年上', 'としうえ', 'toshiue', 'lebih tua (usia)', 'older (in age)'),
        ]),
        K('時', 'toki', ['ジ'], ['とき'], 'waktu; jam', 'time; hour', [
            W('時計', 'とけい', 'tokei', 'jam (alat)', 'clock; watch'),
            W('時間', 'じかん', 'jikan', 'waktu; durasi', 'time; hours'),
        ]),
        K('分', 'fun', ['ブン', 'フン'], ['わ(かる)', 'わ(ける)'], 'menit; bagian', 'minute; part', [
            W('五分', 'ごふん', 'gofun', 'lima menit', 'five minutes'),
            W('分かる', 'わかる', 'wakaru', 'mengerti', 'to understand'),
        ]),
        K('半', 'han', ['ハン'], ['なか(ば)'], 'setengah', 'half', [
            W('三時半', 'さんじはん', 'sanjihan', 'jam setengah empat (3.30)', 'half past three'),
            W('半分', 'はんぶん', 'hanbun', 'separuh', 'half (portion)'),
        ]),
        K('今', 'ima', ['コン', 'キン'], ['いま'], 'sekarang', 'now', [
            W('今日', 'きょう', 'kyou', 'hari ini (bacaan khusus)', 'today (special reading)'),
            W('今年', 'ことし', 'kotoshi', 'tahun ini', 'this year'),
        ]),
        K('週', 'shuu', ['シュウ'], [], 'minggu (7 hari)', 'week', [
            W('今週', 'こんしゅう', 'konshuu', 'minggu ini', 'this week'),
            W('来週', 'らいしゅう', 'raishuu', 'minggu depan', 'next week'),
        ]),
        K('午', 'go', ['ゴ'], [], 'tengah hari', 'noon', [
            W('午前', 'ごぜん', 'gozen', 'pagi (a.m.)', 'morning (a.m.)'),
            W('午後', 'ごご', 'gogo', 'siang/sore (p.m.)', 'afternoon (p.m.)'),
        ]),
        K('毎', 'mai', ['マイ'], [], 'setiap', 'every', [
            W('毎日', 'まいにち', 'mainichi', 'setiap hari', 'every day'),
            W('毎週', 'まいしゅう', 'maishuu', 'setiap minggu', 'every week'),
        ]),
        K('間', 'aida', ['カン', 'ケン'], ['あいだ', 'ま'], 'antara; selang', 'interval; between', [
            W('一週間', 'いっしゅうかん', 'isshuukan', 'satu minggu (lamanya)', 'one week (long)'),
            W('人間', 'にんげん', 'ningen', 'manusia', 'human being'),
        ]),
        K('先', 'sen', ['セン'], ['さき'], 'dulu; lebih dulu', 'previous; ahead', [
            W('先生', 'せんせい', 'sensei', 'guru', 'teacher'),
            W('先週', 'せんしゅう', 'senshuu', 'minggu lalu', 'last week'),
        ]),
     ]),
    ('Orang & keluarga', 'People & family',
     '父 dan 母 dipakai untuk orang tua sendiri. Untuk orang tua orang lain pakai お父さん (otousan) dan お母さん (okaasan).',
     "父 and 母 refer to your own parents. For someone else's parents use お父さん (otousan) and お母さん (okaasan).",
     [
        K('人', 'hito', ['ジン', 'ニン'], ['ひと'], 'orang', 'person', [
            W('日本人', 'にほんじん', 'nihonjin', 'orang Jepang', 'Japanese person'),
            W('一人', 'ひとり', 'hitori', 'satu orang; sendirian', 'one person; alone'),
        ]),
        K('男', 'otoko', ['ダン', 'ナン'], ['おとこ'], 'laki-laki', 'man; male', [
            W('男の子', 'おとこのこ', 'otoko no ko', 'anak laki-laki', 'boy'),
            W('男性', 'だんせい', 'dansei', 'pria', 'male; man'),
        ]),
        K('女', 'onna', ['ジョ', 'ニョ'], ['おんな'], 'perempuan', 'woman; female', [
            W('女の人', 'おんなのひと', 'onna no hito', 'perempuan (orang)', 'woman'),
            W('女性', 'じょせい', 'josei', 'wanita', 'female; woman'),
        ]),
        K('子', 'ko', ['シ'], ['こ'], 'anak', 'child', [
            W('女の子', 'おんなのこ', 'onna no ko', 'anak perempuan', 'girl'),
            W('子ども', 'こども', 'kodomo', 'anak-anak', 'children; kid'),
        ]),
        K('父', 'chichi', ['フ'], ['ちち'], 'ayah', 'father', [
            W('お父さん', 'おとうさん', 'otousan', 'ayah (sapaan / ayah orang lain)', 'father (polite / someone else\'s)'),
            W('父の日', 'ちちのひ', 'chichi no hi', 'Hari Ayah', "Father's Day"),
        ]),
        K('母', 'haha', ['ボ'], ['はは'], 'ibu', 'mother', [
            W('お母さん', 'おかあさん', 'okaasan', 'ibu (sapaan / ibu orang lain)', 'mother (polite / someone else\'s)'),
            W('母国語', 'ぼこくご', 'bokokugo', 'bahasa ibu', 'mother tongue'),
        ]),
        K('友', 'tomo', ['ユウ'], ['とも'], 'teman', 'friend', [
            W('友達', 'ともだち', 'tomodachi', 'teman', 'friend'),
            W('友人', 'ゆうじん', 'yuujin', 'kawan (formal)', 'friend (formal)'),
        ]),
        K('名', 'na', ['メイ', 'ミョウ'], ['な'], 'nama', 'name', [
            W('名前', 'なまえ', 'namae', 'nama', 'name'),
            W('名刺', 'めいし', 'meishi', 'kartu nama', 'business card'),
        ]),
     ]),
    ('Belajar & bahasa', 'Study & language',
     '本 berarti buku, tapi 日本 (nihon) berarti Jepang. Tambahkan 語 untuk nama bahasa dan 人 untuk kebangsaan.',
     '本 means book, but 日本 (nihon) means Japan. Add 語 for a language name and 人 for nationality.',
     [
        K('学', 'gaku', ['ガク'], ['まな(ぶ)'], 'belajar; ilmu', 'study; learning', [
            W('学生', 'がくせい', 'gakusei', 'pelajar, mahasiswa', 'student'),
            W('大学', 'だいがく', 'daigaku', 'universitas', 'university'),
        ]),
        K('校', 'kou', ['コウ'], [], 'sekolah', 'school', [
            W('学校', 'がっこう', 'gakkou', 'sekolah', 'school'),
            W('校長', 'こうちょう', 'kouchou', 'kepala sekolah', 'principal'),
        ]),
        K('生', 'sei', ['セイ', 'ショウ'], ['い(きる)', 'う(まれる)', 'なま'], 'hidup; lahir', 'life; birth', [
            W('生まれる', 'うまれる', 'umareru', 'lahir', 'to be born'),
            W('一生', 'いっしょう', 'isshou', 'seumur hidup', 'whole life'),
        ]),
        K('本', 'hon', ['ホン'], ['もと'], 'buku; asal', 'book; origin', [
            W('日本', 'にほん', 'nihon', 'Jepang', 'Japan'),
            W('一本', 'いっぽん', 'ippon', 'satu batang (benda panjang)', 'one (long object)'),
        ]),
        K('語', 'go', ['ゴ'], ['かた(る)'], 'bahasa; kata', 'language; word', [
            W('日本語', 'にほんご', 'nihongo', 'bahasa Jepang', 'Japanese language'),
            W('中国語', 'ちゅうごくご', 'chuugokugo', 'bahasa Mandarin', 'Chinese language'),
        ]),
        K('国', 'kuni', ['コク'], ['くに'], 'negara', 'country', [
            W('中国', 'ちゅうごく', 'chuugoku', 'Tiongkok', 'China'),
            W('外国', 'がいこく', 'gaikoku', 'luar negeri', 'foreign country'),
        ]),
     ]),
    ('Alam & kota', 'Nature & town',
     'Banyak kanji alam berbentuk gambar: 山 tiga puncak gunung, 川 aliran sungai, 田 petak sawah, 雨 tetesan hujan.',
     'Many nature kanji are pictures: 山 three mountain peaks, 川 a flowing river, 田 rice paddy plots, 雨 falling raindrops.',
     [
        K('山', 'yama', ['サン'], ['やま'], 'gunung', 'mountain', [
            W('富士山', 'ふじさん', 'fujisan', 'Gunung Fuji', 'Mount Fuji'),
            W('山道', 'やまみち', 'yamamichi', 'jalan gunung', 'mountain path'),
        ]),
        K('川', 'kawa', ['セン'], ['かわ'], 'sungai', 'river', [
            W('小川', 'おがわ', 'ogawa', 'sungai kecil', 'stream; brook'),
            W('天の川', 'あまのがわ', 'amanogawa', 'Bima Sakti', 'Milky Way'),
        ]),
        K('田', 'ta', ['デン'], ['た'], 'sawah', 'rice field', [
            W('山田', 'やまだ', 'yamada', 'Yamada (nama keluarga)', 'Yamada (family name)'),
            W('田中', 'たなか', 'tanaka', 'Tanaka (nama keluarga)', 'Tanaka (family name)'),
        ]),
        K('空', 'sora', ['クウ'], ['そら', 'あ(く)', 'から'], 'langit; kosong', 'sky; empty', [
            W('青空', 'あおぞら', 'aozora', 'langit biru cerah', 'blue sky'),
            W('空港', 'くうこう', 'kuukou', 'bandara', 'airport'),
        ]),
        K('雨', 'ame', ['ウ'], ['あめ'], 'hujan', 'rain', [
            W('雨の日', 'あめのひ', 'ame no hi', 'hari hujan', 'rainy day'),
            W('大雨', 'おおあめ', 'ooame', 'hujan lebat', 'heavy rain'),
        ]),
        K('花', 'hana', ['カ'], ['はな'], 'bunga', 'flower', [
            W('花見', 'はなみ', 'hanami', 'piknik melihat bunga sakura', 'cherry-blossom viewing'),
            W('花火', 'はなび', 'hanabi', 'kembang api', 'fireworks'),
        ]),
        K('車', 'kuruma', ['シャ'], ['くるま'], 'mobil; kendaraan', 'car; vehicle', [
            W('電車', 'でんしゃ', 'densha', 'kereta listrik', 'train'),
            W('車道', 'しゃどう', 'shadou', 'jalur kendaraan', 'roadway'),
        ]),
        K('駅', 'eki', ['エキ'], [], 'stasiun', 'station', [
            W('駅前', 'えきまえ', 'ekimae', 'depan stasiun', 'in front of the station'),
            W('駅弁', 'えきべん', 'ekiben', 'bento stasiun', 'station bento'),
        ]),
        K('天', 'ten', ['テン'], ['あま'], 'surga; cuaca', 'heaven; weather', [
            W('天気', 'てんき', 'tenki', 'cuaca', 'weather'),
            W('天国', 'てんごく', 'tengoku', 'surga', 'heaven; paradise'),
        ]),
        K('気', 'ki', ['キ', 'ケ'], [], 'semangat; perasaan', 'spirit; mood', [
            W('人気', 'にんき', 'ninki', 'populer', 'popularity'),
            W('気分', 'きぶん', 'kibun', 'suasana hati', 'mood; feeling'),
        ]),
        K('魚', 'sakana', ['ギョ'], ['さかな', 'うお'], 'ikan', 'fish', [
            W('金魚', 'きんぎょ', 'kingyo', 'ikan mas koki', 'goldfish'),
            W('人魚', 'にんぎょ', 'ningyo', 'putri duyung', 'mermaid'),
        ]),
        K('店', 'mise', ['テン'], ['みせ'], 'toko', 'shop', [
            W('書店', 'しょてん', 'shoten', 'toko buku', 'bookstore'),
            W('店長', 'てんちょう', 'tenchou', 'manajer toko', 'store manager'),
        ]),
        K('道', 'michi', ['ドウ'], ['みち'], 'jalan', 'road; way', [
            W('北海道', 'ほっかいどう', 'hokkaidou', 'Hokkaido', 'Hokkaido'),
            W('書道', 'しょどう', 'shodou', 'kaligrafi', 'calligraphy'),
        ]),
        K('電', 'den', ['デン'], [], 'listrik', 'electricity', [
            W('電話', 'でんわ', 'denwa', 'telepon', 'telephone'),
            W('電気', 'でんき', 'denki', 'listrik; lampu', 'electricity; light'),
        ]),
     ]),
    ('Ukuran & arah', 'Size & direction',
     '大 dan 小 sering muncul sebagai kata sifat 大きい (ookii) dan 小さい (chiisai). 上下左右 = atas, bawah, kiri, kanan.',
     '大 and 小 usually appear as the adjectives 大きい (ookii) and 小さい (chiisai). 上下左右 = up, down, left, right.',
     [
        K('大', 'dai', ['ダイ', 'タイ'], ['おお(きい)'], 'besar', 'big', [
            W('大きい', 'おおきい', 'ookii', 'besar', 'big'),
            W('大人', 'おとな', 'otona', 'orang dewasa', 'adult'),
        ]),
        K('小', 'shou', ['ショウ'], ['ちい(さい)', 'こ', 'お'], 'kecil', 'small', [
            W('小さい', 'ちいさい', 'chiisai', 'kecil', 'small'),
            W('小学校', 'しょうがっこう', 'shougakkou', 'sekolah dasar', 'elementary school'),
        ]),
        K('中', 'naka', ['チュウ', 'ジュウ'], ['なか'], 'tengah; dalam', 'middle; inside', [
            W('中学生', 'ちゅうがくせい', 'chuugakusei', 'siswa SMP', 'junior high student'),
            W('一日中', 'いちにちじゅう', 'ichinichijuu', 'sepanjang hari', 'all day long'),
        ]),
        K('上', 'ue', ['ジョウ'], ['うえ', 'あ(がる)', 'のぼ(る)'], 'atas', 'up; above', [
            W('上手', 'じょうず', 'jouzu', 'pandai, mahir', 'skilful; good at'),
            W('上がる', 'あがる', 'agaru', 'naik', 'to go up'),
        ]),
        K('下', 'shita', ['カ', 'ゲ'], ['した', 'さ(がる)', 'くだ(さい)'], 'bawah', 'down; below', [
            W('下手', 'へた', 'heta', 'tidak pandai', 'unskilful; bad at'),
            W('下さい', 'ください', 'kudasai', 'tolong (berikan)', 'please (give me)'),
        ]),
        K('左', 'hidari', ['サ'], ['ひだり'], 'kiri', 'left', [
            W('左手', 'ひだりて', 'hidarite', 'tangan kiri', 'left hand'),
            W('左右', 'さゆう', 'sayuu', 'kiri dan kanan', 'left and right'),
        ]),
        K('右', 'migi', ['ウ', 'ユウ'], ['みぎ'], 'kanan', 'right', [
            W('右手', 'みぎて', 'migite', 'tangan kanan', 'right hand'),
            W('右側', 'みぎがわ', 'migigawa', 'sisi kanan', 'right side'),
        ]),
     ]),
    ('Arah & tempat', 'Directions & places',
     'Arah mata angin sering dipakai untuk pintu stasiun: 東口 (pintu timur), 西口, 南口, 北口.',
     'Compass directions often name station exits: 東口 (east exit), 西口, 南口, 北口.',
     [
        K('東', 'higashi', ['トウ'], ['ひがし'], 'timur', 'east', [
            W('東口', 'ひがしぐち', 'higashiguchi', 'pintu timur', 'east exit'),
            W('中東', 'ちゅうとう', 'chuutou', 'Timur Tengah', 'Middle East'),
        ]),
        K('西', 'nishi', ['セイ', 'サイ'], ['にし'], 'barat', 'west', [
            W('西口', 'にしぐち', 'nishiguchi', 'pintu barat', 'west exit'),
            W('関西', 'かんさい', 'kansai', 'Kansai (wilayah Osaka–Kyoto)', 'Kansai (Osaka–Kyoto region)'),
        ]),
        K('南', 'minami', ['ナン'], ['みなみ'], 'selatan', 'south', [
            W('南口', 'みなみぐち', 'minamiguchi', 'pintu selatan', 'south exit'),
            W('東南アジア', 'とうなんアジア', 'tounan ajia', 'Asia Tenggara', 'Southeast Asia'),
        ]),
        K('北', 'kita', ['ホク'], ['きた'], 'utara', 'north', [
            W('北口', 'きたぐち', 'kitaguchi', 'pintu utara', 'north exit'),
            W('南北', 'なんぼく', 'nanboku', 'utara-selatan', 'north and south'),
        ]),
        K('前', 'mae', ['ゼン'], ['まえ'], 'depan; sebelum', 'front; before', [
            W('三年前', 'さんねんまえ', 'sannen mae', 'tiga tahun lalu', 'three years ago'),
            W('前日', 'ぜんじつ', 'zenjitsu', 'hari sebelumnya', 'the day before'),
        ]),
        K('後', 'ushiro', ['ゴ', 'コウ'], ['うし(ろ)', 'あと', 'のち'], 'belakang; sesudah', 'behind; after', [
            W('後ろ', 'うしろ', 'ushiro', 'belakang', 'behind; back'),
            W('後で', 'あとで', 'ato de', 'nanti', 'later'),
        ]),
        K('外', 'soto', ['ガイ'], ['そと', 'ほか'], 'luar', 'outside', [
            W('外国人', 'がいこくじん', 'gaikokujin', 'orang asing', 'foreigner'),
            W('外出', 'がいしゅつ', 'gaishutsu', 'keluar rumah', 'going out'),
        ]),
     ]),
    ('Tubuh & warna', 'Body & colors',
     'Warna menjadi kata sifat dengan akhiran い: 白い putih, 赤い merah, 青い biru.',
     'Colors become adjectives with the ending い: 白い white, 赤い red, 青い blue.',
     [
        K('手', 'te', ['シュ'], ['て'], 'tangan', 'hand', [
            W('選手', 'せんしゅ', 'senshu', 'atlet', 'athlete; player'),
            W('握手', 'あくしゅ', 'akushu', 'jabat tangan', 'handshake'),
        ]),
        K('目', 'me', ['モク'], ['め'], 'mata', 'eye', [
            W('一つ目', 'ひとつめ', 'hitotsume', 'yang pertama', 'the first one'),
            W('目的', 'もくてき', 'mokuteki', 'tujuan', 'purpose'),
        ]),
        K('口', 'kuchi', ['コウ'], ['くち'], 'mulut', 'mouth', [
            W('人口', 'じんこう', 'jinkou', 'jumlah penduduk', 'population'),
            W('窓口', 'まどぐち', 'madoguchi', 'loket', 'service counter'),
        ]),
        K('耳', 'mimi', ['ジ'], ['みみ'], 'telinga', 'ear', [
            W('耳鼻科', 'じびか', 'jibika', 'klinik THT', 'ENT clinic'),
            W('空耳', 'そらみみ', 'soramimi', 'salah dengar', 'mishearing'),
        ]),
        K('白', 'shiro', ['ハク'], ['しろ', 'しろ(い)'], 'putih', 'white', [
            W('白い', 'しろい', 'shiroi', 'putih', 'white'),
            W('面白い', 'おもしろい', 'omoshiroi', 'menarik, lucu', 'interesting; funny'),
        ]),
        K('赤', 'aka', ['セキ'], ['あか', 'あか(い)'], 'merah', 'red', [
            W('赤い花', 'あかいはな', 'akai hana', 'bunga merah', 'red flower'),
            W('赤ちゃん', 'あかちゃん', 'akachan', 'bayi', 'baby'),
        ]),
        K('青', 'ao', ['セイ'], ['あお', 'あお(い)'], 'biru', 'blue', [
            W('青い空', 'あおいそら', 'aoi sora', 'langit biru', 'blue sky'),
            W('青年', 'せいねん', 'seinen', 'pemuda', 'young man; youth'),
        ]),
     ]),
    ('Sifat', 'Adjectives',
     'Kata sifat-i berakhiran い yang ditulis dengan hiragana (okurigana): 高い, 安い, 新しい, 古い, 長い.',
     'I-adjectives end in い written in hiragana (okurigana): 高い, 安い, 新しい, 古い, 長い.',
     [
        K('長', 'nagai', ['チョウ'], ['なが(い)'], 'panjang; kepala (pemimpin)', 'long; chief', [
            W('長い', 'ながい', 'nagai', 'panjang', 'long'),
            W('長男', 'ちょうなん', 'chounan', 'putra sulung', 'eldest son'),
        ]),
        K('高', 'takai', ['コウ'], ['たか(い)'], 'tinggi; mahal', 'tall; expensive', [
            W('高い', 'たかい', 'takai', 'tinggi; mahal', 'tall; expensive'),
            W('高校', 'こうこう', 'koukou', 'SMA', 'high school'),
        ]),
        K('安', 'yasui', ['アン'], ['やす(い)'], 'murah; tenang', 'cheap; peaceful', [
            W('安い', 'やすい', 'yasui', 'murah', 'cheap'),
            W('安全', 'あんぜん', 'anzen', 'aman', 'safe; safety'),
        ]),
        K('新', 'atarashii', ['シン'], ['あたら(しい)'], 'baru', 'new', [
            W('新しい', 'あたらしい', 'atarashii', 'baru', 'new'),
            W('新年', 'しんねん', 'shinnen', 'tahun baru', 'New Year'),
        ]),
        K('古', 'furui', ['コ'], ['ふる(い)'], 'lama; tua (barang)', 'old', [
            W('古い', 'ふるい', 'furui', 'lama, kuno', 'old (things)'),
            W('中古', 'ちゅうこ', 'chuuko', 'bekas (barang)', 'second-hand'),
        ]),
     ]),
    ('Kata kerja', 'Verbs',
     'Kanji kata kerja hampir selalu diikuti hiragana (okurigana): 食べる, 飲む, 行く. Bagian hiragana inilah yang berubah saat konjugasi (食べます, 飲みます).',
     'Verb kanji are almost always followed by hiragana (okurigana): 食べる, 飲む, 行く. The hiragana part is what changes in conjugation (食べます, 飲みます).',
     [
        K('来', 'kuru', ['ライ'], ['く(る)'], 'datang', 'come', [
            W('来る', 'くる', 'kuru', 'datang', 'to come'),
            W('来年', 'らいねん', 'rainen', 'tahun depan', 'next year'),
        ]),
        K('行', 'iku', ['コウ', 'ギョウ'], ['い(く)', 'おこな(う)'], 'pergi', 'go', [
            W('行く', 'いく', 'iku', 'pergi', 'to go'),
            W('行う', 'おこなう', 'okonau', 'melaksanakan', 'to carry out'),
        ]),
        K('見', 'miru', ['ケン'], ['み(る)', 'み(せる)'], 'melihat', 'see; look', [
            W('見る', 'みる', 'miru', 'melihat; menonton', 'to see; to watch'),
            W('見学', 'けんがく', 'kengaku', 'kunjungan belajar', 'study visit; tour'),
        ]),
        K('食', 'taberu', ['ショク'], ['た(べる)'], 'makan', 'eat', [
            W('食べる', 'たべる', 'taberu', 'makan', 'to eat'),
            W('和食', 'わしょく', 'washoku', 'masakan Jepang', 'Japanese food'),
        ]),
        K('飲', 'nomu', ['イン'], ['の(む)'], 'minum', 'drink', [
            W('飲む', 'のむ', 'nomu', 'minum', 'to drink'),
            W('飲食店', 'いんしょくてん', 'inshokuten', 'rumah makan', 'eatery; restaurant'),
        ]),
        K('書', 'kaku', ['ショ'], ['か(く)'], 'menulis', 'write', [
            W('書く', 'かく', 'kaku', 'menulis', 'to write'),
            W('辞書', 'じしょ', 'jisho', 'kamus', 'dictionary'),
        ]),
        K('読', 'yomu', ['ドク'], ['よ(む)'], 'membaca', 'read', [
            W('読む', 'よむ', 'yomu', 'membaca', 'to read'),
            W('読書', 'どくしょ', 'dokusho', 'membaca buku (hobi)', 'reading (books)'),
        ]),
        K('話', 'hanasu', ['ワ'], ['はな(す)', 'はなし'], 'berbicara; cerita', 'speak; story', [
            W('話す', 'はなす', 'hanasu', 'berbicara', 'to speak'),
            W('お話', 'おはなし', 'ohanashi', 'cerita; pembicaraan', 'story; talk'),
        ]),
        K('聞', 'kiku', ['ブン'], ['き(く)', 'き(こえる)'], 'mendengar; bertanya', 'hear; ask', [
            W('聞く', 'きく', 'kiku', 'mendengar; bertanya', 'to listen; to ask'),
            W('新聞', 'しんぶん', 'shinbun', 'koran', 'newspaper'),
        ]),
        K('言', 'iu', ['ゲン', 'ゴン'], ['い(う)', 'こと'], 'berkata', 'say', [
            W('言う', 'いう', 'iu', 'berkata', 'to say'),
            W('言葉', 'ことば', 'kotoba', 'kata; bahasa', 'word; language'),
        ]),
        K('休', 'yasumu', ['キュウ'], ['やす(む)', 'やす(み)'], 'istirahat', 'rest', [
            W('休む', 'やすむ', 'yasumu', 'beristirahat; libur', 'to rest; to take off'),
            W('休日', 'きゅうじつ', 'kyuujitsu', 'hari libur', 'holiday; day off'),
        ]),
        K('出', 'deru', ['シュツ'], ['で(る)', 'だ(す)'], 'keluar', 'exit; go out', [
            W('出る', 'でる', 'deru', 'keluar', 'to go out'),
            W('出口', 'でぐち', 'deguchi', 'pintu keluar', 'exit'),
        ]),
        K('入', 'hairu', ['ニュウ'], ['はい(る)', 'い(れる)', 'い(る)'], 'masuk', 'enter', [
            W('入る', 'はいる', 'hairu', 'masuk', 'to enter'),
            W('入口', 'いりぐち', 'iriguchi', 'pintu masuk', 'entrance'),
        ]),
        K('立', 'tatsu', ['リツ'], ['た(つ)'], 'berdiri', 'stand', [
            W('立つ', 'たつ', 'tatsu', 'berdiri', 'to stand'),
            W('国立', 'こくりつ', 'kokuritsu', 'negeri (milik negara)', 'national; state-run'),
        ]),
     ]),
]
