# Catatan Rilis Beomora

Semua perubahan penting dicatat di sini. Versi mengikuti `pubspec.yaml`
(`versi+kode build`).

## Belum dirilis

### Perbaikan
- **Susun kalimat**: kotak kata yang sama hanya beda huruf besar atau tanda
  baca (misal "My" dan "my") tidak lagi muncul dua kali, dan jawaban
  dinilai tanpa memedulikan huruf besar. Pengecoh kini diambil dari semua
  kalimat kursus (cadangan: kosakata) sehingga tiap soal punya minimal
  12 kotak kata, bukan 3 pengecoh dari satu kalimat lain.

### Baru
- **Latihan Dengar** di Ruang Latihan (kursus Inggris dan Jepang): paragraf
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
  - Paket ujian premium; pengguna gratis dapat mencoba 2 bacaan pertama.
  - Setiap bacaan punya bank 5 soal; tiap kali bacaan dibuka, 3 soal
    diambil acak (urutan soal dan pilihan ikut diacak), jadi mengulang
    bacaan yang sama memberi soal berbeda. Total 520 soal (104 bacaan
    di lima kursus).
- TTS: mode "bicara sampai selesai" dengan kecepatan yang bisa diatur dan
  callback progres per kata (Android 8+ dan iOS).

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
