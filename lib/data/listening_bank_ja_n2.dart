import '../models/listening.dart';
import 'mcq_bank.dart';

/// Bank bacaan dengar (Choukai) JLPT N2 untuk fitur Latihan Dengar dan
/// mode Ujian. Tipe soal mengikuti pola JLPT: 課題理解 (apa yang harus
/// dilakukan selanjutnya), ポイント理解 (kenapa/kapan), dan 概要理解
/// (inti kuliah, berita, atau pengumuman).
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

final List<ListeningPassage> jaListeningN2 = [
  // 概要理解 — kuliah universitas
  _p(
    'ja_2_1',
    'Kuliah: Penurunan Populasi Jepang',
    'Lecture: Japan\'s Population Decline',
    '今日は日本の人口減少について考えてみましょう。日本の人口は二〇〇八年をピークに減り続けています。その原因としてよく挙げられるのが出生率の低下ですが、実はそれだけではありません。若い人が都市に集まり、地方の町では働く場所が減っていることも大きな要因です。つまり、人口の問題は単に数の問題ではなく、どこに人が住むかという分布の問題でもあるのです。次回は、地方が行っている対策について具体的な例を見ていきます。',
    {
      'id':
          'Hari ini mari kita pikirkan tentang penurunan populasi Jepang. Populasi Jepang terus menurun sejak puncaknya pada tahun 2008. Penyebab yang sering disebut adalah turunnya angka kelahiran, tetapi sebenarnya bukan hanya itu. Anak muda berkumpul di kota, dan di kota-kota daerah lapangan kerja berkurang; ini juga faktor besar. Artinya, masalah populasi bukan sekadar masalah jumlah, tetapi juga masalah distribusi: di mana orang tinggal. Pertemuan berikutnya kita akan melihat contoh konkret langkah-langkah yang dilakukan daerah.',
      'en':
          'Today let\'s think about Japan\'s population decline. Japan\'s population has been falling since it peaked in 2008. The cause most often cited is the falling birth rate, but in fact that is not all. Young people gathering in cities while jobs disappear in regional towns is also a major factor. In other words, the population problem is not merely a question of numbers but also one of distribution: where people live. Next time we will look at concrete examples of measures being taken by regional areas.',
    },
    [
      _q(
        'Apa topik kuliah hari ini?',
        'What is the topic of today\'s lecture?',
        ['日本の人口減少', '日本の経済成長', '都市の交通問題', '大学の入学制度'],
      ),
      _q(
        'Tahun berapa populasi Jepang mencapai puncaknya?',
        'In what year did Japan\'s population peak?',
        ['二〇〇八年', '二〇〇〇年', '二〇一〇年', '一九九八年'],
      ),
      _q(
        'Selain angka kelahiran, faktor besar apa yang disebut?',
        'Besides the birth rate, what other major factor is mentioned?',
        ['若者が都市に集まること', '高齢者が増えること', '外国人が減ること', '物価が上がること'],
      ),
      _q('Apa inti pendapat dosen?', 'What is the lecturer\'s main point?', [
        '人口は分布の問題でもある',
        '人口は数だけの問題だ',
        '出生率は関係ない',
        '地方の対策は失敗した',
      ]),
      _q(
        'Apa yang akan dibahas pada pertemuan berikutnya?',
        'What will be covered next time?',
        ['地方の対策の具体例', '出生率の統計', '都市の人口の歴史', '外国の人口問題'],
      ),
    ],
  ),
  // 課題理解 — rapat perencanaan acara
  _p(
    'ja_2_2',
    'Rapat Persiapan Acara Kantor',
    'Company Event Planning Meeting',
    'では、来月の社内イベントについて確認します。日程は十月十五日の土曜日です。場所は当初ホテルを考えていましたが、予算の関係で市民会館に変更になりました。鈴木さん、参加人数の確認は今週中にお願いします。それから、林さんは会場の下見に行ってもらえますか。駐車場の台数を特に確認してほしいんです。私は司会の原稿を作ります。次の打ち合わせは来週の水曜日の午後にしましょう。',
    {
      'id':
          'Baik, kita konfirmasi acara internal perusahaan bulan depan. Jadwalnya Sabtu, 15 Oktober. Tempatnya awalnya kami pertimbangkan hotel, tetapi karena masalah anggaran diubah ke gedung serbaguna kota. Suzuki-san, tolong konfirmasi jumlah peserta dalam minggu ini. Lalu, Hayashi-san, bisa pergi meninjau lokasi? Saya ingin kamu terutama memeriksa kapasitas parkirnya. Saya akan membuat naskah pembawa acara. Rapat berikutnya kita adakan Rabu siang minggu depan.',
      'en':
          'Now, let\'s confirm next month\'s company event. The date is Saturday, October 15th. We initially considered a hotel for the venue, but due to budget constraints it has been changed to the civic hall. Suzuki, please confirm the number of participants within this week. Also, Hayashi, could you go inspect the venue? I especially want you to check how many parking spaces there are. I will write the MC script. Let\'s hold the next meeting next Wednesday afternoon.',
    },
    [
      _q('Kapan acara akan diadakan?', 'When will the event be held?', [
        '十月十五日',
        '十月五日',
        '十一月十五日',
        '十月二十五日',
      ]),
      _q('Kenapa tempat acara diubah?', 'Why was the venue changed?', [
        '予算の関係で',
        'ホテルが満室で',
        '人数が増えたから',
        '駅から遠いから',
      ]),
      _q('Apa tugas Suzuki?', 'What is Suzuki\'s task?', [
        '参加人数の確認',
        '会場の下見',
        '司会の原稿作り',
        'ホテルの予約',
      ]),
      _q(
        'Apa yang terutama harus Hayashi periksa?',
        'What should Hayashi especially check?',
        ['駐車場の台数', '会場の広さ', '料理の内容', '音響の設備'],
      ),
      _q('Kapan rapat berikutnya?', 'When is the next meeting?', [
        '来週の水曜日',
        '来週の月曜日',
        '今週の金曜日',
        '来月の水曜日',
      ]),
    ],
  ),
  // 課題理解 — keluhan pelanggan via telepon
  _p(
    'ja_2_3',
    'Keluhan Pelanggan ke Pusat Layanan',
    'Customer Complaint to the Service Center',
    'お電話ありがとうございます。カスタマーセンターの高橋です。先週注文した掃除機が昨日届いたんですが、箱を開けたら本体に傷がついていたんです。それは大変申し訳ございません。ご注文番号をお伺いしてもよろしいでしょうか。えー、注文番号は五三二一です。確認いたしました。新しい商品を明後日までにお送りしますので、傷のある商品は届いた箱に入れて、配達員にお渡しください。返送料は当社が負担いたします。分かりました。よろしくお願いします。',
    {
      'id':
          'Terima kasih telah menghubungi kami. Saya Takahashi dari pusat layanan pelanggan. Penyedot debu yang saya pesan minggu lalu tiba kemarin, tapi saat kotaknya dibuka, ada goresan di badan unitnya. Kami mohon maaf sebesar-besarnya. Boleh saya tahu nomor pesanannya? Eh, nomor pesanannya 5321. Sudah kami konfirmasi. Barang baru akan kami kirim paling lambat lusa, jadi barang yang tergores tolong masukkan ke kotak yang datang dan serahkan ke petugas pengantar. Ongkos pengembalian ditanggung perusahaan kami. Baik, terima kasih.',
      'en':
          'Thank you for calling. This is Takahashi from the customer center. The vacuum cleaner I ordered last week arrived yesterday, but when I opened the box, the body was scratched. We are very sorry about that. May I ask for your order number? Uh, the order number is 5321. I have confirmed it. We will send a new product by the day after tomorrow, so please put the scratched item in the box it came in and hand it to the delivery person. Our company will cover the return shipping. Understood. Thank you.',
    },
    [
      _q(
        'Produk apa yang dikeluhkan?',
        'What product is the complaint about?',
        ['掃除機', '洗濯機', '冷蔵庫', '電子レンジ'],
      ),
      _q(
        'Apa masalah pada produk tersebut?',
        'What is wrong with the product?',
        ['本体に傷がついていた', '電源が入らなかった', '部品が足りなかった', '色が違っていた'],
      ),
      _q('Berapa nomor pesanannya?', 'What is the order number?', [
        '五三二一',
        '五二三一',
        '三五二一',
        '五三一二',
      ]),
      _q(
        'Kapan barang pengganti akan dikirim?',
        'By when will the replacement be sent?',
        ['明後日まで', '明日まで', '来週まで', '今日中'],
      ),
      _q(
        'Bagaimana cara mengembalikan barang yang rusak?',
        'How should the damaged item be returned?',
        ['配達員に渡す', '店に持って行く', '郵便局から送る', '捨ててもいい'],
      ),
    ],
  ),
  // 概要理解 — segmen radio
  _p(
    'ja_2_4',
    'Radio Pagi: Tren Asakatsu',
    'Morning Radio: The Asakatsu Trend',
    'おはようございます。今朝の話題は、最近人気が高まっている朝活です。朝活とは、出勤前の時間を使って勉強や運動をすることです。ある調査によると、二十代から三十代の会社員の約四割が朝活をしていると答えました。人気の理由は、夜より集中できることと、仕事の後は疲れて続かないことだそうです。ただ、専門家は睡眠時間を削ってまで行うのは逆効果だと注意しています。番組では皆さんの朝活体験を募集しています。',
    {
      'id':
          'Selamat pagi. Topik pagi ini adalah asakatsu yang belakangan makin populer. Asakatsu adalah memanfaatkan waktu sebelum berangkat kerja untuk belajar atau berolahraga. Menurut sebuah survei, sekitar empat puluh persen pekerja kantoran usia dua puluhan hingga tiga puluhan menjawab bahwa mereka melakukan asakatsu. Alasan populernya adalah lebih bisa berkonsentrasi dibanding malam, dan setelah kerja terlalu lelah sehingga tidak bertahan lama. Namun, para ahli memperingatkan bahwa melakukannya sampai mengurangi waktu tidur justru kontraproduktif. Program ini menerima kiriman pengalaman asakatsu dari Anda semua.',
      'en':
          'Good morning. This morning\'s topic is asakatsu, which has been growing in popularity recently. Asakatsu means using the time before work to study or exercise. According to one survey, about forty percent of office workers in their twenties and thirties said they do asakatsu. The reasons for its popularity are that people can concentrate better than at night, and that after work they are too tired to keep it up. However, experts warn that doing it at the expense of sleep is counterproductive. Our program is collecting your asakatsu experiences.',
    },
    [
      _q(
        'Apa topik segmen radio pagi ini?',
        'What is the topic of this morning\'s segment?',
        ['朝活', '夜の勉強法', '通勤の混雑', '睡眠の質'],
      ),
      _q('Apa arti asakatsu?', 'What does asakatsu mean?', [
        '出勤前に勉強や運動をすること',
        '朝早く出勤すること',
        '朝ごはんを作ること',
        '朝に会議をすること',
      ]),
      _q(
        'Berapa persen pekerja muda yang melakukan asakatsu?',
        'What percentage of young office workers do asakatsu?',
        ['約四割', '約二割', '約六割', '約八割'],
      ),
      _q(
        'Salah satu alasan asakatsu populer adalah?',
        'What is one reason asakatsu is popular?',
        ['夜より集中できる', '会社が勧めている', '友達が増える', 'お金がかからない'],
      ),
      _q('Apa peringatan dari para ahli?', 'What do experts warn about?', [
        '睡眠時間を削らないこと',
        '運動をしすぎないこと',
        '朝ごはんを抜かないこと',
        '一人でやらないこと',
      ]),
    ],
  ),
  // 課題理解 — kantor, perjalanan dinas
  _p(
    'ja_2_5',
    'Perubahan Jadwal Perjalanan Dinas',
    'Business Trip Schedule Change',
    '小林さん、ちょっといいですか。来週の出張の件なんですが、大阪の取引先との打ち合わせが火曜日から木曜日に変わりました。だから、新幹線とホテルの予約を変更してください。それと、先方に見せる見積書はまだ部長の確認が終わっていないので、確認が終わったら私に知らせてください。私が最終チェックをします。出張の申請書は日程が確定してからでいいので、予約の変更を最優先でお願いします。',
    {
      'id':
          'Kobayashi-san, ada waktu sebentar? Soal perjalanan dinas minggu depan, pertemuan dengan mitra bisnis di Osaka berubah dari Selasa ke Kamis. Jadi, tolong ubah pemesanan shinkansen dan hotelnya. Selain itu, surat penawaran harga yang akan ditunjukkan ke pihak mereka belum selesai dicek kepala bagian, jadi kalau pengecekannya sudah selesai, beri tahu saya. Saya yang akan melakukan pengecekan akhir. Formulir pengajuan perjalanan dinas boleh setelah jadwal pasti, jadi prioritaskan perubahan pemesanan dulu.',
      'en':
          'Kobayashi, do you have a moment? About next week\'s business trip, the meeting with the client in Osaka has changed from Tuesday to Thursday. So please change the shinkansen and hotel reservations. Also, the department manager hasn\'t finished reviewing the quotation we\'re showing them, so let me know once his review is done. I\'ll do the final check. The trip application form can wait until the schedule is fixed, so please make changing the reservations your top priority.',
    },
    [
      _q(
        'Hari apa pertemuan dengan mitra bisnis yang baru?',
        'What is the new day of the client meeting?',
        ['木曜日', '火曜日', '水曜日', '金曜日'],
      ),
      _q(
        'Apa yang harus Kobayashi prioritaskan?',
        'What should Kobayashi prioritize?',
        ['予約の変更', '申請書の提出', '見積書の作成', '部長への報告'],
      ),
      _q(
        'Siapa yang melakukan pengecekan akhir surat penawaran?',
        'Who does the final check of the quotation?',
        ['話している人', '小林さん', '部長', '大阪の取引先'],
      ),
      _q(
        'Kapan formulir perjalanan dinas boleh diajukan?',
        'When can the trip application be submitted?',
        ['日程が確定してから', '今日中に', '予約を変更する前に', '出張が終わってから'],
      ),
      _q(
        'Apa yang belum selesai terkait surat penawaran?',
        'What is not yet finished regarding the quotation?',
        ['部長の確認', '印刷', '翻訳', '取引先への送付'],
      ),
    ],
  ),
  // 概要理解 — pengumuman gangguan kereta
  _p(
    'ja_2_6',
    'Pengumuman Gangguan Jalur Chuo',
    'Chuo Line Service Disruption',
    'お客様にご案内いたします。現在、中央線は人身事故の影響で、上下線ともに運転を見合わせております。運転再開は午後三時ごろの見込みです。お急ぎのお客様は、地下鉄東西線または総武線をご利用ください。なお、振替輸送を実施しておりますので、定期券やきっぷをお持ちの方は、そのまま他社線をご利用いただけます。詳しくは駅係員にお尋ねください。ご迷惑をおかけしまして、大変申し訳ございません。',
    {
      'id':
          'Pemberitahuan kepada para penumpang. Saat ini, jalur Chuo menghentikan operasi di kedua arah akibat kecelakaan yang melibatkan orang. Operasi diperkirakan dilanjutkan sekitar jam tiga sore. Penumpang yang terburu-buru, silakan gunakan kereta bawah tanah jalur Tozai atau jalur Sobu. Selain itu, kami menyediakan layanan transportasi pengganti, sehingga pemegang tiket langganan atau tiket biasa dapat langsung menggunakan jalur perusahaan lain. Untuk detail, silakan tanya petugas stasiun. Mohon maaf sebesar-besarnya atas ketidaknyamanannya.',
      'en':
          'Attention passengers. The Chuo Line is currently suspended in both directions due to an accident involving a person. Service is expected to resume around three p.m. Passengers in a hurry, please use the Tozai subway line or the Sobu Line. Alternative transport arrangements are in effect, so those holding commuter passes or tickets may use other companies\' lines as they are. For details, please ask station staff. We sincerely apologize for the inconvenience.',
    },
    [
      _q('Jalur mana yang berhenti beroperasi?', 'Which line is suspended?', [
        '中央線',
        '東西線',
        '総武線',
        '山手線',
      ]),
      _q('Apa penyebab gangguan?', 'What caused the disruption?', [
        '人身事故',
        '強風',
        '大雨',
        '車両の故障',
      ]),
      _q(
        'Kapan operasi diperkirakan dilanjutkan?',
        'When is service expected to resume?',
        ['午後三時ごろ', '午後一時ごろ', '午後五時ごろ', '明日の朝'],
      ),
      _q(
        'Jalur apa yang disarankan bagi yang terburu-buru?',
        'Which line is suggested for those in a hurry?',
        ['地下鉄東西線', '山手線', '京浜東北線', 'バス'],
      ),
      _q(
        'Apa yang bisa dilakukan pemegang tiket langganan?',
        'What can commuter pass holders do?',
        ['そのまま他社線に乗れる', '新しいきっぷを買う', '払い戻しを受ける', '駅で待つしかない'],
      ),
    ],
  ),
  // 課題理解 — hasil pemeriksaan di rumah sakit
  _p(
    'ja_2_7',
    'Penjelasan Hasil Pemeriksaan',
    'Explaining Test Results',
    '山本さん、検査の結果ですが、特に大きな問題はありませんでした。ただ、血圧が少し高めなので、塩分を控えるようにしてください。それから、薬を二週間分出しますので、毎朝食後に一錠飲んでください。眠くなることがありますから、飲んだ後の運転は避けてください。二週間後にもう一度来ていただいて、血圧を測ります。予約は一階の受付でお願いします。何か気になることがあれば、いつでも電話してください。',
    {
      'id':
          'Yamamoto-san, mengenai hasil pemeriksaan, tidak ada masalah besar. Hanya saja, tekanan darah Anda sedikit tinggi, jadi tolong kurangi asupan garam. Lalu, saya beri obat untuk dua minggu, minum satu tablet setiap pagi setelah makan. Obat ini bisa membuat mengantuk, jadi hindari mengemudi setelah minum obat. Dua minggu lagi tolong datang sekali lagi, kita ukur tekanan darahnya. Untuk janji temu silakan ke resepsionis lantai satu. Kalau ada yang mengkhawatirkan, telepon kapan saja.',
      'en':
          'Mr. Yamamoto, regarding your test results, there were no major problems. However, your blood pressure is a little high, so please cut down on salt. Also, I\'ll prescribe two weeks of medicine; take one tablet every morning after breakfast. It may make you sleepy, so avoid driving after taking it. Please come back in two weeks and we\'ll measure your blood pressure again. Please make the appointment at the first-floor reception. If anything concerns you, call us anytime.',
    },
    [
      _q(
        'Bagaimana hasil pemeriksaan Yamamoto?',
        'What were Yamamoto\'s test results?',
        ['大きな問題はなかった', '重い病気が見つかった', '入院が必要だ', '手術が必要だ'],
      ),
      _q('Apa yang sedikit tinggi?', 'What is slightly high?', [
        '血圧',
        '体温',
        '血糖値',
        '体重',
      ]),
      _q('Kapan obat harus diminum?', 'When should the medicine be taken?', [
        '毎朝食後',
        '毎晩寝る前',
        '毎食後',
        '朝と夜',
      ]),
      _q(
        'Apa yang harus dihindari setelah minum obat?',
        'What should be avoided after taking the medicine?',
        ['運転', '運動', '食事', '入浴'],
      ),
      _q(
        'Kapan Yamamoto harus datang lagi?',
        'When should Yamamoto come back?',
        ['二週間後', '一週間後', '一か月後', '三日後'],
      ),
    ],
  ),
  // 概要理解 — berita
  _p(
    'ja_2_8',
    'Berita: Supermarket Hapus Kantong Plastik',
    'News: Supermarket Ends Plastic Bags',
    '次のニュースです。大手スーパーのマルヤは、来年四月から全国の店舗でレジ袋の提供を完全に取りやめると発表しました。現在は一枚五円で販売していますが、ごみを減らすため、今後は販売もしないということです。買い物袋を忘れた客には、紙袋を無料で貸し出し、次回の来店時に返してもらう仕組みを導入する予定です。同社によると、レジ袋の販売をやめることで、年間約三百トンのプラスチックを削減できる見込みです。',
    {
      'id':
          'Berita berikutnya. Supermarket besar Maruya mengumumkan akan sepenuhnya menghentikan penyediaan kantong plastik kasir di seluruh gerainya secara nasional mulai April tahun depan. Saat ini kantong dijual lima yen per lembar, tetapi untuk mengurangi sampah, ke depannya tidak akan dijual lagi. Bagi pelanggan yang lupa membawa tas belanja, akan diperkenalkan sistem peminjaman kantong kertas gratis yang dikembalikan saat kunjungan berikutnya. Menurut perusahaan tersebut, dengan berhenti menjual kantong plastik, diperkirakan dapat mengurangi sekitar tiga ratus ton plastik per tahun.',
      'en':
          'Next news. Major supermarket chain Maruya announced that from April next year it will completely stop providing plastic checkout bags at all its stores nationwide. Bags are currently sold for five yen each, but to reduce waste they will no longer be sold at all. For customers who forget their shopping bags, the company plans to introduce a system of lending paper bags free of charge, to be returned on the next visit. According to the company, ending plastic bag sales is expected to cut about three hundred tons of plastic per year.',
    },
    [
      _q(
        'Perusahaan apa yang membuat pengumuman ini?',
        'Which company made the announcement?',
        ['マルヤ', 'マルイ', 'マルエツ', 'マルタ'],
      ),
      _q(
        'Mulai kapan kantong plastik tidak disediakan lagi?',
        'From when will plastic bags no longer be provided?',
        ['来年四月', '来年一月', '今年四月', '来月'],
      ),
      _q(
        'Berapa harga kantong plastik saat ini?',
        'How much do plastic bags currently cost?',
        ['一枚五円', '一枚三円', '一枚十円', '無料'],
      ),
      _q(
        'Apa yang disediakan bagi pelanggan yang lupa membawa tas?',
        'What is offered to customers who forget their bags?',
        ['紙袋を無料で貸す', 'レジ袋を売る', '布の袋を売る', '何も渡さない'],
      ),
      _q(
        'Berapa plastik yang diperkirakan bisa dikurangi per tahun?',
        'How much plastic is expected to be cut per year?',
        ['約三百トン', '約三十トン', '約三千トン', '約百トン'],
      ),
    ],
  ),
];
