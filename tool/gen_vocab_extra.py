#!/usr/bin/env python3
"""Tambah kosakata tematik di lib/data/study_guides.dart dari 18 -> 50 kata.

Tiap tema mendapat 4 bagian baru (8 kata) untuk kursus Jepang (kana +
romaji), Inggris (kata + ejaan baca gaya Indonesia), dan Indonesia.
Aman dijalankan ulang: bagian yang sudah ada (judul sama) dilewati.
Jalankan: python3 tool/gen_vocab_extra.py
"""
import re, sys, pathlib

DART = pathlib.Path(__file__).resolve().parent.parent / 'lib/data/study_guides.dart'

# (id, en, ejaan_en, kana, romaji)
W = lambda *a: a
THEMES = {
 'farming': [
  ('Alat & Pekerjaan Tani', 'Farm Tools & Work', [
    W('petani','farmer','far-mer','のうか','nouka'),
    W('penyiram','sprinkler','sprin-kler','スプリンクラー','supurinkuraa'),
    W('cangkul','hoe','hou','くわ','kuwa'),
    W('sabit','sickle','si-kel','かま','kama'),
    W('sekop','shovel','sya-vel','シャベル','shaberu'),
    W('gerobak dorong','wheelbarrow','wil-be-rou','いちりんしゃ','ichirinsha'),
    W('irigasi','irrigation','i-ri-gei-syen','かんがい','kangai'),
    W('lumbung','granary','gre-ne-ri','くら','kura'),
  ]),
  ('Sayur & Buah', 'Vegetables & Fruit', [
    W('sayuran','vegetable','vej-te-bel','やさい','yasai'),
    W('buah','fruit','frut','くだもの','kudamono'),
    W('jagung','corn','korn','とうもろこし','toumorokoshi'),
    W('kentang','potato','po-tei-tou','じゃがいも','jagaimo'),
    W('wortel','carrot','ke-ret','にんじん','ninjin'),
    W('tomat','tomato','to-mei-tou','トマト','tomato'),
    W('apel','apple','e-pel','りんご','ringo'),
    W('kedelai','soybean','soi-bin','だいず','daizu'),
  ]),
  ('Cuaca & Musim', 'Weather & Seasons', [
    W('hujan','rain','rein','あめ','ame'),
    W('kekeringan','drought','draut','かんばつ','kanbatsu'),
    W('musim','season','si-zen','きせつ','kisetsu'),
    W('musim hujan','rainy season','rei-ni si-zen','つゆ','tsuyu'),
    W('sinar matahari','sunlight','san-lait','にっこう','nikkou'),
    W('angin','wind','wind','かぜ','kaze'),
    W('banjir','flood','flad','こうずい','kouzui'),
    W('hama','pest','pest','がいちゅう','gaichuu'),
  ]),
  ('Ternak & Hasil', 'Animals & Produce', [
    W('sapi','cow','kau','うし','ushi'),
    W('babi','pig','pig','ぶた','buta'),
    W('bebek','duck','dak','あひる','ahiru'),
    W('telur','egg','eg','たまご','tamago'),
    W('susu','milk','milk','ぎゅうにゅう','gyuunyuu'),
    W('pakan ternak','animal feed','e-ni-mel fid','えさ','esa'),
    W('padang rumput','pasture','pas-cer','ぼくそうち','bokusouchi'),
    W('jerami','straw','stro','わら','wara'),
  ]),
 ],
 'sea': [
  ('Di Pelabuhan', 'At the Harbor', [
    W('dermaga','pier','pir','はとば','hatoba'),
    W('jangkar','anchor','eng-ker','いかり','ikari'),
    W('galangan kapal','shipyard','syip-yard','ぞうせんじょ','zousenjo'),
    W('penyelam','diver','dai-ver','ダイバー','daibaa'),
    W('kapten','captain','kep-tin','せんちょう','senchou'),
    W('awak kapal','crew','kru','のりくみいん','norikumiin'),
    W('feri','ferry','fe-ri','フェリー','ferii'),
    W('layar kapal','sail','seil','ほ','ho'),
  ]),
  ('Alat Tangkap', 'Fishing Gear', [
    W('tombak ikan','harpoon','har-pun','もり','mori'),
    W('kail','hook','huk','つりばり','tsuribari'),
    W('umpan','bait','beit','えさ','esa'),
    W('joran','fishing rod','fi-sying rod','つりざお','tsurizao'),
    W('pelampung','buoy','boi','ブイ','bui'),
    W('bubu; perangkap','trap','trep','わな','wana'),
    W('tali tambang','rope','roup','ロープ','roopu'),
    W('ember','bucket','ba-kit','バケツ','baketsu'),
  ]),
  ('Hewan Laut', 'Sea Creatures', [
    W('ikan','fish','fisy','さかな','sakana'),
    W('bintang laut','starfish','star-fisy','ヒトデ','hitode'),
    W('ubur-ubur','jellyfish','je-li-fisy','クラゲ','kurage'),
    W('cumi-cumi','squid','skwid','いか','ika'),
    W('penyu','sea turtle','si ter-tel','ウミガメ','umigame'),
    W('lumba-lumba','dolphin','dol-fin','イルカ','iruka'),
    W('hiu','shark','syark','サメ','same'),
    W('paus','whale','weil','クジラ','kujira'),
  ]),
  ('Cuaca di Laut', 'Weather at Sea', [
    W('kabut','fog','fog','きり','kiri'),
    W('pasang','high tide','hai taid','まんちょう','manchou'),
    W('surut','low tide','lou taid','かんちょう','kanchou'),
    W('badai','storm','storm','あらし','arashi'),
    W('arus laut','ocean current','ou-syen ka-rent','かいりゅう','kairyuu'),
    W('teluk','bay','bei','わん','wan'),
    W('pulau','island','ai-lend','しま','shima'),
    W('rumput laut','seaweed','si-wid','かいそう','kaisou'),
  ]),
 ],
 'office': [
  ('Rapat & Jadwal', 'Meetings & Schedule', [
    W('rapat','meeting','mi-ting','かいぎ','kaigi'),
    W('jadwal','schedule','ske-jul','よてい','yotei'),
    W('pengingat','reminder','ri-main-der','リマインダー','rimaindaa'),
    W('laporan','report','ri-port','ほうこくしょ','houkokusho'),
    W('presentasi','presentation','pre-zen-tei-syen','プレゼン','purezen'),
    W('agenda','agenda','e-jen-da','ぎだい','gidai'),
    W('resepsionis','receptionist','ri-sep-syo-nist','うけつけ','uketsuke'),
    W('notulen','minutes (notes)','mi-nits','ぎじろく','gijiroku'),
  ]),
  ('Perlengkapan Kantor', 'Office Supplies', [
    W('komputer','computer','kom-pyu-ter','パソコン','pasokon'),
    W('mesin fotokopi','photocopier','fou-to-ko-pi-er','コピーき','kopiiki'),
    W('stapler','stapler','stei-pler','ホッチキス','hotchikisu'),
    W('map berkas','folder','foul-der','ファイル','fairu'),
    W('klip kertas','paper clip','pei-per klip','クリップ','kurippu'),
    W('kalender','calendar','ke-len-der','カレンダー','karendaa'),
    W('pulpen','ballpoint pen','bol-point pen','ボールペン','boorupen'),
    W('kertas','paper','pei-per','かみ','kami'),
  ]),
  ('Komunikasi', 'Communication', [
    W('surel','email','i-meil','メール','meeru'),
    W('panggilan telepon','phone call','foun kol','でんわ','denwa'),
    W('pesan','message','me-sij','メッセージ','messeeji'),
    W('klien','client','klai-ent','こきゃく','kokyaku'),
    W('tamu kantor','visitor','vi-zi-ter','らいきゃく','raikyaku'),
    W('kartu nama','business card','biz-nis kard','めいし','meishi'),
    W('rapat daring','online meeting','on-lain mi-ting','オンラインかいぎ','onrain kaigi'),
    W('absen','absence','eb-sens','けっきん','kekkin'),
  ]),
  ('Melamar & Berkembang', 'Applying & Growing', [
    W('riwayat hidup','resume (CV)','re-zyu-mei','りれきしょ','rirekisho'),
    W('lamaran kerja','job application','job e-pli-kei-syen','おうぼ','oubo'),
    W('evaluasi kinerja','performance review','per-for-mens ri-vyu','じんじひょうか','jinji hyouka'),
    W('kontrak','contract','kon-trekt','けいやく','keiyaku'),
    W('magang','internship','in-tern-syip','インターン','intaan'),
    W('mutasi kerja','job transfer','job trens-fer','てんきん','tenkin'),
    W('pelatihan','training','trei-ning','けんしゅう','kenshuu'),
    W('tunjangan','allowance','e-lau-ens','てあて','teate'),
  ]),
 ],
 'cooking': [
  ('Bahan Dasar', 'Basic Ingredients', [
    W('tepung','flour','fla-ur','こむぎこ','komugiko'),
    W('telur','egg','eg','たまご','tamago'),
    W('mentega','butter','ba-ter','バター','bataa'),
    W('ragi','yeast','yist','イースト','iisuto'),
    W('cokelat','chocolate','cok-lit','チョコレート','chokoreeto'),
    W('susu','milk','milk','ぎゅうにゅう','gyuunyuu'),
    W('nasi','cooked rice','kukt rais','ごはん','gohan'),
    W('mi','noodles','nu-dels','めん','men'),
  ]),
  ('Rasa & Tekstur', 'Flavors & Texture', [
    W('manis','sweet','swit','あまい','amai'),
    W('asin','salty','sol-ti','しおからい','shiokarai'),
    W('pedas','spicy','spai-si','からい','karai'),
    W('asam','sour','sau-er','すっぱい','suppai'),
    W('pahit','bitter','bi-ter','にがい','nigai'),
    W('gurih','savory','sei-vo-ri','うまみ','umami'),
    W('renyah','crispy','kris-pi','カリカリ','karikari'),
    W('empuk','tender','ten-der','やわらかい','yawarakai'),
  ]),
  ('Di Dapur', 'In the Kitchen', [
    W('kompor','stove','stouv','コンロ','konro'),
    W('oven','oven','a-ven','オーブン','oobun'),
    W('kulkas','refrigerator','ri-fri-je-rei-ter','れいぞうこ','reizouko'),
    W('talenan','cutting board','ka-ting bord','まないた','manaita'),
    W('spatula','spatula','spe-cu-la','フライがえし','furaigaeshi'),
    W('garpu','fork','fork','フォーク','fooku'),
    W('mangkuk','bowl','boul','おわん','owan'),
    W('teko','kettle','ke-tel','やかん','yakan'),
  ]),
  ('Menyiapkan Makanan', 'Preparing Food', [
    W('memotong','to cut','tu kat','きる','kiru'),
    W('mengupas','to peel','tu pil','むく','muku'),
    W('mencicipi','to taste','tu teist','あじみ する','ajimi suru'),
    W('menyajikan','to serve','tu serv','だす','dasu'),
    W('resep','recipe','re-si-pi','レシピ','reshipi'),
    W('porsi','serving','ser-ving','ひとりぶん','hitoribun'),
    W('sarapan','breakfast','brek-fest','あさごはん','asagohan'),
    W('makan malam','dinner','di-ner','ばんごはん','bangohan'),
  ]),
 ],
 'tools': [
  ('Perkakas Tangan', 'Hand Tools', [
    W('kikir','file (tool)','fail','やすり','yasuri'),
    W('linggis','crowbar','krou-bar','バール','baaru'),
    W('tang','pliers','plai-ers','ペンチ','penchi'),
    W('kunci inggris','wrench','rench','レンチ','renchi'),
    W('pahat','chisel','ci-zel','のみ','nomi'),
    W('palu kayu','mallet','me-lit','きづち','kizuchi'),
    W('bor','drill','dril','ドリル','doriru'),
    W('meteran','tape measure','teip me-zyer','メジャー','mejaa'),
  ]),
  ('Bahan Bangunan', 'Building Materials', [
    W('bambu','bamboo','bem-bu','たけ','take'),
    W('baja','steel','stil','はがね','hagane'),
    W('besi','iron','ai-ern','てつ','tetsu'),
    W('pasir','sand','send','すな','suna'),
    W('ubin','tile','tail','タイル','tairu'),
    W('kaca','glass','gles','ガラス','garasu'),
    W('plastik','plastic','ples-tik','プラスチック','purasuchikku'),
    W('pernis','varnish','var-nisy','ニス','nisu'),
  ]),
  ('Pengencang', 'Fasteners', [
    W('paku keling','rivet','ri-vit','リベット','ribetto'),
    W('baut','bolt','boult','ボルト','boruto'),
    W('mur','nut (hardware)','nat','ナット','natto'),
    W('lem','glue','glu','のり','nori'),
    W('paku payung','tack','tek','がびょう','gabyou'),
    W('engsel','hinge','hinj','ヒンジ','hinji'),
    W('kawat','wire','wai-er','ワイヤー','waiyaa'),
    W('selotip','tape','teip','テープ','teepu'),
  ]),
  ('Keselamatan & Pekerjaan', 'Safety & Work', [
    W('rompi keselamatan','safety vest','seif-ti vest','あんぜんベスト','anzen besuto'),
    W('sarung tangan','gloves','glavs','てぶくろ','tebukuro'),
    W('kacamata pelindung','safety goggles','seif-ti go-gels','ゴーグル','googuru'),
    W('perancah','scaffolding','ske-fol-ding','あしば','ashiba'),
    W('bengkel','workshop','werk-syop','さぎょうば','sagyouba'),
    W('mengasah','to sharpen','tu syar-pen','とぐ','togu'),
    W('memasang','to install','tu in-stol','とりつける','toritsukeru'),
    W('mengencangkan','to tighten','tu tai-ten','しめる','shimeru'),
  ]),
 ],
 'economy': [
  ('Uang & Harga', 'Money & Prices', [
    W('uang','money','ma-ni','おかね','okane'),
    W('dompet','wallet','wo-lit','さいふ','saifu'),
    W('uang tunai','cash','kesy','げんきん','genkin'),
    W('biaya','fee','fi','りょうきん','ryoukin'),
    W('uang kembalian','change (money)','ceinj','おつり','otsuri'),
    W('tagihan','bill (invoice)','bil','せいきゅうしょ','seikyuusho'),
    W('struk','receipt','ri-sit','レシート','reshiito'),
    W('mata uang','currency','ka-ren-si','つうか','tsuuka'),
  ]),
  ('Menabung & Investasi', 'Saving & Investing', [
    W('investasi','investment','in-vest-ment','とうし','toushi'),
    W('obligasi','bond','bond','さいけん','saiken'),
    W('dividen','dividend','di-vi-dend','はいとう','haitou'),
    W('pinjaman','loan','loun','ローン','roon'),
    W('utang','debt','det','しゃっきん','shakkin'),
    W('anggaran','budget','ba-jit','よさん','yosan'),
    W('asuransi','insurance','in-syu-rens','ほけん','hoken'),
    W('kartu kredit','credit card','kre-dit kard','クレジットカード','kurejitto kaado'),
  ]),
  ('Pasar', 'Market', [
    W('penawaran','supply','se-plai','きょうきゅう','kyoukyuu'),
    W('permintaan','demand','di-mand','じゅよう','juyou'),
    W('inflasi','inflation','in-flei-syen','インフレ','infure'),
    W('grosir','wholesale','houl-seil','おろし','oroshi'),
    W('eceran','retail','ri-teil','こうり','kouri'),
    W('pemasok','supplier','se-plai-er','しいれさき','shiiresaki'),
    W('merek','brand','brend','ブランド','burando'),
    W('persaingan','competition','kom-pe-ti-syen','きょうそう','kyousou'),
  ]),
  ('Bisnis', 'Business', [
    W('perusahaan','company','kam-pe-ni','かいしゃ','kaisha'),
    W('omzet','revenue','re-ve-nyu','しゅうにゅう','shuunyuu'),
    W('biaya operasional','expenses','eks-pen-siz','けいひ','keihi'),
    W('modal','capital (funds)','ke-pi-tel','しほん','shihon'),
    W('pemilik','owner','ou-ner','オーナー','oonaa'),
    W('pegawai','employee','em-ploi-i','しゃいん','shain'),
    W('penjualan','sales','seils','うりあげ','uriage'),
    W('pemasaran','marketing','mar-ke-ting','マーケティング','maaketingu'),
  ]),
 ],
 'science': [
  ('Di Laboratorium', 'In the Lab', [
    W('mikroskop','microscope','mai-kro-skoup','けんびきょう','kenbikyou'),
    W('tabung reaksi','test tube','test tyub','しけんかん','shikenkan'),
    W('hasil','result','ri-zalt','けっか','kekka'),
    W('hipotesis','hypothesis','hai-po-the-sis','かせつ','kasetsu'),
    W('data','data','dei-ta','データ','deeta'),
    W('pengamatan','observation','ob-zer-vei-syen','かんさつ','kansatsu'),
    W('sampel','sample','sem-pel','サンプル','sanpuru'),
    W('ilmuwan','scientist','sai-en-tist','かがくしゃ','kagakusha'),
  ]),
  ('Materi & Gaya', 'Matter & Forces', [
    W('atom','atom','e-tem','げんし','genshi'),
    W('molekul','molecule','mo-le-kyul','ぶんし','bunshi'),
    W('sel','cell','sel','さいぼう','saibou'),
    W('gaya (fisika)','force','fors','ちから','chikara'),
    W('gravitasi','gravity','gre-vi-ti','じゅうりょく','juuryoku'),
    W('magnet','magnet','meg-nit','じしゃく','jishaku'),
    W('getaran','vibration','vai-brei-syen','しんどう','shindou'),
    W('tekanan','pressure','pre-syer','あつりょく','atsuryoku'),
  ]),
  ('Bumi & Alam', 'Earth & Nature', [
    W('bintang','star','star','ほし','hoshi'),
    W('bulan','moon','mun','つき','tsuki'),
    W('matahari','sun','san','たいよう','taiyou'),
    W('gunung berapi','volcano','vol-kei-nou','かざん','kazan'),
    W('gempa bumi','earthquake','erth-kweik','じしん','jishin'),
    W('iklim','climate','klai-mit','きこう','kikou'),
    W('oksigen','oxygen','ok-si-jen','さんそ','sanso'),
    W('fosil','fossil','fo-sil','かせき','kaseki'),
  ]),
  ('Tubuh & Kesehatan', 'Body & Health', [
    W('otak','brain','brein','のう','nou'),
    W('jantung','heart','hart','しんぞう','shinzou'),
    W('darah','blood','blad','ち','chi'),
    W('tulang','bone','boun','ほね','hone'),
    W('virus','virus','vai-res','ウイルス','uirusu'),
    W('bakteri','bacteria','bek-ti-ria','さいきん','saikin'),
    W('vaksin','vaccine','vek-sin','ワクチン','wakuchin'),
    W('obat','medicine','me-di-sin','くすり','kusuri'),
  ]),
 ],
 'industry': [
  ('Mesin', 'Machines', [
    W('mesin','machine','me-syin','きかい','kikai'),
    W('turbin','turbine','ter-bain','タービン','taabin'),
    W('motor penggerak','motor','mou-ter','モーター','mootaa'),
    W('ban berjalan','conveyor belt','kon-vei-er belt','ベルトコンベア','beruto konbea'),
    W('generator','generator','je-ne-rei-ter','はつでんき','hatsudenki'),
    W('pompa','pump','pamp','ポンプ','ponpu'),
    W('sensor','sensor','sen-ser','センサー','sensaa'),
    W('panel kendali','control panel','kon-troul pe-nel','せいぎょばん','seigyoban'),
  ]),
  ('Pekerja', 'Workers', [
    W('buruh','laborer','lei-be-rer','ろうどうしゃ','roudousha'),
    W('mandor','foreman','for-men','げんばかんとく','genba kantoku'),
    W('insinyur','engineer','en-ji-nir','エンジニア','enjinia'),
    W('teknisi','technician','tek-ni-syen','ぎじゅつしゃ','gijutsusha'),
    W('giliran kerja','shift','syift','シフト','shifuto'),
    W('serikat pekerja','labor union','lei-ber yu-nyen','くみあい','kumiai'),
    W('upah','wage','weij','ちんぎん','chingin'),
    W('keselamatan kerja','workplace safety','werk-pleis seif-ti','あんぜん','anzen'),
  ]),
  ('Bahan Baku & Produk', 'Raw Materials & Goods', [
    W('bahan baku','raw material','ro me-ti-ri-el','げんりょう','genryou'),
    W('karet','rubber','ra-ber','ゴム','gomu'),
    W('batu bara','coal','koul','せきたん','sekitan'),
    W('tekstil','textile','teks-tail','せんい',"sen'i"),
    W('kemasan','packaging','pe-ki-jing','ほうそう','housou'),
    W('gudang','warehouse','wer-haus','そうこ','souko'),
    W('pengiriman','shipment','syip-ment','しゅっか','shukka'),
    W('label','label','lei-bel','ラベル','raberu'),
  ]),
  ('Proses', 'Processes', [
    W('merakit','to assemble','tu e-sem-bel','くみたてる','kumitateru'),
    W('mengelas','to weld','tu weld','ようせつ する','yousetsu suru'),
    W('memeriksa','to inspect','tu in-spekt','けんさ する','kensa suru'),
    W('mendaur ulang','to recycle','tu ri-sai-kel','リサイクル する','risaikuru suru'),
    W('limbah','waste','weist','はいきぶつ','haikibutsu'),
    W('polusi','pollution','po-lu-syen','おせん','osen'),
    W('otomatisasi','automation','o-to-mei-syen','じどうか','jidouka'),
    W('perawatan mesin','maintenance','mein-te-nens','メンテナンス','mentenansu'),
  ]),
 ],
}

