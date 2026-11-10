/// Bank Mendengar TOPIK I (듣기) untuk mode Ujian: percakapan pendek dan
/// pengumuman yang dibacakan TTS, meniru tipe soal 듣기 TOPIK I.
///
/// Tipe soal (nomor asli TOPIK I):
/// - 1–4: pilih jawaban yang tepat (네/아니요).
/// - 5–6: pilih kalimat berikutnya.
/// - 7–10: di mana percakapan berlangsung.
/// - 11–14: apa yang dibicarakan (topik).
/// - 15–16 (diadaptasi, tanpa gambar): apa yang akan dilakukan berikutnya.
/// - 17–21: pilih yang sesuai dengan isi.
/// - 22–30: gagasan utama, alasan, keinginan pembicara.
///
/// Konten disusun sendiri (bukan salinan soal asli). Pilihan PERTAMA pada
/// [_q] selalu jawaban benar (`answer: 0`); layar ujian mengacaknya.
library;

import '../models/listening.dart';
import 'mcq_bank.dart';

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

const _reply = 'Pilih jawaban yang paling tepat.';
const _replyEn = 'Choose the most appropriate reply.';
const _next = 'Pilih kalimat berikutnya yang paling tepat.';
const _nextEn = 'Choose the most appropriate next line.';
const _place = 'Di mana percakapan ini berlangsung?';
const _placeEn = 'Where is this conversation taking place?';
const _topic = 'Apa yang sedang dibicarakan?';
const _topicEn = 'What are they talking about?';
const _match = 'Pilih yang sesuai dengan isi percakapan.';
const _matchEn = 'Choose what matches the conversation.';
const _matchAnn = 'Pilih yang sesuai dengan isi yang didengar.';
const _matchAnnEn = 'Choose what matches what you heard.';

