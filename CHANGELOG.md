# Catatan Rilis Beomora

Semua perubahan penting dicatat di sini. Versi mengikuti `pubspec.yaml`
(`versi+kode build`).

## 1.21.0 (build 39) — 13 November 2026

### Baru
- **Soal "Susun huruf"**: selain pilihan ganda, pengguna bisa memilih
  menyusun kata dari kotak huruf acak. Bunyi gabungan (きょ, しゃ) jadi
  satu kotak, dan ada 3–6 huruf pengecoh yang mirip bentuk/bunyinya
  (ね/れ/わ, シ/ツ, b/d). Ada tombol 🔊 untuk mendengar petunjuk, lalu
  Periksa → Lanjut.
  - **Latihan Kosakata**: pilih jenis soal di lembar jumlah soal.
  - **Tebak Kata** (Jepang & Jerman) dan **Tebak Kanji**: pilihan "Cara
    menjawab" di layar setelan kuis. Di Tebak Kanji, soal "Baca kata"
    menampilkan kata kanjinya (学生) lalu bacaannya disusun (がくせい);
    soal Arti dan Bacaan on/kun tetap pilihan ganda.
  - Kata yang tidak cocok disusun (ungkapan, ada spasi/～, lebih dari 10
    kotak) otomatis jadi pilihan ganda. Pilihan tersimpan dan berlaku
    untuk semua latihan di atas.
- **Pemutar kosakata: urut atau acak**: kata yang dipilih bisa diputar
  urut dari atas (Favorit dulu) atau diacak tiap putaran.

### Teknis
- Baru: `data/spell_tiles.dart` (`spellUnits`, `spellTiles`), setelan
  `SettingsProvider.vocabSpellMode` & `playShuffle`. `TokenExercise`
  menerima judul soal (`title`), `QuizSetupScreen.spellOption`.
- Tes baru: `spell_tiles_test.dart`, tes susun huruf di
  `vocab_practice_screen_test.dart` & `quiz_setup_screen_test.dart`.

## 1.20.2 (build 38) — 11 November 2026

### Baru
- **Kosakata Pemula Bab 1–25** (Materi → Kosakata, kartu paling atas,
  di atas JLPT N5): 982 kosakata urut per bab, dengan romaji dan arti
  Indonesia/Inggris. Arti kata yang bunyinya sama dibedakan per bab
  (かみ kertas/rambut, はし sumpit/jembatan, おきます bangun/menaruh,
  とまります menginap, dst.).
- **Contoh kalimat untuk semua 982 kata**: 304 kalimat baru (kana,
  romaji, terjemahan, catatan pemakaian) + bentuk ます/します
  disambungkan ke contoh bentuk kamus yang sudah ada (いきます → いく).
  Kata yang bunyinya sama mendapat contoh sesuai artinya.
- **Kosakata Dasar Sehari-hari**: 172 kata pemula per tema (orang &
  keluarga, negara & kota, tempat, benda & dokumen, makanan, hobi &
  budaya, kata kerja, keterangan, akhiran & penghitung, ungkapan),
  masing-masing dengan contoh kalimat per bagian.

### Perbaikan
- Menekan ⭐ di daftar kosakata tidak lagi membuat posisi daftar
  melompat saat bagian Favorit muncul/berubah di atas.

### Teknis
- Baru: `data/ja_chapter_vocab.dart`, `data/ja_chapter_examples.dart`
  (`vocabUsageJaChapter` berkunci `kata|arti`, alias ke `vocabUsageJa`),
  `data/ja_basic_vocab.dart`.
- Tes baru: `ja_chapter_vocab_test.dart`, `ja_basic_vocab_test.dart`,
  `materials_vocab_order_test.dart`; tes jangkar gulir di
  `vocab_star_test.dart`.

## 1.19.0 (build 35) — 11 November 2026

### Baru
- **Partikel Jepang berwarna**: di contoh kalimat kosakata (Materi →
  Kosakata → ketuk kata), 16 partikel (は, が, を, に, で, へ, と, も,
  の, から, まで, より, や, か, ね, よ) diwarnai di baris kana & romaji,
  dengan penjelasan tiap partikel yang muncul di bawah kalimat. Kata
  yang bentuknya sama tidak ikut diwarnai: は "gigi" (dibaca ha), に
  angka dua (りんご が に こ).
- **Materi "Partikel Dasar" lengkap 16 partikel** (10 bagian baru: が,
  へ, と, も, から, まで, より, や, ね, よ), judul bagian & contohnya
  ikut diwarnai; juga di "Pola Kalimat Dasar".
- **Kalimat Inggris dijelaskan**: kata fungsi diwarnai per golongan
  (preposisi, artikel, kata kerja bantu/modal, kata sambung) beserta
  artinya; kosakata yang dipelajari ditebalkan + bentuknya (V2, V3,
  -s/-es, -ing; ±100 kata kerja tak beraturan).
