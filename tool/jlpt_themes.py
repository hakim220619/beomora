# Pengelompokan & urutan tema kosakata JLPT untuk gen_jlpt.py.
#
# Sumber kata tetap di gen_jlpt.py / jlpt_n5_extra.py / jlpt_n4_extra.py;
# komentar "# Label" di atas tiap blok dibaca sebagai label sumber.
# Di sini label-label itu digabung menjadi tema yang rapi (data dasar +
# tambahan tidak lagi terpencar), dengan urutan eksplisit untuk kelompok
# yang punya urutan alami (angka, waktu lampau → kini → depan, bulan…).
#
# Tiap tema: (kunci, judul_id, judul_en, label_sumber, urutan, tambahan)
#   label_sumber : kata dari label ini masuk tema ini (urutan sumber)
#   urutan       : kata (kana) yang ditaruh PALING DEPAN, persis urut —
#                  sekaligus memindahkan kata itu dari label aslinya
#   tambahan     : kata yang dipindah ke tema ini, ditaruh di BELAKANG
# Kata tanpa tema = galat (generator berhenti), jadi tidak ada yang
# hilang diam-diam saat data ditambah.

import re

_TUPLE = re.compile(
    r'\(\s*"((?:[^"\\]|\\.)*)"\s*,\s*"((?:[^"\\]|\\.)*)"\s*,'
    r'\s*"((?:[^"\\]|\\.)*)"\s*,\s*"((?:[^"\\]|\\.)*)"\s*\)')


def labels(path, listname):
    """Label komentar untuk tiap baris list `listname` di file sumber,
    berurutan sama dengan isi list-nya."""
    out, label, inside = [], None, False
    for line in open(path, encoding='utf-8').read().split('\n'):
        if re.match(rf'^{listname}\s*=\s*\[', line):
            inside, label = True, None
            continue
        if not inside:
            continue
        if re.match(r'^\]', line):
            break
        m = re.match(r'^\s*#\s*(.+)$', line)
        if m:
            label = m.group(1).strip()
            continue
        for t in _TUPLE.findall(line):
            out.append((label, t[0]))
    return out


def _w(s):
    return s.split()


