import '../models/listening.dart';
import 'listening_bank_de.dart';
import 'listening_bank_id.dart';
import 'listening_bank_ja_n1.dart';
import 'listening_bank_ja_n2.dart';
import 'listening_bank_ja_n3.dart';
import 'listening_bank_ko.dart';
import 'mcq_bank.dart';

/// Bank "Latihan Dengar": paragraf yang dibacakan TTS + soal pemahaman,
/// bergaya ujian internasional (TOEFL/IELTS/PTE) dan JLPT Choukai.
/// Korea, Jerman, dan Indonesia ada di listening_bank_{ko,de,id}.dart.
/// Konten disusun sendiri untuk latihan — bukan soal resmi penyelenggara.
/// Pilihan pertama pada [_q] selalu jawaban benar; layar yang mengacaknya.
McqQuestion _q(String id, String en, List<String> options) =>
    McqQuestion(question: {'id': id, 'en': en}, options: options, answer: 0);

ListeningPassage _p(
  String id,
  String titleId,
  String titleEn,
  String transcript,
  Map<String, String> translation,
  List<McqQuestion> questions,
) => ListeningPassage(
  id: id,
  title: {'id': titleId, 'en': titleEn},
  transcript: transcript,
  translation: translation,
  questions: questions,
);

List<ListeningPack> listeningPacksFor(String courseId) {
  switch (courseId) {
    case 'en':
      return [
        ListeningPack(
          id: 'en_listen_basic',
          emoji: '🎧',
          title: const {'id': 'Listening Dasar', 'en': 'Basic Listening'},
          subtitle: const {
            'id': 'percakapan & pengumuman sehari-hari',
            'en': 'everyday talks & announcements',
          },
          premium: false,
          maxPlays: 0,
          passages: _enBasic,
        ),
        ListeningPack(
          id: 'en_listen_toefl',
          emoji: '🎓',
          title: const {'id': 'TOEFL Listening', 'en': 'TOEFL Listening'},
          subtitle: const {
            'id': 'kuliah kampus & percakapan mahasiswa',
            'en': 'campus lectures & student talks',
          },
          premium: true,
          maxPlays: 2,
          passages: _enToefl,
        ),
        ListeningPack(
          id: 'en_listen_ielts',
          emoji: '📘',
          title: const {'id': 'IELTS Listening', 'en': 'IELTS Listening'},
          subtitle: const {
            'id': 'situasi sehari-hari & monolog',
            'en': 'everyday situations & monologues',
          },
          premium: true,
          maxPlays: 2,
          passages: _enIelts,
        ),
        ListeningPack(
          id: 'en_listen_pte',
          emoji: '💻',
          title: const {'id': 'PTE Listening', 'en': 'PTE Listening'},
          subtitle: const {
            'id': 'rangkuman kuliah & detail angka',
            'en': 'lecture summaries & number details',
          },
          premium: true,
          maxPlays: 1,
          passages: _enPte,
        ),
      ];
    case 'ja':
      return [
        ListeningPack(
          id: 'ja_listen_n5',
          emoji: '🌸',
          title: const {'id': 'Choukai N5', 'en': 'Choukai N5'},
          subtitle: const {
            'id': 'percakapan pendek sehari-hari',
            'en': 'short everyday talks',
          },
          premium: true,
          maxPlays: 2,
          passages: _jaN5,
        ),
        ListeningPack(
          id: 'ja_listen_n4',
          emoji: '🍁',
          title: const {'id': 'Choukai N4', 'en': 'Choukai N4'},
          subtitle: const {
            'id': 'pengumuman & cerita pendek',
            'en': 'announcements & short stories',
          },
          premium: true,
          maxPlays: 2,
          passages: _jaN4,
        ),
        ListeningPack(
          id: 'ja_listen_n3',
          emoji: '🗻',
          title: const {'id': 'Choukai N3', 'en': 'Choukai N3'},
          subtitle: const {
            'id': 'kantor, rumah sakit & pengumuman umum',
            'en': 'office, hospital & public announcements',
          },
          premium: true,
          maxPlays: 2,
          passages: jaListeningN3,
        ),
        ListeningPack(
          id: 'ja_listen_n2',
          emoji: '⛩️',
          title: const {'id': 'Choukai N2', 'en': 'Choukai N2'},
          subtitle: const {
            'id': 'kuliah, rapat & berita',
            'en': 'lectures, meetings & news',
          },
          premium: true,
          maxPlays: 2,
          passages: jaListeningN2,
        ),
        ListeningPack(
          id: 'ja_listen_n1',
          emoji: '🏯',
          title: const {'id': 'Choukai N1', 'en': 'Choukai N1'},
          subtitle: const {
            'id': 'wawancara, seminar & pengumuman perusahaan',
            'en': 'interviews, seminars & corporate notices',
          },
          premium: true,
          maxPlays: 1,
          passages: jaListeningN1,
        ),
      ];
    case 'ko':
      return koListeningPacks;
    case 'de':
      return deListeningPacks;
    case 'id':
      return idListeningPacks;
    default:
      return const [];
  }
}

