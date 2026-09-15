/// Bank bacaan 読解 (dokkai) JLPT per level untuk bagian Reading pada mode
/// Ujian. Setiap [ReadingPassage] berisi satu teks bahasa Jepang dengan
/// beberapa soal pilihan ganda bilingual (id/en).
///
/// Konvensi: pilihan PERTAMA pada setiap soal adalah jawaban benar
/// (`answer: 0`); layar ujian yang bertugas mengacak urutan pilihan.
///
/// Gaya per level meniru soal aslinya:
/// - N5: hiragana berspasi, kanji N5 saja, topik harian (catatan, jadwal,
///   papan toko, email singkat).
/// - N4: kanji N4, surat/pengumuman/buku harian/penjelasan kebiasaan.
/// - N3: tulisan alami tanpa spasi; esai pendek, pengumuman kantor, ulasan.
/// - N2: esai masyarakat/kerja/sains/budaya, ada soal 筆者の考え.
/// - N1: esai abstrak/editorial; soal 筆者の主張, rujukan 「それ」, makna frasa.
library;

import '../models/exam.dart';
import 'mcq_bank.dart';

McqQuestion _q(String id, String en, List<String> options) =>
    McqQuestion(question: {'id': id, 'en': en}, options: options, answer: 0);

ReadingPassage _p(
  String id,
  String titleId,
  String titleEn,
  String text,
  List<McqQuestion> questions,
) => ReadingPassage(
  id: id,
  title: {'id': titleId, 'en': titleEn},
  text: text,
  questions: questions,
);

// ---------------------------------------------------------------------------
// N5 — 3 bacaan × 4 soal
// ---------------------------------------------------------------------------

final List<ReadingPassage> readingJaN5 = [
  _p(
    'ja_r5_1',
    'Catatan untuk teman',
    'A note to a friend',
    'たなかさん、こんにちは。あした、学校 の あとで、いっしょに としょかん へ 行きませんか。'
        'わたし は 三時 に 学校 の 前 で まちます。'
        'としょかん の あとで、えき の ちかく の みせ で ケーキ を 食べましょう。'
        'やまだ',
    [
      _q('Jam berapa mereka akan bertemu?', 'What time will they meet?', [
        '三時',
        '二時',
        '四時',
        '五時',
      ]),
      _q('Di mana Yamada akan menunggu?', 'Where will Yamada wait?', [
        '学校の前',
        'としょかんの前',
        'えきの前',
        'みせの前',
      ]),
      _q(
        'Setelah ke perpustakaan, apa yang akan mereka lakukan?',
        'What will they do after the library?',
        ['ケーキを食べる', '本を買う', '学校へ行く', 'うちへ帰る'],
      ),
      _q('Siapa yang menulis catatan ini?', 'Who wrote this note?', [
        'やまださん',
        'たなかさん',
        '先生',
        'みせの人',
      ]),
    ],
  ),
  _p(
    'ja_r5_2',
    'Papan pengumuman toko',
    'A shop notice',
    'みせ の おしらせ。'
        'この みせ は 月曜日 から 金曜日 まで、あさ 九時 から よる 八時 まで です。'
        '土曜日 は 十時 から 六時 まで です。日曜日 は 休み です。'
        'あたらしい パン は まいにち あさ 八時 に できます。',
    [
      _q('Hari apa toko ini tutup?', 'On which day is the shop closed?', [
        '日曜日',
        '土曜日',
        '月曜日',
        '金曜日',
      ]),
      _q(
        'Hari Sabtu toko buka sampai jam berapa?',
        'Until what time is the shop open on Saturday?',
        ['六時', '八時', '十時', '九時'],
      ),
      _q(
        'Jam berapa roti baru siap setiap hari?',
        'What time is fresh bread ready every day?',
        ['あさ八時', 'あさ九時', 'あさ十時', 'よる八時'],
      ),
      _q(
        'Hari Rabu toko buka dari jam berapa?',
        'From what time is the shop open on Wednesday?',
        ['あさ九時', 'あさ十時', 'あさ八時', '六時'],
      ),
    ],
  ),
  _p(
    'ja_r5_3',
    'Hari-hari saya',
    'My daily routine',
    'わたし は まいあさ 六時 に おきます。'
        '七時 に ごはん を 食べて、八時 に 学校 へ 行きます。'
        '学校 は 九時 から 三時 まで です。'
        '水曜日 と 金曜日 に 日本語 を べんきょうします。'
        '日本語 の 先生 は やさしい 人 です。',
    [
      _q('Jam berapa penulis bangun?', 'What time does the writer get up?', [
        '六時',
        '七時',
        '八時',
        '九時',
      ]),
      _q(
        'Hari apa penulis belajar bahasa Jepang?',
        'On which days does the writer study Japanese?',
        ['水曜日と金曜日', '月曜日と水曜日', '火曜日と金曜日', '土曜日と日曜日'],
      ),
      _q('Sekolah selesai jam berapa?', 'What time does school end?', [
        '三時',
        '九時',
        '八時',
        '六時',
      ]),
      _q(
        'Guru bahasa Jepangnya orang yang bagaimana?',
        'What kind of person is the Japanese teacher?',
        ['やさしい人', 'こわい人', 'わかい人', 'せが高い人'],
      ),
    ],
  ),
];