- **Label tense** di contoh kalimat Inggris (Simple Present/Past, Present
  Continuous/Perfect, Simple Future, dst.) — ketuk untuk lembar
  penjelasan. Kalimat yang meragukan (perintah, modal, put/set/cut)
  sengaja tanpa label; ±73% contoh mendapat label.
- **Materi baru (Inggris)**: "Tenses Lengkap" (8 tenses: rumus +/−/?,
  kapan dipakai, penanda waktu, kesalahan umum, contoh) dan "Kata
  Fungsi" (in/on/at waktu & tempat, preposisi lain, be/do/have, modal,
  kata sambung). Contoh di topik tata bahasa Inggris ikut diwarnai.

### Teknis
- Baru: `data/ja_particles.dart`, `data/en_grammar.dart`,
  `data/en_grammar_guides.dart`, `widgets/ja_particle_text.dart`,
  `widgets/en_sentence_text.dart`.
- Tes baru `test/ja_particles_test.dart`, `test/en_grammar_test.dart`.

## 1.18.1 (build 34) — 10 November 2026

### Perbaikan
- **Tabel Hiragana & Katakana (Materi)**: baris gojūon kini sejajar
  seperti tabel standar — や・ゆ・よ satu baris, ら〜ろ satu baris,
  わ・を satu baris (sebelumnya ら/り ikut naik ke baris や).
- **Yōon** ditampilkan 3 kolom sehingga tiap baris satu kelompok
  (きゃ きゅ きょ / しゃ しゅ しょ / …).

### Teknis
- `GuideSection` menyimpan `kanaGrid` (dengan sel kosong, token `_` di
  `_kana`) dan `kanaColumns`; getter `kana` tetap tanpa sel kosong
  untuk latihan & pencarian. Tes baru `test/kana_grid_test.dart`.

## 1.18.0 (build 33) — 10 November 2026

### Baru
- **Korea — setara Jepang**:
  - Materi: **Kosakata Inti TOPIK I** (1.058 kata, 54 tema), 7 topik
    **tata bahasa** (tingkat bicara, konjugasi, lampau/masa depan,
    negasi, permintaan, penghubung), ungkapan sehari-hari (209),
    **ungkapan kerja & EPS** (89), onomatope & tanggapan (123), idiom &
    peribahasa (109). Semua dengan contoh kalimat + romanisasi.
  - Latihan: **Tebak Kata** per kategori, 8 paket **Pilihan Ganda**
    TOPIK I, **simulasi TOPIK I** (Mendengar 30 · Membaca 40, skor /200,
    Level 1 ≥ 80 / Level 2 ≥ 140) dan **EPS-TOPIK** (25 + 25, /200).
- **Jerman — setara Jepang**:
  - Materi: **Kosakata Inti A1–A2** (1.049 kata Goethe, kata benda
    berartikel + jamak), 7 topik tata bahasa (urutan kata, Akkusativ/
    Dativ, preposisi, modal & kata kerja terpisah, Perfekt, negasi &
    imperatif, kata sifat), ungkapan sehari-hari (210), **kerja &
    Pflege** (96), partikel & pengisi (78), idiom & peribahasa (112).
  - Latihan: Tebak Kata & 8 paket Pilihan Ganda per kategori,
    **simulasi Goethe-Zertifikat A1** (Hören + Lesen, lulus rata-rata
    ≥ 60) dan **A2** (tiap modul ≥ 60).
- **Jepang**: 540 ungkapan baru — sehari-hari (206), aizuchi (49),
  kerja & keigo (78), onomatope (107), idiom & peribahasa (100).
- **Inggris**: Ungkapan Sehari-hari (204), Phrasal Verb (157), Idiom
  (151), semuanya dengan contoh kalimat & catatan pemakaian.
- Lembar detail kosakata kini mendukung contoh kalimat Korea & Jerman.

### Perubahan
- **Kosakata JLPT N5/N4/N3 diurutkan per tema** (data dasar + tambahan
  digabung; waktu lampau → kini → depan, angka & bulan berurutan);
  judul bagian di Materi memakai nama tema, bukan "Bagian N".
- Daftar kosakata Inggris/Jepang/Korea/Jerman dikelompokkan per
  situasi/tema dengan judul bagian.

### Perbaikan
- **Tema gelap**: teks snackbar (dulu gelap di atas hijau gelap) dan
  tombol aksinya kini terbaca; AlertDialog & lembar bawah memakai latar
  papan tulis, senada dengan dialog Beomora.
- Kartu paket Pilihan Ganda tidak lagi meluber untuk judul panjang.
- Flag `premium` di profil (lencana Papan Juara) tidak lagi terbaca
  sebagai premium seumur hidup tanpa catatan pembelian.

### Teknis
- Generator & validator baru di `tool/`: `jlpt_themes.py`,
  `gen_ko_vocab.py`/`check_ko_vocab.py`, `gen_de_vocab.py`/
  `check_de_vocab.py`, `gen_{ja,ko,de}_phrases.py`/`check_*_phrases.py`,
  `check_en_phrases.py`; `gen_vocab_examples.py` mendukung `ko` & `de`.
