import '../models/listening.dart';
import 'mcq_bank.dart';

/// Latihan Dengar Indonesia: Menyimak Dasar (gratis) dan UKBI Menyimak
/// (premium, gaya Uji Kemahiran Berbahasa Indonesia). Transkrip sudah
/// bahasa Indonesia, jadi terjemahan hanya tersedia dalam bahasa Inggris
/// (UI Indonesia menyembunyikan bagian terjemahan).
/// Pilihan pertama pada [_q] selalu jawaban benar; layar yang mengacaknya.
McqQuestion _q(String id, String en, List<String> options) =>
    McqQuestion(question: {'id': id, 'en': en}, options: options, answer: 0);

ListeningPassage _p(
  String id,
  String titleId,
  String titleEn,
  String transcript,
  String translationEn,
  List<McqQuestion> questions,
) => ListeningPassage(
  id: id,
  title: {'id': titleId, 'en': titleEn},
  transcript: transcript,
  translation: {'en': translationEn},
  questions: questions,
);

final List<ListeningPack> idListeningPacks = [
  ListeningPack(
    id: 'id_listen_basic',
    emoji: '🎧',
    title: const {'id': 'Menyimak Dasar', 'en': 'Basic Listening'},
    subtitle: const {
      'id': 'percakapan & pengumuman sehari-hari',
      'en': 'everyday talks & announcements',
    },
    premium: false,
    maxPlays: 0,
    passages: _idBasic,
  ),
  ListeningPack(
    id: 'id_listen_ukbi',
    emoji: '🇮🇩',
    title: const {'id': 'UKBI Menyimak', 'en': 'UKBI Listening'},
    subtitle: const {
      'id': 'berita, pengumuman & wacana pendek',
      'en': 'news, announcements & short talks',
    },
    premium: true,
    maxPlays: 2,
    passages: _idUkbi,
  ),
];

