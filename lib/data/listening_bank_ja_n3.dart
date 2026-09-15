import '../models/listening.dart';
import 'mcq_bank.dart';

/// Bank bacaan dengar (Choukai) JLPT N3 untuk fitur Latihan Dengar dan
/// mode Ujian. Tipe soal mengikuti pola JLPT: 課題理解 (apa yang harus
/// dilakukan selanjutnya), ポイント理解 (kenapa/kapan), dan 概要理解
/// (inti pengumuman/penjelasan singkat).
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

final List<ListeningPassage> jaListeningN3 = [
  // 課題理解 — kantor
  _p(
    'ja_3_1',
    'Persiapan Rapat di Kantor',
    'Preparing a Meeting at the Office',
    '田中さん、明日の会議の資料なんですが、コピーは十部お願いします。それから、会議室の予約がまだなので、先に受付で三時から五時まで予約してください。資料のコピーはその後で大丈夫です。あ、それと部長には私からメールしておきますから、田中さんは連絡しなくていいですよ。',
    {
      'id':
          'Tanaka, soal materi rapat besok, tolong fotokopi sepuluh rangkap. Lalu, ruang rapat belum dipesan, jadi tolong pesan dulu di resepsionis dari jam tiga sampai jam lima. Fotokopi materinya boleh setelah itu. Oh, dan ke kepala bagian saya sendiri yang akan kirim email, jadi Tanaka tidak perlu menghubunginya.',
      'en':
          'Tanaka, about the materials for tomorrow\'s meeting, please make ten copies. Also, the meeting room hasn\'t been booked yet, so first go to reception and reserve it from three to five. The copies can be done after that. Oh, and I\'ll email the department manager myself, so you don\'t need to contact him.',
    },
    [
      _q(
        'Apa yang harus Tanaka lakukan pertama kali?',
        'What should Tanaka do first?',
        ['会議室を予約する', '資料をコピーする', '部長にメールする', '会議に出る'],
      ),
      _q(
        'Berapa rangkap materi yang harus difotokopi?',
        'How many copies of the materials are needed?',
        ['十部', '五部', '三部', '二十部'],
      ),
      _q(
        'Ruang rapat dipesan untuk jam berapa?',
        'For what time should the meeting room be booked?',
        ['三時から五時まで', '三時から四時まで', '二時から五時まで', '五時から七時まで'],
      ),
      _q(
        'Siapa yang akan mengirim email ke kepala bagian?',
        'Who will email the department manager?',
        ['話している人', '田中さん', '受付の人', '会議に出る人'],
      ),
      _q(
        'Di mana ruang rapat harus dipesan?',
        'Where should the meeting room be reserved?',
        ['受付', '会議室', '部長の部屋', 'コピー室'],
      ),
    ],
  ),
  // 概要理解 — pengumuman kereta
  _p(
    'ja_3_2',
    'Pengumuman di Dalam Kereta',
    'In-Train Announcement',
    'ご乗車ありがとうございます。この電車は各駅停車、東京行きです。次は新宿、新宿です。お出口は左側です。快速電車にお乗り換えのお客様は、新宿でお乗り換えください。なお、本日は強風のため、この電車は五分ほど遅れて運転しております。ご迷惑をおかけして申し訳ございません。',
    {
      'id':
          'Terima kasih telah naik kereta ini. Kereta ini adalah kereta lokal (berhenti di setiap stasiun) tujuan Tokyo. Berikutnya Shinjuku, Shinjuku. Pintu keluar di sebelah kiri. Penumpang yang ingin pindah ke kereta cepat, silakan pindah di Shinjuku. Selain itu, karena angin kencang hari ini, kereta ini berjalan terlambat sekitar lima menit. Mohon maaf atas ketidaknyamanannya.',
      'en':
          'Thank you for riding with us. This is a local train bound for Tokyo. The next stop is Shinjuku, Shinjuku. The doors on the left side will open. Passengers transferring to the rapid train, please change at Shinjuku. Also, due to strong winds today, this train is running about five minutes late. We apologize for the inconvenience.',
    },
    [
      _q(
        'Ke mana tujuan akhir kereta ini?',
        'What is the final destination of this train?',
        ['東京', '新宿', '品川', '横浜'],
      ),
      _q('Stasiun berikutnya adalah?', 'What is the next station?', [
        '新宿',
        '東京',
        '渋谷',
        '池袋',
      ]),
      _q('Pintu keluar di sebelah mana?', 'Which side do the doors open?', [
        '左側',
        '右側',
        '両側',
        '前側',
      ]),
      _q('Kenapa kereta terlambat?', 'Why is the train delayed?', [
        '強風のため',
        '雨のため',
        '事故のため',
        '人が多いため',
      ]),
      _q('Berapa lama keterlambatannya?', 'How late is the train?', [
        '五分ほど',
        '十分ほど',
        '十五分ほど',
        '三十分ほど',
      ]),
    ],
  ),
  // 課題理解 — resepsionis rumah sakit
  _p(
    'ja_3_3',
    'Resepsionis Rumah Sakit',
    'Hospital Reception',
    '山田さん、今日は初めてですね。では、まずこの問診票に名前と住所、それから今の症状を書いてください。書き終わったら、保険証と一緒にこちらに出してください。その後、二階の待合室でお待ちください。お名前をお呼びします。順番は三十分ぐらいかかると思います。',
    {
      'id':
          'Yamada-san, hari ini pertama kali datang ya. Baik, pertama tolong tulis nama, alamat, lalu gejala yang dirasakan sekarang di formulir anamnesis ini. Setelah selesai menulis, serahkan ke sini bersama kartu asuransi. Setelah itu, silakan tunggu di ruang tunggu lantai dua. Nama Anda akan dipanggil. Gilirannya mungkin sekitar tiga puluh menit.',
      'en':
          'Ms. Yamada, this is your first visit, right? First, please fill in your name, address, and current symptoms on this medical questionnaire. When you\'re done, hand it in here together with your insurance card. After that, please wait in the waiting room on the second floor. We\'ll call your name. It will probably take about thirty minutes.',
    },
    [
      _q(
        'Apa yang harus Yamada lakukan pertama kali?',
        'What should Yamada do first?',
        ['問診票に書く', '保険証を出す', '二階で待つ', '薬をもらう'],
      ),
      _q(
        'Formulir diserahkan bersama apa?',
        'What should be submitted along with the form?',
        ['保険証', 'お金', '薬', '名前のカード'],
      ),
      _q('Di mana Yamada harus menunggu?', 'Where should Yamada wait?', [
        '二階の待合室',
        '一階の受付',
        '三階の待合室',
        '入り口の前',
      ]),
      _q('Berapa lama perkiraan menunggu?', 'How long is the expected wait?', [
        '三十分ぐらい',
        '十分ぐらい',
        '一時間ぐらい',
        '二時間ぐらい',
      ]),
      _q(
        'Ini kunjungan Yamada yang ke berapa?',
        'Which visit is this for Yamada?',
        ['初めて', '二回目', '毎週来ている', '先月も来た'],
      ),
    ],
  ),
  // 概要理解 — pengumuman apartemen
  _p(
    'ja_3_4',
    'Pemberitahuan di Apartemen',
    'Apartment Notice',
    '入居者の皆様にお知らせします。来週の火曜日、朝九時から午後三時まで、水道の工事を行います。この間、水が使えなくなりますので、前の日に必要な水をためておいてください。また、工事の音がしますので、ご了承ください。ご質問は一階の管理人室までお願いします。',
    {
      'id':
          'Pemberitahuan untuk seluruh penghuni. Selasa minggu depan, dari jam sembilan pagi sampai jam tiga sore, akan dilakukan perbaikan saluran air. Selama waktu itu air tidak bisa digunakan, jadi tolong tampung air yang diperlukan sehari sebelumnya. Selain itu, akan ada suara pekerjaan, mohon dimaklumi. Pertanyaan silakan ke ruang pengelola di lantai satu.',
      'en':
          'Attention all residents. Next Tuesday, from nine in the morning until three in the afternoon, water pipe work will be carried out. Water will not be available during this time, so please store the water you need the day before. There will also be construction noise; we ask for your understanding. For questions, please contact the manager\'s office on the first floor.',
    },
    [
      _q(
        'Pekerjaan apa yang akan dilakukan?',
        'What kind of work will be done?',
        ['水道の工事', '電気の工事', 'エレベーターの工事', '屋根の工事'],
      ),
      _q('Kapan pekerjaan dilakukan?', 'When will the work take place?', [
        '来週の火曜日',
        '来週の水曜日',
        '今週の火曜日',
        '来月の火曜日',
      ]),
      _q('Jam berapa pekerjaan berlangsung?', 'What are the working hours?', [
        '朝九時から午後三時まで',
        '朝八時から午後三時まで',
        '朝九時から午後五時まで',
        '午後一時から三時まで',
      ]),
      _q(
        'Apa yang harus penghuni lakukan sehari sebelumnya?',
        'What should residents do the day before?',
        ['水をためておく', '部屋を出る', '電気を消す', '管理人に電話する'],
      ),
      _q(
        'Ke mana jika ada pertanyaan?',
        'Where should residents go with questions?',
        ['一階の管理人室', '二階の事務所', '近くの市役所', '工事の会社'],
      ),
    ],
  ),
  // ポイント理解 — telepon
  _p(
    'ja_3_5',
    'Telepon: Akan Terlambat',
    'Phone Call: Running Late',
    'もしもし、佐藤です。すみません、今駅にいるんですが、電車が事故で止まっていて、約束の時間に間に合いそうにありません。たぶん三十分ぐらい遅れます。先に店に入って待っていてもらえますか。店の前じゃなくて、中で待っていてください。着いたらもう一度電話します。',
    {
      'id':
          'Halo, ini Sato. Maaf, saya sekarang di stasiun, tapi keretanya berhenti karena kecelakaan, sepertinya saya tidak akan sampai tepat waktu. Mungkin terlambat sekitar tiga puluh menit. Bisa masuk ke toko dulu dan tunggu di sana? Jangan di depan toko, tunggu di dalam ya. Kalau sudah sampai saya telepon lagi.',
      'en':
          'Hello, this is Sato. Sorry, I\'m at the station now, but the train has stopped because of an accident, and it looks like I won\'t make it on time. I\'ll probably be about thirty minutes late. Could you go into the shop first and wait there? Not in front of the shop, please wait inside. I\'ll call you again when I arrive.',
    },
    [
      _q('Siapa yang menelepon?', 'Who is calling?', [
        '佐藤さん',
        '田中さん',
        '店の人',
        '駅の人',
      ]),
      _q('Kenapa Sato akan terlambat?', 'Why will Sato be late?', [
        '電車が事故で止まっている',
        '道が混んでいる',
        '仕事が終わらない',
        '駅が分からない',
      ]),
      _q('Berapa lama Sato akan terlambat?', 'How late will Sato be?', [
        '三十分ぐらい',
        '十分ぐらい',
        '一時間ぐらい',
        '五分ぐらい',
      ]),
      _q(
        'Apa yang harus dilakukan lawan bicara?',
        'What should the listener do?',
        ['店の中で待つ', '店の前で待つ', '駅に行く', '家に帰る'],
      ),
      _q(
        'Apa yang akan Sato lakukan setelah sampai?',
        'What will Sato do upon arriving?',
        ['もう一度電話する', 'メールを送る', '店に入る', 'タクシーを呼ぶ'],
      ),
    ],
  ),
  // ポイント理解 — keluhan di toko
  _p(
    'ja_3_6',
    'Menukar Sweter di Toko',
    'Exchanging a Sweater at the Shop',
    'すみません、昨日ここで買ったセーターなんですが、家で見たら袖に穴が開いていたんです。お客様、大変申し訳ございません。レシートはお持ちでしょうか。はい、これです。では、同じ商品と交換いたします。ただ、同じ色は売り切れておりまして、黒か白なら今すぐお渡しできます。それなら、黒でお願いします。',
    {
      'id':
          'Permisi, ini sweter yang saya beli di sini kemarin, waktu dilihat di rumah ternyata ada lubang di bagian lengannya. Mohon maaf sebesar-besarnya. Apakah Anda membawa struknya? Ya, ini. Baik, kami tukar dengan barang yang sama. Hanya saja, warna yang sama sudah habis, kalau hitam atau putih bisa langsung kami serahkan sekarang. Kalau begitu, hitam saja.',
      'en':
          'Excuse me, this is a sweater I bought here yesterday, and when I looked at it at home there was a hole in the sleeve. We are terribly sorry. Do you have the receipt? Yes, here it is. Then we will exchange it for the same item. However, the same color is sold out; if black or white is fine, we can hand it over right now. In that case, black please.',
    },
    [
      _q(
        'Apa masalah pada sweter tersebut?',
        'What is wrong with the sweater?',
        ['袖に穴が開いていた', 'サイズが小さかった', '色が違った', 'ボタンが取れていた'],
      ),
      _q('Kapan sweter itu dibeli?', 'When was the sweater bought?', [
        '昨日',
        '今日',
        '先週',
        '一か月前',
      ]),
      _q(
        'Apa yang ditanyakan pegawai toko?',
        'What does the shop clerk ask for?',
        ['レシート', 'クレジットカード', '名前', '電話番号'],
      ),
      _q(
        'Kenapa tidak bisa ditukar dengan warna yang sama?',
        'Why can\'t it be exchanged for the same color?',
        ['売り切れているから', '値段が高いから', '作っていないから', '注文が必要だから'],
      ),
      _q(
        'Warna apa yang akhirnya dipilih pelanggan?',
        'Which color does the customer finally choose?',
        ['黒', '白', '赤', '青'],
      ),
    ],
  ),
  // 概要理解 — ramalan cuaca
  _p(
    'ja_3_7',
    'Ramalan Cuaca Tokyo',
    'Tokyo Weather Forecast',
    '続いて天気予報です。今日の東京は午前中は晴れますが、午後から雲が広がり、夕方には雨が降るでしょう。最高気温は二十五度で、昨日より三度低くなる見込みです。夜は風が強くなりますので、傘をお持ちの方はご注意ください。明日は一日中晴れる予報で、気温も今日より高くなりそうです。',
    {
      'id':
          'Selanjutnya ramalan cuaca. Tokyo hari ini cerah di pagi hari, tetapi sejak siang awan akan menyebar dan sore hari kemungkinan hujan. Suhu tertinggi dua puluh lima derajat, diperkirakan tiga derajat lebih rendah dari kemarin. Malam hari angin akan menguat, jadi yang membawa payung harap berhati-hati. Besok diperkirakan cerah sepanjang hari, dan suhu tampaknya akan lebih tinggi dari hari ini.',
      'en':
          'Next, the weather forecast. Tokyo will be sunny this morning, but clouds will spread from the afternoon and it will likely rain in the evening. The high will be twenty-five degrees, expected to be three degrees lower than yesterday. Winds will pick up at night, so those carrying umbrellas should be careful. Tomorrow is forecast to be sunny all day, and temperatures look set to be higher than today.',
    },
    [
      _q('Kapan hujan diperkirakan turun?', 'When is rain expected?', [
        '夕方',
        '午前中',
        '昼',
        '明日の朝',
      ]),
      _q(
        'Berapa suhu tertinggi hari ini?',
        'What is today\'s high temperature?',
        ['二十五度', '二十二度', '二十八度', '三十度'],
      ),
      _q(
        'Dibanding kemarin, suhu hari ini bagaimana?',
        'Compared to yesterday, how is today\'s temperature?',
        ['三度低い', '三度高い', '五度低い', '同じ'],
      ),
      _q(
        'Bagaimana kondisi malam hari?',
        'What will the weather be like at night?',
        ['風が強くなる', '雪が降る', '暑くなる', '霧が出る'],
      ),
      _q('Bagaimana cuaca besok?', 'What is tomorrow\'s forecast?', [
        '一日中晴れ',
        '一日中雨',
        '午後から雨',
        '朝は曇り',
      ]),
    ],
  ),
  // ポイント理解 — perpustakaan
  _p(
    'ja_3_8',
    'Pengumuman Perpustakaan',
    'Library Announcement',
    'ご利用の皆様にお知らせします。来週の月曜日から水曜日まで、システムの入れ替えのため、本の貸し出しはお休みします。返却は入り口の返却ボックスをご利用ください。木曜日からは、新しいカードで貸し出しができます。新しいカードは二階のカウンターで、今日から無料でお作りできますので、早めにお越しください。',
    {
      'id':
          'Pengumuman untuk para pengunjung. Dari Senin sampai Rabu minggu depan, peminjaman buku ditutup karena penggantian sistem. Untuk pengembalian, silakan gunakan kotak pengembalian di pintu masuk. Mulai Kamis, peminjaman bisa dilakukan dengan kartu baru. Kartu baru dapat dibuat gratis di loket lantai dua mulai hari ini, jadi silakan datang lebih awal.',
      'en':
          'Attention, library users. From next Monday to Wednesday, book lending will be suspended for a system replacement. For returns, please use the return box at the entrance. From Thursday, you can borrow with the new card. The new card can be made free of charge at the second-floor counter starting today, so please come early.',
    },
    [
      _q('Kapan peminjaman buku ditutup?', 'When is book lending suspended?', [
        '月曜日から水曜日まで',
        '木曜日から',
        '今日から',
        '来週いっぱい',
      ]),
      _q('Kenapa peminjaman ditutup?', 'Why is lending suspended?', [
        'システムを入れ替えるから',
        '本を整理するから',
        '休館日だから',
        '工事があるから',
      ]),
      _q(
        'Bagaimana cara mengembalikan buku?',
        'How should books be returned?',
        ['入り口の返却ボックスに入れる', '二階のカウンターに出す', '木曜日まで待つ', '郵便で送る'],
      ),
      _q('Di mana kartu baru dibuat?', 'Where is the new card made?', [
        '二階のカウンター',
        '入り口',
        '一階の受付',
        '三階の事務室',
      ]),
      _q('Berapa biaya kartu baru?', 'How much does the new card cost?', [
        '無料',
        '百円',
        '三百円',
        '五百円',
      ]),
    ],
  ),
];
