/// Soal Membaca EPS-TOPIK (읽기): bank soal pilihan ganda untuk simulasi
/// ujian bahasa Korea bagi pekerja asing (Employment Permit System).
///
/// Tipe soal (meniru bagian 읽기 EPS-TOPIK, tanpa gambar — benda dan papan
/// dideskripsikan dengan kata-kata):
/// - Kosakata: nama alat, mesin, dan benda di tempat kerja.
/// - Isian kosakata & tata bahasa dalam kalimat kerja/sehari-hari.
/// - Papan keselamatan kerja (안전 표지).
/// - Pengumuman pendek di tempat kerja/asrama (근무 시간, 휴게실, 안전 교육,
///   급여일).
/// - Pesan singkat dari 사장님/반장님 lalu jawab pertanyaannya.
///
/// Topik: manufaktur, pertanian/peternakan, perikanan, konstruksi, kehidupan
/// asrama, bank/rumah sakit/kantor imigrasi, budaya kerja Korea.
///
/// Konten disusun sendiri (bukan salinan soal asli). Pilihan PERTAMA pada
/// [_q] selalu jawaban benar (`answer: 0`); layar ujian mengacaknya.
library;

import 'mcq_bank.dart';

McqQuestion _q(String id, String en, List<String> options) =>
    McqQuestion(question: {'id': id, 'en': en}, options: options, answer: 0);

const _blank = 'Pilih kata yang tepat untuk mengisi ( ).';
const _blankEn = 'Choose the right word to fill in the blank ( ).';

/// Soal isian: [sentence] memuat "( )" sebagai rumpang.
McqQuestion _b(String sentence, List<String> options) =>
    _q('$_blank\n$sentence', '$_blankEn\n$sentence', options);

/// Soal papan keselamatan: [desc] mendeskripsikan papan (id/en).
McqQuestion _sign(
  String descId,
  String descEn,
  String text,
  List<String> options,
) => _q(
  'Papan $descId bertuliskan: 「$text」\nApa arti papan ini?',
  'A $descEn sign reads: 「$text」\nWhat does this sign mean?',
  options,
);

/// Soal bacaan: [text] (pesan/pengumuman Korea) + pertanyaan.
McqQuestion _r(String text, String qId, String qEn, List<String> options) =>
    _q('$text\n\n$qId', '$text\n\n$qEn', options);

