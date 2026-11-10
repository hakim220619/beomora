/// Bank Mendengar EPS-TOPIK (듣기) untuk mode Ujian: kata, kalimat,
/// percakapan, dan pengumuman pendek yang dibacakan TTS, meniru tipe soal
/// 듣기 EPS-TOPIK untuk pekerja asing di Korea.
///
/// Tipe soal (diadaptasi tanpa gambar):
/// - Dengar kata/kalimat, pilih arti atau keterangan yang sesuai.
/// - Pilih jawaban yang paling tepat.
/// - Di mana percakapan berlangsung.
/// - Instruksi kerja dari 반장님: apa yang harus dilakukan pekerja.
/// - Pengumuman keselamatan kerja.
/// - Percakapan asrama, bank, rumah sakit, telepon.
/// - Angka, waktu, tanggal, dan uang (월급, 시간, 날짜).
///
/// Topik: manufaktur, pertanian, perikanan, konstruksi, kehidupan
/// sehari-hari pekerja asing di Korea.
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

const _word = 'Pilih keterangan yang sesuai dengan kata yang didengar.';
const _wordEn = 'Choose the description that matches the word you heard.';
const _sentence = 'Pilih kalimat yang artinya sama dengan yang didengar.';
const _sentenceEn =
    'Choose the sentence that means the same as what you heard.';
const _reply = 'Pilih jawaban yang paling tepat.';
const _replyEn = 'Choose the most appropriate reply.';
const _place = 'Di mana percakapan ini berlangsung?';
const _placeEn = 'Where is this conversation taking place?';
const _todo = 'Apa yang harus dilakukan pekerja?';
const _todoEn = 'What should the worker do?';
const _match = 'Pilih yang sesuai dengan isi yang didengar.';
const _matchEn = 'Choose what matches what you heard.';