// ---------------------------------------------------------------------------
// Inggris — Listening Dasar (gratis, putar bebas)
// ---------------------------------------------------------------------------
final List<ListeningPassage> _enBasic = [
  _p(
    'en_b1',
    'Di Kafe',
    'At the Cafe',
    "Good morning! Welcome to Sunny Cafe. Today we have a special offer: buy one coffee and get a second one at half price. Our fresh croissants arrive at eight o'clock every morning. If you need Wi-Fi, the password is written on the board next to the counter. Please take a seat anywhere, and we will bring your order to your table.",
    {
      'id':
          'Selamat pagi! Selamat datang di Sunny Cafe. Hari ini ada penawaran spesial: beli satu kopi, kopi kedua setengah harga. Croissant segar kami datang pukul delapan setiap pagi. Kalau butuh Wi-Fi, kata sandinya tertulis di papan di samping kasir. Silakan duduk di mana saja, pesanan akan kami antar ke meja.',
    },
    [
      _q(
        'Apa penawaran spesial hari ini?',
        'What is the special offer today?',
        [
          'A second coffee at half price',
          'Free croissants',
          'Free Wi-Fi for members',
          'A discount on tea',
        ],
      ),
      _q('Pukul berapa croissant datang?', 'When do the croissants arrive?', [
        'At eight in the morning',
        'At noon',
        'At six in the evening',
        'At nine at night',
      ]),
      _q(
        'Di mana kata sandi Wi-Fi tertulis?',
        'Where is the Wi-Fi password written?',
        [
          'On the board next to the counter',
          'On the receipt',
          'On the menu',
          'On the front door',
        ],
      ),
      _q('Ke mana pesanan akan diantar?', 'Where will the order be brought?', [
        "To the customer's table",
        'To the counter',
        'To the front door',
        'To the kitchen',
      ]),
      _q('Apa nama kafenya?', 'What is the name of the cafe?', [
        'Sunny Cafe',
        'Sunday Cafe',
        'Morning Cafe',
        'Green Cafe',
      ]),
    ],
  ),
  _p(
    'en_b2',
    'Pengumuman Stasiun',
    'Station Announcement',
    "Attention, passengers. The train to Central Station on platform three is delayed by about fifteen minutes because of a signal problem. Passengers traveling to the airport should take the express train from platform one, which leaves at ten twenty. We apologize for the inconvenience and thank you for your patience.",
    {
      'id':
          'Perhatian, para penumpang. Kereta menuju Stasiun Central di peron tiga terlambat sekitar lima belas menit karena masalah sinyal. Penumpang menuju bandara silakan naik kereta ekspres dari peron satu yang berangkat pukul 10.20. Kami mohon maaf atas ketidaknyamanan ini dan terima kasih atas kesabaran Anda.',
    },
    [
      _q('Berapa lama keterlambatannya?', 'How long is the delay?', [
        'About fifteen minutes',
        'About fifty minutes',
        'About five minutes',
        'About an hour',
      ]),
      _q('Apa penyebab keterlambatan?', 'What caused the delay?', [
        'A signal problem',
        'Heavy rain',
        'A broken door',
        'Too many passengers',
      ]),
      _q(
        'Dari peron mana kereta ke bandara berangkat?',
        'Which platform does the airport train leave from?',
        ['Platform one', 'Platform three', 'Platform two', 'Platform ten'],
      ),
      _q(
        'Di peron mana kereta yang terlambat?',
        'Which platform is the delayed train on?',
        ['Platform three', 'Platform one', 'Platform two', 'Platform five'],
      ),
      _q(
        'Jam berapa kereta ekspres berangkat?',
        'What time does the express train leave?',
        ['Ten twenty', 'Ten twelve', 'Twelve twenty', 'Two ten'],
      ),
    ],
  ),
  _p(
    'en_b3',
    'Pesan Suara Dokter',
    'Voicemail from the Clinic',
    "Hello, this is Anna from Green Street Clinic. I'm calling to remind you of your appointment with Doctor Lee on Thursday at half past two. Please arrive ten minutes early to fill in a short form, and bring your insurance card. If you cannot come, call us before Wednesday evening so we can offer the time to another patient. Thank you.",
    {
      'id':
          'Halo, ini Anna dari Klinik Green Street. Saya menelepon untuk mengingatkan janji Anda dengan Dokter Lee hari Kamis pukul setengah tiga. Mohon datang sepuluh menit lebih awal untuk mengisi formulir singkat, dan bawa kartu asuransi. Kalau tidak bisa datang, hubungi kami sebelum Rabu malam supaya waktunya bisa diberikan ke pasien lain. Terima kasih.',
    },
    [
      _q('Kapan janji dengan dokter?', 'When is the appointment?', [
        'Thursday at 2:30',
        'Wednesday at 2:30',
        'Thursday at 3:30',
        'Tuesday at 2:00',
      ]),
      _q('Apa yang harus dibawa?', 'What should the patient bring?', [
        'An insurance card',
        'A passport',
        'Cash payment',
        'A list of medicines',
      ]),
      _q(
        'Kapan batas waktu untuk membatalkan?',
        'By when should the patient cancel?',
        [
          'Before Wednesday evening',
          'Before Thursday morning',
          'Before Monday',
          'On the same day',
        ],
      ),
      _q('Siapa yang menelepon?', 'Who is calling?', [
        'Anna from Green Street Clinic',
        'Doctor Lee',
        'A patient',
        'A pharmacist',
      ]),
      _q(
        'Kenapa harus datang sepuluh menit lebih awal?',
        'Why should the patient arrive ten minutes early?',
        [
          'To fill in a short form',
          'To pay the bill',
          'To find parking',
          'To see another doctor',
        ],
      ),
    ],
  ),
  _p(
    'en_b4',
    'Cuaca Hari Ini',
    'Today\'s Weather',
    "Here is the weather for today. The morning will be cloudy with light rain in the north. By early afternoon the rain will stop and the sun will come out, with temperatures reaching twenty-four degrees. Tonight will be cool, so take a jacket if you go out. Tomorrow looks sunny all day, perfect for the weekend market.",
    {
      'id':
          'Berikut cuaca hari ini. Pagi berawan dengan hujan ringan di utara. Menjelang siang hujan berhenti dan matahari muncul, suhu mencapai 24 derajat. Malam akan sejuk, jadi bawa jaket kalau keluar. Besok tampaknya cerah sepanjang hari, cocok untuk pasar akhir pekan.',
    },
    [
      _q(
        'Bagaimana cuaca pagi ini?',
        'What is the weather like this morning?',
        [
          'Cloudy with light rain',
          'Sunny and hot',
          'Windy and cold',
          'Heavy snow',
        ],
      ),
      _q(
        'Berapa suhu tertinggi siang ini?',
        'What is the highest temperature this afternoon?',
        [
          'Twenty-four degrees',
          'Fourteen degrees',
          'Thirty-four degrees',
          'Twenty degrees',
        ],
      ),
      _q('Apa saran untuk malam hari?', 'What advice is given for tonight?', [
        'Take a jacket',
        'Bring an umbrella',
        'Stay indoors',
        'Drink more water',
      ]),
      _q(
        'Di mana hujan ringan turun pagi ini?',
        'Where is there light rain this morning?',
        ['In the north', 'In the south', 'In the city centre', 'Everywhere'],
      ),
      _q('Bagaimana cuaca besok?', 'What will the weather be like tomorrow?', [
        'Sunny all day',
        'Rainy all day',
        'Cloudy and cold',
        'Windy with storms',
      ]),
    ],
  ),
  _p(
    'en_b5',
    'Tur Museum',
    'Museum Tour',
    "Welcome to the City Museum. The tour lasts about forty-five minutes. We will start on the ground floor with the history of the city, then go upstairs to see paintings from the nineteenth century. Photos are allowed, but please do not use flash. The gift shop and the cafe are on the first floor, near the exit. Let's begin!",
    {
      'id':
          'Selamat datang di Museum Kota. Tur berlangsung sekitar 45 menit. Kita mulai di lantai dasar dengan sejarah kota, lalu naik untuk melihat lukisan abad ke-19. Boleh memotret, tapi jangan pakai lampu kilat. Toko suvenir dan kafe ada di lantai satu, dekat pintu keluar. Mari mulai!',
    },
    [
      _q('Berapa lama turnya?', 'How long does the tour last?', [
        'About forty-five minutes',
        'About fifteen minutes',
        'About two hours',
        'About ninety minutes',
      ]),
      _q(
        'Apa yang dilihat di lantai atas?',
        'What can visitors see upstairs?',
        [
          'Nineteenth-century paintings',
          'The history of the city',
          'Modern sculptures',
          'A film about the museum',
        ],
      ),
      _q('Apa yang tidak boleh dilakukan?', 'What is not allowed?', [
        'Using flash',
        'Taking photos',
        'Talking',
        'Buying gifts',
      ]),
      _q('Di mana tur dimulai?', 'Where does the tour start?', [
        'On the ground floor',
        'On the first floor',
        'In the gift shop',
        'In the cafe',
      ]),
      _q('Di mana toko suvenir berada?', 'Where is the gift shop?', [
        'On the first floor near the exit',
        'On the ground floor',
        'Next to the paintings',
        'Outside the museum',
      ]),
    ],
  ),
  _p(
    'en_b6',
    'Di Toko Sepatu',
    'At the Shoe Shop',
    "Customer: Excuse me, do you have these shoes in size forty-one? Assistant: Let me check... I'm sorry, we only have forty and forty-two in black, but we have forty-one in brown. Customer: Could I try the brown ones? Assistant: Of course. They are on sale this week, thirty percent off. Customer: Great, I'll take them.",
    {
      'id':
          'Pelanggan: Permisi, ada sepatu ini ukuran 41? Pramuniaga: Saya cek dulu... Maaf, hitam hanya ada 40 dan 42, tapi ukuran 41 ada yang cokelat. Pelanggan: Boleh saya coba yang cokelat? Pramuniaga: Tentu. Minggu ini sedang diskon 30 persen. Pelanggan: Bagus, saya ambil.',
    },
    [
      _q(
        'Ukuran apa yang diminta pelanggan?',
        'What size does the customer ask for?',
        ['Forty-one', 'Forty', 'Forty-two', 'Thirty-nine'],
      ),
      _q(
        'Warna apa yang tersedia di ukuran itu?',
        'Which color is available in that size?',
        ['Brown', 'Black', 'White', 'Blue'],
      ),
      _q('Berapa diskonnya?', 'How much is the discount?', [
        'Thirty percent',
        'Thirteen percent',
        'Fifty percent',
        'Twenty percent',
      ]),
      _q(
        'Ukuran apa yang tersedia untuk warna hitam?',
        'Which sizes are available in black?',
        [
          'Forty and forty-two',
          'Forty-one only',
          'Forty-one and forty-two',
          'Thirty-nine and forty',
        ],
      ),
      _q(
        'Apa keputusan pelanggan di akhir?',
        'What does the customer decide at the end?',
        [
          'To buy the brown shoes',
          'To come back next week',
          'To order online',
          'To buy the black shoes',
        ],
      ),
    ],
  ),
  _p(
    'en_b7',
    'Jadwal Kelas Bahasa',
    'Language Class Schedule',
    "Hi everyone, a quick update about our English class. Starting next week, we will meet on Mondays and Wednesdays instead of Tuesdays and Thursdays. The time stays the same, from six to seven thirty in the evening. Room two hundred and five is being painted, so we will use room three hundred and one on the third floor. Please bring your workbook to every class.",
    {
      'id':
          'Hai semua, kabar singkat soal kelas bahasa Inggris kita. Mulai minggu depan kita bertemu hari Senin dan Rabu, bukan Selasa dan Kamis. Waktunya tetap, pukul 18.00 sampai 19.30. Ruang 205 sedang dicat, jadi kita pakai ruang 301 di lantai tiga. Bawa buku latihan ke setiap kelas.',
    },
    [
      _q(
        'Hari apa kelas baru diadakan?',
        'On which days will the class meet now?',
        [
          'Mondays and Wednesdays',
          'Tuesdays and Thursdays',
          'Mondays and Fridays',
          'Wednesdays and Saturdays',
        ],
      ),
      _q('Kenapa ruang kelas pindah?', 'Why is the room changing?', [
        'Room 205 is being painted',
        'Room 205 is too small',
        'The teacher moved offices',
        'The building is closed',
      ]),
      _q('Ruang mana yang dipakai sekarang?', 'Which room will be used?', [
        'Room 301',
        'Room 205',
        'Room 105',
        'Room 310',
      ]),
      _q('Jam berapa kelas berlangsung?', 'What time is the class?', [
        'From six to seven thirty',
        'From five to six thirty',
        'From seven to eight',
        'From six to eight',
      ]),
      _q(
        'Apa yang harus dibawa ke setiap kelas?',
        'What should students bring to every class?',
        ['Their workbook', 'A laptop', 'A dictionary', 'Their ID card'],
      ),
    ],
  ),
  _p(
    'en_b8',
    'Resep Cepat',
    'Quick Recipe',
    "Today I'll show you a quick pasta. First, boil water with a little salt and cook the pasta for nine minutes. While it cooks, fry two cloves of garlic in olive oil for one minute. Add a can of tomatoes and let it simmer for five minutes. Mix the pasta with the sauce, add some basil, and serve with cheese on top.",
    {
      'id':
          'Hari ini saya tunjukkan pasta cepat. Pertama, rebus air dengan sedikit garam dan masak pasta selama sembilan menit. Sambil menunggu, goreng dua siung bawang putih dengan minyak zaitun selama satu menit. Tambahkan sekaleng tomat dan didihkan pelan lima menit. Campur pasta dengan saus, tambah kemangi, sajikan dengan keju di atasnya.',
    },
    [
      _q('Berapa lama pasta dimasak?', 'How long is the pasta cooked?', [
        'Nine minutes',
        'Five minutes',
        'One minute',
        'Nineteen minutes',
      ]),
      _q(
        'Apa yang digoreng dengan minyak zaitun?',
        'What is fried in olive oil?',
        ['Garlic', 'Onions', 'Tomatoes', 'Basil'],
      ),
      _q('Apa yang ditambahkan di akhir?', 'What is added at the end?', [
        'Basil and cheese',
        'Salt and pepper',
        'Cream and butter',
        'Mushrooms',
      ]),
      _q(
        'Berapa siung bawang putih yang dipakai?',
        'How many cloves of garlic are used?',
        ['Two', 'One', 'Three', 'Five'],
      ),
      _q(
        'Berapa lama saus tomat didihkan pelan?',
        'How long does the tomato sauce simmer?',
        ['Five minutes', 'Nine minutes', 'One minute', 'Fifteen minutes'],
      ),
    ],
  ),
  _p(
    'en_b9',
    'Pengumuman Sekolah',
    'School Announcement',
    "Good afternoon, students. The sports day on Friday has been moved to the following Monday because of the weather forecast. All classes will run as normal on Friday. Students who signed up for the running race should meet Ms. Carter at the gym at nine on Monday morning. Parents are welcome to watch from the main field after ten.",
    {
      'id':
          'Selamat siang, siswa-siswi. Hari olahraga hari Jumat dipindah ke Senin berikutnya karena ramalan cuaca. Semua kelas berjalan normal pada Jumat. Siswa yang mendaftar lomba lari harap menemui Bu Carter di gimnasium pukul sembilan Senin pagi. Orang tua dipersilakan menonton dari lapangan utama setelah pukul sepuluh.',
    },
    [
      _q('Kenapa hari olahraga dipindah?', 'Why was sports day moved?', [
        'Because of the weather forecast',
        'Because the field is closed',
        'Because of exams',
        'Because a teacher is sick',
      ]),
      _q('Kapan hari olahraga sekarang?', 'When is sports day now?', [
        'The following Monday',
        'This Friday',
        'Next Saturday',
        'Next Wednesday',
      ]),
      _q('Di mana pelari harus berkumpul?', 'Where should the runners meet?', [
        'At the gym',
        'At the main field',
        'At the library',
        'At the front gate',
      ]),
      _q(
        'Apa yang terjadi dengan kelas pada hari Jumat?',
        'What happens to classes on Friday?',
        [
          'They run as normal',
          'They are cancelled',
          'They finish early',
          'They move to the gym',
        ],
      ),
      _q('Kapan orang tua boleh menonton?', 'When can parents watch?', [
        'After ten on Monday',
        'Before nine on Monday',
        'On Friday afternoon',
        'All day Saturday',
      ]),
    ],
  ),
  _p(
    'en_b10',
    'Rencana Akhir Pekan',
    'Weekend Plans',
    "Tom: What are you doing this weekend? Mia: On Saturday I'm visiting my grandmother in the countryside. We'll probably go for a walk by the lake. Tom: Sounds relaxing. And Sunday? Mia: Sunday I have to study for my chemistry exam, but in the evening I'm going to the cinema with Sara. Do you want to join us? Tom: Sure, what time? Mia: The film starts at seven.",
    {
      'id':
          'Tom: Akhir pekan ini kamu ngapain? Mia: Sabtu aku mengunjungi nenek di desa. Kami mungkin jalan-jalan di tepi danau. Tom: Santai sekali. Minggu? Mia: Minggu aku harus belajar untuk ujian kimia, tapi malamnya nonton bioskop dengan Sara. Mau ikut? Tom: Boleh, jam berapa? Mia: Filmnya mulai jam tujuh.',
    },
    [
      _q('Apa yang Mia lakukan hari Sabtu?', 'What is Mia doing on Saturday?', [
        'Visiting her grandmother',
        'Studying chemistry',
        'Going to the cinema',
        'Working at a shop',
      ]),
      _q('Ujian apa yang Mia persiapkan?', 'Which exam is Mia studying for?', [
        'Chemistry',
        'History',
        'Biology',
        'English',
      ]),
      _q('Jam berapa filmnya mulai?', 'What time does the film start?', [
        'Seven',
        'Six',
        'Eight',
        'Nine',
      ]),
      _q(
        'Apa yang mungkin Mia lakukan bersama neneknya?',
        'What will Mia probably do with her grandmother?',
        [
          'Go for a walk by the lake',
          'Cook dinner',
          'Watch a film',
          'Go shopping',
        ],
      ),
      _q(
        'Dengan siapa Mia pergi ke bioskop?',
        'Who is Mia going to the cinema with?',
        ['Sara', 'Tom only', 'Her grandmother', 'Her chemistry teacher'],
      ),
    ],
  ),
];

