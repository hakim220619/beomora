"""Kanji JLPT N4 (±170 kanji baru di luar N5): bacaan on/kun, arti, contoh kata."""

SECTIONS = [
    ('Keluarga & orang', 'Family & people', None, None, [
        K('兄', 'ani', ['ケイ', 'キョウ'], ['あに'], 'kakak laki-laki', 'older brother', [
            W('兄弟', 'きょうだい', 'kyoudai', 'saudara kandung', 'siblings'),
            W('お兄さん', 'おにいさん', 'oniisan', 'kakak laki-laki (orang lain)', 'older brother (polite)'),
        ]),
        K('姉', 'ane', ['シ'], ['あね'], 'kakak perempuan', 'older sister', [
            W('姉妹', 'しまい', 'shimai', 'saudara perempuan', 'sisters'),
            W('お姉さん', 'おねえさん', 'oneesan', 'kakak perempuan (orang lain)', 'older sister (polite)'),
        ]),
        K('弟', 'otouto', ['ダイ', 'デ', 'テイ'], ['おとうと'], 'adik laki-laki', 'younger brother', [
            W('弟さん', 'おとうとさん', 'otoutosan', 'adik laki-laki (orang lain)', 'younger brother (polite)'),
            W('弟子', 'でし', 'deshi', 'murid; pengikut', 'disciple'),
        ]),
        K('妹', 'imouto', ['マイ'], ['いもうと'], 'adik perempuan', 'younger sister', [
            W('妹さん', 'いもうとさん', 'imoutosan', 'adik perempuan (orang lain)', 'younger sister (polite)'),
        ]),
        K('家', 'ie', ['カ', 'ケ'], ['いえ', 'うち'], 'rumah', 'house', [
            W('作家', 'さっか', 'sakka', 'pengarang', 'writer'),
            W('家賃', 'やちん', 'yachin', 'sewa rumah', 'rent'),
        ]),
        K('族', 'zoku', ['ゾク'], [], 'suku; kerabat', 'tribe; family', [
            W('家族', 'かぞく', 'kazoku', 'keluarga', 'family'),
            W('民族', 'みんぞく', 'minzoku', 'suku bangsa', 'ethnic group'),
        ]),
        K('親', 'oya', ['シン'], ['おや', 'した(しい)'], 'orang tua; akrab', 'parent; intimate', [
            W('両親', 'りょうしん', 'ryoushin', 'kedua orang tua', 'parents'),
            W('親切', 'しんせつ', 'shinsetsu', 'baik hati', 'kind'),
        ]),
        K('私', 'watashi', ['シ'], ['わたし', 'わたくし'], 'saya; pribadi', 'I; private', [
            W('私', 'わたし', 'watashi', 'saya', 'I'),
            W('私立', 'しりつ', 'shiritsu', 'swasta', 'private (institution)'),
        ]),
        K('自', 'ji', ['ジ', 'シ'], ['みずか(ら)'], 'diri sendiri', 'oneself', [
            W('自分', 'じぶん', 'jibun', 'diri sendiri', 'oneself'),
            W('自転車', 'じてんしゃ', 'jitensha', 'sepeda', 'bicycle'),
        ]),
        K('者', 'sha', ['シャ'], ['もの'], 'orang (pelaku)', 'person (who does)', [
            W('学者', 'がくしゃ', 'gakusha', 'ilmuwan', 'scholar'),
            W('若者', 'わかもの', 'wakamono', 'anak muda', 'young people'),
        ]),
        K('員', 'in', ['イン'], [], 'anggota; petugas', 'member; staff', [
            W('会社員', 'かいしゃいん', 'kaishain', 'karyawan', 'company employee'),
            W('店員', 'てんいん', "ten'in", 'pramuniaga', 'shop clerk'),
        ]),
        K('主', 'shu', ['シュ', 'ス'], ['おも', 'ぬし'], 'utama; tuan', 'main; master', [
            W('主人', 'しゅじん', 'shujin', 'suami; tuan rumah', 'husband; master'),
            W('主に', 'おもに', 'omoni', 'terutama', 'mainly'),
        ]),
        K('民', 'min', ['ミン'], ['たみ'], 'rakyat', 'the people', [
            W('国民', 'こくみん', 'kokumin', 'warga negara', 'citizens'),
            W('市民', 'しみん', 'shimin', 'warga kota', 'citizen'),
        ]),
    ]),
    ('Tubuh & kesehatan', 'Body & health', None, None, [
        K('体', 'karada', ['タイ', 'テイ'], ['からだ'], 'tubuh', 'body', [
            W('体重', 'たいじゅう', 'taijuu', 'berat badan', 'body weight'),
            W('体育', 'たいいく', 'taiiku', 'pendidikan jasmani', 'physical education'),
        ]),
        K('頭', 'atama', ['トウ', 'ズ'], ['あたま'], 'kepala', 'head', [
            W('頭痛', 'ずつう', 'zutsuu', 'sakit kepala', 'headache'),
            W('先頭', 'せんとう', 'sentou', 'posisi paling depan', 'the lead'),
        ]),
        K('顔', 'kao', ['ガン'], ['かお'], 'wajah', 'face', [
            W('顔色', 'かおいろ', 'kaoiro', 'raut wajah', 'complexion'),
            W('笑顔', 'えがお', 'egao', 'wajah tersenyum', 'smiling face'),
        ]),
        K('首', 'kubi', ['シュ'], ['くび'], 'leher', 'neck', [
            W('手首', 'てくび', 'tekubi', 'pergelangan tangan', 'wrist'),
            W('首輪', 'くびわ', 'kubiwa', 'kalung hewan', 'collar'),
        ]),
        K('心', 'kokoro', ['シン'], ['こころ'], 'hati; jiwa', 'heart; mind', [
            W('安心', 'あんしん', 'anshin', 'lega; tenang', 'relief'),
            W('心配', 'しんぱい', 'shinpai', 'khawatir', 'worry'),
        ]),
        K('力', 'chikara', ['リョク', 'リキ'], ['ちから'], 'tenaga; kekuatan', 'power', [
            W('協力', 'きょうりょく', 'kyouryoku', 'kerja sama', 'cooperation'),
            W('力持ち', 'ちからもち', 'chikaramochi', 'orang kuat', 'strong person'),
        ]),
        K('病', 'byou', ['ビョウ'], ['やまい'], 'penyakit', 'illness', [
            W('病気', 'びょうき', 'byouki', 'sakit', 'sickness'),
            W('病人', 'びょうにん', 'byounin', 'orang sakit', 'sick person'),
        ]),
        K('医', 'i', ['イ'], [], 'pengobatan; medis', 'medical', [
            W('医者', 'いしゃ', 'isha', 'dokter', 'doctor'),
            W('医学', 'いがく', 'igaku', 'ilmu kedokteran', 'medical science'),
        ]),
        K('院', 'in', ['イン'], [], 'lembaga; balai', 'institution', [
            W('病院', 'びょういん', 'byouin', 'rumah sakit', 'hospital'),
            W('入院', 'にゅういん', "nyuuin", 'masuk rumah sakit', 'hospitalization'),
        ]),
        K('薬', 'kusuri', ['ヤク'], ['くすり'], 'obat', 'medicine (drug)', [
            W('薬局', 'やっきょく', 'yakkyoku', 'apotek', 'pharmacy'),
            W('目薬', 'めぐすり', 'megusuri', 'obat tetes mata', 'eye drops'),
        ]),
        K('死', 'shi', ['シ'], ['し(ぬ)'], 'mati', 'death', [
            W('死ぬ', 'しぬ', 'shinu', 'meninggal', 'to die'),
            W('死亡', 'しぼう', 'shibou', 'kematian', 'death (formal)'),
        ]),
    ]),
    ('Waktu & musim', 'Time & seasons', None, None, [
        K('春', 'haru', ['シュン'], ['はる'], 'musim semi', 'spring', [
            W('春休み', 'はるやすみ', 'haruyasumi', 'libur musim semi', 'spring break'),
            W('青春', 'せいしゅん', 'seishun', 'masa muda', 'youth'),
        ]),
        K('夏', 'natsu', ['カ', 'ゲ'], ['なつ'], 'musim panas', 'summer', [
            W('夏休み', 'なつやすみ', 'natsuyasumi', 'libur musim panas', 'summer vacation'),
            W('初夏', 'しょか', 'shoka', 'awal musim panas', 'early summer'),
        ]),
        K('秋', 'aki', ['シュウ'], ['あき'], 'musim gugur', 'autumn', [
            W('秋風', 'あきかぜ', 'akikaze', 'angin musim gugur', 'autumn wind'),
            W('春夏秋冬', 'しゅんかしゅうとう', 'shunkashuutou', 'empat musim', 'the four seasons'),
        ]),
        K('冬', 'fuyu', ['トウ'], ['ふゆ'], 'musim dingin', 'winter', [
            W('冬休み', 'ふゆやすみ', 'fuyuyasumi', 'libur musim dingin', 'winter vacation'),
            W('冬眠', 'とうみん', 'toumin', 'hibernasi', 'hibernation'),
        ]),
        K('朝', 'asa', ['チョウ'], ['あさ'], 'pagi', 'morning', [
            W('朝ご飯', 'あさごはん', 'asagohan', 'sarapan', 'breakfast'),
            W('今朝', 'けさ', 'kesa', 'tadi pagi', 'this morning'),
        ]),
        K('昼', 'hiru', ['チュウ'], ['ひる'], 'siang', 'noon; daytime', [
            W('昼休み', 'ひるやすみ', 'hiruyasumi', 'istirahat siang', 'lunch break'),
            W('昼食', 'ちゅうしょく', 'chuushoku', 'makan siang', 'lunch'),
        ]),
        K('夜', 'yoru', ['ヤ'], ['よる', 'よ'], 'malam', 'night', [
            W('今夜', 'こんや', "kon'ya", 'malam ini', 'tonight'),
            W('夜中', 'よなか', 'yonaka', 'tengah malam', 'middle of the night'),
        ]),
        K('夕', 'yuu', ['セキ'], ['ゆう'], 'senja; sore', 'evening', [
            W('夕方', 'ゆうがた', 'yuugata', 'sore hari', 'early evening'),
            W('夕飯', 'ゆうはん', 'yuuhan', 'makan malam', 'supper'),
        ]),
        K('曜', 'you', ['ヨウ'], [], 'hari (dalam sepekan)', 'weekday', [
            W('曜日', 'ようび', 'youbi', 'hari dalam sepekan', 'day of the week'),
            W('何曜日', 'なんようび', 'nan\'youbi', 'hari apa', 'what day of the week'),
        ]),
        K('度', 'do', ['ド'], ['たび'], 'kali; derajat', 'degree; times', [
            W('今度', 'こんど', 'kondo', 'lain kali; kali ini', 'next time'),
            W('温度', 'おんど', 'ondo', 'suhu', 'temperature'),
        ]),
        K('代', 'dai', ['ダイ', 'タイ'], ['か(わる)', 'よ'], 'zaman; ganti; biaya', 'era; substitute; fee', [
            W('時代', 'じだい', 'jidai', 'zaman', 'era'),
            W('代わり', 'かわり', 'kawari', 'pengganti', 'substitute'),
        ]),
        K('世', 'yo', ['セ', 'セイ'], ['よ'], 'dunia; generasi', 'world; generation', [
            W('世話', 'せわ', 'sewa', 'perawatan; bantuan', 'care; help'),
            W('世の中', 'よのなか', 'yononaka', 'masyarakat; dunia', 'society; the world'),
        ]),
        K('始', 'hajimeru', ['シ'], ['はじ(める)', 'はじ(まる)'], 'mulai', 'begin', [
            W('始める', 'はじめる', 'hajimeru', 'memulai', 'to begin'),
            W('開始', 'かいし', 'kaishi', 'permulaan', 'start'),
        ]),
        K('終', 'owaru', ['シュウ'], ['お(わる)', 'お(える)'], 'selesai', 'end', [
            W('終わる', 'おわる', 'owaru', 'berakhir', 'to end'),
            W('終電', 'しゅうでん', 'shuuden', 'kereta terakhir', 'last train'),
        ]),
        K('回', 'kai', ['カイ'], ['まわ(る)', 'まわ(す)'], 'putaran; kali (hitungan)', 'turn; round', [
            W('今回', 'こんかい', 'konkai', 'kali ini', 'this time'),
            W('回る', 'まわる', 'mawaru', 'berputar', 'to turn around'),
        ]),
    ]),
    ('Alam, hewan & warna', 'Nature, animals & colors', None, None, [
        K('風', 'kaze', ['フウ', 'フ'], ['かぜ'], 'angin', 'wind', [
            W('台風', 'たいふう', 'taifuu', 'topan', 'typhoon'),
            W('風呂', 'ふろ', 'furo', 'bak mandi', 'bath'),
        ]),
        K('海', 'umi', ['カイ'], ['うみ'], 'laut', 'sea', [
            W('海外', 'かいがい', 'kaigai', 'luar negeri', 'overseas'),
            W('海岸', 'かいがん', 'kaigan', 'pantai', 'coast'),
        ]),
        K('池', 'ike', ['チ'], ['いけ'], 'kolam', 'pond', [
            W('電池', 'でんち', 'denchi', 'baterai', 'battery'),
        ]),
        K('森', 'mori', ['シン'], ['もり'], 'hutan lebat', 'forest', [
            W('森', 'もり', 'mori', 'hutan', 'forest'),
            W('森林', 'しんりん', 'shinrin', 'hutan rimba', 'woods'),
        ]),
        K('林', 'hayashi', ['リン'], ['はやし'], 'hutan kecil', 'grove', [
            W('林', 'はやし', 'hayashi', 'hutan kecil', 'grove'),
            W('林業', 'りんぎょう', 'ringyou', 'kehutanan', 'forestry'),
        ]),
        K('野', 'no', ['ヤ'], ['の'], 'padang; ladang', 'field', [
            W('野球', 'やきゅう', 'yakyuu', 'bisbol', 'baseball'),
            W('分野', 'ぶんや', 'bun\'ya', 'bidang', 'field (of study)'),
        ]),
        K('地', 'chi', ['チ', 'ジ'], [], 'tanah; bumi', 'ground; earth', [
            W('地震', 'じしん', 'jishin', 'gempa bumi', 'earthquake'),
            W('地球', 'ちきゅう', 'chikyuu', 'bumi', 'the Earth'),
        ]),
        K('光', 'hikari', ['コウ'], ['ひかり', 'ひか(る)'], 'cahaya; sinar', 'light; ray', [
            W('光る', 'ひかる', 'hikaru', 'bersinar', 'to shine'),
            W('観光', 'かんこう', 'kankou', 'wisata', 'sightseeing'),
        ]),
        K('色', 'iro', ['ショク', 'シキ'], ['いろ'], 'warna', 'color', [
            W('色々', 'いろいろ', 'iroiro', 'bermacam-macam', 'various'),
            W('景色', 'けしき', 'keshiki', 'pemandangan', 'scenery'),
        ]),
        K('黒', 'kuro', ['コク'], ['くろ', 'くろ(い)'], 'hitam', 'black', [
            W('黒い', 'くろい', 'kuroi', 'hitam', 'black'),
            W('黒板', 'こくばん', 'kokuban', 'papan tulis', 'blackboard'),
        ]),
        K('犬', 'inu', ['ケン'], ['いぬ'], 'anjing', 'dog', [
            W('子犬', 'こいぬ', 'koinu', 'anak anjing', 'puppy'),
            W('番犬', 'ばんけん', 'banken', 'anjing penjaga', 'guard dog'),
        ]),
        K('牛', 'ushi', ['ギュウ'], ['うし'], 'sapi', 'cow', [
            W('牛肉', 'ぎゅうにく', 'gyuuniku', 'daging sapi', 'beef'),
            W('牛乳', 'ぎゅうにゅう', 'gyuunyuu', 'susu sapi', 'milk'),
        ]),
        K('鳥', 'tori', ['チョウ'], ['とり'], 'burung', 'bird', [
            W('小鳥', 'ことり', 'kotori', 'burung kecil', 'small bird'),
            W('焼き鳥', 'やきとり', 'yakitori', 'sate ayam Jepang', 'yakitori'),
        ]),
    ]),
    ('Tempat & kota', 'Places & towns', None, None, [
        K('京', 'kyou', ['キョウ', 'ケイ'], [], 'ibu kota', 'capital', [
            W('京都', 'きょうと', 'kyouto', 'Kyoto', 'Kyoto'),
            W('上京', 'じょうきょう', 'joukyou', 'pergi ke Tokyo', 'moving to Tokyo'),
        ]),
        K('都', 'to', ['ト', 'ツ'], ['みやこ'], 'kota besar; metropolitan', 'metropolis', [
            W('首都', 'しゅと', 'shuto', 'ibu kota negara', 'capital city'),
            W('都合', 'つごう', 'tsugou', 'kesempatan; kondisi', 'convenience'),
        ]),
        K('県', 'ken', ['ケン'], [], 'prefektur', 'prefecture', [
            W('県立', 'けんりつ', 'kenritsu', 'milik prefektur', 'prefectural'),
            W('県民', 'けんみん', 'kenmin', 'warga prefektur', 'prefecture residents'),
        ]),
        K('市', 'shi', ['シ'], ['いち'], 'kota', 'city', [
            W('市場', 'いちば', 'ichiba', 'pasar', 'market'),
            W('市役所', 'しやくしょ', 'shiyakusho', 'balai kota', 'city hall'),
        ]),
        K('区', 'ku', ['ク'], [], 'distrik', 'ward', [
            W('区役所', 'くやくしょ', 'kuyakusho', 'kantor distrik', 'ward office'),
            W('地区', 'ちく', 'chiku', 'kawasan', 'district'),
        ]),
        K('町', 'machi', ['チョウ'], ['まち'], 'kota kecil', 'town', [
            W('下町', 'したまち', 'shitamachi', 'kota lama', 'old downtown'),
            W('町内', 'ちょうない', 'chounai', 'lingkungan kampung', 'neighborhood (block)'),
        ]),
        K('村', 'mura', ['ソン'], ['むら'], 'desa', 'village', [
            W('村長', 'そんちょう', 'sonchou', 'kepala desa', 'village head'),
            W('農村', 'のうそん', 'nouson', 'desa pertanian', 'farming village'),
        ]),
        K('館', 'kan', ['カン'], ['やかた'], 'gedung', 'large building', [
            W('映画館', 'えいがかん', 'eigakan', 'bioskop', 'movie theater'),
            W('美術館', 'びじゅつかん', 'bijutsukan', 'museum seni', 'art museum'),
        ]),
        K('堂', 'dou', ['ドウ'], [], 'aula; balai', 'hall', [
            W('食堂', 'しょくどう', 'shokudou', 'kantin', 'cafeteria'),
            W('講堂', 'こうどう', 'koudou', 'aula', 'auditorium'),
        ]),
        K('屋', 'ya', ['オク'], ['や'], 'toko; rumah; atap', 'shop; roof', [
            W('部屋', 'へや', 'heya', 'kamar', 'room'),
            W('屋上', 'おくじょう', 'okujou', 'atap gedung', 'rooftop'),
        ]),
        K('室', 'shitsu', ['シツ'], [], 'ruang', 'room', [
            W('教室', 'きょうしつ', 'kyoushitsu', 'ruang kelas', 'classroom'),
            W('会議室', 'かいぎしつ', 'kaigishitsu', 'ruang rapat', 'meeting room'),
        ]),
        K('場', 'ba', ['ジョウ'], ['ば'], 'tempat (lokasi kejadian)', 'place; scene', [
            W('場所', 'ばしょ', 'basho', 'tempat', 'place'),
            W('会場', 'かいじょう', 'kaijou', 'tempat acara', 'venue'),
        ]),
        K('所', 'tokoro', ['ショ', 'ジョ'], ['ところ'], 'tempat; alamat', 'location; address', [
            W('近所', 'きんじょ', 'kinjo', 'sekitar rumah', 'neighborhood'),
            W('住所', 'じゅうしょ', 'juusho', 'alamat', 'address'),
        ]),
        K('門', 'mon', ['モン'], ['かど'], 'gerbang', 'gate', [
            W('専門', 'せんもん', 'senmon', 'keahlian; jurusan', 'specialty'),
            W('正門', 'せいもん', 'seimon', 'gerbang utama', 'main gate'),
        ]),
        K('台', 'dai', ['ダイ', 'タイ'], [], 'alas; unit (mesin/kendaraan)', 'stand; counter for machines', [
            W('台所', 'だいどころ', 'daidokoro', 'dapur', 'kitchen'),
            W('舞台', 'ぶたい', 'butai', 'panggung', 'stage'),
        ]),
        K('住', 'sumu', ['ジュウ'], ['す(む)'], 'tinggal; menetap', 'live (reside)', [
            W('住む', 'すむ', 'sumu', 'tinggal', 'to live'),
            W('住民', 'じゅうみん', 'juumin', 'penduduk', 'residents'),
        ]),
        K('界', 'kai', ['カイ'], [], 'batas; kalangan', 'boundary; circles', [
            W('世界', 'せかい', 'sekai', 'dunia', 'world'),
            W('業界', 'ぎょうかい', 'gyoukai', 'dunia industri', 'industry'),
        ]),
    ]),
    ('Sekolah & belajar', 'School & study', None, None, [
        K('教', 'oshieru', ['キョウ'], ['おし(える)', 'おそ(わる)'], 'mengajar', 'teach', [
            W('教える', 'おしえる', 'oshieru', 'mengajar; memberi tahu', 'to teach'),
            W('教育', 'きょういく', 'kyouiku', 'pendidikan', 'education'),
        ]),
        K('習', 'narau', ['シュウ'], ['なら(う)'], 'belajar (dari orang)', 'learn', [
            W('習う', 'ならう', 'narau', 'belajar (pada guru)', 'to learn'),
            W('練習', 'れんしゅう', 'renshuu', 'latihan', 'practice'),
        ]),
        K('勉', 'ben', ['ベン'], [], 'rajin; berusaha', 'diligence', [
            W('勉強', 'べんきょう', 'benkyou', 'belajar', 'study'),
            W('勤勉', 'きんべん', 'kinben', 'rajin', 'diligent'),
        ]),
        K('強', 'tsuyoi', ['キョウ', 'ゴウ'], ['つよ(い)'], 'kuat', 'strong', [
            W('強い', 'つよい', 'tsuyoi', 'kuat', 'strong'),
            W('強風', 'きょうふう', 'kyoufuu', 'angin kencang', 'strong wind'),
        ]),
        K('研', 'ken', ['ケン'], ['と(ぐ)'], 'mengasah; meneliti', 'polish; research', [
            W('研修', 'けんしゅう', 'kenshuu', 'pelatihan', 'training'),
            W('研究室', 'けんきゅうしつ', 'kenkyuushitsu', 'laboratorium', 'laboratory'),
        ]),
        K('究', 'kyuu', ['キュウ'], ['きわ(める)'], 'menyelidiki', 'investigate', [
            W('研究', 'けんきゅう', 'kenkyuu', 'penelitian', 'research'),
            W('究明', 'きゅうめい', 'kyuumei', 'pengungkapan', 'investigation'),
        ]),
        K('試', 'shi', ['シ'], ['ため(す)', 'こころ(みる)'], 'mencoba; menguji', 'try; test', [
            W('試験', 'しけん', 'shiken', 'ujian', 'exam'),
            W('試合', 'しあい', 'shiai', 'pertandingan', 'match'),
        ]),
        K('験', 'ken', ['ケン', 'ゲン'], [], 'bukti; pengujian', 'verify; effect', [
            W('経験', 'けいけん', 'keiken', 'pengalaman', 'experience'),
            W('実験', 'じっけん', 'jikken', 'eksperimen', 'experiment'),
        ]),
        K('質', 'shitsu', ['シツ', 'シチ'], [], 'mutu; sifat', 'quality', [
            W('質問', 'しつもん', 'shitsumon', 'pertanyaan', 'question'),
            W('品質', 'ひんしつ', 'hinshitsu', 'kualitas', 'product quality'),
        ]),
        K('問', 'mon', ['モン'], ['と(う)'], 'tanya; masalah', 'ask; problem', [
            W('問題', 'もんだい', 'mondai', 'soal; masalah', 'problem'),
            W('学問', 'がくもん', 'gakumon', 'ilmu pengetahuan', 'learning'),
        ]),
        K('題', 'dai', ['ダイ'], [], 'judul; topik', 'topic; title', [
            W('宿題', 'しゅくだい', 'shukudai', 'PR', 'homework'),
            W('話題', 'わだい', 'wadai', 'topik pembicaraan', 'topic of conversation'),
        ]),
        K('答', 'kotae', ['トウ'], ['こた(える)', 'こた(え)'], 'jawab', 'answer', [
            W('答える', 'こたえる', 'kotaeru', 'menjawab', 'to answer'),
            W('回答', 'かいとう', 'kaitou', 'jawaban (resmi)', 'reply'),
        ]),
        K('字', 'ji', ['ジ'], ['あざ'], 'huruf', 'letter (character)', [
            W('文字', 'もじ', 'moji', 'huruf; aksara', 'characters'),
            W('数字', 'すうじ', 'suuji', 'angka', 'numeral'),
        ]),
        K('漢', 'kan', ['カン'], [], 'Tiongkok (dinasti Han)', 'Han China', [
            W('漢字', 'かんじ', 'kanji', 'kanji', 'kanji'),
            W('漢方', 'かんぽう', 'kanpou', 'obat herbal Tiongkok', 'Chinese herbal medicine'),
        ]),
        K('文', 'bun', ['ブン', 'モン'], ['ふみ'], 'tulisan; kalimat', 'sentence; writing', [
            W('文化', 'ぶんか', 'bunka', 'budaya', 'culture'),
            W('文法', 'ぶんぽう', 'bunpou', 'tata bahasa', 'grammar'),
        ]),
        K('英', 'ei', ['エイ'], [], 'Inggris; unggul', 'English; excellent', [
            W('英会話', 'えいかいわ', 'eikaiwa', 'percakapan bahasa Inggris', 'English conversation'),
            W('英国', 'えいこく', 'eikoku', 'Inggris (Britania)', 'Britain'),
        ]),
        K('説', 'setsu', ['セツ', 'ゼイ'], ['と(く)'], 'menjelaskan; teori', 'explain; theory', [
            W('説明', 'せつめい', 'setsumei', 'penjelasan', 'explanation'),
            W('小説', 'しょうせつ', 'shousetsu', 'novel', 'novel'),
        ]),
        K('図', 'zu', ['ズ', 'ト'], ['はか(る)'], 'gambar; bagan', 'diagram; drawing', [
            W('地図', 'ちず', 'chizu', 'peta', 'map'),
            W('図書館', 'としょかん', 'toshokan', 'perpustakaan', 'library'),
        ]),
        K('理', 'ri', ['リ'], [], 'logika; alasan', 'reason; logic', [
            W('理由', 'りゆう', 'riyuu', 'alasan', 'reason'),
            W('無理', 'むり', 'muri', 'mustahil; terlalu memaksa', 'impossible'),
        ]),
        K('音', 'oto', ['オン', 'イン'], ['おと', 'ね'], 'bunyi', 'sound', [
            W('音楽', 'おんがく', 'ongaku', 'musik', 'music'),
            W('足音', 'あしおと', 'ashioto', 'suara langkah', 'footsteps'),
        ]),
        K('声', 'koe', ['セイ'], ['こえ'], 'suara (manusia)', 'voice', [
            W('声優', 'せいゆう', 'seiyuu', 'pengisi suara', 'voice actor'),
            W('歌声', 'うたごえ', 'utagoe', 'suara nyanyian', 'singing voice'),
        ]),
        K('歌', 'uta', ['カ'], ['うた', 'うた(う)'], 'lagu; bernyanyi', 'song; sing', [
            W('歌う', 'うたう', 'utau', 'bernyanyi', 'to sing'),
            W('歌手', 'かしゅ', 'kashu', 'penyanyi', 'singer'),
        ]),
        K('楽', 'tanoshii', ['ガク', 'ラク'], ['たの(しい)'], 'senang; musik', 'fun; music', [
            W('楽しい', 'たのしい', 'tanoshii', 'menyenangkan', 'fun'),
            W('楽器', 'がっき', 'gakki', 'alat musik', 'musical instrument'),
        ]),
        K('画', 'ga', ['ガ', 'カク'], [], 'gambar; rencana', 'picture; plan', [
            W('漫画', 'まんが', 'manga', 'komik', 'comics'),
            W('計画', 'けいかく', 'keikaku', 'rencana', 'plan'),
        ]),
        K('映', 'ei', ['エイ'], ['うつ(る)', 'うつ(す)'], 'memantulkan; menayangkan', 'reflect; project', [
            W('映画', 'えいが', 'eiga', 'film', 'movie'),
            W('上映', 'じょうえい', 'jouei', 'pemutaran film', 'screening'),
        ]),
        K('写', 'utsusu', ['シャ'], ['うつ(す)', 'うつ(る)'], 'menyalin; memotret', 'copy; photograph', [
            W('写真', 'しゃしん', 'shashin', 'foto', 'photo'),
            W('写す', 'うつす', 'utsusu', 'menyalin; memotret', 'to copy; to photograph'),
        ]),
        K('紙', 'kami', ['シ'], ['かみ'], 'kertas', 'paper', [
            W('手紙', 'てがみ', 'tegami', 'surat', 'letter'),
            W('和紙', 'わし', 'washi', 'kertas Jepang', 'Japanese paper'),
        ]),
    ]),
    ('Makanan, belanja & barang', 'Food, shopping & goods', None, None, [
        K('肉', 'niku', ['ニク'], [], 'daging', 'meat', [
            W('鶏肉', 'とりにく', 'toriniku', 'daging ayam', 'chicken (meat)'),
            W('豚肉', 'ぶたにく', 'butaniku', 'daging babi', 'pork'),
        ]),
        K('飯', 'han', ['ハン'], ['めし'], 'nasi; makanan', 'cooked rice; meal', [
            W('ご飯', 'ごはん', 'gohan', 'nasi; makan', 'rice; meal'),
            W('晩ご飯', 'ばんごはん', 'bangohan', 'makan malam', 'dinner'),
        ]),
        K('茶', 'cha', ['チャ', 'サ'], [], 'teh', 'tea', [
            W('お茶', 'おちゃ', 'ocha', 'teh', 'tea'),
            W('茶色', 'ちゃいろ', 'chairo', 'cokelat (warna)', 'brown'),
        ]),
        K('菜', 'sai', ['サイ'], ['な'], 'sayuran', 'vegetable; greens', [
            W('野菜', 'やさい', 'yasai', 'sayur', 'vegetables'),
            W('菜の花', 'なのはな', 'nanohana', 'bunga sesawi', 'rapeseed blossoms'),
        ]),
        K('料', 'ryou', ['リョウ'], [], 'bahan; tarif', 'materials; fee', [
            W('料理', 'りょうり', 'ryouri', 'masakan', 'cooking'),
            W('料金', 'りょうきん', 'ryoukin', 'tarif', 'charge'),
        ]),
        K('味', 'aji', ['ミ'], ['あじ', 'あじ(わう)'], 'rasa', 'taste', [
            W('意味', 'いみ', 'imi', 'arti', 'meaning'),
            W('趣味', 'しゅみ', 'shumi', 'hobi', 'hobby'),
        ]),
        K('洋', 'you', ['ヨウ'], [], 'samudra; Barat', 'ocean; Western', [
            W('洋服', 'ようふく', 'youfuku', 'pakaian (gaya Barat)', 'Western clothes'),
            W('太平洋', 'たいへいよう', 'taiheiyou', 'Samudra Pasifik', 'Pacific Ocean'),
        ]),
        K('服', 'fuku', ['フク'], [], 'pakaian', 'clothes', [
            W('服', 'ふく', 'fuku', 'baju', 'clothes'),
            W('制服', 'せいふく', 'seifuku', 'seragam', 'uniform'),
        ]),
        K('品', 'shina', ['ヒン'], ['しな'], 'barang; mutu', 'goods', [
            W('品物', 'しなもの', 'shinamono', 'barang', 'goods'),
            W('作品', 'さくひん', 'sakuhin', 'karya', 'work (of art)'),
        ]),
        K('物', 'mono', ['ブツ', 'モツ'], ['もの'], 'benda', 'thing', [
            W('買い物', 'かいもの', 'kaimono', 'belanja', 'shopping'),
            W('荷物', 'にもつ', 'nimotsu', 'barang bawaan', 'luggage'),
        ]),
        K('買', 'kau', ['バイ'], ['か(う)'], 'membeli', 'buy', [
            W('買う', 'かう', 'kau', 'membeli', 'to buy'),
            W('売買', 'ばいばい', 'baibai', 'jual beli', 'trade'),
        ]),
        K('売', 'uru', ['バイ'], ['う(る)', 'う(れる)'], 'menjual', 'sell', [
            W('売る', 'うる', 'uru', 'menjual', 'to sell'),
            W('売り場', 'うりば', 'uriba', 'bagian penjualan', 'sales counter'),
        ]),
        K('貸', 'kasu', ['タイ'], ['か(す)'], 'meminjamkan', 'lend', [
            W('貸す', 'かす', 'kasu', 'meminjamkan', 'to lend'),
            W('賃貸', 'ちんたい', 'chintai', 'sewa', 'rental'),
        ]),
        K('借', 'kariru', ['シャク'], ['か(りる)'], 'meminjam', 'borrow', [
            W('借りる', 'かりる', 'kariru', 'meminjam', 'to borrow'),
            W('借金', 'しゃっきん', 'shakkin', 'utang', 'debt'),
        ]),
        K('銀', 'gin', ['ギン'], [], 'perak', 'silver', [
            W('銀行', 'ぎんこう', 'ginkou', 'bank', 'bank'),
            W('銀色', 'ぎんいろ', "gin'iro", 'warna perak', 'silver color'),
        ]),
        K('旅', 'tabi', ['リョ'], ['たび'], 'perjalanan', 'travel', [
            W('旅行', 'りょこう', 'ryokou', 'wisata; perjalanan', 'trip'),
            W('旅館', 'りょかん', 'ryokan', 'penginapan Jepang', 'Japanese inn'),
        ]),
        K('便', 'ben', ['ベン', 'ビン'], ['たよ(り)'], 'praktis; pos', 'convenient; mail', [
            W('便利', 'べんり', 'benri', 'praktis', 'convenient'),
            W('郵便局', 'ゆうびんきょく', 'yuubinkyoku', 'kantor pos', 'post office'),
        ]),
        K('利', 'ri', ['リ'], ['き(く)'], 'manfaat; untung', 'benefit; profit', [
            W('利用', 'りよう', 'riyou', 'pemanfaatan', 'use'),
            W('有利', 'ゆうり', 'yuuri', 'menguntungkan', 'advantageous'),
        ]),
        K('有', 'yuu', ['ユウ', 'ウ'], ['あ(る)'], 'ada; memiliki', 'have; exist', [
            W('有名', 'ゆうめい', 'yuumei', 'terkenal', 'famous'),
            W('有料', 'ゆうりょう', 'yuuryou', 'berbayar', 'paid (not free)'),
        ]),
    ]),
    ('Pekerjaan & masyarakat', 'Work & society', None, None, [
        K('仕', 'shi', ['シ', 'ジ'], ['つか(える)'], 'melayani', 'serve', [
            W('仕事', 'しごと', 'shigoto', 'pekerjaan', 'job'),
            W('仕方', 'しかた', 'shikata', 'cara', 'way (of doing)'),
        ]),
        K('事', 'koto', ['ジ', 'ズ'], ['こと'], 'hal; urusan', 'matter; affair', [
            W('事故', 'じこ', 'jiko', 'kecelakaan', 'accident'),
            W('事務所', 'じむしょ', 'jimusho', 'kantor', 'office'),
        ]),
        K('社', 'sha', ['シャ', 'ジャ'], ['やしろ'], 'perusahaan; kuil', 'company; shrine', [
            W('会社', 'かいしゃ', 'kaisha', 'perusahaan', 'company'),
            W('神社', 'じんじゃ', 'jinja', 'kuil Shinto', 'Shinto shrine'),
        ]),
        K('会', 'kai', ['カイ', 'エ'], ['あ(う)'], 'bertemu; perkumpulan', 'meet; association', [
            W('会う', 'あう', 'au', 'bertemu', 'to meet'),
            W('会議', 'かいぎ', 'kaigi', 'rapat', 'meeting'),
        ]),
        K('業', 'gyou', ['ギョウ', 'ゴウ'], ['わざ'], 'usaha; industri', 'business; industry', [
            W('授業', 'じゅぎょう', 'jugyou', 'pelajaran (di kelas)', 'class (lesson)'),
            W('卒業', 'そつぎょう', 'sotsugyou', 'lulus', 'graduation'),
        ]),
        K('工', 'kou', ['コウ', 'ク'], [], 'kerajinan; teknik', 'craft; engineering', [
            W('工場', 'こうじょう', 'koujou', 'pabrik', 'factory'),
            W('工事', 'こうじ', 'kouji', 'pekerjaan konstruksi', 'construction work'),
        ]),
        K('働', 'hataraku', ['ドウ'], ['はたら(く)'], 'bekerja', 'work', [
            W('働く', 'はたらく', 'hataraku', 'bekerja', 'to work'),
            W('労働', 'ろうどう', 'roudou', 'kerja; buruh', 'labor'),
        ]),
        K('産', 'san', ['サン'], ['う(む)'], 'melahirkan; menghasilkan', 'give birth; produce', [
            W('お土産', 'おみやげ', 'omiyage', 'oleh-oleh', 'souvenir'),
            W('産業', 'さんぎょう', 'sangyou', 'industri', 'industry (sector)'),
        ]),
        K('公', 'kou', ['コウ'], ['おおやけ'], 'umum; publik', 'public', [
            W('公園', 'こうえん', 'kouen', 'taman', 'park'),
            W('公務員', 'こうむいん', 'koumuin', 'pegawai negeri', 'civil servant'),
        ]),
        K('特', 'toku', ['トク'], [], 'khusus', 'special', [
            W('特に', 'とくに', 'tokuni', 'terutama', 'especially'),
            W('特別', 'とくべつ', 'tokubetsu', 'istimewa', 'special'),
        ]),
        K('別', 'betsu', ['ベツ'], ['わか(れる)'], 'berbeda; berpisah', 'separate; different', [
            W('別れる', 'わかれる', 'wakareru', 'berpisah', 'to part'),
            W('区別', 'くべつ', 'kubetsu', 'pembedaan', 'distinction'),
        ]),
        K('計', 'kei', ['ケイ'], ['はか(る)'], 'mengukur; menghitung', 'measure; total', [
            W('合計', 'ごうけい', 'goukei', 'jumlah total', 'total'),
            W('計算', 'けいさん', 'keisan', 'perhitungan', 'calculation'),
        ]),
        K('用', 'you', ['ヨウ'], ['もち(いる)'], 'keperluan; guna', 'errand; utility', [
            W('用事', 'ようじ', 'youji', 'urusan', 'errand'),
            W('用意', 'ようい', 'youi', 'persiapan', 'preparation'),
        ]),
        K('使', 'tsukau', ['シ'], ['つか(う)'], 'memakai; menggunakan', 'use', [
            W('使う', 'つかう', 'tsukau', 'memakai', 'to use'),
            W('使用', 'しよう', 'shiyou', 'pemakaian', 'usage'),
        ]),
        K('以', 'i', ['イ'], [], 'dari; sejak (patokan)', 'by means of; from', [
            W('以上', 'いじょう', 'ijou', 'lebih dari; sekian', 'more than'),
            W('以外', 'いがい', 'igai', 'selain', 'except'),
        ]),
        K('方', 'kata', ['ホウ'], ['かた'], 'arah; cara', 'direction; way', [
            W('方法', 'ほうほう', 'houhou', 'metode', 'method'),
            W('両方', 'りょうほう', 'ryouhou', 'keduanya', 'both'),
        ]),
        K('意', 'i', ['イ'], [], 'maksud; pikiran', 'intention', [
            W('意見', 'いけん', 'iken', 'pendapat', 'opinion'),
            W('注意', 'ちゅうい', 'chuui', 'perhatian; peringatan', 'caution'),
        ]),
        K('注', 'chuu', ['チュウ'], ['そそ(ぐ)'], 'menuang; memperhatikan', 'pour; note', [
            W('注文', 'ちゅうもん', 'chuumon', 'pesanan', 'order'),
            W('注射', 'ちゅうしゃ', 'chuusha', 'suntikan', 'injection'),
        ]),
        K('発', 'hatsu', ['ハツ', 'ホツ'], [], 'berangkat; muncul', 'depart; emit', [
            W('発音', 'はつおん', 'hatsuon', 'pelafalan', 'pronunciation'),
            W('発表', 'はっぴょう', 'happyou', 'presentasi; pengumuman', 'presentation'),
        ]),
        K('不', 'fu', ['フ', 'ブ'], [], 'tidak; bukan', 'not; un-', [
            W('不便', 'ふべん', 'fuben', 'tidak praktis', 'inconvenient'),
            W('不安', 'ふあん', 'fuan', 'cemas', 'anxiety'),
        ]),
    ]),
    ('Gerak & aktivitas', 'Movement & activities', None, None, [
        K('走', 'hashiru', ['ソウ'], ['はし(る)'], 'berlari', 'run', [
            W('走る', 'はしる', 'hashiru', 'berlari', 'to run'),
            W('競走', 'きょうそう', 'kyousou', 'lomba lari', 'race'),
        ]),
        K('歩', 'aruku', ['ホ', 'ブ', 'ポ'], ['ある(く)', 'あゆ(む)'], 'berjalan kaki', 'walk', [
            W('歩く', 'あるく', 'aruku', 'berjalan', 'to walk'),
            W('散歩', 'さんぽ', 'sanpo', 'jalan-jalan', 'stroll'),
        ]),
        K('起', 'okiru', ['キ'], ['お(きる)', 'お(こす)'], 'bangun', 'wake up; rise', [
            W('起きる', 'おきる', 'okiru', 'bangun', 'to get up'),
            W('起こす', 'おこす', 'okosu', 'membangunkan', 'to wake someone'),
        ]),
        K('着', 'kiru', ['チャク'], ['き(る)', 'つ(く)'], 'memakai (baju); tiba', 'wear; arrive', [
            W('着る', 'きる', 'kiru', 'memakai (baju)', 'to wear'),
            W('着く', 'つく', 'tsuku', 'tiba', 'to arrive'),
        ]),
        K('乗', 'noru', ['ジョウ'], ['の(る)', 'の(せる)'], 'naik (kendaraan)', 'ride', [
            W('乗る', 'のる', 'noru', 'naik', 'to ride'),
            W('乗客', 'じょうきゃく', 'joukyaku', 'penumpang', 'passenger'),
        ]),
        K('送', 'okuru', ['ソウ'], ['おく(る)'], 'mengirim', 'send', [
            W('送る', 'おくる', 'okuru', 'mengirim; mengantar', 'to send'),
            W('放送', 'ほうそう', 'housou', 'siaran', 'broadcast'),
        ]),
        K('運', 'un', ['ウン'], ['はこ(ぶ)'], 'mengangkut; nasib', 'carry; luck', [
            W('運ぶ', 'はこぶ', 'hakobu', 'mengangkut', 'to carry'),
            W('運動', 'うんどう', 'undou', 'olahraga', 'exercise'),
        ]),
        K('転', 'ten', ['テン'], ['ころ(ぶ)'], 'berguling; berpindah', 'roll; shift', [
            W('運転', 'うんてん', 'unten', 'mengemudi', 'driving'),
            W('転ぶ', 'ころぶ', 'korobu', 'jatuh terjungkal', 'to fall over'),
        ]),
        K('動', 'ugoku', ['ドウ'], ['うご(く)'], 'bergerak', 'move', [
            W('動く', 'うごく', 'ugoku', 'bergerak', 'to move'),
            W('動物', 'どうぶつ', 'doubutsu', 'binatang', 'animal'),
        ]),
        K('通', 'tooru', ['ツウ'], ['とお(る)', 'かよ(う)'], 'melewati; pulang-pergi', 'pass through; commute', [
            W('通う', 'かよう', 'kayou', 'pulang-pergi rutin', 'to commute'),
            W('交通', 'こうつう', 'koutsuu', 'lalu lintas', 'traffic'),
        ]),
        K('進', 'susumu', ['シン'], ['すす(む)'], 'maju', 'advance', [
            W('進む', 'すすむ', 'susumu', 'maju', 'to advance'),
            W('進歩', 'しんぽ', 'shinpo', 'kemajuan', 'progress'),
        ]),
        K('引', 'hiku', ['イン'], ['ひ(く)'], 'menarik', 'pull', [
            W('引く', 'ひく', 'hiku', 'menarik', 'to pull'),
            W('引っ越し', 'ひっこし', 'hikkoshi', 'pindah rumah', 'moving house'),
        ]),
        K('帰', 'kaeru', ['キ'], ['かえ(る)', 'かえ(す)'], 'pulang', 'return home', [
            W('帰る', 'かえる', 'kaeru', 'pulang', 'to go home'),
            W('帰国', 'きこく', 'kikoku', 'pulang ke negeri asal', 'return to one\'s country'),
        ]),
        K('去', 'kyo', ['キョ', 'コ'], ['さ(る)'], 'pergi; lampau', 'leave; past', [
            W('去年', 'きょねん', 'kyonen', 'tahun lalu', 'last year'),
            W('過去', 'かこ', 'kako', 'masa lalu', 'the past'),
        ]),
        K('開', 'aku', ['カイ'], ['あ(く)', 'あ(ける)', 'ひら(く)'], 'membuka', 'open', [
            W('開ける', 'あける', 'akeru', 'membuka', 'to open'),
            W('公開', 'こうかい', 'koukai', 'dibuka untuk umum', 'public release'),
        ]),
        K('止', 'tomaru', ['シ'], ['と(まる)', 'と(める)'], 'berhenti', 'stop', [
            W('止まる', 'とまる', 'tomaru', 'berhenti', 'to stop'),
            W('中止', 'ちゅうし', 'chuushi', 'pembatalan', 'cancellation'),
        ]),
        K('待', 'matsu', ['タイ'], ['ま(つ)'], 'menunggu', 'wait', [
            W('待つ', 'まつ', 'matsu', 'menunggu', 'to wait'),
            W('招待', 'しょうたい', 'shoutai', 'undangan', 'invitation'),
        ]),
        K('持', 'motsu', ['ジ'], ['も(つ)'], 'memegang; membawa', 'hold', [
            W('持つ', 'もつ', 'motsu', 'memegang; membawa', 'to hold'),
            W('持参', 'じさん', 'jisan', 'membawa sendiri', 'bringing (with oneself)'),
        ]),
        K('集', 'atsumeru', ['シュウ'], ['あつ(まる)', 'あつ(める)'], 'mengumpulkan', 'gather', [
            W('集める', 'あつめる', 'atsumeru', 'mengumpulkan', 'to collect'),
            W('集合', 'しゅうごう', 'shuugou', 'berkumpul', 'assembly'),
        ]),
        K('合', 'au', ['ゴウ', 'ガッ'], ['あ(う)'], 'cocok; menggabung', 'fit; combine', [
            W('合う', 'あう', 'au', 'cocok', 'to fit'),
            W('合格', 'ごうかく', 'goukaku', 'lulus (ujian)', 'passing an exam'),
        ]),
        K('切', 'kiru', ['セツ', 'サイ'], ['き(る)', 'き(れる)'], 'memotong', 'cut', [
            W('大切', 'たいせつ', 'taisetsu', 'penting; berharga', 'precious'),
            W('切符', 'きっぷ', 'kippu', 'tiket', 'ticket'),
        ]),
        K('作', 'tsukuru', ['サク', 'サ'], ['つく(る)'], 'membuat', 'make', [
            W('作る', 'つくる', 'tsukuru', 'membuat', 'to make'),
            W('作文', 'さくぶん', 'sakubun', 'karangan', 'essay'),
        ]),
        K('思', 'omou', ['シ'], ['おも(う)'], 'berpikir; merasa', 'think (feel)', [
            W('思う', 'おもう', 'omou', 'berpikir', 'to think'),
            W('思い出', 'おもいで', 'omoide', 'kenangan', 'memory'),
        ]),
        K('考', 'kangaeru', ['コウ'], ['かんが(える)'], 'menimbang; memikirkan', 'consider', [
            W('考える', 'かんがえる', 'kangaeru', 'memikirkan', 'to consider'),
            W('参考', 'さんこう', 'sankou', 'referensi', 'reference'),
        ]),
        K('知', 'shiru', ['チ'], ['し(る)'], 'mengetahui', 'know', [
            W('知り合い', 'しりあい', 'shiriai', 'kenalan', 'acquaintance'),
            W('知識', 'ちしき', 'chishiki', 'pengetahuan', 'knowledge'),
        ]),
        K('急', 'isogu', ['キュウ'], ['いそ(ぐ)'], 'bergegas; mendadak', 'hurry; sudden', [
            W('急ぐ', 'いそぐ', 'isogu', 'bergegas', 'to hurry'),
            W('急に', 'きゅうに', 'kyuuni', 'tiba-tiba', 'suddenly'),
        ]),
        K('洗', 'arau', ['セン'], ['あら(う)'], 'mencuci', 'wash', [
            W('洗う', 'あらう', 'arau', 'mencuci', 'to wash'),
            W('洗濯', 'せんたく', 'sentaku', 'cucian', 'laundry'),
        ]),
    ]),
    ('Sifat & keadaan', 'Qualities & states', None, None, [
        K('同', 'onaji', ['ドウ'], ['おな(じ)'], 'sama', 'same', [
            W('同じ', 'おなじ', 'onaji', 'sama', 'same'),
            W('同級生', 'どうきゅうせい', 'doukyuusei', 'teman sekelas', 'classmate'),
        ]),
        K('元', 'moto', ['ゲン', 'ガン'], ['もと'], 'asal; dasar', 'origin', [
            W('地元', 'じもと', 'jimoto', 'kampung halaman', 'hometown'),
            W('元日', 'がんじつ', 'ganjitsu', 'hari Tahun Baru', "New Year's Day"),
        ]),
        K('重', 'omoi', ['ジュウ', 'チョウ'], ['おも(い)', 'かさ(ねる)'], 'berat', 'heavy', [
            W('重い', 'おもい', 'omoi', 'berat', 'heavy'),
            W('貴重', 'きちょう', 'kichou', 'berharga', 'valuable'),
        ]),
        K('近', 'chikai', ['キン'], ['ちか(い)'], 'dekat', 'near', [
            W('近い', 'ちかい', 'chikai', 'dekat', 'near'),
            W('最近', 'さいきん', 'saikin', 'akhir-akhir ini', 'recently'),
        ]),
        K('遠', 'tooi', ['エン', 'オン'], ['とお(い)'], 'jauh', 'far', [
            W('遠い', 'とおい', 'tooi', 'jauh', 'far'),
            W('遠足', 'えんそく', 'ensoku', 'darmawisata', 'school excursion'),
        ]),
        K('足', 'ashi', ['ソク'], ['あし', 'た(りる)'], 'kaki; cukup', 'foot; suffice', [
            W('足りる', 'たりる', 'tariru', 'cukup', 'to be enough'),
            W('不足', 'ふそく', 'fusoku', 'kekurangan', 'shortage'),
        ]),
        K('寒', 'samui', ['カン'], ['さむ(い)'], 'dingin (cuaca)', 'cold (weather)', [
            W('寒い', 'さむい', 'samui', 'dingin', 'cold'),
            W('寒さ', 'さむさ', 'samusa', 'hawa dingin', 'coldness'),
        ]),
        K('暑', 'atsui', ['ショ'], ['あつ(い)'], 'panas (cuaca)', 'hot (weather)', [
            W('暑い', 'あつい', 'atsui', 'panas', 'hot'),
            W('暑さ', 'あつさ', 'atsusa', 'hawa panas', 'heat'),
        ]),
        K('暗', 'kurai', ['アン'], ['くら(い)'], 'gelap', 'dark', [
            W('暗い', 'くらい', 'kurai', 'gelap', 'dark'),
            W('暗記', 'あんき', 'anki', 'hafalan', 'memorization'),
        ]),
        K('明', 'akarui', ['メイ', 'ミョウ'], ['あか(るい)', 'あ(ける)'], 'terang', 'bright', [
            W('明るい', 'あかるい', 'akarui', 'terang; ceria', 'bright'),
            W('発明', 'はつめい', 'hatsumei', 'penemuan', 'invention'),
        ]),
        K('軽', 'karui', ['ケイ'], ['かる(い)'], 'ringan', 'light (weight)', [
            W('軽い', 'かるい', 'karui', 'ringan', 'light'),
            W('手軽', 'てがる', 'tegaru', 'mudah; praktis', 'easy; handy'),
        ]),
        K('弱', 'yowai', ['ジャク'], ['よわ(い)'], 'lemah', 'weak', [
            W('弱い', 'よわい', 'yowai', 'lemah', 'weak'),
            W('弱点', 'じゃくてん', 'jakuten', 'kelemahan', 'weakness'),
        ]),
        K('太', 'futoi', ['タイ', 'タ'], ['ふと(い)', 'ふと(る)'], 'gemuk; tebal', 'fat; thick', [
            W('太る', 'ふとる', 'futoru', 'bertambah gemuk', 'to gain weight'),
            W('太陽', 'たいよう', 'taiyou', 'matahari', 'the sun'),
        ]),
        K('低', 'hikui', ['テイ'], ['ひく(い)'], 'rendah', 'low', [
            W('低い', 'ひくい', 'hikui', 'rendah', 'low'),
            W('最低', 'さいてい', 'saitei', 'paling rendah; terburuk', 'lowest'),
        ]),
        K('短', 'mijikai', ['タン'], ['みじか(い)'], 'pendek', 'short', [
            W('短い', 'みじかい', 'mijikai', 'pendek', 'short'),
            W('短所', 'たんしょ', 'tansho', 'kekurangan', 'shortcoming'),
        ]),
        K('広', 'hiroi', ['コウ'], ['ひろ(い)'], 'luas', 'wide', [
            W('広い', 'ひろい', 'hiroi', 'luas', 'wide'),
            W('広告', 'こうこく', 'koukoku', 'iklan', 'advertisement'),
        ]),
        K('多', 'ooi', ['タ'], ['おお(い)'], 'banyak', 'many', [
            W('多い', 'おおい', 'ooi', 'banyak', 'many'),
            W('多分', 'たぶん', 'tabun', 'mungkin', 'probably'),
        ]),
        K('少', 'sukoshi', ['ショウ'], ['すく(ない)', 'すこ(し)'], 'sedikit', 'few; little', [
            W('少し', 'すこし', 'sukoshi', 'sedikit', 'a little'),
            W('少年', 'しょうねん', 'shounen', 'anak laki-laki', 'boy'),
        ]),
        K('好', 'suki', ['コウ'], ['す(き)', 'この(む)'], 'suka', 'like', [
            W('好き', 'すき', 'suki', 'suka', 'liked'),
            W('好物', 'こうぶつ', 'koubutsu', 'makanan kesukaan', 'favorite food'),
        ]),
        K('悪', 'warui', ['アク', 'オ'], ['わる(い)'], 'buruk; jahat', 'bad', [
            W('悪い', 'わるい', 'warui', 'buruk', 'bad'),
            W('最悪', 'さいあく', 'saiaku', 'terburuk', 'the worst'),
        ]),
        K('正', 'tadashii', ['セイ', 'ショウ'], ['ただ(しい)'], 'benar; lurus', 'correct', [
            W('正しい', 'ただしい', 'tadashii', 'benar', 'correct'),
            W('正直', 'しょうじき', 'shoujiki', 'jujur', 'honest'),
        ]),
        K('真', 'ma', ['シン'], ['ま'], 'sejati; tepat', 'true; genuine', [
            W('真面目', 'まじめ', 'majime', 'serius; tekun', 'earnest'),
            W('真夜中', 'まよなか', 'mayonaka', 'tengah malam buta', 'dead of night'),
        ]),
        K('早', 'hayai', ['ソウ', 'サッ'], ['はや(い)'], 'cepat; awal', 'early', [
            W('早速', 'さっそく', 'sassoku', 'segera', 'at once'),
            W('早口', 'はやくち', 'hayakuchi', 'bicara cepat', 'fast talking'),
        ]),
    ]),
]
