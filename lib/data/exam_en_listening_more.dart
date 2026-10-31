import '../models/exam.dart';
import '../models/listening.dart';
import 'mcq_bank.dart';

/// Konten Listening tambahan untuk ujian bahasa Inggris (TOEFL iBT 2026,
/// IELTS, PTE Academic). Audio dibacakan TTS satu suara dari transkrip,
/// jadi pembicara ditandai dengan label teks ("Student:", "Advisor:").
/// Konten disusun sendiri untuk latihan — bukan soal resmi penyelenggara.
/// Pilihan pertama pada [_q] selalu jawaban benar; layar yang mengacaknya.
McqQuestion _q(String id, String en, List<String> options) =>
    McqQuestion(question: {'id': id, 'en': en}, options: options, answer: 0);

ListeningPassage _p(
  String id,
  String titleId,
  String titleEn,
  String transcript,
  String translationId,
  List<McqQuestion> questions,
) => ListeningPassage(
  id: id,
  title: {'id': titleId, 'en': titleEn},
  transcript: transcript,
  translation: {'id': translationId, 'en': transcript},
  questions: questions,
);

/// TOEFL 2026 "Listen and Choose a Response": satu ujaran pendek,
/// satu soal, empat tanggapan (yang pertama paling wajar).
ListeningPassage _cr(
  int n,
  String utterance,
  String translationId,
  List<String> options,
) => ListeningPassage(
  id: 'en_tcr_$n',
  title: {'id': 'Pilih Tanggapan $n', 'en': 'Choose a Response $n'},
  transcript: utterance,
  translation: {'id': translationId, 'en': utterance},
  questions: [
    McqQuestion(
      question: const {
        'id': 'Pilih tanggapan yang paling tepat.',
        'en': 'Choose the best response.',
      },
      options: options,
      answer: 0,
    ),
  ],
);

const Map<String, String> _summaryQ = {
  'id': 'Pilih ringkasan yang paling tepat (Highlight correct summary).',
  'en': 'Highlight the correct summary.',
};

const Map<String, String> _missingQ = {
  'id':
      'Kata/frasa apa yang paling tepat melengkapi kalimat terakhir '
      '(Select missing word)?',
  'en': 'Which word or phrase best completes the final sentence?',
};

McqQuestion _sum(List<String> options) =>
    McqQuestion(question: _summaryQ, options: options, answer: 0);

McqQuestion _miss(List<String> options) =>
    McqQuestion(question: _missingQ, options: options, answer: 0);

const Map<String, String> _pickPrompt = {
  'id': 'Dengarkan, lalu ketuk kata yang BERBEDA dari audio.',
  'en': 'Listen, then tap the word that differs from the recording.',
};

WordPickItem _wp(String spoken, int wrongIndex, String shownWord) =>
    WordPickItem(
      prompt: _pickPrompt,
      spoken: spoken,
      wrongIndex: wrongIndex,
      shownWord: shownWord,
    );

const Map<String, String> _dictPrompt = {
  'id': 'Dengarkan lalu tulis kalimatnya persis.',
  'en': 'Listen and type the sentence exactly.',
};

WritingItem _dict(String sentence) => WritingItem(
  prompt: _dictPrompt,
  text: '',
  answers: [sentence],
  dictation: true,
);

// ---------------------------------------------------------------------------
// 1. TOEFL iBT 2026 — Listen and Choose a Response
// ---------------------------------------------------------------------------

final List<ListeningPassage> toeflChooseResponse = [
  _cr(
    1,
    'Excuse me, is this seat taken?',
    'Permisi, apakah kursi ini sudah ada yang menempati?',
    [
      'No, go ahead and sit down.',
      'Yes, I took the bus today.',
      "It's a very comfortable chair.",
      "I'll take it to the office later.",
    ],
  ),
  _cr(
    2,
    "Have you finished the reading for Professor Lee's class?",
    'Kamu sudah selesai membaca bahan untuk kelas Profesor Lee?',
    [
      'Almost. I just have one chapter left.',
      'Professor Lee teaches on Mondays.',
      'I read about it in the newspaper.',
      'Yes, the class is very large.',
    ],
  ),
  _cr(
    3,
    "Why don't we meet at the cafe before the seminar?",
    'Bagaimana kalau kita bertemu di kafe sebelum seminar?',
    [
      'Good idea. How about two o\'clock?',
      'Because the cafe was closed.',
      'The seminar was about economics.',
      'I met him at the seminar last week.',
    ],
  ),
  _cr(
    4,
    "I can't believe the bookstore sold out of the chemistry textbook.",
    'Aku tidak percaya toko buku kehabisan buku teks kimia.',
    [
      'You could try borrowing a copy from the library.',
      'Chemistry is my favorite subject.',
      'The bookstore opens at nine.',
      'I believe you sold it yesterday.',
    ],
  ),
  _cr(
    5,
    'Where should I submit my scholarship application?',
    'Di mana saya harus menyerahkan aplikasi beasiswa saya?',
    [
      'At the financial aid office in the main building.',
      'By the end of next week.',
      'Yes, I applied for it last year.',
      "It's a very generous scholarship.",
    ],
  ),
  _cr(
    6,
    'When is the lab report due?',
    'Kapan batas pengumpulan laporan praktikum?',
    [
      "It's due this Friday at noon.",
      'In the chemistry building.',
      'Dr. Patel wrote the report.',
      'It took me about three hours.',
    ],
  ),
  _cr(
    7,
    'Would you mind turning the music down a little?',
    'Bisakah kamu mengecilkan musiknya sedikit?',
    [
      "Sorry, I didn't realize it was so loud.",
      'Yes, I really love this song.',
      'I turned left at the corner.',
      'The music store is downtown.',
    ],
  ),
  _cr(
    8,
    'Did you hear that the shuttle bus schedule has changed?',
    'Kamu sudah dengar jadwal bus antar-jemput kampus berubah?',
    [
      'No, I didn\'t. What are the new times?',
      'I usually hear it from my room.',
      'The bus driver was very friendly.',
      "I'd rather take a taxi to the airport.",
    ],
  ),
  _cr(
    9,
    'How did your presentation go this morning?',
    'Bagaimana presentasimu tadi pagi?',
    [
      'Better than I expected, actually.',
      "I'm going there by train.",
      'It starts at ten tomorrow.',
      'I presented my passport at the gate.',
    ],
  ),
  _cr(
    10,
    "I'm thinking of dropping my statistics course.",
    'Aku sedang berpikir untuk mundur dari mata kuliah statistika.',
    [
      'Have you talked to your advisor about it first?',
      'Statistics are just numbers in a table.',
      'I dropped my phone yesterday.',
      'The course is on the third floor.',
    ],
  ),
  _cr(
    11,
    'Could you help me carry these boxes to the dorm?',
    'Bisa bantu aku membawa kotak-kotak ini ke asrama?',
    [
      'Sure, just give me a minute to finish this.',
      'The dorm has four floors.',
      'I carried them all last week.',
      'Those boxes are made of cardboard.',
    ],
  ),
  _cr(
    12,
    "Isn't the cafeteria supposed to be open by now?",
    'Bukankah kantin seharusnya sudah buka sekarang?',
    [
      "It is, but they're running a bit late today.",
      "I'm supposed to eat more vegetables.",
      'The cafeteria food is quite cheap.',
      'I opened the window a moment ago.',
    ],
  ),
  _cr(
    13,
    'Which professor is teaching the summer course on marine biology?',
    'Profesor siapa yang mengajar kuliah musim panas biologi laut?',
    [
      "I think it's Dr. Alvarez this year.",
      'It runs from June to August.',
      'I prefer going to the beach in summer.',
      'Marine biology is a popular major.',
    ],
  ),
  _cr(
    14,
    'Do you want to join our study group for the final exam?',
    'Kamu mau bergabung dengan kelompok belajar kami untuk ujian akhir?',
    [
      "I'd love to. When do you usually meet?",
      'The final exam is worth forty percent.',
      'I studied in a group last semester.',
      'I joined the gym last month.',
    ],
  ),
  _cr(
    15,
    'The printer in the computer lab is out of paper again.',
    'Printer di lab komputer kehabisan kertas lagi.',
    [
      "I'll let the lab assistant know.",
      'I printed my essay yesterday.',
      'The lab closes at ten.',
      'The computers there are brand new.',
    ],
  ),
  _cr(
    16,
    'How long does it take to walk to the science building?',
    'Berapa lama berjalan kaki ke gedung sains?',
    [
      'About ten minutes if you take the shortcut.',
      'It was built in nineteen sixty-five.',
      "It's taller than the library.",
      'I walked there with my roommate.',
    ],
  ),
  _cr(
    17,
    'Have you decided on a topic for your thesis yet?',
    'Kamu sudah menentukan topik skripsimu?',
    [
      "I'm leaning toward urban water management.",
      'The thesis is due in May.',
      'I chose the blue cover.',
      "My advisor's office is upstairs.",
    ],
  ),
  _cr(
    18,
    'Excuse me, I think you dropped your student card.',
    'Permisi, sepertinya kartu mahasiswamu jatuh.',
    [
      "Oh, thank you so much! I didn't notice.",
      'I usually drop by after class.',
      'My card was very expensive.',
      "No, I didn't buy any cards.",
    ],
  ),
  _cr(
    19,
    'Why was the guest lecture canceled?',
    'Mengapa kuliah tamu dibatalkan?',
    [
      "The speaker's flight was delayed.",
      'It was held in Hall B.',
      "I'm not a big fan of lectures.",
      'The guests arrived on time.',
    ],
  ),
  _cr(
    20,
    "Can I borrow your notes from Tuesday's lecture?",
    'Boleh aku pinjam catatanmu dari kuliah hari Selasa?',
    [
      "Of course. I'll send you a copy tonight.",
      'The lecture was on Tuesday.',
      'I borrowed them from the library.',
      'My notebook is green.',
    ],
  ),
  _cr(
    21,
    'I heard the campus gym is offering free yoga classes.',
    'Aku dengar gym kampus menawarkan kelas yoga gratis.',
    [
      'Really? I should sign up before they fill up.',
      'I heard it from the gym.',
      'Yoga was developed long ago.',
      'The campus is very large.',
    ],
  ),
  _cr(
    22,
    'What did you think of the documentary we watched in class?',
    'Bagaimana pendapatmu tentang film dokumenter yang kita tonton di kelas?',
    [
      'It was eye-opening, especially the part about coral reefs.',
      'We watched it on Thursday.',
      'I think the class is at nine.',
      'I usually watch films at home.',
    ],
  ),
  _cr(
    23,
    "Shouldn't you be at your part-time job right now?",
    'Bukankah seharusnya kamu sedang di tempat kerja paruh waktumu sekarang?',
    [
      "My shift doesn't start until four today.",
      'I should get a new phone.',
      "It's part of my weekly plan.",
      'I found the job online.',
    ],
  ),
  _cr(
    24,
    'Are there any tickets left for the spring concert?',
    'Masih ada tiket tersisa untuk konser musim semi?',
    [
      "Only a few, so you'd better hurry.",
      'The concert was wonderful.',
      'I left my ticket at home.',
      'Spring is my favorite season.',
    ],
  ),
  _cr(
    25,
    "I'm having trouble connecting to the campus Wi-Fi.",
    'Aku kesulitan tersambung ke Wi-Fi kampus.',
    [
      'Try forgetting the network and logging in again.',
      'The campus is well connected by bus.',
      'I have trouble sleeping too.',
      'Wi-Fi became popular in the nineties.',
    ],
  ),
  _cr(
    26,
    'Do you know whether the midterm will cover chapter seven?',
    'Kamu tahu apakah ujian tengah semester mencakup bab tujuh?',
    [
      'The professor said it stops at chapter six.',
      'I covered my book with plastic.',
      'Chapter seven is very long.',
      'The midterm is in Room two-ten.',
    ],
  ),
  _cr(
    27,
    'Would you rather take the train or drive to the conference?',
    'Kamu lebih suka naik kereta atau menyetir ke konferensi?',
    [
      'The train, so I can review my slides on the way.',
      'The conference is about robotics.',
      'I drove there last summer.',
      'Yes, I would.',
    ],
  ),
  _cr(
    28,
    "Let's ask the teaching assistant to explain the formula again.",
    'Ayo kita minta asisten dosen menjelaskan rumusnya lagi.',
    [
      'Good idea. Her office hours start at three.',
      'The formula has three variables.',
      'I explained it to my brother.',
      'The assistant is very tall.',
    ],
  ),
  _cr(
    29,
    "Who's in charge of booking a room for the club meeting?",
    'Siapa yang bertugas memesan ruangan untuk rapat klub?',
    [
      'Marcus said he would handle it.',
      'The room holds thirty people.',
      'I booked a flight yesterday.',
      'The meeting went really well.',
    ],
  ),
  _cr(
    30,
    'You look exhausted. Did you stay up late again?',
    'Kamu kelihatan capek sekali. Begadang lagi?',
    [
      'Yes, I was finishing my history essay.',
      'I stayed at a hotel downtown.',
      'No, I look fine in this shirt.',
      "It's late in the semester.",
    ],
  ),
  _cr(
    31,
    'Could you remind me what time the review session starts?',
    'Bisa ingatkan aku jam berapa sesi review dimulai?',
    [
      'Six thirty, in the main auditorium.',
      "I'll review it later.",
      'It lasted about two hours.',
      'The session was very useful.',
    ],
  ),
  _cr(
    32,
    "Hasn't the housing office emailed you about your room assignment?",
    'Kantor perumahan belum mengirimimu email soal pembagian kamar?',
    [
      "Not yet. I'm going to call them this afternoon.",
      'My room is painted white.',
      'I sent the email to my friend.',
      'The housing office is near the gym.',
    ],
  ),
  _cr(
    33,
    "I'm sorry I missed your call last night.",
    'Maaf aku tidak sempat mengangkat teleponmu tadi malam.',
    [
      'No problem. I just wanted to ask about the group project.',
      'I called a taxi last night.',
      'I missed the bus last night too.',
      'My phone is brand new.',
    ],
  ),
  _cr(
    34,
    'Is it all right if I hand in the assignment a day late?',
    'Bolehkah saya mengumpulkan tugas terlambat sehari?',
    [
      'Only if you have a doctor\'s note.',
      'The assignment was handed out yesterday.',
      "I'm all right, thank you.",
      'My hand feels fine now.',
    ],
  ),
];

// ---------------------------------------------------------------------------
// 2. TOEFL iBT 2026 — percakapan kampus, pengumuman, kuliah akademik
// ---------------------------------------------------------------------------

