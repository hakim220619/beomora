# Generator dataset kosakata JLPT -> lib/data/jlpt_vocab.dart
# Tiap entri: (kana, romaji, arti_id, arti_en). Kanji ikut di kana bila
# lazim ditulis begitu untuk level tsb. Divalidasi: kana unik per level,
# romaji & arti tidak kosong.

N5 = [
  # Angka & hitungan
  ("ゼロ","zero","nol","zero"),("いち","ichi","satu","one"),
  ("に","ni","dua","two"),("さん","san","tiga","three"),
  ("よん","yon","empat","four"),("ご","go","lima","five"),
  ("ろく","roku","enam","six"),("なな","nana","tujuh","seven"),
  ("はち","hachi","delapan","eight"),("きゅう","kyuu","sembilan","nine"),
  ("じゅう","juu","sepuluh","ten"),("ひゃく","hyaku","seratus","hundred"),
  ("せん","sen","seribu","thousand"),("まん","man","sepuluh ribu","ten thousand"),
  ("はんぶん","hanbun","setengah","half"),("かず","kazu","jumlah; bilangan","number"),
  # Waktu
  ("いま","ima","sekarang","now"),("きょう","kyou","hari ini","today"),
  ("あした","ashita","besok","tomorrow"),("きのう","kinou","kemarin","yesterday"),
  ("あさ","asa","pagi","morning"),("ひる","hiru","siang","noon"),
  ("よる","yoru","malam","night"),("ばん","ban","malam hari","evening"),
  ("ごぜん","gozen","pagi (AM)","a.m."),("ごご","gogo","siang (PM)","p.m."),
  ("じかん","jikan","waktu; jam","time; hour"),("ふん","fun","menit","minute"),
  ("びょう","byou","detik","second"),("しゅう","shuu","minggu","week"),
  ("つき","tsuki","bulan (waktu)","month"),("とし","toshi","tahun","year"),
  ("まいにち","mainichi","setiap hari","every day"),("まいあさ","maiasa","setiap pagi","every morning"),
  ("まいばん","maiban","setiap malam","every night"),("こんしゅう","konshuu","minggu ini","this week"),
  ("らいしゅう","raishuu","minggu depan","next week"),("せんしゅう","senshuu","minggu lalu","last week"),
  ("こんげつ","kongetsu","bulan ini","this month"),("らいねん","rainen","tahun depan","next year"),
  ("きょねん","kyonen","tahun lalu","last year"),("ことし","kotoshi","tahun ini","this year"),
  # Hari dalam seminggu
  ("げつようび","getsuyoubi","Senin","Monday"),("かようび","kayoubi","Selasa","Tuesday"),
  ("すいようび","suiyoubi","Rabu","Wednesday"),("もくようび","mokuyoubi","Kamis","Thursday"),
  ("きんようび","kinyoubi","Jumat","Friday"),("どようび","doyoubi","Sabtu","Saturday"),
  ("にちようび","nichiyoubi","Minggu","Sunday"),
  # Keluarga
  ("かぞく","kazoku","keluarga","family"),("ちち","chichi","ayah (sendiri)","father"),
  ("はは","haha","ibu (sendiri)","mother"),("あに","ani","kakak laki-laki","older brother"),
  ("あね","ane","kakak perempuan","older sister"),("おとうと","otouto","adik laki-laki","younger brother"),
  ("いもうと","imouto","adik perempuan","younger sister"),("こども","kodomo","anak","child"),
  ("おとうさん","otousan","ayah (sopan)","father (polite)"),("おかあさん","okaasan","ibu (sopan)","mother (polite)"),
  ("おにいさん","oniisan","kakak lk (sopan)","older brother (polite)"),("おねえさん","oneesan","kakak pr (sopan)","older sister (polite)"),
  ("おじいさん","ojiisan","kakek","grandfather"),("おばあさん","obaasan","nenek","grandmother"),
  # Orang
  ("ひと","hito","orang","person"),("おとこ","otoko","laki-laki","man"),
  ("おんな","onna","perempuan","woman"),("ともだち","tomodachi","teman","friend"),
  ("せんせい","sensei","guru","teacher"),("がくせい","gakusei","pelajar","student"),
  ("わたし","watashi","saya","I"),("あなた","anata","kamu","you"),
  ("かれ","kare","dia (lk)","he"),("かのじょ","kanojo","dia (pr)","she"),
  # Tubuh
  ("あたま","atama","kepala","head"),("かお","kao","wajah","face"),
  ("め","me","mata","eye"),("みみ","mimi","telinga","ear"),
  ("はな","hana","hidung","nose"),("くち","kuchi","mulut","mouth"),
  ("は","ha","gigi","tooth"),("て","te","tangan","hand"),
  ("あし","ashi","kaki","leg; foot"),("からだ","karada","tubuh","body"),
  # Makanan & minuman
  ("ごはん","gohan","nasi; makan","rice; meal"),("パン","pan","roti","bread"),
  ("みず","mizu","air","water"),("おちゃ","ocha","teh","tea"),
  ("コーヒー","koohii","kopi","coffee"),("ぎゅうにゅう","gyuunyuu","susu","milk"),
  ("にく","niku","daging","meat"),("さかな","sakana","ikan","fish"),
  ("やさい","yasai","sayur","vegetable"),("くだもの","kudamono","buah","fruit"),
  ("たまご","tamago","telur","egg"),("りんご","ringo","apel","apple"),
  ("おかし","okashi","kudapan; manisan","sweets; snack"),("さとう","satou","gula","sugar"),
  ("しお","shio","garam","salt"),("あさごはん","asagohan","sarapan","breakfast"),
  ("ひるごはん","hirugohan","makan siang","lunch"),("ばんごはん","bangohan","makan malam","dinner"),
  # Benda sehari-hari
  ("ほん","hon","buku","book"),("ノート","nooto","buku catatan","notebook"),
  ("ペン","pen","pena","pen"),("えんぴつ","enpitsu","pensil","pencil"),
  ("かみ","kami","kertas","paper"),("かばん","kaban","tas","bag"),
  ("とけい","tokei","jam","watch; clock"),("かさ","kasa","payung","umbrella"),
  ("でんわ","denwa","telepon","telephone"),("テレビ","terebi","televisi","television"),
  ("いす","isu","kursi","chair"),("つくえ","tsukue","meja","desk"),
  ("ドア","doa","pintu","door"),("まど","mado","jendela","window"),
  ("くつ","kutsu","sepatu","shoes"),("ふく","fuku","baju","clothes"),
  ("しんぶん","shinbun","koran","newspaper"),("じしょ","jisho","kamus","dictionary"),
  ("さいふ","saifu","dompet","wallet"),("かぎ","kagi","kunci","key"),
  # Tempat
  ("いえ","ie","rumah","house"),("うち","uchi","rumah; kediaman","home"),
  ("がっこう","gakkou","sekolah","school"),("えき","eki","stasiun","station"),
  ("みせ","mise","toko","shop"),("びょういん","byouin","rumah sakit","hospital"),
  ("ぎんこう","ginkou","bank","bank"),("ゆうびんきょく","yuubinkyoku","kantor pos","post office"),
  ("としょかん","toshokan","perpustakaan","library"),("こうえん","kouen","taman","park"),
  ("へや","heya","kamar","room"),("だいどころ","daidokoro","dapur","kitchen"),
  ("トイレ","toire","toilet","toilet"),("おふろ","ofuro","kamar mandi","bath"),
  ("まち","machi","kota","town"),("くに","kuni","negara","country"),
  # Alam
  ("そら","sora","langit","sky"),("やま","yama","gunung","mountain"),
  ("かわ","kawa","sungai","river"),("うみ","umi","laut","sea"),
  ("き","ki","pohon","tree"),("花","hana","bunga","flower"),
  ("月","tsuki","bulan (langit)","moon"),("ほし","hoshi","bintang","star"),
  ("あめ","ame","hujan","rain"),("ゆき","yuki","salju","snow"),
  ("かぜ","kaze","angin","wind"),("てんき","tenki","cuaca","weather"),
  # Warna & sifat
  ("あかい","akai","merah","red"),("あおい","aoi","biru","blue"),
  ("しろい","shiroi","putih","white"),("くろい","kuroi","hitam","black"),
  ("きいろい","kiiroi","kuning","yellow"),("おおきい","ookii","besar","big"),
  ("ちいさい","chiisai","kecil","small"),("たかい","takai","tinggi; mahal","tall; expensive"),
  ("ひくい","hikui","rendah","low"),("やすい","yasui","murah","cheap"),
  ("ながい","nagai","panjang","long"),("みじかい","mijikai","pendek","short"),
  ("あたらしい","atarashii","baru","new"),("ふるい","furui","lama","old"),
  ("いい","ii","bagus","good"),("わるい","warui","buruk","bad"),
  ("あつい","atsui","panas","hot"),("さむい","samui","dingin","cold"),
  ("おいしい","oishii","enak","delicious"),("たのしい","tanoshii","menyenangkan","fun"),
  ("むずかしい","muzukashii","sulit","difficult"),("やさしい","yasashii","mudah; ramah","easy; kind"),
  ("いそがしい","isogashii","sibuk","busy"),("はやい","hayai","cepat","fast"),
  # Kata kerja
  ("たべる","taberu","makan","to eat"),("のむ","nomu","minum","to drink"),
  ("みる","miru","melihat","to see"),("きく","kiku","mendengar","to listen"),
  ("はなす","hanasu","berbicara","to speak"),("よむ","yomu","membaca","to read"),
  ("かく","kaku","menulis","to write"),("いく","iku","pergi","to go"),
  ("くる","kuru","datang","to come"),("かえる","kaeru","pulang","to return"),
  ("ねる","neru","tidur","to sleep"),("おきる","okiru","bangun","to wake up"),
  ("あるく","aruku","berjalan","to walk"),("はしる","hashiru","berlari","to run"),
  ("かう","kau","membeli","to buy"),("うる","uru","menjual","to sell"),
  ("する","suru","melakukan","to do"),("なる","naru","menjadi","to become"),
  ("わかる","wakaru","mengerti","to understand"),("しる","shiru","tahu","to know"),
  ("あう","au","bertemu","to meet"),("まつ","matsu","menunggu","to wait"),
  ("つくる","tsukuru","membuat","to make"),("つかう","tsukau","memakai","to use"),
  ("あける","akeru","membuka","to open"),("しめる","shimeru","menutup","to close"),
  ("おしえる","oshieru","mengajar","to teach"),("ならう","narau","belajar","to learn"),
  ("べんきょうする","benkyousuru","belajar","to study"),("はたらく","hataraku","bekerja","to work"),
  ("あそぶ","asobu","bermain","to play"),("やすむ","yasumu","beristirahat","to rest"),
  # Adverbia & lain
  ("とても","totemo","sangat","very"),("すこし","sukoshi","sedikit","a little"),
  ("たくさん","takusan","banyak","many"),("いつも","itsumo","selalu","always"),
  ("ときどき","tokidoki","kadang-kadang","sometimes"),("よく","yoku","sering; baik","often; well"),
  ("もう","mou","sudah","already"),("まだ","mada","belum","not yet"),
  ("ちょっと","chotto","sebentar","a moment"),("だいたい","daitai","kira-kira","roughly"),
  # Kata tanya & tunjuk
  ("なに","nani","apa","what"),("だれ","dare","siapa","who"),
  ("どこ","doko","di mana","where"),("いつ","itsu","kapan","when"),
  ("なぜ","naze","mengapa","why"),("どう","dou","bagaimana","how"),
  ("いくら","ikura","berapa (harga)","how much"),("これ","kore","ini","this"),
  ("それ","sore","itu","that"),("あれ","are","itu (jauh)","that over there"),
  # Sapaan & ungkapan
  ("こんにちは","konnichiwa","halo","hello"),("おはよう","ohayou","selamat pagi","good morning"),
  ("こんばんは","konbanwa","selamat malam","good evening"),("さようなら","sayounara","selamat tinggal","goodbye"),
  ("ありがとう","arigatou","terima kasih","thank you"),("すみません","sumimasen","permisi; maaf","excuse me"),
  ("はい","hai","ya","yes"),("いいえ","iie","tidak","no"),
]