N5 = [
    ('angka', 'Angka', 'Numbers', ['Angka & hitungan'], _w(
        'ゼロ れい いち に さん し よん ご ろく しち なな はち く きゅう '
        'じゅう ひゃく さんびゃく ろっぴゃく はっぴゃく せん さんぜん '
        'はっせん まん はんぶん かず ぐらい'), []),
    ('hitungan', 'Hitungan benda & orang', 'Counting things & people', [
        'Angka (bacaan lain) & hitungan benda (ひとつ…)',
        'Kata bantu bilangan (contoh pemakaian)',
        'Bilangan dengan perubahan bunyi', 'Satuan'], _w(
        'ひとつ ふたつ みっつ よっつ いつつ むっつ ななつ やっつ ここのつ '
        'とお いくつ ひとり ふたり なんにん おおぜい いちまい なんまい '
        'いっぽん さんぼん ろっぽん はっぽん なんぼん いっぴき さんびき '
        'ろっぴき なんびき いっさつ いちだい いっこ いっぱい いっかい '
        'さんがい なんかい なんさい はたち ばんごう なんばん キロ グラム '
        'メートル'), []),
    ('waktu_hari', 'Waktu: hari & bagian hari', 'Time: days & times of day',
     ['Waktu', 'Ungkapan waktu'], _w(
        'おととい きのう きょう あした あさって いま あさ けさ ひる '
        'ゆうがた ばん よる こんばん ゆうべ ごぜん ごご まいにち まいあさ '
        'まいばん'), []),
    ('waktu_periode', 'Waktu: minggu, bulan & tahun',
     'Time: weeks, months & years', [], _w(
        'しゅう せんしゅう こんしゅう らいしゅう さらいしゅう まいしゅう '
        'つき せんげつ こんげつ らいげつ まいつき '
        'とし おととし きょねん ことし らいねん さらいねん まいとし'), []),
    ('jam', 'Jam & durasi', 'Clock time & duration', ['Jam & durasi'], _w(
        'じかん なんじ よじ しちじ くじ はん すぎ ごろ びょう ふん いっぷん '
        'さんぷん よんぷん ろっぷん はっぷん じっぷん いっしゅうかん '
        'ひとつき いっかげつ'), []),
    ('kalender', 'Hari, tanggal & bulan', 'Weekdays, dates & months',
     ['Hari dalam seminggu', 'Bulan', 'Tanggal'], _w(
        'げつようび かようび すいようび もくようび きんようび どようび '
        'にちようび なんようび ついたち ふつか みっか よっか いつか むいか '
        'なのか ようか ここのか とおか じゅうよっか はつか なんにち '
        'いちがつ にがつ さんがつ しがつ ごがつ ろくがつ しちがつ はちがつ '
        'くがつ じゅうがつ じゅういちがつ じゅうにがつ なんがつ '
        'たんじょうび'), []),
    ('waktu_lain', 'Ungkapan waktu lain', 'Other time expressions', [], _w(
        'まえ あと とき はじめ つぎ さき これから やすみ ひるやすみ '
        'なつやすみ'), []),
    ('musim', 'Musim & cuaca', 'Seasons & weather', ['Musim & cuaca'], _w(
        'はる なつ あき ふゆ てんき はれ くもり あめ ゆき かぜ あたたかい '
        'すずしい つめたい 風邪'), []),
    ('alam', 'Alam & hewan', 'Nature & animals', ['Alam', 'Alam & hewan'],
     _w('そら やま かわ うみ き 花 月 ほし どうぶつ とり いぬ ねこ ペット'),
     []),
    ('keluarga', 'Keluarga', 'Family', ['Keluarga'], _w(
        'かぞく りょうしん ちち はは おとうさん おかあさん あに あね '
        'おにいさん おねえさん おとうと いもうと きょうだい おじいさん '
        'おばあさん おじさん おばさん おくさん こども'), []),
    ('orang', 'Orang & profesi', 'People & occupations',
     ['Orang', 'Keluarga & orang'], _w(
        'わたし ぼく あなた かれ かのじょ じぶん ひと かた おとこ おんな '
        'おとこのひと おんなのひと おとこのこ おんなのこ おとな ともだち '
        'みなさん みんな なまえ がくせい りゅうがくせい せんせい '
        'かいしゃいん いしゃ けいかん おまわりさん にほんじん がいこくじん '
        'がいこく'), []),
    ('tubuh', 'Tubuh & kesehatan', 'Body & health',
     ['Tubuh', 'Tubuh & kesehatan'], [], []),
    ('makanan', 'Makanan & minuman', 'Food & drinks',
     ['Makanan & minuman'], [], _w('ビール ケーキ')),
    ('dapur', 'Peralatan makan & dapur', 'Tableware & kitchen',
     ['Peralatan makan & dapur'], [], []),
    ('pakaian', 'Pakaian', 'Clothing', ['Pakaian'], _w('ふく くつ'), []),
    ('benda', 'Benda di rumah & sekitar', 'Things at home & around',
     ['Benda sehari-hari', 'Benda di rumah & sekitar'], [],
     _w('パソコン こと')),
    ('alat_tulis', 'Buku, alat tulis & surat', 'Books, stationery & mail',
     ['Alat tulis & surat'], _w(
        'ほん ノート かみ ペン ボールペン えんぴつ まんねんひつ じしょ '
        'じびき しんぶん ざっし ページ コピー てがみ はがき きって ふうとう '
        'ポスト'), []),
    ('sekolah', 'Sekolah & bahasa', 'School & language',
     ['Sekolah & bahasa'], [], _w('しつもん もんだい')),
    ('kegiatan', 'Kegiatan, hobi & pekerjaan', 'Activities, hobbies & work',
     ['Kegiatan (kata benda)'], _w(
        'しごと かいもの さんぽ そうじ せんたく りょこう けっこん うた '
        'おんがく えいが ニュース スポーツ テニス サッカー ピアノ '
        'パーティー'), []),
    ('tempat', 'Tempat & bangunan', 'Places & buildings',
     ['Tempat', 'Tempat & bangunan'], [], _w('かいしゃ')),
    ('posisi', 'Posisi & arah', 'Position & direction', ['Posisi & arah'],
     [], []),
    ('transportasi', 'Transportasi', 'Transportation', ['Transportasi'], _w(
        'くるま じどうしゃ でんしゃ ちかてつ バス タクシー じてんしゃ '
        'ひこうき きっぷ'), []),
    ('warna', 'Warna', 'Colors', ['Warna'], _w(
        'いろ あか あかい あお あおい しろ しろい くろ くろい きいろ '
        'きいろい みどり ちゃいろ'), []),
    ('kata_kerja', 'Kata kerja', 'Verbs',
     ['Kata kerja', 'Kata kerja (godan / ichidan / irregular)'],
     _w('ある いる'), _w('はじめる おわる わすれる おぼえる わたす')),
    ('kata_kerja_suru', 'Kata kerja する', 'する verbs', ['Kata kerja する'],
     [], []),
    ('sifat_i', 'Kata sifat -i', 'I-adjectives',
     ['Warna & sifat', 'Kata sifat -i'], [], []),
    ('sifat_na', 'Kata sifat -na', 'Na-adjectives',
     ['Kata sifat -na (ditulis tanpa な)'], [],
     _w('べんり かんたん しんせつ たいせつ じょうぶ ゆうめい')),
    ('adverbia', 'Adverbia', 'Adverbs', ['Adverbia & lain', 'Adverbia'], [],
     _w('ぜんぜん たいてい')),
    ('tanya', 'Kata tanya', 'Question words', ['Kata tanya'], _w(
        'なに なん だれ どなた どこ どれ いつ なぜ どうして どう いかが '
        'いくら どのくらい どうやって だれか なにか'), []),
    ('tunjuk', 'Kata tunjuk', 'Demonstratives',
     ['Kata tanya & tunjuk', 'Kata tunjuk'], _w('これ それ あれ'), []),
    ('sambung', 'Kata sambung', 'Conjunctions', ['Kata sambung'], [], []),
    ('sapaan', 'Sapaan & ungkapan', 'Greetings & expressions',
     ['Sapaan & ungkapan'], _w(
        'おはよう おはようございます こんにちは こんばんは おやすみ '
        'おやすみなさい さようなら じゃあまた ありがとう ありがとうございます '
        'どうも どういたしまして すみません ごめんなさい'),
     _w('そうですね そうですか')),
]

