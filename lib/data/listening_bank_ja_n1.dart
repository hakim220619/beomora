import '../models/listening.dart';
import 'mcq_bank.dart';

/// Bank bacaan dengar Choukai JLPT N1 untuk "Latihan Dengar" dan mode Ujian.
/// Transkrip dibacakan TTS: kuliah + diskusi (統合理解), inti pembicaraan dan
/// sikap pembicara (概要理解), tugas dalam konteks bisnis (課題理解), berita
/// ekonomi, wawancara pakar, seminar akademik, panduan audio museum, dan
/// pengumuman perusahaan bersyarat. Konten disusun sendiri untuk latihan —
/// bukan soal resmi penyelenggara.
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

final List<ListeningPassage> jaListeningN1 = [
  // ── 1. 統合理解: kuliah tentang penurunan penduduk + diskusi dua orang ──
  _p(
    'ja_1_1',
    'Kuliah: Penurunan Penduduk Daerah',
    'Lecture: Regional Population Decline',
    '本日の講演では、地方自治体における人口減少対策について申し上げます。'
        'これまでの施策は移住者の誘致に偏りがちでしたが、肝心なのは、すでに住んでいる方々が離れずに済む環境を整えることではないでしょうか。'
        'とりわけ若年層の雇用の受け皿づくりが急務です。'
        '講演の後、二人が語り合った。'
        '田中さん、講師の方、移住促進には懐疑的でしたね。'
        'ええ。私も、外から人を呼ぶより、まず足元を固めるべきだという意見には頷けました。'
        '私は半々ですね。雇用を増やすといっても、企業が来なければ絵に描いた餅ですから。'
        'なるほど、それも一理ありますね。',
    {
      'id':
          'Dalam kuliah hari ini, saya akan membahas langkah penanganan penurunan penduduk di pemerintah daerah. '
          'Kebijakan selama ini cenderung condong pada menarik pendatang, tetapi yang terpenting bukankah menyiapkan lingkungan agar warga yang sudah tinggal tidak perlu pergi? '
          'Terutama, menciptakan wadah lapangan kerja bagi generasi muda adalah hal yang mendesak. '
          'Setelah kuliah, dua orang berbincang. '
          '"Tanaka-san, pembicaranya skeptis terhadap promosi migrasi, ya." '
          '"Ya. Saya juga bisa mengangguk pada pendapat bahwa daripada memanggil orang dari luar, sebaiknya memperkuat pijakan dulu." '
          '"Saya setengah-setengah. Meski bilang menambah lapangan kerja, kalau perusahaan tidak datang, itu hanya kue di atas kertas." '
          '"Benar juga, itu ada benarnya."',
      'en':
          'In today\'s lecture I will speak about measures against population decline in local governments. '
          'Policies so far have tended to lean toward attracting newcomers, but is the crucial point not to create an environment where those who already live there need not leave? '
          'In particular, building employment opportunities for young people is urgent. '
          'After the lecture, two people talked. '
          '"Tanaka-san, the speaker was skeptical about promoting migration, was he not?" '
          '"Yes. I too could nod at the view that we should shore up our footing first rather than call people in from outside." '
          '"I am half and half. Even if we say we will increase jobs, without companies coming it is just a picture of a rice cake." '
          '"I see, that has a point too."',
    },
    [
      _q(
        'Apa pokok pendapat (主張) pembicara kuliah?',
        'What is the lecturer\'s main point?',
        [
          '既存住民が定住できる環境整備が肝心だ',
          '移住者の誘致を一層強化すべきだ',
          '高齢者向けの施策を最優先すべきだ',
          '企業誘致はもはや不要である',
        ],
      ),
      _q(
        'Bagaimana sikap Tanaka terhadap pendapat pembicara?',
        'What is Tanaka\'s attitude toward the lecturer\'s view?',
        ['講師の意見に概ね賛成している', '講師の意見に強く反対している', '判断を完全に保留している', '移住促進こそ最善だと考えている'],
      ),
      _q(
        'Apa pandangan lawan bicara Tanaka?',
        'What is the view of the person talking with Tanaka?',
        [
          '雇用を増やすには企業の進出が前提だ',
          '移住促進こそ唯一の解決策だ',
          '講師の意見に全面的に賛成だ',
          '人口減少は深刻な問題ではない',
        ],
      ),
      _q(
        'Apa makna 「絵に描いた餅」 dalam percakapan ini?',
        'What does "a picture of a rice cake" mean here?',
        ['実現の見込みがない計画', '費用が非常にかかる計画', 'すでに完成した計画', '誰にでも理解できる計画'],
      ),
      _q(
        'Apa yang disebut pembicara sebagai hal mendesak?',
        'What did the lecturer call urgent?',
        ['若年層の雇用の受け皿づくり', '移住者向け住宅の整備', '観光客の誘致活動', '高齢者施設の増設'],
      ),
    ],
  ),

  // ── 2. 概要理解: wawancara novelis tentang AI ──
  _p(
    'ja_1_2',
    'Wawancara: Novelis dan Kecerdasan Buatan',
    'Interview: A Novelist on Artificial Intelligence',
    '作家の山本さんに、人工知能が小説を書く時代についてお聞きします。'
        'よく脅威ではないかと問われますが、私はむしろ好機だと捉えております。'
        '機械が滑らかな文章を量産できるようになったからこそ、人間ならではの、ぎこちなくとも切実な言葉の価値が浮き彫りになるのです。'
        'もっとも、道具として無批判に頼り切るのは危ういと感じます。'
        '書き手が自らの経験と向き合う過程を省いてしまえば、作品は薄っぺらなものに成り下がるでしょう。'
        '要は、使うか否かではなく、どう向き合うかだと思うのです。',
    {
      'id':
          'Kami bertanya kepada penulis Yamamoto-san tentang era ketika kecerdasan buatan menulis novel. '
          '"Saya sering ditanya apakah ini ancaman, tetapi saya justru menganggapnya sebagai peluang. '
          'Justru karena mesin kini bisa memproduksi massal kalimat yang mulus, nilai kata-kata yang khas manusia, yang kaku namun tulus, menjadi menonjol. '
          'Namun, bergantung sepenuhnya tanpa kritik pada alat itu saya rasa berbahaya. '
          'Jika penulis melewatkan proses berhadapan dengan pengalamannya sendiri, karyanya akan merosot menjadi sesuatu yang dangkal. '
          'Intinya, bukan soal memakai atau tidak, melainkan bagaimana menghadapinya."',
      'en':
          'We ask the author Yamamoto-san about the age in which artificial intelligence writes novels. '
          '"I am often asked whether it is a threat, but I rather see it as an opportunity. '
          'Precisely because machines can now mass-produce smooth prose, the value of words unique to humans, awkward yet earnest, comes into relief. '
          'That said, I feel it is dangerous to rely on it uncritically as a tool. '
          'If a writer skips the process of facing their own experience, the work will degrade into something shallow. '
          'The point is not whether to use it, but how to engage with it."',
    },
    [
      _q(
        'Bagaimana sikap dasar Yamamoto terhadap AI?',
        'What is Yamamoto\'s basic stance toward AI?',
        [
          'AIの登場を好機と捉えている',
          'AIを深刻な脅威とみなしている',
          'AIには全く関心がない',
          'AIの利用に全面的に反対している',
        ],
      ),
      _q(
        'Apa yang menjadi menonjol karena kemunculan AI?',
        'What comes into relief because of AI?',
        ['人間ならではの切実な言葉の価値', '機械が書く文章の滑らかさ', '出版業界の急速な衰退', '書き手の技術の未熟さ'],
      ),
      _q(
        'Apa yang dirasa Yamamoto berbahaya?',
        'What does Yamamoto feel is dangerous?',
        ['道具として無批判に頼り切ること', '人間が自分で小説を書くこと', '機械が文章を量産すること', '自らの経験と向き合うこと'],
      ),
      _q(
        'Apa penyebab karya menjadi 「薄っぺらなもの」?',
        'What causes a work to become "shallow"?',
        ['自らの経験と向き合う過程を省くこと', '文章が長すぎること', '出版社の意向に従うこと', '機械を一切使わないこと'],
      ),
      _q(
        'Apa kesimpulan Yamamoto tentang hal terpenting?',
        'What does Yamamoto conclude is most important?',
        ['AIとどう向き合うか', 'AIを使うか否か', 'AIをいかに速く使いこなすか', 'AIを法律でどう規制するか'],
      ),
    ],
  ),

  // ── 3. 課題理解: rapat proyek / negosiasi tenggat ──
  _p(
    'ja_1_3',
    'Rapat: Permintaan Percepatan Tenggat',
    'Meeting: Request to Move Up the Deadline',
    '佐藤部長、先方から納期を二週間前倒ししてほしいとの打診がございました。'
        'うちの生産ラインで対応できるのか。'
        'フル稼働すれば可能ですが、外注費が一割ほど膨らみます。'
        'それを丸ごと当社で被るわけにはいかないな。'
        'そこで、追加費用の半分を先方に負担していただく条件なら応じる、と回答してはいかがでしょうか。'
        'うん、妥当な線だ。ただし、品質検査の工程だけは絶対に削らないよう、現場に釘を刺しておいてくれ。'
        '承知いたしました。では、その旨を盛り込んだ見積書を明日中に先方へお送りします。',
    {
      'id':
          '"Manajer Sato, ada tawaran dari pihak klien agar tenggat dimajukan dua minggu." '
          '"Apakah lini produksi kita bisa menanganinya?" '
          '"Kalau beroperasi penuh bisa, tetapi biaya alih daya membengkak sekitar sepuluh persen." '
          '"Kita tidak bisa menanggung semuanya sendiri, ya." '
          '"Karena itu, bagaimana kalau kita jawab bahwa kita bersedia dengan syarat pihak klien menanggung separuh biaya tambahan?" '
          '"Ya, itu batas yang wajar. Tapi, pastikan kamu menegaskan ke lapangan agar proses pemeriksaan mutu sama sekali tidak dipangkas." '
          '"Dimengerti. Kalau begitu, saya akan kirim penawaran harga yang memuat hal itu ke klien paling lambat besok."',
      'en':
          '"Manager Sato, the client has sounded us out about moving the delivery date up by two weeks." '
          '"Can our production line handle that?" '
          '"At full operation it is possible, but outsourcing costs will swell by about ten percent." '
          '"We cannot absorb all of that ourselves." '
          '"So how about we reply that we will agree on condition that the client bears half of the additional cost?" '
          '"Yes, that is a reasonable line. However, make sure you drive it home to the floor that the quality inspection step must never be cut." '
          '"Understood. Then I will send the client a quotation including that point by the end of tomorrow."',
    },
    [
      _q('Apa permintaan pihak klien?', 'What did the client request?', [
        '納期を二週間早めること',
        '納期を二週間延ばすこと',
        '価格を一割引き下げること',
        '検査工程を省略すること',
      ]),
      _q(
        'Apa masalah jika tenggat dimajukan?',
        'What is the problem with moving the deadline up?',
        ['外注費が一割ほど増えること', '生産ラインが停止すること', '品質が保証できなくなること', '人手が全く確保できないこと'],
      ),
      _q(
        'Syarat apa yang diputuskan untuk dijawab?',
        'What condition was decided for the reply?',
        [
          '追加費用の半分を先方が負担すること',
          '追加費用を全額当社が負担すること',
          '追加費用を全額先方が負担すること',
          '納期の変更を全面的に断ること',
        ],
      ),
      _q(
        'Hal apa yang diminta manajer untuk ditegaskan (釘を刺す) ke lapangan?',
        'What did the manager order to be driven home to the floor?',
        ['品質検査の工程を削らないこと', '外注費を可能な限り削ること', '納期を必ず守ること', '見積書を早く仕上げること'],
      ),
      _q('Apa tindakan selanjutnya?', 'What is the next action?', [
        '明日中に条件付きの見積書を送る',
        '今日中に先方へ電話で断る',
        '来週改めて会議を開く',
        '部長が現場を視察する',
      ]),
    ],
  ),

  // ── 4. 課題理解: penanganan keluhan pelanggan ──
  _p(
    'ja_1_4',
    'Layanan Pelanggan: Keluhan Pelembap Udara',
    'Customer Support: Humidifier Complaint',
    'お電話ありがとうございます。カスタマーサポートの林でございます。'
        '先週届いた加湿器なんですが、電源を入れて数分で異音がするんです。しかも問い合わせフォームに送っても三日間返事がなくて。'
        '大変ご不便をおかけし、心よりお詫び申し上げます。ご返信が遅れました件につきましても、弊社の不手際でございます。'
        'で、どうしてくれるんですか。'
        'まず新品との交換を無償で手配いたします。加えて、お詫びの気持ちとして、次回ご利用いただける割引券をお送りしたく存じます。'
        '交換品はいつ届きますか。'
        '本日発送いたしますので、明後日にはお手元に届く見込みでございます。',
    {
      'id':
          '"Terima kasih telah menghubungi. Saya Hayashi dari layanan pelanggan." '
          '"Soal pelembap udara yang tiba minggu lalu, beberapa menit setelah dinyalakan muncul bunyi aneh. Lagi pula, saya sudah kirim lewat formulir kontak tapi tiga hari tidak ada balasan." '
          '"Kami sungguh mohon maaf atas ketidaknyamanannya. Mengenai keterlambatan balasan itu pun merupakan kelalaian pihak kami." '
          '"Lalu, apa yang akan Anda lakukan?" '
          '"Pertama, kami akan mengatur penggantian dengan unit baru tanpa biaya. Selain itu, sebagai tanda permohonan maaf, kami ingin mengirimkan kupon diskon untuk pembelian berikutnya." '
          '"Kapan barang penggantinya sampai?" '
          '"Kami kirim hari ini, sehingga diperkirakan tiba di tangan Anda lusa."',
      'en':
          '"Thank you for calling. This is Hayashi from customer support." '
          '"About the humidifier that arrived last week, a strange noise starts a few minutes after I switch it on. And I sent a message through the inquiry form but got no reply for three days." '
          '"We sincerely apologize for the great inconvenience. The delayed reply is also our company\'s mishandling." '
          '"So, what are you going to do about it?" '
          '"First, we will arrange a free replacement with a new unit. In addition, as a token of apology, we would like to send you a discount coupon for your next purchase." '
          '"When will the replacement arrive?" '
          '"We will ship it today, so it should reach you the day after tomorrow."',
    },
    [
      _q(
        'Apa isi keluhan pelanggan?',
        'What is the customer complaining about?',
        ['製品の異音と問い合わせへの無返答', '商品がまだ届いていないこと', '請求金額が間違っていること', '配送員の態度が悪かったこと'],
      ),
      _q(
        'Bagaimana sikap Hayashi dalam menangani keluhan?',
        'What is Hayashi\'s attitude in handling the complaint?',
        [
          '責任を認めて丁寧に謝罪している',
          '客側に責任があると主張している',
          '問題の存在そのものを否定している',
          '対応を上司に丸投げしている',
        ],
      ),
      _q('Penanganan apa yang ditawarkan?', 'What remedy was offered?', [
        '無償交換と割引券の送付',
        '修理と全額返金',
        '返金のみ',
        '修理のみ',
      ]),
      _q('Kapan barang pengganti tiba?', 'When will the replacement arrive?', [
        '明後日',
        '本日中',
        '明日',
        '一週間後',
      ]),
      _q(
        'Apa yang dimaksud dengan 「弊社の不手際」?',
        'What does "our company\'s mishandling" refer to?',
        ['問い合わせへの返信が遅れたこと', '製品に異音が発生したこと', '配送が予定より遅れたこと', '割引券を送っていなかったこと'],
      ),
    ],
  ),

  // ── 5. Berita ekonomi: keputusan suku bunga BOJ ──
  _p(
    'ja_1_5',
    'Berita: Keputusan Suku Bunga Bank Jepang',
    'News: Bank of Japan Rate Decision',
    '続いて経済のニュースです。日本銀行は本日、政策金利を据え置くことを決定しました。'
        '市場では利上げを織り込む向きもありましたが、総裁は記者会見で、賃金の上昇が物価に持続的に波及しているか、なお見極めが必要だと述べました。'
        '一方、円相場は発表直後に一時一ドル百五十円台まで下落しました。'
        '輸出企業には追い風となる半面、原材料を輸入に頼る中小企業からは、コスト増を価格に転嫁しきれないとの悲鳴が上がっています。'
        '専門家は、次回会合での利上げの可否は、春闘の結果に左右されるとみています。',
    {
      'id':
          'Selanjutnya berita ekonomi. Bank Jepang hari ini memutuskan untuk mempertahankan suku bunga acuan. '
          'Sebagian pasar telah memperhitungkan kenaikan suku bunga, tetapi Gubernur dalam konferensi pers menyatakan masih perlu mencermati apakah kenaikan upah merambat ke harga secara berkelanjutan. '
          'Di sisi lain, nilai tukar yen sesaat setelah pengumuman turun sementara ke kisaran 150 yen per dolar. '
          'Meski menjadi angin buruk bagi perusahaan ekspor, dari UKM yang bergantung pada impor bahan baku muncul jeritan bahwa kenaikan biaya tidak dapat sepenuhnya dialihkan ke harga jual. '
          'Para pakar memandang bahwa kenaikan suku bunga pada pertemuan berikutnya akan bergantung pada hasil negosiasi upah musim semi (shunto).',
      'en':
          'Next, economic news. The Bank of Japan decided today to leave its policy rate unchanged. '
          'Some in the market had priced in a rate hike, but at the press conference the Governor said it is still necessary to assess whether wage increases are sustainably passing through to prices. '
          'Meanwhile, right after the announcement the yen temporarily fell to the 150-yen-per-dollar range. '
          'While this is a tailwind for exporters, small and medium firms that rely on imported raw materials are crying out that they cannot fully pass rising costs on to prices. '
          'Experts believe whether rates are raised at the next meeting will hinge on the outcome of the spring wage negotiations.',
    },
    [
      _q(
        'Apa yang diputuskan Bank Jepang?',
        'What did the Bank of Japan decide?',
        ['政策金利の据え置き', '政策金利の引き上げ', '政策金利の引き下げ', '国債の大量売却'],
      ),
      _q(
        'Hal apa yang menurut Gubernur masih perlu dicermati?',
        'What did the Governor say still needs to be assessed?',
        ['賃金上昇が物価に持続的に波及しているか', '株価が今後も上昇し続けるか', '円相場がさらに下落するか', '輸出量が回復するか'],
      ),
      _q(
        'Bagaimana pergerakan yen setelah pengumuman?',
        'How did the yen move after the announcement?',
        ['一時的に下落した', '大幅に上昇した', 'ほとんど変動しなかった', '取引が一時停止された'],
      ),
      _q(
        'Mengapa UKM menjerit?',
        'Why are small and medium firms crying out?',
        ['コスト増を価格に転嫁しきれないから', '輸出量が急激に減少したから', '借入金利が急上昇したから', '深刻な人手不足に陥ったから'],
      ),
      _q(
        'Apa yang akan menentukan kenaikan suku bunga berikutnya?',
        'What will determine the next rate hike?',
        ['春闘の結果', '株価の動向', '米国の選挙結果', '原油価格の推移'],
      ),
    ],
  ),

  // ── 6. Wawancara pakar: isolasi sosial lansia ──
  _p(
    'ja_1_6',
    'Wawancara Pakar: Isolasi Lansia',
    'Expert Interview: Isolation of the Elderly',
    '本日は社会学者の中村先生に、高齢者の孤立についてお伺いします。'
        '孤立と申しますと、とかく本人の性格や境遇の問題として片付けられがちですが、私はそれを社会の構造がもたらした帰結だと考えております。'
        '構造、ですか。'
        'ええ。終身雇用や地域の共同体が担っていた繋がりの機能が、この数十年で急速に失われました。にもかかわらず、それに代わる受け皿が整備されていないのです。'
        'では、どのような対策が望ましいでしょうか。'
        '見守りの回数を増やすといった対症療法では限界があります。むしろ、高齢者が役割を担える場を地域に埋め込むことこそが根本的な処方箋だと申し上げたい。',
    {
      'id':
          '"Hari ini kami bertanya kepada sosiolog Profesor Nakamura tentang isolasi lansia." '
          '"Bicara soal isolasi, hal ini cenderung dianggap selesai sebagai masalah kepribadian atau keadaan pribadi, tetapi saya memandangnya sebagai konsekuensi yang dihasilkan struktur masyarakat." '
          '"Struktur, ya?" '
          '"Ya. Fungsi keterhubungan yang dulu diemban oleh sistem kerja seumur hidup dan komunitas lokal hilang dengan cepat dalam beberapa dekade ini. Meski demikian, wadah penggantinya belum disiapkan." '
          '"Lalu, langkah apa yang diharapkan?" '
          '"Pengobatan gejala seperti menambah frekuensi kunjungan pemantauan ada batasnya. Justru menanamkan tempat di komunitas di mana lansia dapat memegang peran, itulah yang saya katakan sebagai resep mendasar."',
      'en':
          '"Today we ask sociologist Professor Nakamura about the isolation of the elderly." '
          '"When we speak of isolation, it tends to be dismissed as a matter of the individual\'s personality or circumstances, but I regard it as a consequence brought about by the structure of society." '
          '"Structure, you say?" '
          '"Yes. The connecting function once carried by lifetime employment and local communities has been rapidly lost over the past few decades. Nevertheless, no substitute to take its place has been put in place." '
          '"Then what measures would be desirable?" '
          '"Symptomatic treatments such as increasing the number of welfare check-ins have their limits. Rather, I would say that embedding places in the community where the elderly can take on roles is the fundamental prescription."',
    },
    [
      _q(
        'Apa pokok pendapat Profesor Nakamura?',
        'What is Professor Nakamura\'s main claim?',
        [
          '孤立は社会構造がもたらした帰結だ',
          '孤立は本人の性格の問題である',
          '孤立はもはや解決不可能である',
          '孤立は若者にこそ深刻な問題だ',
        ],
      ),
      _q(
        'Apa yang dirujuk oleh 「それ」 dalam 「それを社会の構造がもたらした帰結」?',
        'What does "it" refer to in "it is a consequence of social structure"?',
        ['高齢者の孤立', '終身雇用制度', '地域の共同体', '見守り活動'],
      ),
      _q(
        'Apa yang hilang dalam beberapa dekade ini?',
        'What has been lost over the past few decades?',
        ['終身雇用や地域共同体の繋がりの機能', '高齢者に支給される年金', '地域の医療制度', '家族の平均人数'],
      ),
      _q(
        'Apa contoh 「対症療法」 yang disebutkan?',
        'What example of "symptomatic treatment" was mentioned?',
        ['見守りの回数を増やすこと', '年金を増額すること', '高齢者施設を増設すること', '家族と同居させること'],
      ),
      _q(
        'Apa 「根本的な処方箋」 menurut beliau?',
        'What is the "fundamental prescription" according to him?',
        [
          '高齢者が役割を担える場を地域に作ること',
          '見守りを毎日欠かさず行うこと',
          '高齢者を都市部へ移住させること',
          '若者との交流会を頻繫に開くこと',
        ],
      ),
    ],
  ),

  // ── 7. Seminar akademik: rekonstruksi ingatan ──
  _p(
    'ja_1_7',
    'Seminar: Rekonstruksi Ingatan',
    'Seminar: Memory Reconstruction',
    'では、先週の続きで、記憶の再構成についてですね。鈴木さん、レジュメをお願いします。'
        'はい。従来、記憶は録画のように保存され、そのまま再生されると考えられてきました。'
        'しかし近年の研究では、想起のたびに記憶が書き換えられうることが示されています。'
        'つまり、思い出す行為そのものが記憶を歪める可能性があると。'
        'その通りです。したがって、目撃証言の信頼性については、従来より慎重に扱うべきだというのが本論文の含意です。'
        '一点補足すると、この知見は記憶が当てにならないという話ではなく、記憶の柔軟性が適応的な機能を持つという文脈で読むべきでしょう。',
    {
      'id':
          '"Baik, melanjutkan minggu lalu, tentang rekonstruksi ingatan. Suzuki-san, silakan ringkasannya." '
          '"Ya. Secara tradisional, ingatan dianggap disimpan seperti rekaman video dan diputar ulang apa adanya. '
          'Namun, penelitian terkini menunjukkan bahwa ingatan dapat ditulis ulang setiap kali diingat kembali." '
          '"Artinya, tindakan mengingat itu sendiri berpotensi mendistorsi ingatan." '
          '"Benar. Oleh karena itu, implikasi makalah ini adalah keandalan kesaksian saksi mata harus diperlakukan lebih hati-hati daripada sebelumnya." '
          '"Satu tambahan: temuan ini bukan berarti ingatan tidak bisa diandalkan, melainkan harus dibaca dalam konteks bahwa fleksibilitas ingatan memiliki fungsi adaptif."',
      'en':
          '"Now, continuing from last week, we are on memory reconstruction. Suzuki-san, please present the handout." '
          '"Yes. Traditionally, memory was thought to be stored like a video recording and replayed as is. '
          'However, recent research shows that memory can be rewritten each time it is recalled." '
          '"In other words, the very act of remembering can distort memory." '
          '"Exactly. Therefore, the implication of this paper is that the reliability of eyewitness testimony should be handled more cautiously than before." '
          '"One point to add: this finding is not about memory being unreliable, but should be read in the context that the flexibility of memory serves an adaptive function."',
    },
    [
      _q('Apa topik seminar ini?', 'What is the topic of this seminar?', [
        '記憶の再構成',
        '睡眠と学習の関係',
        '言語の習得過程',
        '脳の老化現象',
      ]),
      _q(
        'Bagaimana pandangan tradisional tentang ingatan?',
        'What was the traditional view of memory?',
        ['録画のように保存され再生される', '想起ごとに書き換えられる', '全く信頼することができない', '感情に一切左右されない'],
      ),
      _q(
        'Apa yang ditunjukkan penelitian terkini?',
        'What does recent research show?',
        ['想起のたびに記憶が書き換えられうる', '記憶は年齢とともに強化される', '目撃証言は常に正確である', '記憶は睡眠中に消去される'],
      ),
      _q(
        'Apa implikasi makalah tersebut?',
        'What is the implication of the paper?',
        [
          '目撃証言をより慎重に扱うべきだ',
          '目撃証言を全面的に信頼すべきだ',
          '記録映像の使用を廃止すべきだ',
          '記憶の研究はもう不要である',
        ],
      ),
      _q(
        'Apa tambahan (補足) dari pengajar?',
        'What did the instructor add as a supplement?',
        [
          '記憶の柔軟性は適応的機能として捉えるべき',
          '記憶は全く当てにならないものだ',
          '本論文の結論は根本的に誤りだ',
          '目撃証言は法廷で禁止すべきだ',
        ],
      ),
    ],
  ),

  // ── 8. Panduan audio museum: lukisan byoubu ──
  _p(
    'ja_1_8',
    'Panduan Audio: Lukisan Layar Empat Musim',
    'Audio Guide: Four Seasons Folding Screen',
    '音声ガイド番号十二番。こちらは十七世紀初頭に制作された屏風絵、四季花鳥図でございます。'
        '一見すると華やかな装飾画に見えますが、右から左へと季節が移ろい、鳥たちの視線が次の画面へ誘うよう、綿密に構成されています。'
        '金箔の地は単なる贅沢の表れではなく、蝋燭の灯りの下で画面を浮かび上がらせる実用的な工夫でもありました。'
        'なお、本作は長らく所在不明でしたが、二十年前に海外の個人蔵から里帰りしたものです。'
        '作品保護のため、フラッシュ撮影はご遠慮ください。',
    {
      'id':
          'Panduan audio nomor dua belas. Ini adalah lukisan layar lipat yang dibuat pada awal abad ke-17, "Bunga dan Burung Empat Musim". '
          'Sekilas tampak seperti lukisan dekoratif yang semarak, tetapi disusun dengan cermat agar musim beralih dari kanan ke kiri dan tatapan burung-burung menuntun ke panel berikutnya. '
          'Latar daun emas bukan sekadar wujud kemewahan, melainkan juga siasat praktis untuk menonjolkan gambar di bawah cahaya lilin. '
          'Sebagai catatan, karya ini lama tidak diketahui keberadaannya, dan dua puluh tahun lalu kembali ke tanah air dari koleksi pribadi di luar negeri. '
          'Demi perlindungan karya, mohon tidak memotret dengan lampu kilat.',
      'en':
          'Audio guide number twelve. This is a folding-screen painting made in the early seventeenth century, "Flowers and Birds of the Four Seasons". '
          'At first glance it looks like a gorgeous decorative painting, but it is meticulously composed so that the seasons shift from right to left and the gaze of the birds leads you to the next panel. '
          'The gold-leaf ground is not merely a display of luxury; it was also a practical device to make the image stand out under candlelight. '
          'Incidentally, this work was long unaccounted for, and twenty years ago it returned home from a private collection overseas. '
          'To protect the work, please refrain from flash photography.',
    },
    [
      _q(
        'Apa ciri komposisi karya ini?',
        'What is the compositional feature of this work?',
        [
          '季節が右から左へ移ろい鳥の視線が導く',
          '中央に大きく人物が描かれている',
          '季節が左から右へ移っていく',
          '一つの季節だけが描かれている',
        ],
      ),
      _q(
        'Apa peran praktis latar daun emas?',
        'What was the practical role of the gold-leaf ground?',
        ['蝋燭の灯りの下で画面を浮かび上がらせる', '屏風の骨組みを丈夫にする', '虫による損傷を防ぐ', '屏風全体を軽くする'],
      ),
      _q(
        'Bagaimana riwayat karya ini?',
        'What is the provenance of this work?',
        ['海外の個人蔵から二十年前に戻った', '制作以来ずっと国内にあった', '十年前に倉庫で発見された', '寺院に代々伝わってきた'],
      ),
      _q(
        'Apa yang diminta dari pengunjung?',
        'What are visitors asked to do?',
        ['フラッシュ撮影を控えること', '会話を一切しないこと', '屏風に手を触れないこと', '音声ガイドをすぐ返却すること'],
      ),
      _q(
        'Kesan apa yang mengikuti 「一見すると」?',
        'What impression follows "at first glance"?',
        ['華やかな装飾画に見える', '地味で暗い作品に見える', '未完成の作品に見える', '現代の作品に見える'],
      ),
    ],
  ),

  // ── 9. Pengumuman perusahaan bersyarat: kerja dari rumah ──
  _p(
    'ja_1_9',
    'Pengumuman: Sistem Kerja dari Rumah',
    'Announcement: Remote Work Policy',
    '社員の皆様にお知らせいたします。来月より、在宅勤務制度を本格導入いたします。'
        'ただし、適用にはいくつかの条件がございますのでご留意ください。'
        'まず、対象は入社一年以上の正社員および契約社員とし、試用期間中の方は対象外となります。'
        '次に、週の在宅日数は原則二日までとし、三日以上を希望される場合は、所属長の承認に加え、人事部への事前申請が必要です。'
        'また、顧客情報を扱う部署に関しては、会社が貸与する端末以外での業務を禁止いたします。'
        'なお、本制度は半年後に運用状況を検証し、内容を見直す可能性がございます。'
        'ご不明な点は人事部までお問い合わせください。',
    {
      'id':
          'Pemberitahuan kepada seluruh karyawan. Mulai bulan depan, sistem kerja dari rumah akan diterapkan secara penuh. '
          'Namun, harap diperhatikan bahwa penerapannya memiliki beberapa syarat. '
          'Pertama, sasarannya adalah karyawan tetap dan karyawan kontrak dengan masa kerja minimal satu tahun; karyawan dalam masa percobaan tidak termasuk. '
          'Kedua, jumlah hari kerja dari rumah per minggu pada prinsipnya maksimal dua hari; bila menginginkan tiga hari atau lebih, selain persetujuan kepala bagian, diperlukan pengajuan terlebih dahulu ke bagian SDM. '
          'Selain itu, untuk bagian yang menangani informasi pelanggan, bekerja dengan perangkat selain yang dipinjamkan perusahaan dilarang. '
          'Sebagai catatan, sistem ini akan dievaluasi kondisi penerapannya setelah setengah tahun dan isinya mungkin ditinjau ulang. '
          'Pertanyaan dapat diajukan ke bagian SDM.',
      'en':
          'Notice to all employees. From next month, the remote work system will be fully introduced. '
          'However, please note that several conditions apply. '
          'First, eligible staff are regular and contract employees with at least one year of service; those in their probation period are not eligible. '
          'Second, remote days are in principle limited to two per week; if you wish to work three or more days remotely, you need prior application to the HR department in addition to approval from your department head. '
          'Also, for departments handling customer information, working on any device other than one lent by the company is prohibited. '
          'Note that the operation of this system will be reviewed after six months and its contents may be revised. '
          'For any questions, please contact the HR department.',
    },
    [
      _q(
        'Siapa yang tidak termasuk sasaran sistem ini?',
        'Who is not eligible for this system?',
        ['試用期間中の社員', '契約社員', '入社二年目の正社員', '管理職の社員'],
      ),
      _q(
        'Berapa jumlah hari kerja dari rumah pada prinsipnya?',
        'What is the standard limit on remote days?',
        ['週二日まで', '週三日まで', '週一日まで', '日数の制限なし'],
      ),
      _q(
        'Syarat apa yang berlaku bila ingin tiga hari atau lebih?',
        'Which condition applies for three or more days?',
        ['所属長の承認と人事部への事前申請', '所属長の承認のみ', '社長の直接承認', '特別な手続きは一切不要'],
      ),
      _q(
        'Syarat apa yang berlaku bagi bagian penangan informasi pelanggan?',
        'Which condition applies to departments handling customer data?',
        ['会社貸与の端末以外での業務禁止', '在宅勤務そのものが全面禁止', '私用端末の使用が特別に許可', '週五日の在宅勤務が可能'],
      ),
      _q(
        'Apa yang akan dilakukan setelah setengah tahun?',
        'What will happen after six months?',
        ['運用状況の検証と内容見直しの可能性', '制度の完全な廃止', '全社員への強制適用', '在宅日数の無制限化'],
      ),
    ],
  ),
];