- `ExamScoring`: `topik1`, `epsTopik`, `goetheA1`, `goetheA2`.
- Tes baru: `jlpt_vocab_order_test`, `ja_phrases_test`,
  `topik_vocab_test`, `goethe_vocab_test`, `ko_parity_test`,
  `de_parity_test`, `dark_theme_test`.

## 1.17.0 (build 32) — 8 November 2026

### Baru
- **Kuota Premium pendaftar awal**: saklar admin `premiumForAll` kini
  membuka kuota — pendaftar baru otomatis mendapat Premium **permanen**
  (field `earlyBirdNo` di profil) sampai mencapai `premiumForAllLimit`
  (bawaan 500). Penghitung `content/earlyBird` dinaikkan tepat +1
  dalam transaksi pendaftaran, ditegakkan `firestore.rules`.
  Menutup kuota / menurunkan batas tidak mencabut premium yang sudah
  dibagikan.
- **Dialog "Selamat, kamu dapat Premium! 🎉"** sekali per akun, tampil
  paling awal saat app dibuka (sebelum pemberitahuan streak).
- **Admin (Pengaturan)**: ubah batas kuota, lihat kuota terpakai, dan
  "Bagikan kuota ke pengguna lama" (urut dari yang paling awal daftar,
  aman dijalankan ulang).

### Perubahan
- Saklar admin tidak lagi menjadikan SEMUA pengguna premium; premium
  kini = kuota pendaftar awal, hadiah admin, atau pembelian.

### Teknis
- `AuthProvider`: `earlyBird`, `profileReady`, `applyEarlyBird`,
  `setEarlyBirdLimit`, `refreshEarlyBirdUsed`, `backfillEarlyBird`,
  `earlyBirdCandidates`; status disimpan di prefs `auth_early_bird`
  (dibaca juga oleh `ProgressProvider`).
- `firestore.rules`: admin boleh menulis `earlyBirdNo`; aturan baru
  `content/earlyBird`. **Wajib deploy rules sebelum rilis.**
- Tes `premium_test.dart` diperbarui.

## 1.16.0 (build 31) — 8 November 2026

### Baru
- **Pilih huruf sebelum latihan (Materi)**: tombol latihan di topik
  Hiragana, Katakana, Kanji N5/N4 (juga Hangul, Angka Korea & Jerman)
  kini membuka pemilih huruf — kotak per huruf dikelompokkan per bagian
  Materi (Gojūon, Dakuten, Yōon; kanji per tema), centang per bagian,
  ikon pilih semua / kosongkan — lalu lembar jumlah soal. Huruf yang
  tidak dipilih tetap jadi pengecoh agar selalu 4 pilihan.
- **Tulis Huruf: pilih huruf/kanji & jumlah soal** memakai pemilih yang
  sama (menggantikan langkah "Pilih cakupan huruf"). Gratis tetap 3
  huruf per sesi; Premium bebas pilih hingga 100 (sebelumnya tetap 10).
  Soal melebihi jumlah huruf → huruf diulang per putaran tanpa muncul
  dua kali berturut-turut. "Lagi" mengulang dengan pilihan yang sama.

### Perubahan
- Teks ajakan Premium di Tulis Huruf: "Premium bebas pilih jumlah huruf".

### Teknis
- Layar baru `LetterPickScreen` (dipakai Materi & Tulis Huruf, dengan
  `groups`, `freeLimit`, `onStart`).
- Lembar jumlah soal dipindah ke widget bersama
  `widgets/question_count_sheet.dart` (`showQuestionCountSheet`).
- `HandwritingScreen` menerima `customCategory` + `questionCount`.
- Tes baru `test/letter_pick_screen_test.dart`; tes Tulis Huruf
  disesuaikan dengan alur baru.

## 1.15.0 (build 30) — 8 November 2026

### Baru
- **Favorit kosakata (⭐)**: setiap kata di Materi → Kosakata (di dalam
  topik dan di hasil pencarian) punya tombol bintang. Kata berbintang
  terkumpul di bagian "⭐ Favorit" paling atas — di dalam topik (favorit
  topik itu) dan di halaman daftar Kosakata (semua topik, dengan label
  asal topik). Favorit disimpan per kursus di perangkat (belum sinkron).
- **Kosongkan favorit**: ikon reset di judul bagian Favorit, dengan
  konfirmasi; di dalam topik hanya melepas favorit topik itu.
- **Latihan Kosakata: kartu Favorit** di bawah kolom pencarian berisi
  kata berbintang dari topik yang dibuka; bisa centang semua sekaligus,
  pilihan tersinkron dengan kartu topik asalnya.

### Perubahan
- Latihan Kosakata: tombol "Pilih semua" dan "Kosongkan" kini ikon
  (keterangan muncul saat ditekan lama).
- Saat memutar kosakata, bar bawah cukup menampilkan ikon suara
  (tanpa kata & hitungan); kata yang dibaca tetap disorot di daftar.