N4 = [
    ('orang', 'Keluarga & orang', 'Family & people', ['Keluarga & orang'],
     [], []),
    ('sekolah', 'Sekolah & belajar', 'School & study', ['Sekolah & belajar'],
     [], _w('せんぱい きょうかしょ こたえ せいせき ちしき れきし かがく ちり')),
    ('kerja', 'Kerja & masyarakat', 'Work & society', ['Kerja & masyarakat'],
     [], _w(
        'しゃかい せいかつ しゃちょう しゃいん じょうし どうりょう てんいん '
        'きゃく うけつけ かいぎ よてい やくそく つごう じゅんび せいさん '
        'けいざい せいじ ぶんか ぎじゅつ こくさい')),
    ('uang', 'Uang & belanja', 'Money & shopping', [], _w(
        'ねだん りょうきん ぜいきん きゅうりょう よさん ちょきん しょうひん '
        'せいひん'), []),
    ('komunikasi', 'Komunikasi & informasi', 'Communication & information',
     [], _w(
        'あいさつ へんじ いけん せつめい じょうほう きじ けいたいでんわ '
        'メール インターネット'), []),
    ('konsep', 'Alasan, cara & hasil', 'Reasons, methods & results', [], _w(
        'りゆう げんいん けっか ほうほう もくてき じゆう きかい けいけん '
        'ないよう しゅるい 例 まちがい ぶぶん じゅんばん れつ いじょう いか '
        'いがい'), []),
    ('kesehatan', 'Kesehatan & perasaan', 'Health & feelings',
     ['Kesehatan & tubuh', 'Kesehatan & perasaan (tambahan)'], [],
     _w('かんじゃ きぶん きもち')),
    ('hiburan', 'Hiburan & olahraga', 'Entertainment & sports',
     ['Hiburan & olahraga (tambahan)'], _w('しゅみ'), []),
    ('transportasi', 'Transportasi & perjalanan', 'Transport & travel',
     ['Transportasi & perjalanan'], [], _w('ホーム')),
    ('kota', 'Kota & tempat', 'Town & places', ['Kota & tempat'], [], []),
    ('rumah', 'Rumah & perabot', 'Home & furniture',
     ['Rumah & perabot', 'Rumah & barang (tambahan)'], [], []),
    ('benda', 'Benda & bahan', 'Things & materials', ['Benda & bahan'], [],
     _w('機械 どうぐ ざいりょう カード')),
    ('makanan', 'Makanan', 'Food', ['Makanan'], [], []),
    ('alam', 'Alam, cuaca & dunia', 'Nature, weather & the world',
     ['Alam & cuaca', 'Alam & hewan (tambahan)'], [],
     _w('しぜん かんきょう せかい じんこう')),
    ('waktu', 'Waktu', 'Time', ['Waktu'], _w(
        'むかし このあいだ さっき さいきん このごろ ひるま しゅうまつ '
        'さらいげつ しょうらい さいしょ さいご ひさしぶり'), []),
    ('kata_kerja_pasangan', 'Kata kerja berpasangan',
     'Paired verbs (intransitive/transitive)',
     ['Kata kerja (intransitif / transitif berpasangan)'], [], []),
    ('kata_kerja', 'Kata kerja', 'Verbs',
     ['Kata kerja N4', 'Kata kerja lain', 'Kata kerja (tambahan)'], [], []),
    ('kata_kerja_sopan', 'Kata kerja sopan', 'Honorific & humble verbs',
     ['Kata kerja sopan (hormat & rendah hati)'], [], []),
    ('kata_kerja_suru', 'Kata kerja する', 'する verbs',
     ['Kata kerja する', 'Kata kerja する (tambahan)'], [], []),
    ('sifat_i', 'Kata sifat -i', 'I-adjectives', ['Kata sifat -i'], [], _w(
        'うまい うらやましい かっこいい きつい くさい くやしい くわしい '
        'こわい したしい すっぱい ずるい つらい なつかしい はげしい '
        'もったいない')),
    ('sifat_na', 'Kata sifat -na', 'Na-adjectives',
     ['Kata sifat -na', 'Sifat N4', 'Kata sifat (tambahan)'], [], []),
    ('adverbia', 'Adverbia & ungkapan', 'Adverbs & expressions',
     ['Adverbia & ungkapan', 'Adverbia & sambungan (tambahan)'], [], []),
    ('sambung', 'Kata sambung', 'Conjunctions', [],
     _w('または それで それに だから ところで'), []),
]