// ---------------------------------------------------------------------------
// Inggris — TOEFL Listening (kuliah kampus & percakapan mahasiswa)
// ---------------------------------------------------------------------------
final List<ListeningPassage> _enToefl = [
  _p(
    'en_t1',
    'Kuliah: Lebah Madu',
    'Lecture: Honeybees',
    "Today we'll look at how honeybees communicate. When a worker bee finds flowers, it returns to the hive and performs what scientists call the waggle dance. The angle of the dance tells other bees the direction of the food relative to the sun, and the length of the dance indicates the distance. What's remarkable is that this system works inside a dark hive, so the bees rely on movement and vibration rather than sight. This discovery, made by Karl von Frisch, earned him a Nobel Prize in 1973.",
    {
      'id':
          'Hari ini kita membahas cara lebah madu berkomunikasi. Saat lebah pekerja menemukan bunga, ia kembali ke sarang dan melakukan tarian goyang. Sudut tarian menunjukkan arah makanan relatif terhadap matahari, dan lama tarian menunjukkan jarak. Yang luar biasa, sistem ini bekerja di dalam sarang yang gelap, jadi lebah mengandalkan gerakan dan getaran, bukan penglihatan. Penemuan Karl von Frisch ini membuahkan Nobel pada 1973.',
    },
    [
      _q(
        'Apa yang ditunjukkan sudut tarian?',
        'What does the angle of the dance indicate?',
        [
          'The direction of the food',
          'The type of flower',
          'The age of the bee',
          'The size of the hive',
        ],
      ),
      _q(
        'Mengapa lebah tidak mengandalkan penglihatan?',
        'Why do bees not rely on sight?',
        [
          'The hive is dark',
          'Bees are blind',
          'The dance is too fast',
          'Flowers have no color',
        ],
      ),
      _q(
        'Apa yang bisa disimpulkan tentang von Frisch?',
        'What can be inferred about von Frisch?',
        [
          'His work was highly recognized',
          'He disliked bees',
          'He worked alone in a hive',
          'He studied only flowers',
        ],
      ),
      _q(
        'Apa yang ditunjukkan lama tarian?',
        'What does the length of the dance indicate?',
        [
          'The distance to the food',
          'The direction of the food',
          'The number of flowers',
          'The time of day',
        ],
      ),
      _q(
        'Kapan von Frisch menerima Nobel?',
        'When did von Frisch receive the Nobel Prize?',
        ['In 1973', 'In 1937', 'In 1983', 'In 1953'],
      ),
    ],
  ),
  _p(
    'en_t2',
    'Percakapan: Perpustakaan',
    'Conversation: Library Desk',
    "Student: Hi, I'm trying to find articles for my psychology paper, but the database keeps asking for a password. Librarian: You need to log in with your student ID first. Are you on campus Wi-Fi? Student: No, I'm using my phone's data. Librarian: That's the issue. Off campus you have to go through the library website and click 'remote access'. Student: Oh, I see. And how many articles can I download? Librarian: There's no limit, but please cite them properly. Student: Great, thanks a lot.",
    {
      'id':
          'Mahasiswa: Hai, saya mencari artikel untuk makalah psikologi, tapi basis datanya terus meminta kata sandi. Pustakawan: Anda harus masuk dengan ID mahasiswa dulu. Pakai Wi-Fi kampus? Mahasiswa: Tidak, pakai data ponsel. Pustakawan: Itu masalahnya. Dari luar kampus harus lewat situs perpustakaan dan klik "akses jarak jauh". Mahasiswa: Oh, begitu. Berapa artikel yang boleh diunduh? Pustakawan: Tidak ada batas, tapi kutip dengan benar. Mahasiswa: Bagus, terima kasih.',
    },
    [
      _q('Apa masalah mahasiswa itu?', "What is the student's problem?", [
        'The database asks for a password',
        'The library is closed',
        'The articles are in another language',
        'Her ID card is lost',
      ]),
      _q('Apa penyebab masalahnya?', 'What causes the problem?', [
        'She is not on campus Wi-Fi',
        'She forgot her password',
        'Her account expired',
        'The website is down',
      ]),
      _q(
        'Apa yang diminta pustakawan?',
        'What does the librarian ask her to do?',
        [
          'Cite the articles properly',
          'Pay a small fee',
          'Download fewer articles',
          'Come back tomorrow',
        ],
      ),
      _q(
        'Untuk mata kuliah apa mahasiswa mencari artikel?',
        'What subject is the student writing a paper for?',
        ['Psychology', 'Biology', 'History', 'Economics'],
      ),
      _q(
        'Berapa artikel yang boleh diunduh?',
        'How many articles can the student download?',
        ['There is no limit', 'Ten per day', 'Five per week', 'Only one'],
      ),
    ],
  ),
  _p(
    'en_t3',
    'Kuliah: Kota Romawi',
    'Lecture: Roman Cities',
    "Roman engineers planned their cities around two main streets that crossed at the center, creating a grid. This design was practical: soldiers could move quickly, and water and waste systems were easier to build. Public baths, markets, and temples were placed near the center so everyone could reach them. Interestingly, many modern European cities still follow these ancient street patterns, which is why some old towns feel so orderly today.",
    {
      'id':
          'Insinyur Romawi merencanakan kota di sekitar dua jalan utama yang bersilangan di pusat, membentuk kisi. Rancangan ini praktis: tentara bisa bergerak cepat, dan sistem air serta limbah lebih mudah dibangun. Pemandian umum, pasar, dan kuil ditempatkan dekat pusat agar semua bisa mencapainya. Menariknya, banyak kota Eropa modern masih mengikuti pola jalan kuno ini, itulah mengapa beberapa kota tua terasa begitu teratur.',
    },
    [
      _q('Apa ide utama kuliah ini?', 'What is the main idea of the lecture?', [
        'Roman city planning was practical and lasting',
        'Roman soldiers built temples',
        'Modern cities reject Roman ideas',
        'Roman baths were expensive',
      ]),
      _q(
        'Mengapa fasilitas umum ditempatkan di pusat?',
        'Why were public buildings placed near the center?',
        [
          'So everyone could reach them',
          'To protect them from floods',
          'Because land was cheaper',
          'To hide them from enemies',
        ],
      ),
      _q(
        'Apa yang dikatakan tentang kota Eropa modern?',
        'What is said about modern European cities?',
        [
          'Many still follow Roman street patterns',
          'They were all rebuilt',
          'They have no grids',
          'They are less orderly than Roman ones',
        ],
      ),
      _q(
        'Berapa jalan utama yang bersilangan di pusat kota?',
        'How many main streets crossed at the centre?',
        ['Two', 'Four', 'One', 'Three'],
      ),
      _q(
        'Mengapa rancangan kisi praktis bagi tentara?',
        'Why was the grid practical for soldiers?',
        [
          'They could move quickly',
          'They could hide easily',
          'They could build temples',
          'They could grow food',
        ],
      ),
    ],
  ),
  _p(
    'en_t4',
    'Percakapan: Jam Kantor Dosen',
    'Conversation: Office Hours',
    "Professor: Come in. What can I help you with? Student: I wanted to ask about the research project. I'm interested in renewable energy, but I'm not sure the topic is narrow enough. Professor: That's a good instinct. Renewable energy is huge. Could you focus on one technology in one region? Student: Maybe solar power in small island communities? Professor: Excellent. That gives you clear data to compare. Send me an outline by Friday and we'll refine it together.",
    {
      'id':
          'Dosen: Masuk. Ada yang bisa dibantu? Mahasiswa: Saya mau bertanya soal proyek penelitian. Saya tertarik energi terbarukan, tapi tidak yakin topiknya cukup sempit. Dosen: Naluri yang bagus. Energi terbarukan sangat luas. Bisa fokus ke satu teknologi di satu wilayah? Mahasiswa: Mungkin tenaga surya di komunitas pulau kecil? Dosen: Bagus sekali. Datanya jelas untuk dibandingkan. Kirim kerangka sebelum Jumat, kita perbaiki bersama.',
    },
    [
      _q('Apa kekhawatiran mahasiswa?', "What is the student's concern?", [
        'The topic may be too broad',
        'The deadline is too soon',
        'The professor is too busy',
        'The data is unavailable',
      ]),
      _q(
        'Topik apa yang akhirnya disarankan?',
        'What topic is finally suggested?',
        [
          'Solar power in small island communities',
          'Wind power in Europe',
          'Nuclear energy policy',
          'Electric cars in cities',
        ],
      ),
      _q(
        'Apa yang harus dikirim sebelum Jumat?',
        'What must be sent by Friday?',
        ['An outline', 'The final paper', 'A list of books', 'A survey'],
      ),
      _q(
        'Topik luas apa yang diminati mahasiswa?',
        'What broad topic is the student interested in?',
        [
          'Renewable energy',
          'Ocean pollution',
          'Urban planning',
          'Space travel',
        ],
      ),
      _q(
        'Apa yang akan dilakukan dosen dengan kerangka itu?',
        'What will the professor do with the outline?',
        [
          'Refine it together with the student',
          'Grade it immediately',
          'Send it to a journal',
          'Reject it',
        ],
      ),
    ],
  ),
  _p(
    'en_t5',
    'Kuliah: Tidur dan Ingatan',
    'Lecture: Sleep and Memory',
    "Let's talk about why sleep matters for learning. During deep sleep, the brain replays the day's experiences and strengthens the connections between neurons. In one study, students who slept eight hours after studying remembered about forty percent more than those who stayed awake. Naps help too, but only if they last long enough to reach deep sleep, usually more than an hour. So the advice is simple: cramming all night before an exam actually works against you.",
    {
      'id':
          'Mari bahas mengapa tidur penting untuk belajar. Saat tidur lelap, otak memutar ulang pengalaman hari itu dan memperkuat hubungan antar neuron. Dalam satu penelitian, mahasiswa yang tidur delapan jam setelah belajar mengingat sekitar 40 persen lebih banyak daripada yang begadang. Tidur siang juga membantu, tapi hanya jika cukup lama untuk mencapai tidur lelap, biasanya lebih dari satu jam. Jadi sarannya sederhana: belajar semalaman sebelum ujian justru merugikan.',
    },
    [
      _q(
        'Apa yang terjadi selama tidur lelap?',
        'What happens during deep sleep?',
        [
          'The brain strengthens neural connections',
          'The brain stops working',
          'Memories are deleted',
          'The heart rate rises sharply',
        ],
      ),
      _q(
        'Berapa peningkatan ingatan dalam penelitian itu?',
        'How much more did the sleeping students remember?',
        [
          'About forty percent',
          'About fourteen percent',
          'About four percent',
          'About eighty percent',
        ],
      ),
      _q(
        'Apa sikap pembicara terhadap belajar semalaman?',
        "What is the speaker's attitude toward all-night cramming?",
        [
          'It is counterproductive',
          'It is the best method',
          'It works for some subjects',
          'It has no effect',
        ],
      ),
      _q(
        'Berapa jam mahasiswa tidur dalam penelitian itu?',
        'How many hours did the students sleep in the study?',
        ['Eight hours', 'Six hours', 'Four hours', 'Ten hours'],
      ),
      _q(
        'Berapa lama tidur siang agar bermanfaat?',
        'How long should a nap last to be helpful?',
        [
          'More than an hour',
          'About ten minutes',
          'Exactly thirty minutes',
          'Less than twenty minutes',
        ],
      ),
    ],
  ),
  _p(
    'en_t6',
    'Percakapan: Pendaftaran Kelas',
    'Conversation: Registration',
    "Student: I'm trying to register for Biology 210, but the system says the class is full. Advisor: You can join the waiting list. Usually two or three spots open in the first week when students change their schedules. Student: What if I don't get in? I need it to graduate. Advisor: Then take Biology 215 instead; it counts for the same requirement and still has seats. Student: I didn't know that. I'll register for 215 as a backup.",
    {
      'id':
          'Mahasiswa: Saya mau mendaftar Biologi 210, tapi sistem bilang kelasnya penuh. Penasihat: Kamu bisa masuk daftar tunggu. Biasanya dua atau tiga kursi terbuka di minggu pertama saat mahasiswa mengubah jadwal. Mahasiswa: Kalau tidak dapat? Saya butuh ini untuk lulus. Penasihat: Ambil Biologi 215; nilainya dihitung untuk syarat yang sama dan masih ada kursi. Mahasiswa: Saya tidak tahu itu. Saya daftar 215 sebagai cadangan.',
    },
    [
      _q(
        'Mengapa mahasiswa tidak bisa mendaftar?',
        "Why can't the student register?",
        [
          'The class is full',
          'He missed the deadline',
          'He has not paid tuition',
          'The class was canceled',
        ],
      ),
      _q('Kapan biasanya kursi terbuka?', 'When do spots usually open?', [
        'In the first week',
        'At the end of the semester',
        'During exams',
        'Never',
      ]),
      _q('Apa yang disarankan penasihat?', 'What does the advisor suggest?', [
        'Taking Biology 215 as an alternative',
        'Waiting until next year',
        'Emailing the professor',
        'Dropping the major',
      ]),
      _q(
        'Berapa kursi yang biasanya terbuka?',
        'How many spots usually open up?',
        ['Two or three', 'Ten or more', 'Only one', 'None'],
      ),
      _q(
        'Mengapa mahasiswa membutuhkan kelas itu?',
        'Why does the student need the class?',
        [
          'To graduate',
          'To get a scholarship',
          'To join a club',
          'To study abroad',
        ],
      ),
    ],
  ),
  _p(
    'en_t7',
    'Kuliah: Plastik di Laut',
    'Lecture: Ocean Plastics',
    "Every year, about eight million tons of plastic enter the oceans. Much of it breaks into tiny pieces called microplastics, which fish and birds mistake for food. Researchers have found microplastics in the deepest ocean trench and even in Arctic ice. Cleaning the surface helps, but the real solution is upstream: better waste collection in coastal cities and less single-use packaging. Some countries have already cut plastic bag use by more than eighty percent with simple fees.",
    {
      'id':
          'Setiap tahun sekitar delapan juta ton plastik masuk ke laut. Sebagian besar pecah menjadi potongan kecil bernama mikroplastik yang disalahartikan sebagai makanan oleh ikan dan burung. Peneliti menemukan mikroplastik di palung terdalam dan bahkan di es Arktik. Membersihkan permukaan membantu, tapi solusi sesungguhnya ada di hulu: pengumpulan sampah yang lebih baik di kota pesisir dan lebih sedikit kemasan sekali pakai. Beberapa negara sudah memangkas penggunaan kantong plastik lebih dari 80 persen dengan biaya sederhana.',
    },
    [
      _q(
        'Apa itu mikroplastik menurut kuliah?',
        'What are microplastics according to the lecture?',
        [
          'Tiny pieces of broken plastic',
          'A new type of fish food',
          'Plastic made from algae',
          'Recycled bottles',
        ],
      ),
      _q(
        'Apa solusi utama yang disebut pembicara?',
        'What does the speaker say is the real solution?',
        [
          'Reducing waste at the source',
          'Cleaning the ocean surface',
          'Banning fishing',
          'Melting Arctic ice',
        ],
      ),
      _q(
        'Apa yang dicapai beberapa negara dengan biaya sederhana?',
        'What have some countries achieved with simple fees?',
        [
          'A large drop in plastic bag use',
          'Cleaner beaches only',
          'Higher fish prices',
          'More recycling factories',
        ],
      ),
      _q(
        'Berapa ton plastik masuk ke laut setiap tahun?',
        'How much plastic enters the oceans each year?',
        [
          'About eight million tons',
          'About eighty million tons',
          'About eight thousand tons',
          'About eight hundred tons',
        ],
      ),
      _q(
        'Di mana mikroplastik ditemukan?',
        'Where have microplastics been found?',
        [
          'In the deepest ocean trench and Arctic ice',
          'Only on beaches',
          'Only in rivers',
          'In the desert',
        ],
      ),
    ],
  ),
  _p(
    'en_t8',
    'Percakapan: Kelompok Belajar',
    'Conversation: Study Group',
    "Lena: Are you joining the study group for the statistics midterm? Raj: I want to, but it meets Thursday night and I have work. Lena: We could record the session and share the notes. Raj: That would help, but I learn better when I can ask questions. Lena: Then let's meet Sunday afternoon instead. I'll ask the others. Raj: Perfect. I'll bring the practice problems from chapter six.",
    {
      'id':
          'Lena: Kamu ikut kelompok belajar untuk ujian tengah semester statistik? Raj: Mau, tapi jadwalnya Kamis malam dan aku kerja. Lena: Kita bisa rekam sesinya dan bagikan catatan. Raj: Membantu, tapi aku lebih paham kalau bisa bertanya. Lena: Kalau begitu kita bertemu Minggu siang. Aku tanya yang lain. Raj: Sempurna. Aku bawa soal latihan bab enam.',
    },
    [
      _q(
        'Mengapa Raj tidak bisa datang Kamis?',
        "Why can't Raj come on Thursday?",
        [
          'He has work',
          'He has another class',
          'He is traveling',
          'He is sick',
        ],
      ),
      _q(
        'Mengapa Raj kurang suka rekaman?',
        'Why does Raj prefer not to rely on a recording?',
        [
          'He learns better by asking questions',
          'His internet is slow',
          'He dislikes videos',
          'He cannot read notes',
        ],
      ),
      _q('Apa yang akan dibawa Raj?', 'What will Raj bring?', [
        'Practice problems from chapter six',
        'Snacks for everyone',
        'A projector',
        'The exam answers',
      ]),
      _q(
        'Ujian apa yang mereka persiapkan?',
        'Which exam are they preparing for?',
        [
          'The statistics midterm',
          'The chemistry final',
          'The history quiz',
          'The English essay',
        ],
      ),
      _q('Kapan mereka akhirnya bertemu?', 'When will they finally meet?', [
        'Sunday afternoon',
        'Thursday night',
        'Saturday morning',
        'Monday evening',
      ]),
    ],
  ),
  _p(
    'en_t9',
    'Kuliah: Bahasa yang Terancam',
    'Lecture: Endangered Languages',
    "Linguists estimate that of the roughly seven thousand languages spoken today, nearly half may disappear by the end of this century. A language dies when children stop learning it, usually because a dominant language offers better jobs and schooling. Yet each language carries unique knowledge, such as names for local plants and medicines. Communities are now recording elders, creating apps, and teaching in schools. In New Zealand, such efforts helped Maori speakers grow again after decades of decline.",
    {
      'id':
          'Ahli bahasa memperkirakan dari sekitar tujuh ribu bahasa yang dipakai saat ini, hampir separuhnya bisa hilang pada akhir abad ini. Bahasa mati ketika anak-anak berhenti mempelajarinya, biasanya karena bahasa dominan menawarkan pekerjaan dan sekolah yang lebih baik. Namun tiap bahasa membawa pengetahuan unik, seperti nama tumbuhan dan obat lokal. Komunitas kini merekam para tetua, membuat aplikasi, dan mengajar di sekolah. Di Selandia Baru, upaya itu membantu penutur Maori bertambah lagi setelah puluhan tahun menurun.',
    },
    [
      _q(
        'Berapa bahasa yang mungkin hilang?',
        'How many languages may disappear?',
        [
          'Nearly half of about seven thousand',
          'About seven hundred',
          'Almost all of them',
          'Fewer than one hundred',
        ],
      ),
      _q(
        'Kapan sebuah bahasa dikatakan mati?',
        'When does a language die, according to the lecture?',
        [
          'When children stop learning it',
          'When it has no writing system',
          'When it is not on the internet',
          'When elders move away',
        ],
      ),
      _q(
        'Apa yang ditunjukkan contoh Maori?',
        'What does the Maori example show?',
        [
          'Decline can be reversed',
          'Apps are useless',
          'Only schools matter',
          'New Zealand has one language',
        ],
      ),
      _q(
        'Berapa perkiraan jumlah bahasa saat ini?',
        'About how many languages are spoken today?',
        [
          'About seven thousand',
          'About seventy thousand',
          'About seven hundred',
          'About seventy',
        ],
      ),
      _q(
        'Pengetahuan unik apa yang dibawa tiap bahasa?',
        'What unique knowledge does each language carry?',
        [
          'Names for local plants and medicines',
          'Modern technology terms',
          'International trade rules',
          'Sports vocabulary',
        ],
      ),
    ],
  ),
  _p(
    'en_t10',
    'Percakapan: Magang Musim Panas',
    'Conversation: Summer Internship',
    "Advisor: Congratulations on the internship offer. Have you decided? Student: Not yet. The company is great, but it's unpaid, and I'd have to move to another city for three months. Advisor: Have you checked the department's travel grant? It covers housing for unpaid internships related to your major. Student: I didn't know that existed. Advisor: The deadline is next Monday, so apply this week. Student: I will. That changes everything.",
    {
      'id':
          'Penasihat: Selamat atas tawaran magangnya. Sudah memutuskan? Mahasiswa: Belum. Perusahaannya bagus, tapi tanpa gaji, dan saya harus pindah kota selama tiga bulan. Penasihat: Sudah cek hibah perjalanan jurusan? Itu menanggung tempat tinggal untuk magang tanpa gaji yang sesuai jurusan. Mahasiswa: Saya tidak tahu itu ada. Penasihat: Tenggatnya Senin depan, jadi daftar minggu ini. Mahasiswa: Baik. Ini mengubah segalanya.',
    },
    [
      _q('Apa keraguan mahasiswa?', "What is the student's hesitation?", [
        'The internship is unpaid and in another city',
        'The company is too small',
        'The work is boring',
        'The internship is too short',
      ]),
      _q('Apa yang ditanggung hibah itu?', 'What does the grant cover?', [
        'Housing for unpaid internships',
        'Tuition fees',
        'A new laptop',
        'Food expenses only',
      ]),
      _q('Kapan tenggat hibahnya?', 'When is the grant deadline?', [
        'Next Monday',
        'Tomorrow',
        'Next month',
        'The end of summer',
      ]),
      _q('Berapa lama magangnya?', 'How long is the internship?', [
        'Three months',
        'Three weeks',
        'Six months',
        'One year',
      ]),
      _q(
        'Apa syarat hibah perjalanan itu?',
        'What is the condition for the travel grant?',
        [
          'The internship must relate to the major',
          'The student must be paid',
          'The company must be local',
          'The student must graduate first',
        ],
      ),
    ],
  ),
];