### Teknis
- `SettingsProvider`: `starredWords`, `isStarred`, `toggleStarred`,
  `removeStarred` (kunci `vocab_starred_<kursus>`).
- Widget baru `VocabStarButton` & `VocabStarClearButton`.
- Tes baru `test/vocab_star_test.dart` + tes kartu Favorit di Latihan
  Kosakata.

## 1.14.0 (build 29) — 5 November 2026

### Baru
- **Tantangan Waktu bisa diatur sendiri**: isi jumlah soal (atau ∞ tanpa
  batas) dan waktu dalam menit (1–600 menit / 10 jam) dengan kolom
  angka + tombol −/+. Jumlah soal maksimal = kata unik kursus (Jepang
  576, kursus lain 288) dan soal tidak berulang sampai semua kata
  keluar. Selesai saat waktu habis atau semua soal terjawab; timer
  tampil m:ss / j:mm:ss dan "Soal 3/20".
- **Latihan Bebas: pilih jumlah soal** sebelum mulai (minimal 10,
  maksimal 100 atau sebanyak kata yang dikuasai), tanpa soal ulang.
  Kalau kata dikuasai kurang dari 10, dipakai semua kata kursus.
- **Papan Juara reset tiap Minggu 23:59:59 WIB** untuk semua pengguna
  (zona tetap WIB, bukan jam HP), dengan hitung mundur "Reset dalam …".
- **Latihan Kosakata**: pembatas Bagian 1, 2, … per topik dengan
  centang per bagian dan hitungan terpilih.

### Perubahan
- **Tampilan bawaan Papan Tulis (gelap)** untuk pengguna yang belum
  pernah memilih tema.
- **Kecepatan suara** di Latihan Kosakata: ketuk → daftar kecepatan
  muncul ke atas, pilih langsung. Bar bawah kini "3 kata".
- **Tulis Huruf**: popup langsung tampil dengan loading selagi model
  dicek (sebelumnya layar diam beberapa detik); hasil cek diingat
  selama sesi sehingga ketukan berikutnya langsung masuk. Dialog
  aktivasi didesain ulang (kartu RAM & ruang dengan status berwarna,
  sakelar Wi-Fi, progress unduh).
- **Kartu Kilat & Memory Match dikeluarkan** dari Ruang Latihan (kode
  layar tetap ada).

### Perbaikan
- Catatan panjang "kosongkan sekitar … MB lagi" di dialog Tulis Huruf
  tidak lagi meluap di layar sempit.

### Teknis
- Kunci minggu papan juara berganti format (`2026-w44` →
  `w20261102`, tanggal Senin WIB). Saat rilis, XP mingguan semua orang
  mulai dari 0; pengguna versi lama tidak tampil di papan versi baru
  (dan sebaliknya) sampai update.

## 1.13.0 (build 28) — 3 November 2026

### Baru
- **Putar kosakata terpilih** di Latihan Kosakata: tombol ▶ di bar bawah
  membacakan kata yang dicentang satu per satu (⏹ untuk berhenti). Kata
  yang sedang dibacakan tampil di bar bawah dan disorot di daftar.
- **Ulangi terus-menerus** (🔁): putaran mulai lagi dari kata pertama
  sampai dihentikan; bisa dinyalakan/dimatikan saat sedang memutar.
- **Kecepatan suara** 0.5× · 0.75× · 1× · 1.25× · 1.5× · 2× (ketuk untuk
  berganti); jeda antar kata ikut menyesuaikan. Pilihan tersimpan di
  perangkat.

### Perbaikan
- Centang kata di Latihan Kosakata tidak lagi tertunda: daftar kini
  hanya menggambar baris yang terlihat (sebelumnya 800+ baris digambar
  ulang tiap ketukan di topik JLPT N5).

## 1.12.0 (build 27) — 1 November 2026

### Baru
- **Detail kosakata**: ketuk kata di Materi → Kosakata (atau hasil
  pencarian) untuk melihat contoh kalimat (bisa didengar, dengan romaji &
  terjemahan) dan catatan penggunaan (jenis kata, pola, kolokasi, bentuk
  sopan). Tersedia untuk semua kosakata JLPT N5–N3 (1.609 kata) dan
  kosakata ujian Inggris Akademik/IELTS/TOEIC (1.452 kata). Topik
  tematik menampilkan kalimat dari topiknya yang memuat kata itu.

## 1.11.0 (build 26) — 31 Oktober 2026

### Baru
- **Tebak Kanji** & **Tebak Kata** di Ruang Latihan (kursus Jepang)
  menggantikan Tebak Huruf; jumlah soal bebas (gratis maks. 10 per
  sesi). Tebak Kanji: pilih level N5/N4 dan jenis soal (arti, bacaan
  on/kun, baca kata). Tebak Kata: kosakata JLPT N5–N1.
- **Latihan Kosakata**: tombol mengapung di Materi → Kosakata; pilih kata
  sendiri (per topik / cari), tentukan jumlah soal. Soal melebihi jumlah
  kata diulang merata & tidak berurutan sama.
