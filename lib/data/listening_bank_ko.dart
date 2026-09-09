import '../models/listening.dart';
import 'mcq_bank.dart';

/// Latihan Dengar Korea: Listening Dasar (gratis) dan TOPIK I Listening
/// (premium, gaya 듣기 level 1-2). Konten disusun sendiri untuk latihan.
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

final List<ListeningPack> koListeningPacks = [
  ListeningPack(
    id: 'ko_listen_basic',
    emoji: '🎧',
    title: const {'id': 'Listening Dasar', 'en': 'Basic Listening'},
    subtitle: const {
      'id': 'percakapan pendek sehari-hari',
      'en': 'short everyday talks',
    },
    premium: false,
    maxPlays: 0,
    passages: _koBasic,
  ),
  ListeningPack(
    id: 'ko_listen_topik1',
    emoji: '🇰🇷',
    title: const {'id': 'TOPIK I Listening', 'en': 'TOPIK I Listening'},
    subtitle: const {
      'id': 'pengumuman & monolog pendek (듣기)',
      'en': 'announcements & short monologues (듣기)',
    },
    premium: true,
    maxPlays: 2,
    passages: _koTopik,
  ),
];

// ---------------------------------------------------------------------------
// Korea — Listening Dasar (gratis, putar bebas)
// ---------------------------------------------------------------------------
final List<ListeningPassage> _koBasic = [
  _p(
    'ko_b1',
    'Di Kafe',
    'At the Cafe',
    '어서 오세요. 아메리카노 한 잔은 사천 원이에요. 오늘은 케이크를 사면 커피가 천 원 할인돼요. 와이파이 비밀번호는 카운터 옆에 있어요. 자리에 앉으시면 가져다 드릴게요.',
    {
      'id':
          'Selamat datang. Americano satu gelas 4.000 won. Hari ini kalau beli kue, kopi diskon 1.000 won. Kata sandi Wi-Fi ada di samping kasir. Silakan duduk, akan kami antar.',
      'en':
          'Welcome. One Americano is 4,000 won. Today, if you buy a cake, coffee is 1,000 won off. The Wi-Fi password is next to the counter. Please sit down and we will bring it to you.',
    },
    [
      _q('Berapa harga satu americano?', 'How much is one Americano?', [
        '사천 원',
        '천 원',
        '삼천 원',
        '오천 원',
      ]),
      _q(
        'Apa syarat diskon kopi?',
        'What is the condition for the coffee discount?',
        ['케이크를 사면', '두 잔을 사면', '회원이면', '아침에 오면'],
      ),
      _q('Berapa diskonnya?', 'How much is the discount?', [
        '천 원',
        '사천 원',
        '이천 원',
        '오백 원',
      ]),
      _q('Di mana kata sandi Wi-Fi?', 'Where is the Wi-Fi password?', [
        '카운터 옆',
        '문 앞',
        '메뉴판',
        '화장실',
      ]),
      _q(
        'Apa yang dilakukan staf setelah pelanggan duduk?',
        'What will the staff do after the customer sits?',
        ['가져다 준다', '전화한다', '노래한다', '청소한다'],
      ),
    ],
  ),
  _p(
    'ko_b2',
    'Di Stasiun Subway',
    'At the Subway Station',
    '안내 말씀 드립니다. 이번 열차는 서울역 방면 열차입니다. 다음 역은 시청, 시청역입니다. 내리실 문은 오른쪽입니다. 열차가 약 오 분 늦게 도착할 예정입니다. 죄송합니다.',
    {
      'id':
          'Pengumuman. Kereta ini menuju arah Stasiun Seoul. Stasiun berikutnya Sicheong (Balai Kota). Pintu keluar di sebelah kanan. Kereta diperkirakan terlambat sekitar lima menit. Mohon maaf.',
      'en':
          'Attention please. This train is bound for Seoul Station. The next station is City Hall. The doors will open on the right. The train is expected to arrive about five minutes late. We apologize.',
    },
    [
      _q('Ke arah mana kereta ini?', 'Where is this train bound for?', [
        '서울역',
        '시청역',
        '강남역',
        '부산역',
      ]),
      _q('Stasiun berikutnya?', 'What is the next station?', [
        '시청',
        '서울역',
        '종로',
        '홍대',
      ]),
      _q('Pintu mana yang terbuka?', 'Which doors will open?', [
        '오른쪽',
        '왼쪽',
        '양쪽',
        '앞쪽',
      ]),
      _q('Berapa lama keterlambatannya?', 'How late is the train?', [
        '약 오 분',
        '약 십 분',
        '약 삼십 분',
        '한 시간',
      ]),
      _q('Apa yang dikatakan di akhir?', 'What is said at the end?', [
        '죄송합니다',
        '감사합니다',
        '안녕하세요',
        '조심하세요',
      ]),
    ],
  ),
  _p(
    'ko_b3',
    'Perkenalan Diri',
    'Self-introduction',
    '안녕하세요. 저는 민수예요. 저는 대학생이고 부산에서 왔어요. 제 취미는 축구와 요리예요. 주말에는 친구들과 축구를 해요. 한국 음식 중에서 김치찌개를 가장 좋아해요.',
    {
      'id':
          'Halo. Saya Minsu. Saya mahasiswa dan berasal dari Busan. Hobi saya sepak bola dan memasak. Akhir pekan saya main sepak bola dengan teman. Di antara makanan Korea, saya paling suka kimchi-jjigae.',
      'en':
          'Hello. I am Minsu. I am a university student and I come from Busan. My hobbies are soccer and cooking. On weekends I play soccer with friends. Among Korean foods, I like kimchi stew the most.',
    },
    [
      _q('Siapa nama pembicara?', "What is the speaker's name?", [
        '민수',
        '지훈',
        '수진',
        '영호',
      ]),
      _q('Dari mana dia berasal?', 'Where is he from?', [
        '부산',
        '서울',
        '대구',
        '인천',
      ]),
      _q('Apa pekerjaannya?', 'What does he do?', ['대학생', '회사원', '선생님', '의사']),
      _q('Apa hobinya?', 'What are his hobbies?', [
        '축구와 요리',
        '독서와 음악',
        '수영과 등산',
        '게임과 영화',
      ]),
      _q(
        'Makanan apa yang paling disukainya?',
        'What food does he like most?',
        ['김치찌개', '불고기', '비빔밥', '떡볶이'],
      ),
    ],
  ),
  _p(
    'ko_b4',
    'Cuaca Besok',
    "Tomorrow's Weather",
    '내일 날씨를 알려 드립니다. 오전에는 흐리고 오후에는 비가 오겠습니다. 최고 기온은 십팔 도입니다. 외출하실 때 우산을 꼭 가져가세요. 주말에는 다시 맑아지겠습니다.',
    {
      'id':
          'Berikut cuaca besok. Pagi berawan dan sore hujan. Suhu tertinggi 18 derajat. Saat keluar, pastikan membawa payung. Akhir pekan akan cerah lagi.',
      'en':
          "Here is tomorrow's weather. It will be cloudy in the morning and rainy in the afternoon. The high will be 18 degrees. Be sure to take an umbrella when you go out. It will be sunny again at the weekend.",
    },
    [
      _q(
        'Bagaimana cuaca sore besok?',
        'What is the weather tomorrow afternoon?',
        ['비', '맑음', '눈', '바람'],
      ),
      _q('Berapa suhu tertinggi?', 'What is the high temperature?', [
        '십팔 도',
        '팔 도',
        '이십팔 도',
        '십 도',
      ]),
      _q('Apa yang harus dibawa?', 'What should you take?', [
        '우산',
        '모자',
        '코트',
        '장갑',
      ]),
      _q(
        'Bagaimana cuaca pagi besok?',
        'What is the weather tomorrow morning?',
        ['흐림', '맑음', '비', '눈'],
      ),
      _q('Kapan cuaca cerah lagi?', 'When will it be sunny again?', [
        '주말',
        '내일 오후',
        '오늘 밤',
        '다음 달',
      ]),
    ],
  ),
  _p(
    'ko_b5',
    'Di Restoran',
    'At the Restaurant',
    '어서 오세요. 몇 분이세요? 두 명이에요. 이쪽으로 앉으세요. 주문하시겠어요? 비빔밥 하나랑 된장찌개 하나 주세요. 그리고 물 두 잔 주세요. 네, 잠시만 기다려 주세요.',
    {
      'id':
          'Selamat datang. Berapa orang? Dua orang. Silakan duduk di sini. Mau pesan? Bibimbap satu dan doenjang-jjigae satu. Dan air dua gelas. Baik, mohon tunggu sebentar.',
      'en':
          'Welcome. How many people? Two. Please sit here. Would you like to order? One bibimbap and one soybean-paste stew, please. And two glasses of water. Okay, please wait a moment.',
    },
    [
      _q('Berapa orang yang datang?', 'How many people came?', [
        '두 명',
        '한 명',
        '세 명',
        '네 명',
      ]),
      _q(
        'Apa yang dipesan selain bibimbap?',
        'What was ordered besides bibimbap?',
        ['된장찌개', '김치찌개', '불고기', '냉면'],
      ),
      _q('Berapa gelas air yang diminta?', 'How many glasses of water?', [
        '두 잔',
        '한 잔',
        '세 잔',
        '네 잔',
      ]),
      _q('Berapa bibimbap yang dipesan?', 'How many bibimbap were ordered?', [
        '하나',
        '둘',
        '셋',
        '넷',
      ]),
      _q(
        'Apa yang dikatakan pelayan di akhir?',
        'What does the server say at the end?',
        ['잠시만 기다려 주세요', '감사합니다', '안녕히 가세요', '맛있게 드세요'],
      ),
    ],
  ),
  _p(
    'ko_b6',
    'Janji Bertemu',
    'Making Plans',
    '수진 씨, 토요일에 시간 있어요? 네, 오후에는 괜찮아요. 그럼 세 시에 홍대입구역 이번 출구에서 만나요. 영화를 보고 저녁을 먹을까요? 좋아요. 그럼 토요일에 봐요.',
    {
      'id':
          'Sujin, hari Sabtu ada waktu? Ya, sore bisa. Kalau begitu jam tiga bertemu di pintu keluar 2 Stasiun Hongik Univ. Nonton film lalu makan malam? Boleh. Sampai Sabtu.',
      'en':
          "Sujin, are you free on Saturday? Yes, the afternoon is fine. Then let's meet at three at Hongik University Station, exit two. Shall we watch a movie and have dinner? Sure. See you Saturday.",
    },
    [
      _q('Hari apa mereka bertemu?', 'On which day will they meet?', [
        '토요일',
        '일요일',
        '금요일',
        '월요일',
      ]),
      _q('Jam berapa?', 'What time?', ['세 시', '두 시', '네 시', '다섯 시']),
      _q('Di mana mereka bertemu?', 'Where will they meet?', [
        '홍대입구역 이번 출구',
        '서울역 일번 출구',
        '시청역',
        '영화관 앞',
      ]),
      _q('Apa rencana mereka?', 'What is their plan?', [
        '영화 보고 저녁 먹기',
        '쇼핑하기',
        '운동하기',
        '공부하기',
      ]),
      _q('Kapan Sujin bisa?', 'When is Sujin free?', ['오후', '오전', '저녁', '아침']),
    ],
  ),
  _p(
    'ko_b7',
    'Rutinitas Harian',
    'Daily Routine',
    '저는 매일 아침 일곱 시에 일어나요. 아침을 먹고 여덟 시에 집에서 나가요. 회사까지 지하철로 삼십 분쯤 걸려요. 저녁에는 한국어를 한 시간 공부하고 열한 시에 자요.',
    {
      'id':
          'Saya bangun setiap pagi pukul tujuh. Sarapan, lalu keluar rumah pukul delapan. Ke kantor naik subway sekitar 30 menit. Malam belajar bahasa Korea satu jam dan tidur pukul sebelas.',
      'en':
          'I get up at seven every morning. I eat breakfast and leave home at eight. It takes about thirty minutes to the office by subway. In the evening I study Korean for an hour and go to bed at eleven.',
    },
    [
      _q('Jam berapa dia bangun?', 'What time does the speaker get up?', [
        '일곱 시',
        '여덟 시',
        '여섯 시',
        '아홉 시',
      ]),
      _q('Bagaimana dia ke kantor?', 'How does the speaker get to work?', [
        '지하철로',
        '버스로',
        '자동차로',
        '걸어서',
      ]),
      _q('Berapa lama perjalanannya?', 'How long does the trip take?', [
        '삼십 분쯤',
        '십 분쯤',
        '한 시간',
        '두 시간',
      ]),
      _q(
        'Apa yang dipelajari malam hari?',
        'What does the speaker study in the evening?',
        ['한국어', '영어', '일본어', '수학'],
      ),
      _q('Jam berapa dia tidur?', 'What time does the speaker go to bed?', [
        '열한 시',
        '열 시',
        '열두 시',
        '아홉 시',
      ]),
    ],
  ),
  _p(
    'ko_b8',
    'Di Apotek',
    'At the Pharmacy',
    '어디가 아프세요? 머리가 아프고 열이 조금 있어요. 이 약을 하루에 세 번, 식사 후에 드세요. 그리고 물을 많이 드시고 푹 쉬세요. 이틀 후에도 안 좋으면 병원에 가세요.',
    {
      'id':
          'Sakit apa? Kepala sakit dan sedikit demam. Minum obat ini tiga kali sehari setelah makan. Lalu minum banyak air dan istirahat cukup. Kalau dua hari belum membaik, pergilah ke rumah sakit.',
      'en':
          'Where does it hurt? I have a headache and a slight fever. Take this medicine three times a day after meals. Drink plenty of water and rest well. If you are still not better after two days, go to the hospital.',
    },
    [
      _q('Apa keluhan pasien?', "What is the customer's problem?", [
        '머리가 아프고 열이 있다',
        '배가 아프다',
        '다리가 아프다',
        '기침을 한다',
      ]),
      _q(
        'Berapa kali sehari obat diminum?',
        'How many times a day is the medicine taken?',
        ['세 번', '두 번', '한 번', '네 번'],
      ),
      _q('Kapan obat diminum?', 'When should the medicine be taken?', [
        '식사 후',
        '식사 전',
        '자기 전',
        '아침에만',
      ]),
      _q(
        'Kapan harus ke rumah sakit?',
        'When should the customer go to the hospital?',
        ['이틀 후에도 안 좋으면', '내일', '지금 바로', '일주일 후'],
      ),
      _q(
        'Apa saran tambahan apoteker?',
        'What extra advice does the pharmacist give?',
        ['물을 많이 마시고 쉬기', '운동하기', '커피 마시기', '밖에 나가기'],
      ),
    ],
  ),
];