// ---------------------------------------------------------------------------
// Inggris — IELTS Listening (situasi sehari-hari & monolog)
// ---------------------------------------------------------------------------
final List<ListeningPassage> _enIelts = [
  _p(
    'en_i1',
    'Mendaftar Gym',
    'Joining a Gym',
    "Receptionist: Welcome to Riverside Fitness. Are you interested in a membership? Customer: Yes, mainly for swimming. Receptionist: The pool-only membership is twenty-five pounds a month, and the full membership with classes is forty. Customer: Is there a joining fee? Receptionist: Normally fifteen pounds, but it's waived if you sign up before the thirtieth. The pool opens at six thirty on weekdays and eight at weekends. Customer: I'll take the pool membership, please.",
    {
      'id':
          'Resepsionis: Selamat datang di Riverside Fitness. Tertarik jadi anggota? Pelanggan: Ya, terutama untuk berenang. Resepsionis: Keanggotaan kolam saja 25 pound per bulan, dan keanggotaan penuh dengan kelas 40 pound. Pelanggan: Ada biaya pendaftaran? Resepsionis: Biasanya 15 pound, tapi gratis kalau mendaftar sebelum tanggal 30. Kolam buka 06.30 hari kerja dan 08.00 akhir pekan. Pelanggan: Saya ambil keanggotaan kolam.',
    },
    [
      _q(
        'Berapa biaya keanggotaan kolam per bulan?',
        'How much is the pool-only membership per month?',
        [
          'Twenty-five pounds',
          'Forty pounds',
          'Fifteen pounds',
          'Thirty pounds',
        ],
      ),
      _q(
        'Kapan biaya pendaftaran dibebaskan?',
        'When is the joining fee waived?',
        [
          'If you sign up before the thirtieth',
          'If you pay yearly',
          'If you bring a friend',
          'If you are a student',
        ],
      ),
      _q(
        'Jam berapa kolam buka di akhir pekan?',
        'What time does the pool open at weekends?',
        ['Eight', 'Six thirty', 'Seven', 'Nine'],
      ),
      _q(
        'Untuk apa pelanggan ingin jadi anggota?',
        'Why does the customer want a membership?',
        [
          'Mainly for swimming',
          'For yoga classes',
          'For weight training',
          'For running',
        ],
      ),
      _q(
        'Berapa biaya pendaftaran normalnya?',
        'How much is the joining fee normally?',
        ['Fifteen pounds', 'Twenty-five pounds', 'Forty pounds', 'Five pounds'],
      ),
    ],
  ),
  _p(
    'en_i2',
    'Tur Kampus',
    'Campus Tour',
    "Good morning and welcome to the university. We'll begin at the main library, which is open twenty-four hours during term time. Next, we'll walk to the student union, where you can find the health centre on the ground floor and the careers office on the second. After that, we'll visit the accommodation blocks. Lunch will be provided in the dining hall at twelve thirty, and the tour ends at two with a question-and-answer session in the lecture theatre.",
    {
      'id':
          'Selamat pagi dan selamat datang di universitas. Kita mulai di perpustakaan utama yang buka 24 jam selama masa kuliah. Lalu kita berjalan ke gedung serikat mahasiswa, tempat pusat kesehatan di lantai dasar dan kantor karier di lantai dua. Setelah itu kita mengunjungi blok asrama. Makan siang disediakan di aula makan pukul 12.30, dan tur berakhir pukul dua dengan sesi tanya jawab di ruang kuliah.',
    },
    [
      _q(
        'Berapa lama perpustakaan buka saat masa kuliah?',
        'How long is the library open during term time?',
        [
          'Twenty-four hours',
          'Until midnight',
          'Nine to five',
          'Until eight in the evening',
        ],
      ),
      _q(
        'Di lantai mana kantor karier berada?',
        'On which floor is the careers office?',
        [
          'The second floor',
          'The ground floor',
          'The first floor',
          'The third floor',
        ],
      ),
      _q('Bagaimana tur berakhir?', 'How does the tour end?', [
        'With a question-and-answer session',
        'With lunch',
        'With a library visit',
        'With a bus ride',
      ]),
      _q('Di mana pusat kesehatan berada?', 'Where is the health centre?', [
        'On the ground floor of the student union',
        'In the library',
        'In the accommodation blocks',
        'In the lecture theatre',
      ]),
      _q('Jam berapa makan siang disediakan?', 'What time is lunch provided?', [
        'Twelve thirty',
        'Twelve',
        'One thirty',
        'Two',
      ]),
    ],
  ),
  _p(
    'en_i3',
    'Menyewa Apartemen',
    'Renting a Flat',
    "Agent: The flat has two bedrooms and a small balcony facing the park. Tenant: What's the rent? Agent: Nine hundred and fifty a month, which includes water but not electricity or internet. Tenant: And the deposit? Agent: One month's rent, returned when you leave if there's no damage. The minimum contract is twelve months. Tenant: Is it close to public transport? Agent: The tram stop is a two-minute walk, and the station is about ten minutes away.",
    {
      'id':
          'Agen: Apartemennya dua kamar tidur dan balkon kecil menghadap taman. Penyewa: Berapa sewanya? Agen: 950 per bulan, termasuk air tapi tidak termasuk listrik atau internet. Penyewa: Depositnya? Agen: Satu bulan sewa, dikembalikan saat pindah kalau tidak ada kerusakan. Kontrak minimal dua belas bulan. Penyewa: Dekat transportasi umum? Agen: Halte trem dua menit jalan kaki, stasiun sekitar sepuluh menit.',
    },
    [
      _q('Apa yang termasuk dalam sewa?', 'What is included in the rent?', [
        'Water',
        'Electricity',
        'Internet',
        'Parking',
      ]),
      _q('Berapa besar depositnya?', 'How much is the deposit?', [
        "One month's rent",
        "Two months' rent",
        'Nine hundred and fifty pounds a year',
        'There is no deposit',
      ]),
      _q('Berapa jauh halte trem?', 'How far is the tram stop?', [
        'A two-minute walk',
        'A ten-minute walk',
        'A twenty-minute walk',
        'Next to the station',
      ]),
      _q(
        'Berapa kamar tidur apartemennya?',
        'How many bedrooms does the flat have?',
        ['Two', 'One', 'Three', 'Four'],
      ),
      _q(
        'Berapa lama kontrak minimal?',
        'What is the minimum contract length?',
        ['Twelve months', 'Six months', 'Three months', 'Twenty-four months'],
      ),
    ],
  ),
  _p(
    'en_i4',
    'Monolog: Taman Nasional',
    'Monologue: National Park',
    "Before you set off on the trail, a few reminders. The full loop is twelve kilometres and takes about four hours. There is no drinking water after the first checkpoint, so carry at least two litres per person. Stay on the marked paths; the cliffs on the western side are unstable. If you see a red flag at the entrance, the trail is closed due to weather. Rangers are on duty until six, and the emergency number is printed on your map.",
    {
      'id':
          'Sebelum mulai mendaki, beberapa pengingat. Jalur lengkapnya dua belas kilometer dan memakan sekitar empat jam. Tidak ada air minum setelah pos pertama, jadi bawa minimal dua liter per orang. Tetap di jalur bertanda; tebing di sisi barat tidak stabil. Kalau ada bendera merah di pintu masuk, jalur ditutup karena cuaca. Penjaga bertugas sampai pukul enam, dan nomor darurat tercetak di peta Anda.',
    },
    [
      _q('Berapa panjang jalur lengkap?', 'How long is the full loop?', [
        'Twelve kilometres',
        'Twenty kilometres',
        'Four kilometres',
        'Two kilometres',
      ]),
      _q(
        'Mengapa pendaki harus membawa air?',
        'Why should hikers carry water?',
        [
          'There is no water after the first checkpoint',
          'The shop is expensive',
          'The river is polluted',
          'It is very hot all year',
        ],
      ),
      _q('Apa arti bendera merah?', 'What does a red flag mean?', [
        'The trail is closed due to weather',
        'Rangers are on duty',
        'Swimming is allowed',
        'A guided tour is starting',
      ]),
      _q(
        'Berapa lama jalur lengkap ditempuh?',
        'How long does the full loop take?',
        [
          'About four hours',
          'About two hours',
          'About twelve hours',
          'About one hour',
        ],
      ),
      _q(
        'Mengapa harus tetap di jalur bertanda?',
        'Why should hikers stay on the marked paths?',
        [
          'The cliffs on the western side are unstable',
          'There are wild animals',
          'The grass is protected',
          'It is easy to get lost',
        ],
      ),
    ],
  ),
  _p(
    'en_i5',
    'Keluhan Pelanggan',
    'Customer Complaint',
    "Customer: I ordered a blue jacket in medium online, but a large one arrived, and it's grey. Assistant: I'm sorry about that. Do you have the order number? Customer: Yes, it's five-seven-two-nine. Assistant: Thank you. I can send the correct jacket today, and you can return the wrong one with the prepaid label in the box. Customer: How long will delivery take? Assistant: Two working days, and we'll add a ten percent voucher for your next order.",
    {
      'id':
          'Pelanggan: Saya memesan jaket biru ukuran M lewat daring, tapi yang datang ukuran L dan warnanya abu-abu. Petugas: Mohon maaf. Ada nomor pesanannya? Pelanggan: Ya, 5729. Petugas: Terima kasih. Saya bisa kirim jaket yang benar hari ini, dan yang salah bisa dikembalikan dengan label prabayar di kotak. Pelanggan: Berapa lama pengirimannya? Petugas: Dua hari kerja, dan kami tambahkan voucher 10 persen untuk pesanan berikutnya.',
    },
    [
      _q('Apa yang salah dengan pesanan?', 'What was wrong with the order?', [
        'Wrong size and colour',
        'It never arrived',
        'It was damaged',
        'It was too expensive',
      ]),
      _q('Berapa nomor pesanannya?', 'What is the order number?', [
        '5729',
        '5279',
        '7529',
        '2957',
      ]),
      _q('Apa kompensasi yang ditawarkan?', 'What compensation is offered?', [
        'A ten percent voucher',
        'A full refund',
        'A free jacket',
        'Free membership',
      ]),
      _q(
        'Warna apa yang dipesan pelanggan?',
        'What colour did the customer order?',
        ['Blue', 'Grey', 'Black', 'Green'],
      ),
      _q(
        'Bagaimana cara mengembalikan jaket yang salah?',
        'How can the wrong jacket be returned?',
        [
          'With the prepaid label in the box',
          'By bringing it to the shop',
          'By paying for postage',
          'It cannot be returned',
        ],
      ),
    ],
  ),
  _p(
    'en_i6',
    'Monolog: Sejarah Sepeda',
    'Monologue: History of the Bicycle',
    "The first bicycles appeared in the early nineteenth century and had no pedals; riders pushed themselves along with their feet. Pedals were added in the eighteen sixties, and the famous high-wheel design followed, which was fast but dangerous. The modern safety bicycle, with two equal wheels and a chain, arrived in the eighteen eighties and quickly became popular with women as well as men, changing how people travelled to work and spent their free time.",
    {
      'id':
          'Sepeda pertama muncul di awal abad ke-19 dan tidak punya pedal; pengendara mendorong dengan kaki. Pedal ditambahkan pada tahun 1860-an, lalu muncul desain roda tinggi yang cepat tapi berbahaya. Sepeda aman modern, dengan dua roda sama besar dan rantai, hadir pada 1880-an dan cepat populer di kalangan perempuan maupun laki-laki, mengubah cara orang bepergian ke tempat kerja dan mengisi waktu luang.',
    },
    [
      _q(
        'Bagaimana sepeda pertama digerakkan?',
        'How were the first bicycles moved?',
        [
          'Riders pushed with their feet',
          'With pedals',
          'With a small engine',
          'By being pulled by horses',
        ],
      ),
      _q(
        'Apa masalah desain roda tinggi?',
        'What was the problem with the high-wheel design?',
        [
          'It was dangerous',
          'It was too slow',
          'It was too heavy',
          'It was too cheap',
        ],
      ),
      _q(
        'Kapan sepeda aman modern muncul?',
        'When did the modern safety bicycle appear?',
        ['In the 1880s', 'In the 1860s', 'In the early 1800s', 'In the 1920s'],
      ),
      _q('Kapan pedal ditambahkan?', 'When were pedals added?', [
        'In the 1860s',
        'In the 1880s',
        'In the early 1800s',
        'In the 1900s',
      ]),
      _q(
        'Apa ciri sepeda aman modern?',
        'What are the features of the modern safety bicycle?',
        [
          'Two equal wheels and a chain',
          'One large front wheel',
          'No pedals',
          'A small engine',
        ],
      ),
    ],
  ),
  _p(
    'en_i7',
    'Memesan Meja Restoran',
    'Booking a Restaurant Table',
    "Staff: Good evening, Olive Garden Bistro. Caller: Hi, I'd like to book a table for six on Saturday. Staff: Certainly. What time? Caller: Around seven thirty. Staff: I'm afraid seven thirty is full, but I have seven or eight fifteen. Caller: Eight fifteen is fine. One of us is vegetarian. Staff: No problem, we have several vegetarian dishes. Can I take a name and phone number? Caller: It's Harris, and the number is oh-seven-seven-one, two-two-eight, nine-nine-four.",
    {
      'id':
          'Staf: Selamat malam, Olive Garden Bistro. Penelepon: Hai, saya mau pesan meja untuk enam orang hari Sabtu. Staf: Tentu. Jam berapa? Penelepon: Sekitar 19.30. Staf: Sayangnya 19.30 penuh, tapi ada pukul 19.00 atau 20.15. Penelepon: 20.15 boleh. Salah satu dari kami vegetarian. Staf: Tidak masalah, kami punya beberapa hidangan vegetarian. Boleh minta nama dan nomor telepon? Penelepon: Harris, nomornya 0771 228 994.',
    },
    [
      _q('Untuk berapa orang mejanya?', 'How many people is the table for?', [
        'Six',
        'Seven',
        'Eight',
        'Four',
      ]),
      _q(
        'Jam berapa reservasi akhirnya?',
        'What time is the booking finally made for?',
        ['Eight fifteen', 'Seven thirty', 'Seven', 'Eight thirty'],
      ),
      _q('Apa nama pemesan?', "What is the caller's name?", [
        'Harris',
        'Harrison',
        'Morris',
        'Paris',
      ]),
      _q('Hari apa reservasinya?', 'On which day is the booking?', [
        'Saturday',
        'Friday',
        'Sunday',
        'Thursday',
      ]),
      _q(
        'Apa permintaan khusus penelepon?',
        'What special request does the caller make?',
        [
          'One guest is vegetarian',
          'A table by the window',
          'A birthday cake',
          'A high chair',
        ],
      ),
    ],
  ),
  _p(
    'en_i8',
    'Monolog: Daur Ulang Kota',
    'Monologue: Recycling in Town',
    "From the first of March, the council is changing how rubbish is collected. Paper and cardboard go in the blue bin, glass and cans in the green box, and food waste in the small brown caddy. General waste will now be collected every two weeks instead of weekly, so please recycle as much as possible. Large items such as sofas can be collected for free if you book online at least five days in advance.",
    {
      'id':
          'Mulai 1 Maret, dewan kota mengubah cara pengumpulan sampah. Kertas dan kardus ke tong biru, kaca dan kaleng ke kotak hijau, sampah makanan ke wadah kecil cokelat. Sampah umum kini diangkut tiap dua minggu, bukan mingguan, jadi daur ulanglah sebanyak mungkin. Barang besar seperti sofa bisa diangkut gratis kalau dipesan daring minimal lima hari sebelumnya.',
    },
    [
      _q('Ke mana kaca dan kaleng dibuang?', 'Where do glass and cans go?', [
        'The green box',
        'The blue bin',
        'The brown caddy',
        'The general waste bin',
      ]),
      _q(
        'Seberapa sering sampah umum diangkut sekarang?',
        'How often is general waste collected now?',
        ['Every two weeks', 'Every week', 'Every day', 'Once a month'],
      ),
      _q(
        'Bagaimana cara membuang sofa lama?',
        'How can residents dispose of an old sofa?',
        [
          'Book a free collection online in advance',
          'Leave it by the road',
          'Pay at the recycling centre',
          'Put it in the blue bin',
        ],
      ),
      _q('Kapan perubahan mulai berlaku?', 'When does the change begin?', [
        'The first of March',
        'The first of May',
        'The third of March',
        'Next year',
      ]),
      _q('Ke mana sampah makanan dibuang?', 'Where does food waste go?', [
        'The small brown caddy',
        'The blue bin',
        'The green box',
        'The general waste bin',
      ]),
    ],
  ),
  _p(
    'en_i9',
    'Wawancara Kerja Paruh Waktu',
    'Part-time Job Interview',
    "Manager: Thanks for coming in. The role is weekend shifts at the bookshop, Saturday and Sunday, ten till four. Applicant: That suits me; I study during the week. Manager: You'd be on the till, helping customers, and unpacking deliveries on Saturday mornings. The pay is eleven fifty an hour, and staff get twenty percent off books. Applicant: When would I start? Manager: Training is next Saturday, and your first proper shift is the week after.",
    {
      'id':
          'Manajer: Terima kasih sudah datang. Posisinya sif akhir pekan di toko buku, Sabtu dan Minggu, pukul 10 sampai 4. Pelamar: Cocok, saya kuliah di hari kerja. Manajer: Kamu di kasir, membantu pelanggan, dan membongkar kiriman Sabtu pagi. Gajinya 11,50 per jam, dan staf dapat diskon buku 20 persen. Pelamar: Kapan mulai? Manajer: Pelatihan Sabtu depan, sif pertama minggu berikutnya.',
    },
    [
      _q('Hari apa saja jam kerjanya?', 'Which days are the shifts?', [
        'Saturday and Sunday',
        'Monday to Friday',
        'Friday and Saturday',
        'Every day',
      ]),
      _q('Berapa gaji per jam?', 'What is the hourly pay?', [
        'Eleven fifty',
        'Ten fifty',
        'Fifteen',
        'Twelve',
      ]),
      _q(
        'Kapan sif pertama yang sesungguhnya?',
        'When is the first proper shift?',
        ['The week after training', 'Next Saturday', 'Tomorrow', 'Next month'],
      ),
      _q('Jam berapa sif berlangsung?', 'What are the shift hours?', [
        'Ten till four',
        'Nine till five',
        'Eight till two',
        'Twelve till six',
      ]),
      _q(
        'Berapa diskon buku untuk staf?',
        'How much discount do staff get on books?',
        ['Twenty percent', 'Ten percent', 'Fifty percent', 'Twelve percent'],
      ),
    ],
  ),
  _p(
    'en_i10',
    'Monolog: Kursus Fotografi',
    'Monologue: Photography Course',
    "Welcome to the beginners' photography course. Over six weeks we'll cover light, composition, and basic editing. You don't need an expensive camera; a phone is fine for the first three sessions. Week four is an outdoor shoot at the harbour, so bring warm clothes. Homework is one photo per week, uploaded to the class folder by Sunday night. At the end, we'll hold a small exhibition in the community hall, and family members are welcome.",
    {
      'id':
          'Selamat datang di kursus fotografi pemula. Selama enam minggu kita membahas cahaya, komposisi, dan penyuntingan dasar. Tidak perlu kamera mahal; ponsel cukup untuk tiga sesi pertama. Minggu keempat pemotretan luar ruang di pelabuhan, bawa pakaian hangat. Tugasnya satu foto per minggu, diunggah ke folder kelas sebelum Minggu malam. Di akhir kursus kita mengadakan pameran kecil di balai warga, keluarga dipersilakan hadir.',
    },
    [
      _q('Berapa lama kursusnya?', 'How long is the course?', [
        'Six weeks',
        'Four weeks',
        'Three weeks',
        'Ten weeks',
      ]),
      _q('Apa yang terjadi di minggu keempat?', 'What happens in week four?', [
        'An outdoor shoot at the harbour',
        'The final exhibition',
        'An editing workshop',
        'A camera sale',
      ]),
      _q('Kapan tugas harus diunggah?', 'When must homework be uploaded?', [
        'By Sunday night',
        'By Friday morning',
        'Before each class',
        'At the end of the course',
      ]),
      _q(
        'Apa yang dibutuhkan untuk tiga sesi pertama?',
        'What is needed for the first three sessions?',
        ['A phone is fine', 'An expensive camera', 'A tripod', 'A laptop'],
      ),
      _q(
        'Di mana pameran akhir diadakan?',
        'Where will the final exhibition be held?',
        [
          'In the community hall',
          'At the harbour',
          'In a gallery downtown',
          'Online only',
        ],
      ),
    ],
  ),
];