- **Kanji N5 (100) & N4 (185)** dengan on'yomi, kun'yomi, arti, dan
  contoh kata (`tool/gen_kanji.py`). Ketuk kanji di Materi → panel
  detail. Paket Kanji N4 di Tebak Huruf & Tulis Huruf.
- **Kosakata JLPT diperbanyak**: N5 233 → 806, N4 108 → 712
  (`tool/jlpt_n5_extra.py`, `tool/jlpt_n4_extra.py`); kata yang sama di
  dua level ditolak generator.
- **Kosakata ujian Inggris** (Materi → Kosakata): Akademik/AWL 592
  (TOEFL · IELTS · PTE), IELTS 347, TOEIC 513 (`tool/gen_en_exam_vocab.py`).
- **Mode Ujian diperbarui**:
  - JLPT N5/N4 mengikuti susunan soal sejak 2020; kosakata gaya asli
    (漢字読み, 表記, 文脈規定, 言い換え, 用法) tanpa terjemahan/romaji;
    bank tata bahasa, bacaan (termasuk 情報検索), dan dengar diperbanyak.
  - TOEFL iBT format 2026 (Complete the Words, Daily Life, Choose a
    Response, Build a Sentence, Email, Academic Discussion), skor band
    1–6 + padanan 0–120.
  - IELTS Writing Task 1 & 2; Reading dengan True/False/Not Given.
  - PTE: Summarize Written Text, Essay, Fill in the Blanks, Reorder
    Paragraphs, Highlight Incorrect Words, Write from Dictation.
  - Bentuk soal baru: susun potongan, tandai kata, dikte, esai (dinilai
    sendiri dengan contoh jawaban & daftar cek).

### Perubahan
- **Login dulu**, baru pilih bahasa, kursus, dan target. Pilihan &
  bahasa UI tersimpan di akun, jadi login di HP lain langsung ke menu
  utama. Tombol bahasa ID/EN di halaman login.
- Tebak Huruf disembunyikan dari Ruang Latihan kursus Jepang (paket
  tetap bisa dibuka dari Materi).
- Arti ごはん, みる, きく dirapikan; かいしゃ dan beberapa kata dasar
  dipindah ke N5.

### Perbaikan
- Kuis kanji: daftar huruf yang salah kini menampilkan kanjinya.
- Kata yang sama di dua level JLPT tidak lagi muncul sebagai pengecoh.

## 1.10.0 (build 25) — 24 Oktober 2026

### Baru
- **Tebak Kana Campur** di Ruang Latihan (kursus Jepang): racik sendiri
  paket kuis — hiragana dan/atau katakana; huruf dasar (gojūon),
  dakuten & handakuten, serta yōon — lalu pilih bebas jumlah soal
  (slider 5 sampai semua huruf, atau 10/20/30/50/100/Semua). Memakai
  mesin Tebak Huruf (arah soal acak, TTS, ulasan huruf yang salah, XP).
- **Garis penghubung di soal Cocokkan Pasangan**: pasangan bisa
  dicocokkan dengan menarik garis dari kotak kiri ke kotak kanan (ketuk
  kiri → kanan tetap bisa). Pasangan yang benar tersambung garis lengkung
  berwarna; salah → garis hilang dan kotak berkedip merah.

### Perubahan
- **Latihan Bicara dinonaktifkan sementara** (`kSpeakingEnabled = false`
  di `speech_scorer.dart`): kartu disembunyikan dari Ruang Latihan selama
  deteksi suara disempurnakan. Kode tetap ada, termasuk perbaikan deteksi:
  sesi tidak lagi ditutup sebelum hasil akhir datang, status sisa sesi
  lama diabaikan, mode `dictation`, dan berhenti otomatis saat diam /
  ucapan sudah tepat.

### Perbaikan
- Tombol **Mulai** di Tebak Kana Campur tidak lagi memicu galat provider.

## 1.8.1 (build 21) — 21 September 2026

### Perbaikan
- **Cache materi dibuang otomatis saat aplikasi di-update**: sebelumnya
  cache hasil sinkron Firestore selalu menang atas asset bawaan, sehingga
  materi baru yang ikut di-bundle saat rilis tidak pernah terlihat oleh
  pengguna lama sampai mereka hapus data aplikasi. Kini build number
  disimpan di prefs (`content_app_build`, via `package_info_plus`); kalau
  berubah, cache materi + bank MCQ dibuang, `content_version` direset,
  dan sinkron berikutnya langsung mengunduh ulang dari server. Tetap
  tekan **Unggah materi** (admin) tiap rilis agar server ikut versi
  terbaru — kalau tidak, sinkron akan menarik kembali materi lama dari
  server.
- **Skrip `tool/set_admin.js`**: tambah/cabut admin dari terminal
  (`node tool/set_admin.js nama@gmail.com`, `--remove` untuk mencabut)
  memakai sesi `firebase login` yang ada, tanpa Firebase Console.

## 1.8.0 (build 19) — 16 September 2026