// ---------------------------------------------------------------------------
// Korea — TOPIK I Listening (premium, 2x putar)
// ---------------------------------------------------------------------------
final List<ListeningPassage> _koTopik = [
  _p(
    'ko_t1',
    'Pengumuman Toko',
    'Store Announcement',
    '고객님께 안내 말씀 드립니다. 오늘 삼 층 신발 매장에서 모든 상품을 이십 퍼센트 할인하고 있습니다. 또한 오만 원 이상 구매하신 고객님께는 주차 두 시간이 무료입니다. 행사는 오늘 저녁 아홉 시까지입니다.',
    {
      'id':
          'Pengumuman untuk pelanggan. Hari ini di toko sepatu lantai tiga, semua barang diskon 20 persen. Pelanggan yang berbelanja 50.000 won atau lebih mendapat parkir gratis dua jam. Acara berlangsung sampai pukul sembilan malam ini.',
      'en':
          'Attention customers. Today all items at the shoe store on the third floor are 20 percent off. Customers who spend 50,000 won or more get two hours of free parking. The event runs until nine tonight.',
    },
    [
      _q('Di lantai berapa diskonnya?', 'On which floor is the sale?', [
        '삼 층',
        '이 층',
        '일 층',
        '사 층',
      ]),
      _q('Berapa diskonnya?', 'How much is the discount?', [
        '이십 퍼센트',
        '십 퍼센트',
        '삼십 퍼센트',
        '오십 퍼센트',
      ]),
      _q('Syarat parkir gratis?', 'What is the condition for free parking?', [
        '오만 원 이상 구매',
        '신발 구매',
        '회원 가입',
        '아침 방문',
      ]),
      _q('Berapa lama parkir gratis?', 'How long is parking free?', [
        '두 시간',
        '한 시간',
        '세 시간',
        '하루',
      ]),
      _q('Sampai jam berapa acaranya?', 'Until what time is the event?', [
        '저녁 아홉 시',
        '저녁 여덟 시',
        '오후 여섯 시',
        '밤 열 시',
      ]),
    ],
  ),
  _p(
    'ko_t2',
    'Pesan Telepon',
    'Phone Message',
    '여보세요, 저 김지훈입니다. 내일 회의 시간이 두 시에서 네 시로 바뀌었습니다. 장소는 같은 오 층 회의실입니다. 자료는 제가 준비할 테니까 노트북만 가져오세요. 확인하시면 문자 주세요.',
    {
      'id':
          'Halo, ini Kim Jihun. Waktu rapat besok berubah dari pukul dua ke pukul empat. Tempatnya tetap ruang rapat lantai lima. Materi saya yang siapkan, jadi bawa laptop saja. Kalau sudah baca, kirim pesan singkat.',
      'en':
          "Hello, this is Kim Jihun. Tomorrow's meeting time has changed from two to four. The place is the same meeting room on the fifth floor. I will prepare the materials, so just bring your laptop. Please text me when you have read this.",
    },
    [
      _q('Jam berapa rapat sekarang?', 'What time is the meeting now?', [
        '네 시',
        '두 시',
        '세 시',
        '다섯 시',
      ]),
      _q('Di mana rapatnya?', 'Where is the meeting?', [
        '오 층 회의실',
        '이 층 회의실',
        '일 층 로비',
        '사장님 방',
      ]),
      _q('Apa yang harus dibawa?', 'What should the listener bring?', [
        '노트북',
        '자료',
        '커피',
        '펜',
      ]),
      _q('Siapa yang menyiapkan materi?', 'Who will prepare the materials?', [
        '김지훈',
        '듣는 사람',
        '사장님',
        '비서',
      ]),
      _q('Apa yang diminta di akhir?', 'What is requested at the end?', [
        '문자 보내기',
        '전화하기',
        '이메일 보내기',
        '회의실 예약하기',
      ]),
    ],
  ),
  _p(
    'ko_t3',
    'Pindah Rumah',
    'Moving House',
    '지난달에 새 집으로 이사했어요. 전에 살던 집보다 조금 작지만 지하철역이 가까워서 편해요. 집 앞에 큰 공원이 있어서 아침마다 운동을 해요. 다음 주에 친구들을 초대해서 집들이를 할 거예요.',
    {
      'id':
          'Bulan lalu saya pindah ke rumah baru. Sedikit lebih kecil dari rumah sebelumnya, tapi dekat stasiun subway jadi praktis. Di depan rumah ada taman besar, jadi setiap pagi saya olahraga. Minggu depan saya mengundang teman untuk pesta pindah rumah.',
      'en':
          'Last month I moved to a new house. It is a bit smaller than my old one, but it is close to the subway station so it is convenient. There is a big park in front of the house, so I exercise every morning. Next week I will invite friends for a housewarming.',
    },
    [
      _q('Kapan dia pindah?', 'When did the speaker move?', [
        '지난달',
        '지난주',
        '어제',
        '작년',
      ]),
      _q(
        'Apa kekurangan rumah baru?',
        'What is the downside of the new house?',
        ['조금 작다', '역에서 멀다', '비싸다', '오래됐다'],
      ),
      _q('Apa yang ada di depan rumah?', 'What is in front of the house?', [
        '큰 공원',
        '마트',
        '학교',
        '병원',
      ]),
      _q(
        'Apa yang dilakukan setiap pagi?',
        'What does the speaker do every morning?',
        ['운동', '요리', '청소', '공부'],
      ),
      _q('Apa rencana minggu depan?', 'What is the plan for next week?', [
        '집들이',
        '여행',
        '이사',
        '취직',
      ]),
    ],
  ),
  _p(
    'ko_t4',
    'Pengumuman Kelas',
    'Class Announcement',
    '학생 여러분, 다음 주 수요일 한국어 수업은 휴강입니다. 대신 금요일 오전 열 시에 보충 수업이 있습니다. 교실은 이백일 호가 아니라 삼백오 호입니다. 숙제는 금요일까지 이메일로 보내 주세요.',
    {
      'id':
          'Para siswa, kelas bahasa Korea Rabu depan ditiadakan. Sebagai gantinya ada kelas pengganti Jumat pukul sepuluh pagi. Ruangnya bukan 201 tapi 305. Tugas dikirim lewat email sebelum Jumat.',
      'en':
          "Students, next Wednesday's Korean class is cancelled. Instead there will be a make-up class on Friday at ten in the morning. The classroom is not 201 but 305. Please send your homework by email by Friday.",
    },
    [
      _q('Hari apa kelas ditiadakan?', 'Which day is class cancelled?', [
        '수요일',
        '금요일',
        '월요일',
        '목요일',
      ]),
      _q('Kapan kelas pengganti?', 'When is the make-up class?', [
        '금요일 오전 열 시',
        '수요일 오후 두 시',
        '금요일 오후 세 시',
        '토요일 아침',
      ]),
      _q(
        'Di ruang mana kelas pengganti?',
        'Which room is the make-up class in?',
        ['삼백오 호', '이백일 호', '삼백일 호', '이백오 호'],
      ),
      _q('Bagaimana tugas dikirim?', 'How should homework be sent?', [
        '이메일로',
        '우편으로',
        '직접',
        '문자로',
      ]),
      _q('Kapan tenggat tugas?', 'When is the homework due?', [
        '금요일',
        '수요일',
        '월요일',
        '다음 달',
      ]),
    ],
  ),
  _p(
    'ko_t5',
    'Wisata ke Jeju',
    'Trip to Jeju',
    '지난 주말에 가족과 제주도에 갔어요. 비행기로 한 시간쯤 걸렸어요. 바다를 보고 한라산에도 올라갔어요. 날씨가 조금 흐렸지만 경치가 아주 아름다웠어요. 다음에는 친구들과 다시 가고 싶어요.',
    {
      'id':
          'Akhir pekan lalu saya pergi ke Pulau Jeju dengan keluarga. Naik pesawat sekitar satu jam. Kami melihat laut dan naik Gunung Halla. Cuacanya agak berawan, tapi pemandangannya sangat indah. Lain kali saya ingin ke sana lagi dengan teman.',
      'en':
          'Last weekend I went to Jeju Island with my family. It took about an hour by plane. We saw the sea and also climbed Mount Halla. The weather was a little cloudy, but the scenery was very beautiful. Next time I want to go again with friends.',
    },
    [
      _q('Dengan siapa dia pergi?', 'Who did the speaker go with?', [
        '가족',
        '친구',
        '동료',
        '혼자',
      ]),
      _q('Bagaimana dia ke Jeju?', 'How did the speaker get to Jeju?', [
        '비행기로',
        '배로',
        '기차로',
        '버스로',
      ]),
      _q('Berapa lama perjalanannya?', 'How long did it take?', [
        '한 시간쯤',
        '두 시간',
        '삼십 분',
        '세 시간',
      ]),
      _q('Bagaimana cuacanya?', 'How was the weather?', [
        '조금 흐렸다',
        '아주 맑았다',
        '비가 왔다',
        '눈이 왔다',
      ]),
      _q(
        'Apa keinginannya lain kali?',
        'What does the speaker want next time?',
        ['친구들과 다시 가기', '혼자 가기', '외국에 가기', '집에 있기'],
      ),
    ],
  ),
  _p(
    'ko_t6',
    'Pengumuman Perpustakaan',
    'Library Announcement',
    '도서관 이용 안내입니다. 책은 한 사람이 다섯 권까지 이 주 동안 빌릴 수 있습니다. 반납이 늦으면 하루에 백 원씩 연체료를 내야 합니다. 도서관은 월요일에 쉬고, 다른 날은 아침 아홉 시부터 저녁 여덟 시까지 열립니다.',
    {
      'id':
          'Panduan perpustakaan. Satu orang bisa meminjam sampai lima buku selama dua minggu. Kalau terlambat mengembalikan, denda 100 won per hari. Perpustakaan tutup hari Senin, hari lain buka pukul sembilan pagi sampai delapan malam.',
      'en':
          'Library information. One person can borrow up to five books for two weeks. If you return late, you must pay a late fee of 100 won per day. The library is closed on Mondays and open from nine in the morning to eight in the evening on other days.',
    },
    [
      _q('Berapa buku yang bisa dipinjam?', 'How many books can be borrowed?', [
        '다섯 권',
        '세 권',
        '두 권',
        '열 권',
      ]),
      _q('Berapa lama masa pinjam?', 'How long is the loan period?', [
        '이 주',
        '일 주',
        '한 달',
        '삼 일',
      ]),
      _q('Berapa denda per hari?', 'What is the late fee per day?', [
        '백 원',
        '천 원',
        '오백 원',
        '이백 원',
      ]),
      _q(
        'Hari apa perpustakaan tutup?',
        'On which day is the library closed?',
        ['월요일', '일요일', '토요일', '금요일'],
      ),
      _q(
        'Jam berapa perpustakaan tutup?',
        'What time does the library close?',
        ['저녁 여덟 시', '저녁 아홉 시', '오후 여섯 시', '밤 열 시'],
      ),
    ],
  ),
  _p(
    'ko_t7',
    'Hobi Baru',
    'New Hobby',
    '저는 두 달 전부터 기타를 배우고 있어요. 처음에는 손가락이 아파서 힘들었지만 지금은 노래 세 곡을 칠 수 있어요. 일주일에 두 번 학원에 가고, 집에서도 매일 삼십 분씩 연습해요. 연말에 친구들 앞에서 연주할 계획이에요.',
    {
      'id':
          'Sejak dua bulan lalu saya belajar gitar. Awalnya jari sakit jadi sulit, tapi sekarang saya bisa memainkan tiga lagu. Seminggu dua kali ke tempat les, dan di rumah latihan 30 menit setiap hari. Akhir tahun saya berencana tampil di depan teman-teman.',
      'en':
          'I have been learning guitar for two months. At first it was hard because my fingers hurt, but now I can play three songs. I go to a music school twice a week and practice thirty minutes every day at home. I plan to perform in front of my friends at the end of the year.',
    },
    [
      _q(
        'Sejak kapan dia belajar gitar?',
        'How long has the speaker been learning guitar?',
        ['두 달 전부터', '두 주 전부터', '이 년 전부터', '어제부터'],
      ),
      _q('Apa yang sulit di awal?', 'What was hard at first?', [
        '손가락이 아팠다',
        '시간이 없었다',
        '기타가 비쌌다',
        '선생님이 무서웠다',
      ]),
      _q(
        'Berapa lagu yang bisa dimainkan sekarang?',
        'How many songs can the speaker play now?',
        ['세 곡', '두 곡', '다섯 곡', '한 곡'],
      ),
      _q(
        'Berapa lama latihan di rumah setiap hari?',
        'How long does the speaker practice at home daily?',
        ['삼십 분', '한 시간', '십 분', '두 시간'],
      ),
      _q(
        'Apa rencana akhir tahun?',
        'What is the plan for the end of the year?',
        ['친구들 앞에서 연주하기', '기타 사기', '학원 그만두기', '콘서트 보기'],
      ),
    ],
  ),
  _p(
    'ko_t8',
    'Di Bank',
    'At the Bank',
    '어서 오세요. 무엇을 도와 드릴까요? 통장을 만들고 싶어요. 신분증을 보여 주세요. 여기 있어요. 카드도 함께 만드시겠어요? 네, 부탁합니다. 카드는 일주일 후에 집으로 배송됩니다. 여기에 사인해 주세요.',
    {
      'id':
          'Selamat datang. Ada yang bisa dibantu? Saya ingin membuat rekening. Tunjukkan kartu identitas. Ini. Mau buat kartu juga? Ya, tolong. Kartu akan dikirim ke rumah seminggu kemudian. Silakan tanda tangan di sini.',
      'en':
          'Welcome. How can I help you? I would like to open an account. Please show me your ID. Here it is. Would you like a card as well? Yes, please. The card will be delivered to your home in a week. Please sign here.',
    },
    [
      _q(
        'Apa yang ingin dilakukan pelanggan?',
        'What does the customer want to do?',
        ['통장 만들기', '돈 찾기', '환전하기', '대출 받기'],
      ),
      _q('Apa yang diminta petugas?', 'What does the clerk ask for?', [
        '신분증',
        '여권',
        '사진',
        '도장',
      ]),
      _q('Apa yang juga dibuat?', 'What else is being made?', [
        '카드',
        '도장',
        '여권',
        '보험',
      ]),
      _q('Kapan kartu dikirim?', 'When will the card be delivered?', [
        '일주일 후',
        '오늘',
        '내일',
        '한 달 후',
      ]),
      _q('Ke mana kartu dikirim?', 'Where will the card be delivered?', [
        '집으로',
        '회사로',
        '은행으로',
        '학교로',
      ]),
    ],
  ),
];