final List<ListeningPassage> toeflListenMore = [
  _p(
    'en_tlm_1',
    'Percakapan: Pindah Jurusan',
    'Conversation: Changing Majors',
    "Student: Hi, Dr. Morgan. Do you have a few minutes? Advisor: Of course, come in. What's on your mind? Student: Well, I'm a biology major, but after taking the introductory environmental science course last semester, I'm thinking about switching. Advisor: That's not unusual. What attracted you to it? Student: I liked that it combines biology with policy and fieldwork. We spent two weekends measuring water quality in the river, and I enjoyed that more than anything in my lab courses. Advisor: Good. The encouraging news is that most of your biology credits will transfer, because environmental science requires general biology and ecology. The main gap is statistics. You'd need to take it next term, since several upper-level courses list it as a prerequisite. Student: Will switching delay my graduation? Advisor: If you take statistics in the spring and one course during the summer session, you should still finish on time. Student: That sounds manageable. What do I need to do officially? Advisor: Fill out a change-of-major form and get a signature from the head of environmental science. I'd suggest emailing her today, because her schedule fills up quickly near registration.",
    'Mahasiswa: Halo, Dr. Morgan. Ada waktu sebentar? Penasihat: Tentu, silakan masuk. Ada apa? Mahasiswa: Saya mahasiswa biologi, tapi setelah mengikuti kuliah pengantar ilmu lingkungan semester lalu, saya berpikir untuk pindah. Penasihat: Itu wajar. Apa yang membuatmu tertarik? Mahasiswa: Saya suka karena memadukan biologi dengan kebijakan dan kerja lapangan. Kami menghabiskan dua akhir pekan mengukur kualitas air sungai, dan saya lebih menikmatinya daripada praktikum mana pun. Penasihat: Bagus. Kabar baiknya, sebagian besar SKS biologimu bisa ditransfer karena ilmu lingkungan mensyaratkan biologi umum dan ekologi. Kekurangan utamanya statistika. Kamu harus mengambilnya semester depan karena beberapa mata kuliah lanjutan mensyaratkannya. Mahasiswa: Apakah pindah akan menunda kelulusan saya? Penasihat: Kalau kamu ambil statistika di musim semi dan satu mata kuliah di semester pendek musim panas, kamu tetap lulus tepat waktu. Mahasiswa: Kedengarannya bisa. Apa yang harus saya lakukan secara resmi? Penasihat: Isi formulir pindah jurusan dan minta tanda tangan ketua program ilmu lingkungan. Sebaiknya email dia hari ini karena jadwalnya cepat penuh menjelang registrasi.',
    [
      _q(
        'Mengapa mahasiswa menemui penasihat?',
        'Why does the student go to see the advisor?',
        [
          'To discuss switching to a different major',
          'To complain about a biology lab',
          'To ask for a summer job',
          'To drop a statistics course',
        ],
      ),
      _q(
        'Apa yang paling dinikmati mahasiswa dari kuliah ilmu lingkungan?',
        'What did the student enjoy most about the environmental science course?',
        [
          'Measuring water quality in the field',
          'Writing policy reports',
          'Working in the chemistry lab',
          'Reading about famous ecologists',
        ],
      ),
      _q(
        'Mata kuliah apa yang masih harus diambil mahasiswa?',
        'Which course does the student still need to take?',
        ['Statistics', 'General biology', 'Ecology', 'Chemistry'],
      ),
      _q(
        'Bagaimana mahasiswa bisa tetap lulus tepat waktu?',
        'How can the student still graduate on time?',
        [
          'By taking one course in the summer session',
          'By dropping two biology courses',
          'By taking statistics online now',
          'By skipping the prerequisite',
        ],
      ),
      _q(
        'Mengapa penasihat menyarankan email ketua program hari ini?',
        'Why does the advisor suggest emailing the department head today?',
        [
          'Her schedule gets busy near registration',
          'The form expires tomorrow',
          'She is leaving the university',
          'The office is closing for the summer',
        ],
      ),
    ],
  ),
  _p(
    'en_tlm_2',
    'Percakapan: Pinjam Antarperpustakaan',
    'Conversation: Interlibrary Loan',
    "Student: Excuse me, I'm looking for a book called The Silent Coast, but the catalog says your library doesn't have it. Librarian: Let me check. You're right, we don't own a copy. But you can request it through interlibrary loan. Student: How does that work? Librarian: We borrow the book from another university for you. You fill out a short online form with the title, the author, and your student number. Student: How long does it usually take? Librarian: For books, about seven to ten days. If you only need one chapter, though, it's much faster. The other library can scan the chapter and send it as a file, usually within two days. Student: Actually, I only need the chapter on fishing communities for my sociology paper. Librarian: Then ask for a chapter scan. Just make sure you write the exact page numbers in the comments box. Student: Is there a fee? Librarian: No, it's free for students. The only charge is if you return a borrowed book late, because the lending library sets its own fines. Student: Great. I'll fill out the form tonight.",
    'Mahasiswa: Permisi, saya mencari buku berjudul The Silent Coast, tapi katalog bilang perpustakaan ini tidak memilikinya. Pustakawan: Saya cek dulu. Benar, kami tidak punya. Tapi kamu bisa memintanya lewat pinjam antarperpustakaan. Mahasiswa: Bagaimana caranya? Pustakawan: Kami meminjam buku itu dari universitas lain untukmu. Kamu isi formulir daring singkat berisi judul, penulis, dan nomor mahasiswamu. Mahasiswa: Biasanya berapa lama? Pustakawan: Untuk buku, sekitar tujuh sampai sepuluh hari. Tapi kalau hanya butuh satu bab, jauh lebih cepat. Perpustakaan lain bisa memindai bab itu dan mengirimkannya sebagai berkas, biasanya dalam dua hari. Mahasiswa: Sebenarnya saya hanya butuh bab tentang komunitas nelayan untuk makalah sosiologi. Pustakawan: Kalau begitu minta pindaian bab. Pastikan kamu menulis nomor halaman yang tepat di kolom komentar. Mahasiswa: Ada biayanya? Pustakawan: Tidak, gratis untuk mahasiswa. Biaya hanya dikenakan kalau buku pinjaman dikembalikan terlambat, karena perpustakaan pemberi pinjaman menetapkan dendanya sendiri. Mahasiswa: Bagus. Saya isi formulirnya malam ini.',
    [
      _q('Apa masalah mahasiswa?', "What is the student's problem?", [
        'The library does not own the book she needs',
        'She lost a borrowed book',
        'Her library card has expired',
        'The catalog website is down',
      ]),
      _q(
        'Mengapa pustakawan menyarankan pindaian bab?',
        'Why does the librarian recommend a chapter scan?',
        [
          'It arrives much faster than a whole book',
          'Whole books cannot be borrowed',
          'It is cheaper than buying the book',
          'The book is too old to lend',
        ],
      ),
      _q(
        'Apa yang harus ditulis mahasiswa di kolom komentar?',
        'What must the student write in the comments box?',
        [
          'The exact page numbers',
          'Her professor\'s name',
          'The reason for the request',
          'Her phone number',
        ],
      ),
      _q(
        'Kapan mahasiswa bisa dikenai biaya?',
        'When might the student have to pay?',
        [
          'If she returns a borrowed book late',
          'If she requests more than one chapter',
          'If she uses the online form',
          'If the book comes from abroad',
        ],
      ),
    ],
  ),
  _p(
    'en_tlm_3',
    'Pengumuman: Renovasi Perpustakaan',
    'Announcement: Library Renovation',
    "Good afternoon, everyone. This is an announcement from University Library Services. Starting next Monday, the second and third floors of the main library will be closed for six weeks while we replace the heating system and install new lighting. During this period, the ground floor will remain open from eight in the morning until ten at night, but the twenty-four-hour study area will be temporarily unavailable. To make up for the lost space, the Science Library on the east side of campus will extend its opening hours and stay open until midnight on weekdays. Books located on the closed floors can still be borrowed. Simply place a request through the library website, and staff will bring the items to the ground-floor service desk within one working day. Group study rooms will also move to the Science Library, so if you have an existing booking, please check your email for your new room number. We apologize for the inconvenience and thank you for your patience.",
    'Selamat siang semuanya. Ini pengumuman dari Layanan Perpustakaan Universitas. Mulai Senin depan, lantai dua dan tiga perpustakaan utama ditutup enam minggu untuk penggantian sistem pemanas dan pemasangan lampu baru. Selama periode ini lantai dasar tetap buka dari pukul delapan pagi hingga sepuluh malam, tetapi area belajar 24 jam untuk sementara tidak tersedia. Sebagai pengganti, Perpustakaan Sains di sisi timur kampus memperpanjang jam buka hingga tengah malam pada hari kerja. Buku di lantai yang ditutup tetap bisa dipinjam. Ajukan permintaan lewat situs perpustakaan, dan staf akan membawanya ke meja layanan lantai dasar dalam satu hari kerja. Ruang belajar kelompok juga pindah ke Perpustakaan Sains, jadi jika kamu sudah memesan, periksa email untuk nomor ruangan baru. Kami mohon maaf atas ketidaknyamanannya dan terima kasih atas kesabaran Anda.',
    [
      _q(
        'Apa tujuan utama pengumuman ini?',
        'What is the main purpose of the announcement?',
        [
          'To explain changes during a library renovation',
          'To introduce new library staff',
          'To announce new borrowing fines',
          'To advertise a study skills course',
        ],
      ),
      _q(
        'Berapa lama lantai atas ditutup?',
        'How long will the upper floors be closed?',
        ['Six weeks', 'One week', 'Three weeks', 'Two months'],
      ),
      _q(
        'Bagaimana mahasiswa bisa mendapatkan buku dari lantai yang ditutup?',
        'How can students get books from the closed floors?',
        [
          'By requesting them online for pickup at the service desk',
          'By asking a librarian to open the floor',
          'By visiting on the weekend',
          'They cannot borrow those books',
        ],
      ),
      _q(
        'Apa yang harus dilakukan mahasiswa yang sudah memesan ruang kelompok?',
        'What should students with a group room booking do?',
        [
          'Check their email for a new room number',
          'Cancel the booking and rebook',
          'Go to the ground floor as usual',
          'Call the Science Library',
        ],
      ),
    ],
  ),
  _p(
    'en_tlm_4',
    'Kuliah: Pulau Panas Perkotaan',
    'Lecture: Urban Heat Islands',
    "Professor: Today I want to talk about something many of you have probably felt without knowing its name: the urban heat island effect. Cities are often several degrees warmer than the countryside around them, especially at night. So why does this happen? First, materials like asphalt and concrete absorb heat during the day and release it slowly after sunset. A dark road surface can reach temperatures above sixty degrees Celsius on a summer afternoon. Second, cities have fewer trees and less soil, so there's less evaporation. Evaporation, remember, is a cooling process, which is why a park feels fresher than a parking lot. Third, cars, air conditioners, and factories all release waste heat directly into the air. Now, this matters for more than comfort. During heat waves, death rates rise faster in the hottest neighborhoods, and electricity demand jumps as people turn on air conditioning. Some cities are responding with cool roofs, which are painted white to reflect sunlight, and with large tree-planting programs. In Melbourne, for example, the city aims to double its tree canopy by twenty forty. Next week, we'll look at data on how well these strategies actually work.",
    'Profesor: Hari ini saya ingin membahas sesuatu yang mungkin pernah kalian rasakan tanpa tahu namanya: efek pulau panas perkotaan. Kota sering beberapa derajat lebih hangat dari pedesaan di sekitarnya, terutama pada malam hari. Mengapa? Pertama, bahan seperti aspal dan beton menyerap panas di siang hari dan melepaskannya perlahan setelah matahari terbenam. Permukaan jalan yang gelap bisa mencapai lebih dari 60 derajat Celsius pada sore musim panas. Kedua, kota punya lebih sedikit pohon dan tanah, sehingga penguapan lebih sedikit. Ingat, penguapan adalah proses pendinginan, itulah sebabnya taman terasa lebih sejuk dari lahan parkir. Ketiga, mobil, pendingin ruangan, dan pabrik melepaskan panas buangan langsung ke udara. Ini penting bukan hanya soal kenyamanan. Saat gelombang panas, angka kematian naik lebih cepat di lingkungan terpanas, dan kebutuhan listrik melonjak karena orang menyalakan AC. Beberapa kota merespons dengan atap sejuk yang dicat putih untuk memantulkan sinar matahari dan program penanaman pohon besar-besaran. Melbourne, misalnya, menargetkan menggandakan tutupan pohonnya pada 2040. Minggu depan kita melihat data seberapa efektif strategi ini.',
    [
      _q('Apa topik utama kuliah ini?', 'What is the lecture mainly about?', [
        'Why cities are warmer than surrounding areas',
        'How air conditioners are designed',
        'The history of Melbourne',
        'Why heat waves are becoming rarer',
      ]),
      _q(
        'Mengapa profesor menyebut taman dan lahan parkir?',
        'Why does the professor mention a park and a parking lot?',
        [
          'To illustrate the cooling effect of evaporation',
          'To compare land prices in cities',
          'To show where cars release heat',
          'To explain where people go during heat waves',
        ],
      ),
      _q('Apa fungsi atap sejuk?', 'What is the purpose of cool roofs?', [
        'To reflect sunlight',
        'To collect rainwater',
        'To generate electricity',
        'To grow plants on buildings',
      ]),
      _q(
        'Apa yang bisa disimpulkan tentang kuliah berikutnya?',
        'What can be inferred about the next class?',
        [
          'It will evaluate the effectiveness of cooling strategies',
          'It will introduce a new topic unrelated to cities',
          'It will take place in Melbourne',
          'It will be a field trip to a park',
        ],
      ),
      _q(
        'Kapan efek pulau panas paling terasa?',
        'When is the heat island effect especially strong?',
        ['At night', 'Early in the morning', 'In winter', 'At midday only'],
      ),
    ],
  ),
  _p(
    'en_tlm_5',
    'Kuliah: Asal-Usul Bulan',
    "Lecture: The Moon's Origin",
    "Professor: Where did the Moon come from? For a long time, astronomers had several competing ideas. One said the Moon formed somewhere else and was captured by Earth's gravity. Another said Earth was spinning so fast that a piece broke off. Neither idea fit the evidence very well. Today, most scientists accept what's called the giant impact hypothesis. About four and a half billion years ago, a body roughly the size of Mars, sometimes called Theia, crashed into the young Earth. The collision threw an enormous amount of rock and debris into orbit, and over time that material came together to form the Moon. What's the evidence? Well, when the Apollo missions brought back lunar rocks, chemists found that their oxygen isotopes are almost identical to those in Earth's rocks. That suggests a shared origin. The Moon also has a very small iron core compared with Earth, which makes sense if it formed mostly from the outer, rocky layers of the two colliding bodies. That said, the hypothesis isn't perfect. If Theia contributed a lot of material, we'd expect the Moon to look a bit more different from Earth than it does. Researchers are still running computer simulations to resolve that puzzle.",
    'Profesor: Dari mana Bulan berasal? Lama sekali para astronom punya beberapa gagasan yang bersaing. Satu mengatakan Bulan terbentuk di tempat lain lalu ditangkap gravitasi Bumi. Yang lain mengatakan Bumi berputar begitu cepat sehingga sebagian terlepas. Keduanya kurang cocok dengan bukti. Kini kebanyakan ilmuwan menerima hipotesis tumbukan raksasa. Sekitar 4,5 miliar tahun lalu, benda seukuran Mars, kadang disebut Theia, menabrak Bumi muda. Tumbukan itu melemparkan banyak sekali batuan dan puing ke orbit, dan lama-kelamaan material itu menyatu membentuk Bulan. Apa buktinya? Saat misi Apollo membawa pulang batuan Bulan, ahli kimia menemukan isotop oksigennya hampir identik dengan batuan Bumi. Itu menunjukkan asal yang sama. Bulan juga memiliki inti besi yang sangat kecil dibanding Bumi, yang masuk akal jika terbentuk terutama dari lapisan luar berbatu kedua benda yang bertabrakan. Meski begitu, hipotesis ini tidak sempurna. Jika Theia menyumbang banyak material, Bulan seharusnya sedikit lebih berbeda dari Bumi daripada kenyataannya. Peneliti masih menjalankan simulasi komputer untuk memecahkan teka-teki itu.',
    [
      _q('Apa topik utama kuliah ini?', 'What is the lecture mainly about?', [
        'The leading explanation for how the Moon formed',
        'The history of the Apollo missions',
        'Why Mars has no moon',
        'How isotopes are measured in labs',
      ]),
      _q(
        'Bukti apa yang mendukung hipotesis tumbukan raksasa?',
        'What evidence supports the giant impact hypothesis?',
        [
          'Lunar and Earth rocks have nearly identical oxygen isotopes',
          'The Moon has a larger iron core than Earth',
          'Theia can still be seen in the sky',
          'The Moon spins faster than Earth',
        ],
      ),
      _q(
        'Mengapa inti besi Bulan kecil?',
        "Why is the Moon's iron core small?",
        [
          'It formed mostly from rocky outer layers',
          'Its iron melted away over time',
          'It was captured from another solar system',
          'The Apollo missions removed samples',
        ],
      ),
      _q(
        'Bagaimana sikap profesor terhadap hipotesis ini?',
        "What is the professor's attitude toward the hypothesis?",
        [
          'She finds it convincing but not completely solved',
          'She believes it has been proven wrong',
          'She thinks the capture theory is better',
          'She considers it pure speculation',
        ],
      ),
    ],
  ),
  _p(
    'en_tlm_6',
    'Percakapan: Minta Perpanjangan',
    'Conversation: Asking for an Extension',
    "Student: Professor Chen, thanks for seeing me. I wanted to ask about the research paper that's due on Friday. Professor: Sure. Is there a problem? Student: Yes. I planned to interview three local farmers for my paper on food markets, but two of them canceled because of the harvest. I've rescheduled, but the earliest date is next Wednesday. Professor: I see. So you're asking for an extension. Student: If possible. I've already finished the literature review and the methods section. It's just the interview analysis that's missing. Professor: Well, I appreciate that you've kept working on it. My general policy is not to give extensions for poor planning, but this is outside your control. I can give you until the following Monday. Student: Thank you so much. Professor: One condition, though. Send me what you've written so far by Friday, as originally scheduled. That way I can give you feedback on the first sections while you finish the interviews. Student: That's actually really helpful. I'll do that. Professor: And next time, try to arrange interviews a little earlier in the semester. People's schedules are always less predictable than we expect.",
    'Mahasiswa: Profesor Chen, terima kasih sudah mau bertemu. Saya ingin bertanya tentang makalah penelitian yang batasnya hari Jumat. Profesor: Tentu. Ada masalah? Mahasiswa: Ya. Saya berencana mewawancarai tiga petani lokal untuk makalah tentang pasar pangan, tapi dua di antaranya membatalkan karena masa panen. Saya sudah menjadwal ulang, tapi tanggal paling cepat Rabu depan. Profesor: Begitu. Jadi kamu minta perpanjangan. Mahasiswa: Kalau memungkinkan. Kajian pustaka dan bagian metode sudah selesai. Hanya analisis wawancara yang belum. Profesor: Saya hargai kamu terus mengerjakannya. Kebijakan saya umumnya tidak memberi perpanjangan karena perencanaan buruk, tapi ini di luar kendalimu. Saya beri waktu sampai Senin berikutnya. Mahasiswa: Terima kasih banyak. Profesor: Satu syarat. Kirimkan yang sudah kamu tulis paling lambat Jumat, sesuai jadwal semula. Dengan begitu saya bisa memberi masukan untuk bagian awal sambil kamu menyelesaikan wawancara. Mahasiswa: Itu sangat membantu. Akan saya lakukan. Profesor: Lain kali, coba atur wawancara sedikit lebih awal di semester. Jadwal orang selalu lebih sulit ditebak daripada yang kita kira.',
    [
      _q(
        'Mengapa mahasiswa butuh perpanjangan?',
        'Why does the student need an extension?',
        [
          'Two interviewees canceled because of the harvest',
          'She was sick for a week',
          'She lost her research notes',
          'She started the paper too late',
        ],
      ),
      _q(
        'Bagian mana yang belum selesai?',
        'Which part of the paper is not finished?',
        [
          'The interview analysis',
          'The literature review',
          'The methods section',
          'The title page',
        ],
      ),
      _q(
        'Mengapa profesor mau memberi perpanjangan?',
        'Why is the professor willing to grant the extension?',
        [
          'The problem was outside the student\'s control',
          'The student has good grades',
          'Other students also asked for one',
          'The deadline was announced too late',
        ],
      ),
      _q(
        'Apa yang harus dikirim mahasiswa pada hari Jumat?',
        'What must the student send by Friday?',
        [
          'The sections she has already written',
          'The complete paper',
          'A list of new interviewees',
          'A signed extension form',
        ],
      ),
    ],
  ),
  _p(
    'en_tlm_7',
    'Pengumuman: Program Sepeda Kampus',
    'Announcement: Campus Bike Share',
    "Attention, students and staff. The Office of Sustainability is pleased to announce the launch of the new campus bike-share program, which begins on the first of next month. Two hundred bicycles will be available at twelve docking stations, including stations outside the main library, the sports center, and each of the residence halls. To use the service, download the campus app and link it to your student or staff card. The first thirty minutes of every ride are free. After that, there is a small charge for every additional fifteen minutes, which goes toward maintenance. Please note that bikes must be returned to a docking station. Bikes left anywhere else will be collected, and the rider will receive a warning. After three warnings, access to the program will be suspended for the rest of the semester. Helmets are not provided, but you can buy one at a discount from the campus bookstore. Finally, we're looking for volunteers to help with bike safety workshops. If you're interested, please email the Office of Sustainability by Friday.",
    'Perhatian, mahasiswa dan staf. Kantor Keberlanjutan dengan senang hati mengumumkan peluncuran program sepeda bersama kampus yang dimulai tanggal satu bulan depan. Dua ratus sepeda tersedia di dua belas stasiun dok, termasuk di depan perpustakaan utama, pusat olahraga, dan setiap asrama. Untuk memakai layanan ini, unduh aplikasi kampus dan hubungkan dengan kartu mahasiswa atau staf. Tiga puluh menit pertama setiap perjalanan gratis. Setelah itu ada biaya kecil untuk setiap tambahan lima belas menit, yang dipakai untuk perawatan. Sepeda harus dikembalikan ke stasiun dok. Sepeda yang ditinggal di tempat lain akan diambil, dan pengendara menerima peringatan. Setelah tiga peringatan, akses ke program ditangguhkan sampai akhir semester. Helm tidak disediakan, tetapi bisa dibeli dengan diskon di toko buku kampus. Terakhir, kami mencari relawan untuk lokakarya keselamatan bersepeda. Jika tertarik, kirim email ke Kantor Keberlanjutan paling lambat Jumat.',
    [
      _q(
        'Apa tujuan utama pengumuman ini?',
        'What is the main purpose of the announcement?',
        [
          'To introduce a new bike-sharing service',
          'To warn about bicycle theft on campus',
          'To announce a new sports center',
          'To ask students to stop cycling',
        ],
      ),
      _q('Berapa lama perjalanan gratis?', 'How long is each free ride?', [
        'Thirty minutes',
        'Fifteen minutes',
        'One hour',
        'Twelve minutes',
      ]),
      _q(
        'Apa akibat menerima tiga peringatan?',
        'What happens after three warnings?',
        [
          'Access is suspended for the rest of the semester',
          'The rider must pay for a new bike',
          'The rider must attend a safety workshop',
          'The student card is cancelled',
        ],
      ),
      _q(
        'Di mana helm bisa dibeli dengan diskon?',
        'Where can helmets be bought at a discount?',
        [
          'At the campus bookstore',
          'At every docking station',
          'At the sports center',
          'At the Office of Sustainability',
        ],
      ),
    ],
  ),
  _p(
    'en_tlm_8',
    'Kuliah: Navigasi Penyu Laut',
    'Lecture: How Sea Turtles Navigate',
    "Professor: Loggerhead sea turtles hatch on beaches in places like Florida, then swim out into the Atlantic and travel thousands of kilometers in a great loop before returning, sometimes decades later, to nest on the very same stretch of coast. How do they find their way with no map? The best-supported answer is the Earth's magnetic field. The field varies in two ways from place to place: in its strength and in its angle, or inclination, relative to the ground. Together, these two values give each location a kind of magnetic signature. In a famous set of experiments, researchers placed hatchlings in a tank surrounded by electric coils that recreated the magnetic signatures of different points along the migration route. The young turtles, which had never been in the ocean, swam in exactly the direction that would keep them on course from those locations. So it seems they're born with a magnetic map. There's an interesting complication, though. The Earth's magnetic field slowly shifts over time, so a returning adult may be aiming for a signature that has moved slightly. Researchers think this may explain why some turtles nest a little further along the coast than where they hatched.",
    'Profesor: Penyu tempayan menetas di pantai seperti di Florida, lalu berenang ke Atlantik dan menempuh ribuan kilometer dalam lingkaran besar sebelum kembali, kadang puluhan tahun kemudian, untuk bertelur di pesisir yang sama persis. Bagaimana mereka menemukan jalan tanpa peta? Jawaban yang paling didukung adalah medan magnet Bumi. Medan ini berbeda dari tempat ke tempat dalam dua hal: kekuatannya dan sudut kemiringannya terhadap tanah. Bersama-sama, dua nilai ini memberi setiap lokasi semacam tanda magnetik. Dalam serangkaian eksperimen terkenal, peneliti menaruh tukik di tangki yang dikelilingi kumparan listrik yang meniru tanda magnetik berbagai titik di rute migrasi. Penyu muda yang belum pernah ke laut itu berenang tepat ke arah yang akan menjaga mereka tetap di jalur dari lokasi tersebut. Jadi tampaknya mereka lahir dengan peta magnetik. Namun ada komplikasi menarik. Medan magnet Bumi perlahan bergeser seiring waktu, sehingga penyu dewasa yang kembali mungkin menuju tanda yang sedikit berpindah. Peneliti menduga ini menjelaskan mengapa sebagian penyu bertelur agak jauh dari tempat mereka menetas.',
    [
      _q('Apa topik utama kuliah ini?', 'What is the lecture mainly about?', [
        'How sea turtles use magnetism to navigate',
        'Why sea turtles are endangered',
        'How turtles choose a mate',
        'The geography of Florida beaches',
      ]),
      _q(
        'Dua sifat medan magnet apa yang disebut?',
        'Which two properties of the magnetic field are mentioned?',
        [
          'Strength and inclination',
          'Temperature and depth',
          'Color and direction',
          'Speed and pressure',
        ],
      ),
      _q(
        'Mengapa profesor menyebut tukik yang belum pernah ke laut?',
        'Why does the professor point out that the hatchlings had never been in the ocean?',
        [
          'To show that the magnetic map is inborn',
          'To show that they were too young to swim',
          'To explain why the experiment failed',
          'To argue that they learn from adult turtles',
        ],
      ),
      _q(
        'Apa yang mungkin menjelaskan penyu bertelur agak jauh dari tempat menetas?',
        'What may explain why some turtles nest away from their birthplace?',
        [
          'The magnetic field shifts slowly over time',
          'Beaches are too crowded',
          'They follow other turtles',
          'Ocean currents carry their eggs',
        ],
      ),
    ],
  ),
  _p(
    'en_tlm_9',
    'Kuliah: Impresionisme dan Tabung Cat',
    'Lecture: Impressionism and the Paint Tube',
    "Professor: When we talk about Impressionism, we usually focus on the artists, Monet, Renoir, Pissarro, and their new way of seeing light. But I'd like you to consider a small piece of technology: the metal paint tube. Before the eighteen-forties, painters stored their colors in pig bladders tied with string. These were messy, they burst easily, and once opened the paint dried quickly. So most serious painting happened indoors, in the studio. Then, in eighteen forty-one, an American painter named John Rand patented a collapsible tin tube with a screw cap. Suddenly paint was portable and stayed fresh for weeks. Around the same time, chemists were producing bright new synthetic pigments, which were cheaper than traditional ones. Put these together and you can see why painters began working outdoors, directly in front of the landscape. They had to paint quickly, because the light changed every few minutes, and that encouraged the loose, visible brushstrokes we now associate with the movement. Renoir reportedly said that without paint in tubes, there would have been no Impressionism. That may be an exaggeration, but it reminds us that artistic change often depends on practical tools as well as ideas.",
    'Profesor: Saat membahas Impresionisme, kita biasanya fokus pada senimannya, Monet, Renoir, Pissarro, dan cara baru mereka melihat cahaya. Tapi saya ingin kalian memperhatikan satu teknologi kecil: tabung cat logam. Sebelum tahun 1840-an, pelukis menyimpan cat dalam kantong kandung kemih babi yang diikat tali. Wadah ini berantakan, mudah pecah, dan begitu dibuka catnya cepat mengering. Jadi kebanyakan lukisan serius dibuat di dalam ruangan, di studio. Lalu pada 1841, pelukis Amerika bernama John Rand mematenkan tabung timah yang bisa dipencet dengan tutup ulir. Tiba-tiba cat mudah dibawa dan tetap segar berminggu-minggu. Sekitar waktu yang sama, ahli kimia menghasilkan pigmen sintetis baru yang cerah dan lebih murah dari pigmen tradisional. Gabungkan keduanya dan terlihat mengapa pelukis mulai bekerja di luar ruangan, langsung di depan pemandangan. Mereka harus melukis cepat karena cahaya berubah setiap beberapa menit, dan itu mendorong sapuan kuas longgar yang kini identik dengan aliran ini. Renoir konon berkata tanpa cat dalam tabung tidak akan ada Impresionisme. Mungkin itu berlebihan, tetapi mengingatkan kita bahwa perubahan seni sering bergantung pada alat praktis selain gagasan.',
    [
      _q(
        'Apa gagasan utama kuliah ini?',
        'What is the main idea of the lecture?',
        [
          'A practical invention helped shape an art movement',
          'Monet invented the metal paint tube',
          'Impressionists preferred studio painting',
          'Synthetic pigments were worse than natural ones',
        ],
      ),
      _q(
        'Apa masalah wadah cat sebelum tabung?',
        'What was the problem with paint containers before tubes?',
        [
          'They burst easily and the paint dried quickly',
          'They were too expensive for most artists',
          'They changed the color of the paint',
          'They were too heavy to lift',
        ],
      ),
      _q(
        'Mengapa pelukis luar ruangan menggunakan sapuan kuas longgar?',
        'Why did outdoor painters use loose brushstrokes?',
        [
          'They had to work quickly as the light changed',
          'Their brushes were of poor quality',
          'Tube paint was too thick',
          'Critics demanded a new style',
        ],
      ),
      _q(
        'Mengapa profesor mengutip Renoir?',
        'Why does the professor quote Renoir?',
        [
          'To emphasize how important the paint tube was',
          'To show that Renoir disliked Monet',
          'To prove that Renoir invented Impressionism',
          'To criticize synthetic pigments',
        ],
      ),
      _q(
        'Bagaimana pandangan profesor tentang ucapan Renoir?',
        "What is the professor's view of Renoir's statement?",
        [
          'It may be exaggerated but makes a valid point',
          'It is completely accurate',
          'It is clearly false',
          'It was probably never said',
        ],
      ),
    ],
  ),
  _p(
    'en_tlm_10',
    'Percakapan: Masalah Teman Sekamar',
    'Conversation: Roommate Problem',
    "Student: Hi, I'd like to talk to someone about my room in Harper Hall. Housing Officer: Sure, have a seat. What seems to be the problem? Student: It's my roommate. We have really different schedules. He works at a restaurant and comes home around two in the morning, and I have eight o'clock classes. I've barely slept properly in weeks. Housing Officer: That sounds difficult. Have you two talked about it? Student: We have. He's actually nice about it, and he tries to be quiet, but the door and the lights still wake me up. Housing Officer: All right. There are two options. First, our residence advisors can run a roommate agreement meeting, where you both agree on things like quiet hours and lighting. That often helps more than people expect. Second, you can apply for a room change. But I should be honest: we're almost full this semester, so the waiting list could be four to six weeks. Student: I think I'd like to try both. Housing Officer: That's sensible. I'll put your name on the list today, and you can contact your residence advisor about the meeting. If the agreement works, you can always take your name off the list later.",
    'Mahasiswa: Halo, saya ingin bicara dengan seseorang tentang kamar saya di Harper Hall. Petugas Perumahan: Tentu, silakan duduk. Apa masalahnya? Mahasiswa: Teman sekamar saya. Jadwal kami sangat berbeda. Dia bekerja di restoran dan pulang sekitar pukul dua pagi, sementara saya ada kelas pukul delapan. Sudah berminggu-minggu saya hampir tidak bisa tidur nyenyak. Petugas: Kedengarannya sulit. Kalian sudah membicarakannya? Mahasiswa: Sudah. Dia sebenarnya baik dan berusaha tidak berisik, tapi pintu dan lampu tetap membangunkan saya. Petugas: Baik. Ada dua pilihan. Pertama, pembimbing asrama bisa mengadakan rapat kesepakatan teman sekamar, di mana kalian menyepakati hal seperti jam tenang dan pencahayaan. Itu sering lebih membantu dari dugaan orang. Kedua, kamu bisa mengajukan pindah kamar. Tapi jujur saja, semester ini kami hampir penuh, jadi daftar tunggunya bisa empat sampai enam minggu. Mahasiswa: Saya ingin mencoba keduanya. Petugas: Itu masuk akal. Saya masukkan namamu ke daftar hari ini, dan kamu bisa menghubungi pembimbing asrama soal rapatnya. Jika kesepakatannya berhasil, kamu bisa mencabut namamu dari daftar nanti.',
    [
      _q('Apa masalah mahasiswa?', "What is the student's problem?", [
        "Her roommate's late hours keep waking her up",
        'Her roommate is rude and noisy on purpose',
        'Her room is too small',
        'She cannot afford the rent',
      ]),
      _q(
        'Bagaimana sikap teman sekamarnya?',
        "How does the student describe her roommate's attitude?",
        [
          'He is considerate and tries to be quiet',
          'He refuses to discuss the problem',
          'He wants to move out',
          'He is never at home',
        ],
      ),
      _q(
        'Mengapa pindah kamar mungkin butuh waktu?',
        'Why might a room change take a long time?',
        [
          'The residence halls are almost full',
          'The paperwork must be approved by the dean',
          'Room changes are only allowed in summer',
          'Her roommate must agree first',
        ],
      ),
      _q(
        'Apa yang diputuskan mahasiswa?',
        'What does the student decide to do?',
        [
          'Join the waiting list and try a roommate agreement',
          'Move off campus immediately',
          'Ask her roommate to quit his job',
          'Only wait for a room change',
        ],
      ),
    ],
  ),
  _p(
    'en_tlm_11',
    'Kuliah: Pidgin dan Kreol',
    'Lecture: Pidgins and Creoles',
    "Professor: Let's continue our discussion of language contact. When groups of people who don't share a language need to communicate regularly, often for trade, they may develop what linguists call a pidgin. A pidgin is a simplified system. It has a small vocabulary, usually borrowed mostly from one dominant language, and very little grammar. You won't find complex verb endings or a fixed way of marking tense. Importantly, a pidgin has no native speakers. Everyone who uses it already speaks another language at home. Now, here's where it gets interesting. If children grow up in a community where a pidgin is the main shared language, they don't just copy it. They expand it. Within a generation or two, the vocabulary grows, and regular grammatical rules appear, for example consistent ways to show past or future time. At that point, the language has native speakers, and we call it a creole. Tok Pisin in Papua New Guinea is a good example. It began as a pidgin used on plantations, and today it's spoken by millions, used in newspapers and parliament, and has a full grammar. Some linguists see creoles as evidence that children have a natural ability to build grammatical structure.",
    'Profesor: Mari lanjutkan pembahasan kontak bahasa. Ketika kelompok orang yang tidak berbagi bahasa perlu berkomunikasi secara rutin, sering untuk perdagangan, mereka bisa mengembangkan apa yang disebut ahli bahasa sebagai pidgin. Pidgin adalah sistem yang disederhanakan. Kosakatanya sedikit, biasanya sebagian besar dipinjam dari satu bahasa dominan, dan tata bahasanya sangat sedikit. Kalian tidak akan menemukan akhiran kata kerja yang rumit atau cara tetap menandai kala. Yang penting, pidgin tidak punya penutur asli. Semua penggunanya sudah berbahasa lain di rumah. Nah, di sinilah menariknya. Jika anak-anak tumbuh di komunitas di mana pidgin adalah bahasa bersama utama, mereka tidak hanya menirunya. Mereka mengembangkannya. Dalam satu atau dua generasi, kosakata bertambah dan muncul aturan tata bahasa yang teratur, misalnya cara konsisten menunjukkan waktu lampau atau akan datang. Pada titik itu bahasanya punya penutur asli, dan kita menyebutnya kreol. Tok Pisin di Papua Nugini adalah contoh yang baik. Awalnya pidgin di perkebunan, kini dituturkan jutaan orang, dipakai di koran dan parlemen, dan memiliki tata bahasa lengkap. Sebagian ahli bahasa melihat kreol sebagai bukti bahwa anak-anak punya kemampuan alami membangun struktur tata bahasa.',
    [
      _q(
        'Apa perbedaan utama pidgin dan kreol?',
        'What is the key difference between a pidgin and a creole?',
        [
          'A creole has native speakers',
          'A pidgin has a larger vocabulary',
          'A creole is used only for trade',
          'A pidgin has more complex grammar',
        ],
      ),
      _q(
        'Siapa yang mengubah pidgin menjadi kreol?',
        'According to the lecture, who turns a pidgin into a creole?',
        [
          'Children who grow up using it',
          'Government language committees',
          'Traders from the dominant language',
          'Linguists who write grammar books',
        ],
      ),
      _q(
        'Mengapa profesor menyebut Tok Pisin?',
        'Why does the professor mention Tok Pisin?',
        [
          'As an example of a pidgin that became a creole',
          'As an example of a language with no grammar',
          'To show that pidgins disappear quickly',
          'To compare it with English',
        ],
      ),
      _q(
        'Apa yang bisa disimpulkan dari pendapat sebagian ahli bahasa?',
        'What do some linguists infer from creoles?',
        [
          'Children naturally create grammatical structure',
          'Adults learn languages faster than children',
          'All languages began as pidgins',
          'Trade languages are always temporary',
        ],
      ),
    ],
  ),
  _p(
    'en_tlm_12',
    'Kuliah: Efek Jeda Belajar',
    'Lecture: The Spacing Effect',
    "Professor: I'd like to start with a question. If you have six hours to study for an exam, is it better to study for six hours the night before, or for one hour a day over six days? Most of you probably know the answer, but you may not know how strong the evidence is. This is called the spacing effect, and it's one of the most reliable findings in psychology. It was first described by Hermann Ebbinghaus in the eighteen-eighties. He taught himself lists of nonsense syllables and tested how quickly he forgot them. He found that when his practice was spread out over several days, he remembered far more than when he crammed. Since then, hundreds of studies have confirmed it, with children, adults, and even in skills like surgery. Why does it work? One explanation is that when you return to material after a gap, you've partly forgotten it, so your brain has to work harder to retrieve it, and that effort strengthens the memory. Here's the strange part. When students are asked which method they prefer, most choose cramming, because it feels more effective at the time. The material seems familiar, so they assume they've learned it. So feeling fluent is not the same as remembering.",
    'Profesor: Saya mulai dengan pertanyaan. Jika kalian punya enam jam untuk belajar menghadapi ujian, lebih baik belajar enam jam semalam sebelumnya, atau satu jam sehari selama enam hari? Kebanyakan dari kalian mungkin tahu jawabannya, tapi mungkin tidak tahu seberapa kuat buktinya. Ini disebut efek jeda, salah satu temuan paling andal dalam psikologi. Pertama kali dijelaskan oleh Hermann Ebbinghaus pada 1880-an. Ia menghafal daftar suku kata tanpa makna dan menguji seberapa cepat ia melupakannya. Ia menemukan bahwa jika latihannya disebar selama beberapa hari, ia mengingat jauh lebih banyak daripada saat belajar kebut semalam. Sejak itu ratusan studi mengonfirmasinya, pada anak-anak, orang dewasa, bahkan untuk keterampilan seperti bedah. Mengapa berhasil? Satu penjelasan: saat kembali ke materi setelah jeda, kalian sudah sebagian lupa, sehingga otak harus bekerja lebih keras untuk mengingatnya, dan usaha itu memperkuat ingatan. Bagian anehnya, saat ditanya metode mana yang disukai, kebanyakan mahasiswa memilih kebut semalam karena terasa lebih efektif saat itu. Materinya terasa akrab, jadi mereka mengira sudah menguasainya. Jadi merasa lancar tidak sama dengan mengingat.',
    [
      _q('Apa topik utama kuliah ini?', 'What is the lecture mainly about?', [
        'Why spreading out study sessions improves memory',
        'The life of Hermann Ebbinghaus',
        'How surgeons are trained',
        'Why exams should be removed',
      ]),
      _q(
        'Apa yang dipelajari Ebbinghaus dalam eksperimennya?',
        'What did Ebbinghaus memorize in his experiments?',
        [
          'Lists of nonsense syllables',
          'Poems and songs',
          'Foreign vocabulary',
          'Telephone numbers',
        ],
      ),
      _q(
        'Mengapa jeda membantu ingatan menurut penjelasan profesor?',
        'According to the professor, why does spacing help memory?',
        [
          'Retrieving partly forgotten material takes effort that strengthens memory',
          'Students sleep more when they study less',
          'Short sessions are less boring',
          'The brain stores information only at night',
        ],
      ),
      _q(
        'Apa maksud profesor dengan "merasa lancar tidak sama dengan mengingat"?',
        'What does the professor mean when she says feeling fluent is not the same as remembering?',
        [
          'Familiar material can create a false sense of learning',
          'Fluent speakers have better memories',
          'Students should read more quickly',
          'Cramming is the best method for languages',
        ],
      ),
    ],
  ),
  _p(
    'en_tlm_13',
    'Pengumuman: Bursa Kerja',
    'Announcement: Career Fair',
    "Good morning. This is a message from the Career Development Center. Our annual spring career fair will take place next Thursday from ten a.m. to four p.m. in the main hall of the student union. More than eighty employers will be attending this year, from engineering firms and banks to non-profit organizations and government agencies. A full list of employers is available on our website, and we strongly recommend that you research the companies you plan to visit. Recruiters are much more impressed by students who ask specific questions. Please bring several printed copies of your resume. If you'd like someone to check your resume before the fair, our advisors are offering fifteen-minute drop-in reviews every afternoon this week between one and three. No appointment is needed. Business casual clothing is recommended. Also, for the first time, we're running a separate session for first- and second-year students who are looking for internships rather than full-time jobs. That session will be held in Room two-oh-four from two o'clock. We hope to see you there.",
    'Selamat pagi. Ini pesan dari Pusat Pengembangan Karier. Bursa kerja musim semi tahunan akan diadakan Kamis depan pukul sepuluh pagi hingga empat sore di aula utama gedung serikat mahasiswa. Lebih dari delapan puluh pemberi kerja hadir tahun ini, mulai dari perusahaan teknik dan bank hingga organisasi nirlaba dan lembaga pemerintah. Daftar lengkapnya ada di situs kami, dan kami sangat menyarankan kalian meriset perusahaan yang akan dikunjungi. Perekrut jauh lebih terkesan pada mahasiswa yang mengajukan pertanyaan spesifik. Bawalah beberapa salinan cetak CV. Jika ingin CV diperiksa sebelum bursa, penasihat kami membuka pemeriksaan tanpa janji selama lima belas menit setiap sore minggu ini antara pukul satu dan tiga. Pakaian kasual bisnis disarankan. Selain itu, untuk pertama kalinya kami mengadakan sesi terpisah untuk mahasiswa tahun pertama dan kedua yang mencari magang, bukan pekerjaan penuh waktu. Sesi itu di Ruang 204 mulai pukul dua. Sampai jumpa di sana.',
    [
      _q(
        'Apa tujuan pengumuman ini?',
        'What is the purpose of the announcement?',
        [
          'To give details about an upcoming career fair',
          'To announce new job openings at the university',
          'To cancel this year\'s career fair',
          'To recruit volunteers for the student union',
        ],
      ),
      _q(
        'Mengapa mahasiswa disarankan meriset perusahaan?',
        'Why are students advised to research the companies?',
        [
          'Recruiters are impressed by specific questions',
          'Only registered students can enter',
          'Some companies will not attend',
          'The fair lasts only one hour',
        ],
      ),
      _q(
        'Bagaimana mahasiswa bisa memeriksakan CV?',
        'How can students get their resume checked?',
        [
          'By dropping in on an afternoon this week',
          'By emailing it to the employers',
          'By booking an appointment next month',
          'By bringing it to Room two-oh-four',
        ],
      ),
      _q('Apa yang baru tahun ini?', 'What is new this year?', [
        'A separate internship session for younger students',
        'A dress code requiring suits',
        'An online-only version of the fair',
        'An entry fee for visitors',
      ]),
    ],
  ),
];