final List<McqQuestion> epsReading = [
  // -------------------------------------------------------------------------
  // 1. Kosakata: alat, mesin, benda di tempat kerja
  // -------------------------------------------------------------------------
  _q(
    'Alat untuk memukul paku disebut apa?',
    'What is the tool used to hit nails called?',
    ['망치', '드라이버', '톱', '가위'],
  ),
  _q(
    'Alat untuk memutar dan mengencangkan sekrup disebut apa?',
    'What is the tool used to turn and tighten screws called?',
    ['드라이버', '망치', '삽', '사다리'],
  ),
  _q(
    'Alat untuk memotong kayu disebut apa?',
    'What is the tool used to cut wood called?',
    ['톱', '펜치', '줄자', '빗자루'],
  ),
  _q(
    'Alat untuk mengukur panjang disebut apa?',
    'What is the tool used to measure length called?',
    ['줄자', '렌치', '장갑', '망치'],
  ),
  _q(
    'Alat yang dipakai untuk naik ke tempat tinggi disebut apa?',
    'What do you use to climb up to a high place?',
    ['사다리', '수레', '양동이', '삽'],
  ),
  _q(
    'Alat untuk menggali tanah disebut apa?',
    'What is the tool used to dig soil called?',
    ['삽', '톱', '드라이버', '줄자'],
  ),
  _q(
    'Benda yang dipakai di kepala untuk melindungi diri di lokasi konstruksi '
        'disebut apa?',
    'What do you wear on your head for protection at a construction site?',
    ['안전모', '안전화', '마스크', '앞치마'],
  ),
  _q(
    'Sepatu khusus untuk melindungi kaki di pabrik disebut apa?',
    'What are the special shoes that protect your feet in a factory?',
    ['안전화', '슬리퍼', '장화', '운동화'],
  ),
  _q(
    'Benda yang dipakai di tangan agar tidak terluka disebut apa?',
    'What do you wear on your hands so they do not get hurt?',
    ['장갑', '모자', '양말', '안경'],
  ),
  _q(
    'Mesin untuk mengangkat dan memindahkan barang berat di gudang '
        '(forklift) disebut apa?',
    'What is the machine that lifts and moves heavy goods in a warehouse '
        '(forklift) called?',
    ['지게차', '트랙터', '세탁기', '선풍기'],
  ),
  _q(
    'Mesin pertanian untuk membajak sawah dan ladang disebut apa?',
    'What is the farm machine used to plough fields called?',
    ['트랙터', '지게차', '엘리베이터', '용접기'],
  ),
  _q(
    'Alat untuk menyambung logam dengan panas disebut apa?',
    'What is the device that joins metal using heat called?',
    ['용접기', '청소기', '계산기', '냉장고'],
  ),
  _q(
    'Alat untuk menyiram tanaman disebut apa?',
    'What is the tool used to water plants called?',
    ['물뿌리개', '빗자루', '쓰레받기', '망치'],
  ),
  _q(
    'Alat untuk menyapu lantai disebut apa?',
    'What is the tool used to sweep the floor called?',
    ['빗자루', '물뿌리개', '사다리', '줄자'],
  ),
  _q(
    'Alat di kapal ikan untuk menangkap banyak ikan sekaligus disebut apa?',
    'On a fishing boat, what is used to catch many fish at once?',
    ['그물', '바구니', '밧줄', '양동이'],
  ),
  _q(
    'Tempat memelihara sapi disebut apa?',
    'What is the place where cows are kept called?',
    ['외양간', '창고', '기숙사', '식당'],
  ),
  _q(
    'Rumah kaca untuk menanam sayuran disebut apa?',
    'What is the glass/plastic house used to grow vegetables called?',
    ['비닐하우스', '사무실', '휴게실', '탈의실'],
  ),
  _q(
    'Ruangan untuk berganti pakaian kerja disebut apa?',
    'What is the room where you change into work clothes called?',
    ['탈의실', '휴게실', '화장실', '회의실'],
  ),
  _q(
    'Alat untuk memadamkan api disebut apa?',
    'What is the device used to put out a fire called?',
    ['소화기', '세탁기', '선풍기', '전화기'],
  ),
  _q('Apa arti kata 「불량품」?', 'What does the word 「불량품」 mean?', [
    '물건이 잘못 만들어졌어요.',
    '물건이 아주 비싸요.',
    '물건이 새로 왔어요.',
    '물건을 다 팔았어요.',
  ]),
  _q('Apa arti kata 「잔업」?', 'What does the word 「잔업」 mean?', [
    '정해진 시간이 끝난 후에 더 하는 일',
    '아침에 일찍 시작하는 일',
    '집에서 하는 일',
    '쉬는 날에 하는 운동',
  ]),
  _q('Apa arti kata 「월급」?', 'What does the word 「월급」 mean?', [
    '한 달 동안 일하고 받는 돈',
    '은행에 내는 돈',
    '물건을 살 때 내는 돈',
    '병원에 내는 돈',
  ]),
  _q('Apa arti kata 「퇴근」?', 'What does the word 「퇴근」 mean?', [
    '일을 끝내고 회사에서 나가는 것',
    '아침에 회사에 오는 것',
    '회사를 그만두는 것',
    '회사에 처음 들어가는 것',
  ]),

  // -------------------------------------------------------------------------
  // 2. Isian kosakata & tata bahasa
  // -------------------------------------------------------------------------
  _b('나사를 조일 때 ( )를 사용합니다.', ['드라이버', '빗자루', '그물', '물뿌리개']),
  _b('위험하니까 공장 안에서는 ( )를 꼭 쓰세요.', ['안전모', '우산', '모자', '안경']),
  _b('오늘은 일이 많아서 밤 9시까지 ( )을 해요.', ['잔업', '휴식', '면접', '산책']),
  _b('아침 8시까지 회사에 ( ).', ['출근해야 해요', '퇴근했어요', '쉬었어요', '잤어요']),
  _b('일이 끝나면 6시에 ( ).', ['퇴근해요', '출근해요', '입사해요', '지각해요']),
  _b('머리가 아파서 ( )에 가요.', ['병원', '은행', '우체국', '시장']),
  _b('고향에 돈을 보내려고 ( )에 갔어요.', ['은행', '병원', '공항', '도서관']),
  _b('외국인등록증을 만들려면 ( )에 가야 해요.', ['출입국관리사무소', '편의점', '식당', '미용실']),
  _b('비가 와서 밭에서 일을 ( ).', ['못 했어요', '많이 했어요', '잘했어요', '먼저 했어요']),
  _b('기계가 고장 나( ) 반장님께 말했어요.', ['서', '고', '지만', '면']),
  _b('이 상자는 무거우( ) 같이 들어요.', ['니까', '지만', '거나', '는데도']),
  _b('작업 중에는 휴대폰을 사용하( ) 마세요.', ['지', '고', '서', '면']),
  _b('모르는 것이 있으( ) 언제든지 물어보세요.', ['면', '서', '지만', '거나']),
  _b('저는 한국 공장에서 일한 ( )이 있어요.', ['적', '것도', '때', '수']),
  _b('저는 지게차를 운전할 수 ( ).', ['있어요', '해요', '돼요', '봐요']),
  _b('점심을 먹은 ( )에 다시 일을 시작해요.', ['후', '전', '중', '동안']),
  _b('일을 시작하기 ( )에 안전 교육을 받아요.', ['전', '후', '뒤', '다음']),
  _b('어제는 너무 피곤해( ) 일찍 잤어요.', ['서', '면', '지만', '려고']),
  _b('주말에 친구( ) 같이 시장에 갔어요.', ['하고', '에서', '에게', '부터']),
  _b('월요일( ) 금요일까지 일해요.', ['부터', '까지', '에게', '하고']),
  _b('바닥이 미끄러우니까 ( ) 걸으세요.', ['천천히', '빨리', '자주', '많이']),
  _b('이 일은 처음이라서 아직 ( ) 못해요.', ['잘', '또', '다시', '벌써']),
  _b('소에게 하루에 두 번 ( )를 줘요.', ['사료', '비료', '연료', '재료']),
  _b('배를 타기 전에 ( )를 꼭 입으세요.', ['구명조끼', '양복', '잠옷', '앞치마']),
  _b('사과를 ( ) 상자에 담아요.', ['따서', '심어서', '팔아서', '버려서']),
  _b('시멘트와 모래를 섞어서 벽돌을 ( ).', ['쌓아요', '먹어요', '빨아요', '심어요']),
  _b('손을 다쳐서 ( )를 붙였어요.', ['반창고', '휴지', '우표', '스티커']),
  _b('제 방은 기숙사 3층에 ( ).', ['있어요', '없어요', '해요', '가요']),
  _b('사장님께서 내일 공장에 ( ).', ['오십니다', '옵니다', '와', '오자']),
  _b('반장님, 이것 좀 ( ) 주시겠어요?', ['도와', '도우', '도와서', '돕고']),

  // -------------------------------------------------------------------------
  // 3. Papan keselamatan kerja (안전 표지)
  // -------------------------------------------------------------------------
  _sign('merah di depan pintu', 'red', '출입 금지', [
    '이곳에 들어가면 안 됩니다.',
    '이곳에서 쉴 수 있습니다.',
    '이곳에서 담배를 피울 수 있습니다.',
    '이곳은 식당입니다.',
  ]),
  _sign('di gudang', 'warehouse', '금연', [
    '담배를 피우면 안 됩니다.',
    '음식을 먹으면 안 됩니다.',
    '사진을 찍으면 안 됩니다.',
    '뛰면 안 됩니다.',
  ]),
  _sign('kuning dengan gambar petir', 'yellow lightning', '감전 주의', [
    '전기를 조심해야 합니다.',
    '바닥이 미끄럽습니다.',
    '물건이 떨어질 수 있습니다.',
    '불을 조심해야 합니다.',
  ]),
  _sign('kuning di lantai yang basah', 'yellow wet-floor', '미끄럼 주의', [
    '바닥이 미끄러우니 조심하세요.',
    '여기에 물건을 놓으세요.',
    '여기에서 기다리세요.',
    '여기에서 신발을 벗으세요.',
  ]),
  _sign('kuning di bawah rak tinggi', 'yellow shelf', '낙하물 주의', [
    '위에서 물건이 떨어질 수 있습니다.',
    '바닥에 구멍이 있습니다.',
    '이곳은 뜨겁습니다.',
    '이곳에서 차가 지나갑니다.',
  ]),
  _sign('biru di pintu pabrik', 'blue', '안전모 착용', [
    '안전모를 꼭 써야 합니다.',
    '안전모를 벗어야 합니다.',
    '안전모를 팔고 있습니다.',
    '안전모를 여기에 두면 안 됩니다.',
  ]),
  _sign('biru di dekat mesin bising', 'blue', '귀마개 착용', [
    '소리가 커서 귀를 보호해야 합니다.',
    '이곳에서는 조용히 해야 합니다.',
    '음악을 들어도 됩니다.',
    '전화를 받으면 안 됩니다.',
  ]),
  _sign('merah di dekat tabung gas', 'red', '화기 엄금', [
    '불을 사용하면 절대 안 됩니다.',
    '물을 마시면 안 됩니다.',
    '전화를 사용하면 안 됩니다.',
    '이곳에서 요리를 해야 합니다.',
  ]),
  _sign('hijau di atas pintu', 'green', '비상구', [
    '위험할 때 밖으로 나가는 문입니다.',
    '사장님 사무실 문입니다.',
    '물건을 넣는 창고 문입니다.',
    '들어가면 안 되는 문입니다.',
  ]),
  _sign('di jalur forklift', 'forklift-lane', '지게차 통행 주의', [
    '지게차가 다니니까 조심하세요.',
    '지게차를 여기에 세우세요.',
    '지게차를 운전하면 안 됩니다.',
    '지게차를 고치는 곳입니다.',
  ]),
  _sign('di dekat tungku', 'furnace', '고온 주의', [
    '뜨거우니까 만지지 마세요.',
    '추우니까 옷을 입으세요.',
    '시끄러우니까 조용히 하세요.',
    '어두우니까 불을 켜세요.',
  ]),
  _sign('hijau di dinding pabrik', 'green', '비상 세안기', [
    '눈에 약품이 들어가면 씻는 곳입니다.',
    '손님을 기다리는 곳입니다.',
    '옷을 갈아입는 곳입니다.',
    '물건을 버리는 곳입니다.',
  ]),
  _sign(
    'di lantai gedung yang sedang dibangun',
    'construction-floor',
    '추락 위험',
    ['높은 곳에서 떨어질 수 있습니다.', '물건을 높이 쌓으세요.', '이곳에서 쉬어도 됩니다.', '엘리베이터를 타세요.'],
  ),

  // -------------------------------------------------------------------------
  // 4. Pengumuman di tempat kerja / asrama
  // -------------------------------------------------------------------------
  _r(
    '[공지] 근무 시간 안내\n'
        '오전 근무: 08:30 ~ 12:00\n'
        '점심시간: 12:00 ~ 13:00\n'
        '오후 근무: 13:00 ~ 17:30\n'
        '※ 토요일은 오전 근무만 합니다.',
    'Jam berapa kerja pada hari Sabtu selesai?',
    'What time does work finish on Saturday?',
    ['12시', '17시 30분', '13시', '8시 30분'],
  ),
  _r(
    '[공지] 근무 시간 안내\n'
        '오전 근무: 08:30 ~ 12:00\n'
        '점심시간: 12:00 ~ 13:00\n'
        '오후 근무: 13:00 ~ 17:30\n'
        '※ 토요일은 오전 근무만 합니다.',
    'Berapa lama waktu istirahat makan siang?',
    'How long is the lunch break?',
    ['1시간', '30분', '2시간', '4시간'],
  ),
  _r(
    '[급여일 안내]\n'
        '이번 달 월급은 25일에 통장으로 들어갑니다.\n'
        '25일이 일요일이면 그 전날인 24일에 드립니다.\n'
        '월급 명세서는 사무실에서 받으세요.',
    'Kalau tanggal 25 jatuh pada hari Minggu, kapan gaji diberikan?',
    'If the 25th falls on a Sunday, when is the salary paid?',
    ['24일', '25일', '26일', '다음 달 1일'],
  ),
  _r(
    '[급여일 안내]\n'
        '이번 달 월급은 25일에 통장으로 들어갑니다.\n'
        '25일이 일요일이면 그 전날인 24일에 드립니다.\n'
        '월급 명세서는 사무실에서 받으세요.',
    'Di mana slip gaji bisa diambil?',
    'Where can the pay slip be picked up?',
    ['사무실', '은행', '기숙사', '식당'],
  ),
  _r(
    '[안전 교육 안내]\n'
        '일시: 3월 15일(금) 오후 2시\n'
        '장소: 2층 회의실\n'
        '대상: 새로 온 직원 모두\n'
        '※ 안전화를 신고 오세요.',
    'Siapa yang harus mengikuti pelatihan keselamatan ini?',
    'Who must attend this safety training?',
    ['새로 온 직원', '사장님', '손님', '반장님만'],
  ),
  _r(
    '[안전 교육 안내]\n'
        '일시: 3월 15일(금) 오후 2시\n'
        '장소: 2층 회의실\n'
        '대상: 새로 온 직원 모두\n'
        '※ 안전화를 신고 오세요.',
    'Apa yang harus dipakai saat datang ke pelatihan?',
    'What must participants wear to the training?',
    ['안전화', '안전모', '장갑', '마스크'],
  ),
  _r(
    '[휴게실 이용 안내]\n'
        '· 이용 시간: 09:00 ~ 18:00\n'
        '· 휴게실 안에서 담배를 피우지 마세요.\n'
        '· 음식을 먹은 후에는 쓰레기를 꼭 치워 주세요.',
    'Mana yang sesuai dengan pengumuman ini?',
    'Which statement matches this notice?',
    [
      '휴게실에서 먹은 후에 쓰레기를 치워야 해요.',
      '휴게실에서 담배를 피워도 돼요.',
      '휴게실은 밤에도 쓸 수 있어요.',
      '휴게실에서 음식을 먹으면 안 돼요.',
    ],
  ),
  _r(
    '[기숙사 생활 규칙]\n'
        '1. 밤 11시 이후에는 조용히 해 주세요.\n'
        '2. 세탁기는 오후 10시까지 사용할 수 있습니다.\n'
        '3. 쓰레기는 화요일과 금요일에 버리세요.\n'
        '4. 친구가 자고 가면 안 됩니다.',
    'Kapan sampah boleh dibuang?',
    'When can trash be thrown out?',
    ['화요일과 금요일', '월요일과 목요일', '매일', '주말'],
  ),
  _r(
    '[기숙사 생활 규칙]\n'
        '1. 밤 11시 이후에는 조용히 해 주세요.\n'
        '2. 세탁기는 오후 10시까지 사용할 수 있습니다.\n'
        '3. 쓰레기는 화요일과 금요일에 버리세요.\n'
        '4. 친구가 자고 가면 안 됩니다.',
    'Mana yang TIDAK boleh dilakukan di asrama?',
    'Which is NOT allowed in the dormitory?',
    [
      '친구를 기숙사에서 재우는 것',
      '밤 9시에 세탁기를 쓰는 것',
      '금요일에 쓰레기를 버리는 것',
      '밤 10시에 방에서 쉬는 것',
    ],
  ),
  _r(
    '[식당 안내]\n'
        '아침: 07:00 ~ 08:00\n'
        '점심: 12:00 ~ 13:00\n'
        '저녁: 18:00 ~ 19:00\n'
        '※ 일요일에는 식당 문을 닫습니다.',
    'Mana yang benar menurut pengumuman ini?',
    'Which is true according to this notice?',
    [
      '일요일에는 식당에서 밥을 먹을 수 없어요.',
      '아침은 8시에 시작해요.',
      '저녁은 7시부터 먹을 수 있어요.',
      '식당은 매일 문을 열어요.',
    ],
  ),
  _r(
    '[공지] 설날 휴무 안내\n'
        '2월 9일(월)부터 2월 12일(목)까지 공장이 쉽니다.\n'
        '2월 13일(금)부터 다시 일합니다.\n'
        '고향에 가는 사람은 반장님께 미리 말해 주세요.',
    'Kapan kerja dimulai lagi?',
    'When does work start again?',
    ['2월 13일', '2월 9일', '2월 12일', '2월 14일'],
  ),
  _r(
    '[공지] 설날 휴무 안내\n'
        '2월 9일(월)부터 2월 12일(목)까지 공장이 쉽니다.\n'
        '2월 13일(금)부터 다시 일합니다.\n'
        '고향에 가는 사람은 반장님께 미리 말해 주세요.',
    'Apa yang harus dilakukan orang yang akan pulang kampung?',
    'What should people going to their hometown do?',
    [
      '반장님께 미리 말해야 해요.',
      '사장님께 돈을 내야 해요.',
      '2월 13일에 고향에 가야 해요.',
      '기숙사를 청소해야 해요.',
    ],
  ),
  _r(
    '[건강 검진 안내]\n'
        '모든 직원은 4월 10일에 건강 검진을 받습니다.\n'
        '검진 전날 밤 9시부터 아무것도 먹지 마세요.\n'
        '물은 조금 마셔도 됩니다.',
    'Apa yang tidak boleh dilakukan sejak jam 9 malam sebelum pemeriksaan?',
    'What must you not do from 9 p.m. the night before the check-up?',
    ['음식을 먹는 것', '물을 조금 마시는 것', '잠을 자는 것', '샤워를 하는 것'],
  ),
  _r(
    '[작업장 정리 안내]\n'
        '작업이 끝나면 공구를 공구함에 넣으세요.\n'
        '기계의 전원을 끄고 퇴근하세요.\n'
        '마지막으로 나가는 사람은 불을 끄세요.',
    'Apa yang harus dilakukan dengan alat setelah selesai bekerja?',
    'What should be done with the tools after work?',
    ['공구함에 넣어요.', '기숙사에 가져가요.', '기계 위에 놓아요.', '반장님께 드려요.'],
  ),

  // -------------------------------------------------------------------------
  // 5. Pesan singkat dari 사장님 / 반장님
  // -------------------------------------------------------------------------
  _r(
    '[반장님 문자]\n'
        '내일은 비가 많이 온대요. 밭일은 쉬고 비닐하우스 안에서 일합시다. '
        '아침 7시까지 비닐하우스 앞으로 오세요.',
    'Di mana mereka akan bekerja besok?',
    'Where will they work tomorrow?',
    ['비닐하우스 안', '밭', '기숙사', '사무실'],
  ),
  _r(
    '[반장님 문자]\n'
        '내일은 비가 많이 온대요. 밭일은 쉬고 비닐하우스 안에서 일합시다. '
        '아침 7시까지 비닐하우스 앞으로 오세요.',
    'Mengapa pekerjaan di ladang diliburkan?',
    'Why is the field work cancelled?',
    ['비가 많이 와서', '날씨가 너무 더워서', '트랙터가 고장 나서', '쉬는 날이라서'],
  ),
  _r(
    '[사장님 문자]\n'
        '오늘 주문이 많이 들어왔어요. 미안하지만 저녁 8시까지 잔업을 해 주세요. '
        '저녁은 회사에서 사 줄게요.',
    'Apa yang diminta oleh 사장님?',
    'What does the boss ask for?',
    ['저녁 8시까지 더 일하기', '일찍 퇴근하기', '저녁을 사 오기', '주문을 취소하기'],
  ),
  _r(
    '[사장님 문자]\n'
        '오늘 주문이 많이 들어왔어요. 미안하지만 저녁 8시까지 잔업을 해 주세요. '
        '저녁은 회사에서 사 줄게요.',
    'Mana yang sesuai dengan isi pesan?',
    'Which matches the message?',
    ['회사에서 저녁을 사 줘요.', '오늘은 주문이 적어요.', '직원들이 저녁을 사야 해요.', '잔업은 내일 해요.'],
  ),
  _r(
    '[반장님 문자]\n'
        '3번 기계가 고장 났어요. 수리 기사님이 오후 2시에 옵니다. '
        '그때까지 2번 기계에서 일하세요. 3번 기계는 만지지 마세요.',
    'Sampai jam 2 siang, di mana harus bekerja?',
    'Until 2 p.m., where should you work?',
    ['2번 기계', '3번 기계', '창고', '사무실'],
  ),
  _r(
    '[반장님 문자]\n'
        '3번 기계가 고장 났어요. 수리 기사님이 오후 2시에 옵니다. '
        '그때까지 2번 기계에서 일하세요. 3번 기계는 만지지 마세요.',
    'Siapa yang datang jam 2 siang?',
    'Who is coming at 2 p.m.?',
    ['수리 기사님', '사장님', '새 직원', '의사 선생님'],
  ),
  _r(
    '[선장님 문자]\n'
        '내일 아침 바람이 강해서 배가 못 나갑니다. '
        '대신 오전에 그물을 고치고, 오후에는 쉬세요.',
    'Apa yang dilakukan besok pagi?',
    'What will be done tomorrow morning?',
    ['그물을 고쳐요.', '배를 타고 바다에 나가요.', '하루 종일 쉬어요.', '물고기를 팔아요.'],
  ),
  _r(
    '[현장 소장님 문자]\n'
        '내일부터 작업 시작 시간이 7시로 바뀝니다. '
        '여름에는 낮에 너무 더워서 오후 3시에 작업을 끝냅니다.',
    'Mengapa pekerjaan selesai jam 3 sore?',
    'Why does work end at 3 p.m.?',
    ['여름 낮에 너무 더워서', '비가 와서', '일이 다 끝나서', '안전 교육이 있어서'],
  ),
  _r(
    '[농장 사장님 문자]\n'
        '돼지에게 사료를 아침 6시와 저녁 6시에 주세요. '
        '물통도 매일 깨끗하게 씻어 주세요. 아픈 돼지가 있으면 바로 전화하세요.',
    'Apa yang harus dilakukan jika ada babi yang sakit?',
    'What should you do if a pig is sick?',
    ['사장님께 바로 전화해요.', '사료를 더 많이 줘요.', '물통을 씻어요.', '내일 말해요.'],
  ),
  _r(
    '[농장 사장님 문자]\n'
        '돼지에게 사료를 아침 6시와 저녁 6시에 주세요. '
        '물통도 매일 깨끗하게 씻어 주세요. 아픈 돼지가 있으면 바로 전화하세요.',
    'Berapa kali sehari babi diberi pakan?',
    'How many times a day are the pigs fed?',
    ['두 번', '한 번', '세 번', '네 번'],
  ),
  _r(
    '[친구 문자]\n'
        '토요일에 외국인등록증을 바꾸러 출입국관리사무소에 가요? '
        '토요일에는 문을 안 열어요. 평일에 가야 해요. 예약도 꼭 하세요.',
    'Mana yang sesuai dengan isi pesan?',
    'Which matches the message?',
    [
      '출입국관리사무소는 평일에 가야 해요.',
      '출입국관리사무소는 토요일에 문을 열어요.',
      '예약하지 않아도 돼요.',
      '외국인등록증은 은행에서 바꿔요.',
    ],
  ),
  _r(
    '[병원 문자]\n'
        '내일 오전 10시 진료 예약이 있습니다. '
        '외국인등록증과 건강보험증을 가지고 오세요. 15분 일찍 와 주세요.',
    'Jam berapa sebaiknya tiba di rumah sakit?',
    'What time should you arrive at the hospital?',
    ['9시 45분', '10시', '10시 15분', '9시 15분'],
  ),
  _r(
    '[은행 안내문]\n'
        '해외 송금은 평일 오전 9시부터 오후 4시까지 할 수 있습니다. '
        '여권이나 외국인등록증이 필요합니다.',
    'Apa yang diperlukan untuk mengirim uang ke luar negeri?',
    'What is needed to send money abroad?',
    ['외국인등록증이나 여권', '건강보험증', '월급 명세서', '기숙사 열쇠'],
  ),

  // -------------------------------------------------------------------------
  // 6. Budaya kerja & ungkapan di tempat kerja
  // -------------------------------------------------------------------------
  _q(
    'Pagi hari bertemu 반장님 di pabrik. Salam yang paling tepat adalah?',
    'You meet your team leader at the factory in the morning. What is the '
        'most appropriate greeting?',
    ['안녕하세요?', '안녕히 주무세요.', '잘 먹겠습니다.', '안녕히 계세요.'],
  ),
  _q(
    'Saat pulang kerja lebih dulu daripada rekan, apa yang diucapkan?',
    'When leaving work before your coworkers, what do you say?',
    ['먼저 가 보겠습니다.', '어서 오세요.', '잘 먹었습니다.', '처음 뵙겠습니다.'],
  ),
  _q(
    'Rekan kerja pulang lebih dulu dan berpamitan. Balasan yang tepat?',
    'A coworker leaves first and says goodbye. What is the right reply?',
    ['수고하셨습니다.', '어서 오세요.', '잘 먹겠습니다.', '실례합니다.'],
  ),
  _q(
    'Anda terlambat datang kerja. Apa yang sebaiknya dikatakan kepada '
        '반장님?',
    'You came late to work. What should you say to your team leader?',
    ['늦어서 죄송합니다.', '축하합니다.', '괜찮아요.', '잘 지냈어요?'],
  ),
  _q(
    'Anda tidak mengerti instruksi 반장님. Kalimat yang tepat adalah?',
    'You did not understand the team leader\'s instructions. What is the '
        'right thing to say?',
    ['죄송하지만 다시 한 번 말씀해 주세요.', '네, 다 알겠습니다.', '그건 제 일이 아니에요.', '내일 할게요.'],
  ),
  _q(
    'Anda sakit dan tidak bisa bekerja hari ini. Pesan yang tepat kepada '
        '반장님?',
    'You are sick and cannot work today. What is the appropriate message to '
        'your team leader?',
    [
      '반장님, 열이 많이 나서 오늘 병원에 가야 할 것 같습니다.',
      '반장님, 오늘 날씨가 좋아서 놀러 가요.',
      '반장님, 오늘 일찍 출근하겠습니다.',
      '반장님, 월급을 더 주세요.',
    ],
  ),
  _q(
    'Di Korea, kalimat mana yang sopan saat menerima sesuatu dari atasan?',
    'In Korea, which sentence is polite when receiving something from a '
        'superior?',
    ['감사합니다. 잘 쓰겠습니다.', '이거 뭐야?', '필요 없어요.', '다음에 줘.'],
  ),
];