N4 = [
  ("しゃかい","shakai","masyarakat","society"),("せいかつ","seikatsu","kehidupan","life"),
  ("しごと","shigoto","pekerjaan","work"),("かいしゃ","kaisha","perusahaan","company"),
  ("しゃちょう","shachou","direktur","company president"),("てんいん","tenin","pelayan toko","clerk"),
  ("きゃく","kyaku","tamu; pelanggan","guest; customer"),("うけつけ","uketsuke","resepsionis","reception"),
  ("かいぎ","kaigi","rapat","meeting"),("よてい","yotei","rencana; jadwal","plan; schedule"),
  ("やくそく","yakusoku","janji","promise"),("つごう","tsugou","keadaan; kondisi","circumstances"),
  ("りゆう","riyuu","alasan","reason"),("いけん","iken","pendapat","opinion"),
  ("せつめい","setsumei","penjelasan","explanation"),("しつもん","shitsumon","pertanyaan","question"),
  ("へんじ","henji","balasan","reply"),("あいさつ","aisatsu","salam","greeting"),
  ("けいけん","keiken","pengalaman","experience"),("しゅみ","shumi","hobi","hobby"),
  ("きぶん","kibun","suasana hati","mood"),("きもち","kimochi","perasaan","feeling"),
  ("げんいん","genin","penyebab","cause"),("けっか","kekka","hasil","result"),
  ("ほうほう","houhou","cara; metode","method"),("もくてき","mokuteki","tujuan","purpose"),
  ("じゆう","jiyuu","kebebasan","freedom"),("きかい","kikai","kesempatan","opportunity"),
  ("じゅんび","junbi","persiapan","preparation"),("せいさん","seisan","produksi","production"),
  ("けいざい","keizai","ekonomi","economy"),("せいじ","seiji","politik","politics"),
  ("ぶんか","bunka","budaya","culture"),("れきし","rekishi","sejarah","history"),
  ("かがく","kagaku","sains","science"),("ぎじゅつ","gijutsu","teknologi","technology"),
  ("機械","kikai","mesin","machine"),("どうぐ","dougu","alat","tool"),
  ("せいひん","seihin","produk","product"),("しょうひん","shouhin","barang dagangan","goods"),
  ("ねだん","nedan","harga","price"),("りょうきん","ryoukin","tarif; ongkos","fee"),
  ("ぜいきん","zeikin","pajak","tax"),("きゅうりょう","kyuuryou","gaji","salary"),
  ("よさん","yosan","anggaran","budget"),("ちょきん","chokin","tabungan","savings"),
  ("せかい","sekai","dunia","world"),("こくさい","kokusai","internasional","international"),
  ("ちり","chiri","geografi","geography"),("じんこう","jinkou","populasi","population"),
  ("かんきょう","kankyou","lingkungan","environment"),("しぜん","shizen","alam","nature"),
  # Kata kerja N4
  ("おくれる","okureru","terlambat","to be late"),("まにあう","maniau","tepat waktu","to be in time"),
  ("えらぶ","erabu","memilih","to choose"),("きめる","kimeru","memutuskan","to decide"),
  ("さがす","sagasu","mencari","to search"),("みつける","mitsukeru","menemukan","to find"),
  ("なおす","naosu","memperbaiki","to fix"),("こわす","kowasu","merusak","to break"),
  ("すてる","suteru","membuang","to throw away"),("ひろう","hirou","memungut","to pick up"),
  ("はこぶ","hakobu","mengangkut","to carry"),("おくる","okuru","mengirim","to send"),
  ("うける","ukeru","menerima; mengikuti","to receive; to take"),("わたす","watasu","menyerahkan","to hand over"),
  ("つたえる","tsutaeru","menyampaikan","to convey"),("しらべる","shiraberu","memeriksa","to investigate"),
  ("かんがえる","kangaeru","memikirkan","to think"),("おぼえる","oboeru","mengingat","to memorize"),
  ("わすれる","wasureru","lupa","to forget"),("なれる","nareru","terbiasa","to get used to"),
  ("つづける","tsuzukeru","melanjutkan","to continue"),("やめる","yameru","berhenti","to quit"),
  ("はじめる","hajimeru","memulai","to begin"),("おわる","owaru","berakhir","to end"),
  ("てつだう","tetsudau","membantu","to help"),("せわする","sewasuru","merawat","to take care"),
  ("しんぱいする","shinpaisuru","khawatir","to worry"),("あんしんする","anshinsuru","lega","to be relieved"),
  ("びっくりする","bikkurisuru","terkejut","to be surprised"),("えんりょする","enryosuru","sungkan","to hold back"),
  ("しっぱいする","shippaisuru","gagal","to fail"),("せいこうする","seikousuru","berhasil","to succeed"),
  ("よやくする","yoyakusuru","memesan","to reserve"),("しょうかいする","shoukaisuru","memperkenalkan","to introduce"),
  ("あんないする","annaisuru","memandu","to guide"),("せつめいする","setsumeisuru","menjelaskan","to explain"),
  # Sifat N4
  ("べんり","benri","praktis","convenient"),("ふべん","fuben","tidak praktis","inconvenient"),
  ("あんぜん","anzen","aman","safe"),("きけん","kiken","berbahaya","dangerous"),
  ("たいせつ","taisetsu","penting","important"),("ひつよう","hitsuyou","perlu","necessary"),
  ("じゆうな","jiyuuna","bebas","free"),("むりな","murina","mustahil; memaksakan","impossible"),
  ("ふくざつ","fukuzatsu","rumit","complicated"),("かんたん","kantan","sederhana","simple"),
  ("じょうぶ","joubu","kuat; awet","sturdy"),("ていねい","teinei","sopan; teliti","polite; careful"),
  ("まじめ","majime","serius; rajin","serious; diligent"),("しんせつ","shinsetsu","baik hati","kind"),
  ("ねっしん","nesshin","antusias","enthusiastic"),("ざんねん","zannen","sayang sekali","regrettable"),
  ("へん","hen","aneh","strange"),("とくべつ","tokubetsu","istimewa","special"),
  ("じゅうぶん","juubun","cukup","enough"),("うまい","umai","mahir; enak","skillful; tasty"),
]