// ---------------------------------------------------------------------------
// 3. IELTS — Bagian 1–4 (formulir, monolog, diskusi tutorial, kuliah)
// ---------------------------------------------------------------------------

final List<ListeningPassage> ieltsListenMore = [
  _p(
    'en_ilm_1',
    'Bagian 1: Memesan Kamar Hotel',
    'Section 1: Booking a Hotel Room',
    "Receptionist: Good morning, Seaview Hotel. How can I help? Caller: Hello, I'd like to book a room for three nights, from the fourteenth of June. Receptionist: Certainly. Would you like a single or a double room? Caller: A double, please. It's for me and my sister. Receptionist: We have a double with a garden view for ninety-five pounds a night, or one with a sea view for a hundred and twenty. Caller: The garden view is fine. Does that include breakfast? Receptionist: Yes, breakfast is served from seven until ten. Could I have your surname, please? Caller: It's Hartley. Receptionist: And a contact number? Caller: Oh seven seven, three nine four, five two one eight. Receptionist: Thank you. Will you be arriving by car? Caller: No, by train. Receptionist: Then you'll want our free shuttle from the station. It leaves every half hour. Check-in is from two p.m.",
    'Resepsionis: Selamat pagi, Hotel Seaview. Ada yang bisa dibantu? Penelepon: Halo, saya ingin memesan kamar untuk tiga malam, mulai 14 Juni. Resepsionis: Tentu. Kamar single atau double? Penelepon: Double. Untuk saya dan saudara perempuan saya. Resepsionis: Ada kamar double dengan pemandangan taman 95 pound per malam, atau pemandangan laut 120 pound. Penelepon: Pemandangan taman saja. Sudah termasuk sarapan? Resepsionis: Ya, sarapan pukul tujuh sampai sepuluh. Boleh tahu nama keluarga Anda? Penelepon: Hartley. Resepsionis: Nomor kontak? Penelepon: 077 394 5218. Resepsionis: Terima kasih. Anda datang dengan mobil? Penelepon: Tidak, naik kereta. Resepsionis: Kalau begitu pakai antar-jemput gratis kami dari stasiun. Berangkat setiap setengah jam. Check-in mulai pukul dua siang.',
    [
      _q(
        'Lengkapi formulir: Jumlah malam = ...',
        'Complete the form: Number of nights = ...',
        ['3', '2', '4', '14'],
      ),
      _q(
        'Lengkapi formulir: Harga kamar per malam = ...',
        'Complete the form: Room price per night = ...',
        ['£95', '£120', '£90', '£125'],
      ),
      _q(
        'Lengkapi formulir: Nama keluarga = ...',
        'Complete the form: Surname = ...',
        ['Hartley', 'Hartford', 'Hardy', 'Hatley'],
      ),
      _q(
        'Bagaimana penelepon akan tiba?',
        'How will the caller travel to the hotel?',
        ['By train', 'By car', 'By bus', 'By taxi'],
      ),
      _q(
        'Seberapa sering antar-jemput berangkat?',
        'How often does the shuttle leave?',
        [
          'Every thirty minutes',
          'Every hour',
          'Every fifteen minutes',
          'Twice a day',
        ],
      ),
    ],
  ),
  _p(
    'en_ilm_2',
    'Bagian 1: Mendaftar Kelas Malam',
    'Section 1: Evening Class Enrolment',
    "Clerk: Westbridge Adult Education Centre, how can I help? Caller: Hi, I'm interested in the Spanish course for beginners. Clerk: We have two beginner groups. One meets on Tuesday evenings, and the other on Thursday evenings. Both run from seven until nine. Caller: Thursday is better for me. How long is the course? Clerk: Ten weeks, starting on the third of October. Caller: And the fee? Clerk: It's one hundred and forty pounds, but if you're over sixty or a full-time student, there's a twenty percent discount. Caller: I'm a student at the college. Clerk: Great, then bring your student card on the first evening. The course book costs eighteen pounds and you buy it from the teacher. Caller: Where are the classes held? Clerk: In Room twelve, on the first floor of the Library Building, not the main building. Parking is free after six. Caller: Perfect. Can I enrol online? Clerk: Yes, through our website, or I can take your details now.",
    'Petugas: Westbridge Adult Education Centre, ada yang bisa dibantu? Penelepon: Hai, saya tertarik dengan kursus bahasa Spanyol untuk pemula. Petugas: Ada dua kelompok pemula. Satu setiap Selasa malam, satu lagi Kamis malam. Keduanya pukul tujuh sampai sembilan. Penelepon: Kamis lebih cocok untuk saya. Berapa lama kursusnya? Petugas: Sepuluh minggu, mulai 3 Oktober. Penelepon: Biayanya? Petugas: 140 pound, tapi jika berusia di atas 60 atau mahasiswa penuh waktu, ada diskon 20 persen. Penelepon: Saya mahasiswa di kampus itu. Petugas: Bagus, bawa kartu mahasiswa di malam pertama. Buku kursus 18 pound dan dibeli dari pengajar. Penelepon: Di mana kelasnya? Petugas: Di Ruang 12, lantai satu Gedung Perpustakaan, bukan gedung utama. Parkir gratis setelah pukul enam. Penelepon: Sempurna. Bisa mendaftar daring? Petugas: Bisa lewat situs kami, atau saya catat data Anda sekarang.',
    [
      _q(
        'Lengkapi formulir: Hari kelas = ...',
        'Complete the form: Day of class = ...',
        ['Thursday', 'Tuesday', 'Wednesday', 'Friday'],
      ),
      _q(
        'Lengkapi formulir: Tanggal mulai = ...',
        'Complete the form: Start date = ...',
        ['3 October', '13 October', '3 November', '10 October'],
      ),
      _q(
        'Berapa persen diskon untuk mahasiswa?',
        'What discount do students receive?',
        ['20%', '10%', '18%', '40%'],
      ),
      _q(
        'Lengkapi formulir: Lokasi = Ruang 12, ...',
        'Complete the form: Location = Room 12, ...',
        [
          'Library Building',
          'Main Building',
          'Science Building',
          'Sports Hall',
        ],
      ),
      _q(
        'Apa yang harus dibawa penelepon di malam pertama?',
        'What should the caller bring on the first evening?',
        [
          'Her student card',
          'The course book',
          'A parking permit',
          'A printed receipt',
        ],
      ),
    ],
  ),
  _p(
    'en_ilm_3',
    'Bagian 1: Menyewa Apartemen',
    'Section 1: Renting a Flat',
    "Agent: Good afternoon, Parkside Lettings. Caller: Hello, I'm calling about the two-bedroom flat on Elm Road that's advertised on your website. Agent: Ah yes, number forty-two. It's still available. Caller: Could you tell me the rent? Agent: It's eight hundred and fifty pounds a month, and that includes water but not electricity or internet. Caller: Is it furnished? Agent: Partly. There's a sofa, beds, and a dining table, but no desks. Caller: That's fine. Is there anywhere to park? Agent: There's no private parking, but residents can buy a street parking permit from the council. Caller: And how far is it from the station? Agent: About a ten-minute walk, and there's a supermarket just around the corner. Caller: When could I view it? Agent: I have slots on Saturday morning at ten or eleven thirty. Caller: Eleven thirty, please. Agent: Lovely. You'll need to pay a deposit of five weeks' rent if you decide to take it.",
    'Agen: Selamat siang, Parkside Lettings. Penelepon: Halo, saya menelepon tentang apartemen dua kamar di Elm Road yang diiklankan di situs Anda. Agen: Ah ya, nomor 42. Masih tersedia. Penelepon: Berapa sewanya? Agen: 850 pound per bulan, termasuk air tapi tidak termasuk listrik dan internet. Penelepon: Sudah berperabot? Agen: Sebagian. Ada sofa, tempat tidur, dan meja makan, tapi tidak ada meja belajar. Penelepon: Tidak apa-apa. Ada tempat parkir? Agen: Tidak ada parkir pribadi, tapi penghuni bisa membeli izin parkir jalan dari pemerintah kota. Penelepon: Seberapa jauh dari stasiun? Agen: Sekitar sepuluh menit jalan kaki, dan ada supermarket di dekat situ. Penelepon: Kapan bisa melihat? Agen: Ada jadwal Sabtu pagi pukul sepuluh atau sebelas tiga puluh. Penelepon: Sebelas tiga puluh. Agen: Baik. Jika jadi menyewa, Anda perlu membayar deposit lima minggu sewa.',
    [
      _q(
        'Lengkapi formulir: Alamat = ... Elm Road',
        'Complete the form: Address = ... Elm Road',
        ['42', '24', '14', '40'],
      ),
      _q(
        'Apa yang sudah termasuk dalam sewa?',
        'What is included in the rent?',
        ['Water', 'Electricity', 'Internet', 'Parking'],
      ),
      _q('Perabot apa yang TIDAK ada?', 'Which furniture is NOT provided?', [
        'Desks',
        'A sofa',
        'Beds',
        'A dining table',
      ]),
      _q(
        'Lengkapi formulir: Waktu melihat = Sabtu, ...',
        'Complete the form: Viewing time = Saturday, ...',
        ['11:30', '10:00', '10:30', '11:00'],
      ),
      _q('Berapa deposit yang diminta?', 'How much deposit is required?', [
        "Five weeks' rent",
        "One month's rent",
        "Four weeks' rent",
        "Two months' rent",
      ]),
    ],
  ),
  _p(
    'en_ilm_4',
    'Bagian 2: Festival Kota',
    'Section 2: Town Festival',
    "Hello, everyone, and thanks for tuning in to Radio Ashford. I'm here to tell you about this year's Ashford Summer Festival, which runs from Friday the ninth to Sunday the eleventh of August. The festival opens on Friday evening with a free concert in Victoria Park, starting at seven. On Saturday, the market square will host over sixty food stalls, and there'll be cooking demonstrations every two hours. Please note that the craft fair, which used to be in the square, has moved to the town hall this year because of building work. Families will be pleased to hear that the children's area by the river is bigger than ever, with puppet shows and face painting, and it's free for under-twelves. The highlight on Sunday is the boat race, which begins at two p.m. at the old bridge. The festival finishes with fireworks at ten. Parking in the town centre will be very limited, so we're advising visitors to use the park-and-ride service from the leisure centre, which costs just two pounds return.",
    'Halo semuanya, terima kasih sudah mendengarkan Radio Ashford. Saya akan menceritakan Festival Musim Panas Ashford tahun ini, yang berlangsung dari Jumat 9 hingga Minggu 11 Agustus. Festival dibuka Jumat malam dengan konser gratis di Victoria Park mulai pukul tujuh. Pada Sabtu, alun-alun pasar akan menampung lebih dari enam puluh kios makanan, dan ada demo memasak setiap dua jam. Perlu dicatat, pameran kerajinan yang dulu di alun-alun pindah ke balai kota tahun ini karena ada pekerjaan konstruksi. Keluarga akan senang mendengar area anak di tepi sungai lebih besar dari sebelumnya, dengan pertunjukan boneka dan lukis wajah, dan gratis untuk anak di bawah dua belas tahun. Acara utama hari Minggu adalah lomba perahu, mulai pukul dua siang di jembatan lama. Festival ditutup dengan kembang api pukul sepuluh. Parkir di pusat kota akan sangat terbatas, jadi pengunjung disarankan memakai layanan park-and-ride dari pusat rekreasi, hanya dua pound pulang-pergi.',
    [
      _q(
        'Di mana konser pembukaan diadakan?',
        'Where is the opening concert held?',
        [
          'Victoria Park',
          'The market square',
          'The town hall',
          'The leisure centre',
        ],
      ),
      _q(
        'Cocokkan: Pameran kerajinan → ...',
        'Match the event to its location: Craft fair → ...',
        [
          'The town hall',
          'The market square',
          'By the river',
          'The old bridge',
        ],
      ),
      _q(
        'Mengapa pameran kerajinan pindah tempat?',
        'Why has the craft fair moved?',
        [
          'Because of building work',
          'Because it needed more space',
          'Because of bad weather',
          'Because the food stalls took over',
        ],
      ),
      _q('Kapan lomba perahu dimulai?', 'When does the boat race start?', [
        '2 p.m. on Sunday',
        '7 p.m. on Friday',
        '10 p.m. on Sunday',
        '2 p.m. on Saturday',
      ]),
      _q(
        'Apa yang disarankan untuk pengunjung yang membawa mobil?',
        'What are visitors with cars advised to do?',
        [
          'Use the park-and-ride service',
          'Park in the town centre early',
          'Park by the river',
          'Arrive after ten p.m.',
        ],
      ),
    ],
  ),
  _p(
    'en_ilm_5',
    'Bagian 2: Tur Museum',
    'Section 2: Museum Tour',
    "Good morning, and welcome to the Northgate Museum of Science. My name is Helen, and I'll be your guide today. Before we start, a few practical points. Bags larger than a laptop case must be left in the cloakroom, which is to the left of the main entrance. Photography is allowed everywhere except in the special exhibition on the top floor. Now, let me explain the layout. On the ground floor you'll find the transport gallery, with our famous steam locomotive. The first floor is dedicated to space exploration, and that's where the planetarium is. Shows there run every hour on the hour and last twenty minutes. On the second floor is the hands-on discovery zone, which is particularly popular with younger visitors. The café is in the basement, next to the gift shop. Our tour today will last about ninety minutes, and we'll finish in the space gallery so that you can catch the twelve o'clock planetarium show if you'd like to.",
    'Selamat pagi, selamat datang di Museum Sains Northgate. Nama saya Helen, dan saya pemandu Anda hari ini. Sebelum mulai, beberapa hal praktis. Tas yang lebih besar dari tas laptop harus dititipkan di ruang penitipan di sebelah kiri pintu masuk utama. Memotret diperbolehkan di mana saja kecuali di pameran khusus di lantai teratas. Sekarang saya jelaskan tata letaknya. Di lantai dasar ada galeri transportasi dengan lokomotif uap kami yang terkenal. Lantai satu khusus untuk penjelajahan antariksa, dan di sanalah planetarium. Pertunjukannya setiap jam tepat dan berlangsung dua puluh menit. Di lantai dua ada zona penemuan interaktif yang sangat populer di kalangan pengunjung muda. Kafe ada di ruang bawah tanah, di sebelah toko suvenir. Tur hari ini sekitar sembilan puluh menit, dan kita akan selesai di galeri antariksa supaya Anda bisa menonton pertunjukan planetarium pukul dua belas jika mau.',
    [
      _q(
        'Di mana tas besar harus ditinggal?',
        'Where must large bags be left?',
        [
          'In the cloakroom by the main entrance',
          'In the gift shop',
          'In the basement café',
          'On the top floor',
        ],
      ),
      _q('Di mana memotret dilarang?', 'Where is photography not allowed?', [
        'In the special exhibition',
        'In the transport gallery',
        'In the planetarium',
        'In the discovery zone',
      ]),
      _q(
        'Cocokkan: Planetarium → lantai ...',
        'Match the attraction to its floor: Planetarium → ...',
        ['First floor', 'Ground floor', 'Second floor', 'Basement'],
      ),
      _q(
        'Cocokkan: Kafe → ...',
        'Match the facility to its location: Café → ...',
        ['Basement', 'Ground floor', 'First floor', 'Top floor'],
      ),
      _q(
        'Berapa lama pertunjukan planetarium?',
        'How long does each planetarium show last?',
        ['Twenty minutes', 'One hour', 'Ninety minutes', 'Thirty minutes'],
      ),
    ],
  ),
  _p(
    'en_ilm_6',
    'Bagian 3: Diskusi Proyek Daur Ulang',
    'Section 3: Recycling Project Tutorial',
    "Tutor: So, how's your project on campus recycling going? Maya: Quite well, I think. We did a survey of two hundred students, and we found that most people want to recycle but don't know which bin to use. Tom: Yes, about seventy percent said the labels were confusing. Tutor: That's a useful finding. How are you going to present it? Tom: We were planning a bar chart. Tutor: A bar chart works, but have you thought about including photographs of the actual bins? That would make the problem much clearer to your audience. Maya: Good idea. We could take them this week. Tutor: What about your recommendations? Maya: We want to suggest colour-coded bins with pictures instead of words. Tom: I'm less sure about that. Some international students told us that colour systems differ between countries, so colours alone might not help. Tutor: That's a fair point, Tom. Perhaps combine colours with clear images. And one more thing: your reference list needs to follow the department style. At the moment, it's inconsistent. Maya: We'll fix that before the deadline on the twentieth.",
    'Tutor: Bagaimana proyek kalian tentang daur ulang di kampus? Maya: Cukup baik. Kami menyurvei dua ratus mahasiswa, dan menemukan kebanyakan ingin mendaur ulang tapi tidak tahu tempat sampah mana yang harus dipakai. Tom: Ya, sekitar tujuh puluh persen bilang labelnya membingungkan. Tutor: Temuan yang berguna. Bagaimana kalian akan menyajikannya? Tom: Kami berencana memakai diagram batang. Tutor: Diagram batang bisa, tapi pernah terpikir menyertakan foto tempat sampahnya? Itu akan membuat masalahnya lebih jelas bagi audiens. Maya: Ide bagus. Kami bisa memotretnya minggu ini. Tutor: Rekomendasi kalian? Maya: Kami ingin menyarankan tempat sampah berkode warna dengan gambar, bukan kata-kata. Tom: Saya kurang yakin. Beberapa mahasiswa internasional bilang sistem warna berbeda antarnegara, jadi warna saja mungkin tidak membantu. Tutor: Poin yang masuk akal, Tom. Mungkin gabungkan warna dengan gambar yang jelas. Satu lagi: daftar pustaka kalian harus mengikuti gaya jurusan. Saat ini tidak konsisten. Maya: Kami perbaiki sebelum tenggat tanggal dua puluh.',
    [
      _q(
        'Apa temuan utama survei mereka?',
        'What was the main finding of their survey?',
        [
          'Students want to recycle but find the bins confusing',
          'Most students do not want to recycle',
          'There are not enough bins on campus',
          'International students recycle the most',
        ],
      ),
      _q(
        'Berapa mahasiswa yang disurvei?',
        'How many students were surveyed?',
        ['200', '70', '120', '20'],
      ),
      _q(
        'Apa yang disarankan tutor untuk presentasi?',
        'What does the tutor suggest adding to the presentation?',
        [
          'Photographs of the bins',
          'A pie chart',
          'A video interview',
          'More survey questions',
        ],
      ),
      _q(
        'Mengapa Tom ragu soal tempat sampah berkode warna?',
        'Why does Tom have doubts about colour-coded bins?',
        [
          'Colour systems differ between countries',
          'They are too expensive',
          'Some students are colour-blind',
          'The university has rejected the idea',
        ],
      ),
      _q(
        'Apa yang perlu diperbaiki sebelum tenggat?',
        'What do they need to correct before the deadline?',
        [
          'The reference list',
          'The survey data',
          'The bar chart colours',
          'The project title',
        ],
      ),
    ],
  ),
  _p(
    'en_ilm_7',
    'Bagian 3: Studi Kasus Pemasaran',
    'Section 3: Marketing Case Study',
    "Lecturer: Right, Sam and Priya, you chose the case study on the small bakery chain. What did you conclude? Sam: Well, the company grew very quickly from two shops to fifteen in four years, mostly because of social media. Priya: They posted short videos of bakers at work early in the morning, and people loved them. Their followers increased from a few hundred to over fifty thousand. Lecturer: And did that translate into sales? Sam: At first, yes. But then the quality became inconsistent, and online reviews started to get worse. Priya: Personally, I think the real problem was training. They opened new shops faster than they could train staff. Sam: I'm not sure I agree. I think the bigger issue was the supply of ingredients. They changed to a cheaper flour supplier. Lecturer: Both are valid interpretations, and you can present both. But you need evidence. Do you have figures on staff training or supplier costs? Priya: Only for training. Lecturer: Then focus your argument there, and mention the supplier issue as a possibility for further research.",
    'Dosen: Baik, Sam dan Priya, kalian memilih studi kasus jaringan toko roti kecil. Apa kesimpulan kalian? Sam: Perusahaan itu tumbuh sangat cepat dari dua toko menjadi lima belas dalam empat tahun, terutama karena media sosial. Priya: Mereka mengunggah video pendek tukang roti bekerja pagi-pagi, dan orang menyukainya. Pengikut mereka naik dari beberapa ratus menjadi lebih dari lima puluh ribu. Dosen: Apakah itu berdampak pada penjualan? Sam: Awalnya ya. Tapi lalu kualitasnya tidak konsisten, dan ulasan daring memburuk. Priya: Menurut saya masalah sebenarnya pelatihan. Mereka membuka toko baru lebih cepat daripada kemampuan melatih staf. Sam: Saya kurang setuju. Menurut saya masalah yang lebih besar pasokan bahan. Mereka pindah ke pemasok tepung yang lebih murah. Dosen: Keduanya tafsiran yang sah, dan kalian bisa menyajikan keduanya. Tapi kalian butuh bukti. Ada angka soal pelatihan staf atau biaya pemasok? Priya: Hanya untuk pelatihan. Dosen: Kalau begitu fokuskan argumen di sana, dan sebut masalah pemasok sebagai kemungkinan untuk penelitian lanjutan.',
    [
      _q(
        'Berapa toko yang dimiliki perusahaan setelah empat tahun?',
        'How many shops did the company have after four years?',
        ['Fifteen', 'Two', 'Fifty', 'Four'],
      ),
      _q(
        'Apa yang membuat perusahaan tumbuh cepat?',
        'What mainly caused the company to grow quickly?',
        [
          'Social media videos',
          'Low prices',
          'Television advertising',
          'A celebrity owner',
        ],
      ),
      _q(
        'Cocokkan pendapat: Priya → masalah utama adalah ...',
        "Match the opinion: Priya → the main problem was ...",
        [
          'Staff training',
          'The flour supplier',
          'Online reviews',
          'Shop locations',
        ],
      ),
      _q(
        'Cocokkan pendapat: Sam → masalah utama adalah ...',
        'Match the opinion: Sam → the main problem was ...',
        [
          'The supply of ingredients',
          'Staff training',
          'Social media',
          'High rent',
        ],
      ),
      _q('Apa saran dosen?', "What is the lecturer's advice?", [
        'Focus on the argument supported by evidence',
        'Choose a different case study',
        'Ignore the supplier issue completely',
        'Interview the bakery owner',
      ]),
    ],
  ),
  _p(
    'en_ilm_8',
    'Bagian 4: Kuliah Sejarah Kaca',
    'Section 4: Lecture on the History of Glass',
    "Today's lecture is about the history of glass, a material we now take completely for granted. The earliest known glass objects are beads from Mesopotamia, dating back around four and a half thousand years. For centuries, glass was a luxury, because it was difficult to produce and was made by shaping molten glass around a core of sand and clay. The great breakthrough came in the first century BC, probably in the region of modern-day Syria, with the invention of glassblowing. By blowing air through a hollow pipe, a craftsman could make thin vessels quickly and cheaply. The Romans spread the technique across their empire, and glass cups became common household items. Later, in the thirteenth century, the city of Venice became Europe's centre of glassmaking. In fact, the government moved all the glassmakers to the island of Murano, partly to reduce the risk of fire in the city and partly to protect their trade secrets. Finally, in the nineteen-fifties, the float glass process was developed in Britain. Molten glass is poured onto a bed of liquid tin, producing perfectly flat sheets. Almost all window glass today is still made this way.",
    'Kuliah hari ini tentang sejarah kaca, bahan yang kini kita anggap biasa saja. Benda kaca tertua yang diketahui adalah manik-manik dari Mesopotamia, berusia sekitar 4.500 tahun. Selama berabad-abad kaca adalah barang mewah karena sulit diproduksi dan dibuat dengan membentuk kaca cair di sekitar inti pasir dan tanah liat. Terobosan besar terjadi pada abad pertama SM, kemungkinan di wilayah Suriah modern, dengan ditemukannya teknik tiup kaca. Dengan meniupkan udara melalui pipa berongga, perajin bisa membuat wadah tipis dengan cepat dan murah. Bangsa Romawi menyebarkan teknik ini ke seluruh kekaisaran, dan cangkir kaca menjadi barang rumah tangga biasa. Kemudian pada abad ketiga belas, Venesia menjadi pusat pembuatan kaca Eropa. Bahkan pemerintah memindahkan semua pembuat kaca ke pulau Murano, sebagian untuk mengurangi risiko kebakaran di kota dan sebagian untuk melindungi rahasia dagang. Akhirnya, pada 1950-an, proses kaca apung dikembangkan di Inggris. Kaca cair dituang di atas lapisan timah cair, menghasilkan lembaran yang benar-benar rata. Hampir semua kaca jendela saat ini masih dibuat dengan cara itu.',
    [
      _q(
        'Apa benda kaca tertua yang diketahui?',
        'What are the earliest known glass objects?',
        ['Beads', 'Cups', 'Windows', 'Bottles'],
      ),
      _q(
        'Apa dampak teknik tiup kaca?',
        'What was the effect of glassblowing?',
        [
          'Glass vessels became quick and cheap to make',
          'Glass became more expensive',
          'Glass could be made without heat',
          'Flat window glass became possible',
        ],
      ),
      _q(
        'Mengapa pembuat kaca dipindahkan ke Murano?',
        'Why were glassmakers moved to Murano?',
        [
          'To reduce fire risk and protect trade secrets',
          'To be closer to supplies of sand',
          'To train new apprentices',
          'To avoid paying taxes',
        ],
      ),
      _q(
        'Cocokkan: Proses kaca apung → ...',
        'Match the development to the place: Float glass process → ...',
        ['Britain', 'Venice', 'Syria', 'Mesopotamia'],
      ),
      _q(
        'Di atas apa kaca cair dituang dalam proses kaca apung?',
        'In the float process, what is molten glass poured onto?',
        ['Liquid tin', 'Wet sand', 'Cold water', 'A steel plate'],
      ),
    ],
  ),
  _p(
    'en_ilm_9',
    'Bagian 4: Kuliah Tidur dan Ingatan',
    'Section 4: Lecture on Sleep and Memory',
    "Good afternoon. In this lecture, I'll look at the relationship between sleep and memory. For a long time, sleep was seen as a passive state, simply a period of rest. We now know that the brain is extremely active during sleep, and that one of its main jobs is to consolidate memories, which means turning fragile new memories into stable, long-term ones. Two stages of sleep seem particularly important. Deep sleep, also called slow-wave sleep, mostly occurs in the first half of the night and appears to strengthen memories of facts and events. REM sleep, when most dreaming happens, is more common towards the morning, and it seems to support emotional memories and creative problem-solving. One well-known study asked participants to learn a list of word pairs in the evening. Half then slept normally, while the other half stayed awake all night. Even after both groups had two nights of recovery sleep, the group that missed sleep remembered about forty percent less. The practical message for students is clear. Staying up all night before an exam is likely to damage the very memories you're trying to build.",
    'Selamat siang. Dalam kuliah ini saya membahas hubungan antara tidur dan ingatan. Lama sekali tidur dianggap keadaan pasif, sekadar waktu istirahat. Kini kita tahu otak sangat aktif saat tidur, dan salah satu tugas utamanya adalah mengonsolidasi ingatan, yaitu mengubah ingatan baru yang rapuh menjadi ingatan jangka panjang yang stabil. Dua tahap tidur tampak sangat penting. Tidur dalam, disebut juga tidur gelombang lambat, kebanyakan terjadi di paruh pertama malam dan tampaknya memperkuat ingatan tentang fakta dan peristiwa. Tidur REM, saat kebanyakan mimpi terjadi, lebih sering menjelang pagi dan tampaknya mendukung ingatan emosional serta pemecahan masalah kreatif. Satu studi terkenal meminta peserta mempelajari daftar pasangan kata di malam hari. Separuh lalu tidur normal, separuh lagi terjaga semalaman. Bahkan setelah kedua kelompok tidur pemulihan dua malam, kelompok yang kurang tidur mengingat sekitar 40 persen lebih sedikit. Pesan praktis bagi mahasiswa jelas: begadang semalaman sebelum ujian kemungkinan merusak ingatan yang justru sedang kalian bangun.',
    [
      _q(
        'Apa arti "konsolidasi" ingatan dalam kuliah ini?',
        'What does "consolidating" memories mean in this lecture?',
        [
          'Turning new memories into stable long-term ones',
          'Deleting unimportant memories',
          'Creating dreams from memories',
          'Sharing memories with other people',
        ],
      ),
      _q(
        'Cocokkan: Tidur dalam → memperkuat ingatan tentang ...',
        'Match the sleep stage: Deep sleep → strengthens memories of ...',
        ['Facts and events', 'Emotions', 'Physical skills only', 'Dreams'],
      ),
      _q(
        'Kapan tidur REM paling sering terjadi?',
        'When is REM sleep most common?',
        [
          'Towards the morning',
          'In the first hour of sleep',
          'In the first half of the night',
          'During afternoon naps',
        ],
      ),
      _q(
        'Berapa lebih sedikit yang diingat kelompok yang terjaga?',
        'How much less did the sleep-deprived group remember?',
        ['About 40%', 'About 14%', 'About 4%', 'About 60%'],
      ),
      _q(
        'Apa pesan dosen kepada mahasiswa?',
        "What is the lecturer's message to students?",
        [
          'Avoid staying up all night before exams',
          'Study only in the morning',
          'Take more naps during lectures',
          'Learn word pairs before bed',
        ],
      ),
    ],
  ),
  _p(
    'en_ilm_10',
    'Bagian 4: Kuliah Peternakan Lebah Kota',
    'Section 4: Lecture on Urban Beekeeping',
    "In today's session, I'm going to talk about urban beekeeping, which has grown rapidly in cities like London, Paris, and New York. Rooftop hives are now found on hotels, office blocks, and even museums. Supporters argue that city bees are surprisingly healthy. Urban areas often contain a wider variety of flowering plants than farmland, where single crops dominate, and cities use fewer pesticides. As a result, city honey can be more varied in flavour. However, recent research has raised a concern. In London, the number of hives more than doubled over a decade, and some scientists now believe there may not be enough flowers to support them all. Honeybees compete for the same nectar and pollen as wild bees, such as bumblebees and solitary bees, which are far more threatened. In other words, adding more honeybee hives may actually harm the wild species that people intended to help. So what's the solution? Many ecologists now recommend that cities focus on planting more flowers, particularly native species, rather than adding hives. Green roofs, wildflower verges along roads, and even window boxes can all make a difference.",
    'Dalam sesi hari ini saya membahas peternakan lebah perkotaan, yang tumbuh pesat di kota seperti London, Paris, dan New York. Sarang di atap kini ada di hotel, gedung kantor, bahkan museum. Pendukungnya berpendapat lebah kota ternyata sehat. Kawasan kota sering memiliki ragam tanaman berbunga lebih banyak daripada lahan pertanian yang didominasi satu tanaman, dan kota memakai lebih sedikit pestisida. Akibatnya, madu kota bisa lebih beragam rasanya. Namun penelitian terbaru menimbulkan kekhawatiran. Di London, jumlah sarang naik lebih dari dua kali lipat dalam satu dekade, dan sebagian ilmuwan kini yakin mungkin tidak cukup bunga untuk semuanya. Lebah madu bersaing memperebutkan nektar dan serbuk sari yang sama dengan lebah liar, seperti bumblebee dan lebah soliter, yang jauh lebih terancam. Dengan kata lain, menambah sarang lebah madu justru bisa merugikan spesies liar yang ingin dibantu. Lalu apa solusinya? Banyak ahli ekologi kini menyarankan kota fokus menanam lebih banyak bunga, terutama spesies asli, daripada menambah sarang. Atap hijau, tepi jalan berbunga liar, bahkan pot jendela bisa membuat perbedaan.',
    [
      _q(
        'Mengapa lebah kota bisa sehat menurut pendukungnya?',
        'According to supporters, why can city bees be healthy?',
        [
          'Cities have more plant variety and fewer pesticides',
          'Cities are warmer in winter',
          'City bees are fed sugar by keepers',
          'There are no predators in cities',
        ],
      ),
      _q(
        'Apa yang terjadi pada jumlah sarang di London?',
        'What happened to the number of hives in London?',
        [
          'It more than doubled in ten years',
          'It fell by half',
          'It stayed the same',
          'It tripled in two years',
        ],
      ),
      _q(
        'Apa kekhawatiran utama para ilmuwan?',
        'What is the main concern raised by scientists?',
        [
          'Honeybees may compete with threatened wild bees',
          'City honey is unsafe to eat',
          'Rooftop hives damage buildings',
          'Honeybees spread pesticides',
        ],
      ),
      _q(
        'Apa yang direkomendasikan ahli ekologi?',
        'What do many ecologists recommend?',
        [
          'Planting more native flowers instead of adding hives',
          'Banning beekeeping in cities',
          'Moving hives to farmland',
          'Importing more bumblebees',
        ],
      ),
    ],
  ),
  _p(
    'en_ilm_11',
    'Bagian 2: Info Pusat Olahraga',
    'Section 2: Sports Centre Information',
    "Hi, everyone. Welcome to the Greenfield Sports Centre induction. I'll quickly run through the facilities and rules. The main pool is twenty-five metres long, and lane swimming is available every morning from six until nine. From nine until midday, the pool is used for school lessons, so it's closed to the public. The gym is on the first floor. Before you use any equipment, you must book a free forty-five-minute induction with one of our trainers, even if you've used a gym before. The climbing wall, which opened last spring, is next to the sports hall. Beginners must attend a supervised session first, and these run on Wednesday and Saturday afternoons. As for lockers, they take a one-pound coin, which you get back when you open the locker again. Please remember that towels aren't provided, but you can hire one from reception for a small fee. Finally, our café now offers a ten percent discount for members every weekday after six p.m.",
    'Hai semuanya. Selamat datang di pengenalan Pusat Olahraga Greenfield. Saya akan menjelaskan fasilitas dan aturan secara singkat. Kolam utama panjangnya 25 meter, dan renang jalur tersedia setiap pagi pukul enam sampai sembilan. Dari pukul sembilan sampai tengah hari kolam dipakai untuk pelajaran sekolah, jadi ditutup untuk umum. Gym ada di lantai satu. Sebelum memakai alat apa pun, Anda wajib memesan pengenalan gratis 45 menit dengan salah satu pelatih kami, meski sudah pernah ke gym. Dinding panjat yang dibuka musim semi lalu ada di sebelah aula olahraga. Pemula wajib mengikuti sesi dengan pengawasan dulu, setiap Rabu dan Sabtu sore. Loker memakai koin satu pound yang dikembalikan saat loker dibuka lagi. Ingat, handuk tidak disediakan, tetapi bisa disewa di resepsionis dengan biaya kecil. Terakhir, kafe kami kini memberi diskon sepuluh persen untuk anggota setiap hari kerja setelah pukul enam sore.',
    [
      _q(
        'Mengapa kolam tutup untuk umum antara pukul 9 dan 12?',
        'Why is the pool closed to the public from 9 to 12?',
        [
          'It is used for school lessons',
          'It is cleaned every morning',
          'It is reserved for members',
          'It is used for competitions',
        ],
      ),
      _q(
        'Apa yang wajib dilakukan sebelum memakai gym?',
        'What must everyone do before using the gym?',
        [
          'Book a free induction with a trainer',
          'Pay a joining fee',
          'Show a medical certificate',
          'Attend a climbing session',
        ],
      ),
      _q(
        'Cocokkan: Dinding panjat → ...',
        'Match the facility to its location: Climbing wall → ...',
        [
          'Next to the sports hall',
          'On the first floor',
          'Beside the café',
          'Near reception',
        ],
      ),
      _q(
        'Bagaimana cara mendapatkan handuk?',
        'How can visitors get a towel?',
        [
          'Hire one from reception',
          'Take one from the changing room',
          'Buy one in the café',
          'Towels are free for members',
        ],
      ),
    ],
  ),
];