def q(s):  # kutip Dart single-quote
    return "'" + s.replace("'", "\\'") + "'"

def section_dart(lang, title_id, title_en, words):
    out = ["      GuideSection(",
           f"        title: const {{'id': {q(title_id)}, 'en': {q(title_en)}}},",
           "        examples: const ["]
    for (wid, wen, pron, kana, romaji) in words:
        meaning = f"{{'id': {q(wid)}, 'en': {q(wen)}}}"
        if lang == 'ja':
            out.append(f"          GuideExample({q(kana)}, {meaning}, romaji: {q(romaji)}),")
        elif lang == 'en':
            out.append(f"          GuideExample({q(wen)}, {meaning},")
            out.append(f"              romaji: {q(pron)}),")
        else:
            out.append(f"          GuideExample({q(wid)},")
            out.append(f"              {meaning}),")
    out += ["        ],", "      ),"]
    return "\n".join(out) + "\n"

def reset(src):
    """Hapus bagian buatan generator (judul cocok), apa pun formatnya."""
    titles = {t_id for secs in THEMES.values() for (t_id, _, _) in secs}
    pat = re.compile(r"\n      GuideSection\(\n        title: const \{\s*'id':\s*'((?:[^'\\]|\\.)*)',"
                     r"(?:(?!\n      GuideSection\().)*?\n      \),(?=\n)", re.S)
    src = pat.sub(lambda m: "" if m.group(1) in titles else m.group(0), src)
    return (src.replace("'50 kosakata + contoh kalimat", "'18 kosakata + contoh kalimat")
               .replace("'50 words + example sentences", "'18 words + example sentences"))