final List<ListeningPassage> epsListening = [
  // -------------------------------------------------------------------------
  // Dengar kata, pilih keterangan yang sesuai
  // -------------------------------------------------------------------------
  _p(
    'ko_el_01',
    'Kata: palu',
    'Word: hammer',
    '망치',
    {'id': 'Palu', 'en': 'Hammer'},
    [
      _q(_word, _wordEn, [
        '못을 박을 때 쓰는 도구',
        '나무를 자를 때 쓰는 도구',
        '나사를 돌릴 때 쓰는 도구',
        '길이를 잴 때 쓰는 도구',
      ]),
    ],
  ),
  _p(
    'ko_el_02',
    'Kata: helm pengaman',
    'Word: safety helmet',
    '안전모',
    {'id': 'Helm pengaman', 'en': 'Safety helmet'},
    [
      _q(_word, _wordEn, [
        '머리를 보호하려고 쓰는 것',
        '손을 보호하려고 끼는 것',
        '눈을 보호하려고 쓰는 것',
        '발을 보호하려고 신는 것',
      ]),
    ],
  ),
  _p(
    'ko_el_03',
    'Kata: sarung tangan',
    'Word: work gloves',
    '장갑',
    {'id': 'Sarung tangan', 'en': 'Gloves'},
    [
      _q(_word, _wordEn, ['손에 끼는 것', '발에 신는 것', '얼굴에 쓰는 것', '허리에 매는 것']),
    ],
  ),
  _p(
    'ko_el_04',
    'Kata: kapal',
    'Word: ship',
    '배',
    {
      'id': 'Kapal (dalam konteks perikanan)',
      'en': 'Ship/boat (in a fishing context)',
    },
    [
      _q(
        'Pekerja perikanan mendengar kata ini. Pilih keterangan yang sesuai.',
        'A fishery worker hears this word. Choose the matching description.',
        ['바다에서 고기를 잡을 때 타는 것', '하늘을 나는 것', '도로에서 짐을 나르는 것', '밭을 가는 기계'],
      ),
    ],
  ),
  _p(
    'ko_el_05',
    'Kata: traktor',
    'Word: tractor',
    '트랙터',
    {'id': 'Traktor', 'en': 'Tractor'},
    [
      _q(_word, _wordEn, [
        '밭을 갈 때 쓰는 농기계',
        '물고기를 잡는 그물',
        '물건을 포장하는 기계',
        '건물을 올리는 크레인',
      ]),
    ],
  ),
  _p(
    'ko_el_06',
    'Kata: tangga',
    'Word: ladder',
    '사다리',
    {'id': 'Tangga', 'en': 'Ladder'},
    [
      _q(_word, _wordEn, [
        '높은 곳에 올라갈 때 쓰는 것',
        '무거운 물건을 들 때 쓰는 것',
        '바닥을 청소할 때 쓰는 것',
        '물을 담을 때 쓰는 것',
      ]),
    ],
  ),
  _p(
    'ko_el_07',
    'Kata: kotak P3K',
    'Word: first-aid kit',
    '구급상자',
    {'id': 'Kotak P3K', 'en': 'First-aid kit'},
    [
      _q(_word, _wordEn, [
        '다쳤을 때 약을 꺼내는 상자',
        '공구를 넣어 두는 상자',
        '쓰레기를 버리는 상자',
        '도시락을 넣는 상자',
      ]),
    ],
  ),

  // -------------------------------------------------------------------------
  // Dengar kalimat, pilih kalimat yang artinya sama
  // -------------------------------------------------------------------------
  _p(
    'ko_el_08',
    'Kalimat: lembur',
    'Sentence: overtime',
    '오늘은 저녁 여덟 시까지 일해야 돼요.',
    {
      'id': 'Hari ini harus bekerja sampai jam 8 malam.',
      'en': 'Today we have to work until 8 p.m.',
    },
    [
      _q(_sentence, _sentenceEn, [
        '오늘은 늦게까지 일해요.',
        '오늘은 일을 쉬어요.',
        '오늘은 일찍 퇴근해요.',
        '오늘은 아침에만 일해요.',
      ]),
    ],
  ),
  _p(
    'ko_el_09',
    'Kalimat: sakit kepala',
    'Sentence: headache',
    '머리가 아파서 약을 먹었어요.',
    {
      'id': 'Kepala saya sakit, jadi saya minum obat.',
      'en': 'I had a headache, so I took medicine.',
    },
    [
      _q(_sentence, _sentenceEn, [
        '두통 때문에 약을 먹었어요.',
        '배가 아파서 병원에 갔어요.',
        '다리가 아파서 집에서 쉬었어요.',
        '머리가 아파서 일찍 잤어요.',
      ]),
    ],
  ),
  _p(
    'ko_el_10',
    'Kalimat: dilarang merokok',
    'Sentence: no smoking',
    '여기에서 담배를 피우면 안 됩니다.',
    {'id': 'Di sini tidak boleh merokok.', 'en': 'You must not smoke here.'},
    [
      _q(_sentence, _sentenceEn, [
        '이곳은 금연 구역입니다.',
        '이곳은 흡연 구역입니다.',
        '이곳에서 쉬어도 됩니다.',
        '이곳에서 음식을 먹어도 됩니다.',
      ]),
    ],
  ),
  _p(
    'ko_el_11',
    'Kalimat: barang rusak',
    'Sentence: broken machine',
    '이 기계가 고장 났어요.',
    {'id': 'Mesin ini rusak.', 'en': 'This machine is broken.'},
    [
      _q(_sentence, _sentenceEn, [
        '이 기계가 작동하지 않아요.',
        '이 기계가 새로 왔어요.',
        '이 기계가 아주 빨라요.',
        '이 기계를 깨끗하게 닦았어요.',
      ]),
    ],
  ),

  // -------------------------------------------------------------------------
  // Pilih jawaban yang paling tepat
  // -------------------------------------------------------------------------
  _p(
    'ko_el_12',
    'Jawaban: asal negara',
    'Reply: home country',
    '남자: 어느 나라에서 왔어요?',
    {
      'id': 'Pria: Kamu datang dari negara mana?',
      'en': 'Man: Which country are you from?',
    },
    [
      _q(_reply, _replyEn, [
        '인도네시아에서 왔어요.',
        '공장에서 일해요.',
        '한국어를 공부해요.',
        '삼 년 동안 일했어요.',
      ]),
    ],
  ),
  _p(
    'ko_el_13',
    'Jawaban: sudah makan?',
    'Reply: have you eaten?',
    '여자: 점심 먹었어요?',
    {'id': 'Wanita: Sudah makan siang?', 'en': 'Woman: Have you had lunch?'},
    [
      _q(_reply, _replyEn, [
        '네, 식당에서 먹었어요.',
        '네, 점심이 아니에요.',
        '아니요, 점심이 많아요.',
        '아니요, 식당이 있어요.',
      ]),
    ],
  ),
  _p(
    'ko_el_14',
    'Jawaban: terima kasih',
    'Reply: thank you',
    '남자: 도와줘서 고마워요.',
    {
      'id': 'Pria: Terima kasih sudah membantu.',
      'en': 'Man: Thank you for helping me.',
    },
    [
      _q(_reply, _replyEn, [
        '아니에요. 별말씀을요.',
        '네, 처음 뵙겠습니다.',
        '안녕히 가세요.',
        '죄송하지만 모르겠어요.',
      ]),
    ],
  ),
  _p(
    'ko_el_15',
    'Jawaban: terlambat',
    'Reply: being late',
    '반장님: 왜 이렇게 늦었어요?',
    {
      'id': 'Mandor: Kenapa terlambat sekali?',
      'en': 'Foreman: Why are you so late?',
    },
    [
      _q(_reply, _replyEn, [
        '죄송합니다. 버스를 놓쳤어요.',
        '괜찮습니다. 내일 할게요.',
        '네, 일찍 왔어요.',
        '감사합니다. 맛있게 먹겠습니다.',
      ]),
    ],
  ),
  _p(
    'ko_el_16',
    'Jawaban: lama bekerja',
    'Reply: length of work',
    '여자: 한국에서 일한 지 얼마나 됐어요?',
    {
      'id': 'Wanita: Sudah berapa lama bekerja di Korea?',
      'en': 'Woman: How long have you worked in Korea?',
    },
    [
      _q(_reply, _replyEn, [
        '일 년 반쯤 됐어요.',
        '다음 달에 갈 거예요.',
        '아침 아홉 시에 시작해요.',
        '친구하고 같이 일해요.',
      ]),
    ],
  ),
  _p(
    'ko_el_17',
    'Jawaban: tawaran bantuan',
    'Reply: offer of help',
    '남자: 상자가 무거워 보이네요. 같이 들까요?',
    {
      'id': 'Pria: Kotaknya kelihatan berat. Mau diangkat bersama?',
      'en': 'Man: The box looks heavy. Shall we lift it together?',
    },
    [
      _q(_reply, _replyEn, [
        '네, 고마워요. 같이 들어요.',
        '아니요, 상자가 없어요.',
        '네, 상자를 샀어요.',
        '아니요, 무겁지 않았어요.',
      ]),
    ],
  ),
  _p(
    'ko_el_18',
    'Jawaban: libur akhir pekan',
    'Reply: weekend plans',
    '여자: 이번 주말에 뭐 할 거예요?',
    {
      'id': 'Wanita: Akhir pekan ini mau ngapain?',
      'en': 'Woman: What will you do this weekend?',
    },
    [
      _q(_reply, _replyEn, [
        '친구들하고 시장에 갈 거예요.',
        '지난 주말에 쉬었어요.',
        '주말은 토요일하고 일요일이에요.',
        '네, 주말이 좋아요.',
      ]),
    ],
  ),
  _p(
    'ko_el_19',
    'Jawaban: izin pulang',
    'Reply: asking to leave early',
    '남자: 반장님, 몸이 안 좋아서 일찍 가도 될까요?',
    {
      'id': 'Pria: Pak mandor, badan saya tidak enak, boleh pulang lebih awal?',
      'en': 'Man: Foreman, I am not feeling well. May I leave early?',
    },
    [
      _q(_reply, _replyEn, [
        '그래요. 병원에 꼭 가 보세요.',
        '네, 저도 배가 고파요.',
        '아니요, 내일 일찍 오세요.',
        '그래요. 같이 점심 먹어요.',
      ]),
    ],
  ),

  // -------------------------------------------------------------------------
  // Di mana percakapan berlangsung
  // -------------------------------------------------------------------------
  _p(
    'ko_el_20',
    'Tempat: kantor pos',
    'Place: post office',
    '남자: 이 소포를 인도네시아로 보내고 싶어요.\n여자: 저울 위에 올려 주세요. 배로 보내면 한 달쯤 걸려요.',
    {
      'id':
          'Pria: Saya ingin mengirim paket ini ke Indonesia.\nWanita: Taruh di atas timbangan. Kalau lewat kapal, sekitar sebulan.',
      'en':
          'Man: I want to send this parcel to Indonesia.\nWoman: Please put it on the scale. By sea it takes about a month.',
    },
    [
      _q(_place, _placeEn, ['우체국', '은행', '공항', '시장']),
    ],
  ),
  _p(
    'ko_el_21',
    'Tempat: apotek',
    'Place: pharmacy',
    '여자: 감기약 좀 주세요.\n남자: 하루에 세 번, 식사 후에 드세요.',
    {
      'id':
          'Wanita: Tolong berikan obat flu.\nPria: Diminum tiga kali sehari, setelah makan.',
      'en':
          'Woman: Cold medicine, please.\nMan: Take it three times a day after meals.',
    },
    [
      _q(_place, _placeEn, ['약국', '식당', '편의점', '세탁소']),
    ],
  ),
  _p(
    'ko_el_22',
    'Tempat: halte bus',
    'Place: bus stop',
    '남자: 공단으로 가는 버스가 여기 서요?\n여자: 네, 이십 번 버스를 타세요. 오 분 후에 와요.',
    {
      'id':
          'Pria: Apakah bus ke kawasan industri berhenti di sini?\nWanita: Ya, naik bus nomor 20. Datang 5 menit lagi.',
      'en':
          'Man: Does the bus to the industrial complex stop here?\nWoman: Yes, take bus number 20. It comes in 5 minutes.',
    },
    [
      _q(_place, _placeEn, ['버스 정류장', '지하철역', '공장', '기숙사']),
    ],
  ),
  _p(
    'ko_el_23',
    'Tempat: gudang',
    'Place: warehouse',
    '반장님: 이 상자들은 왼쪽 선반에 쌓아 주세요.\n남자: 네, 무거운 상자는 아래에 놓을게요.',
    {
      'id':
          'Mandor: Tolong tumpuk kotak-kotak ini di rak kiri.\nPria: Baik, kotak yang berat saya taruh di bawah.',
      'en':
          'Foreman: Please stack these boxes on the left shelf.\nMan: Okay, I will put the heavy boxes at the bottom.',
    },
    [
      _q(_place, _placeEn, ['창고', '식당', '병원', '은행']),
    ],
  ),

  // -------------------------------------------------------------------------
  // Instruksi kerja dari 반장님
  // -------------------------------------------------------------------------
  _p(
    'ko_el_24',
    'Instruksi: bersihkan mesin',
    'Instruction: clean the machine',
    '반장님: 작업이 끝나면 기계 전원을 끄고 기계 주변을 깨끗이 청소하세요.',
    {
      'id':
          'Mandor: Setelah pekerjaan selesai, matikan listrik mesin dan bersihkan sekitar mesin.',
      'en':
          'Foreman: When work is finished, turn off the machine power and clean around the machine.',
    },
    [
      _q(_todo, _todoEn, [
        '전원을 끄고 청소한다',
        '기계를 켜고 퇴근한다',
        '기계를 고친다',
        '새 기계를 가져온다',
      ]),
    ],
  ),
  _p(
    'ko_el_25',
    'Instruksi: pisahkan barang cacat',
    'Instruction: sort defective items',
    '반장님: 불량품은 빨간 상자에 넣고, 좋은 제품은 파란 상자에 넣으세요.',
    {
      'id':
          'Mandor: Barang cacat masukkan ke kotak merah, produk yang bagus ke kotak biru.',
      'en':
          'Foreman: Put defective items in the red box and good products in the blue box.',
    },
    [
      _q(_todo, _todoEn, [
        '불량품을 빨간 상자에 넣는다',
        '불량품을 파란 상자에 넣는다',
        '모든 제품을 빨간 상자에 넣는다',
        '불량품을 버린다',
      ]),
      _q(
        'Ke mana produk yang bagus dimasukkan?',
        'Where do the good products go?',
        ['파란 상자', '빨간 상자', '노란 상자', '쓰레기통'],
      ),
    ],
  ),
  _p(
    'ko_el_26',
    'Instruksi: panen tomat',
    'Instruction: harvesting tomatoes',
    '반장님: 오늘은 비닐하우스에서 토마토를 땁니다. 빨갛게 익은 것만 따고, 초록색은 그대로 두세요.',
    {
      'id':
          'Mandor: Hari ini kita memetik tomat di rumah kaca. Petik yang sudah merah matang saja, yang hijau biarkan.',
      'en':
          'Foreman: Today we pick tomatoes in the greenhouse. Pick only the red ripe ones and leave the green ones.',
    },
    [
      _q(_todo, _todoEn, [
        '익은 토마토만 딴다',
        '초록색 토마토만 딴다',
        '토마토를 모두 딴다',
        '토마토에 물을 준다',
      ]),
    ],
  ),
  _p(
    'ko_el_27',
    'Instruksi: memberi makan babi',
    'Instruction: feeding pigs',
    '반장님: 돼지 사료는 아침 일곱 시하고 오후 다섯 시, 하루에 두 번 주세요.',
    {
      'id':
          'Mandor: Pakan babi berikan dua kali sehari, jam 7 pagi dan jam 5 sore.',
      'en': 'Foreman: Give the pig feed twice a day, at 7 a.m. and 5 p.m.',
    },
    [
      _q(
        'Berapa kali sehari pakan diberikan?',
        'How many times a day is feed given?',
        ['하루에 두 번', '하루에 한 번', '하루에 세 번', '이틀에 한 번'],
      ),
      _q(
        'Jam berapa pakan sore diberikan?',
        'What time is the afternoon feeding?',
        ['오후 다섯 시', '오후 세 시', '오후 일곱 시', '오후 네 시'],
      ),
    ],
  ),
  _p(
    'ko_el_28',
    'Instruksi: perbaiki jaring',
    'Instruction: mending nets',
    '반장님: 내일 새벽에 배가 나가니까 오늘 오후에는 찢어진 그물을 고쳐 놓으세요.',
    {
      'id':
          'Mandor: Besok subuh kapal berangkat, jadi sore ini perbaiki jaring yang sobek.',
      'en':
          'Foreman: The boat goes out at dawn tomorrow, so this afternoon fix the torn nets.',
    },
    [
      _q(_todo, _todoEn, [
        '오늘 오후에 그물을 고친다',
        '오늘 오후에 배를 탄다',
        '내일 새벽에 그물을 산다',
        '오늘 오후에 고기를 판다',
      ]),
    ],
  ),
  _p(
    'ko_el_29',
    'Instruksi: angkut semen',
    'Instruction: moving cement',
    '반장님: 시멘트 포대는 무거우니까 혼자 들지 말고 수레로 옮기세요.',
    {
      'id':
          'Mandor: Karung semen berat, jadi jangan diangkat sendiri, pindahkan dengan gerobak.',
      'en':
          'Foreman: Cement bags are heavy, so do not lift them alone; move them with a cart.',
    },
    [
      _q(_todo, _todoEn, [
        '수레로 시멘트를 옮긴다',
        '혼자 시멘트를 든다',
        '시멘트를 사러 간다',
        '시멘트를 물에 섞는다',
      ]),
    ],
  ),
  _p(
    'ko_el_30',
    'Instruksi: periksa jumlah',
    'Instruction: check quantity',
    '반장님: 포장하기 전에 상자 안에 부품이 열 개씩 들어 있는지 꼭 세어 보세요.',
    {
      'id':
          'Mandor: Sebelum dikemas, pastikan hitung apakah di dalam kotak ada 10 komponen masing-masing.',
      'en':
          'Foreman: Before packing, be sure to count that each box contains ten parts.',
    },
    [
      _q(_todo, _todoEn, [
        '포장 전에 부품 개수를 센다',
        '포장 후에 상자를 버린다',
        '부품을 스무 개씩 넣는다',
        '상자를 열지 않고 보낸다',
      ]),
    ],
  ),
  _p(
    'ko_el_31',
    'Instruksi: pindah lini',
    'Instruction: change line',
    '반장님: 투안 씨, 오늘은 2번 라인에 사람이 부족해요. 점심 먹고 나서 2번 라인으로 가세요.',
    {
      'id':
          'Mandor: Tuan, hari ini lini 2 kekurangan orang. Setelah makan siang pergilah ke lini 2.',
      'en':
          'Foreman: Tuan, line 2 is short of people today. After lunch, go to line 2.',
    },
    [
      _q(_todo, _todoEn, [
        '점심 후에 2번 라인에서 일한다',
        '지금 바로 2번 라인에 간다',
        '점심을 먹지 않는다',
        '오늘은 일찍 퇴근한다',
      ]),
    ],
  ),

  // -------------------------------------------------------------------------
  // Pengumuman keselamatan
  // -------------------------------------------------------------------------
  _p(
    'ko_el_32',
    'Pengumuman: alat pelindung',
    'Announcement: protective gear',
    '안내 말씀 드리겠습니다. 공사 현장에 들어갈 때는 반드시 안전모와 안전화를 착용하십시오. 착용하지 않은 사람은 현장에 들어갈 수 없습니다.',
    {
      'id':
          'Pengumuman. Saat masuk lokasi konstruksi wajib memakai helm pengaman dan sepatu pengaman. Yang tidak memakainya tidak boleh masuk lokasi.',
      'en':
          'Attention please. When entering the construction site, you must wear a safety helmet and safety shoes. Those not wearing them cannot enter the site.',
    },
    [
      _q(_match, _matchEn, [
        '안전모를 안 쓰면 현장에 들어갈 수 없다',
        '안전화는 신지 않아도 된다',
        '현장에 아무나 들어갈 수 있다',
        '안전모는 현장 안에서 나눠 준다',
      ]),
    ],
  ),
  _p(
    'ko_el_33',
    'Pengumuman: kebakaran',
    'Announcement: fire',
    '화재가 발생했습니다. 엘리베이터를 타지 말고 비상계단을 이용해 건물 밖으로 대피하십시오.',
    {
      'id':
          'Terjadi kebakaran. Jangan naik lift, gunakan tangga darurat untuk mengungsi ke luar gedung.',
      'en':
          'A fire has broken out. Do not take the elevator; use the emergency stairs to evacuate the building.',
    },
    [
      _q(_todo, _todoEn, [
        '비상계단으로 밖에 나간다',
        '엘리베이터를 타고 내려간다',
        '방 안에서 기다린다',
        '창문을 열고 잔다',
      ]),
    ],
  ),
  _p(
    'ko_el_34',
    'Pengumuman: bahan kimia',
    'Announcement: chemicals',
    '이 작업장에서는 화학 물질을 사용합니다. 작업할 때는 마스크와 고무장갑을 꼭 끼고, 작업 후에는 손을 깨끗이 씻으십시오.',
    {
      'id':
          'Tempat kerja ini menggunakan bahan kimia. Saat bekerja wajib memakai masker dan sarung tangan karet, setelah bekerja cuci tangan sampai bersih.',
      'en':
          'Chemicals are used in this workplace. Always wear a mask and rubber gloves while working, and wash your hands thoroughly afterward.',
    },
    [
      _q(_match, _matchEn, [
        '작업할 때 마스크를 써야 한다',
        '작업 전에 손을 씻으면 된다',
        '장갑은 끼지 않아도 된다',
        '이곳은 화학 물질을 쓰지 않는다',
      ]),
    ],
  ),
  _p(
    'ko_el_35',
    'Pengumuman: gelombang panas',
    'Announcement: heat wave',
    '폭염 주의보가 내렸습니다. 낮 열두 시부터 오후 세 시까지는 밭일을 쉬고, 물을 자주 마시십시오.',
    {
      'id':
          'Peringatan gelombang panas dikeluarkan. Dari jam 12 siang sampai jam 3 sore istirahat dari kerja ladang, dan sering-seringlah minum air.',
      'en':
          'A heat wave advisory has been issued. Rest from field work from 12 noon to 3 p.m. and drink water often.',
    },
    [
      _q('Kapan pekerja harus beristirahat?', 'When should workers rest?', [
        '열두 시부터 세 시까지',
        '아침 일곱 시부터 아홉 시까지',
        '오후 세 시부터 여섯 시까지',
        '하루 종일',
      ]),
      _q(_match, _matchEn, [
        '물을 자주 마셔야 한다',
        '낮에 밭일을 더 많이 해야 한다',
        '비가 많이 올 예정이다',
        '물을 마시면 안 된다',
      ]),
    ],
  ),
  _p(
    'ko_el_36',
    'Pengumuman: forklift',
    'Announcement: forklift',
    '지게차가 지나갈 때는 가까이 가지 마십시오. 지게차는 면허가 있는 사람만 운전할 수 있습니다.',
    {
      'id':
          'Saat forklift lewat, jangan mendekat. Forklift hanya boleh dikemudikan oleh orang yang punya lisensi.',
      'en':
          'Do not go near a forklift when it passes. Only licensed people may drive a forklift.',
    },
    [
      _q(_match, _matchEn, [
        '면허가 없으면 지게차를 운전할 수 없다',
        '누구나 지게차를 운전할 수 있다',
        '지게차 옆에서 일해도 된다',
        '지게차는 오늘 쓰지 않는다',
      ]),
    ],
  ),
  _p(
    'ko_el_37',
    'Pengumuman: kapal & cuaca',
    'Announcement: boat & weather',
    '오늘 오후부터 바람이 강하게 불고 파도가 높겠습니다. 모든 배는 출항하지 말고 항구에 대기하십시오.',
    {
      'id':
          'Mulai sore ini angin bertiup kencang dan ombak tinggi. Semua kapal jangan berangkat, tunggu di pelabuhan.',
      'en':
          'From this afternoon, strong winds and high waves are expected. All boats must not set sail and should wait at the port.',
    },
    [
      _q(_todo, _todoEn, [
        '배를 타고 나가지 않는다',
        '빨리 바다로 나간다',
        '그물을 바다에 던진다',
        '다른 항구로 간다',
      ]),
    ],
  ),

  // -------------------------------------------------------------------------
  // Asrama, bank, rumah sakit, telepon
  // -------------------------------------------------------------------------
  _p(
    'ko_el_38',
    'Asrama: air panas',
    'Dormitory: hot water',
    '남자: 사장님, 기숙사 샤워실에서 뜨거운 물이 안 나와요.\n여자: 그래요? 오늘 오후에 수리 기사님을 부를게요.',
    {
      'id':
          'Pria: Bos, di kamar mandi asrama air panasnya tidak keluar.\nWanita: Begitu? Sore ini saya panggil tukang servis.',
      'en':
          'Man: Boss, there is no hot water in the dormitory shower.\nWoman: Really? I will call a repairman this afternoon.',
    },
    [
      _q(_match, _matchEn, [
        '기숙사에 뜨거운 물이 나오지 않는다',
        '남자가 직접 수리할 것이다',
        '샤워실이 새로 생겼다',
        '수리 기사가 어제 왔다',
      ]),
    ],
  ),
  _p(
    'ko_el_39',
    'Asrama: aturan',
    'Dormitory: rules',
    '여자: 기숙사에서는 밤 열한 시 이후에 큰 소리로 음악을 들으면 안 돼요. 그리고 쓰레기는 월요일과 목요일에 버리세요.',
    {
      'id':
          'Wanita: Di asrama, setelah jam 11 malam tidak boleh mendengarkan musik keras-keras. Lalu sampah dibuang hari Senin dan Kamis.',
      'en':
          'Woman: In the dormitory, you must not play loud music after 11 p.m. And put out the trash on Mondays and Thursdays.',
    },
    [
      _q('Kapan sampah dibuang?', 'When is the trash put out?', [
        '월요일과 목요일',
        '화요일과 금요일',
        '매일',
        '주말',
      ]),
      _q(_match, _matchEn, [
        '밤 열한 시 후에는 조용히 해야 한다',
        '밤에 음악을 크게 들어도 된다',
        '쓰레기는 아무 때나 버린다',
        '기숙사는 열한 시에 문을 연다',
      ]),
    ],
  ),
  _p(
    'ko_el_40',
    'Bank: kirim uang',
    'Bank: remittance',
    '남자: 고향에 돈을 보내고 싶은데요.\n여자: 외국인 등록증하고 통장을 주세요. 수수료는 오천 원입니다.',
    {
      'id':
          'Pria: Saya ingin mengirim uang ke kampung halaman.\nWanita: Berikan kartu registrasi orang asing dan buku tabungan. Biaya administrasinya 5.000 won.',
      'en':
          'Man: I would like to send money home.\nWoman: Please give me your alien registration card and bankbook. The fee is 5,000 won.',
    },
    [
      _q(
        'Apa yang ingin dilakukan pria itu?',
        'What does the man want to do?',
        ['송금하기', '통장 만들기', '환전하기', '카드 신청하기'],
      ),
      _q('Berapa biaya administrasinya?', 'How much is the fee?', [
        '오천 원',
        '오만 원',
        '천오백 원',
        '오백 원',
      ]),
    ],
  ),
  _p(
    'ko_el_41',
    'Rumah sakit: tangan terluka',
    'Hospital: injured hand',
    '여자: 어디가 아프세요?\n남자: 일하다가 칼에 손을 베였어요.\n여자: 많이 아프겠네요. 먼저 치료하고 주사를 맞읍시다.',
    {
      'id':
          'Wanita: Sakit di mana?\nPria: Waktu bekerja tangan saya teriris pisau.\nWanita: Pasti sakit sekali. Kita obati dulu lalu suntik.',
      'en':
          'Woman: Where does it hurt?\nMan: I cut my hand on a knife while working.\nWoman: That must hurt a lot. Let us treat it first and give you an injection.',
    },
    [
      _q('Apa yang terjadi pada pria itu?', 'What happened to the man?', [
        '손을 다쳤다',
        '다리를 다쳤다',
        '감기에 걸렸다',
        '배가 아프다',
      ]),
    ],
  ),
  _p(
    'ko_el_42',
    'Telepon: izin sakit',
    'Phone: calling in sick',
    '남자: 여보세요, 반장님. 저 아밋인데요. 열이 많이 나서 오늘 출근을 못 할 것 같아요.\n여자: 알겠어요. 병원에 가서 진단서를 받아 오세요.',
    {
      'id':
          'Pria: Halo, Pak mandor. Saya Amit. Saya demam tinggi, sepertinya hari ini tidak bisa masuk kerja.\nWanita: Baik. Pergi ke rumah sakit dan bawa surat keterangan dokter.',
      'en':
          'Man: Hello, foreman. This is Amit. I have a high fever, so I do not think I can come to work today.\nWoman: Okay. Go to the hospital and bring a medical certificate.',
    },
    [
      _q(_todo, _todoEn, [
        '병원에서 진단서를 받아 온다',
        '오늘 바로 출근한다',
        '반장님에게 약을 산다',
        '내일 다시 전화한다',
      ]),
    ],
  ),
  _p(
    'ko_el_43',
    'Telepon: salah sambung',
    'Phone: wrong number',
    '여자: 여보세요, 거기 한국전자죠?\n남자: 아니요, 전화 잘못 거셨어요.',
    {
      'id':
          'Wanita: Halo, ini Hanguk Elektronik, kan?\nPria: Bukan, Anda salah sambung.',
      'en':
          'Woman: Hello, is this Hanguk Electronics?\nMan: No, you have the wrong number.',
    },
    [
      _q(_match, _matchEn, [
        '여자가 번호를 잘못 눌렀다',
        '남자는 한국전자에서 일한다',
        '여자가 물건을 주문했다',
        '남자가 여자에게 전화했다',
      ]),
    ],
  ),

  // -------------------------------------------------------------------------
  // Angka, waktu, tanggal, uang
  // -------------------------------------------------------------------------
  _p(
    'ko_el_44',
    'Uang: gaji',
    'Money: salary',
    '여자: 이번 달 월급은 이백오십만 원이에요. 야근 수당이 들어가서 지난달보다 많아요.',
    {
      'id':
          'Wanita: Gaji bulan ini 2.500.000 won. Karena ada tunjangan lembur malam, lebih banyak dari bulan lalu.',
      'en':
          'Woman: This month\'s salary is 2,500,000 won. It is more than last month because night overtime pay is included.',
    },
    [
      _q('Berapa gaji bulan ini?', 'How much is this month\'s salary?', [
        '이백오십만 원',
        '이백오만 원',
        '이천오백 원',
        '이십오만 원',
      ]),
      _q('Kenapa gajinya lebih banyak?', 'Why is the salary higher?', [
        '야근 수당 때문에',
        '보너스 때문에',
        '일을 쉬어서',
        '회사를 옮겨서',
      ]),
    ],
  ),
  _p(
    'ko_el_45',
    'Tanggal: hari gajian',
    'Date: payday',
    '남자: 우리 회사는 매달 십오 일에 월급을 줘요. 그날이 주말이면 하루 전에 줘요.',
    {
      'id':
          'Pria: Perusahaan kami membayar gaji setiap tanggal 15. Kalau hari itu akhir pekan, dibayar sehari sebelumnya.',
      'en':
          'Man: Our company pays salaries on the 15th of every month. If that day is a weekend, it pays a day earlier.',
    },
    [
      _q('Tanggal berapa gaji dibayar?', 'On what date is salary paid?', [
        '매달 십오 일',
        '매달 오 일',
        '매달 오십 일',
        '매달 일 일',
      ]),
    ],
  ),
  _p(
    'ko_el_46',
    'Waktu: jam kerja',
    'Time: working hours',
    '여자: 우리 공장은 아침 여덟 시 반에 일을 시작하고 오후 다섯 시 반에 끝나요. 점심시간은 열두 시부터 한 시까지예요.',
    {
      'id':
          'Wanita: Pabrik kami mulai kerja jam 8.30 pagi dan selesai jam 5.30 sore. Jam makan siang dari jam 12 sampai jam 1.',
      'en':
          'Woman: Our factory starts work at 8:30 a.m. and finishes at 5:30 p.m. Lunch is from 12 to 1.',
    },
    [
      _q('Jam berapa pekerjaan dimulai?', 'What time does work start?', [
        '여덟 시 반',
        '여덟 시',
        '아홉 시 반',
        '다섯 시 반',
      ]),
      _q('Berapa lama istirahat makan siang?', 'How long is the lunch break?', [
        '한 시간',
        '삼십 분',
        '두 시간',
        '한 시간 반',
      ]),
    ],
  ),
  _p(
    'ko_el_47',
    'Waktu: kereta',
    'Time: train',
    '남자: 부산 가는 기차 표 한 장 주세요.\n여자: 세 시 사십 분 기차가 있어요. 요금은 오만 이천 원입니다.',
    {
      'id':
          'Pria: Tolong satu tiket kereta ke Busan.\nWanita: Ada kereta jam 3.40. Harganya 52.000 won.',
      'en':
          'Man: One train ticket to Busan, please.\nWoman: There is a 3:40 train. The fare is 52,000 won.',
    },
    [
      _q('Jam berapa kereta berangkat?', 'What time does the train leave?', [
        '세 시 사십 분',
        '네 시 삼십 분',
        '세 시 십사 분',
        '사 시 사십 분',
      ]),
      _q('Berapa harga tiketnya?', 'How much is the ticket?', [
        '오만 이천 원',
        '오만 원',
        '이만 오천 원',
        '오천이백 원',
      ]),
    ],
  ),
  _p(
    'ko_el_48',
    'Uang: belanja di pasar',
    'Money: shopping at the market',
    '여자: 사과 한 봉지에 얼마예요?\n남자: 한 봉지에 육천 원이에요. 두 봉지 사시면 만 원에 드릴게요.',
    {
      'id':
          'Wanita: Apel satu kantong berapa?\nPria: Satu kantong 6.000 won. Kalau beli dua kantong, saya kasih 10.000 won.',
      'en':
          'Woman: How much is a bag of apples?\nMan: 6,000 won a bag. If you buy two bags, I will give them to you for 10,000 won.',
    },
    [
      _q('Berapa harga dua kantong apel?', 'How much are two bags of apples?', [
        '만 원',
        '만 이천 원',
        '육천 원',
        '팔천 원',
      ]),
    ],
  ),
  _p(
    'ko_el_49',
    'Tanggal: kontrak kerja',
    'Date: work contract',
    '반장님: 투안 씨 근로 계약은 내년 삼월 삼십일 일까지예요. 계약을 연장하고 싶으면 이월까지 말해 주세요.',
    {
      'id':
          'Mandor: Kontrak kerja Tuan sampai tanggal 31 Maret tahun depan. Kalau ingin memperpanjang kontrak, beri tahu sampai bulan Februari.',
      'en':
          'Foreman: Tuan\'s work contract runs until March 31 next year. If you want to extend it, tell me by February.',
    },
    [
      _q(
        'Sampai kapan kontrak kerja Tuan?',
        'Until when is Tuan\'s contract?',
        ['내년 삼월 삼십일 일', '올해 삼월 삼십일 일', '내년 이월 삼십 일', '내년 사월 일 일'],
      ),
      _q(_todo, _todoEn, [
        '연장하려면 이월까지 말한다',
        '삼월에 고향에 간다',
        '오늘 계약서를 쓴다',
        '이월에 회사를 그만둔다',
      ]),
    ],
  ),
  _p(
    'ko_el_50',
    'Angka: jumlah produksi',
    'Numbers: production target',
    '반장님: 오늘 목표는 제품 삼백 개예요. 오전에 백오십 개를 만들었으니까 오후에도 백오십 개를 만들면 돼요.',
    {
      'id':
          'Mandor: Target hari ini 300 produk. Pagi tadi sudah membuat 150, jadi sore ini cukup membuat 150 lagi.',
      'en':
          'Foreman: Today\'s target is 300 products. We made 150 in the morning, so we need to make 150 more in the afternoon.',
    },
    [
      _q(
        'Berapa produk yang harus dibuat sore ini?',
        'How many products must be made this afternoon?',
        ['백오십 개', '삼백 개', '백 개', '이백오십 개'],
      ),
    ],
  ),
];