// ---------------------------------------------------------------------------
// 4. PTE Academic — potongan kuliah: Highlight Correct Summary,
//    Select Missing Word (transkrip berakhir '...'), dan soal detail.
// ---------------------------------------------------------------------------

final List<ListeningPassage> pteListenMore = [
  _p(
    'en_plm_1',
    'Kuliah: Mangrove dan Karbon',
    'Lecture: Mangroves and Carbon',
    "Mangrove forests cover less than one percent of the world's tropical land, yet they store a remarkable amount of carbon. Most of it is not in the trees themselves but in the waterlogged soil beneath them, where low oxygen levels slow down decomposition. As a result, a hectare of mangrove can hold up to four times as much carbon as a hectare of rainforest. Unfortunately, mangroves are being cleared for shrimp farms and coastal development, and when they are destroyed, the stored carbon is released. Protecting existing mangroves is therefore one of the most cost-effective ways of...",
    'Hutan mangrove menutupi kurang dari satu persen daratan tropis dunia, tetapi menyimpan karbon dalam jumlah luar biasa. Sebagian besar bukan di pohonnya, melainkan di tanah tergenang di bawahnya, di mana kadar oksigen rendah memperlambat pembusukan. Akibatnya, satu hektare mangrove bisa menyimpan hingga empat kali lebih banyak karbon daripada satu hektare hutan hujan. Sayangnya, mangrove ditebang untuk tambak udang dan pembangunan pesisir, dan saat dihancurkan, karbon yang tersimpan terlepas. Karena itu melindungi mangrove yang ada adalah salah satu cara paling hemat biaya untuk...',
    [
      _sum([
        'Mangroves store large amounts of carbon in their soil, so protecting them is an efficient climate strategy.',
        'Mangroves cover most tropical land and are expanding because of shrimp farming.',
        'Rainforests store four times more carbon than mangroves and should be prioritized.',
        'Mangrove trees release carbon quickly because their soil is rich in oxygen.',
      ]),
      _miss([
        'reducing greenhouse gas emissions',
        'increasing shrimp production',
        'building coastal hotels',
        'raising oxygen levels in soil',
      ]),
      _q(
        'Di mana sebagian besar karbon mangrove disimpan?',
        'Where is most mangrove carbon stored?',
        [
          'In the waterlogged soil',
          'In the leaves',
          'In the trunks',
          'In the seawater',
        ],
      ),
    ],
  ),
  _p(
    'en_plm_2',
    'Kuliah: Bilingualisme',
    'Lecture: Bilingualism and the Brain',
    "For much of the twentieth century, parents were told that raising children with two languages would confuse them and delay their development. Research since the nineteen-sixties has largely overturned that view. Bilingual children may know slightly fewer words in each individual language at first, but their total vocabulary across both languages is usually similar to that of monolingual children. Some studies also suggest that constantly switching between languages trains the brain to control attention and ignore distractions, although this particular finding has been harder to replicate. What researchers broadly agree on is that learning two languages early is...",
    'Selama sebagian besar abad kedua puluh, orang tua diberi tahu bahwa membesarkan anak dengan dua bahasa akan membingungkan dan menunda perkembangan mereka. Penelitian sejak 1960-an sebagian besar membantah pandangan itu. Anak bilingual mungkin awalnya tahu sedikit lebih sedikit kata di tiap bahasa, tetapi total kosakata mereka di kedua bahasa biasanya serupa dengan anak monolingual. Beberapa studi juga menunjukkan bahwa terus berganti bahasa melatih otak mengendalikan perhatian dan mengabaikan gangguan, meskipun temuan ini lebih sulit direplikasi. Yang secara umum disepakati peneliti adalah bahwa belajar dua bahasa sejak dini itu...',
    [
      _sum([
        'Early bilingualism does not harm development, though some claimed cognitive benefits remain uncertain.',
        'Bilingual children have much smaller vocabularies and develop more slowly.',
        'Switching languages has been clearly proven to improve attention in all children.',
        'Parents should avoid teaching a second language until age ten.',
      ]),
      _miss([
        'not harmful to children',
        'confusing for most children',
        'only possible for adults',
        'a cause of speech delay',
      ]),
      _q(
        'Temuan mana yang sulit direplikasi?',
        'Which finding has been harder to replicate?',
        [
          'Better attention control in bilinguals',
          'Similar total vocabulary size',
          'Smaller vocabulary in each language',
          'Delayed development in bilinguals',
        ],
      ),
    ],
  ),
  _p(
    'en_plm_3',
    'Kuliah: Ekonomi Perhatian',
    'Lecture: The Attention Economy',
    "Many online services appear to be free, but economists argue that users pay with something else: their attention. Platforms earn money by selling advertising, and the longer people stay, the more adverts they can show. This creates a strong incentive to design features such as infinite scrolling, autoplay, and frequent notifications, which make it harder for users to stop. Critics say this business model rewards content that provokes strong emotions, since outrage and surprise keep people engaged. Some governments are now considering rules that would require platforms to offer simpler, less addictive designs. In short, when a product costs nothing, the user may in fact be...",
    'Banyak layanan daring tampak gratis, tetapi ekonom berpendapat pengguna membayar dengan hal lain: perhatian mereka. Platform menghasilkan uang dengan menjual iklan, dan semakin lama orang bertahan, semakin banyak iklan yang bisa ditampilkan. Ini menciptakan insentif kuat untuk merancang fitur seperti gulir tanpa akhir, putar otomatis, dan notifikasi yang sering, yang membuat pengguna sulit berhenti. Pengkritik berkata model bisnis ini menguntungkan konten yang memancing emosi kuat, karena kemarahan dan kejutan membuat orang tetap terlibat. Beberapa pemerintah kini mempertimbangkan aturan yang mewajibkan platform menawarkan desain yang lebih sederhana dan kurang adiktif. Singkatnya, saat produk tidak berbayar, pengguna sebenarnya bisa jadi...',
    [
      _sum([
        'Free platforms profit from user attention, which encourages addictive design and may lead to regulation.',
        'Online platforms make most of their money from user subscriptions.',
        'Infinite scrolling was designed to help users find information faster.',
        'Governments have already banned autoplay and notifications worldwide.',
      ]),
      _miss([
        'the product being sold',
        'the owner of the platform',
        'protected from advertising',
        'paid for their time',
      ]),
      _q(
        'Mengapa konten emosional diuntungkan menurut pengkritik?',
        'Why, according to critics, is emotional content rewarded?',
        [
          'It keeps people engaged for longer',
          'It is cheaper to produce',
          'Advertisers refuse calm content',
          'Governments require it',
        ],
      ),
    ],
  ),
  _p(
    'en_plm_4',
    'Kuliah: Air Tanah',
    'Lecture: Groundwater Depletion',
    "Groundwater supplies roughly half of the world's drinking water and around forty percent of the water used for irrigation. It is stored in aquifers, layers of rock and sand that can take thousands of years to fill. In many farming regions, including parts of India, the United States, and the Middle East, water is being pumped out far faster than rain can replace it. One visible consequence is land subsidence: as water is removed, the ground above can sink. Parts of Jakarta, for example, have sunk by several metres, increasing the risk of flooding. Because aquifers recover so slowly, groundwater in these regions should be treated as a...",
    'Air tanah memasok sekitar separuh air minum dunia dan sekitar empat puluh persen air untuk irigasi. Air ini tersimpan di akuifer, lapisan batuan dan pasir yang bisa butuh ribuan tahun untuk terisi. Di banyak wilayah pertanian, termasuk sebagian India, Amerika Serikat, dan Timur Tengah, air dipompa jauh lebih cepat daripada yang bisa digantikan hujan. Salah satu akibat yang terlihat adalah penurunan muka tanah: saat air diambil, tanah di atasnya bisa amblas. Sebagian Jakarta, misalnya, telah turun beberapa meter, meningkatkan risiko banjir. Karena akuifer pulih sangat lambat, air tanah di wilayah ini sebaiknya diperlakukan sebagai...',
    [
      _sum([
        'Groundwater is being overused faster than it refills, causing problems such as land subsidence.',
        'Aquifers refill within a few years, so groundwater use is sustainable.',
        'Jakarta has solved its flooding problem by pumping more groundwater.',
        'Irrigation uses very little groundwater compared with drinking water.',
      ]),
      _miss([
        'non-renewable resource',
        'unlimited supply',
        'source of income',
        'cause of drought',
      ]),
      _q(
        'Apa contoh akibat penurunan muka tanah yang disebut?',
        'Which example of land subsidence is mentioned?',
        ['Jakarta', 'Mumbai', 'Cairo', 'Mexico City'],
      ),
      _q(
        'Berapa persen air irigasi berasal dari air tanah?',
        'What share of irrigation water comes from groundwater?',
        ['About 40%', 'About 50%', 'About 14%', 'About 4%'],
      ),
    ],
  ),
  _p(
    'en_plm_5',
    'Kuliah: Efek Plasebo',
    'Lecture: The Placebo Effect',
    "A placebo is a treatment with no active ingredient, such as a sugar pill. Surprisingly, patients who receive placebos often report real improvements, especially for symptoms like pain, nausea, and fatigue. Brain scans show that expecting relief can trigger the release of natural painkillers called endorphins. The effect is also influenced by details that seem irrelevant: larger pills tend to work better than small ones, and injections better than tablets. Even more surprising, some studies have found benefits when patients were told openly that they were taking a placebo. This suggests that the ritual of treatment, not just deception, plays a role. For this reason, new drugs must always be...",
    'Plasebo adalah perawatan tanpa bahan aktif, seperti pil gula. Mengejutkannya, pasien yang menerima plasebo sering melaporkan perbaikan nyata, terutama untuk gejala seperti nyeri, mual, dan kelelahan. Pemindaian otak menunjukkan bahwa harapan akan kesembuhan bisa memicu pelepasan pereda nyeri alami bernama endorfin. Efeknya juga dipengaruhi detail yang tampak tidak relevan: pil lebih besar cenderung lebih manjur daripada yang kecil, dan suntikan lebih manjur daripada tablet. Lebih mengejutkan lagi, beberapa studi menemukan manfaat saat pasien diberi tahu terang-terangan bahwa mereka minum plasebo. Ini menunjukkan ritual pengobatan, bukan hanya tipuan, berperan. Karena itu obat baru selalu harus...',
    [
      _sum([
        'Placebos can produce real effects driven by expectation and the experience of treatment.',
        'Placebos only work when patients are deceived about what they are taking.',
        'Small pills are generally more effective placebos than injections.',
        'Placebos have been shown to cure serious infections.',
      ]),
      _miss([
        'compared against a placebo',
        'given as large pills',
        'tested without patients',
        'sold without a prescription',
      ]),
      _q(
        'Apa yang dipicu oleh harapan akan kesembuhan?',
        'What can the expectation of relief trigger?',
        [
          'The release of endorphins',
          'A rise in blood sugar',
          'Faster digestion',
          'Better eyesight',
        ],
      ),
    ],
  ),
  _p(
    'en_plm_6',
    'Kuliah: Kota Lima Belas Menit',
    'Lecture: The Fifteen-Minute City',
    "The fifteen-minute city is an urban planning idea in which residents can reach most daily needs, such as shops, schools, clinics, and parks, within a fifteen-minute walk or bike ride from home. Paris has become the best-known example, converting car lanes into cycle paths and opening school playgrounds to the public at weekends. Supporters argue that the model reduces traffic, improves air quality, and strengthens local communities. Critics, however, worry that it may raise property prices in well-served neighbourhoods, pushing lower-income residents further out. Planners therefore stress that the model only works if affordable housing is...",
    'Kota lima belas menit adalah gagasan perencanaan kota di mana warga bisa mencapai sebagian besar kebutuhan harian, seperti toko, sekolah, klinik, dan taman, dalam lima belas menit berjalan kaki atau bersepeda dari rumah. Paris menjadi contoh paling terkenal, mengubah lajur mobil menjadi jalur sepeda dan membuka taman bermain sekolah untuk umum di akhir pekan. Pendukung berpendapat model ini mengurangi lalu lintas, memperbaiki kualitas udara, dan memperkuat komunitas lokal. Namun pengkritik khawatir model ini bisa menaikkan harga properti di lingkungan yang terlayani baik, sehingga warga berpenghasilan rendah terdorong ke pinggiran. Karena itu para perencana menekankan bahwa model ini hanya berhasil jika perumahan terjangkau...',
    [
      _sum([
        'The fifteen-minute city brings daily services close to home but must address housing affordability.',
        'The fifteen-minute city requires every resident to own a car.',
        'Paris has abandoned the fifteen-minute city because of rising traffic.',
        'Critics believe the model will reduce property prices in the suburbs.',
      ]),
      _miss([
        'included in the plan',
        'moved to the suburbs',
        'replaced by offices',
        'built near motorways',
      ]),
      _q('Apa yang dilakukan Paris?', 'What has Paris done?', [
        'Turned car lanes into cycle paths',
        'Banned all cars from the city',
        'Closed school playgrounds',
        'Built new motorways',
      ]),
    ],
  ),
  _p(
    'en_plm_7',
    'Kuliah: Mikroplastik',
    'Lecture: Microplastics',
    "Microplastics are plastic particles smaller than five millimetres. Some are manufactured at that size, for example the tiny beads once common in face scrubs, but most come from larger items breaking down, such as bottles, fishing nets, and synthetic clothing. A single wash of a polyester jacket can release thousands of fibres into wastewater. These particles have now been found almost everywhere, from Arctic ice to human blood. Scientists do not yet fully understand their health effects, but laboratory studies suggest they can cause inflammation in cells. Because removing microplastics from the environment is extremely difficult, most experts argue that the priority should be...",
    'Mikroplastik adalah partikel plastik yang lebih kecil dari lima milimeter. Sebagian memang dibuat seukuran itu, misalnya butiran kecil yang dulu umum di sabun scrub wajah, tetapi sebagian besar berasal dari barang lebih besar yang terurai, seperti botol, jaring ikan, dan pakaian sintetis. Sekali cuci jaket poliester bisa melepas ribuan serat ke air limbah. Partikel ini kini ditemukan hampir di mana-mana, dari es Arktik hingga darah manusia. Ilmuwan belum sepenuhnya memahami dampaknya terhadap kesehatan, tetapi studi laboratorium menunjukkan partikel ini bisa menyebabkan peradangan pada sel. Karena membersihkan mikroplastik dari lingkungan sangat sulit, kebanyakan ahli berpendapat prioritasnya seharusnya...',
    [
      _sum([
        'Microplastics come mainly from breaking plastic, are widespread, and are best tackled by prevention.',
        'Microplastics come almost entirely from face scrubs, which are now banned.',
        'Scientists have proven that microplastics are harmless to humans.',
        'Microplastics are easy to remove from oceans with modern filters.',
      ]),
      _miss([
        'stopping them at the source',
        'collecting them from the Arctic',
        'washing clothes more often',
        'producing more polyester',
      ]),
      _q(
        'Dari mana sebagian besar mikroplastik berasal?',
        'Where do most microplastics come from?',
        [
          'Larger plastic items breaking down',
          'Face scrubs',
          'Arctic ice',
          'Human blood',
        ],
      ),
    ],
  ),
  _p(
    'en_plm_8',
    'Kuliah: Revolusi Hijau',
    'Lecture: The Green Revolution',
    "Between the nineteen-fifties and the nineteen-seventies, a set of agricultural changes known as the Green Revolution transformed food production in Asia and Latin America. Scientists developed high-yielding varieties of wheat and rice, which, combined with irrigation and chemical fertilisers, doubled or even tripled harvests. India, which had faced serious food shortages, became self-sufficient in grain. However, the benefits were uneven. Wealthier farmers who could afford fertiliser and pumps gained the most, while heavy chemical use damaged soils and polluted rivers. Historians therefore describe the Green Revolution as a success that came with...",
    'Antara 1950-an dan 1970-an, serangkaian perubahan pertanian yang dikenal sebagai Revolusi Hijau mengubah produksi pangan di Asia dan Amerika Latin. Ilmuwan mengembangkan varietas gandum dan padi berhasil tinggi yang, dipadukan dengan irigasi dan pupuk kimia, menggandakan bahkan melipattigakan panen. India, yang pernah menghadapi kekurangan pangan serius, menjadi swasembada biji-bijian. Namun manfaatnya tidak merata. Petani kaya yang mampu membeli pupuk dan pompa paling diuntungkan, sementara penggunaan bahan kimia berlebihan merusak tanah dan mencemari sungai. Karena itu sejarawan menggambarkan Revolusi Hijau sebagai keberhasilan yang disertai...',
    [
      _sum([
        'The Green Revolution greatly increased harvests but brought unequal benefits and environmental damage.',
        'The Green Revolution failed to increase food production in India.',
        'The Green Revolution mainly benefited poor farmers without irrigation.',
        'The Green Revolution relied on organic farming and avoided chemicals.',
      ]),
      _miss([
        'significant costs',
        'no disadvantages',
        'lower harvests',
        'cheaper fertiliser',
      ]),
      _q(
        'Siapa yang paling diuntungkan?',
        'Who benefited most from the Green Revolution?',
        [
          'Wealthier farmers',
          'Landless labourers',
          'Fishermen',
          'Urban factory workers',
        ],
      ),
    ],
  ),
  _p(
    'en_plm_9',
    'Kuliah: Kerja Tim Jarak Jauh',
    'Lecture: Creativity in Remote Teams',
    "Remote work has many advantages, but a recent study of more than one thousand engineers suggests it may have a cost for creativity. Participants were placed in pairs and asked to generate ideas for new products, either face to face or by video call. The pairs who met in person produced significantly more ideas. The researchers believe the reason is visual focus. On a video call, people stare at the screen, which narrows their attention, whereas in a room their eyes wander, and that wandering seems to encourage broader thinking. Interestingly, when it came to choosing the best idea, the video pairs performed just as well. The authors conclude that companies may want to keep in-person meetings for...",
    'Kerja jarak jauh punya banyak keunggulan, tetapi studi terbaru terhadap lebih dari seribu insinyur menunjukkan mungkin ada harga untuk kreativitas. Peserta dipasangkan dan diminta menghasilkan ide produk baru, bertatap muka atau lewat panggilan video. Pasangan yang bertemu langsung menghasilkan ide jauh lebih banyak. Peneliti menduga alasannya fokus visual. Saat panggilan video, orang menatap layar sehingga perhatian menyempit, sedangkan di ruangan mata mereka berkelana, dan itu tampaknya mendorong pemikiran yang lebih luas. Menariknya, saat memilih ide terbaik, pasangan video sama baiknya. Penulis menyimpulkan perusahaan mungkin perlu mempertahankan pertemuan tatap muka untuk...',
    [
      _sum([
        'In-person pairs generated more ideas than video pairs, though both chose ideas equally well.',
        'Video calls improved both idea generation and decision-making.',
        'Engineers working remotely were less productive in every task.',
        'Face-to-face meetings made it harder to choose the best idea.',
      ]),
      _miss([
        'brainstorming new ideas',
        'choosing final products',
        'reducing travel costs',
        'checking emails',
      ]),
      _q(
        'Apa penjelasan peneliti untuk hasilnya?',
        'How do the researchers explain the result?',
        [
          'Screens narrow visual attention',
          'Video calls often disconnect',
          'Engineers dislike technology',
          'In-person pairs had more time',
        ],
      ),
      _q(
        'Dalam hal apa pasangan video sama baiknya?',
        'In which task did video pairs do equally well?',
        [
          'Selecting the best idea',
          'Generating many ideas',
          'Building prototypes',
          'Writing reports',
        ],
      ),
    ],
  ),
  _p(
    'en_plm_10',
    'Kuliah: Bahasa yang Terancam Punah',
    'Lecture: Endangered Languages',
    "Of the roughly seven thousand languages spoken today, linguists estimate that around forty percent are endangered, meaning they are no longer being learned by children. When a language disappears, communities can lose traditional knowledge about local plants, medicine, and history that was never written down. Revival is difficult but possible. Hebrew, for instance, was used mainly in religious texts for centuries before becoming the everyday language of millions. More recently, language nests in New Zealand, where young children are cared for entirely in Māori, have helped increase the number of young speakers. These cases show that the key to keeping a language alive is...",
    'Dari sekitar tujuh ribu bahasa yang dituturkan saat ini, ahli bahasa memperkirakan sekitar empat puluh persen terancam punah, artinya tidak lagi dipelajari anak-anak. Saat sebuah bahasa hilang, komunitas bisa kehilangan pengetahuan tradisional tentang tanaman lokal, pengobatan, dan sejarah yang tidak pernah ditulis. Menghidupkan kembali bahasa sulit tetapi mungkin. Bahasa Ibrani, misalnya, selama berabad-abad terutama dipakai dalam teks keagamaan sebelum menjadi bahasa sehari-hari jutaan orang. Baru-baru ini, "sarang bahasa" di Selandia Baru, tempat anak kecil diasuh sepenuhnya dalam bahasa Māori, membantu menambah jumlah penutur muda. Kasus-kasus ini menunjukkan bahwa kunci menjaga bahasa tetap hidup adalah...',
    [
      _sum([
        'Many languages are endangered, but examples show revival is possible when children learn them.',
        'Almost all languages are safe because they are written down.',
        'Hebrew disappeared completely despite efforts to revive it.',
        'Language nests in New Zealand teach adults to read Māori texts.',
      ]),
      _miss([
        'passing it on to children',
        'writing a dictionary',
        'using it only in religion',
        'translating it into English',
      ]),
      _q(
        'Apa arti "terancam punah" dalam kuliah ini?',
        'What does "endangered" mean in this lecture?',
        [
          'No longer being learned by children',
          'Spoken by fewer than seven thousand people',
          'Never written down',
          'Used only in religious texts',
        ],
      ),
    ],
  ),
  _p(
    'en_plm_11',
    'Kuliah: Gig Economy',
    'Lecture: The Gig Economy',
    "The gig economy refers to work arranged through digital platforms, such as ride-hailing, food delivery, and freelance design, where people are paid per task rather than receiving a regular salary. For workers, the main attraction is flexibility: they can choose when and how much to work. For companies, it reduces fixed labour costs. The downside is insecurity. Gig workers are usually classified as independent contractors, so they often lack sick pay, pensions, and protection against sudden loss of income. Courts in several countries, including the United Kingdom, have recently ruled that some drivers should be treated as workers, a decision that could...",
    'Gig economy merujuk pada pekerjaan yang diatur lewat platform digital, seperti ojek daring, pesan-antar makanan, dan desain lepas, di mana orang dibayar per tugas, bukan menerima gaji tetap. Bagi pekerja, daya tarik utamanya fleksibilitas: mereka bisa memilih kapan dan berapa banyak bekerja. Bagi perusahaan, ini mengurangi biaya tenaga kerja tetap. Kelemahannya adalah ketidakpastian. Pekerja gig biasanya digolongkan kontraktor independen, sehingga sering tidak mendapat cuti sakit berbayar, pensiun, dan perlindungan dari kehilangan penghasilan mendadak. Pengadilan di beberapa negara, termasuk Inggris, baru-baru ini memutuskan sebagian pengemudi harus diperlakukan sebagai pekerja, keputusan yang bisa...',
    [
      _sum([
        'Gig work offers flexibility but little security, and courts are starting to extend workers\' rights.',
        'Gig workers receive regular salaries and full pensions.',
        'Companies avoid gig platforms because labour costs are higher.',
        'Courts have banned ride-hailing services in the United Kingdom.',
      ]),
      _miss([
        'give them more legal protection',
        'end all platform work',
        'lower their flexibility to zero',
        'reduce their hourly pay',
      ]),
      _q(
        'Apa daya tarik utama gig economy bagi pekerja?',
        'What is the main attraction of gig work for workers?',
        ['Flexibility', 'High pensions', 'Sick pay', 'Job security'],
      ),
    ],
  ),
];