def topic_span(src, tid):
    m = re.search(rf"\n  GuideTopic\(\n    id: '{tid}',", src)
    if not m:
        sys.exit(f'topik {tid} tidak ditemukan')
    return m.start(), src.index("\n    ],\n  ),\n", m.start())

def targets(src, tid):
    a, b = topic_span(src, tid)
    return {t.lower() for t in re.findall(r"GuideExample\(\s*'((?:[^'\\]|\\.)*)'", src[a:b], re.S)}

EX_RE = re.compile(r"GuideExample\(\s*'((?:[^'\\]|\\.)*)',\s*(?:const\s*)?\{\s*'id':\s*'((?:[^'\\]|\\.)*)',\s*'en':\s*'((?:[^'\\]|\\.)*)',?\s*\}", re.S)

def add_ko_de(src):
    """Bangun topik kosakata Korea & Jerman sejajar dengan kursus Inggris."""
    sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
    from vocab_ko_de import BASE, EXTRA
    # hapus topik lama buatan generator
    src = re.sub(r"\n  GuideTopic\(\n    id: '(?:ko|de)_vocab_\w+',.*?\n  \),(?=\n)", "", src, flags=re.S)
    blocks = {'ko': [], 'de': []}
    for theme, secs in THEMES.items():
        a, b = topic_span(src, f'en_vocab_{theme}')
        head = src[a:b]
        emoji = re.search(r"emoji: '([^']*)'", head).group(1)
        title = re.search(r"title: const \{\s*'id':\s*'((?:[^'\\]|\\.)*)',\s*'en':\s*'((?:[^'\\]|\\.)*)',?\s*\}", head)
        meaning = {en.replace("\\'", "'"): (idm.replace("\\'", "'"), en.replace("\\'", "'"))
                   for (_t, idm, en) in EX_RE.findall(head)}
        for lang in ('ko', 'de'):
            out = ["  GuideTopic(", f"    id: '{lang}_vocab_{theme}',", f"    emoji: '{emoji}',",
                   f"    title: const {{'id': {q(title.group(1))}, 'en': {q(title.group(2))}}},",
                   "    subtitle: const {",
                   "      'id': '50 kosakata + contoh kalimat, ketuk untuk dengar',",
                   "      'en': '50 words + example sentences, tap to listen',", "    },", "    sections: ["]
            def sec(t_id, t_en, rows, out=out):
                out.append("      GuideSection(")
                out.append(f"        title: const {{'id': {q(t_id)}, 'en': {q(t_en)}}},")
                out.append("        examples: const [")
                for (idm, en, target, pron) in rows:
                    out.append(f"          GuideExample({q(target)}, {{'id': {q(idm)}, 'en': {q(en)}}},")
                    out.append(f"              romaji: {q(pron)}),")
                out += ["        ],", "      ),"]
            for (t_id, t_en, words) in BASE[theme]:
                rows = []
                for (en_key, ko, rr, de, dp) in words:
                    if en_key not in meaning:
                        sys.exit(f'{theme}: kata dasar "{en_key}" tidak ada di kursus Inggris')
                    idm, en = meaning[en_key]
                    rows.append((idm, en, ko, rr) if lang == 'ko' else (idm, en, de, dp))
                sec(t_id, t_en, rows)
            for (t_id, t_en, words) in secs:
                rows = []
                for w in words:
                    if w[1] not in EXTRA:
                        sys.exit(f'{theme}: kata tambahan "{w[1]}" belum ada di vocab_ko_de.py')
                    ko, rr, de, dp = EXTRA[w[1]]
                    rows.append((w[0], w[1], ko, rr) if lang == 'ko' else (w[0], w[1], de, dp))
                sec(t_id, t_en, rows)
            out += ["    ],", "  ),"]
            blocks[lang].append("\n".join(out))
    for lang, marker in (('ko', 'final List<GuideTopic> _korean = ['), ('de', 'final List<GuideTopic> _german = [')):
        start = src.index(marker)
        end = src.index("\n];", start)
        src = src[:end] + "\n" + "\n".join(blocks[lang]) + src[end:]
    return src