### Baru (Ujian)
- **Ujian** di Ruang Latihan (kursus Inggris & Jepang): simulasi ujian
  lengkap bagian demi bagian dengan jumlah soal dan batas waktu meniru
  ujian asli — TOEFL iBT (Reading 20, Listening 28, Writing 10), IELTS
  Academic (Listening 40, Reading 40, Writing 10), PTE Academic (18/18/8),
  serta JLPT N5, N4, N3, N2, N1 (Kosakata, Tata Bahasa, Bacaan, Dengar
  sesuai porsi tiap level, plus Menulis 10 sebagai bagian tambahan).
  Benar/salah baru terlihat di akhir; tiap bagian punya timer yang
  menutup bagian otomatis saat habis; audio Dengar dibatasi 1–2x putar
  per bacaan; soal reading menampilkan bacaan, soal listening membuka
  transkrip + terjemahan hanya di ulasan akhir. Bisa mundur ke soal
  sebelumnya dalam satu bagian; keluar di tengah ujian minta konfirmasi.
- **Hasil ujian**: persen benar, tabel per bagian, dan perkiraan skor
  resmi — TOEFL per bagian /30, IELTS band per bagian & rata-rata,
  PTE 10–90, JLPT skala 180 dengan status LULUS/BELUM (ambang total dan
  per bagian mengikuti aturan resmi tiap level). Ulasan soal salah dengan
  jawabanmu, jawaban benar, dan tombol dengar. XP: +5 latihan +1 per soal
  benar. Hasil terbaik per ujian disimpan dan ikut sinkron akun.
- **Gratis vs Premium**: ujian penuh untuk Premium; pengguna gratis
  mendapat ujian mini 10 soal campur dari semua bagian (waktu 1 menit per
  soal) dengan hasil tanpa perkiraan skor resmi.
- **Konten baru**: 10 bacaan akademik Inggris (50 soal pemahaman) dan 30
  isian menulis akademik; 18 bacaan dokkai Jepang N5–N1 (83 soal); 138 soal
  tata bahasa JLPT N5–N1 (termasuk soal susun kalimat ★); kosakata JLPT N2
  dan N1 (60 kata per level) yang juga muncul sebagai paket Pilihan Ganda
  baru; 70 soal tulis bacaan kanji/kata N5–N1; serta paket Latihan Dengar
  baru Choukai N3 (8 bacaan), N2 (8), dan N1 (9) yang juga dipakai bagian
  Dengar ujian.
- Catatan: Speaking tidak disimulasikan dan esai TOEFL/IELTS/PTE diganti
  isian singkat yang diketik supaya bisa dinilai offline.

### Baru (Jalur Belajar)
- **12 unit baru** untuk kursus Inggris, Jerman, Korea, dan Indonesia
  (unit 5–16, tema sejajar dengan kursus Jepang): Angka Lanjutan, Warna,
  Hewan, Hari & Pekan, Cuaca & Musim, Tubuh & Kesehatan, Pakaian, Sekolah,
  Pekerjaan, Transportasi, Kota & Tempat, serta Belanja & Uang — 36
  pelajaran, 216 kata, dan 72 kalimat baru per kursus (tiap kursus kini 16
  unit / 48 pelajaran / 288 kata). Materi dibangun dari satu data induk
  (`tool/course_units_master.py` + terjemahan `course_units_de.py` /
  `course_units_ko.py`) lewat `tool/gen_course_units.py`.

### Teknis
- **Daftar admin pindah ke Firestore**: akun admin tidak lagi ditulis
  di kode aplikasi maupun di `firestore.rules`, melainkan koleksi
  `admins` dengan ID dokumen = alamat email. Rules memakai `exists()`
  ke koleksi itu untuk izin tulis materi dan hadiah premium; aplikasi
  mengecek dokumen `admins/{email}` setelah profil termuat untuk
  menampilkan fitur admin di Pengaturan. Tambah/cabut admin cukup dari
  Firebase Console tanpa rilis aplikasi. Sebelum publish rules baru,
  buat dokumen `admins/<email>` untuk tiap admin yang sudah ada.

## 1.7.0 (build 18) — 9 September 2026

### Baru (Tulis Huruf)
- **Tulis Huruf** di Ruang Latihan (semua kursus): tulis kana, kanji N5,
  hangul, atau alfabet dengan jari di kanvas kertas latihan, dinilai oleh
  pengenalan tulisan tangan ML Kit yang berjalan offline di perangkat.
  Benar kalau lambang ada di 3 kandidat teratas (alfabet tanpa peduli
  huruf besar). Tombol hapus goresan, bersihkan, dengar bacaan; umpan
  balik menampilkan lambang jawaban dan teks yang terbaca. 10 soal per
  paket, 2 XP per huruf benar; paket kanji N5 premium. Sebelum mulai,
  cakupan huruf bisa dipilih per kelompok materi (mis. Gojūon saja,
  ditambah Dakuten & Handakuten, Yōon, atau semua; hangul per jenis
  vokal/konsonan; kanji per tema), bawaan kelompok pertama.