N3 = [
  ("けいけん","keiken3","pengalaman","experience"),("のうりょく","nouryoku","kemampuan","ability"),
  ("せいかく","seikaku","sifat; watak","personality"),("たいど","taido","sikap","attitude"),
  ("じょうたい","joutai","keadaan","condition; state"),("じょうきょう","joukyou","situasi","situation"),
  ("かんけい","kankei","hubungan","relationship"),("えいきょう","eikyou","pengaruh","influence"),
  ("こうか","kouka","efek","effect"),("もんだい","mondai","masalah; soal","problem"),
  ("かいけつ","kaiketsu","penyelesaian","solution"),("げんじょう","genjou","kondisi saat ini","present state"),
  ("もくひょう","mokuhyou","target","target"),("けいかく","keikaku","rencana","plan"),
  ("じっこう","jikkou","pelaksanaan","execution"),("かつどう","katsudou","kegiatan","activity"),
  ("さんか","sanka","partisipasi","participation"),("きょうりょく","kyouryoku","kerja sama","cooperation"),
  ("せきにん","sekinin","tanggung jawab","responsibility"),("ぎむ","gimu","kewajiban","duty"),
  ("けんり","kenri","hak","right"),("きそく","kisoku","aturan","rule"),
  ("ほうりつ","houritsu","hukum","law"),("せいど","seido","sistem","system"),
  ("せいふ","seifu","pemerintah","government"),("しみん","shimin","warga","citizen"),
  ("しゃかいじん","shakaijin","anggota masyarakat","working adult"),("こじん","kojin","individu","individual"),
  ("だんたい","dantai","kelompok; organisasi","group"),("そしき","soshiki","organisasi","organization"),
  ("さんぎょう","sangyou","industri","industry"),("のうぎょう","nougyou","pertanian","agriculture"),
  ("こうぎょう","kougyou","perindustrian","manufacturing"),("しょうぎょう","shougyou","perdagangan","commerce"),
  ("ぼうえき","boueki","perdagangan internasional","trade"),("とうし","toushi","investasi","investment"),
  ("りえき","rieki","keuntungan","profit"),("そんがい","songai","kerugian","loss; damage"),
  ("しげん","shigen","sumber daya","resources"),("エネルギー","enerugii","energi","energy"),
  ("かんきょうもんだい","kankyoumondai","masalah lingkungan","environmental issue"),("おせん","osen","polusi","pollution"),
  ("さいがい","saigai","bencana","disaster"),("じしん","jishin","gempa bumi","earthquake"),
  ("たいふう","taifuu","topan","typhoon"),("こうずい","kouzui","banjir","flood"),
  # Kata kerja N3
  ("あらわす","arawasu","menunjukkan; mengungkap","to express"),("しめす","shimesu","memperlihatkan","to show"),
  ("ふくむ","fukumu","mencakup","to include"),("のぞく","nozoku","mengecualikan","to exclude"),
  ("ふえる","fueru","bertambah","to increase"),("へる","heru","berkurang","to decrease"),
  ("かわる","kawaru","berubah","to change"),("のこる","nokoru","tersisa","to remain"),
  ("すすむ","susumu","maju","to advance"),("もどる","modoru","kembali","to go back"),
  ("たしかめる","tashikameru","memastikan","to confirm"),("みとめる","mitomeru","mengakui","to admit"),
  ("ことわる","kotowaru","menolak","to refuse"),("ゆるす","yurusu","memaafkan; mengizinkan","to forgive; to permit"),
  ("まもる","mamoru","melindungi; menaati","to protect; to obey"),("せめる","semeru","menyalahkan","to blame"),
  ("あきらめる","akirameru","menyerah","to give up"),("がまんする","gamansuru","menahan diri","to endure"),
  ("えんきする","enkisuru","menunda","to postpone"),("ちゅうしする","chuushisuru","membatalkan","to cancel"),
  ("はんたいする","hantaisuru","menentang","to oppose"),("さんせいする","sanseisuru","menyetujui","to agree"),
  ("そうだんする","soudansuru","berkonsultasi","to consult"),("はっぴょうする","happyousuru","mempresentasikan","to present"),
  ("ほうこくする","houkokusuru","melaporkan","to report"),("かくにんする","kakuninsuru","mengonfirmasi","to verify"),
  ("かんしゃする","kanshasuru","berterima kasih","to be grateful"),("そんけいする","sonkeisuru","menghormati","to respect"),
  ("はんだんする","handansuru","menilai","to judge"),("よそうする","yosousuru","memperkirakan","to predict"),
  # Sifat N3
  ("ゆたか","yutaka","makmur; melimpah","abundant"),("びんぼう","binbou","miskin","poor"),
  ("ふくざつな","fukuzatsuna","kompleks","complex"),("たんじゅん","tanjun","sederhana","simple"),
  ("正確","seikaku","akurat","accurate"),("あいまい","aimai","ambigu","vague"),
  ("せっきょくてき","sekkyokuteki","proaktif","proactive"),("しょうきょくてき","shoukyokuteki","pasif","passive"),
  ("こうへい","kouhei","adil","fair"),("ふこうへい","fukouhei","tidak adil","unfair"),
  ("ゆうめい","yuumei","terkenal","famous"),("じゅうよう","juuyou","penting","important"),
  ("きちょう","kichou","berharga","valuable"),("きけんな","kikenna","berisiko","risky"),
  ("すなお","sunao","jujur; penurut","obedient"),("しょうじき","shoujiki","jujur","honest"),
  ("らくてん","rakuten","optimis","optimistic"),("しんちょう","shinchou","hati-hati","cautious"),
]