def main():
    src = reset(DART.read_text(encoding='utf-8'))
    # duplikat lintas tiga bahasa: satu kata dianggap duplikat kalau salah
    # satu bentuknya (id/en/kana) sudah ada di topik tema itu.
    bad = []
    for theme, secs in THEMES.items():
        ex = {0: targets(src, f'id_vocab_{theme}'), 1: targets(src, f'en_vocab_{theme}'),
              3: targets(src, f'vocab_{theme}')}
        seen = set()
        for (t_id, _, words) in secs:
            for w in words:
                if any(w[k].lower() in ex[k] for k in (0, 1, 3)) or w[0] in seen:
                    bad.append(f'{theme}/{t_id}: {w[0]}')
                seen.add(w[0])
    if bad:
        sys.exit('duplikat, ganti dulu:\n  ' + '\n  '.join(bad))
    total_added = 0
    for theme, sections in THEMES.items():
        for lang, tid in (('ja', f'vocab_{theme}'), ('en', f'en_vocab_{theme}'), ('id', f'id_vocab_{theme}')):
            start, end = topic_span(src, tid)
            existing_titles = set(re.findall(r"title: const \{\s*'id':\s*'((?:[^'\\]|\\.)*)'", src[start:end]))
            new_dart = ""
            for (t_id, t_en, words) in sections:
                if t_id in existing_titles:
                    continue  # sudah ditambahkan sebelumnya
                new_dart += section_dart(lang, t_id, t_en, words)
                total_added += len(words)
            if new_dart:
                src = src[:end] + "\n" + new_dart.rstrip("\n") + src[end:]
    # subjudul: hitung ulang jumlah kata (contoh dengan spasi/kalimat dihitung
    # terpisah: kata = contoh yang bukan kalimat penuh; cukup ganti 18 -> 50)
    src = src.replace("'18 kosakata + contoh kalimat", "'50 kosakata + contoh kalimat")
    src = src.replace("'18 words + example sentences", "'50 words + example sentences")
    src = add_ko_de(src)
    DART.write_text(src, encoding='utf-8')
    for theme in THEMES:
        for tid in (f'ko_vocab_{theme}', f'de_vocab_{theme}'):
            a, b = topic_span(src, tid)
            n = len(re.findall(r"GuideExample\(", src[a:b]))
            if n != 56:
                print(f'  ! {tid}: {n} contoh (harus 56)', file=sys.stderr)
    for theme in THEMES:
        for tid in (f'vocab_{theme}', f'en_vocab_{theme}', f'id_vocab_{theme}'):
            a, b = topic_span(src, tid)
            n = len(re.findall(r"GuideExample\(", src[a:b]))
            if n != 56:  # 50 kata + 6 kalimat contoh
                print(f'  ! {tid}: {n} contoh (harus 56)', file=sys.stderr)
    print(f'selesai: +{total_added} kata ditambahkan')

if __name__ == '__main__':
    main()