// ---------------------------------------------------------------------------
// Inggris — PTE Listening (rangkuman kuliah & detail angka, 1x putar)
// ---------------------------------------------------------------------------
final List<ListeningPassage> _enPte = [
  _p(
    'en_p1',
    'Kuliah: Kopi Global',
    'Lecture: Global Coffee',
    "Coffee is the second most traded commodity in the world after oil. Around one hundred and twenty-five million people depend on it for their income, most of them small farmers in Brazil, Vietnam, Colombia, and Ethiopia. Climate change is now the biggest threat: rising temperatures could halve the land suitable for coffee by twenty fifty. Researchers are responding by breeding heat-resistant varieties and encouraging farmers to plant shade trees.",
    {
      'id':
          'Kopi adalah komoditas kedua yang paling banyak diperdagangkan di dunia setelah minyak. Sekitar 125 juta orang bergantung padanya untuk penghasilan, kebanyakan petani kecil di Brasil, Vietnam, Kolombia, dan Etiopia. Perubahan iklim kini ancaman terbesar: kenaikan suhu bisa memangkas separuh lahan yang cocok untuk kopi pada 2050. Peneliti menanggapi dengan mengembangkan varietas tahan panas dan mendorong petani menanam pohon peneduh.',
    },
    [
      _q(
        'Apa peringkat kopi dalam perdagangan dunia?',
        "What is coffee's rank among traded commodities?",
        ['Second, after oil', 'First', 'Third, after sugar', 'Tenth'],
      ),
      _q(
        'Berapa orang bergantung pada kopi?',
        'How many people depend on coffee?',
        [
          'About 125 million',
          'About 25 million',
          'About 1.25 million',
          'About 500 million',
        ],
      ),
      _q('Apa yang bisa terjadi pada 2050?', 'What could happen by 2050?', [
        'Suitable land could be halved',
        'Coffee could disappear completely',
        'Prices could double',
        'Farmers could stop planting trees',
      ]),
      _q('Negara mana yang tidak disebut?', 'Which country is not mentioned?', [
        'Indonesia',
        'Brazil',
        'Vietnam',
        'Ethiopia',
      ]),
      _q('Apa yang dilakukan peneliti?', 'What are researchers doing?', [
        'Breeding heat-resistant varieties',
        'Moving farms to Europe',
        'Raising coffee prices',
        'Cutting down shade trees',
      ]),
    ],
  ),
  _p(
    'en_p2',
    'Kuliah: Kerja Jarak Jauh',
    'Lecture: Remote Work',
    "A survey of three thousand office workers found that sixty-two percent would accept a lower salary in exchange for working from home at least two days a week. Productivity did not fall; in fact, employees reported saving an average of fifty-four minutes a day on commuting. However, thirty-eight percent said they felt less connected to colleagues, which suggests companies need to invest in regular in-person meetings rather than abandoning offices completely.",
    {
      'id':
          'Survei terhadap tiga ribu pekerja kantor menemukan 62 persen bersedia menerima gaji lebih rendah asalkan bisa bekerja dari rumah minimal dua hari seminggu. Produktivitas tidak turun; bahkan karyawan melaporkan menghemat rata-rata 54 menit per hari untuk perjalanan. Namun 38 persen merasa kurang terhubung dengan rekan kerja, yang menunjukkan perusahaan perlu berinvestasi pada pertemuan tatap muka rutin, bukan meninggalkan kantor sepenuhnya.',
    },
    [
      _q(
        'Berapa persen yang bersedia gaji lebih rendah?',
        'What percentage would accept a lower salary?',
        [
          'Sixty-two percent',
          'Thirty-eight percent',
          'Fifty-four percent',
          'Twenty-six percent',
        ],
      ),
      _q(
        'Berapa waktu perjalanan yang dihemat per hari?',
        'How much commuting time was saved per day?',
        [
          'Fifty-four minutes',
          'Forty-five minutes',
          'Fifteen minutes',
          'Two hours',
        ],
      ),
      _q(
        'Apa saran pembicara untuk perusahaan?',
        "What is the speaker's suggestion for companies?",
        [
          'Keep regular in-person meetings',
          'Close all offices',
          'Cut salaries further',
          'Ban working from home',
        ],
      ),
      _q('Berapa pekerja yang disurvei?', 'How many workers were surveyed?', [
        'Three thousand',
        'Thirty thousand',
        'Three hundred',
        'Thirteen thousand',
      ]),
      _q(
        'Berapa persen merasa kurang terhubung?',
        'What percentage felt less connected to colleagues?',
        [
          'Thirty-eight percent',
          'Sixty-two percent',
          'Fifty-four percent',
          'Eighteen percent',
        ],
      ),
    ],
  ),
  _p(
    'en_p3',
    'Kuliah: Air Tanah',
    'Lecture: Groundwater',
    "Groundwater supplies nearly half of the world's drinking water and about forty percent of the water used for irrigation. Because it is hidden underground, it is easy to overuse. In some regions, water tables are dropping by more than one metre a year, and wells that once reached water at twenty metres now need to go down to eighty. Recharging aquifers by capturing monsoon rain in ponds is a low-cost solution that several Indian states have adopted successfully.",
    {
      'id':
          'Air tanah memasok hampir separuh air minum dunia dan sekitar 40 persen air irigasi. Karena tersembunyi di bawah tanah, ia mudah dipakai berlebihan. Di beberapa wilayah, muka air tanah turun lebih dari satu meter per tahun, dan sumur yang dulu mencapai air di 20 meter kini harus digali sampai 80 meter. Mengisi ulang akuifer dengan menampung hujan monsun di kolam adalah solusi murah yang berhasil diterapkan beberapa negara bagian India.',
    },
    [
      _q(
        'Berapa bagian air minum dunia dari air tanah?',
        "How much of the world's drinking water comes from groundwater?",
        [
          'Nearly half',
          'About forty percent',
          'About ten percent',
          'Almost all',
        ],
      ),
      _q(
        'Berapa dalam sumur sekarang di beberapa wilayah?',
        'How deep do some wells need to go now?',
        ['Eighty metres', 'Twenty metres', 'One metre', 'Eight metres'],
      ),
      _q('Solusi apa yang disebut?', 'What solution is mentioned?', [
        'Capturing monsoon rain to recharge aquifers',
        'Importing bottled water',
        'Banning irrigation',
        'Building desalination plants',
      ]),
      _q(
        'Berapa persen air irigasi dari air tanah?',
        'What share of irrigation water comes from groundwater?',
        [
          'About forty percent',
          'About half',
          'About fourteen percent',
          'About ninety percent',
        ],
      ),
      _q(
        'Mengapa air tanah mudah dipakai berlebihan?',
        'Why is groundwater easy to overuse?',
        [
          'It is hidden underground',
          'It is free',
          'It is salty',
          'It rains too much',
        ],
      ),
    ],
  ),
  _p(
    'en_p4',
    'Kuliah: Kecerdasan Buatan di Rumah Sakit',
    'Lecture: AI in Hospitals',
    "In a trial at twelve hospitals, an artificial intelligence system reviewed chest X-rays alongside radiologists. The system flagged possible problems in under ten seconds and caught about five percent of cases that doctors initially missed. Importantly, the final decision always stayed with the doctor. The researchers concluded that AI works best as a second pair of eyes, reducing workload during night shifts when errors are most common.",
    {
      'id':
          'Dalam uji coba di dua belas rumah sakit, sistem kecerdasan buatan meninjau rontgen dada bersama ahli radiologi. Sistem menandai kemungkinan masalah dalam waktu di bawah sepuluh detik dan menangkap sekitar lima persen kasus yang awalnya terlewat dokter. Yang penting, keputusan akhir tetap di tangan dokter. Peneliti menyimpulkan AI paling baik berfungsi sebagai pasangan mata kedua, mengurangi beban kerja saat sif malam ketika kesalahan paling sering terjadi.',
    },
    [
      _q(
        'Berapa rumah sakit yang ikut uji coba?',
        'How many hospitals took part in the trial?',
        ['Twelve', 'Twenty', 'Two', 'Fifty'],
      ),
      _q(
        'Berapa persen kasus terlewat yang ditangkap AI?',
        'What percentage of missed cases did the AI catch?',
        [
          'About five percent',
          'About fifty percent',
          'About fifteen percent',
          'About one percent',
        ],
      ),
      _q('Apa kesimpulan peneliti?', 'What did the researchers conclude?', [
        'AI works best as a second pair of eyes',
        'AI should replace radiologists',
        'AI is too slow to be useful',
        'AI should only work at night',
      ]),
      _q(
        'Seberapa cepat sistem menandai masalah?',
        'How quickly did the system flag problems?',
        [
          'In under ten seconds',
          'In about ten minutes',
          'In one hour',
          'Overnight',
        ],
      ),
      _q(
        'Kapan kesalahan paling sering terjadi?',
        'When are errors most common?',
        [
          'During night shifts',
          'In the morning',
          'At weekends',
          'During holidays',
        ],
      ),
    ],
  ),
  _p(
    'en_p5',
    'Kuliah: Kota Sepeda',
    'Lecture: Cycling Cities',
    "Copenhagen invested about three hundred million euros in cycling infrastructure over fifteen years. Today, sixty-two percent of residents cycle to work or school, and the city estimates that every kilometre cycled saves society roughly one euro in health costs and reduced congestion. The key was not the bikes but the design: separated lanes, priority at junctions, and parking at every station.",
    {
      'id':
          'Kopenhagen menginvestasikan sekitar 300 juta euro untuk infrastruktur bersepeda selama lima belas tahun. Kini 62 persen penduduk bersepeda ke tempat kerja atau sekolah, dan kota memperkirakan setiap kilometer yang ditempuh dengan sepeda menghemat sekitar satu euro biaya kesehatan dan kemacetan bagi masyarakat. Kuncinya bukan sepedanya, tapi rancangannya: jalur terpisah, prioritas di persimpangan, dan parkir di setiap stasiun.',
    },
    [
      _q(
        'Berapa lama investasinya berlangsung?',
        'Over how many years was the investment made?',
        ['Fifteen years', 'Fifty years', 'Five years', 'Three years'],
      ),
      _q(
        'Berapa persen penduduk yang bersepeda?',
        'What percentage of residents cycle to work or school?',
        [
          'Sixty-two percent',
          'Twenty-six percent',
          'Thirty percent',
          'Ninety percent',
        ],
      ),
      _q(
        'Apa kunci keberhasilannya menurut pembicara?',
        'What was the key to success, according to the speaker?',
        [
          'The design of the infrastructure',
          'Cheap bicycles',
          'High petrol prices',
          'Good weather',
        ],
      ),
      _q('Berapa investasi Kopenhagen?', 'How much did Copenhagen invest?', [
        'About three hundred million euros',
        'About thirty million euros',
        'About three billion euros',
        'About three million euros',
      ]),
      _q(
        'Berapa penghematan per kilometer bersepeda?',
        'How much does each kilometre cycled save society?',
        [
          'Roughly one euro',
          'Roughly ten euros',
          'Roughly fifty cents',
          'Roughly one hundred euros',
        ],
      ),
    ],
  ),
  _p(
    'en_p6',
    'Kuliah: Membaca Digital',
    'Lecture: Reading on Screens',
    "Do we read differently on screens? A review of fifty-four studies involving more than one hundred and seventy thousand participants found that readers understood printed texts slightly better than digital ones, especially for long, informational material. The difference was small for stories but larger for textbooks. One explanation is that scrolling weakens our memory of where information sits on a page. The advice for students: print long chapters, but feel free to read novels on a screen.",
    {
      'id':
          'Apakah kita membaca berbeda di layar? Tinjauan 54 penelitian dengan lebih dari 170 ribu peserta menemukan pembaca memahami teks cetak sedikit lebih baik daripada digital, terutama untuk bahan informasi yang panjang. Perbedaannya kecil untuk cerita tapi lebih besar untuk buku teks. Salah satu penjelasannya, menggulir melemahkan ingatan kita tentang letak informasi di halaman. Saran untuk pelajar: cetak bab yang panjang, tapi novel boleh dibaca di layar.',
    },
    [
      _q(
        'Berapa penelitian yang ditinjau?',
        'How many studies were reviewed?',
        ['Fifty-four', 'Forty-five', 'Fourteen', 'One hundred and seventy'],
      ),
      _q(
        'Untuk jenis teks apa perbedaannya paling besar?',
        'For which kind of text was the difference largest?',
        ['Textbooks', 'Stories', 'Poems', 'Emails'],
      ),
      _q('Apa penjelasan yang diberikan?', 'What explanation is given?', [
        'Scrolling weakens memory of where information sits',
        'Screens are too bright',
        'Digital texts have more errors',
        'Readers skip pages on paper',
      ]),
      _q(
        'Berapa peserta yang terlibat?',
        'How many participants were involved?',
        ['More than 170,000', 'About 17,000', 'About 54,000', 'About 1,700'],
      ),
      _q('Apa saran untuk pelajar?', 'What is the advice for students?', [
        'Print long chapters',
        'Read everything on screens',
        'Avoid novels',
        'Stop scrolling completely',
      ]),
    ],
  ),
  _p(
    'en_p7',
    'Kuliah: Gunung Berapi dan Iklim',
    'Lecture: Volcanoes and Climate',
    "Large volcanic eruptions can cool the planet for a short time. In eighteen fifteen, Mount Tambora in Indonesia released so much ash and sulphur into the atmosphere that global temperatures fell by about half a degree, and eighteen sixteen became known as the year without a summer in Europe and North America. Crops failed and food prices doubled. The effect lasted only two to three years, because the particles eventually fell back to Earth.",
    {
      'id':
          'Letusan gunung berapi besar bisa mendinginkan planet untuk waktu singkat. Pada 1815, Gunung Tambora di Indonesia melepaskan begitu banyak abu dan belerang ke atmosfer sehingga suhu global turun sekitar setengah derajat, dan 1816 dikenal sebagai tahun tanpa musim panas di Eropa dan Amerika Utara. Panen gagal dan harga pangan berlipat dua. Efeknya hanya bertahan dua sampai tiga tahun karena partikelnya akhirnya jatuh kembali ke Bumi.',
    },
    [
      _q('Kapan Gunung Tambora meletus?', 'When did Mount Tambora erupt?', [
        '1815',
        '1816',
        '1851',
        '1915',
      ]),
      _q(
        'Berapa penurunan suhu global?',
        'By how much did global temperatures fall?',
        [
          'About half a degree',
          'About five degrees',
          'About two degrees',
          'About ten degrees',
        ],
      ),
      _q(
        'Mengapa efeknya tidak bertahan lama?',
        'Why did the effect not last long?',
        [
          'The particles fell back to Earth',
          'The volcano erupted again',
          'Farmers planted new crops',
          'The sun grew hotter',
        ],
      ),
      _q('Di mana Gunung Tambora berada?', 'Where is Mount Tambora?', [
        'Indonesia',
        'Italy',
        'Iceland',
        'Japan',
      ]),
      _q(
        'Apa yang terjadi pada harga pangan?',
        'What happened to food prices?',
        [
          'They doubled',
          'They halved',
          'They stayed the same',
          'They fell slightly',
        ],
      ),
    ],
  ),
  _p(
    'en_p8',
    'Kuliah: Tidur Remaja',
    'Lecture: Teenage Sleep',
    "Teenagers need about nine hours of sleep, yet most get fewer than seven on school nights. The cause is partly biological: during puberty the body releases melatonin later, so a sixteen-year-old is not naturally sleepy until around eleven. When one district in the United States moved school start times from seven thirty to eight thirty, attendance rose, grades improved, and car accidents involving teenage drivers dropped by seventy percent.",
    {
      'id':
          'Remaja butuh sekitar sembilan jam tidur, namun kebanyakan tidur kurang dari tujuh jam pada malam sekolah. Penyebabnya sebagian biologis: selama pubertas tubuh melepaskan melatonin lebih lambat, sehingga anak 16 tahun tidak mengantuk secara alami sampai sekitar pukul sebelas. Ketika satu distrik di Amerika Serikat memundurkan jam masuk sekolah dari 07.30 ke 08.30, kehadiran naik, nilai membaik, dan kecelakaan mobil yang melibatkan pengemudi remaja turun 70 persen.',
    },
    [
      _q(
        'Berapa jam tidur yang dibutuhkan remaja?',
        'How much sleep do teenagers need?',
        [
          'About nine hours',
          'About seven hours',
          'About five hours',
          'About twelve hours',
        ],
      ),
      _q(
        'Jam berapa sekolah dimulai setelah perubahan?',
        'What time did school start after the change?',
        ['Eight thirty', 'Seven thirty', 'Nine thirty', 'Eight'],
      ),
      _q(
        'Berapa penurunan kecelakaan mobil remaja?',
        'By how much did teenage car accidents drop?',
        [
          'Seventy percent',
          'Seventeen percent',
          'Seven percent',
          'Fifty percent',
        ],
      ),
      _q(
        'Jam berapa remaja 16 tahun mulai mengantuk?',
        'When does a sixteen-year-old naturally feel sleepy?',
        ['Around eleven', 'Around nine', 'Around seven', 'Around midnight'],
      ),
      _q(
        'Mengapa remaja mengantuk lebih lambat?',
        'Why do teenagers get sleepy later?',
        [
          'The body releases melatonin later',
          'They drink too much coffee',
          'School ends late',
          'They exercise at night',
        ],
      ),
    ],
  ),
  _p(
    'en_p9',
    'Kuliah: Ekonomi Sirkular',
    'Lecture: The Circular Economy',
    "The traditional economy follows a straight line: take resources, make products, throw them away. A circular economy instead keeps materials in use for as long as possible through repair, sharing, and recycling. The European Union estimates that circular practices could add six hundred billion euros a year to its economy and create around seven hundred thousand jobs by twenty thirty. The biggest gains come from three sectors: construction, textiles, and electronics.",
    {
      'id':
          'Ekonomi tradisional mengikuti garis lurus: ambil sumber daya, buat produk, buang. Ekonomi sirkular justru menjaga material tetap dipakai selama mungkin lewat perbaikan, berbagi, dan daur ulang. Uni Eropa memperkirakan praktik sirkular bisa menambah 600 miliar euro per tahun bagi ekonominya dan menciptakan sekitar 700 ribu lapangan kerja pada 2030. Keuntungan terbesar datang dari tiga sektor: konstruksi, tekstil, dan elektronik.',
    },
    [
      _q(
        'Bagaimana ekonomi tradisional digambarkan?',
        'How is the traditional economy described?',
        ['As a straight line', 'As a circle', 'As a network', 'As a pyramid'],
      ),
      _q(
        'Berapa lapangan kerja yang bisa tercipta pada 2030?',
        'How many jobs could be created by 2030?',
        [
          'About seven hundred thousand',
          'About seventy thousand',
          'About seven million',
          'About six hundred thousand',
        ],
      ),
      _q('Sektor mana yang tidak disebut?', 'Which sector is not mentioned?', [
        'Agriculture',
        'Construction',
        'Textiles',
        'Electronics',
      ]),
      _q(
        'Berapa nilai tambah ekonomi per tahun?',
        'How much could be added to the economy each year?',
        [
          'Six hundred billion euros',
          'Sixty billion euros',
          'Six billion euros',
          'Seven hundred billion euros',
        ],
      ),
      _q(
        'Bagaimana ekonomi sirkular menjaga material tetap dipakai?',
        'How does a circular economy keep materials in use?',
        [
          'Through repair, sharing, and recycling',
          'By burning waste',
          'By importing more resources',
          'By lowering prices',
        ],
      ),
    ],
  ),
  _p(
    'en_p10',
    'Kuliah: Musik dan Otak',
    'Lecture: Music and the Brain',
    "Learning a musical instrument changes the brain in measurable ways. Brain scans of children who practised for thirty minutes a day over fifteen months showed growth in areas linked to hearing and hand movement. Their reading scores also improved, although the effect on mathematics was not significant. The researchers stress that the benefit came from active practice, not from simply listening to music, so background classical music during homework is unlikely to help.",
    {
      'id':
          'Belajar alat musik mengubah otak secara terukur. Pemindaian otak anak-anak yang berlatih 30 menit sehari selama 15 bulan menunjukkan pertumbuhan di area yang terkait pendengaran dan gerakan tangan. Nilai membaca mereka juga membaik, walau efek pada matematika tidak signifikan. Peneliti menekankan manfaatnya datang dari latihan aktif, bukan sekadar mendengarkan musik, jadi musik klasik sebagai latar saat mengerjakan PR kemungkinan tidak membantu.',
    },
    [
      _q(
        'Berapa lama anak-anak berlatih setiap hari?',
        'How long did the children practise each day?',
        ['Thirty minutes', 'Fifteen minutes', 'Three hours', 'Fifty minutes'],
      ),
      _q('Kemampuan apa yang membaik?', 'Which skill improved?', [
        'Reading',
        'Mathematics',
        'Running',
        'Drawing',
      ]),
      _q(
        'Apa yang dikatakan tentang mendengarkan musik saja?',
        'What is said about simply listening to music?',
        [
          'It is unlikely to help',
          'It works as well as practice',
          'It improves mathematics',
          'It harms concentration',
        ],
      ),
      _q(
        'Berapa lama penelitian berlangsung?',
        'How long did the study last?',
        ['Fifteen months', 'Thirty months', 'Fifteen weeks', 'Five years'],
      ),
      _q('Area otak apa yang tumbuh?', 'Which brain areas grew?', [
        'Areas linked to hearing and hand movement',
        'Areas linked to vision',
        'Areas linked to smell',
        'Areas linked to balance',
      ]),
    ],
  ),
];