// ---------------------------------------------------------------------------
// Indonesia — Menyimak Dasar (gratis, putar bebas)
// ---------------------------------------------------------------------------
final List<ListeningPassage> _idBasic = [
  _p(
    'id_b1',
    'Di Warung Makan',
    'At the Food Stall',
    'Selamat siang, Bu. Mau pesan apa? Saya mau nasi goreng satu dan es teh manis satu. Pedas atau tidak? Sedang saja, Bu. Baik, tunggu sepuluh menit ya. Semuanya dua puluh lima ribu rupiah.',
    'Good afternoon, ma\'am. What would you like? One fried rice and one sweet iced tea. Spicy or not? Medium, please. Okay, wait ten minutes. Everything is twenty-five thousand rupiah.',
    [
      _q('Makanan apa yang dipesan?', 'What food was ordered?', [
        'Nasi goreng',
        'Mi goreng',
        'Sate ayam',
        'Soto',
      ]),
      _q('Minuman apa yang dipesan?', 'What drink was ordered?', [
        'Es teh manis',
        'Es jeruk',
        'Kopi',
        'Air putih',
      ]),
      _q('Seberapa pedas pesanannya?', 'How spicy is the order?', [
        'Sedang',
        'Sangat pedas',
        'Tidak pedas',
        'Sedikit pedas',
      ]),
      _q('Berapa lama harus menunggu?', 'How long is the wait?', [
        'Sepuluh menit',
        'Lima menit',
        'Dua puluh menit',
        'Setengah jam',
      ]),
      _q('Berapa total harganya?', 'What is the total price?', [
        'Dua puluh lima ribu',
        'Dua puluh ribu',
        'Lima belas ribu',
        'Lima puluh ribu',
      ]),
    ],
  ),
  _p(
    'id_b2',
    'Pengumuman di Bandara',
    'Airport Announcement',
    'Perhatian para penumpang. Pesawat Garuda tujuan Surabaya dengan nomor penerbangan GA 310 akan berangkat pukul empat belas tiga puluh dari pintu tujuh. Penumpang dimohon segera menuju ruang tunggu. Karena cuaca buruk, keberangkatan mungkin tertunda sekitar dua puluh menit.',
    'Attention passengers. Garuda flight GA 310 to Surabaya will depart at two thirty p.m. from gate seven. Passengers are requested to proceed to the waiting room. Due to bad weather, departure may be delayed by about twenty minutes.',
    [
      _q('Ke mana tujuan pesawat?', 'Where is the plane going?', [
        'Surabaya',
        'Jakarta',
        'Medan',
        'Denpasar',
      ]),
      _q('Pukul berapa pesawat berangkat?', 'What time does the plane leave?', [
        'Empat belas tiga puluh',
        'Empat belas',
        'Tiga belas tiga puluh',
        'Empat tiga puluh',
      ]),
      _q('Dari pintu berapa?', 'From which gate?', [
        'Pintu tujuh',
        'Pintu tiga',
        'Pintu sepuluh',
        'Pintu dua',
      ]),
      _q('Apa penyebab kemungkinan penundaan?', 'What might cause a delay?', [
        'Cuaca buruk',
        'Masalah mesin',
        'Penumpang terlambat',
        'Landasan ditutup',
      ]),
      _q('Berapa lama penundaannya?', 'How long is the possible delay?', [
        'Sekitar dua puluh menit',
        'Sekitar sepuluh menit',
        'Satu jam',
        'Dua jam',
      ]),
    ],
  ),
  _p(
    'id_b3',
    'Perkenalan',
    'Introduction',
    'Halo, nama saya Rina. Saya berasal dari Bandung, tetapi sekarang tinggal di Yogyakarta karena kuliah. Saya mahasiswa jurusan bahasa Inggris semester tiga. Hobi saya membaca dan bersepeda. Setiap Minggu pagi saya bersepeda ke Malioboro bersama teman.',
    'Hello, my name is Rina. I come from Bandung, but I now live in Yogyakarta because of university. I am a third-semester English student. My hobbies are reading and cycling. Every Sunday morning I cycle to Malioboro with friends.',
    [
      _q('Dari mana Rina berasal?', 'Where is Rina from?', [
        'Bandung',
        'Yogyakarta',
        'Jakarta',
        'Semarang',
      ]),
      _q('Di mana Rina tinggal sekarang?', 'Where does Rina live now?', [
        'Yogyakarta',
        'Bandung',
        'Surabaya',
        'Malang',
      ]),
      _q('Apa jurusan Rina?', 'What is Rina studying?', [
        'Bahasa Inggris',
        'Bahasa Indonesia',
        'Ekonomi',
        'Kedokteran',
      ]),
      _q('Semester berapa Rina sekarang?', 'Which semester is Rina in?', [
        'Tiga',
        'Dua',
        'Lima',
        'Satu',
      ]),
      _q('Kapan Rina bersepeda?', 'When does Rina cycle?', [
        'Minggu pagi',
        'Sabtu sore',
        'Setiap hari',
        'Jumat malam',
      ]),
    ],
  ),
  _p(
    'id_b4',
    'Ramalan Cuaca',
    'Weather Forecast',
    'Berikut prakiraan cuaca untuk Jakarta hari ini. Pagi hari cerah berawan dengan suhu dua puluh enam derajat. Siang hingga sore berpotensi hujan lebat disertai petir di Jakarta Selatan dan Timur. Warga diimbau membawa payung dan berhati-hati saat berkendara. Malam hari cuaca kembali cerah.',
    'Here is today\'s weather forecast for Jakarta. The morning will be partly cloudy at twenty-six degrees. From midday to afternoon there is a chance of heavy rain with lightning in South and East Jakarta. Residents are advised to bring umbrellas and drive carefully. At night the weather will be clear again.',
    [
      _q('Bagaimana cuaca pagi ini?', 'What is the weather this morning?', [
        'Cerah berawan',
        'Hujan lebat',
        'Berkabut',
        'Mendung gelap',
      ]),
      _q('Berapa suhu pagi ini?', 'What is the morning temperature?', [
        'Dua puluh enam derajat',
        'Dua puluh derajat',
        'Tiga puluh enam derajat',
        'Enam belas derajat',
      ]),
      _q('Di mana berpotensi hujan lebat?', 'Where might heavy rain fall?', [
        'Jakarta Selatan dan Timur',
        'Jakarta Utara',
        'Jakarta Barat',
        'Seluruh Jakarta',
      ]),
      _q('Apa imbauan untuk warga?', 'What is the advice for residents?', [
        'Membawa payung',
        'Tetap di rumah',
        'Memakai jaket',
        'Minum banyak air',
      ]),
      _q('Bagaimana cuaca malam hari?', 'What is the weather at night?', [
        'Cerah',
        'Hujan',
        'Berangin',
        'Berkabut',
      ]),
    ],
  ),
  _p(
    'id_b5',
    'Di Pasar',
    'At the Market',
    'Bu, mangganya berapa sekilo? Dua puluh ribu, Mas. Kalau beli dua kilo, boleh tiga puluh lima ribu? Boleh, tapi pilih sendiri ya. Ini pisangnya juga segar, sepuluh ribu satu sisir. Ya sudah, saya ambil mangga dua kilo dan pisang satu sisir.',
    'Ma\'am, how much is a kilo of mangoes? Twenty thousand, sir. If I buy two kilos, can it be thirty-five thousand? Sure, but pick them yourself. These bananas are fresh too, ten thousand a bunch. Alright, I\'ll take two kilos of mangoes and one bunch of bananas.',
    [
      _q('Berapa harga mangga per kilo?', 'How much is a kilo of mangoes?', [
        'Dua puluh ribu',
        'Sepuluh ribu',
        'Tiga puluh lima ribu',
        'Lima belas ribu',
      ]),
      _q(
        'Berapa harga dua kilo setelah tawar-menawar?',
        'How much for two kilos after bargaining?',
        [
          'Tiga puluh lima ribu',
          'Empat puluh ribu',
          'Tiga puluh ribu',
          'Dua puluh ribu',
        ],
      ),
      _q('Apa syarat penjual?', 'What is the seller\'s condition?', [
        'Pilih sendiri',
        'Bayar tunai',
        'Beli tiga kilo',
        'Datang pagi',
      ]),
      _q('Berapa harga satu sisir pisang?', 'How much is a bunch of bananas?', [
        'Sepuluh ribu',
        'Dua puluh ribu',
        'Lima ribu',
        'Lima belas ribu',
      ]),
      _q('Apa yang akhirnya dibeli?', 'What is finally bought?', [
        'Mangga dua kilo dan pisang satu sisir',
        'Mangga satu kilo',
        'Pisang dua sisir',
        'Mangga dan jeruk',
      ]),
    ],
  ),
  _p(
    'id_b6',
    'Janji Bertemu',
    'Making an Appointment',
    'Halo, Dimas. Besok jadi ke perpustakaan? Jadi, jam berapa? Bagaimana kalau jam sembilan pagi? Aduh, jam sembilan aku masih ada kelas. Jam sebelas bisa? Bisa. Kita bertemu di depan pintu utama ya. Oke, sampai besok.',
    'Hi, Dimas. Are we still going to the library tomorrow? Yes, what time? How about nine in the morning? Oh, at nine I still have class. Can you do eleven? Yes. Let\'s meet in front of the main entrance. Okay, see you tomorrow.',
    [
      _q('Ke mana mereka akan pergi?', 'Where are they going?', [
        'Perpustakaan',
        'Kantin',
        'Bioskop',
        'Toko buku',
      ]),
      _q(
        'Jam berapa yang pertama diusulkan?',
        'What time was first suggested?',
        ['Jam sembilan pagi', 'Jam sebelas', 'Jam delapan', 'Jam sepuluh'],
      ),
      _q(
        'Kenapa Dimas tidak bisa jam sembilan?',
        'Why can\'t Dimas make it at nine?',
        ['Masih ada kelas', 'Masih tidur', 'Ada rapat', 'Sedang sakit'],
      ),
      _q(
        'Jam berapa akhirnya mereka bertemu?',
        'What time do they finally meet?',
        ['Jam sebelas', 'Jam sembilan', 'Jam dua belas', 'Jam sepuluh'],
      ),
      _q('Di mana mereka bertemu?', 'Where will they meet?', [
        'Depan pintu utama',
        'Di kantin',
        'Di ruang baca',
        'Di halte bus',
      ]),
    ],
  ),
  _p(
    'id_b7',
    'Kegiatan Sehari-hari',
    'Daily Activities',
    'Setiap hari saya bangun pukul lima pagi untuk salat dan olahraga ringan. Pukul setengah tujuh saya berangkat kerja naik sepeda motor, perjalanannya sekitar empat puluh menit. Saya bekerja di bank dari pukul delapan sampai pukul lima sore. Malamnya saya biasanya memasak dan menonton berita.',
    'Every day I get up at five in the morning to pray and do light exercise. At half past six I leave for work by motorcycle; the trip takes about forty minutes. I work at a bank from eight until five in the afternoon. In the evening I usually cook and watch the news.',
    [
      _q('Pukul berapa dia bangun?', 'What time does the speaker get up?', [
        'Pukul lima pagi',
        'Pukul enam',
        'Pukul setengah tujuh',
        'Pukul empat',
      ]),
      _q(
        'Bagaimana dia berangkat kerja?',
        'How does the speaker get to work?',
        ['Naik sepeda motor', 'Naik bus', 'Naik mobil', 'Jalan kaki'],
      ),
      _q('Berapa lama perjalanannya?', 'How long is the trip?', [
        'Sekitar empat puluh menit',
        'Sekitar empat menit',
        'Satu jam',
        'Dua puluh menit',
      ]),
      _q('Di mana dia bekerja?', 'Where does the speaker work?', [
        'Di bank',
        'Di sekolah',
        'Di rumah sakit',
        'Di toko',
      ]),
      _q(
        'Apa yang dilakukan malam hari?',
        'What does the speaker do in the evening?',
        [
          'Memasak dan menonton berita',
          'Belajar bahasa',
          'Berolahraga',
          'Bekerja lembur',
        ],
      ),
    ],
  ),
  _p(
    'id_b8',
    'Di Apotek',
    'At the Pharmacy',
    'Selamat sore, ada yang bisa dibantu? Saya mau beli obat batuk untuk anak umur enam tahun. Ini sirup batuk anak, diminum tiga kali sehari satu sendok teh sesudah makan. Kalau tiga hari belum sembuh, sebaiknya periksa ke dokter. Harganya tiga puluh dua ribu.',
    'Good afternoon, can I help you? I want to buy cough medicine for a six-year-old child. This is children\'s cough syrup, taken three times a day, one teaspoon after meals. If not better after three days, you should see a doctor. It costs thirty-two thousand.',
    [
      _q('Obat apa yang dicari?', 'What medicine is wanted?', [
        'Obat batuk',
        'Obat demam',
        'Obat sakit kepala',
        'Vitamin',
      ]),
      _q('Berapa umur anaknya?', 'How old is the child?', [
        'Enam tahun',
        'Tiga tahun',
        'Sepuluh tahun',
        'Delapan tahun',
      ]),
      _q(
        'Berapa kali sehari obat diminum?',
        'How many times a day is the syrup taken?',
        ['Tiga kali', 'Dua kali', 'Satu kali', 'Empat kali'],
      ),
      _q('Kapan harus periksa ke dokter?', 'When should they see a doctor?', [
        'Kalau tiga hari belum sembuh',
        'Besok pagi',
        'Kalau demam',
        'Setelah seminggu',
      ]),
      _q('Berapa harga obatnya?', 'How much does the medicine cost?', [
        'Tiga puluh dua ribu',
        'Dua puluh tiga ribu',
        'Tiga puluh ribu',
        'Dua puluh ribu',
      ]),
    ],
  ),
];

