# 📚 Beomora — Belajar Bahasa

Aplikasi pembelajaran bahasa dengan gamifikasi, dibuat dengan Flutter.
Mendukung 3 kursus bahasa: **Inggris 🇬🇧, Jepang 🇯🇵, Indonesia 🇮🇩** — dengan UI
dalam Bahasa Indonesia atau Inggris.

## ✏️ Identitas Visual: Suasana Belajar

Seluruh aplikasi bernuansa alat belajar. Semua digambar dengan
CustomPainter, tanpa aset gambar:

- **Buku catatan hidup (mode terang)** — kertas bergaris biru dengan margin
  merah, pesawat kertas melintas, dan coretan pensil melayang
- **Papan tulis kapur (mode gelap)** — papan hijau tua dengan serbuk kapur
  berkelip dan bekas hapusan kapur
- **Jalur belajar** — pelajaran adalah buku 📖 yang terhubung garis pensil
  putus-putus; pensil ✏️ menandai pelajaran aktif (beranimasi)
- **Progress bar stabilo** — isian tinta dengan pensil "menulis" di ujungnya
- **Rak menu mengapung** — navigasi bawah: 📚 Belajar · ✏️ Latihan · 🎓 Kampus
- **Podium kelas** — Papan Juara dengan panggung kayu untuk 3 besar
- **Bintang nilai** — layar selesai pelajaran dengan sinar emas berputar
- Mata uang **koin 🪙**, toko = **Koperasi Sekolah**, papan unit kayu,
  maskot lebah rajin 🐝
- **Logo & ikon aplikasi** — maskot lebah digambar CustomPainter
  (`lib/widgets/beomora_logo.dart`); ikon launcher Android, AppIcon iOS,
  dan ikon web/PWA di-render darinya:
  `RENDER_ICONS=1 flutter test test/tools/render_icons_test.dart`

## Menjalankan

```bash
flutter pub get
flutter run          # pilih perangkat (Android/iOS/Chrome)
flutter test         # jalankan test
```

## Fitur

### Pembelajaran
- **Learning path bertingkat** — 4 unit × 3 pelajaran per kursus, node terkunci
  sampai pelajaran sebelumnya selesai
- **7 tipe soal**: pilihan ganda (2 arah), listening (text-to-speech), ketik
  terjemahan (toleran typo), susun huruf (scramble), susun kalimat, mencocokkan pasangan
- **Soal salah diulang** otomatis di akhir sesi
- Konten: kosakata + kalimat dengan romaji untuk bahasa Jepang

### Game & Latihan
- 🃏 **Kartu Kilat** — flashcard bolak-balik dengan TTS
- 🧩 **Memory Match** — cari pasangan kata & arti
- ⏱️ **Tantangan Waktu** — jawab sebanyak mungkin dalam 60 detik
- 💪 **Latihan Bebas** — soal campuran dari kata yang dipelajari, memulihkan 1 nyawa

### Gamifikasi
- ⚡ XP, level, target harian yang bisa diatur
- 🔥 Streak harian + pembeku streak
- ❤️ Nyawa (regenerasi 1 per 30 menit)
- 💎 Permata + toko (isi nyawa, pembeku streak, XP ganda 15 menit)
- 🏅 12 pencapaian
- 🥇 Peringkat mingguan lokal

### Navigasi
Tiga ruang belajar di rak navigasi bawah:
- 📚 **Belajar** — jalur belajar (learning path)
- ✏️ **Latihan** — ruang latihan & mini-game
- 🎓 **Kampus** — hub berisi akun Google, level & statistik, lalu
  pintu ke Papan Juara (peringkat), Koperasi Sekolah (toko),
  Pencapaian, dan Pengaturan

### Lainnya
- 🔐 **Login dengan Google** (opsional — mode tamu tetap bisa dipakai);
  nama & foto tampil di Kampus dan Papan Juara
- ☀️🌙 Tema dua pilihan: **Buku Catatan** (terang) atau **Papan Tulis** (gelap)
- 🌐 UI dwibahasa (Indonesia/Inggris)
- 💾 Progres tersimpan lokal (shared_preferences)
- 🔊 Pengucapan via flutter_tts + haptic feedback

## Setup Login Google via Firebase (wajib sekali agar tombol login berfungsi)

Login memakai **Firebase Authentication**: web lewat popup
(`signInWithPopup`), Android/iOS lewat `google_sign_in` yang tokennya
ditukar ke Firebase. Selama [lib/firebase_options.dart](lib/firebase_options.dart)
masih placeholder, tombol login menampilkan panduan setup dan aplikasi
tetap jalan sebagai tamu.

**Langkah setup (±10 menit, gratis):**

1. Buka [Firebase Console](https://console.firebase.google.com/) →
   *Add project* → **pilih project Google Cloud yang sudah ada** (mis.
   yang sudah berisi OAuth client-mu, agar tetap berlaku) atau buat baru.
2. Di Firebase Console: *Authentication* → *Sign-in method* → aktifkan
   **Google** → pilih support email → *Save*. (Langkah ini otomatis
   membereskan consent screen & web client.)
3. Di terminal proyek:

   ```bash
   dart pub global activate flutterfire_cli
   firebase login
   flutterfire configure
   ```

   Pilih project & platform (android, web) — perintah ini **menimpa
   `lib/firebase_options.dart` otomatis** dengan nilai asli.
4. **Android**: Firebase Console → *Project settings* → aplikasi Android
   → *Add fingerprint* → tempel SHA-1 debug (dari
   `cd android && ./gradlew signingReport`, variant debug). Lalu isi
   `googleWebClientId` di
   [lib/config/auth_config.dart](lib/config/auth_config.dart) dengan
   Web client ID (lihat *Authentication → Google → Web SDK
   configuration*) — dibutuhkan `google_sign_in` sebagai
   `serverClientId`.
5. **Web**: cukup langkah 1–3. Jalankan `flutter run -d chrome` —
   `localhost` sudah diizinkan Firebase secara default.
6. **iOS**: `flutterfire configure` sudah mendaftarkan appnya; isi juga
   `googleIosClientId` di auth_config.dart dan reversed client id di
   `ios/Runner/Info.plist`.

## Struktur Proyek

```
assets/content/          # Konten kursus (JSON) — mudah ditambah/edit
  en.json  ja.json  id.json
lib/
  models/                # Course, Lesson, Exercise, Achievement
  services/              # Pemuat konten, generator soal, penilai jawaban, TTS
  providers/             # State: progres (XP/nyawa/streak/dll) & pengaturan
  screens/               # Onboarding, path belajar, pelajaran, game, toko, profil
  widgets/               # Tombol 3D, kartu pilihan, widget per tipe soal
  l10n/                  # Teks UI Indonesia & Inggris
```

## Menambah Konten

Edit file JSON di `assets/content/`. Struktur per kursus:
unit → pelajaran → `words` (kata + arti per bahasa UI + emoji, opsional `romaji`)
dan `sentences` (kalimat + `tokens` untuk soal susun kalimat). Soal dibuat
otomatis dari konten oleh `ExerciseGenerator` — tidak perlu menulis soal manual.