def slug_clean(kana):
    # buang penanda unik (angka) yang hanya untuk mencegah duplikat romaji
    return kana


def dq(s):
    return s.replace('\\', '\\\\').replace("'", "\\'")


def emit(level, rows):
    # kana asli: buang suffix angka penanda unik (mis. "hana2"/"つき2")
    out = [f'const List<JVocab> jlpt{level} = [']
    seen = set()
    for kana, romaji, mid, men in rows:
        real_kana = kana.rstrip('23')
        real_romaji = romaji.rstrip('23')
        key = (real_kana, real_romaji)
        assert real_kana and real_romaji and mid and men, (level, kana)
        # keunikan berdasarkan (kana,romaji) supaya homograf beda bacaan boleh
        assert key not in seen, f'{level} dobel: {real_kana}/{real_romaji}'
        seen.add(key)
        out.append(
            "  JVocab('%s', '%s', {'id': '%s', 'en': '%s'})," %
            (dq(real_kana), dq(real_romaji), dq(mid), dq(men)))
    out.append('];')
    return '\n'.join(out), len(rows)


header = '''// Dataset kosakata JLPT (N5/N4/N3) — sumber "Soal Pilihan Ganda" per
// level sekaligus materi kosakata. DIBUAT OTOMATIS oleh
// tool/gen_jlpt.py; jangan edit manual.
class JVocab {
  final String kana;
  final String romaji;
  final Map<String, String> meaning; // {'id':.., 'en':..}
  const JVocab(this.kana, this.romaji, this.meaning);
}
'''

parts = [header]
total = 0
for level, rows in [('N5', N5), ('N4', N4), ('N3', N3)]:
    block, n = emit(level, rows)
    parts.append(block)
    total += n

open('lib/data/jlpt_vocab.dart', 'w', encoding='utf-8').write(
    '\n\n'.join(parts) + '\n')
print(f'OK: N5={len(N5)} N4={len(N4)} N3={len(N3)} total={total}')