// ---------------------------------------------------------------------------
// N4 — 3 bacaan × 5 soal
// ---------------------------------------------------------------------------

final List<ReadingPassage> readingJaN4 = [
  _p(
    'ja_r4_1',
    'Surat dari Yamamoto',
    'A letter from Yamamoto',
    '田中さん、お元気ですか。私は先月から東京の会社で働いています。'
        '仕事は少し大変ですが、会社の人はみんな親切なので、毎日楽しいです。'
        '休みの日には、近くの公園を散歩したり、友達と映画を見たりしています。'
        '来月、田中さんの町へ行く用事があります。'
        'もし時間があったら、いっしょに晩ご飯を食べませんか。'
        '都合のいい日を教えてください。お返事を待っています。山本',
    [
      _q(
        'Sejak kapan Yamamoto bekerja di Tokyo?',
        'Since when has Yamamoto worked in Tokyo?',
        ['先月から', '先週から', '来月から', '去年から'],
      ),
      _q(
        'Mengapa setiap hari terasa menyenangkan?',
        'Why is every day enjoyable?',
        ['会社の人が親切だから', '仕事が簡単だから', '給料が高いから', '東京が好きだから'],
      ),
      _q(
        'Apa yang dilakukan Yamamoto pada hari libur?',
        'What does Yamamoto do on days off?',
        ['散歩や映画', '仕事', '日本語の勉強', '買い物と料理'],
      ),
      _q(
        'Mengapa Yamamoto pergi ke kota Tanaka bulan depan?',
        'Why will Yamamoto go to Tanaka’s town next month?',
        ['用事があるから', '旅行のため', '引っ越すから', '会社を休むから'],
      ),
      _q(
        'Apa yang diminta Yamamoto dari Tanaka?',
        'What does Yamamoto ask Tanaka to do?',
        ['都合のいい日を教える', '映画を見る', '会社に来る', '公園を散歩する'],
      ),
    ],
  ),
  _p(
    'ja_r4_2',
    'Pengumuman lomba pidato',
    'Speech contest notice',
    '学生のみなさんへ。来週の金曜日、日本語のスピーチ大会があります。'
        '場所は三階の大教室で、時間は午後一時から三時までです。'
        'スピーチをしたい人は、水曜日までに事務室で申し込んでください。'
        'テーマは自由ですが、時間は一人五分以内です。'
        '聞くだけの人は申し込みはいりません。'
        '大会のあと、スピーチをした人には小さなプレゼントがあります。'
        '質問がある人は、山田先生に聞いてください。',
    [
      _q('Kapan lomba pidato diadakan?', 'When is the speech contest?', [
        '来週の金曜日',
        '来週の水曜日',
        '今週の金曜日',
        '来月の金曜日',
      ]),
      _q('Di mana lomba diadakan?', 'Where is the contest held?', [
        '三階の大教室',
        '一階の事務室',
        '二階の教室',
        '図書館',
      ]),
      _q(
        'Orang yang ingin berpidato harus melakukan apa?',
        'What must people who want to give a speech do?',
        ['水曜日までに事務室で申し込む', '金曜日に先生に言う', '五分でスピーチを書く', 'プレゼントを持ってくる'],
      ),
      _q('Berapa lama waktu satu pidato?', 'How long may one speech last?', [
        '五分以内',
        '十分以内',
        '三分以内',
        '一時間以内',
      ]),
      _q('Siapa yang tidak perlu mendaftar?', 'Who does not need to sign up?', [
        '聞くだけの人',
        'スピーチをする人',
        '山田先生',
        '質問がある人',
      ]),
    ],
  ),
  _p(
    'ja_r4_3',
    'Melepas sepatu di genkan',
    'Taking off shoes at the entrance',
    '日本では、家に入るとき、玄関でくつをぬぐ習慣があります。'
        '玄関は家の外と中を分ける場所で、ここでくつをぬいで、スリッパにはきかえます。'
        'これは、家の中をきれいにするためだと言われています。'
        '日本の家では、たたみの部屋で床にすわったり、ふとんをしいて寝たりするので、'
        '床が汚れると困るのです。'
        'また、レストランや旅館でも、くつをぬぐところがあります。'
        '入り口にくつ箱があったら、そこでくつをぬいでください。',
    [
      _q(
        'Di mana orang Jepang melepas sepatu?',
        'Where do people in Japan take off their shoes?',
        ['玄関', '部屋の中', '家の外', '台所'],
      ),
      _q('Mengapa sepatu dilepas?', 'Why are shoes taken off?', [
        '家の中をきれいにするため',
        '足を休めるため',
        'くつが高いから',
        'スリッパが好きだから',
      ]),
      _q('「これ」 menunjuk pada apa?', 'What does 「これ」 refer to?', [
        '玄関でくつをぬぐこと',
        'スリッパを買うこと',
        'たたみの部屋',
        '床にすわること',
      ]),
      _q(
        'Mengapa lantai yang kotor menjadi masalah?',
        'Why is a dirty floor a problem?',
        ['床にすわったり寝たりするから', '床が木でできているから', 'そうじが大変だから', 'お客さんが来るから'],
      ),
      _q(
        'Jika ada rak sepatu di pintu masuk restoran, apa yang harus dilakukan?',
        'If there is a shoe box at a restaurant entrance, what should you do?',
        ['そこでくつをぬぐ', 'くつをはいたまま入る', '店の人を呼ぶ', 'スリッパを買う'],
      ),
    ],
  ),
];