// ---------------------------------------------------------------------------
// Indonesia — UKBI Menyimak (premium, 2x putar)
// ---------------------------------------------------------------------------
final List<ListeningPassage> _idUkbi = [
  _p(
    'id_u1',
    'Berita: Pasar Tradisional',
    'News: Traditional Market',
    'Pemerintah kota meresmikan pasar tradisional baru di kawasan timur kota pada Senin pagi. Pasar seluas dua hektare ini menampung sekitar lima ratus pedagang yang sebelumnya berjualan di pinggir jalan. Selain lebih bersih, pasar dilengkapi tempat parkir dan sistem pembayaran nontunai. Wali kota berharap pendapatan pedagang meningkat hingga tiga puluh persen.',
    'The city government inaugurated a new traditional market in the eastern part of the city on Monday morning. The two-hectare market accommodates about five hundred traders who previously sold on the roadside. Besides being cleaner, the market has parking and a cashless payment system. The mayor hopes traders\' income will rise by up to thirty percent.',
    [
      _q('Di mana pasar baru dibangun?', 'Where was the new market built?', [
        'Kawasan timur kota',
        'Kawasan barat kota',
        'Pusat kota',
        'Pinggir kota utara',
      ]),
      _q('Berapa luas pasarnya?', 'How large is the market?', [
        'Dua hektare',
        'Lima hektare',
        'Satu hektare',
        'Dua puluh hektare',
      ]),
      _q('Berapa pedagang yang ditampung?', 'How many traders does it hold?', [
        'Sekitar lima ratus',
        'Sekitar lima puluh',
        'Sekitar lima ribu',
        'Sekitar dua ratus',
      ]),
      _q(
        'Di mana pedagang sebelumnya berjualan?',
        'Where did the traders sell before?',
        ['Di pinggir jalan', 'Di pasar lama', 'Di rumah', 'Di mal'],
      ),
      _q('Apa harapan wali kota?', 'What does the mayor hope?', [
        'Pendapatan pedagang naik tiga puluh persen',
        'Harga barang turun',
        'Pasar lebih ramai malam hari',
        'Pedagang pindah lagi',
      ]),
    ],
  ),
  _p(
    'id_u2',
    'Pengumuman Kampus',
    'Campus Announcement',
    'Diberitahukan kepada seluruh mahasiswa bahwa pendaftaran ulang semester genap dibuka mulai tanggal lima sampai lima belas Januari melalui portal akademik. Mahasiswa yang terlambat akan dikenai denda seratus ribu rupiah. Bagi yang mengalami kendala pembayaran, silakan menghubungi bagian keuangan di gedung rektorat lantai dua pada hari kerja.',
    'All students are informed that re-registration for the even semester opens from the fifth to the fifteenth of January through the academic portal. Late students will be fined one hundred thousand rupiah. Those with payment difficulties may contact the finance office on the second floor of the rectorate building on working days.',
    [
      _q('Kapan pendaftaran ulang dibuka?', 'When does re-registration open?', [
        'Lima sampai lima belas Januari',
        'Satu sampai sepuluh Januari',
        'Lima sampai lima belas Februari',
        'Lima belas sampai dua puluh Januari',
      ]),
      _q('Melalui apa pendaftaran dilakukan?', 'How is registration done?', [
        'Portal akademik',
        'Datang langsung',
        'Surat',
        'Telepon',
      ]),
      _q('Berapa denda keterlambatan?', 'What is the late fine?', [
        'Seratus ribu rupiah',
        'Lima puluh ribu rupiah',
        'Dua ratus ribu rupiah',
        'Sepuluh ribu rupiah',
      ]),
      _q('Di mana bagian keuangan?', 'Where is the finance office?', [
        'Gedung rektorat lantai dua',
        'Gedung rektorat lantai satu',
        'Perpustakaan',
        'Gedung fakultas',
      ]),
      _q(
        'Kapan bagian keuangan bisa dihubungi?',
        'When can the finance office be contacted?',
        ['Hari kerja', 'Akhir pekan', 'Setiap hari', 'Hanya Senin'],
      ),
    ],
  ),
  _p(
    'id_u3',
    'Wacana: Sampah Plastik',
    'Talk: Plastic Waste',
    'Indonesia menghasilkan sekitar enam puluh delapan juta ton sampah setiap tahun, dan hampir dua puluh persennya adalah plastik. Sebagian besar sampah plastik berakhir di sungai dan laut karena sistem pengumpulan yang belum merata. Beberapa kota kini melarang kantong plastik sekali pakai di pusat perbelanjaan. Langkah ini terbukti mengurangi penggunaan kantong plastik hingga separuhnya dalam satu tahun.',
    'Indonesia produces about sixty-eight million tons of waste every year, and nearly twenty percent of it is plastic. Most plastic waste ends up in rivers and the sea because collection systems are not yet evenly spread. Several cities now ban single-use plastic bags in shopping centres. This step has been shown to cut plastic bag use by half within a year.',
    [
      _q(
        'Berapa sampah yang dihasilkan Indonesia per tahun?',
        'How much waste does Indonesia produce per year?',
        [
          'Sekitar enam puluh delapan juta ton',
          'Sekitar enam juta ton',
          'Sekitar delapan puluh juta ton',
          'Sekitar dua puluh juta ton',
        ],
      ),
      _q(
        'Berapa persen sampah yang berupa plastik?',
        'What percentage of waste is plastic?',
        [
          'Hampir dua puluh persen',
          'Hampir lima puluh persen',
          'Hampir sepuluh persen',
          'Hampir delapan puluh persen',
        ],
      ),
      _q(
        'Mengapa sampah plastik berakhir di laut?',
        'Why does plastic waste end up in the sea?',
        [
          'Sistem pengumpulan belum merata',
          'Warga membuang sengaja',
          'Tidak ada tempat sampah',
          'Pabrik membuang limbah',
        ],
      ),
      _q(
        'Apa kebijakan beberapa kota?',
        'What policy have some cities adopted?',
        [
          'Melarang kantong plastik sekali pakai',
          'Menutup pusat perbelanjaan',
          'Menaikkan pajak plastik',
          'Membangun pabrik daur ulang',
        ],
      ),
      _q('Apa hasil kebijakan itu?', 'What was the result of the policy?', [
        'Penggunaan kantong plastik turun separuh',
        'Sampah hilang seluruhnya',
        'Harga barang naik',
        'Toko tutup',
      ]),
    ],
  ),
  _p(
    'id_u4',
    'Pesan Suara Kantor',
    'Office Voicemail',
    'Selamat pagi, Pak Budi. Saya Sari dari bagian personalia. Rapat evaluasi yang dijadwalkan Kamis pukul sepuluh dipindahkan ke Jumat pukul empat belas di ruang rapat lantai tiga. Mohon menyiapkan laporan penjualan triwulan dalam bentuk cetak dan digital. Jika berhalangan hadir, mohon konfirmasi paling lambat Rabu sore. Terima kasih.',
    'Good morning, Mr. Budi. This is Sari from the personnel department. The evaluation meeting scheduled for Thursday at ten has been moved to Friday at two p.m. in the third-floor meeting room. Please prepare the quarterly sales report in printed and digital form. If you cannot attend, please confirm by Wednesday afternoon at the latest. Thank you.',
    [
      _q('Siapa yang meninggalkan pesan?', 'Who left the message?', [
        'Sari dari bagian personalia',
        'Pak Budi',
        'Bagian keuangan',
        'Direktur',
      ]),
      _q('Kapan rapat sekarang?', 'When is the meeting now?', [
        'Jumat pukul empat belas',
        'Kamis pukul sepuluh',
        'Jumat pukul sepuluh',
        'Kamis pukul empat belas',
      ]),
      _q('Di mana rapat diadakan?', 'Where is the meeting held?', [
        'Ruang rapat lantai tiga',
        'Ruang rapat lantai dua',
        'Ruang direktur',
        'Aula',
      ]),
      _q('Laporan apa yang harus disiapkan?', 'What report must be prepared?', [
        'Laporan penjualan triwulan',
        'Laporan keuangan tahunan',
        'Laporan kehadiran',
        'Laporan produksi',
      ]),
      _q(
        'Kapan batas konfirmasi jika berhalangan?',
        'By when should absence be confirmed?',
        ['Rabu sore', 'Kamis pagi', 'Jumat pagi', 'Selasa malam'],
      ),
    ],
  ),
  _p(
    'id_u5',
    'Berita: Kereta Cepat',
    'News: High-speed Train',
    'Jumlah penumpang kereta cepat Jakarta–Bandung mencapai lima juta orang dalam satu tahun pertama beroperasi. Waktu tempuh yang hanya empat puluh lima menit menjadi daya tarik utama dibanding perjalanan darat yang memakan waktu tiga jam. Pengelola berencana menambah jadwal keberangkatan menjadi enam puluh perjalanan per hari pada akhir tahun serta menurunkan harga tiket di luar jam sibuk.',
    'Passenger numbers on the Jakarta–Bandung high-speed train reached five million in its first year of operation. The travel time of only forty-five minutes is the main attraction compared with three hours by road. The operator plans to increase departures to sixty trips per day by the end of the year and lower ticket prices outside peak hours.',
    [
      _q(
        'Berapa penumpang dalam tahun pertama?',
        'How many passengers in the first year?',
        [
          'Lima juta orang',
          'Lima ratus ribu orang',
          'Lima puluh juta orang',
          'Satu juta orang',
        ],
      ),
      _q(
        'Berapa waktu tempuh kereta cepat?',
        'How long is the high-speed train journey?',
        ['Empat puluh lima menit', 'Tiga jam', 'Satu jam', 'Dua puluh menit'],
      ),
      _q('Berapa lama perjalanan darat?', 'How long is the road journey?', [
        'Tiga jam',
        'Dua jam',
        'Lima jam',
        'Empat puluh lima menit',
      ]),
      _q(
        'Berapa rencana perjalanan per hari?',
        'How many trips per day are planned?',
        ['Enam puluh', 'Enam', 'Enam belas', 'Seratus'],
      ),
      _q(
        'Kapan harga tiket akan diturunkan?',
        'When will ticket prices be lowered?',
        [
          'Di luar jam sibuk',
          'Pada jam sibuk',
          'Akhir pekan',
          'Hari libur nasional',
        ],
      ),
    ],
  ),
  _p(
    'id_u6',
    'Pengumuman Perumahan',
    'Housing Announcement',
    'Kepada seluruh warga Perumahan Griya Asri, pemadaman listrik terjadwal akan dilakukan pada Sabtu, dua puluh Juli, pukul sembilan pagi sampai pukul satu siang untuk perawatan jaringan. Warga dimohon mematikan peralatan elektronik sebelum pemadaman. Kerja bakti membersihkan saluran air akan dilaksanakan Minggu pagi pukul tujuh, dimulai dari pos keamanan.',
    'To all residents of Griya Asri housing estate, a scheduled power outage will take place on Saturday, the twentieth of July, from nine in the morning until one in the afternoon for network maintenance. Residents are asked to switch off electronic devices before the outage. Community work to clean the drains will be held Sunday morning at seven, starting from the security post.',
    [
      _q('Kapan pemadaman listrik?', 'When is the power outage?', [
        'Sabtu, dua puluh Juli',
        'Minggu, dua puluh Juli',
        'Sabtu, dua Juli',
        'Jumat, dua puluh Juni',
      ]),
      _q('Pukul berapa pemadaman berakhir?', 'What time does the outage end?', [
        'Pukul satu siang',
        'Pukul sembilan pagi',
        'Pukul tiga sore',
        'Pukul sebelas',
      ]),
      _q('Apa tujuan pemadaman?', 'What is the reason for the outage?', [
        'Perawatan jaringan',
        'Kekurangan daya',
        'Badai',
        'Pembangunan gardu',
      ]),
      _q('Apa yang diminta dari warga?', 'What are residents asked to do?', [
        'Mematikan peralatan elektronik',
        'Keluar rumah',
        'Membeli genset',
        'Menyimpan air',
      ]),
      _q('Kapan kerja bakti dilaksanakan?', 'When is the community work?', [
        'Minggu pagi pukul tujuh',
        'Sabtu pagi pukul tujuh',
        'Minggu sore',
        'Sabtu siang',
      ]),
    ],
  ),
  _p(
    'id_u7',
    'Wacana: Manfaat Sarapan',
    'Talk: Benefits of Breakfast',
    'Penelitian terhadap dua ribu siswa sekolah dasar menunjukkan bahwa anak yang sarapan setiap hari memiliki nilai rata-rata lima belas persen lebih tinggi dibanding yang sering melewatkannya. Sarapan menyediakan energi bagi otak setelah berpuasa semalam. Para ahli menyarankan menu yang mengandung karbohidrat, protein, dan buah, misalnya nasi dengan telur dan pisang. Sarapan sebaiknya dilakukan paling lambat dua jam setelah bangun tidur.',
    'A study of two thousand primary school students shows that children who eat breakfast every day have average scores fifteen percent higher than those who often skip it. Breakfast supplies energy to the brain after fasting overnight. Experts recommend a menu containing carbohydrates, protein, and fruit, for example rice with egg and banana. Breakfast should be eaten no later than two hours after waking.',
    [
      _q('Berapa siswa yang diteliti?', 'How many students were studied?', [
        'Dua ribu',
        'Dua ratus',
        'Dua puluh ribu',
        'Seribu',
      ]),
      _q(
        'Berapa selisih nilai rata-ratanya?',
        'What is the difference in average scores?',
        [
          'Lima belas persen',
          'Lima persen',
          'Lima puluh persen',
          'Dua puluh lima persen',
        ],
      ),
      _q('Mengapa sarapan penting?', 'Why is breakfast important?', [
        'Menyediakan energi bagi otak',
        'Menurunkan berat badan',
        'Membuat tidur nyenyak',
        'Mencegah flu',
      ]),
      _q('Contoh menu yang disarankan?', 'What example menu is suggested?', [
        'Nasi dengan telur dan pisang',
        'Mi instan',
        'Kopi dan roti',
        'Gorengan',
      ]),
      _q('Kapan sebaiknya sarapan?', 'When should breakfast be eaten?', [
        'Paling lambat dua jam setelah bangun',
        'Sebelum tidur',
        'Pukul dua belas',
        'Setelah olahraga berat',
      ]),
    ],
  ),
  _p(
    'id_u8',
    'Wawancara Kerja',
    'Job Interview',
    'Terima kasih sudah datang, Bu Maya. Posisi yang kami tawarkan adalah staf pemasaran dengan jam kerja Senin sampai Jumat, pukul delapan sampai lima. Anda akan menangani media sosial dan bekerja sama dengan tim desain. Gaji awal enam juta rupiah per bulan ditambah tunjangan transportasi. Jika diterima, Anda mulai bekerja tanggal satu bulan depan setelah pelatihan tiga hari.',
    'Thank you for coming, Ms. Maya. The position we offer is marketing staff with working hours Monday to Friday, eight to five. You will handle social media and work with the design team. The starting salary is six million rupiah per month plus a transport allowance. If accepted, you start on the first of next month after three days of training.',
    [
      _q('Posisi apa yang ditawarkan?', 'What position is offered?', [
        'Staf pemasaran',
        'Staf keuangan',
        'Desainer',
        'Resepsionis',
      ]),
      _q('Hari apa saja jam kerjanya?', 'Which days are the working days?', [
        'Senin sampai Jumat',
        'Senin sampai Sabtu',
        'Selasa sampai Sabtu',
        'Setiap hari',
      ]),
      _q('Apa tugas utamanya?', 'What is the main task?', [
        'Menangani media sosial',
        'Mendesain logo',
        'Mengelola keuangan',
        'Menjaga toko',
      ]),
      _q('Berapa gaji awalnya?', 'What is the starting salary?', [
        'Enam juta rupiah',
        'Lima juta rupiah',
        'Delapan juta rupiah',
        'Tiga juta rupiah',
      ]),
      _q('Berapa lama pelatihannya?', 'How long is the training?', [
        'Tiga hari',
        'Tiga minggu',
        'Satu hari',
        'Satu bulan',
      ]),
    ],
  ),
];