// ---------------------------------------------------------------------------
// 5. PTE Academic — Highlight Incorrect Words (satu kata diganti)
// ---------------------------------------------------------------------------

final List<WordPickItem> pteHighlightIncorrect = [
  _wp(
    'Photosynthesis allows plants to convert sunlight, water, and carbon dioxide into glucose, which provides the energy they need to grow.',
    11,
    'starch,',
  ),
  _wp(
    'The Industrial Revolution began in Britain in the late eighteenth century and gradually spread to Europe and North America.',
    8,
    'early',
  ),
  _wp(
    'Volcanic eruptions can temporarily cool the planet because ash and sulphur particles reflect sunlight back into space.',
    4,
    'warm',
  ),
  _wp(
    'Researchers found that students who slept for at least seven hours performed better on memory tests than those who slept less.',
    9,
    'five',
  ),
  _wp(
    'Coral reefs occupy a tiny fraction of the ocean floor, yet they support roughly a quarter of all marine species.',
    15,
    'third',
  ),
  _wp(
    'Inflation occurs when the general level of prices rises and the purchasing power of money steadily declines.',
    15,
    'gradually',
  ),
  _wp(
    'The printing press made books far cheaper to produce, which helped literacy spread rapidly across sixteenth-century Europe.',
    6,
    'faster',
  ),
  _wp(
    'Antibiotics are effective against bacterial infections, but they have no effect on viruses such as the common cold.',
    2,
    'useful',
  ),
  _wp(
    'Urban planners increasingly design neighbourhoods where residents can walk or cycle to shops, schools, and workplaces.',
    8,
    'drive',
  ),
  _wp(
    'The survey revealed that most participants preferred flexible working hours to a higher annual salary.',
    2,
    'showed',
  ),
  _wp(
    'Glaciers act as natural reservoirs, storing water in winter and releasing it slowly during the warmer months.',
    8,
    'summer',
  ),
  _wp(
    'Early human societies relied on hunting and gathering before the development of agriculture around ten thousand years ago.',
    3,
    'depended',
  ),
  _wp(
    'Economists argue that investing in early childhood education produces significant long-term benefits for the whole of society.',
    10,
    'immediate',
  ),
  _wp(
    "The museum's new exhibition explores how ancient trade routes connected distant cultures and encouraged the exchange of ideas.",
    6,
    'modern',
  ),
  _wp(
    'Bees play a crucial role in pollination, and a decline in their numbers could seriously threaten global food supplies.',
    3,
    'minor',
  ),
  _wp(
    'Solar panels have become considerably cheaper over the past decade, making renewable energy accessible to many more households.',
    4,
    'slightly',
  ),
  _wp(
    'Language acquisition in young children follows remarkably similar stages, regardless of which language they are learning.',
    7,
    'different',
  ),
  _wp(
    'The committee postponed its final decision until further evidence about the environmental impact had been collected.',
    2,
    'announced',
  ),
  _wp(
    'Deforestation reduces biodiversity and also contributes to climate change by releasing stored carbon into the atmosphere.',
    12,
    'oxygen',
  ),
  _wp(
    'In many cultures, storytelling has been an essential way of passing knowledge from one generation to the next.',
    7,
    'unusual',
  ),
  _wp(
    'The professor emphasised that a strong argument must be supported by reliable evidence rather than personal opinion.',
    11,
    'expert',
  ),
  _wp(
    'Migration patterns of many bird species are shifting as rising temperatures alter the timing of seasonal food supplies.',
    9,
    'falling',
  ),
  _wp(
    'Regular physical activity lowers the risk of heart disease and can also improve mood and concentration.',
    3,
    'raises',
  ),
  _wp(
    "Most of the world's fresh water is locked in ice sheets and glaciers rather than in rivers and lakes.",
    7,
    'stored',
  ),
];