// ---------------------------------------------------------------------------
// N3 — 4 bacaan × 4 soal
// ---------------------------------------------------------------------------

final List<ReadingPassage> readingJaN3 = [
  _p(
    'ja_r3_1',
    'Ponsel dan membaca buku',
    'Smartphones and reading',
    '最近、電車の中で本を読んでいる人をあまり見なくなった。'
        'ほとんどの人がスマートフォンの画面を見ている。'
        '私も以前は毎日のように本を読んでいたが、'
        '今はニュースや動画をスマートフォンで見ることが多くなった。'
        '便利になったのは確かだが、一冊の本をじっくり読む時間が減ったことは、少し残念に思う。'
        '本を読むと、自分とは違う人の考えにゆっくり触れることができる。'
        '短い情報を次から次へと見るだけでは、深く考える力が育たないのではないだろうか。'
        'そこで私は、寝る前の三十分だけはスマートフォンを置いて、本を開くことにした。'
        '小さな習慣だが、続けていきたいと思っている。',
    [
      _q(
        'Perubahan apa yang dirasakan penulis pada dirinya?',
        'What change does the writer notice in himself?',
        ['本を読む時間が減った', '電車に乗る回数が減った', '動画を見なくなった', 'ニュースを読まなくなった'],
      ),
      _q(
        'Menurut penulis, apa kebaikan membaca buku?',
        'According to the writer, what is good about reading books?',
        ['違う人の考えにゆっくり触れられる', '短い情報を早く得られる', '目が疲れない', '電車の中で眠くならない'],
      ),
      _q(
        'Apa yang dikhawatirkan penulis?',
        'What is the writer worried about?',
        ['深く考える力が育たないこと', '本が売れなくなること', '電車が混むこと', 'スマートフォンが高いこと'],
      ),
      _q('Apa yang diputuskan penulis?', 'What did the writer decide to do?', [
        '寝る前三十分は本を読む',
        'スマートフォンを捨てる',
        '電車で本を読む',
        '毎日一冊本を買う',
      ]),
    ],
  ),
  _p(
    'ja_r3_2',
    'Pemberitahuan sistem pintu kantor',
    'Office door system notice',
    '社員の皆様へ。来月一日から、オフィスの入り口のドアが新しいシステムに変わります。'
        'これまでは鍵を使っていましたが、'
        '今後は社員証をカードリーダーにかざして開けることになります。'
        '社員証をまだ受け取っていない方は、今月二十五日までに総務部で受け取ってください。'
        '写真の撮影が必要なため、受け取りには十分ほどかかります。'
        '社員証を忘れた場合は、一階の受付で一日だけ使える仮のカードを借りることができますが、'
        '月に三回までとします。'
        'なお、今使っている鍵は、来月十日までに総務部へ返してください。'
        'ご不明な点は総務部の佐藤までお問い合わせください。',
    [
      _q(
        'Apa yang berubah mulai bulan depan?',
        'What changes from next month?',
        ['ドアを社員証で開けるようになる', '会社の場所が変わる', '総務部がなくなる', '受付が二階になる'],
      ),
      _q(
        'Sampai kapan kartu pegawai harus diambil?',
        'By when must the employee card be picked up?',
        ['今月二十五日まで', '来月一日まで', '来月十日まで', '今月十日まで'],
      ),
      _q(
        'Apa yang dilakukan jika lupa membawa kartu pegawai?',
        'What should you do if you forget your employee card?',
        ['受付で仮のカードを借りる', '総務部で新しい社員証を作る', '鍵でドアを開ける', '家に取りに帰る'],
      ),
      _q(
        'Apa yang harus dilakukan dengan kunci lama?',
        'What should be done with the old key?',
        ['来月十日までに総務部へ返す', '捨てる', '受付に預ける', 'そのまま持っておく'],
      ),
    ],
  ),
  _p(
    'ja_r3_3',
    'Ulasan ketel listrik',
    'Electric kettle review',
    '先週、このケトルを買いました。'
        '以前使っていたものは水が沸くまで五分近くかかっていましたが、'
        'これは一分半ほどで沸くので、朝の忙しい時間にとても助かっています。'
        'デザインもシンプルで、台所に置いても目立ちすぎません。'
        'ただ、一つ気になる点は、注ぎ口が少し大きいことです。'
        'コーヒーをゆっくり注ぎたいときに、お湯が勢いよく出てしまい、うまくいきません。'
        'また、持ち手が熱くなりやすいので、小さな子どもがいる家では注意が必要だと思います。'
        'それでも、値段を考えれば十分満足しています。'
        '速さを重視する人にはおすすめできますが、'
        'コーヒーをていねいに入れたい人は、別の商品を選んだほうがいいかもしれません。',
    [
      _q(
        'Apa yang paling membantu penulis?',
        'What helps the writer the most?',
        ['お湯が早く沸くこと', 'デザインがきれいなこと', '値段が安いこと', '注ぎ口が大きいこと'],
      ),
      _q(
        'Apa yang dikhawatirkan tentang gagangnya?',
        'What is the concern about the handle?',
        ['熱くなりやすい', '短すぎる', '取れやすい', '色が悪い'],
      ),
      _q(
        'Siapa yang disarankan memilih produk lain?',
        'Who is advised to choose a different product?',
        ['コーヒーをていねいに入れたい人', '速さを重視する人', '子どもがいる人', '台所が狭い人'],
      ),
      _q(
        'Bagaimana penilaian keseluruhan penulis?',
        'What is the writer’s overall evaluation?',
        ['値段を考えれば満足している', '全く満足していない', '返品したいと思っている', '前のケトルのほうがよかった'],
      ),
    ],
  ),
  _p(
    'ja_r3_4',
    'Musim hujan di Jepang',
    'The rainy season in Japan',
    '日本には、六月から七月にかけて「梅雨」と呼ばれる雨の多い季節がある。'
        'この時期は毎日のように雨が降り、湿度も高くなるため、'
        '洗濯物が乾きにくく、食べ物も傷みやすい。'
        'そのため、多くの家庭では除湿機を使ったり、部屋の中に洗濯物を干す工夫をしたりしている。'
        '一方で、梅雨は農業にとっては大切な季節でもある。'
        'この時期の雨が、米を育てるための水を十分に用意してくれるからだ。'
        'また、梅雨の代表的な花であるあじさいは、雨にぬれることでいっそう美しく見えると言われ、'
        'この季節を楽しみにしている人も少なくない。'
        '梅雨は不便な季節だと思われがちだが、見方を変えれば、'
        '日本の自然や暮らしを支える大切な時期なのである。',
    [
      _q('Mengapa cucian sulit kering?', 'Why does laundry dry slowly?', [
        '湿度が高いから',
        '気温が低いから',
        '風が強いから',
        '日が短いから',
      ]),
      _q(
        '「この時期の雨」 penting untuk apa?',
        'What is the rain of this season important for?',
        ['米を育てること', '洗濯物を干すこと', '花を売ること', '旅行をすること'],
      ),
      _q(
        'Mengapa ada orang yang menantikan bunga ajisai?',
        'Why do some people look forward to hydrangeas?',
        ['雨にぬれると美しく見えるから', '値段が安いから', '食べられるから', '六月しか咲かないから'],
      ),
      _q(
        'Apa pendapat penulis tentang musim hujan?',
        'What is the writer’s view of the rainy season?',
        ['不便だが暮らしを支える大切な時期だ', '全く不便ではない', 'なくなったほうがいい', '農業には関係がない'],
      ),
    ],
  ),
];

