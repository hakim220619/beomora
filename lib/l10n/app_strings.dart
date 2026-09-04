import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/settings_provider.dart';

/// Sistem i18n sederhana untuk teks antarmuka.
/// Bahasa UI: 'id' (default) dan 'en'.
class L {
  final String code;
  const L(this.code);

  String t(String key) =>
      _strings[code]?[key] ?? _strings['id']![key] ?? key;

  /// Ambil L sesuai bahasa UI aktif (rebuild saat bahasa diganti).
  /// Hanya boleh dipanggil dari dalam build().
  static L of(BuildContext context) =>
      L(context.watch<SettingsProvider>().uiLang);

  /// Versi untuk callback (onTap, dialog, dsb.) — tanpa listen.
  static L read(BuildContext context) =>
      L(context.read<SettingsProvider>().uiLang);

  static const Map<String, Map<String, String>> _strings = {
    'id': {
      // Navigasi
      'nav_learn': 'Belajar',
      'nav_materials': 'Materi',
      'nav_practice': 'Latihan',
      'nav_cabin': 'Kampus',
      // Materi
      'materials_title': 'Materi Belajar',
      'materials_sub': 'referensi lengkap untuk kursus ini',
      'materials_vocab_title': 'Kosakata',
      'materials_vocab_sub':
          'kosakata tematik: pertanian, kelautan, kantoran, dll.',
      'tap_kana_hint': 'Ketuk huruf untuk mendengar pengucapannya',
      // Onboarding
      'onb_welcome_title': 'Selamat datang di Beomora!',
      'onb_welcome_sub':
          'Naik kelas demi kelas, kuasai bahasa baru! 🎓',
      'onb_ui_lang': 'Pilih bahasa aplikasi',
      'onb_pick_course': 'Mau belajar bahasa apa?',
      'onb_daily_goal': 'Tentukan target harianmu',
      'onb_streak_goal': 'Pilih tantangan streak-mu 🔥',
      'onb_streak_goal_sub':
          'Berapa hari kamu mau belajar? Tenang, bolos sehari tidak '
          'menghanguskan hitungan tantanganmu.',
      'streak_days_label': 'hari',
      'streak_goal_setting': 'Tantangan streak',
      'miss_notice_title': 'Kamu sempat bolos 😴',
      'miss_notice_msg':
          'Tenang, tantangan streak-mu tidak hangus. Progresmu tetap '
          '{done}/{goal} hari — lanjutkan belajar hari ini! 🔥',
      'streak_goal_done_title': 'Tantangan {goal} hari selesai! 🏆',
      'streak_goal_done_msg':
          'Luar biasa, kamu sudah belajar {goal} hari! Hadiah +{gems} 🪙. '
          'Pilih tantangan berikutnya di Pengaturan.',
      'goal_casual': 'Santai',
      'goal_regular': 'Rutin',
      'goal_serious': 'Serius',
      'goal_intense': 'Intensif',
      'xp_per_day': 'XP / hari',
      'continue_btn': 'LANJUT',
      'start_btn': 'MULAI BELAJAR',
      // Umum
      'xp': 'XP',
      'gems': 'Koin',
      'hearts': 'Nyawa',
      'level': 'Level',
      'cancel': 'Batal',
      'ok': 'OK',
      'day_streak': 'hari beruntun',
      'locked': 'Selesaikan pelajaran sebelumnya dulu!',
      'start_lesson': 'MULAI',
      'review_lesson': 'ULANGI +5 XP',
      'lesson': 'Pelajaran',
      // Lesson
      'check_btn': 'PERIKSA',
      'correct': 'Benar sekali! 🎉',
      'almost': 'Hampir benar! Perhatikan ejaannya.',
      'wrong': 'Salah 😔',
      'correct_answer': 'Jawaban benar:',
      'choose_meaning': 'Pilih arti yang benar',
      'choose_word': 'Pilih kata yang benar',
      'listen_choose': 'Ketuk yang kamu dengar',
      'type_translation': 'Ketik terjemahannya',
      'type_hint': 'Ketik jawabanmu di sini...',
      'build_sentence': 'Susun kalimatnya',
      'unscramble': 'Susun huruf jadi kata yang berarti:',
      'match_pairs': 'Cocokkan pasangannya',
      'new_word': 'KATA BARU',
      'quit_title': 'Yakin mau keluar?',
      'quit_msg': 'Progres pelajaran ini akan hilang.',
      'quit': 'KELUAR',
      'stay': 'LANJUT BELAJAR',
      'no_hearts_title': 'Nyawa habis! 💔',
      'no_hearts_msg':
          'Tunggu nyawa terisi kembali, beli di toko, atau pulihkan lewat latihan.',
      'lesson_failed': 'Nyawa habis, pelajaran gagal.',
      'try_again': 'COBA LAGI',
      'lesson_complete': 'Pelajaran selesai!',
      'perfect': 'SEMPURNA! Tanpa kesalahan!',
      'great_job': 'Kerja bagus!',
      'accuracy_label': 'Akurasi',
      // Practice
      'practice_title': 'Ruang Latihan',
      'flashcards': 'Kartu Kilat',
      'flashcards_desc': 'Hafalkan kosakata dengan kartu bolak-balik',
      'memory_game': 'Memory Match',
      'memory_desc': 'Temukan pasangan kata & artinya',
      'letter_quiz': 'Tebak Huruf',
      'letter_quiz_desc':
          'Bank soal huruf: tebak bunyi & lambangnya',
      'quiz_pick': 'Pilih paket soal',
      'quiz_prompt_reading': 'Bagaimana bunyinya?',
      'quiz_prompt_symbol': 'Yang mana hurufnya?',
      'quiz_result_title': 'Latihan selesai!',
      'quiz_correct_label': 'Benar',
      'quiz_wrong_label': 'Salah',
      'quiz_review': 'Perlu diulang — ketuk untuk dengar bunyinya',
      'quiz_perfect': 'Semua benar — sempurna! 💯',
      'quiz_verdict_great': 'Luar biasa! Kamu hafal banget! 🌟',
      'quiz_verdict_good': 'Bagus! Sedikit lagi sempurna 💪',
      'quiz_verdict_ok': 'Lumayan! Terus berlatih ya 📚',
      'quiz_verdict_retry': 'Jangan menyerah — coba lagi yuk! 🐣',
      'quiz_done': 'SELESAI',
      'practice_btn': 'Latihan',
      'letters': 'huruf',
      'quiz_prompt_past': 'Apa bentuk lampaunya?',
      'quiz_prompt_base': 'Apa bentuk dasarnya?',
      // Soal Pilihan Ganda
      'mcq_title': 'Soal Pilihan Ganda',
      'mcq_desc': 'Kosakata & tata bahasa — pilih jawaban yang tepat',
      'mcq_how_many': 'Mau latihan berapa soal?',
      'mcq_available': 'soal tersedia',
      'mcq_pick_pack': 'Pilih paket soal',
      'mcq_free_limit': 'Versi gratis maksimal',
      'mcq_unlock_all': 'Buka semua soal dengan Premium',
      'mcq_count_hint': 'Jumlah soal',
      'mcq_count_error': 'Masukkan angka',
      'mcq_all': 'Semua',
      // Premium & monetisasi
      'premium_title': 'Beomora Premium',
      'premium_sub':
          'Belajar tanpa batas & dukung Beomora terus berkembang 💚',
      'premium_banner_sub': 'Hati ∞ · XP 2× · bebas iklan',
      'premium_b_hearts': 'Hati tak terbatas — belajar tanpa takut salah',
      'premium_b_streak': 'Pelindung streak otomatis setiap hari',
      'premium_b_xp': 'XP dobel permanen (2×)',
      'premium_b_noads': 'Bebas iklan selamanya',
      'premium_b_badge': 'Lencana 👑 di Papan Juara',
      'premium_b_packs':
          'Paket soal eksklusif: Kanji N5 & Kata Kerja Tak Beraturan',
      'premium_monthly': 'Bulanan',
      'premium_yearly': 'Tahunan',
      'premium_lifetime': 'Seumur Hidup',
      'premium_best': 'PALING HEMAT',
      'premium_active': 'Premium aktif 👑',
      'premium_thanks':
          'Terima kasih sudah mendukung Beomora! Selamat belajar tanpa batas 💚',
      'premium_locked': 'Khusus Premium 🔒',
      'premium_cta': 'Coba Premium 👑',
      'restore_purchases': 'Pulihkan pembelian',
      'store_unavailable':
          'Pembelian belum tersedia — produk belum dikonfigurasi di Play Console atau toko tidak terjangkau.',
      'watch_ad_heart': 'TONTON IKLAN +1 ❤️',
      'ad_reward_heart': '+1 hati! ❤️',
      'ad_not_ready': 'Iklan belum siap, coba lagi sebentar ya.',
      'free_heart_ad': 'Hati Gratis',
      'free_heart_ad_desc': 'Tonton iklan singkat untuk +1 hati',
      'free_label': '📺 GRATIS',
      'gems_pack_small': '1.000 Koin',
      'gems_pack_large': '5.000 Koin',
      'topup_desc': 'Top-up koin (pembelian uang asli)',
      'topup_label': 'TOP-UP',
      'time_challenge': 'Tantangan Waktu',
      'time_desc': 'Jawab sebanyak mungkin dalam 60 detik!',
      'free_practice': 'Latihan Bebas',
      'free_practice_desc': 'Latihan campuran, pulihkan 1 nyawa ❤️',
      'need_lessons': 'Selesaikan minimal 1 pelajaran dulu ya!',
      'score': 'Skor',
      'best': 'Terbaik',
      'time_up': 'Waktu habis!',
      'pairs_found': 'Semua pasangan ditemukan!',
      'play_again': 'MAIN LAGI',
      'tap_to_flip': 'Ketuk kartu untuk membalik',
      'moves': 'Langkah',
      // Leaderboard
      'leaderboard_title': 'Papan Juara',
      'weekly_xp': 'XP minggu ini',
      'you': '(Kamu)',
      'leaderboard_info':
          'Kumpulkan XP dan raih puncak papan juara kelas! 🏆',
      'leaderboard_alone':
          'Belum ada pelajar lain minggu ini — ajak temanmu belajar! 🎒',
      // Kalender Belajar
      'calendar_title': 'Kalender Belajar',
      'streak_now': 'Streak sekarang',
      'active_days_month': 'Hari aktif bulan ini',
      'cal_legend_goal': 'Target harian tercapai',
      'cal_legend_active': 'Belajar',
      'month_names':
          'Januari,Februari,Maret,April,Mei,Juni,Juli,Agustus,September,Oktober,November,Desember',
      'weekday_short': 'Sen,Sel,Rab,Kam,Jum,Sab,Min',
      // Shop
      'shop_title': 'Koperasi Sekolah',
      'buy': 'BELI',
      'not_enough_gems': 'Koin tidak cukup! Selesaikan pelajaran dulu.',
      'refill_hearts': 'Isi Ulang Nyawa',
      'refill_hearts_desc': 'Pulihkan semua nyawa jadi 5 ❤️',
      'streak_freeze': 'Pembeku Streak',
      'streak_freeze_desc': 'Streak aman walau bolos 1 hari 🧊',
      'double_xp': 'XP Ganda',
      'double_xp_desc': 'XP x2 selama 15 menit ⚡',
      'hearts_full': 'Nyawamu sudah penuh!',
      'boost_active': 'Boost masih aktif!',
      'purchased': 'Berhasil dibeli! 🎉',
      'owned_count': 'Dimiliki',
      // Kabin Kapten
      'cabin_title': 'Kampusku',
      'guest': 'Murid Tamu',
      'guest_hint':
          'Masuk dengan Google agar progresmu tersimpan dan namamu tampil di Papan Juara',
      'login_title': 'Masuk dulu, yuk!',
      'login_gate_sub':
          'Masuk dengan akun Google (Gmail) kamu untuk mulai belajar dan menyimpan progresmu.',
      'sign_in_google': 'MASUK DENGAN GOOGLE',
      'sign_in_email': 'MASUK DENGAN EMAIL',
      'or': 'atau',
      'email_label': 'Email',
      'password_label': 'Sandi',
      'email_login_title': 'Masuk dengan Email',
      'email_signup_title': 'Daftar dengan Email',
      'email_login_btn': 'MASUK',
      'email_signup_btn': 'DAFTAR',
      'no_account_yet': 'Belum punya akun? Daftar',
      'have_account': 'Sudah punya akun? Masuk',
      'forgot_password': 'Lupa sandi?',
      'reset_sent': 'Email reset sandi terkirim. Cek kotak masukmu.',
      'email_fill_all': 'Isi email dan sandi dulu.',
      'email_login_invalid': 'Email atau sandi salah.',
      'email_in_use': 'Email ini sudah terdaftar. Coba masuk.',
      'email_invalid': 'Format email tidak valid.',
      'email_not_found': 'Email ini belum terdaftar.',
      'password_weak': 'Sandi minimal 6 karakter.',
      'register_phone_label': 'No. telepon',
      'register_phone_empty': 'Isi nomor teleponmu dulu.',
      'phone_invalid': 'Nomor telepon tidak valid (9-15 digit).',
      'too_many_requests':
          'Terlalu banyak percobaan. Coba lagi beberapa saat lagi.',
      'provider_disabled':
          'Login Google belum diaktifkan di Firebase Console: Authentication → Sign-in method → Google → Enable.',
      'rules_not_published':
          'Akses Firestore ditolak. Publish aturan keamanan dulu: Firebase Console → Firestore Database → Rules → tempel isi file firestore.rules → Publish.',
      'sign_out': 'Keluar akun',
      'logout_title': 'Keluar akun?',
      'logout_msg':
          'Progres belajarmu di perangkat ini tetap tersimpan. Kamu bisa masuk lagi kapan saja.',
      'logout_confirm': 'KELUAR',
      'login_failed':
          'Login Google gagal. Periksa koneksi atau konfigurasi Firebase.',
      'login_unsupported':
          'Login belum tersedia di platform ini.',
      'login_not_configured':
          'Firebase belum dikonfigurasi. Ketuk tombolnya untuk melihat panduan.',
      'login_setup_title': 'Login Google perlu disiapkan ⚙️',
      'login_setup_steps':
          'Login Google memakai Firebase Authentication (gratis, sekali setup):\n\n'
          '1. Buka console.firebase.google.com → pilih/buat project.\n\n'
          '2. Authentication → Sign-in method → aktifkan "Google" → Save.\n\n'
          '3. Isi lib/firebase_options.dart (via `flutterfire configure` atau nilai dari google-services.json).\n\n'
          '4. Project settings → aplikasi Android → Add fingerprint → tempel SHA-1 debug kamu (wajib untuk Google Sign-In di Android).\n\n'
          '5. Firestore Database → Create database (untuk menyimpan profil).\n\n'
          'Setelah itu jalankan ulang aplikasi.',
      'signed_out_msg': 'Berhasil keluar. Sampai jumpa di kelas! 👋',
      // Pendaftaran akun (lewat Google, profil di Firestore)
      'register_title': 'Daftar Akun Beomora',
      'register_sub':
          'Akun Google kamu belum terdaftar di Beomora. Lengkapi data di bawah dulu, ya!',
      'register_name_label': 'Nama tampilan',
      'register_name_empty': 'Nama tidak boleh kosong',
      'register_btn': 'DAFTAR',
      'register_success':
          'Pendaftaran berhasil — datamu tersimpan aman di server! 🎉',
      'register_failed':
          'Pendaftaran gagal — data BELUM tersimpan. Periksa koneksi lalu coba lagi.',
      'register_canceled':
          'Pendaftaran dibatalkan — kamu dikeluarkan dari akun.',
      'stats': 'Statistik',
      'total_xp': 'Total XP',
      'words_learned': 'Kata dikuasai',
      'longest_streak': 'Streak terpanjang',
      'lessons_done': 'Pelajaran selesai',
      'achievements': 'Pencapaian',
      'see_all': 'Lihat semua',
      'learner': 'Pelajar Teladan',
      // Materi server (khusus admin)
      'content_upload': 'Perbarui materi di server',
      'content_upload_sub':
          'Unggah materi bawaan aplikasi ini ke Firestore — semua perangkat akan tersinkron otomatis',
      'content_upload_success':
          'Materi terunggah & terverifikasi di server! 🎉',
      'content_upload_failed': 'Gagal mengunggah materi.',
      'admin_premium_all': 'Premium untuk semua pengguna',
      'save': 'SIMPAN',
      'update_ready':
          'Versi baru sudah terunduh. Mulai ulang untuk menerapkan?',
      'update_restart': 'MULAI ULANG',
      'admin_heart_regen': 'Regenerasi nyawa',
      'admin_heart_regen_label': 'Menit per 1 nyawa (1-1440)',
      'admin_heart_regen_sub':
          'Berlaku untuk semua pengguna. Saat ini: {n} menit per nyawa',
      'admin_heart_regen_saved':
          'Regenerasi nyawa diubah jadi {n} menit per nyawa.',
      'admin_heart_regen_failed': 'Gagal menyimpan regenerasi nyawa.',
      'admin_heart_regen_invalid': 'Isi angka antara 1 sampai 1440.',
      'admin_premium_all_sub':
          'Selama menyala, semua akun diperlakukan premium — berlaku '
              'saat aplikasi pengguna dibuka ulang',
      'admin_premium_all_on': 'Premium untuk semua: AKTIF 👑',
      'admin_premium_all_off': 'Premium untuk semua: nonaktif',
      'admin_premium_all_failed': 'Gagal menyimpan pengaturan.',
      'admin_grant': 'Hadiahkan premium',
      'admin_grant_sub':
          'Beri/cabut premium untuk pengguna tertentu lewat email',
      'admin_grant_email': 'Email pengguna',
      'admin_grant_duration': 'Durasi',
      'admin_grant_revoke': 'Cabut',
      'admin_grant_apply': 'TERAPKAN',
      'admin_grant_success': 'Premium dihadiahkan ke',
      'admin_grant_revoked': 'Hadiah premium dicabut dari',
      'admin_grant_notfound':
          'Pengguna dengan email itu tidak ditemukan — dia harus '
              'pernah login ke Beomora dulu.',
      'days_unit': 'hari',
      // Settings
      'settings_title': 'Pengaturan',
      'ui_language': 'Bahasa aplikasi',
      'theme': 'Tema belajar',
      'theme_light': 'Buku Catatan',
      'theme_dark': 'Papan Tulis',
      'sound_effects': 'Suara & getar',
      'daily_goal_setting': 'Target harian',
      'show_icons': 'Tampilkan gambar kosakata',
      'show_icons_sub': 'Emoji kata pada soal & flashcards',
      'reminder_setting': 'Pengingat belajar',
      'reminder_sub': 'Notifikasi harian agar streak tetap menyala',
      'reminder_time': 'Jam pengingat',
      'reminder_channel_name': 'Pengingat belajar harian',
      'reminder_channel_desc':
          'Mengingatkanmu belajar agar streak tetap menyala',
      'reminder_title': 'Waktunya belajar! 🦉',
      'reminder_body_streak':
          'Jaga streak {n} harimu tetap menyala — 5 menit saja cukup 🔥',
      'reminder_body': 'Luangkan 5 menit untuk belajar hari ini 📚',
      'reset_progress': 'Hapus semua progres',
      'reset_title': 'Hapus progres?',
      'reset_msg': 'Semua XP, streak, dan progres akan hilang permanen.',
      'delete': 'HAPUS',
      'about': 'Beomora v1.0 — dibuat dengan Flutter 💙',
      // Course select
      'course_select_title': 'Pilih Kursus',
      'daily_goal_reached': 'Target harian tercapai! 🎉',
      'claim': 'Klaim',
      'gems_added': 'Koin masuk ke sakumu!',
      'bonus_goal_hint': 'Target bonus 🎁 raih {xp} XP untuk +{gems} 🪙',
      'bonus_goal_reached': 'Target bonus tercapai! 🎁',
      'daily_all_done': 'Semua target hari ini beres! Sampai besok 🌙',
      // Achievements
      'ach_first_lesson': 'Langkah Pertama',
      'ach_first_lesson_desc': 'Selesaikan pelajaran pertamamu',
      'ach_lessons_10': 'Rajin Belajar',
      'ach_lessons_10_desc': 'Selesaikan 10 pelajaran',
      'ach_lessons_30': 'Kutu Buku',
      'ach_lessons_30_desc': 'Selesaikan 30 pelajaran',
      'ach_streak_3': 'Mulai Membara',
      'ach_streak_3_desc': 'Capai streak 3 hari',
      'ach_streak_7': 'Seminggu Penuh',
      'ach_streak_7_desc': 'Capai streak 7 hari',
      'ach_streak_30': 'Tak Terhentikan',
      'ach_streak_30_desc': 'Capai streak 30 hari',
      'ach_xp_500': 'Bintang Muda',
      'ach_xp_500_desc': 'Kumpulkan 500 XP',
      'ach_xp_2000': 'Bintang Super',
      'ach_xp_2000_desc': 'Kumpulkan 2000 XP',
      'ach_words_50': 'Mulai Lancar',
      'ach_words_50_desc': 'Kuasai 50 kata',
      'ach_words_150': 'Kamus Berjalan',
      'ach_words_150_desc': 'Kuasai 150 kata',
      'ach_perfect_lesson': 'Nilai Sempurna',
      'ach_perfect_lesson_desc': 'Selesaikan pelajaran tanpa kesalahan',
      'ach_polyglot': 'Poliglot',
      'ach_polyglot_desc': 'Coba ketiga kursus bahasa',
      'ach_unlocked': 'Pencapaian terbuka!',
      'heart_restored': '+1 nyawa dipulihkan! ❤️',
    },
    'en': {
      // Navigation
      'nav_learn': 'Learn',
      'nav_materials': 'Guides',
      'nav_practice': 'Practice',
      'nav_cabin': 'Campus',
      // Study guides
      'materials_title': 'Study Guides',
      'materials_sub': 'complete reference for this course',
      'materials_vocab_title': 'Vocabulary',
      'materials_vocab_sub':
          'themed vocabulary: farming, maritime, office, etc.',
      'tap_kana_hint': 'Tap a character to hear how it sounds',
      // Onboarding
      'onb_welcome_title': 'Welcome to Beomora!',
      'onb_welcome_sub':
          'Level up class by class and master new languages! 🎓',
      'onb_ui_lang': 'Choose app language',
      'onb_pick_course': 'What do you want to learn?',
      'onb_daily_goal': 'Set your daily goal',
      'onb_streak_goal': 'Pick your streak challenge 🔥',
      'onb_streak_goal_sub':
          'How many days do you want to learn? Missing a day never '
          'wipes out your challenge progress.',
      'streak_days_label': 'days',
      'streak_goal_setting': 'Streak challenge',
      'miss_notice_title': 'You missed a day 😴',
      'miss_notice_msg':
          "Don't worry, your streak challenge isn't lost. You're still "
          'at {done}/{goal} days — keep learning today! 🔥',
      'streak_goal_done_title': '{goal}-day challenge complete! 🏆',
      'streak_goal_done_msg':
          "Amazing, you've studied for {goal} days! Reward: +{gems} 🪙. "
          'Pick your next challenge in Settings.',
      'goal_casual': 'Casual',
      'goal_regular': 'Regular',
      'goal_serious': 'Serious',
      'goal_intense': 'Intense',
      'xp_per_day': 'XP / day',
      'continue_btn': 'CONTINUE',
      'start_btn': 'START LEARNING',
      // Common
      'xp': 'XP',
      'gems': 'Coins',
      'hearts': 'Hearts',
      'level': 'Level',
      'cancel': 'Cancel',
      'ok': 'OK',
      'day_streak': 'day streak',
      'locked': 'Finish the previous lesson first!',
      'start_lesson': 'START',
      'review_lesson': 'REVIEW +5 XP',
      'lesson': 'Lesson',
      // Lesson
      'check_btn': 'CHECK',
      'correct': 'Correct! 🎉',
      'almost': 'Almost! Watch the spelling.',
      'wrong': 'Incorrect 😔',
      'correct_answer': 'Correct answer:',
      'choose_meaning': 'Choose the correct meaning',
      'choose_word': 'Choose the correct word',
      'listen_choose': 'Tap what you hear',
      'type_translation': 'Type the translation',
      'type_hint': 'Type your answer here...',
      'build_sentence': 'Build the sentence',
      'unscramble': 'Unscramble the word meaning:',
      'match_pairs': 'Match the pairs',
      'new_word': 'NEW WORD',
      'quit_title': 'Quit the lesson?',
      'quit_msg': 'Your progress in this lesson will be lost.',
      'quit': 'QUIT',
      'stay': 'KEEP LEARNING',
      'no_hearts_title': 'Out of hearts! 💔',
      'no_hearts_msg':
          'Wait for hearts to refill, buy them in the shop, or restore one by practicing.',
      'lesson_failed': 'Out of hearts — lesson failed.',
      'try_again': 'TRY AGAIN',
      'lesson_complete': 'Lesson complete!',
      'perfect': 'PERFECT! No mistakes!',
      'great_job': 'Great job!',
      'accuracy_label': 'Accuracy',
      // Practice
      'practice_title': 'Practice Room',
      'flashcards': 'Flashcards',
      'flashcards_desc': 'Memorize vocabulary with flip cards',
      'memory_game': 'Memory Match',
      'memory_desc': 'Find matching word & meaning pairs',
      'letter_quiz': 'Letter Quiz',
      'letter_quiz_desc':
          'Letter bank: guess the sounds & symbols',
      'quiz_pick': 'Pick a question set',
      'quiz_prompt_reading': 'How does it sound?',
      'quiz_prompt_symbol': 'Which letter is it?',
      'quiz_result_title': 'Practice complete!',
      'quiz_correct_label': 'Correct',
      'quiz_wrong_label': 'Wrong',
      'quiz_review': 'Worth reviewing — tap to hear the sound',
      'quiz_perfect': 'All correct — perfect! 💯',
      'quiz_verdict_great': 'Outstanding! You really know these! 🌟',
      'quiz_verdict_good': 'Nice! Almost perfect 💪',
      'quiz_verdict_ok': 'Not bad! Keep practicing 📚',
      'quiz_verdict_retry': "Don't give up — try again! 🐣",
      'quiz_done': 'DONE',
      'practice_btn': 'Practice',
      'letters': 'letters',
      'quiz_prompt_past': 'What is the past form?',
      'quiz_prompt_base': 'What is the base form?',
      // Multiple Choice
      'mcq_title': 'Multiple Choice',
      'mcq_desc': 'Vocabulary & grammar — pick the right answer',
      'mcq_how_many': 'How many questions do you want?',
      'mcq_available': 'questions available',
      'mcq_pick_pack': 'Choose a question pack',
      'mcq_free_limit': 'Free version max',
      'mcq_unlock_all': 'Unlock all questions with Premium',
      'mcq_count_hint': 'Number of questions',
      'mcq_count_error': 'Enter a number',
      'mcq_all': 'All',
      // Premium & monetization
      'premium_title': 'Beomora Premium',
      'premium_sub':
          'Learn without limits & help Beomora keep growing 💚',
      'premium_banner_sub': '∞ hearts · 2× XP · ad-free',
      'premium_b_hearts': 'Unlimited hearts — learn without fear',
      'premium_b_streak': 'Automatic streak protection every day',
      'premium_b_xp': 'Permanent double XP (2×)',
      'premium_b_noads': 'Ad-free forever',
      'premium_b_badge': '👑 badge on the Class Champions board',
      'premium_b_packs':
          'Exclusive question packs: N5 Kanji & Irregular Verbs',
      'premium_monthly': 'Monthly',
      'premium_yearly': 'Yearly',
      'premium_lifetime': 'Lifetime',
      'premium_best': 'BEST VALUE',
      'premium_active': 'Premium active 👑',
      'premium_thanks':
          'Thank you for supporting Beomora! Enjoy limitless learning 💚',
      'premium_locked': 'Premium only 🔒',
      'premium_cta': 'Try Premium 👑',
      'restore_purchases': 'Restore purchases',
      'store_unavailable':
          'Purchases are not available yet — products are not configured in Play Console or the store is unreachable.',
      'watch_ad_heart': 'WATCH AD +1 ❤️',
      'ad_reward_heart': '+1 heart! ❤️',
      'ad_not_ready': 'Ad not ready yet, try again shortly.',
      'free_heart_ad': 'Free Heart',
      'free_heart_ad_desc': 'Watch a short ad for +1 heart',
      'free_label': '📺 FREE',
      'gems_pack_small': '1,000 Coins',
      'gems_pack_large': '5,000 Coins',
      'topup_desc': 'Gem top-up (real money purchase)',
      'topup_label': 'TOP-UP',
      'time_challenge': 'Time Challenge',
      'time_desc': 'Answer as many as you can in 60 seconds!',
      'free_practice': 'Free Practice',
      'free_practice_desc': 'Mixed practice, restores 1 heart ❤️',
      'need_lessons': 'Complete at least 1 lesson first!',
      'score': 'Score',
      'best': 'Best',
      'time_up': "Time's up!",
      'pairs_found': 'All pairs found!',
      'play_again': 'PLAY AGAIN',
      'tap_to_flip': 'Tap the card to flip',
      'moves': 'Moves',
      // Leaderboard
      'leaderboard_title': 'Class Champions',
      'weekly_xp': 'XP this week',
      'you': '(You)',
      'leaderboard_info': 'Earn XP and climb to the top of the class! 🏆',
      'leaderboard_alone':
          'No other students this week yet — invite your friends! 🎒',
      // Study Calendar
      'calendar_title': 'Study Calendar',
      'streak_now': 'Current streak',
      'active_days_month': 'Active days this month',
      'cal_legend_goal': 'Daily goal met',
      'cal_legend_active': 'Studied',
      'month_names':
          'January,February,March,April,May,June,July,August,September,October,November,December',
      'weekday_short': 'Mon,Tue,Wed,Thu,Fri,Sat,Sun',
      // Shop
      'shop_title': 'School Store',
      'buy': 'BUY',
      'not_enough_gems': 'Not enough coins! Complete lessons to earn more.',
      'refill_hearts': 'Refill Hearts',
      'refill_hearts_desc': 'Restore all hearts to 5 ❤️',
      'streak_freeze': 'Streak Freeze',
      'streak_freeze_desc': 'Keep your streak if you miss a day 🧊',
      'double_xp': 'Double XP',
      'double_xp_desc': '2x XP for 15 minutes ⚡',
      'hearts_full': 'Your hearts are already full!',
      'boost_active': 'Boost is still active!',
      'purchased': 'Purchased! 🎉',
      'owned_count': 'Owned',
      // Captain's Cabin
      'cabin_title': 'My Campus',
      'guest': 'Guest Student',
      'guest_hint':
          'Sign in with Google to keep your progress and show your name on the Class Champions board',
      'login_title': 'Sign in first!',
      'login_gate_sub':
          'Sign in with your Google (Gmail) account to start learning and keep your progress.',
      'sign_in_google': 'SIGN IN WITH GOOGLE',
      'sign_in_email': 'SIGN IN WITH EMAIL',
      'or': 'or',
      'email_label': 'Email',
      'password_label': 'Password',
      'email_login_title': 'Sign in with Email',
      'email_signup_title': 'Sign up with Email',
      'email_login_btn': 'SIGN IN',
      'email_signup_btn': 'SIGN UP',
      'no_account_yet': "Don't have an account? Sign up",
      'have_account': 'Already have an account? Sign in',
      'forgot_password': 'Forgot password?',
      'reset_sent': 'Password reset email sent. Check your inbox.',
      'email_fill_all': 'Fill in email and password first.',
      'email_login_invalid': 'Wrong email or password.',
      'email_in_use':
          'This email is already registered. Try signing in.',
      'email_invalid': 'Invalid email format.',
      'email_not_found': 'This email is not registered yet.',
      'password_weak': 'Password must be at least 6 characters.',
      'register_phone_label': 'Phone number',
      'register_phone_empty': 'Enter your phone number first.',
      'phone_invalid': 'Invalid phone number (9-15 digits).',
      'too_many_requests': 'Too many attempts. Try again later.',
      'provider_disabled':
          'Google sign-in is not enabled yet in the Firebase Console: Authentication → Sign-in method → Google → Enable.',
      'rules_not_published':
          'Firestore access denied. Publish the security rules first: Firebase Console → Firestore Database → Rules → paste the contents of firestore.rules → Publish.',
      'sign_out': 'Sign out',
      'logout_title': 'Sign out?',
      'logout_msg':
          'Your learning progress stays saved on this device. You can sign back in anytime.',
      'logout_confirm': 'SIGN OUT',
      'login_failed':
          'Google sign-in failed. Check your connection or Firebase setup.',
      'login_unsupported':
          'Sign-in is not available on this platform yet.',
      'login_not_configured':
          'Firebase is not configured yet. Tap the button for setup steps.',
      'login_setup_title': 'Google sign-in needs setup ⚙️',
      'login_setup_steps':
          'Google sign-in uses Firebase Authentication (free, one-time setup):\n\n'
          '1. Open console.firebase.google.com → pick/create a project.\n\n'
          '2. Authentication → Sign-in method → enable "Google" → Save.\n\n'
          '3. Fill lib/firebase_options.dart (via `flutterfire configure` or values from google-services.json).\n\n'
          '4. Project settings → Android app → Add fingerprint → paste your debug SHA-1 (required for Google Sign-In on Android).\n\n'
          '5. Firestore Database → Create database (to store profiles).\n\n'
          'Then restart the app.',
      'signed_out_msg': 'Signed out. See you in class! 👋',
      // Account registration (via Google, Firestore profile)
      'register_title': 'Create Beomora Account',
      'register_sub':
          "Your Google account isn't registered in Beomora yet. Complete your details first!",
      'register_name_label': 'Display name',
      'register_name_empty': 'Name cannot be empty',
      'register_btn': 'REGISTER',
      'register_success':
          'Registration complete — your data is safely stored on the server! 🎉',
      'register_failed':
          'Registration failed — your data was NOT saved. Check your connection and try again.',
      'register_canceled': 'Registration canceled — you were signed out.',
      'stats': 'Statistics',
      'total_xp': 'Total XP',
      'words_learned': 'Words mastered',
      'longest_streak': 'Longest streak',
      'lessons_done': 'Lessons done',
      'achievements': 'Achievements',
      'see_all': 'See all',
      'learner': 'Star Student',
      // Server content (admin only)
      'content_upload': 'Update server content',
      'content_upload_sub':
          "Upload this app's bundled content to Firestore — every device syncs automatically",
      'content_upload_success':
          'Content uploaded & verified on the server! 🎉',
      'content_upload_failed': 'Failed to upload content.',
      'admin_premium_all': 'Premium for all users',
      'save': 'SAVE',
      'update_ready':
          'A new version has been downloaded. Restart to apply?',
      'update_restart': 'RESTART',
      'admin_heart_regen': 'Heart regeneration',
      'admin_heart_regen_label': 'Minutes per heart (1-1440)',
      'admin_heart_regen_sub':
          'Applies to all users. Currently: {n} minutes per heart',
      'admin_heart_regen_saved':
          'Heart regen set to {n} minutes per heart.',
      'admin_heart_regen_failed': 'Failed to save heart regen.',
      'admin_heart_regen_invalid': 'Enter a number between 1 and 1440.',
      'admin_premium_all_sub':
          'While on, every account is treated as premium — applies '
              'when users reopen the app',
      'admin_premium_all_on': 'Premium for all: ON 👑',
      'admin_premium_all_off': 'Premium for all: off',
      'admin_premium_all_failed': 'Failed to save the setting.',
      'admin_grant': 'Gift premium',
      'admin_grant_sub':
          'Grant/revoke premium for a specific user by email',
      'admin_grant_email': 'User email',
      'admin_grant_duration': 'Duration',
      'admin_grant_revoke': 'Revoke',
      'admin_grant_apply': 'APPLY',
      'admin_grant_success': 'Premium gifted to',
      'admin_grant_revoked': 'Premium gift revoked from',
      'admin_grant_notfound':
          'No user found with that email — they must have signed in '
              'to Beomora before.',
      'days_unit': 'days',
      // Settings
      'settings_title': 'Settings',
      'ui_language': 'App language',
      'theme': 'Study theme',
      'theme_light': 'Notebook',
      'theme_dark': 'Chalkboard',
      'sound_effects': 'Sound & haptics',
      'daily_goal_setting': 'Daily goal',
      'show_icons': 'Show word images',
      'show_icons_sub': 'Word emoji on exercises & flashcards',
      'reminder_setting': 'Study reminder',
      'reminder_sub': 'A daily notification to keep your streak alive',
      'reminder_time': 'Reminder time',
      'reminder_channel_name': 'Daily study reminder',
      'reminder_channel_desc':
          'Reminds you to study so your streak stays alive',
      'reminder_title': 'Time to study! 🦉',
      'reminder_body_streak':
          'Keep your {n}-day streak alive — 5 minutes is enough 🔥',
      'reminder_body': 'Take 5 minutes to learn something today 📚',
      'reset_progress': 'Reset all progress',
      'reset_title': 'Reset progress?',
      'reset_msg': 'All XP, streaks, and progress will be permanently lost.',
      'delete': 'DELETE',
      'about': 'Beomora v1.0 — made with Flutter 💙',
      // Course select
      'course_select_title': 'Choose a Course',
      'daily_goal_reached': 'Daily goal reached! 🎉',
      'claim': 'Claim',
      'gems_added': 'Coins added to your pouch!',
      'bonus_goal_hint': 'Bonus goal 🎁 reach {xp} XP for +{gems} 🪙',
      'bonus_goal_reached': 'Bonus goal reached! 🎁',
      'daily_all_done': 'All goals done for today! See you tomorrow 🌙',
      // Achievements
      'ach_first_lesson': 'First Steps',
      'ach_first_lesson_desc': 'Complete your first lesson',
      'ach_lessons_10': 'Diligent Learner',
      'ach_lessons_10_desc': 'Complete 10 lessons',
      'ach_lessons_30': 'Bookworm',
      'ach_lessons_30_desc': 'Complete 30 lessons',
      'ach_streak_3': 'On Fire',
      'ach_streak_3_desc': 'Reach a 3-day streak',
      'ach_streak_7': 'Full Week',
      'ach_streak_7_desc': 'Reach a 7-day streak',
      'ach_streak_30': 'Unstoppable',
      'ach_streak_30_desc': 'Reach a 30-day streak',
      'ach_xp_500': 'Rising Star',
      'ach_xp_500_desc': 'Earn 500 XP',
      'ach_xp_2000': 'Superstar',
      'ach_xp_2000_desc': 'Earn 2000 XP',
      'ach_words_50': 'Getting Fluent',
      'ach_words_50_desc': 'Master 50 words',
      'ach_words_150': 'Walking Dictionary',
      'ach_words_150_desc': 'Master 150 words',
      'ach_perfect_lesson': 'Perfect Score',
      'ach_perfect_lesson_desc': 'Finish a lesson with no mistakes',
      'ach_polyglot': 'Polyglot',
      'ach_polyglot_desc': 'Try all three language courses',
      'ach_unlocked': 'Achievement unlocked!',
      'heart_restored': '+1 heart restored! ❤️',
    },
  };
}