// ---------------------------------------------------------------------------
// Jepang — Choukai N5 (percakapan pendek)
// ---------------------------------------------------------------------------
final List<ListeningPassage> _jaN5 = [
  _p(
    'ja_5_1',
    'Di Toko Roti',
    'At the Bakery',
    'いらっしゃいませ。パンは ひとつ 百五十円です。三つ 買うと 四百円に なります。ぎゅうにゅうは あそこに あります。',
    {
      'id':
          'Selamat datang. Roti satu buah 150 yen. Kalau beli tiga jadi 400 yen. Susu ada di sana.',
      'en':
          'Welcome. Bread is 150 yen each. If you buy three, it is 400 yen. Milk is over there.',
    },
    [
      _q('Berapa harga satu roti?', 'How much is one bread?', [
        '百五十円',
        '百円',
        '四百円',
        '五十円',
      ]),
      _q('Kalau beli tiga, berapa?', 'How much for three?', [
        '四百円',
        '四百五十円',
        '三百円',
        '五百円',
      ]),
      _q('Apa yang ada di sana?', 'What is over there?', [
        'ぎゅうにゅう',
        'パン',
        'おちゃ',
        'たまご',
      ]),
      _q('Di mana percakapan ini terjadi?', 'Where does this take place?', [
        'パンや',
        'ぎんこう',
        'えき',
        'がっこう',
      ]),
      _q(
        'Berapa roti yang harganya 400 yen?',
        'How many breads cost 400 yen?',
        ['三つ', 'ひとつ', 'ふたつ', 'よっつ'],
      ),
    ],
  ),
  _p(
    'ja_5_2',
    'Janji Bertemu',
    'Making Plans',
    'あした、えきの まえで 会いましょう。十時は どうですか。ああ、十時は ちょっと…。十一時なら だいじょうぶです。じゃ、十一時に。',
    {
      'id':
          'Besok kita bertemu di depan stasiun. Jam sepuluh bagaimana? Ah, jam sepuluh agak... Kalau jam sebelas bisa. Baik, jam sebelas.',
      'en':
          "Let's meet in front of the station tomorrow. How about ten? Ah, ten is a bit... Eleven is fine. Okay, at eleven.",
    },
    [
      _q('Di mana mereka bertemu?', 'Where will they meet?', [
        'えきの まえ',
        'がっこうの まえ',
        'デパートの なか',
        'こうえん',
      ]),
      _q('Jam berapa akhirnya bertemu?', 'What time will they finally meet?', [
        '十一時',
        '十時',
        '九時',
        '十二時',
      ]),
      _q('Kapan mereka bertemu?', 'When will they meet?', [
        'あした',
        'きょう',
        'あさって',
        'らいしゅう',
      ]),
      _q(
        'Jam berapa yang pertama diusulkan?',
        'What time was first suggested?',
        ['十時', '十一時', '九時', '八時'],
      ),
      _q('Kenapa jam sepuluh tidak jadi?', "Why wasn't ten o'clock chosen?", [
        '十時は つごうが わるかった',
        'えきが とおかった',
        'でんしゃが なかった',
        'あめだった',
      ]),
    ],
  ),
  _p(
    'ja_5_3',
    'Keluarga Saya',
    'My Family',
    'わたしの かぞくは 四人です。ちちは いしゃで、ははは せんせいです。あには だいがくせいで、とうきょうに すんでいます。',
    {
      'id':
          'Keluarga saya empat orang. Ayah dokter, ibu guru. Kakak laki-laki mahasiswa dan tinggal di Tokyo.',
      'en':
          'There are four people in my family. My father is a doctor and my mother is a teacher. My older brother is a university student and lives in Tokyo.',
    },
    [
      _q(
        'Berapa jumlah anggota keluarga?',
        'How many people are in the family?',
        ['四人', '三人', '五人', '二人'],
      ),
      _q('Apa pekerjaan ibu?', "What is the mother's job?", [
        'せんせい',
        'いしゃ',
        'だいがくせい',
        'かいしゃいん',
      ]),
      _q('Di mana kakak tinggal?', 'Where does the brother live?', [
        'とうきょう',
        'おおさか',
        'きょうと',
        'なごや',
      ]),
      _q('Apa pekerjaan ayah?', "What is the father's job?", [
        'いしゃ',
        'せんせい',
        'かいしゃいん',
        'だいがくせい',
      ]),
      _q('Siapa yang mahasiswa?', 'Who is a university student?', [
        'あに',
        'ちち',
        'はは',
        'あね',
      ]),
    ],
  ),
  _p(
    'ja_5_4',
    'Cuaca Besok',
    "Tomorrow's Weather",
    'きょうは いい てんきですね。でも あしたは 雨が ふります。かさを もっていってください。あさっては また はれます。',
    {
      'id':
          'Hari ini cuacanya bagus ya. Tapi besok hujan turun. Bawalah payung. Lusa cerah lagi.',
      'en':
          "Nice weather today. But it will rain tomorrow. Please take an umbrella. The day after tomorrow will be sunny again.",
    },
    [
      _q('Bagaimana cuaca besok?', 'What is the weather tomorrow?', [
        '雨',
        'はれ',
        'ゆき',
        'くもり',
      ]),
      _q('Apa yang harus dibawa?', 'What should you take?', [
        'かさ',
        'コート',
        'ぼうし',
        'めがね',
      ]),
      _q(
        'Bagaimana cuaca lusa?',
        'What is the weather the day after tomorrow?',
        ['はれ', '雨', 'ゆき', 'かぜ'],
      ),
      _q('Bagaimana cuaca hari ini?', 'What is the weather like today?', [
        'いい てんき',
        '雨',
        'ゆき',
        'かぜが つよい',
      ]),
      _q('Kapan hujan turun?', 'When will it rain?', [
        'あした',
        'きょう',
        'あさって',
        'こんばん',
      ]),
    ],
  ),
  _p(
    'ja_5_5',
    'Di Restoran',
    'At the Restaurant',
    'すみません、ラーメンを ひとつと ぎょうざを ふたつ ください。おのみものは？ おちゃを おねがいします。はい、少し おまちください。',
    {
      'id':
          'Permisi, ramen satu dan gyoza dua. Minumnya? Teh, tolong. Baik, mohon tunggu sebentar.',
      'en':
          'Excuse me, one ramen and two gyoza please. And to drink? Tea, please. Certainly, please wait a moment.',
    },
    [
      _q('Berapa gyoza yang dipesan?', 'How many gyoza were ordered?', [
        'ふたつ',
        'ひとつ',
        'みっつ',
        'よっつ',
      ]),
      _q('Minuman apa yang dipesan?', 'What drink was ordered?', [
        'おちゃ',
        'みず',
        'コーヒー',
        'ジュース',
      ]),
      _q('Apa makanan yang dipesan satu?', 'Which food was ordered as one?', [
        'ラーメン',
        'ぎょうざ',
        'すし',
        'カレー',
      ]),
      _q('Berapa ramen yang dipesan?', 'How many ramen were ordered?', [
        'ひとつ',
        'ふたつ',
        'みっつ',
        'よっつ',
      ]),
      _q(
        'Apa yang dikatakan pelayan di akhir?',
        'What does the waiter say at the end?',
        ['少し おまちください', 'ありがとうございました', 'また きてください', 'おかねを ください'],
      ),
    ],
  ),
  _p(
    'ja_5_6',
    'Hari Minggu',
    'Sunday',
    'にちようびは ともだちと えいがを 見ました。えいがの あとで、レストランで ばんごはんを 食べました。とても たのしかったです。',
    {
      'id':
          'Hari Minggu saya menonton film dengan teman. Setelah film, kami makan malam di restoran. Sangat menyenangkan.',
      'en':
          'On Sunday I watched a movie with a friend. After the movie, we had dinner at a restaurant. It was a lot of fun.',
    },
    [
      _q(
        'Dengan siapa dia menonton film?',
        'Who did they watch the movie with?',
        ['ともだち', 'かぞく', 'せんせい', 'ひとりで'],
      ),
      _q(
        'Apa yang dilakukan setelah film?',
        'What did they do after the movie?',
        ['ばんごはんを 食べた', 'かいものを した', 'うちに かえった', 'ほんを 読んだ'],
      ),
      _q('Bagaimana perasaannya?', 'How did they feel?', [
        'たのしかった',
        'つまらなかった',
        'つかれた',
        'さむかった',
      ]),
      _q(
        'Hari apa dia menonton film?',
        'On which day did they watch the movie?',
        ['にちようび', 'どようび', 'げつようび', 'きんようび'],
      ),
      _q('Di mana mereka makan malam?', 'Where did they have dinner?', [
        'レストラン',
        'うち',
        'えいがかん',
        'がっこう',
      ]),
    ],
  ),
  _p(
    'ja_5_7',
    'Pergi ke Sekolah',
    'Going to School',
    'まいにち 七時に おきます。あさごはんを 食べて、八時に うちを 出ます。がっこうまで じてんしゃで 二十分 かかります。',
    {
      'id':
          'Setiap hari bangun pukul tujuh. Sarapan, lalu keluar rumah pukul delapan. Ke sekolah naik sepeda dua puluh menit.',
      'en':
          'I get up at seven every day. I eat breakfast and leave home at eight. It takes twenty minutes to school by bicycle.',
    },
    [
      _q('Jam berapa dia bangun?', 'What time does the speaker get up?', [
        '七時',
        '八時',
        '六時',
        '九時',
      ]),
      _q('Bagaimana dia ke sekolah?', 'How does the speaker go to school?', [
        'じてんしゃで',
        'バスで',
        'でんしゃで',
        'あるいて',
      ]),
      _q('Berapa lama perjalanannya?', 'How long does it take?', [
        '二十分',
        '十分',
        '三十分',
        '二時間',
      ]),
      _q(
        'Jam berapa dia keluar rumah?',
        'What time does the speaker leave home?',
        ['八時', '七時', '九時', '八時半'],
      ),
      _q(
        'Apa yang dilakukan sebelum keluar rumah?',
        'What does the speaker do before leaving home?',
        ['あさごはんを 食べる', 'テレビを 見る', 'しんぶんを 読む', 'そうじを する'],
      ),
    ],
  ),
  _p(
    'ja_5_8',
    'Di Kantor Pos',
    'At the Post Office',
    'この てがみを アメリカに おくりたいです。ひこうきびんで 二百円です。何日 かかりますか。一週間ぐらいです。',
    {
      'id':
          'Saya ingin mengirim surat ini ke Amerika. Lewat pos udara 200 yen. Berapa hari sampai? Sekitar seminggu.',
      'en':
          'I want to send this letter to America. By airmail it is 200 yen. How many days will it take? About a week.',
    },
    [
      _q('Ke mana surat dikirim?', 'Where is the letter going?', [
        'アメリカ',
        'イギリス',
        'ちゅうごく',
        'かんこく',
      ]),
      _q('Berapa biayanya?', 'How much does it cost?', [
        '二百円',
        '百円',
        '二千円',
        '五百円',
      ]),
      _q('Berapa lama sampai?', 'How long will it take?', [
        '一週間ぐらい',
        '一日',
        '一か月',
        '三日',
      ]),
      _q('Apa yang ingin dikirim?', 'What does the speaker want to send?', [
        'てがみ',
        'にもつ',
        'はがき',
        'ほん',
      ]),
      _q('Bagaimana cara mengirimnya?', 'How will it be sent?', [
        'ひこうきびん',
        'ふなびん',
        'たくはいびん',
        'そくたつ',
      ]),
    ],
  ),
];