N3 = [
    ('keadaan', 'Sifat & keadaan', 'Traits & conditions', [], _w(
        'のうりょく せいかく たいど じょうたい じょうきょう げんじょう '
        'かんけい えいきょう こうか かいけつ'), []),
    ('rencana', 'Rencana & kegiatan', 'Plans & activities', [], _w(
        'もくひょう けいかく じっこう かつどう さんか きょうりょく'), []),
    ('masyarakat', 'Masyarakat & hukum', 'Society & law', [], _w(
        'せきにん ぎむ けんり きそく ほうりつ せいど せいふ しみん '
        'しゃかいじん こじん だんたい そしき'), []),
    ('ekonomi', 'Ekonomi & industri', 'Economy & industry', [], _w(
        'さんぎょう のうぎょう こうぎょう しょうぎょう ぼうえき とうし りえき '
        'そんがい しげん エネルギー'), []),
    ('lingkungan', 'Lingkungan & bencana', 'Environment & disasters', [],
     _w('かんきょうもんだい おせん さいがい じしん たいふう こうずい'), []),
    ('kata_kerja', 'Kata kerja', 'Verbs', ['Kata kerja N3'], [], []),
    ('sifat', 'Kata sifat', 'Adjectives', ['Sifat N3'], [], []),
]


def arrange(level, rows, row_labels, themes):
    """Susun ulang `rows` per tema. Mengembalikan list (row, idx_tema)."""
    assert len(rows) == len(row_labels), (level, len(rows), len(row_labels))
    for r, (_, k) in zip(rows, row_labels):
        assert r[0] == k, (level, r[0], k)

    def key(r):
        return r[0].rstrip('23')

    by_kana = {}
    for i, r in enumerate(rows):
        by_kana.setdefault(key(r), []).append(i)

    def pick(kana):
        idx = by_kana.get(kana)
        assert idx, f'{level}: kata "{kana}" di jlpt_themes.py tidak ada'
        assert len(idx) == 1, f'{level}: kata "{kana}" ambigu'
        return idx[0]

    owner = {}  # index baris -> index tema
    front, back = {}, {}
    for t, (_, _, _, _, order, extra) in enumerate(themes):
        front[t] = [pick(k) for k in order]
        back[t] = [pick(k) for k in extra]
        for i in front[t] + back[t]:
            assert i not in owner, f'{level}: "{key(rows[i])}" di dua tema'
            owner[i] = t
    label_theme = {}
    for t, th in enumerate(themes):
        for lb in th[3]:
            assert lb not in label_theme, f'{level}: label "{lb}" dobel'
            label_theme[lb] = t
    middle = {t: [] for t in range(len(themes))}
    for i, (lb, _) in enumerate(row_labels):
        if i in owner:
            continue
        assert lb in label_theme, (
            f'{level}: "{key(rows[i])}" (label "{lb}") belum punya tema')
        middle[label_theme[lb]].append(i)

    out = []
    for t in range(len(themes)):
        ids = front[t] + middle[t] + back[t]
        assert ids, f'{level}: tema {themes[t][0]} kosong'
        out += [(rows[i], t) for i in ids]
    assert len(out) == len(rows)
    return out