final List<ListeningPassage> topikListening = [
  // -------------------------------------------------------------------------
  // 1–4: jawaban yang tepat (네/아니요)
  // -------------------------------------------------------------------------
  _p(
    'ko_tl_01',
    'Pertanyaan: buku',
    'Question: a book',
    '남자: 책이에요?',
    {'id': 'Pria: Apakah ini buku?', 'en': 'Man: Is this a book?'},
    [
      _q(_reply, _replyEn, [
        '네, 책이에요.',
        '네, 책이 없어요.',
        '아니요, 책이 비싸요.',
        '아니요, 책을 읽어요.',
      ]),
    ],
  ),
  _p(
    'ko_tl_02',
    'Pertanyaan: adik',
    'Question: a younger sibling',
    '여자: 동생이 있어요?',
    {
      'id': 'Wanita: Apakah kamu punya adik?',
      'en': 'Woman: Do you have a younger sibling?',
    },
    [
      _q(_reply, _replyEn, [
        '아니요, 동생이 없어요.',
        '아니요, 동생이 아니에요.',
        '네, 동생을 좋아해요.',
        '네, 동생이 학교에 가요.',
      ]),
    ],
  ),
  _p(
    'ko_tl_03',
    'Pertanyaan: cuaca',
    'Question: the weather',
    '남자: 오늘 날씨가 추워요?',
    {
      'id': 'Pria: Apakah cuaca hari ini dingin?',
      'en': 'Man: Is the weather cold today?',
    },
    [
      _q(_reply, _replyEn, [
        '네, 조금 추워요.',
        '네, 날씨가 아니에요.',
        '아니요, 날씨를 봐요.',
        '아니요, 오늘이 없어요.',
      ]),
    ],
  ),
  _p(
    'ko_tl_04',
    'Pertanyaan: kapan',
    'Question: when',
    '여자: 언제 한국에 왔어요?',
    {
      'id': 'Wanita: Kapan kamu datang ke Korea?',
      'en': 'Woman: When did you come to Korea?',
    },
    [
      _q(_reply, _replyEn, ['작년에 왔어요.', '비행기로 왔어요.', '친구하고 왔어요.', '서울에 왔어요.']),
    ],
  ),
  _p(
    'ko_tl_05',
    'Pertanyaan: dengan siapa',
    'Question: with whom',
    '남자: 주말에 누구하고 영화를 봤어요?',
    {
      'id': 'Pria: Akhir pekan kemarin kamu menonton film dengan siapa?',
      'en': 'Man: Who did you watch a movie with on the weekend?',
    },
    [
      _q(_reply, _replyEn, [
        '회사 동료하고 봤어요.',
        '극장에서 봤어요.',
        '토요일에 봤어요.',
        '재미있는 영화를 봤어요.',
      ]),
    ],
  ),
  _p(
    'ko_tl_06',
    'Pertanyaan: pekerjaan',
    'Question: work',
    '여자: 일이 많아요?',
    {
      'id': 'Wanita: Apakah pekerjaannya banyak?',
      'en': 'Woman: Do you have a lot of work?',
    },
    [
      _q(_reply, _replyEn, [
        '네, 일이 많아서 바빠요.',
        '네, 일이 아니에요.',
        '아니요, 일을 좋아해요.',
        '아니요, 회사가 멀어요.',
      ]),
    ],
  ),

  // -------------------------------------------------------------------------
  // 5–6: kalimat berikutnya
  // -------------------------------------------------------------------------
  _p(
    'ko_tl_07',
    'Ucapan selamat',
    'Congratulations',
    '여자: 생일 축하해요.',
    {'id': 'Wanita: Selamat ulang tahun.', 'en': 'Woman: Happy birthday.'},
    [
      _q(_next, _nextEn, ['고마워요.', '미안해요.', '괜찮아요.', '처음 뵙겠습니다.']),
    ],
  ),
  _p(
    'ko_tl_08',
    'Permintaan maaf',
    'An apology',
    '남자: 늦어서 죄송합니다.',
    {'id': 'Pria: Maaf saya terlambat.', 'en': 'Man: I am sorry I am late.'},
    [
      _q(_next, _nextEn, ['괜찮습니다.', '축하합니다.', '잘 먹겠습니다.', '어서 오세요.']),
    ],
  ),
  _p(
    'ko_tl_09',
    'Berpamitan',
    'Saying goodbye',
    '여자: 그럼 내일 또 만나요.',
    {
      'id': 'Wanita: Kalau begitu, sampai bertemu lagi besok.',
      'en': 'Woman: Then see you again tomorrow.',
    },
    [
      _q(_next, _nextEn, [
        '네, 안녕히 가세요.',
        '네, 잘 먹었습니다.',
        '아니요, 괜찮아요.',
        '네, 반갑습니다.',
      ]),
    ],
  ),
  _p(
    'ko_tl_10',
    'Di telepon',
    'On the phone',
    '남자: 여보세요, 거기 김민수 씨 댁이지요?',
    {
      'id': 'Pria: Halo, apakah ini rumah Bapak Kim Minsu?',
      'en': 'Man: Hello, is this Kim Minsu\'s home?',
    },
    [
      _q(_next, _nextEn, [
        '네, 맞습니다. 누구세요?',
        '네, 잘 지냈어요.',
        '아니요, 제가 갈게요.',
        '네, 많이 드세요.',
      ]),
    ],
  ),
  _p(
    'ko_tl_11',
    'Menerima makanan',
    'Being served food',
    '여자: 많이 드세요.',
    {
      'id': 'Wanita: Silakan makan yang banyak.',
      'en': 'Woman: Please eat a lot.',
    },
    [
      _q(_next, _nextEn, ['잘 먹겠습니다.', '잘 지내세요.', '실례합니다.', '오래간만이에요.']),
    ],
  ),

  // -------------------------------------------------------------------------
  // 7–10: tempat
  // -------------------------------------------------------------------------
  _p(
    'ko_tl_12',
    'Membeli apel',
    'Buying apples',
    '남자: 이 사과 얼마예요?\n여자: 한 개에 천오백 원이에요.',
    {
      'id': 'Pria: Apel ini berapa?\nWanita: Satu buahnya 1.500 won.',
      'en': 'Man: How much are these apples?\nWoman: 1,500 won each.',
    },
    [
      _q(_place, _placeEn, ['가게', '은행', '병원', '도서관']),
    ],
  ),
  _p(
    'ko_tl_13',
    'Mengirim uang',
    'Sending money',
    '여자: 베트남에 돈을 보내고 싶어요.\n남자: 이 종이에 이름과 계좌 번호를 써 주세요.',
    {
      'id':
          'Wanita: Saya ingin mengirim uang ke Vietnam.\nPria: Tolong tulis nama dan nomor rekening di kertas ini.',
      'en':
          'Woman: I want to send money to Vietnam.\nMan: Please write your name and account number on this form.',
    },
    [
      _q(_place, _placeEn, ['은행', '식당', '서점', '공항']),
    ],
  ),
  _p(
    'ko_tl_14',
    'Sakit kepala',
    'A headache',
    '남자: 어디가 아프세요?\n여자: 어제부터 머리가 아프고 열이 나요.',
    {
      'id':
          'Pria: Bagian mana yang sakit?\nWanita: Sejak kemarin kepala saya sakit dan demam.',
      'en':
          'Man: Where does it hurt?\nWoman: Since yesterday I have had a headache and a fever.',
    },
    [
      _q(_place, _placeEn, ['병원', '우체국', '미용실', '시장']),
    ],
  ),
  _p(
    'ko_tl_15',
    'Mengirim paket',
    'Sending a parcel',
    '여자: 이 상자를 부산에 보내려고 하는데요.\n남자: 저울 위에 올려 주세요. 빠른 우편으로 보내실 거예요?',
    {
      'id':
          'Wanita: Saya mau mengirim kotak ini ke Busan.\nPria: Tolong taruh di atas timbangan. Mau dikirim dengan pos kilat?',
      'en':
          'Woman: I would like to send this box to Busan.\nMan: Please put it on the scale. Will you send it by express mail?',
    },
    [
      _q(_place, _placeEn, ['우체국', '약국', '편의점', '학교']),
    ],
  ),
  _p(
    'ko_tl_16',
    'Meminjam buku',
    'Borrowing books',
    '남자: 이 책을 빌리고 싶은데요.\n여자: 학생증을 보여 주세요. 이 주일 후에 돌려주세요.',
    {
      'id':
          'Pria: Saya ingin meminjam buku ini.\nWanita: Tolong tunjukkan kartu pelajar Anda. Kembalikan dua minggu lagi.',
      'en':
          'Man: I would like to borrow this book.\nWoman: Please show your student ID. Return it in two weeks.',
    },
    [
      _q(_place, _placeEn, ['도서관', '서점', '은행', '식당']),
    ],
  ),
  _p(
    'ko_tl_17',
    'Memotong rambut',
    'Getting a haircut',
    '여자: 어떻게 해 드릴까요?\n남자: 앞머리만 조금 짧게 잘라 주세요.',
    {
      'id':
          'Wanita: Mau dibuat seperti apa?\nPria: Tolong potong poninya sedikit lebih pendek saja.',
      'en':
          'Woman: How would you like it?\nMan: Please just cut the front a little shorter.',
    },
    [
      _q(_place, _placeEn, ['미용실', '세탁소', '사진관', '옷 가게']),
    ],
  ),
  _p(
    'ko_tl_18',
    'Check-in',
    'Check-in',
    '남자: 여권을 보여 주시겠어요? 짐은 몇 개 보내실 거예요?\n여자: 가방 하나만 보낼게요. 창가 자리로 주세요.',
    {
      'id':
          'Pria: Boleh saya lihat paspor Anda? Berapa barang yang akan dibagasikan?\nWanita: Satu tas saja. Tolong beri kursi dekat jendela.',
      'en':
          'Man: May I see your passport? How many bags will you check?\nWoman: Just one bag. A window seat, please.',
    },
    [
      _q(_place, _placeEn, ['공항', '기차역', '호텔', '여행사']),
    ],
  ),

  // -------------------------------------------------------------------------
  // 11–14: topik
  // -------------------------------------------------------------------------
  _p(
    'ko_tl_19',
    'Keluarga',
    'Family',
    '여자: 형제가 어떻게 돼요?\n남자: 형이 한 명 있고 여동생이 두 명 있어요.',
    {
      'id':
          'Wanita: Kamu berapa bersaudara?\nPria: Saya punya satu kakak laki-laki dan dua adik perempuan.',
      'en':
          'Woman: How many siblings do you have?\nMan: I have one older brother and two younger sisters.',
    },
    [
      _q(_topic, _topicEn, ['가족', '나이', '이름', '직업']),
    ],
  ),
  _p(
    'ko_tl_20',
    'Hobi',
    'Hobbies',
    '남자: 시간이 있을 때 보통 뭐 해요?\n여자: 저는 사진 찍는 것을 좋아해서 주말마다 공원에 가요.',
    {
      'id':
          'Pria: Biasanya kamu ngapain kalau ada waktu luang?\nWanita: Saya suka memotret, jadi setiap akhir pekan saya pergi ke taman.',
      'en':
          'Man: What do you usually do when you have free time?\nWoman: I like taking photos, so I go to the park every weekend.',
    },
    [
      _q(_topic, _topicEn, ['취미', '날씨', '쇼핑', '교통']),
    ],
  ),
  _p(
    'ko_tl_21',
    'Cuaca',
    'Weather',
    '여자: 밖에 비가 와요?\n남자: 아니요, 지금은 안 오는데 오후에 눈이 온대요.',
    {
      'id':
          'Wanita: Di luar hujan?\nPria: Tidak, sekarang tidak, tapi katanya sore nanti turun salju.',
      'en':
          'Woman: Is it raining outside?\nMan: No, not now, but they say it will snow in the afternoon.',
    },
    [
      _q(_topic, _topicEn, ['날씨', '계절', '여행', '음식']),
    ],
  ),
  _p(
    'ko_tl_22',
    'Rumah',
    'Home',
    '남자: 어디에 살아요?\n여자: 회사 근처 아파트에 살아요. 걸어서 십 분쯤 걸려요.',
    {
      'id':
          'Pria: Kamu tinggal di mana?\nWanita: Saya tinggal di apartemen dekat kantor. Jalan kaki sekitar sepuluh menit.',
      'en':
          'Man: Where do you live?\nWoman: I live in an apartment near the office. It takes about ten minutes on foot.',
    },
    [
      _q(_topic, _topicEn, ['집', '고향', '회사', '시간']),
    ],
  ),
  _p(
    'ko_tl_23',
    'Makanan',
    'Food',
    '여자: 한국 음식 중에서 뭘 제일 좋아해요?\n남자: 불고기요. 김치찌개는 좀 매워요.',
    {
      'id':
          'Wanita: Dari masakan Korea, apa yang paling kamu suka?\nPria: Bulgogi. Kimchi-jjigae agak pedas.',
      'en':
          'Woman: Of all Korean dishes, what do you like most?\nMan: Bulgogi. Kimchi stew is a bit spicy.',
    },
    [
      _q(_topic, _topicEn, ['음식', '요리', '가격', '식당']),
    ],
  ),
  _p(
    'ko_tl_24',
    'Rencana liburan',
    'Vacation plans',
    '남자: 이번 휴가에 어디에 갈 거예요?\n여자: 제주도에 가서 바다를 구경하고 싶어요.',
    {
      'id':
          'Pria: Liburan kali ini mau ke mana?\nWanita: Saya ingin ke Pulau Jeju dan melihat laut.',
      'en':
          'Man: Where will you go this vacation?\nWoman: I want to go to Jeju Island and see the sea.',
    },
    [
      _q(_topic, _topicEn, ['여행 계획', '주말 약속', '고향 소개', '수업 시간']),
    ],
  ),
  _p(
    'ko_tl_25',
    'Transportasi',
    'Transportation',
    '여자: 회사에 어떻게 와요?\n남자: 지하철을 타고 와요. 버스보다 빨라요.',
    {
      'id':
          'Wanita: Kamu ke kantor naik apa?\nPria: Saya naik kereta bawah tanah. Lebih cepat daripada bus.',
      'en':
          'Woman: How do you get to the office?\nMan: I take the subway. It is faster than the bus.',
    },
    [
      _q(_topic, _topicEn, ['교통', '운동', '위치', '휴일']),
    ],
  ),

  // -------------------------------------------------------------------------
  // 15–16 (diadaptasi): yang akan dilakukan berikutnya
  // -------------------------------------------------------------------------
  _p(
    'ko_tl_26',
    'Mencari dompet',
    'Looking for a wallet',
    '여자: 민수 씨, 왜 그래요?\n남자: 지갑이 없어요. 아까 식당에 두고 온 것 같아요.\n여자: 그럼 빨리 식당에 전화해 보세요.\n남자: 네, 지금 해 볼게요.',
    {
      'id':
          'Wanita: Minsu, ada apa?\nPria: Dompet saya tidak ada. Sepertinya tertinggal di restoran tadi.\nWanita: Kalau begitu, cepat telepon restorannya.\nPria: Ya, saya coba sekarang.',
      'en':
          'Woman: Minsu, what is wrong?\nMan: My wallet is gone. I think I left it at the restaurant earlier.\nWoman: Then call the restaurant quickly.\nMan: Okay, I will try now.',
    },
    [
      _q(
        'Apa yang akan dilakukan pria setelah ini?',
        'What will the man do next?',
        ['식당에 전화를 합니다.', '식당에 밥을 먹으러 갑니다.', '새 지갑을 삽니다.', '경찰서에 갑니다.'],
      ),
    ],
  ),
  _p(
    'ko_tl_27',
    'Kantor yang panas',
    'A hot office',
    '남자: 사무실이 좀 덥지요?\n여자: 네, 좀 더워요. 창문을 열까요?\n남자: 밖이 시끄러우니까 에어컨을 켜 주세요.\n여자: 네, 알겠어요.',
    {
      'id':
          'Pria: Kantornya agak panas, ya?\nWanita: Ya, agak panas. Perlu saya buka jendelanya?\nPria: Di luar berisik, jadi tolong nyalakan AC saja.\nWanita: Baik.',
      'en':
          'Man: The office is a bit hot, isn\'t it?\nWoman: Yes, a little. Shall I open the window?\nMan: It is noisy outside, so please turn on the air conditioner.\nWoman: Okay.',
    },
    [
      _q(
        'Apa yang akan dilakukan wanita setelah ini?',
        'What will the woman do next?',
        ['에어컨을 켭니다.', '창문을 엽니다.', '창문을 닫습니다.', '밖으로 나갑니다.'],
      ),
    ],
  ),
  _p(
    'ko_tl_28',
    'Pesan di kafe',
    'Ordering at a cafe',
    '여자: 뭐 드시겠어요?\n남자: 따뜻한 커피 한 잔 주세요.\n여자: 여기에서 드시고 가세요?\n남자: 아니요, 가지고 갈게요. 카드로 계산할게요.',
    {
      'id':
          'Wanita: Mau pesan apa?\nPria: Tolong satu kopi panas.\nWanita: Diminum di sini?\nPria: Tidak, dibawa pulang. Saya bayar pakai kartu.',
      'en':
          'Woman: What would you like?\nMan: One hot coffee, please.\nWoman: For here?\nMan: No, to go. I will pay by card.',
    },
    [
      _q(
        'Apa yang akan dilakukan pria setelah ini?',
        'What will the man do next?',
        ['카드로 돈을 냅니다.', '자리에 앉아서 커피를 마십니다.', '차가운 커피를 주문합니다.', '현금을 찾으러 갑니다.'],
      ),
    ],
  ),
  _p(
    'ko_tl_29',
    'Persiapan rapat',
    'Preparing for a meeting',
    '남자: 수진 씨, 회의 자료를 다 준비했어요?\n여자: 네, 그런데 아직 복사를 못 했어요.\n남자: 그럼 열 부만 복사해 주세요. 저는 회의실을 정리할게요.',
    {
      'id':
          'Pria: Sujin, bahan rapatnya sudah siap semua?\nWanita: Sudah, tapi belum sempat difotokopi.\nPria: Kalau begitu, tolong fotokopi sepuluh rangkap saja. Saya akan merapikan ruang rapat.',
      'en':
          'Man: Sujin, have you prepared all the meeting materials?\nWoman: Yes, but I have not made copies yet.\nMan: Then please make just ten copies. I will tidy up the meeting room.',
    },
    [
      _q(
        'Apa yang akan dilakukan wanita setelah ini?',
        'What will the woman do next?',
        ['자료를 복사합니다.', '회의실을 정리합니다.', '회의 자료를 만듭니다.', '회의에 들어갑니다.'],
      ),
    ],
  ),
  _p(
    'ko_tl_30',
    'Di pabrik',
    'At the factory',
    '여자: 반장님, 이 기계가 갑자기 멈췄어요.\n남자: 그래요? 위험하니까 만지지 마세요. 제가 가서 볼게요.\n여자: 네, 여기에서 기다리겠습니다.',
    {
      'id':
          'Wanita: Pak mandor, mesin ini tiba-tiba berhenti.\nPria: Oh ya? Berbahaya, jangan disentuh. Saya akan datang melihatnya.\nWanita: Baik, saya tunggu di sini.',
      'en':
          'Woman: Team leader, this machine suddenly stopped.\nMan: Really? It is dangerous, so don\'t touch it. I will come and take a look.\nWoman: Okay, I will wait here.',
    },
    [
      _q(
        'Apa yang akan dilakukan pria setelah ini?',
        'What will the man do next?',
        ['기계를 확인하러 갑니다.', '기계를 직접 고치라고 합니다.', '새 기계를 주문합니다.', '일을 끝내고 퇴근합니다.'],
      ),
    ],
  ),

  // -------------------------------------------------------------------------
  // 17–21: yang sesuai dengan isi
  // -------------------------------------------------------------------------
  _p(
    'ko_tl_31',
    'Janji akhir pekan',
    'A weekend appointment',
    '남자: 이번 토요일에 같이 영화 볼래요?\n여자: 토요일에는 친구 결혼식이 있어요. 일요일은 어때요?\n남자: 좋아요. 그럼 일요일 두 시에 극장 앞에서 만나요.',
    {
      'id':
          'Pria: Sabtu ini mau nonton film bersama?\nWanita: Hari Sabtu ada pernikahan teman. Bagaimana kalau Minggu?\nPria: Boleh. Kalau begitu kita bertemu hari Minggu jam dua di depan bioskop.',
      'en':
          'Man: Do you want to watch a movie together this Saturday?\nWoman: I have a friend\'s wedding on Saturday. How about Sunday?\nMan: Sounds good. Then let\'s meet on Sunday at two in front of the theater.',
    },
    [
      _q(_match, _matchEn, [
        '두 사람은 일요일에 만납니다.',
        '여자는 토요일에 영화를 봅니다.',
        '남자는 친구 결혼식에 갑니다.',
        '두 사람은 극장 안에서 만납니다.',
      ]),
      _q(
        'Mengapa wanita tidak bisa hari Sabtu?',
        'Why can\'t the woman make it on Saturday?',
        ['친구 결혼식에 가야 해서', '일을 해야 해서', '몸이 아파서', '영화를 좋아하지 않아서'],
      ),
    ],
  ),
  _p(
    'ko_tl_32',
    'Belajar bahasa Korea',
    'Studying Korean',
    '여자: 한국어를 얼마나 공부했어요?\n남자: 일 년쯤 했어요. 회사가 끝나고 저녁에 학원에 다녀요.\n여자: 와, 정말 잘하네요.',
    {
      'id':
          'Wanita: Sudah berapa lama belajar bahasa Korea?\nPria: Sekitar satu tahun. Setelah pulang kerja, malamnya saya ikut les.\nWanita: Wah, kamu benar-benar pintar.',
      'en':
          'Woman: How long have you studied Korean?\nMan: About a year. After work I go to an academy in the evening.\nWoman: Wow, you are really good.',
    },
    [
      _q(_match, _matchEn, [
        '남자는 저녁에 한국어를 배웁니다.',
        '남자는 한국어를 십 년 공부했습니다.',
        '남자는 아침에 학원에 갑니다.',
        '여자는 한국어 선생님입니다.',
      ]),
    ],
  ),
  _p(
    'ko_tl_33',
    'Membeli sepatu',
    'Buying shoes',
    '남자: 이 운동화 이백오십 사이즈 있어요?\n여자: 죄송합니다. 그 사이즈는 다 팔렸어요. 다음 주 월요일에 들어와요.\n남자: 그럼 월요일에 다시 올게요.',
    {
      'id':
          'Pria: Sepatu olahraga ini ada ukuran 250?\nWanita: Maaf, ukuran itu sudah habis terjual. Senin depan barangnya datang.\nPria: Kalau begitu saya datang lagi hari Senin.',
      'en':
          'Man: Do you have these sneakers in size 250?\nWoman: Sorry, that size is sold out. It will come in next Monday.\nMan: Then I will come back on Monday.',
    },
    [
      _q(_match, _matchEn, [
        '남자는 월요일에 가게에 다시 옵니다.',
        '남자는 오늘 운동화를 샀습니다.',
        '가게에 이백오십 사이즈가 많습니다.',
        '여자는 운동화를 사러 왔습니다.',
      ]),
    ],
  ),
  _p(
    'ko_tl_34',
    'Pindah rumah',
    'Moving house',
    '여자: 다음 주에 이사한다고 들었어요.\n남자: 네, 지금 집이 회사에서 너무 멀어서 회사 근처로 가요.\n여자: 짐 옮길 때 도와 드릴까요?\n남자: 고마워요. 그런데 이삿짐센터를 불렀어요.',
    {
      'id':
          'Wanita: Saya dengar minggu depan kamu pindah rumah.\nPria: Ya, rumah sekarang terlalu jauh dari kantor, jadi saya pindah ke dekat kantor.\nWanita: Perlu saya bantu waktu angkat barang?\nPria: Terima kasih. Tapi saya sudah memanggil jasa pindahan.',
      'en':
          'Woman: I heard you are moving next week.\nMan: Yes, my current home is too far from the office, so I am moving near it.\nWoman: Shall I help you carry your things?\nMan: Thanks. But I have called a moving company.',
    },
    [
      _q(_match, _matchEn, [
        '남자는 회사 근처로 이사합니다.',
        '남자의 지금 집은 회사에서 가깝습니다.',
        '여자가 남자의 짐을 옮겨 줍니다.',
        '여자는 다음 주에 이사합니다.',
      ]),
      _q('Mengapa pria pindah rumah?', 'Why is the man moving?', [
        '집이 회사에서 멀어서',
        '집이 너무 좁아서',
        '집값이 비싸서',
        '결혼을 해서',
      ]),
    ],
  ),
  _p(
    'ko_tl_35',
    'Pengumuman di toko',
    'An announcement at a store',
    '여자: 손님 여러분께 알려 드립니다. 오늘 오후 세 시부터 다섯 시까지 1층 과일 코너에서 모든 과일을 30% 할인합니다. 많이 이용해 주시기 바랍니다.',
    {
      'id':
          'Wanita: Perhatian para pelanggan. Hari ini dari jam tiga sampai jam lima sore, semua buah di pojok buah lantai 1 diskon 30%. Silakan manfaatkan.',
      'en':
          'Woman: Attention, customers. Today from 3 to 5 p.m., all fruit in the fruit section on the 1st floor is 30% off. Please take advantage of it.',
    },
    [
      _q(_matchAnn, _matchAnnEn, [
        '과일 할인은 두 시간 동안 합니다.',
        '과일 코너는 2층에 있습니다.',
        '오전에 과일을 할인합니다.',
        '모든 물건을 30% 할인합니다.',
      ]),
    ],
  ),
  _p(
    'ko_tl_36',
    'Pengumuman di kereta',
    'An announcement on the subway',
    '남자: 이번 역은 시청, 시청역입니다. 내리실 문은 오른쪽입니다. 1호선으로 갈아타실 분은 이번 역에서 내리시기 바랍니다.',
    {
      'id':
          'Pria: Stasiun ini adalah Balai Kota, Stasiun Balai Kota. Pintu keluar di sebelah kanan. Penumpang yang akan pindah ke Jalur 1 harap turun di stasiun ini.',
      'en':
          'Man: This stop is City Hall, City Hall Station. The doors will open on the right. Passengers transferring to Line 1, please get off at this station.',
    },
    [
      _q(_matchAnn, _matchAnnEn, [
        '시청역에서 1호선으로 갈아탈 수 있습니다.',
        '문은 왼쪽으로 열립니다.',
        '다음 역이 시청역입니다.',
        '이 지하철은 1호선입니다.',
      ]),
    ],
  ),
  _p(
    'ko_tl_37',
    'Pengenalan diri',
    'Self-introduction',
    '남자: 안녕하세요. 저는 인도네시아에서 온 리안입니다. 한국에 온 지 6개월 되었습니다. 지금 자동차 부품 공장에서 일하고 있습니다. 주말에는 친구들과 축구를 합니다.',
    {
      'id':
          'Pria: Halo. Saya Rian dari Indonesia. Sudah enam bulan saya di Korea. Sekarang saya bekerja di pabrik suku cadang mobil. Akhir pekan saya bermain sepak bola dengan teman-teman.',
      'en':
          'Man: Hello. I am Rian from Indonesia. It has been six months since I came to Korea. I now work at an auto parts factory. On weekends I play soccer with friends.',
    },
    [
      _q(_matchAnn, _matchAnnEn, [
        '남자는 공장에서 일합니다.',
        '남자는 한국에 온 지 일 년 되었습니다.',
        '남자는 주말에 일을 합니다.',
        '남자는 자동차를 팝니다.',
      ]),
    ],
  ),
  _p(
    'ko_tl_38',
    'Pesan restoran',
    'Restaurant reservation',
    '여자: 여보세요, 토요일 저녁 일곱 시에 예약하고 싶은데요.\n남자: 몇 분이세요?\n여자: 여섯 명이에요. 조용한 방이 있으면 좋겠어요.\n남자: 네, 방으로 예약해 드리겠습니다.',
    {
      'id':
          'Wanita: Halo, saya ingin reservasi hari Sabtu jam tujuh malam.\nPria: Untuk berapa orang?\nWanita: Enam orang. Kalau ada ruangan yang tenang, lebih baik.\nPria: Baik, kami reservasikan di ruangan.',
      'en':
          'Woman: Hello, I would like to make a reservation for Saturday at 7 p.m.\nMan: How many people?\nWoman: Six. A quiet room would be nice.\nMan: Okay, I will reserve a room for you.',
    },
    [
      _q(_match, _matchEn, [
        '여자는 여섯 명 자리를 예약했습니다.',
        '여자는 일요일 저녁에 식당에 갑니다.',
        '식당에 방이 없습니다.',
        '여자는 식당에 직접 왔습니다.',
      ]),
    ],
  ),
  _p(
    'ko_tl_39',
    'Keselamatan kerja',
    'Workplace safety',
    '남자: 여러분, 공장 안에서는 항상 안전모를 써야 합니다. 그리고 기계가 움직일 때는 손을 넣으면 안 됩니다. 문제가 생기면 바로 반장에게 말하십시오.',
    {
      'id':
          'Pria: Semuanya, di dalam pabrik kalian harus selalu memakai helm pengaman. Lalu, saat mesin bergerak, jangan memasukkan tangan. Kalau ada masalah, segera beri tahu mandor.',
      'en':
          'Man: Everyone, you must always wear a safety helmet inside the factory. Also, do not put your hands in when the machine is moving. If there is a problem, tell the team leader right away.',
    },
    [
      _q(_matchAnn, _matchAnnEn, [
        '공장에서는 안전모를 써야 합니다.',
        '기계가 움직일 때 손을 넣어도 됩니다.',
        '문제가 생기면 혼자 고칩니다.',
        '공장 밖에서만 안전모를 씁니다.',
      ]),
    ],
  ),

  // -------------------------------------------------------------------------
  // 22–30: gagasan utama, alasan, keinginan
  // -------------------------------------------------------------------------
  _p(
    'ko_tl_40',
    'Sarapan',
    'Breakfast',
    '남자: 아침을 안 먹었어요?\n여자: 네, 시간이 없어서 자주 안 먹어요.\n남자: 아침을 안 먹으면 건강에 안 좋아요. 바나나라도 하나 먹고 오세요.',
    {
      'id':
          'Pria: Kamu belum sarapan?\nWanita: Belum, karena tidak sempat, saya sering tidak sarapan.\nPria: Kalau tidak sarapan, tidak baik untuk kesehatan. Makanlah setidaknya satu pisang sebelum datang.',
      'en':
          'Man: You didn\'t eat breakfast?\nWoman: No, I often skip it because I have no time.\nMan: Skipping breakfast is bad for your health. At least eat a banana before you come.',
    },
    [
      _q('Apa pemikiran utama pria?', 'What is the man\'s main idea?', [
        '아침을 꼭 먹는 것이 좋습니다.',
        '바나나는 비싼 과일입니다.',
        '아침에는 시간이 많습니다.',
        '점심을 많이 먹어야 합니다.',
      ]),
    ],
  ),
  _p(
    'ko_tl_41',
    'Membeli buku bekas',
    'Buying used books',
    '여자: 그 책 새로 샀어요?\n남자: 아니요, 중고 서점에서 샀어요. 새 책보다 훨씬 싸고, 깨끗한 책도 많아요. 저는 앞으로도 중고 책을 살 거예요.',
    {
      'id':
          'Wanita: Buku itu baru kamu beli?\nPria: Bukan, saya beli di toko buku bekas. Jauh lebih murah daripada buku baru, dan banyak juga yang bersih. Ke depannya saya juga akan membeli buku bekas.',
      'en':
          'Woman: Did you buy that book new?\nMan: No, I bought it at a used bookstore. It is much cheaper than new books, and many are clean. I will keep buying used books.',
    },
    [
      _q('Apa pemikiran utama pria?', 'What is the man\'s main idea?', [
        '중고 책을 사는 것이 좋습니다.',
        '새 책이 더 깨끗합니다.',
        '책을 많이 읽어야 합니다.',
        '서점이 너무 멉니다.',
      ]),
    ],
  ),
  _p(
    'ko_tl_42',
    'Olahraga',
    'Exercise',
    '남자: 요즘 운동해요?\n여자: 아니요, 헬스장은 비싸고 시간도 없어요.\n남자: 꼭 헬스장에 가지 않아도 돼요. 엘리베이터 대신 계단을 이용하는 것도 좋은 운동이에요.',
    {
      'id':
          'Pria: Akhir-akhir ini kamu berolahraga?\nWanita: Tidak, pusat kebugaran mahal dan saya juga tidak punya waktu.\nPria: Tidak harus ke pusat kebugaran. Memakai tangga daripada lift juga olahraga yang bagus.',
      'en':
          'Man: Do you exercise these days?\nWoman: No, the gym is expensive and I have no time.\nMan: You don\'t have to go to a gym. Taking the stairs instead of the elevator is good exercise too.',
    },
    [
      _q('Apa pemikiran utama pria?', 'What is the man\'s main idea?', [
        '생활 속에서도 운동을 할 수 있습니다.',
        '헬스장에 꼭 다녀야 합니다.',
        '엘리베이터를 자주 타야 합니다.',
        '운동은 시간이 많을 때 해야 합니다.',
      ]),
    ],
  ),
  _p(
    'ko_tl_43',
    'Laptop rusak',
    'A broken laptop',
    '여자: 저, 지난주에 여기에서 노트북을 샀는데 화면이 자꾸 꺼져요.\n남자: 아, 그러세요? 영수증 가지고 오셨어요?\n여자: 네, 여기 있어요. 새 노트북으로 바꾸고 싶어요.',
    {
      'id':
          'Wanita: Permisi, minggu lalu saya membeli laptop di sini, tapi layarnya sering mati.\nPria: Oh, begitu? Apakah Anda membawa struknya?\nWanita: Ya, ini. Saya ingin menukarnya dengan laptop baru.',
      'en':
          'Woman: Excuse me, I bought a laptop here last week, but the screen keeps turning off.\nMan: Oh, really? Did you bring the receipt?\nWoman: Yes, here it is. I would like to exchange it for a new laptop.',
    },
    [
      _q('Apa yang diinginkan wanita?', 'What does the woman want?', [
        '노트북을 교환하고 싶습니다.',
        '노트북을 수리하고 싶습니다.',
        '돈을 돌려받고 싶습니다.',
        '영수증을 받고 싶습니다.',
      ]),
      _q(_match, _matchEn, [
        '여자는 지난주에 노트북을 샀습니다.',
        '여자는 영수증을 잃어버렸습니다.',
        '노트북의 소리가 나오지 않습니다.',
        '남자가 노트북을 샀습니다.',
      ]),
    ],
  ),
  _p(
    'ko_tl_44',
    'Izin tidak masuk',
    'Asking for leave',
    '남자: 과장님, 내일 하루 쉬어도 될까요?\n여자: 무슨 일이 있어요?\n남자: 비자를 연장하러 출입국 사무소에 가야 해요. 오전에는 사람이 많아서 하루가 걸릴 것 같아요.\n여자: 알겠어요. 다녀오세요.',
    {
      'id':
          'Pria: Bu manajer, bolehkah saya libur sehari besok?\nWanita: Ada urusan apa?\nPria: Saya harus ke kantor imigrasi untuk memperpanjang visa. Pagi hari orangnya banyak, jadi sepertinya butuh seharian.\nWanita: Baik. Silakan.',
      'en':
          'Man: Manager, may I take a day off tomorrow?\nWoman: What is the matter?\nMan: I have to go to the immigration office to extend my visa. There are many people in the morning, so it will probably take all day.\nWoman: All right. Go ahead.',
    },
    [
      _q(
        'Mengapa pria ingin libur besok?',
        'Why does the man want a day off tomorrow?',
        ['비자를 연장해야 해서', '몸이 아파서', '고향에 가야 해서', '이사를 해야 해서'],
      ),
    ],
  ),
  _p(
    'ko_tl_45',
    'Tetangga yang berisik',
    'A noisy neighbor',
    '여자: 관리실이지요? 저는 502호에 사는데요. 위층에서 밤마다 너무 시끄러워서 잠을 잘 수 없어요. 위층에 좀 말씀해 주시면 좋겠어요.',
    {
      'id':
          'Wanita: Ini kantor pengelola, ya? Saya tinggal di unit 502. Lantai atas terlalu berisik setiap malam sampai saya tidak bisa tidur. Saya harap Anda bisa menyampaikannya ke lantai atas.',
      'en':
          'Woman: Is this the management office? I live in unit 502. Upstairs is so noisy every night that I can\'t sleep. I would like you to talk to the people upstairs.',
    },
    [
      _q('Mengapa wanita menelepon?', 'Why is the woman calling?', [
        '위층 소음 문제를 알리려고',
        '이사 날짜를 정하려고',
        '관리비를 내려고',
        '위층 사람을 소개하려고',
      ]),
      _q(_matchAnn, _matchAnnEn, [
        '여자는 밤에 잠을 잘 못 잡니다.',
        '여자는 위층에 삽니다.',
        '여자가 밤에 시끄럽게 합니다.',
        '여자는 관리실에서 일합니다.',
      ]),
    ],
  ),
  _p(
    'ko_tl_46',
    'Pengumuman perpustakaan',
    'Library announcement',
    '남자: 도서관 이용자 여러분께 안내 말씀 드립니다. 다음 주 월요일부터 수요일까지 도서관 공사가 있어서 문을 닫습니다. 빌린 책은 정문 앞 반납함에 넣어 주시기 바랍니다.',
    {
      'id':
          'Pria: Pemberitahuan untuk para pengguna perpustakaan. Mulai Senin sampai Rabu minggu depan, perpustakaan tutup karena ada renovasi. Buku yang dipinjam harap dimasukkan ke kotak pengembalian di depan pintu utama.',
      'en':
          'Man: Notice to library users. From next Monday to Wednesday, the library will be closed for construction. Please put borrowed books in the return box in front of the main entrance.',
    },
    [
      _q(
        'Mengapa pria menyampaikan pengumuman ini?',
        'Why is the man making this announcement?',
        [
          '도서관이 문을 닫는 것을 알리려고',
          '새 책을 소개하려고',
          '도서관 직원을 뽑으려고',
          '책을 빌리는 방법을 가르치려고',
        ],
      ),
      _q(_matchAnn, _matchAnnEn, [
        '공사 기간에는 반납함에 책을 넣습니다.',
        '도서관은 다음 주 내내 문을 닫습니다.',
        '공사는 이번 주에 끝났습니다.',
        '반납함은 도서관 안에 있습니다.',
      ]),
    ],
  ),
  _p(
    'ko_tl_47',
    'Sampah daur ulang',
    'Recycling',
    '여자: 민수 씨, 플라스틱하고 종이를 같이 버리면 안 돼요.\n남자: 아, 몰랐어요. 따로 버려야 해요?\n여자: 네, 우리 아파트는 수요일 저녁에만 분리수거를 해요. 물로 한번 씻어서 버리면 더 좋아요.',
    {
      'id':
          'Wanita: Minsu, plastik dan kertas tidak boleh dibuang bersamaan.\nPria: Oh, saya tidak tahu. Harus dibuang terpisah?\nWanita: Ya, apartemen kita memilah sampah daur ulang hanya Rabu malam. Lebih baik dibilas air dulu sebelum dibuang.',
      'en':
          'Woman: Minsu, you can\'t throw away plastic and paper together.\nMan: Oh, I didn\'t know. Do I have to throw them out separately?\nWoman: Yes, our apartment collects recycling only on Wednesday evenings. It is better to rinse them with water first.',
    },
    [
      _q('Apa pemikiran utama wanita?', 'What is the woman\'s main idea?', [
        '쓰레기를 규칙에 맞게 나누어 버려야 합니다.',
        '플라스틱을 쓰지 말아야 합니다.',
        '쓰레기는 아무 때나 버려도 됩니다.',
        '종이는 다시 쓸 수 없습니다.',
      ]),
      _q(_match, _matchEn, [
        '이 아파트는 수요일 저녁에 분리수거를 합니다.',
        '남자는 분리수거 방법을 잘 압니다.',
        '플라스틱과 종이를 같이 버립니다.',
        '분리수거는 매일 아침에 합니다.',
      ]),
    ],
  ),
  _p(
    'ko_tl_48',
    'Hadiah untuk ibu',
    'A gift for mother',
    '남자: 다음 주가 어머니 생신인데 무슨 선물이 좋을까요?\n여자: 작년에는 뭘 드렸어요?\n남자: 옷을 드렸어요. 그런데 어머니께서 사이즈가 안 맞아서 못 입으셨어요.\n여자: 그럼 이번에는 어머니와 같이 가서 직접 고르시게 하는 건 어때요?',
    {
      'id':
          'Pria: Minggu depan ulang tahun ibu saya, hadiah apa yang bagus ya?\nWanita: Tahun lalu kamu memberi apa?\nPria: Saya memberi baju. Tapi ukurannya tidak pas, jadi ibu tidak bisa memakainya.\nWanita: Kalau begitu, bagaimana kalau kali ini kamu pergi bersama ibumu dan biarkan beliau memilih sendiri?',
      'en':
          'Man: Next week is my mother\'s birthday. What gift would be good?\nWoman: What did you give last year?\nMan: I gave clothes. But they didn\'t fit, so she couldn\'t wear them.\nWoman: Then how about going with your mother this time and letting her choose herself?',
    },
    [
      _q('Apa yang disarankan wanita?', 'What does the woman suggest?', [
        '어머니와 같이 선물을 고르는 것',
        '작년처럼 옷을 사는 것',
        '돈을 선물로 드리는 것',
        '생일 파티를 크게 하는 것',
      ]),
      _q(_match, _matchEn, [
        '작년에 드린 옷은 사이즈가 맞지 않았습니다.',
        '어머니 생신은 이번 주입니다.',
        '어머니는 작년 선물을 자주 입으십니다.',
        '여자는 어머니 선물을 이미 샀습니다.',
      ]),
    ],
  ),
  _p(
    'ko_tl_49',
    'Mencari pekerja paruh waktu',
    'Looking for a part-time worker',
    '남자: 저희 편의점에서 주말에 일할 아르바이트생을 찾습니다. 토요일과 일요일 오전 아홉 시부터 오후 세 시까지 일합니다. 한국어로 손님과 이야기할 수 있는 분이면 좋겠습니다. 관심 있는 분은 가게로 직접 오십시오.',
    {
      'id':
          'Pria: Minimarket kami mencari pekerja paruh waktu untuk akhir pekan. Jam kerja Sabtu dan Minggu dari jam sembilan pagi sampai jam tiga sore. Kami harap orang yang bisa berbicara dengan pelanggan dalam bahasa Korea. Yang berminat silakan datang langsung ke toko.',
      'en':
          'Man: Our convenience store is looking for a part-timer to work on weekends. The hours are Saturday and Sunday from 9 a.m. to 3 p.m. We would like someone who can talk with customers in Korean. If you are interested, please come to the store in person.',
    },
    [
      _q('Mengapa pria berbicara seperti ini?', 'Why is the man saying this?', [
        '아르바이트생을 구하려고',
        '편의점을 소개하려고',
        '물건을 팔려고',
        '한국어를 가르치려고',
      ]),
      _q(_matchAnn, _matchAnnEn, [
        '주말 오전부터 오후까지 일합니다.',
        '평일 저녁에 일할 사람을 찾습니다.',
        '전화로만 신청할 수 있습니다.',
        '한국어를 못해도 괜찮습니다.',
      ]),
    ],
  ),
];