// ---------------------------------------------------------------------------
// 6. PTE Academic — Write from Dictation
// ---------------------------------------------------------------------------

final List<WritingItem> pteDictation = [
  _dict('The library will be closed for renovation during the summer break.'),
  _dict('Students must submit their assignments online before the deadline.'),
  _dict('Climate change is affecting agricultural production in many regions.'),
  _dict('The lecture will focus on the causes of the financial crisis.'),
  _dict('Regular exercise has a positive effect on mental health.'),
  _dict('Most of the participants agreed with the proposed changes.'),
  _dict(
    'The results of the experiment were published in a scientific journal.',
  ),
  _dict('Access to clean water remains a challenge in rural areas.'),
  _dict('The government introduced new policies to reduce air pollution.'),
  _dict(
    'Group projects help students develop teamwork and communication skills.',
  ),
  _dict('Further research is needed to confirm these preliminary findings.'),
  _dict('The museum offers free guided tours every Saturday morning.'),
  _dict('Renewable energy sources are becoming more affordable every year.'),
  _dict('Applicants should provide two references from previous employers.'),
  _dict('The population of the city has doubled over the last thirty years.'),
  _dict('Many animals rely on camouflage to avoid being seen by predators.'),
  _dict('The professor asked us to compare the two theories in our essays.'),
  _dict(
    'Public transport plays an important role in reducing traffic congestion.',
  ),
  _dict('Early childhood education has a lasting impact on later success.'),
  _dict('The data suggests a strong link between income and life expectancy.'),
  _dict(
    'International students can get help from the language support center.',
  ),
  _dict('Scientists are studying how plants respond to rising temperatures.'),
  _dict('A balanced diet provides the nutrients the body needs to function.'),
  _dict('The company plans to expand its operations into Southeast Asia.'),
  _dict(
    'Ancient civilizations developed complex systems of writing and trade.',
  ),
  _dict(
    'Please make sure your mobile phones are switched off during the exam.',
  ),
  _dict('Social media has changed the way people consume news.'),
  _dict('The conference attracted researchers from more than forty countries.'),
  _dict('Tutorial attendance is compulsory for all first-year students.'),
  _dict(
    'Digital technology has transformed teaching and learning in universities.',
  ),
  _dict(
    'The new bridge will significantly reduce travel time between the two towns.',
  ),
  _dict(
    'Critical thinking is one of the most valuable skills in higher education.',
  ),
];