// ---------------------------------------------------------------------------
// N2 — 4 bacaan × 5 soal
// ---------------------------------------------------------------------------

final List<ReadingPassage> readingJaN2 = [
  _p(
    'ja_r2_1',
    'Telework dan cara bekerja',
    'Telework and ways of working',
    '新型の感染症をきっかけに、多くの企業でテレワークが導入された。'
        '通勤時間がなくなり、家族と過ごす時間が増えたと喜ぶ声は多い。'
        '一方で、仕事と私生活の境目があいまいになり、'
        'かえって労働時間が長くなったという調査結果もある。'
        '上司の目が届かない分、成果で評価されるようになったことを歓迎する人もいれば、'
        '雑談から生まれる小さな発見や、困ったときに気軽に相談できる環境が失われたと感じる人もいる。'
        'こうした声を受けて、週の何日かを出社日とする「ハイブリッド型」を選ぶ企業が増えてきた。'
        'しかし、私はこれを単純に折衷案として捉えるべきではないと思う。'
        '重要なのは出社の回数ではなく、何のために顔を合わせるのかを組織として明確にすることだ。'
        '目的のない出社日は、結局のところ以前の習慣に戻るための口実になりかねない。'
        'テレワークをめぐる議論は、働き方そのものを見直す機会として生かすべきである。',
    [
      _q(
        'Manfaat telework apa yang disebutkan dalam bacaan?',
        'Which benefit of telework is mentioned?',
        ['家族と過ごす時間が増えた', '給料が上がった', '労働時間が短くなった', '上司との関係がよくなった'],
      ),
      _q(
        'Menurut sebagian orang, apa yang hilang karena telework?',
        'According to some people, what was lost due to telework?',
        ['気軽に相談できる環境', '成果で評価される仕組み', '通勤の時間', '自分の部屋'],
      ),
      _q('「これ」 menunjuk pada apa?', 'What does 「これ」 refer to?', [
        'ハイブリッド型を選ぶこと',
        'テレワークを廃止すること',
        '労働時間を減らすこと',
        '成果主義を導入すること',
      ]),
      _q(
        'Menurut penulis, apa yang penting?',
        'According to the writer, what is important?',
        ['顔を合わせる目的を明確にすること', '出社の回数を増やすこと', '完全にテレワークにすること', '以前の習慣に戻ること'],
      ),
      _q(
        'Apa yang dikhawatirkan penulis tentang hari masuk kantor tanpa tujuan?',
        'What does the writer fear about purposeless office days?',
        ['以前の習慣に戻る口実になる', '労働時間が減りすぎる', '家族との時間が増えすぎる', '会社の家賃が上がる'],
      ),
    ],
  ),
  _p(
    'ja_r2_2',
    'Tidur dan ingatan',
    'Sleep and memory',
    '睡眠は、単に体を休めるための時間ではない。'
        '近年の研究によると、私たちが日中に経験したことは、眠っている間に脳の中で整理され、'
        '必要な情報が長期的な記憶として定着するという。'
        'つまり、勉強した内容を確実に覚えたいなら、徹夜で机に向かうより、'
        'しっかり眠ったほうが効果的だということになる。'
        'ところが、現代人の睡眠時間は年々短くなる傾向にある。'
        '特に日本は、先進国の中でも平均睡眠時間が最も短い国の一つだと言われている。'
        '「寝る時間を削って努力する」ことが美徳とされてきた文化的背景も、その一因だろう。'
        'しかし、睡眠不足は記憶力だけでなく、判断力や感情の安定にも悪影響を及ぼすことがわかっている。'
        '眠ることは怠けることではない。'
        'むしろ、日中の活動の質を高めるための積極的な行為なのだと、'
        '私たちは認識を改める必要がある。',
    [
      _q(
        'Apa yang terjadi di otak saat tidur?',
        'What happens in the brain during sleep?',
        ['経験が整理され記憶として定着する', '体が大きく成長する', '新しい情報を学び始める', '感情が消えていく'],
      ),
      _q(
        'Menurut bacaan, cara efektif untuk mengingat pelajaran adalah?',
        'According to the passage, what is an effective way to remember what you studied?',
        ['しっかり眠る', '徹夜で勉強する', '朝早く起きる', '音楽を聞きながら勉強する'],
      ),
      _q(
        'Apa salah satu penyebab waktu tidur orang Jepang pendek?',
        'What is one reason Japanese people sleep less?',
        ['寝る時間を削る努力を美徳とする文化', '気候が暑いこと', '通勤時間が短いこと', 'テレビ番組が多いこと'],
      ),
      _q(
        'Selain ingatan, apa dampak kurang tidur?',
        'Besides memory, what does lack of sleep affect?',
        ['判断力や感情の安定', '身長の伸び', '視力', '食欲'],
      ),
      _q('Apa pendapat penulis?', 'What is the writer’s opinion?', [
        '眠ることは活動の質を高める積極的な行為だ',
        '眠ることは怠けることだ',
        '睡眠時間は短くてもよい',
        '徹夜は必要な努力だ',
      ]),
    ],
  ),
  _p(
    'ja_r2_3',
    'Dialek dan generasi berikutnya',
    'Dialects and the next generation',
    'かつて方言は、標準語に比べて「田舎くさい」ものとして、公の場では避けられる傾向にあった。'
        'テレビの普及によって標準語が全国に広がると、'
        '若い世代の中には、自分の地域の方言を話せない人も増えていった。'
        'しかし近年、この流れに変化が見られる。'
        'ドラマや音楽で方言が魅力的に使われたり、'
        '地域の観光資源として方言をポスターや商品名に取り入れたりする動きが広がっているのだ。'
        '方言には、その土地の気候や暮らし、人々の感情の表し方が刻み込まれている。'
        '標準語では言い表せない微妙なニュアンスを持つ言葉も少なくない。'
        '私は、方言を単なる懐かしさの対象として消費するのではなく、'
        '生きた言葉として次の世代に受け渡していくことが重要だと考えている。'
        'そのためには、学校や家庭で方言を話すことを恥ずかしいと思わせない環境を作ることが、'
        '何よりも大切なのではないだろうか。',
    [
      _q(
        'Dulu, dialek diperlakukan bagaimana?',
        'How were dialects treated in the past?',
        ['公の場では避けられていた', '学校で教えられていた', 'テレビでよく使われていた', '観光に使われていた'],
      ),
      _q(
        'Apa yang menyebarkan bahasa standar ke seluruh negeri?',
        'What spread the standard language nationwide?',
        ['テレビの普及', '学校の増加', '人口の減少', '観光客の増加'],
      ),
      _q('「この流れ」 menunjuk pada apa?', 'What does 「この流れ」 refer to?', [
        '方言が避けられ話せない人が増えること',
        '方言が観光に使われること',
        '標準語がなくなること',
        'ドラマが人気になること',
      ]),
      _q(
        'Menurut penulis, apa yang terukir dalam dialek?',
        'According to the writer, what is engraved in dialects?',
        ['土地の気候や暮らし、感情の表し方', '標準語の文法', '外国語の影響', '商品の値段'],
      ),
      _q(
        'Menurut penulis, apa yang paling penting?',
        'According to the writer, what matters most?',
        [
          '方言を恥ずかしいと思わせない環境を作ること',
          '方言を商品名にすること',
          '方言を標準語に変えること',
          '方言を博物館に保存すること',
        ],
      ),
    ],
  ),
  _p(
    'ja_r2_4',
    'Kegagalan dan budaya organisasi',
    'Failure and organizational culture',
    '「失敗から学べ」とよく言われるが、実際に失敗を歓迎する組織は少ない。'
        '多くの職場では、ミスをした人が責任を問われ、'
        '周囲はそれを見て「失敗しないこと」を最優先に行動するようになる。'
        'その結果、新しい挑戦は避けられ、問題が起きても報告が遅れ、'
        '小さな失敗が大きな事故につながることさえある。'
        'ある航空会社では、パイロットや整備士が自分のミスを報告しても処罰されない制度を導入したところ、'
        '報告の件数は増えたが、重大な事故は大幅に減ったという。'
        'ミスの情報が共有されることで、同じ失敗を組織全体で防げるようになったからだ。'
        'ここから学べるのは、失敗そのものよりも、失敗を隠す文化のほうが危険だということである。'
        'もちろん、責任をまったく問わないというわけではない。'
        'しかし、個人を責める前に、なぜその失敗が起きたのかを仕組みの問題として捉える姿勢が、'
        '結果的に組織を強くするのだと私は考える。',
    [
      _q(
        'Apa yang terjadi ketika orang yang salah dimintai tanggung jawab?',
        'What happens when the person who made a mistake is held responsible?',
        ['失敗しないことを最優先に行動する', '積極的に挑戦するようになる', '報告が早くなる', '事故が減る'],
      ),
      _q(
        'Apa hasil sistem di perusahaan penerbangan itu?',
        'What was the result of the airline’s system?',
        ['報告は増えたが重大な事故は減った', '報告も事故も減った', '報告が減り事故が増えた', '何も変わらなかった'],
      ),
      _q(
        'Mengapa kecelakaan serius berkurang?',
        'Why did serious accidents decrease?',
        [
          'ミスの情報が共有され同じ失敗を防げたから',
          'パイロットの数が増えたから',
          '飛行機が新しくなったから',
          '処罰が厳しくなったから',
        ],
      ),
      _q(
        'Menurut penulis, mana yang lebih berbahaya?',
        'According to the writer, which is more dangerous?',
        ['失敗を隠す文化', '失敗そのもの', '新しい挑戦', '報告の多さ'],
      ),
      _q(
        'Sikap apa yang dianjurkan penulis?',
        'What attitude does the writer recommend?',
        ['失敗を仕組みの問題として捉える', '個人を厳しく責める', '責任を一切問わない', '失敗を記録しない'],
      ),
    ],
  ),
];

