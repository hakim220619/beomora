# Catatan Rilis Beomora

Semua perubahan penting dicatat di sini. Versi mengikuti `pubspec.yaml`
(`versi+kode build`).

## Belum dirilis

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