- **Saklar di Pengaturan** (bawaan mati). Menyalakan memunculkan dialog
  kebutuhan: RAM disarankan 3 GB dan ruang kosong minimal 200 MB dibanding
  kondisi perangkat (dibaca lewat kanal native `beomora/device`). RAM
  rendah hanya peringatan; ruang kurang menonaktifkan tombol unduh dengan
  jumlah yang perlu dikosongkan. Saklar aktif hanya setelah model kursus
  aktif selesai diunduh; batal/gagal = tetap mati.
- Pilihan **unduh model hanya lewat Wi-Fi** (bawaan ya) dan daftar model
  per bahasa dengan status, perkiraan ukuran (20–30 MB), tombol unduh dan
  hapus. Model disimpan ML Kit di penyimpanan internal app dan tidak ikut
  disinkron; mematikan saklar tidak menghapus model.
- Kartu Tulis Huruf di Ruang Latihan selalu tampil; kalau belum aktif atau
  model bahasanya belum ada, ketuk membuka alur aktivasi yang sama.
- Teknis: plugin `google_mlkit_digital_ink_recognition` 0.15.0 punya nama
  kanal yang tidak cocok antara Dart/iOS ("…_recognizer") dan Android
  ("…_recognition"), sehingga unduh model selalu gagal
  MissingPluginException di Android. Layanan tulis memanggil kanal native
  langsung dan mencoba kedua nama; dialog gagal unduh menampilkan pesan
  error asli plugin.

### Perubahan
- **Batas gratis vs Premium** untuk Latihan Dengar dan Tulis Huruf.
  Dengar: pengguna gratis hanya bisa membuka 2 bacaan pertama di setiap
  paket (termasuk paket dasar), Premium semua bacaan. Tulis: pengguna
  gratis 3 huruf per sesi dengan catatan dan ajakan Premium di kuis dan
  hasil, Premium 10 huruf. Kartu di Ruang Latihan menampilkan batasnya.

### Perbaikan
- **Layar hasil kuis** (semua kuis): kotak hitungan benar/salah tidak lagi
  meluap ke kanan di layar sempit (lebar 320 dp) atau saat teks sistem
  diperbesar; isinya mengecil proporsional. Layar Tulis Huruf, dialog
  aktivasi, dan Latihan Dengar diverifikasi bebas overflow di 320x568,
  360x640, tablet 800x1280, dan landscape, dengan skala teks 1,0 dan 1,3.
- **Suara kanji**: tombol dengar di Materi Kanji N5, Tebak Huruf, dan Tulis
  Huruf kini mengucapkan bacaan yang ditampilkan (よん untuk 四, なな untuk
  七, ひ untuk 日) alih-alih kanji tunggal yang dibaca semaunya oleh mesin
  suara (shi, shichi, nichi). Romaji diubah ke hiragana dengan tabel dari
  materi hiragana (`lib/services/kana_speech.dart`).
- **Susun kalimat**: kotak kata yang sama hanya beda huruf besar atau tanda
  baca (misal "My" dan "my") tidak lagi muncul dua kali, dan jawaban
  dinilai tanpa memedulikan huruf besar. Pengecoh kini diambil dari semua
  kalimat kursus (cadangan: kosakata) sehingga tiap soal punya minimal
  12 kotak kata, bukan 3 pengecoh dari satu kalimat lain.

### Baru (Latihan Dengar)
- **Latihan Dengar** di Ruang Latihan (lima kursus): paragraf
  dibacakan TTS lalu 3 soal pemahaman per bacaan, gaya ujian internasional.
  Transkrip dan terjemahan dibuka setelah semua soal dijawab.
  - Inggris: Listening Dasar (10 bacaan, gratis, putar bebas), TOEFL
    Listening (10, kuliah kampus), IELTS Listening (10, situasi sehari-hari),
    PTE Listening (10, rangkuman kuliah, 1x putar).
  - Jepang: Choukai N5 (8 bacaan) dan Choukai N4 (8 bacaan).
  - Korea: Listening Dasar (8, gratis) dan TOPIK I Listening (8).
  - Jerman: Hören Dasar (8, gratis) dan Goethe A1/A2 Hören (8).
  - Indonesia: Menyimak Dasar (8, gratis) dan UKBI Menyimak (8);
    terjemahan hanya Inggris karena transkrip sudah Indonesia.
  - Batas jumlah putar per paket (mode ujian) hanya untuk pengguna gratis;
    Premium putar bebas di semua paket. Mode lambat, putar otomatis saat
    bacaan dibuka, dan 2 XP per jawaban benar.
  - Pemutar punya garis progres dari awal sampai akhir bacaan dengan waktu
    berjalan/total (m:ss; total ditandai ~ selagi perkiraan, dikunci ke
    durasi nyata setelah sekali selesai), tombol jeda/lanjutkan
    (melanjutkan dari kata terakhir, tidak memakai jatah putar), tombol
    "dari awal", dan garis bisa digeser saat putar bebas.
  - Pengguna gratis dapat membuka 2 bacaan pertama tiap paket; Premium
    semua bacaan.
  - Setiap bacaan punya bank 5 soal; tiap kali bacaan dibuka, 3 soal
    diambil acak (urutan soal dan pilihan ikut diacak), jadi mengulang
    bacaan yang sama memberi soal berbeda. Total 520 soal (104 bacaan
    di lima kursus).