// ---------------------------------------------------------------------------
// N1 — 4 bacaan × 5 soal
// ---------------------------------------------------------------------------

final List<ReadingPassage> readingJaN1 = [
  _p(
    'ja_r1_1',
    'Kemudahan dan kekayaan hidup',
    'Convenience and richness',
    '私たちは「便利」と「豊か」をしばしば同じ意味で使う。'
        'だが、この二つは本来、別の座標軸に属する概念ではないだろうか。'
        '便利さとは、目的に至るまでの手間や時間を削減することである。'
        '一方、豊かさとは、その過程そのものにどれだけの意味や喜びを見いだせるかにかかわる。'
        'たとえば、料理の手間を省く冷凍食品は間違いなく便利だが、'
        '家族と台所に立ち、失敗しながら一皿を作り上げる時間を、それが代替できるわけではない。'
        '問題は、便利さの追求が際限なく進むとき、'
        '私たちが「省かれた過程」の中にあった価値に気づきにくくなることだ。'
        '手間が消えれば、そこに宿っていた意味もまた静かに消えていく。'
        'それは喪失として認識されないまま進行するがゆえに、いっそう厄介である。'
        'もちろん、私は不便への回帰を説きたいわけではない。'
        'ただ、何を省き、何を残すのかを選ぶ主体は、技術ではなく私たち自身であるべきだと言いたいのである。'
        '便利さが豊かさを自動的にもたらすという幻想から離れ、'
        '時に立ち止まって「この手間は本当に不要か」と問い直すこと。'
        'それこそが、技術に使われるのではなく、技術を使う側に立ち続けるための、'
        'ささやかだが不可欠な態度なのだと思う。',
    [
      _q(
        'Menurut penulis, apa yang dimaksud dengan 「便利さ」?',
        'According to the writer, what is 「便利さ」?',
        ['目的までの手間や時間を削減すること', '過程に喜びを見いだすこと', '家族と時間を過ごすこと', '技術を拒むこと'],
      ),
      _q(
        'Mengapa penulis memberi contoh makanan beku?',
        'Why does the writer give the example of frozen food?',
        [
          '便利さが過程の価値を代替できないことを示すため',
          '冷凍食品の危険性を訴えるため',
          '料理の方法を教えるため',
          '家族の大切さを否定するため',
        ],
      ),
      _q(
        '「それは喪失として認識されないまま進行する」 — 「それ」 menunjuk pada apa?',
        'In 「それは喪失として認識されないまま進行する」, what does 「それ」 refer to?',
        ['手間とともに意味が消えていくこと', '冷凍食品が普及すること', '不便への回帰', '技術の進歩そのもの'],
      ),
      _q('Mengapa hal itu disebut 「いっそう厄介」?', 'Why is it called 「いっそう厄介」?', [
        '喪失として認識されないまま進むから',
        '費用が高くなるから',
        '誰も便利さを望まないから',
        '技術が複雑すぎるから',
      ]),
      _q('Apa klaim utama penulis?', 'What is the writer’s main claim?', [
        '何を省くかを選ぶ主体は私たち自身であるべきだ',
        '不便な生活に戻るべきだ',
        '技術の発展を止めるべきだ',
        '便利さは必ず豊かさをもたらす',
      ]),
    ],
  ),
  _p(
    'ja_r1_2',
    'Jebakan "mudah dipahami"',
    'The trap of easy understanding',
    '近年、あらゆる場面で「わかりやすさ」が求められている。'
        '政治家の演説も、企業の説明も、ニュースの解説も、'
        '短く、明快で、一度聞けば理解できることが良いとされる。'
        '確かに、専門用語を並べて聞き手を置き去りにする語りは、伝える責任を放棄していると言えよう。'
        'しかし、私はこの「わかりやすさ」への過剰な傾倒に、ある種の危うさを感じている。'
        '世界の多くの問題は、そもそも複雑である。'
        '複雑なものを「わかりやすく」語るとは、何かを削ぎ落とすことにほかならない。'
        '削ぎ落とされた部分には、往々にして、判断を左右する重要な留保や例外が含まれている。'
        'それを知らされないまま「わかった」と感じることは、理解ではなく、'
        '「理解したという感覚を与えられている」にすぎない。'
        'さらに厄介なのは、受け手の側が、複雑さに耐えることをやめてしまう点である。'
        '少しでも難解な説明に出会うと「説明が下手だ」と切り捨て、単純な物語を語る者に耳を傾ける。'
        'この態度は、意図的に単純化された言葉で人々を動かそうとする者にとって、格好の土壌となる。'
        '「わかりにくいこと」を直ちに悪とせず、複雑なものにはそれにふさわしい思考の時間をかける。'
        'そうした知的な忍耐こそが、いま私たちに求められているのではないか。',
    [
      _q(
        'Hal apa yang diakui penulis sebagai benar?',
        'What does the writer acknowledge as true?',
        [
          '専門用語を並べる語りは伝える責任を放棄している',
          'わかりやすさは常に正しい',
          '複雑な問題は存在しない',
          '政治家は説明が上手だ',
        ],
      ),
      _q(
        'Menurut penulis, menjelaskan hal kompleks secara 「わかりやすく」 berarti apa?',
        'According to the writer, what does explaining complex things simply amount to?',
        ['何かを削ぎ落とすこと', '全てを伝えること', '例外を増やすこと', '専門用語を使うこと'],
      ),
      _q(
        'Apa arti 「理解したという感覚を与えられている」?',
        'What does 「理解したという感覚を与えられている」 mean?',
        ['実際には理解していないのに理解した気になっている', '完全に理解している', '説明する側だけが理解している', '何も感じていない'],
      ),
      _q('「この態度」 menunjuk pada apa?', 'What does 「この態度」 refer to?', [
        '難解な説明を切り捨て単純な物語を好む態度',
        '専門用語を多く使う態度',
        '複雑さに耐える態度',
        '政治家を批判する態度',
      ]),
      _q('Apa klaim utama penulis?', 'What is the writer’s main claim?', [
        '複雑なものに思考の時間をかける忍耐が必要だ',
        'すべてを短く明快に語るべきだ',
        'わかりにくい説明は悪だ',
        '単純な物語を信じるべきだ',
      ]),
    ],
  ),
  _p(
    'ja_r1_3',
    'Penelitian yang "tidak berguna"',
    'Research that seems useless',
    '「その研究は何の役に立つのか」。'
        '研究者がしばしば投げかけられるこの問いには、一見もっともらしい正当性がある。'
        '限られた税金を投じる以上、成果を説明する責任があるというわけだ。'
        'だが、この問いが暗黙のうちに前提としているのは、'
        '「役に立つ」ことがあらかじめ予測可能だという考えである。'
        '科学史を振り返れば、この前提がいかに脆いものかがわかる。'
        '電磁波の研究は当初、実用とは無縁の純粋な好奇心から始まったが、'
        'それなくして現代の通信技術は存在しなかった。'
        'ある種の細菌の性質を調べていた研究が、数十年後に遺伝子を編集する技術の土台となった例もある。'
        'つまり、「何の役に立つか」が明らかな研究は、'
        'すでに誰かが見いだした地平の内側を耕しているにすぎず、'
        '「地平そのものを押し広げる」のは、往々にして役に立ちそうにない研究なのである。'
        'もちろん、すべての研究に無条件で資源を配分せよと言うつもりはない。'
        '私が問題にしたいのは、短期的な有用性という単一の尺度で研究の価値を測ることが、'
        '長期的には社会の可能性を狭めてしまうという逆説である。'
        '「役に立たない」ものを許容する余白をどれだけ持てるか。'
        'それは、その社会がどれほど未来に対して開かれているかを示す指標なのだと思う。',
    [
      _q(
        'Apa asumsi tersembunyi dalam pertanyaan 「何の役に立つのか」?',
        'What hidden assumption lies in the question 「何の役に立つのか」?',
        [
          '役に立つことが事前に予測できるという考え',
          '研究は税金で行うべきだという考え',
          '研究者は説明が下手だという考え',
          '科学は常に正しいという考え',
        ],
      ),
      _q(
        'Mengapa penulis menyebut penelitian gelombang elektromagnetik?',
        'Why does the writer mention research on electromagnetic waves?',
        [
          '好奇心から始まった研究が後に技術の基礎になった例として',
          '研究が失敗した例として',
          '税金の無駄づかいの例として',
          '通信技術の欠点を示すため',
        ],
      ),
      _q('Apa arti 「地平そのものを押し広げる」?', 'What does 「地平そのものを押し広げる」 mean?', [
        '未知の領域を新たに開くこと',
        '既知の範囲を深く調べること',
        '研究費を増やすこと',
        '農地を広げること',
      ]),
      _q(
        'Paradoks apa yang dimaksud penulis?',
        'What paradox does the writer point out?',
        [
          '短期的な有用性で測ると長期的に可能性が狭まること',
          '役に立つ研究ほど費用が安いこと',
          '好奇心が研究を妨げること',
          '税金が多いほど研究が減ること',
        ],
      ),
      _q('Apa klaim utama penulis?', 'What is the writer’s main claim?', [
        '役に立たないものを許容する余白が社会の開かれ方を示す',
        'すべての研究に無条件で資金を出すべきだ',
        '有用性のない研究はやめるべきだ',
        '研究者は説明責任を持たなくてよい',
      ]),
    ],
  ),
  _p(
    'ja_r1_4',
    'Mendengar dalam dialog',
    'Listening in dialogue',
    '対話において最も難しいのは、話すことではなく聞くことである。'
        '私たちは相手の話を聞いているつもりで、実際にはその言葉を自分の枠組みに当てはめ、'
        '次に何を言い返すかを考えていることが多い。'
        'これは「聞く」というより、「待つ」に近い。'
        '相手が話し終えるのを待ち、自分の番が来るのを待っているのだ。'
        '真に聞くとは、自分の枠組みをいったん脇に置き、'
        '相手の言葉がどのような経験や前提から発せられているのかを、想像力を働かせてたどることである。'
        'それは必然的に、自分の考えが揺さぶられる危険を引き受けることでもある。'
        'だからこそ、私たちは無意識のうちに「聞く」ことを避け、'
        '「待つ」ことで済ませようとするのかもしれない。'
        '近年、意見の異なる人々の間で対話が成立しにくくなっていると言われる。'
        'その原因は、しばしば「相手が話を聞かないからだ」と説明される。'
        'だが、「その説明自体が、すでに聞くことの放棄ではないだろうか」。'
        '相手が聞かないと断じる前に、自分が本当に聞いていたかを問う。'
        'この居心地の悪い自己点検を引き受ける人が一人でも増えることが、'
        '対話の回復への遠回りだが確かな道なのだと、私は考えている。',
    [
      _q(
        'Mengapa penulis menyebut cara mendengar itu sebagai 「待つ」?',
        'Why does the writer call that way of listening 「待つ」?',
        ['自分の番を待ち言い返すことを考えているから', '相手の話が長すぎるから', '沈黙を守っているから', '時間を計っているから'],
      ),
      _q(
        'Menurut penulis, apa itu mendengar yang sejati?',
        'According to the writer, what is true listening?',
        [
          '自分の枠組みを脇に置き相手の前提をたどること',
          '相手の言葉を自分の考えに当てはめること',
          '相手の話を最後まで待つこと',
          '相手の意見に必ず同意すること',
        ],
      ),
      _q(
        '「それは必然的に」 — 「それ」 menunjuk pada apa?',
        'In 「それは必然的に」, what does 「それ」 refer to?',
        ['真に聞くこと', '待つこと', '話すこと', '対話を避けること'],
      ),
      _q('Mengapa 「その説明自体が、すでに聞くことの放棄」?', 'Why is 「その説明自体が、すでに聞くことの放棄」?', [
        '原因を相手だけに求め自分を問わないから',
        '説明が長すぎるから',
        '相手の意見に同意しているから',
        '対話の場が存在しないから',
      ]),
      _q('Apa klaim utama penulis?', 'What is the writer’s main claim?', [
        '自分が聞いていたかを問う人が増えることが対話回復の道だ',
        '相手に話を聞かせるべきだ',
        '対話は不可能なので諦めるべきだ',
        '話す技術を磨くべきだ',
      ]),
    ],
  ),
];