// ---------------------------------------------------------------------------
// Jepang — Choukai N4 (pengumuman & cerita pendek)
// ---------------------------------------------------------------------------
final List<ListeningPassage> _jaN4 = [
  _p(
    'ja_4_1',
    'Pengumuman Kereta',
    'Train Announcement',
    'ご乗車ありがとうございます。この電車は 東京行きです。次は 新宿、新宿です。事故のため、電車は 十分ほど 遅れています。ご迷惑を おかけして 申し訳ありません。',
    {
      'id':
          'Terima kasih telah naik. Kereta ini menuju Tokyo. Berikutnya Shinjuku. Karena kecelakaan, kereta terlambat sekitar sepuluh menit. Mohon maaf atas ketidaknyamanannya.',
      'en':
          'Thank you for riding. This train is bound for Tokyo. Next is Shinjuku. Due to an accident, the train is about ten minutes late. We apologize for the inconvenience.',
    },
    [
      _q('Ke mana tujuan kereta?', 'Where is the train bound for?', [
        '東京',
        '新宿',
        '横浜',
        '大阪',
      ]),
      _q('Berapa lama keterlambatannya?', 'How late is the train?', [
        '十分ほど',
        '二十分ほど',
        '一時間',
        '五分',
      ]),
      _q('Apa penyebab keterlambatan?', 'What caused the delay?', [
        '事故',
        '雨',
        '雪',
        '風',
      ]),
      _q('Stasiun berikutnya apa?', 'What is the next station?', [
        '新宿',
        '東京',
        '渋谷',
        '品川',
      ]),
      _q(
        'Apa yang dikatakan di akhir pengumuman?',
        'What is said at the end of the announcement?',
        ['申し訳ありません', 'ありがとうございました', 'お気をつけて', 'ドアが 閉まります'],
      ),
    ],
  ),
  _p(
    'ja_4_2',
    'Undangan Pesta',
    'Party Invitation',
    '来週の 土曜日、うちで パーティーを します。田中さんも 来ませんか。飲み物は こちらで 用意しますから、何か 食べ物を 持ってきてください。六時に 始めます。',
    {
      'id':
          'Sabtu depan saya mengadakan pesta di rumah. Tanaka juga mau datang? Minuman kami sediakan, jadi bawalah makanan. Mulai pukul enam.',
      'en':
          "Next Saturday I'm having a party at my place. Won't you come too, Tanaka? We'll prepare drinks, so please bring some food. It starts at six.",
    },
    [
      _q('Kapan pestanya?', 'When is the party?', [
        '来週の 土曜日',
        '今週の 土曜日',
        '来週の 日曜日',
        '明日',
      ]),
      _q('Apa yang harus dibawa Tanaka?', 'What should Tanaka bring?', [
        '食べ物',
        '飲み物',
        'おかね',
        'プレゼント',
      ]),
      _q('Jam berapa mulai?', 'What time does it start?', [
        '六時',
        '七時',
        '五時',
        '八時',
      ]),
      _q('Di mana pestanya?', 'Where is the party?', [
        '話している人の うち',
        '田中さんの うち',
        'レストラン',
        '会社',
      ]),
      _q('Apa yang disediakan tuan rumah?', 'What will the host prepare?', [
        '飲み物',
        '食べ物',
        'ケーキ',
        '音楽',
      ]),
    ],
  ),
  _p(
    'ja_4_3',
    'Pindah Rumah',
    'Moving House',
    '先月、新しい アパートに 引っ越しました。前の アパートより 少し 狭いですが、駅から 近くて 便利です。近くに スーパーも あるので、買い物が 楽になりました。',
    {
      'id':
          'Bulan lalu saya pindah ke apartemen baru. Sedikit lebih sempit dari yang lama, tapi dekat stasiun dan praktis. Ada supermarket di dekatnya, jadi belanja jadi mudah.',
      'en':
          "Last month I moved to a new apartment. It's a bit smaller than the old one, but it's close to the station and convenient. There's a supermarket nearby, so shopping has become easier.",
    },
    [
      _q('Kapan dia pindah?', 'When did the speaker move?', [
        '先月',
        '先週',
        '昨日',
        '去年',
      ]),
      _q(
        'Apa kekurangan apartemen baru?',
        'What is the downside of the new apartment?',
        ['少し 狭い', '駅から 遠い', '高い', '古い'],
      ),
      _q('Mengapa belanja jadi mudah?', 'Why has shopping become easier?', [
        '近くに スーパーが ある',
        '車を 買った',
        '安くなった',
        '休みが 多い',
      ]),
      _q(
        'Apa kelebihan apartemen baru?',
        'What is good about the new apartment?',
        ['駅から 近い', '前より 広い', '家賃が 安い', '新しくて 大きい'],
      ),
      _q('Apa yang ada di dekat apartemen?', 'What is near the apartment?', [
        'スーパー',
        '病院',
        '学校',
        '公園',
      ]),
    ],
  ),
  _p(
    'ja_4_4',
    'Pengumuman Toko',
    'Store Announcement',
    'ご来店の お客様に お知らせします。本日、二階の 洋服売り場では 全品 二十パーセント 引きです。また、五千円以上 お買い上げの お客様には 駐車場が 二時間 無料になります。',
    {
      'id':
          'Pengumuman untuk pelanggan. Hari ini di bagian pakaian lantai dua, semua barang diskon 20 persen. Pelanggan yang berbelanja 5.000 yen atau lebih mendapat parkir gratis dua jam.',
      'en':
          'Attention shoppers. Today all items in the clothing section on the second floor are 20 percent off. Customers who spend 5,000 yen or more get two hours of free parking.',
    },
    [
      _q('Di lantai berapa diskonnya?', 'On which floor is the discount?', [
        '二階',
        '一階',
        '三階',
        '地下',
      ]),
      _q('Berapa diskonnya?', 'How much is the discount?', [
        '二十パーセント',
        '十パーセント',
        '五十パーセント',
        '二パーセント',
      ]),
      _q('Syarat parkir gratis?', 'What is the condition for free parking?', [
        '五千円以上 買う',
        '会員になる',
        '二階で 買う',
        '朝 来る',
      ]),
      _q('Bagian apa yang diskon?', 'Which section has the discount?', [
        '洋服売り場',
        '食品売り場',
        'くつ売り場',
        '本売り場',
      ]),
      _q('Berapa lama parkir gratis?', 'How long is parking free?', [
        '二時間',
        '一時間',
        '三時間',
        '半日',
      ]),
    ],
  ),
  _p(
    'ja_4_5',
    'Pesan Telepon',
    'Phone Message',
    'もしもし、山田です。明日の 会議ですが、二時から 三時に 変わりました。場所は 同じ 三階の 会議室です。資料は 私が 印刷しておきますから、心配しないでください。',
    {
      'id':
          'Halo, ini Yamada. Soal rapat besok, berubah dari pukul dua menjadi pukul tiga. Tempatnya tetap ruang rapat lantai tiga. Materinya saya yang cetak, jadi jangan khawatir.',
      'en':
          "Hello, this is Yamada. About tomorrow's meeting, it has changed from two to three o'clock. The place is the same meeting room on the third floor. I'll print the materials, so don't worry.",
    },
    [
      _q('Jam berapa rapat sekarang?', 'What time is the meeting now?', [
        '三時',
        '二時',
        '四時',
        '一時',
      ]),
      _q('Di mana rapatnya?', 'Where is the meeting?', [
        '三階の 会議室',
        '二階の 会議室',
        '一階の ロビー',
        '山田さんの 部屋',
      ]),
      _q('Siapa yang mencetak materi?', 'Who will print the materials?', [
        '山田さん',
        '聞いている人',
        '部長',
        'だれも 印刷しない',
      ]),
      _q('Siapa yang menelepon?', 'Who is calling?', [
        '山田さん',
        '田中さん',
        '部長',
        '鈴木さん',
      ]),
      _q('Kapan rapatnya?', 'When is the meeting?', ['明日', '今日', '来週', 'あさって']),
    ],
  ),
  _p(
    'ja_4_6',
    'Hobi Baru',
    'New Hobby',
    '最近、料理を 始めました。最初は 卵を 焼くことも できませんでしたが、毎日 練習して、今は カレーや ハンバーグが 作れます。来月は 友だちを 呼んで、いっしょに 食べる つもりです。',
    {
      'id':
          'Baru-baru ini saya mulai memasak. Awalnya menggoreng telur pun tidak bisa, tapi setelah latihan setiap hari, sekarang bisa membuat kari dan hamburger steak. Bulan depan saya berencana mengundang teman dan makan bersama.',
      'en':
          "Recently I started cooking. At first I couldn't even fry an egg, but I practiced every day and now I can make curry and hamburger steak. Next month I plan to invite friends and eat together.",
    },
    [
      _q('Apa yang mulai dia lakukan?', 'What did the speaker start doing?', [
        '料理',
        'スポーツ',
        '英語',
        'ピアノ',
      ]),
      _q('Apa yang sekarang bisa dibuat?', 'What can the speaker make now?', [
        'カレーや ハンバーグ',
        '卵だけ',
        'すし',
        'ケーキ',
      ]),
      _q('Apa rencana bulan depan?', 'What is the plan for next month?', [
        '友だちと いっしょに 食べる',
        '料理教室に 行く',
        'レストランを 開く',
        '旅行する',
      ]),
      _q(
        'Apa yang awalnya tidak bisa dilakukan?',
        "What couldn't the speaker do at first?",
        ['卵を 焼くこと', 'カレーを 作ること', '買い物を すること', '皿を 洗うこと'],
      ),
      _q(
        'Bagaimana dia bisa memasak sekarang?',
        'How did the speaker learn to cook?',
        ['毎日 練習した', '料理教室に 行った', '母に 習った', '本を 読んだ'],
      ),
    ],
  ),
  _p(
    'ja_4_7',
    'Di Rumah Sakit',
    'At the Hospital',
    '今日は 薬を 出します。白い 薬は 朝と 夜、食事の 後に 飲んでください。青い 薬は 熱が ある時だけ 飲んでください。三日たっても 良くならなかったら、もう一度 来てください。',
    {
      'id':
          'Hari ini saya beri obat. Obat putih diminum pagi dan malam setelah makan. Obat biru hanya diminum saat demam. Kalau tiga hari belum membaik, datang lagi.',
      'en':
          "I'll give you medicine today. Take the white pills morning and night after meals. Take the blue pill only when you have a fever. If you're not better after three days, please come again.",
    },
    [
      _q(
        'Kapan obat putih diminum?',
        'When should the white medicine be taken?',
        ['朝と 夜、食事の 後', '朝だけ', '熱が ある時', '寝る前'],
      ),
      _q(
        'Kapan obat biru diminum?',
        'When should the blue medicine be taken?',
        ['熱が ある時だけ', '毎日 三回', '食事の 前', '朝と 夜'],
      ),
      _q('Kapan harus datang lagi?', 'When should the patient come back?', [
        '三日たっても 良くならない時',
        '明日',
        '一週間後',
        '薬が なくなった時',
      ]),
      _q(
        'Berapa kali sehari obat putih diminum?',
        'How many times a day is the white medicine taken?',
        ['二回', '一回', '三回', '四回'],
      ),
      _q(
        'Berapa jenis obat yang diberikan?',
        'How many kinds of medicine were given?',
        ['二つ', '一つ', '三つ', '四つ'],
      ),
    ],
  ),
  _p(
    'ja_4_8',
    'Wisata Kyoto',
    'Trip to Kyoto',
    '先週、家族と 京都へ 行きました。新幹線で 二時間半 かかりました。有名な お寺を 見たり、おいしい 和菓子を 食べたりしました。人が 多かったですが、紅葉が とても きれいでした。',
    {
      'id':
          'Minggu lalu saya pergi ke Kyoto bersama keluarga. Naik Shinkansen dua setengah jam. Kami melihat kuil terkenal dan makan wagashi yang lezat. Orangnya banyak, tapi daun musim gugurnya sangat indah.',
      'en':
          'Last week I went to Kyoto with my family. It took two and a half hours by Shinkansen. We saw famous temples and ate delicious Japanese sweets. It was crowded, but the autumn leaves were very beautiful.',
    },
    [
      _q('Dengan siapa dia pergi?', 'Who did the speaker go with?', [
        '家族',
        '友だち',
        '会社の 人',
        'ひとりで',
      ]),
      _q('Berapa lama naik Shinkansen?', 'How long did the Shinkansen take?', [
        '二時間半',
        '二時間',
        '三時間半',
        '一時間',
      ]),
      _q('Apa yang indah?', 'What was beautiful?', ['紅葉', 'お寺', '和菓子', '海']),
      _q('Kapan dia pergi ke Kyoto?', 'When did the speaker go to Kyoto?', [
        '先週',
        '先月',
        '去年',
        '昨日',
      ]),
      _q('Apa yang dimakan di Kyoto?', 'What did they eat in Kyoto?', [
        '和菓子',
        'ラーメン',
        'すし',
        'カレー',
      ]),
    ],
  ),
];