- TTS: mode "bicara sampai selesai" dengan kecepatan yang bisa diatur dan
  callback progres per kata (Android 8+ dan iOS).

### Teks "Yang baru" untuk Play Store (≤ 500 karakter)
Indonesia (456 karakter):
```
✍️ Baru: Tulis Huruf
Tulis hiragana, katakana, kanji N5, hangul, atau alfabet dengan jari, langsung dinilai tanpa internet. Pilih cakupannya dulu: Gojūon saja, plus Dakuten, Yōon, atau semua.

🎧 Latihan Dengar kini 5 bahasa
Korea, Jerman, dan Indonesia menyusul Inggris dan Jepang. 104 bacaan, soal acak tiap kali diulang.

✨ Lebih rapi
Susun kalimat punya lebih banyak kotak kata, dan suara kanji kini dibaca sesuai bacaan yang tampil (四 = yon, 七 = nana).
```
Inggris (478 karakter):
```
✍️ New: Write Letters
Draw hiragana, katakana, N5 kanji, hangul, or the alphabet with your finger and get graded instantly, fully offline. Pick your scope first: Gojūon only, plus Dakuten, Yōon, or everything.

🎧 Listening Practice in 5 languages
Korean, German, and Indonesian join English and Japanese. 104 passages with fresh random questions every time.

✨ Polished
Sentence building offers more word tiles, and kanji audio now matches the reading shown (四 = yon, 七 = nana).
```

## 1.6.0 (build 17) — 8 September 2026

### Baru
- **Pencarian kosakata.** Layar Kosakata punya kolom cari yang menyaring
  kata dari semua kategori sekaligus, lewat kata, cara baca, atau arti.
  Hasilnya bisa langsung didengar.
- **Pencarian di setiap kategori materi.** Tiap topik (Pertanian, Kelautan,
  Hiragana, JLPT N5, dll.) punya kolom cari sendiri; bagian yang tidak
  cocok disembunyikan, sel kana ikut tersaring.
- **Kosakata tematik 18 → 50 kata per kategori** untuk kursus Jepang,
  Inggris, dan Indonesia: 8 kategori x 32 kata baru dalam 4 bagian
  tambahan (768 kata).
- **Kosakata tematik untuk Korea dan Jerman.** 8 kategori baru per kursus,
  masing-masing 50 kata dan 6 kalimat contoh. Korea memakai Romanisasi
  Revisi, Jerman dengan artikel dan ejaan baca (800 kata, 96 kalimat).
- **Pemberitahuan streak satu halaman** menggantikan dialog kecil saat
  tantangan streak selesai atau saat bolos lebih dari sehari.

### Perubahan
- **Onboarding lebih singkat.** Langkah "Tentukan target harian" dihapus;
  target XP memakai bawaan 20 XP dan tetap bisa diubah di Pengaturan.
- **Tab Belajar menggulir ke pelajaran terakhir** setiap kali diketuk,
  termasuk ketuk ulang saat sudah berada di tab Belajar.
- **Halaman Kampus**: judul seksi "Menu" di atas pintu-pintu, kartu lebih
  rapat, dan jarak ke daftar statistik diperbaiki.
- **Hint pencarian menyesuaikan bahasa kursus**: "romaji" untuk Jepang,
  "romanisasi" untuk Korea, "cara baca" untuk Inggris dan Jerman.
- **Kuis huruf**: paket premium tidak lagi dilompati untuk pengguna gratis;
  pemilih paket tetap tampil dengan kartu bergembok.

### Teknis
- Generator `tool/gen_vocab_extra.py` + `tool/vocab_ko_de.py` membangun
  kosakata lima kursus dari satu daftar; menolak duplikat dan memverifikasi
  56 contoh per topik.
- `lib/data/study_guides.dart` diformat ulang dengan `dart format`.

### Teks "Yang baru" untuk Play Store (≤ 500 karakter)
Pencarian kosakata di semua kategori materi, kini 50 kata per kategori
untuk Jepang, Inggris, dan Indonesia. Kosakata tematik baru untuk Korea dan
Jerman. Onboarding lebih singkat, tab Belajar langsung menuju pelajaran
terakhir, dan pemberitahuan streak yang lebih rapi.

## 1.5.2 (build 16) — 4 September 2026
- Pembaruan dalam aplikasi (Play In-App Update) dan aturan keamanan
  Firestore yang lebih ketat.
- Perapian tata letak halaman Kampus.

## 1.5.0 (build 14) — 4 September 2026
- Pengingat belajar harian dengan pengaturan jam.
- Tes fitur premium, generator kosakata JLPT, dan perender aset Play Store.
