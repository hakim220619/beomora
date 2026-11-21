import '../models/guide.dart';

/// Tata bahasa Mandarin tingkat HSK 1–2, lanjutan dari "Pola Kalimat
/// Dasar" (是, 吗, 不/没, 的, 很, kata satuan, urutan kata) di
/// zh_guides.dart. Contoh ditulis dengan spasi antarkata supaya sejajar
/// dengan pinyin-nya.
final List<GuideTopic> zhGrammarTopics = [
  GuideTopic(
    id: 'zh_grammar_le',
    emoji: '✅',
    title: const {
      'id': '了: Sudah Terjadi & Berubah',
      'en': '了: Completion & Change',
    },
    subtitle: const {
      'id': '了 setelah kata kerja vs di akhir kalimat',
      'en': '了 after the verb vs at the end of the sentence',
    },
    sections: [
      GuideSection(
        title: const {
          'id': '了 setelah kata kerja: tindakan selesai',
          'en': '了 after a verb: completed action',
        },
        body: const {
          'id':
              'Kata kerja + 了 menandai tindakan yang sudah selesai, '
              'biasanya diikuti jumlah atau objek yang jelas. Bentuk '
              'negatifnya 没 + kata kerja, TANPA 了.',
          'en':
              'Verb + 了 marks a completed action, usually followed by an '
              'amount or a specific object. The negative is 没 + verb, '
              'WITHOUT 了.',
        },
        examples: const [
          GuideExample('我 买 了 三 本 书', {
            'id': 'saya (sudah) membeli tiga buku',
            'en': 'I bought three books',
          }, romaji: 'wǒ mǎi le sān běn shū'),
          GuideExample('他 喝 了 一 杯 咖啡', {
            'id': 'dia minum secangkir kopi',
            'en': 'he drank a cup of coffee',
          }, romaji: 'tā hē le yì bēi kāfēi'),
          GuideExample('我 没 去 学校', {
            'id': 'saya tidak pergi ke sekolah',
            'en': 'I didn\'t go to school',
          }, romaji: 'wǒ méi qù xuéxiào'),
        ],
      ),
      GuideSection(
        title: const {
          'id': '了 di akhir kalimat: keadaan baru',
          'en': '了 at the end: a new situation',
        },
        body: const {
          'id':
              '了 di akhir kalimat menunjukkan perubahan keadaan: '
              'sekarang sudah begini (tadinya tidak). 太…了 juga '
              'memakai 了 untuk menyatakan "terlalu/sangat".',
          'en':
              '了 at the end shows a change of state: it is now like this '
              '(it wasn\'t before). 太…了 also uses 了 for "too/so".',
        },
        examples: const [
          GuideExample('下雨 了', {
            'id': 'hujan turun (sekarang mulai hujan)',
            'en': 'it\'s started raining',
          }, romaji: 'xiàyǔ le'),
          GuideExample('我 饿 了', {
            'id': 'saya (jadi) lapar',
            'en': 'I\'m hungry now',
          }, romaji: 'wǒ è le'),
          GuideExample('太 贵 了', {
            'id': 'mahal sekali!',
            'en': 'too expensive!',
          }, romaji: 'tài guì le'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'zh_grammar_guo',
    emoji: '🧳',
    title: const {'id': '过: Pengalaman', 'en': '过: Experience'},
    subtitle: const {
      'id': 'Pernah / belum pernah melakukan sesuatu',
      'en': 'Have / have never done something',
    },
    sections: [
      GuideSection(
        title: const {
          'id': 'Kata kerja + 过 = pernah',
          'en': 'Verb + 过 = have done',
        },
        body: const {
          'id':
              '过 setelah kata kerja berarti "pernah". Negatifnya 没(有) + '
              'kata kerja + 过 = belum/tidak pernah. Pertanyaan: '
              '…过…吗? atau …过…没有?',
          'en':
              '过 after a verb means "have (ever) done". The negative is '
              '没(有) + verb + 过. Questions: …过…吗? or …过…没有?',
        },
        examples: const [
          GuideExample('我 去 过 北京', {
            'id': 'saya pernah ke Beijing',
            'en': 'I have been to Beijing',
          }, romaji: 'wǒ qù guo Běijīng'),
          GuideExample('我 没 吃 过 饺子', {
            'id': 'saya belum pernah makan jiaozi',
            'en': 'I have never eaten dumplings',
          }, romaji: 'wǒ méi chī guo jiǎozi'),
          GuideExample('你 学 过 汉语 吗', {
            'id': 'kamu pernah belajar bahasa Mandarin?',
            'en': 'have you studied Chinese before?',
          }, romaji: 'nǐ xué guo Hànyǔ ma'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'zh_grammar_zai',
    emoji: '⏳',
    title: const {'id': '在 / 正在…呢: Sedang', 'en': '在 / 正在…呢: In Progress'},
    subtitle: const {
      'id': 'Tindakan yang sedang berlangsung',
      'en': 'Actions happening right now',
    },
    sections: [
      GuideSection(
        title: const {'id': '在 / 正在 + kata kerja', 'en': '在 / 正在 + verb'},
        body: const {
          'id':
              '在 atau 正在 sebelum kata kerja berarti "sedang". 呢 di akhir '
              'sering ditambahkan dalam percakapan. Negatifnya 没在: '
              '我没在看电视 (saya tidak sedang menonton TV).',
          'en':
              '在 or 正在 before a verb means "-ing". 呢 is often added at '
              'the end in speech. Negative: 没在 — 我没在看电视 (I\'m not '
              'watching TV).',
        },
        examples: const [
          GuideExample('我 在 吃饭', {
            'id': 'saya sedang makan',
            'en': 'I\'m eating',
          }, romaji: 'wǒ zài chīfàn'),
          GuideExample('他 正在 打 电话 呢', {
            'id': 'dia sedang menelepon',
            'en': 'he\'s on the phone',
          }, romaji: 'tā zhèngzài dǎ diànhuà ne'),
          GuideExample('你 在 做 什么', {
            'id': 'kamu sedang apa?',
            'en': 'what are you doing?',
          }, romaji: 'nǐ zài zuò shénme'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'zh_grammar_modal',
    emoji: '💪',
    title: const {'id': 'Ingin, Bisa & Boleh', 'en': 'Want, Can & May'},
    subtitle: const {
      'id': '想, 要, 会, 能, 可以 — bedanya apa?',
      'en': '想, 要, 会, 能, 可以 — what\'s the difference?',
    },
    sections: [
      GuideSection(
        title: const {'id': '想 vs 要: ingin & mau', 'en': '想 vs 要: wish & want'},
        body: const {
          'id':
              '想 = ingin (lebih halus, keinginan). 要 = mau/akan (lebih '
              'tegas, rencana pasti). Negatif keduanya: 不想 (tidak ingin). '
              '不要 berarti "jangan".',
          'en':
              '想 = would like (softer, a wish). 要 = want/going to '
              '(firmer, a plan). The negative of both is 不想. 不要 means '
              '"don\'t".',
        },
        examples: const [
          GuideExample('我 想 去 中国', {
            'id': 'saya ingin pergi ke Tiongkok',
            'en': 'I\'d like to go to China',
          }, romaji: 'wǒ xiǎng qù Zhōngguó'),
          GuideExample('我 要 一 杯 水', {
            'id': 'saya mau segelas air',
            'en': 'I want a glass of water',
          }, romaji: 'wǒ yào yì bēi shuǐ'),
          GuideExample('不要 说话', {
            'id': 'jangan bicara',
            'en': 'don\'t talk',
          }, romaji: 'búyào shuōhuà'),
        ],
      ),
      GuideSection(
        title: const {
          'id': '会, 能, 可以: tiga arti "bisa"',
          'en': '会, 能, 可以: three kinds of "can"',
        },
        body: const {
          'id':
              '会 = bisa karena sudah belajar (keterampilan). 能 = mampu / '
              'keadaan memungkinkan. 可以 = boleh (izin). Contoh: 我会游泳, '
              'tapi 今天不能游泳 (saya bisa berenang, tapi hari ini tidak bisa).',
          'en':
              '会 = can because you learned it (skill). 能 = able / '
              'circumstances allow. 可以 = may (permission). E.g. 我会游泳, '
              'but 今天不能游泳 (I can swim, but I can\'t today).',
        },
        examples: const [
          GuideExample('我 会 说 汉语', {
            'id': 'saya bisa berbahasa Mandarin',
            'en': 'I can speak Chinese',
          }, romaji: 'wǒ huì shuō Hànyǔ'),
          GuideExample('明天 我 不 能 来', {
            'id': 'besok saya tidak bisa datang',
            'en': 'I can\'t come tomorrow',
          }, romaji: 'míngtiān wǒ bù néng lái'),
          GuideExample('这里 可以 拍照 吗', {
            'id': 'di sini boleh memotret?',
            'en': 'may I take photos here?',
          }, romaji: 'zhèlǐ kěyǐ pāizhào ma'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'zh_grammar_questions',
    emoji: '❓',
    title: const {'id': 'Bentuk Pertanyaan Lain', 'en': 'More Question Forms'},
    subtitle: const {'id': 'A不A, 还是, 呢 & 吧', 'en': 'A-not-A, 还是, 呢 & 吧'},
    sections: [
      GuideSection(
        title: const {'id': 'A不A: ya atau tidak', 'en': 'A-not-A: yes or no'},
        body: const {
          'id':
              'Ulangi kata kerja/sifat dengan 不 di tengah — artinya sama '
              'dengan memakai 吗, jadi jangan dipakai bersamaan.',
          'en':
              'Repeat the verb/adjective with 不 in between. It means the '
              'same as using 吗, so don\'t use both together.',
        },
        examples: const [
          GuideExample('你 是 不 是 老师', {
            'id': 'kamu guru atau bukan?',
            'en': 'are you a teacher or not?',
          }, romaji: 'nǐ shì bu shì lǎoshī'),
          GuideExample('这个 好 不 好吃', {
            'id': 'ini enak atau tidak?',
            'en': 'is this tasty or not?',
          }, romaji: 'zhège hǎo bu hǎochī'),
        ],
      ),
      GuideSection(
        title: const {'id': 'A 还是 B: pilihan', 'en': 'A 还是 B: choices'},
        body: const {
          'id':
              '还是 menawarkan pilihan dalam pertanyaan ("…atau…?"). '
              'Dalam kalimat berita "atau" memakai 或者.',
          'en':
              '还是 offers a choice in a question ("…or…?"). In statements '
              '"or" is 或者.',
        },
        examples: const [
          GuideExample('你 喝 茶 还是 咖啡', {
            'id': 'kamu minum teh atau kopi?',
            'en': 'do you drink tea or coffee?',
          }, romaji: 'nǐ hē chá háishi kāfēi'),
        ],
      ),
      GuideSection(
        title: const {
          'id': '呢 & 吧: balik bertanya & menduga',
          'en': '呢 & 吧: "and you?" & guessing',
        },
        body: const {
          'id':
              '…呢? = "kalau …?" (balik bertanya). 吧 di akhir kalimat = '
              'ajakan ("yuk") atau dugaan ("…kan?").',
          'en':
              '…呢? = "what about …?". 吧 at the end = a suggestion '
              '("let\'s") or a guess ("…right?").',
        },
        examples: const [
          GuideExample('我 很 好 你 呢', {
            'id': 'saya baik, kalau kamu?',
            'en': 'I\'m fine, and you?',
          }, romaji: 'wǒ hěn hǎo nǐ ne'),
          GuideExample('我们 走 吧', {
            'id': 'ayo kita pergi',
            'en': 'let\'s go',
          }, romaji: 'wǒmen zǒu ba'),
          GuideExample('你 是 学生 吧', {
            'id': 'kamu pelajar, kan?',
            'en': 'you\'re a student, right?',
          }, romaji: 'nǐ shì xuésheng ba'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'zh_grammar_compare',
    emoji: '⚖️',
    title: const {'id': 'Perbandingan 比', 'en': 'Comparisons with 比'},
    subtitle: const {
      'id': 'Lebih …, tidak se-…, sama …',
      'en': 'More …, not as …, as … as',
    },
    sections: [
      GuideSection(
        title: const {'id': 'A 比 B + sifat', 'en': 'A 比 B + adjective'},
        body: const {
          'id':
              'A 比 B + kata sifat = A lebih … daripada B. Jangan pakai 很 '
              'di sini; untuk "jauh lebih" tambahkan 多了 atau 得多 di '
              'belakang.',
          'en':
              'A 比 B + adjective = A is more … than B. Don\'t use 很 here; '
              'for "much more" add 多了 or 得多 after the adjective.',
        },
        examples: const [
          GuideExample('哥哥 比 我 高', {
            'id': 'kakak lebih tinggi dari saya',
            'en': 'my brother is taller than me',
          }, romaji: 'gēge bǐ wǒ gāo'),
          GuideExample('今天 比 昨天 冷 多 了', {
            'id': 'hari ini jauh lebih dingin dari kemarin',
            'en': 'today is much colder than yesterday',
          }, romaji: 'jīntiān bǐ zuótiān lěng duō le'),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'A 没有 B (那么) + sifat',
          'en': 'A 没有 B (那么) + adjective',
        },
        body: const {
          'id':
              'Bentuk negatif perbandingan: A tidak se-… B. Untuk "sama" '
              'pakai A 跟 B 一样 (+ sifat).',
          'en':
              'Negative comparison: A is not as … as B. For "the same" use '
              'A 跟 B 一样 (+ adjective).',
        },
        examples: const [
          GuideExample('我 没有 他 那么 忙', {
            'id': 'saya tidak sesibuk dia',
            'en': 'I\'m not as busy as him',
          }, romaji: 'wǒ méiyǒu tā nàme máng'),
          GuideExample('我 跟 你 一样 大', {
            'id': 'umur saya sama dengan kamu',
            'en': 'I\'m the same age as you',
          }, romaji: 'wǒ gēn nǐ yíyàng dà'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'zh_grammar_shide',
    emoji: '🔎',
    title: const {
      'id': '是…的: Menekankan Detail',
      'en': '是…的: Stressing Details',
    },
    subtitle: const {
      'id': 'Kapan, di mana, dengan apa sesuatu terjadi',
      'en': 'When, where, how something happened',
    },
    sections: [
      GuideSection(
        title: const {
          'id': '是 + detail + kata kerja + 的',
          'en': '是 + detail + verb + 的',
        },
        body: const {
          'id':
              'Dipakai untuk hal yang SUDAH terjadi, ketika yang ingin '
              'ditekankan adalah waktu, tempat, cara, atau pelakunya. 是 '
              'boleh dihilangkan dalam kalimat positif.',
          'en':
              'Used for things that ALREADY happened when you want to '
              'stress the time, place, manner or doer. 是 can be dropped '
              'in positive sentences.',
        },
        examples: const [
          GuideExample('你 是 什么 时候 来 的', {
            'id': 'kamu datangnya kapan?',
            'en': 'when did you come?',
          }, romaji: 'nǐ shì shénme shíhou lái de'),
          GuideExample('我 是 坐 飞机 来 的', {
            'id': 'saya datang naik pesawat',
            'en': 'I came by plane',
          }, romaji: 'wǒ shì zuò fēijī lái de'),
          GuideExample('这 是 妈妈 做 的', {
            'id': 'ini buatan ibu',
            'en': 'mom made this',
          }, romaji: 'zhè shì māma zuò de'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'zh_grammar_time',
    emoji: '🕒',
    title: const {'id': 'Jam, Tanggal & Hari', 'en': 'Time, Dates & Days'},
    subtitle: const {
      'id': '点/分/半/刻, 年-月-日, 星期',
      'en': '点/分/半/刻, year-month-day, 星期',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Menyebut jam', 'en': 'Telling the time'},
        body: const {
          'id':
              'Jam: angka + 点 (+ angka + 分). 半 = setengah (lewat 30), '
              '一刻 = seperempat (15 menit). 差 = kurang. Jam 2 memakai '
              '两点, bukan 二点.',
          'en':
              'Hours: number + 点 (+ number + 分). 半 = half past, 一刻 = '
              'quarter (15 min), 差 = to (before). 2 o\'clock is 两点, not '
              '二点.',
        },
        examples: const [
          GuideExample('现在 两 点 半', {
            'id': 'sekarang jam setengah tiga (2.30)',
            'en': 'it\'s half past two',
          }, romaji: 'xiànzài liǎng diǎn bàn'),
          GuideExample('八 点 一 刻', {
            'id': 'jam delapan lewat seperempat (8.15)',
            'en': 'quarter past eight',
          }, romaji: 'bā diǎn yí kè'),
          GuideExample('差 五 分 十 点', {
            'id': 'jam sepuluh kurang lima (9.55)',
            'en': 'five to ten',
          }, romaji: 'chà wǔ fēn shí diǎn'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Tanggal & hari', 'en': 'Dates & weekdays'},
        body: const {
          'id':
              'Urutan dari besar ke kecil: tahun 年 → bulan 月 → tanggal '
              '号/日 → hari 星期. Tahun dibaca per angka: 2026 = 二零二六年. '
              'Hari: 星期 + 一…六; Minggu = 星期天/星期日.',
          'en':
              'Order from big to small: year 年 → month 月 → date 号/日 → '
              'weekday 星期. Years are read digit by digit: 2026 = 二零二六年. '
              'Weekdays: 星期 + 一…六; Sunday = 星期天/星期日.',
        },
        examples: const [
          GuideExample('今天 是 十一 月 二十 号', {
            'id': 'hari ini tanggal 20 November',
            'en': 'today is November 20th',
          }, romaji: 'jīntiān shì shíyī yuè èrshí hào'),
          GuideExample('明天 星期五', {
            'id': 'besok hari Jumat',
            'en': 'tomorrow is Friday',
          }, romaji: 'míngtiān xīngqīwǔ'),
          GuideExample('你 的 生日 是 几 月 几 号', {
            'id': 'ulang tahunmu tanggal berapa?',
            'en': 'when is your birthday?',
          }, romaji: 'nǐ de shēngrì shì jǐ yuè jǐ hào'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'zh_grammar_place',
    emoji: '📍',
    title: const {'id': 'Letak: 在, 有 & 是', 'en': 'Location: 在, 有 & 是'},
    subtitle: const {
      'id': 'Di mana sesuatu berada & apa yang ada di suatu tempat',
      'en': 'Where things are & what is somewhere',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Benda + 在 + tempat', 'en': 'Thing + 在 + place'},
        body: const {
          'id':
              'Untuk "… ada di …". Kata posisi (上, 里, 旁边, 前边) '
              'diletakkan SETELAH bendanya: 桌子上 = di atas meja.',
          'en':
              'For "… is at …". Position words (上, 里, 旁边, 前边) come '
              'AFTER the noun: 桌子上 = on the table.',
        },
        examples: const [
          GuideExample('书 在 桌子 上', {
            'id': 'bukunya di atas meja',
            'en': 'the book is on the table',
          }, romaji: 'shū zài zhuōzi shang'),
          GuideExample('银行 在 学校 旁边', {
            'id': 'bank ada di samping sekolah',
            'en': 'the bank is next to the school',
          }, romaji: 'yínháng zài xuéxiào pángbiān'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Tempat + 有 + benda', 'en': 'Place + 有 + thing'},
        body: const {
          'id':
              'Untuk "di … ada …" (benda yang belum disebut). 是 dipakai '
              'kalau yang ada di tempat itu sudah pasti/satu-satunya.',
          'en':
              'For "there is … at …" (something new). 是 is used when the '
              'thing there is known/the only one.',
        },
        examples: const [
          GuideExample('房间 里 有 两 张 床', {
            'id': 'di kamar ada dua tempat tidur',
            'en': 'there are two beds in the room',
          }, romaji: 'fángjiān li yǒu liǎng zhāng chuáng'),
          GuideExample('学校 前边 是 公园', {
            'id': 'di depan sekolah itu taman',
            'en': 'in front of the school is a park',
          }, romaji: 'xuéxiào qiánbian shì gōngyuán'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'zh_grammar_complement',
    emoji: '🎯',
    title: const {
      'id': 'Pelengkap Hasil & Arah',
      'en': 'Result & Direction Complements',
    },
    subtitle: const {'id': '看见, 听懂, 做完, 回来, 出去', 'en': '看见, 听懂, 做完, 回来, 出去'},
    sections: [
      GuideSection(
        title: const {'id': 'Pelengkap hasil', 'en': 'Result complements'},
        body: const {
          'id':
              'Kata kerja + hasilnya: 看 (melihat) + 见 = 看见 (terlihat), '
              '听 + 懂 = 听懂 (mendengar & paham), 做 + 完 = 做完 '
              '(selesai mengerjakan). Negatifnya memakai 没: 我没听懂.',
          'en':
              'Verb + result: 看 (look) + 见 = 看见 (see), 听 + 懂 = 听懂 '
              '(understand by listening), 做 + 完 = 做完 (finish doing). '
              'Negate with 没: 我没听懂.',
        },
        examples: const [
          GuideExample('我 没 听 懂', {
            'id': 'saya tidak menangkap (tidak paham)',
            'en': 'I didn\'t catch that',
          }, romaji: 'wǒ méi tīng dǒng'),
          GuideExample('作业 做 完 了', {
            'id': 'PR-nya sudah selesai',
            'en': 'the homework is done',
          }, romaji: 'zuòyè zuò wán le'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Pelengkap arah 来/去', 'en': 'Direction 来/去'},
        body: const {
          'id':
              '来 = mendekati pembicara, 去 = menjauhi pembicara. '
              '回来 (pulang ke sini), 回去 (pulang ke sana), 进来 (masuk '
              'ke sini), 出去 (keluar).',
          'en':
              '来 = toward the speaker, 去 = away from the speaker. '
              '回来 (come back), 回去 (go back), 进来 (come in), 出去 (go out).',
        },
        examples: const [
          GuideExample('爸爸 回来 了', {
            'id': 'ayah sudah pulang',
            'en': 'dad is back',
          }, romaji: 'bàba huílai le'),
          GuideExample('我们 出去 吃 吧', {
            'id': 'yuk kita makan di luar',
            'en': 'let\'s eat out',
          }, romaji: 'wǒmen chūqu chī ba'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'zh_grammar_connectors',
    emoji: '🔗',
    title: const {'id': 'Kalimat Majemuk', 'en': 'Linking Sentences'},
    subtitle: const {
      'id': '因为…所以, 虽然…但是, 如果…就, 先…然后',
      'en': '因为…所以, 虽然…但是, 如果…就, 先…然后',
    },
    sections: [
      GuideSection(
        title: const {
          'id': 'Sebab-akibat & pertentangan',
          'en': 'Cause & contrast',
        },
        body: const {
          'id':
              'Mandarin suka memakai pasangan kata sambung: 因为…所以… '
              '(karena…maka…), 虽然…但是… (meskipun…tetapi…). Berbeda '
              'dengan bahasa Indonesia, keduanya boleh dipakai sekaligus.',
          'en':
              'Mandarin likes paired connectors: 因为…所以… (because…so…), '
              '虽然…但是… (although…but…). Unlike English, both halves '
              'are used together.',
        },
        examples: const [
          GuideExample('因为 下雨 所以 我 没 去', {
            'id': 'karena hujan, saya tidak pergi',
            'en': 'because it rained, I didn\'t go',
          }, romaji: 'yīnwèi xiàyǔ suǒyǐ wǒ méi qù'),
          GuideExample('虽然 很 累 但是 很 高兴', {
            'id': 'meskipun capek, tapi senang',
            'en': 'although tired, I\'m happy',
          }, romaji: 'suīrán hěn lèi dànshì hěn gāoxìng'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Syarat & urutan', 'en': 'Conditions & sequence'},
        body: const {
          'id':
              '如果…就… = kalau…maka…. 先…然后… = pertama…lalu…. '
              '就 diletakkan sebelum kata kerja di bagian kedua.',
          'en':
              '如果…就… = if…then…. 先…然后… = first…then…. 就 goes '
              'before the verb in the second half.',
        },
        examples: const [
          GuideExample(
            '如果 明天 不 下雨 我们 就 去 公园',
            {
              'id': 'kalau besok tidak hujan, kita ke taman',
              'en': 'if it doesn\'t rain tomorrow, we\'ll go to the park',
            },
            romaji: 'rúguǒ míngtiān bú xiàyǔ wǒmen jiù qù gōngyuán',
          ),
          GuideExample('我 先 洗 手 然后 吃饭', {
            'id': 'saya cuci tangan dulu, lalu makan',
            'en': 'I wash my hands first, then eat',
          }, romaji: 'wǒ xiān xǐ shǒu ránhòu chīfàn'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'zh_grammar_ba',
    emoji: '🫳',
    title: const {'id': '把: Mengolah Objek', 'en': '把: Handling the Object'},
    subtitle: const {
      'id': 'Objek dimajukan sebelum kata kerja',
      'en': 'Moving the object before the verb',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Pola 把', 'en': 'The 把 pattern'},
        body: const {
          'id':
              'Subjek + 把 + objek + kata kerja + hasil/tujuan. Dipakai saat objeknya jelas (benda tertentu) dan tindakan mengubah atau memindahkan benda itu. Kata kerjanya tidak boleh berdiri sendiri: harus ada 了, pelengkap, atau tujuan.',
          'en':
              'Subject + 把 + object + verb + result/destination. Used when the object is specific and the action changes or moves it. The verb can\'t stand alone: it needs 了, a complement or a destination.',
        },
        examples: const [
          GuideExample('我 把 门 关上 了', {
            'id': 'saya menutup pintunya',
            'en': 'I closed the door',
          }, romaji: 'wǒ bǎ mén guānshang le'),
          GuideExample('请 把 书 放 在 桌子 上', {
            'id': 'tolong taruh bukunya di atas meja',
            'en': 'please put the book on the table',
          }, romaji: 'qǐng bǎ shū fàng zài zhuōzi shang'),
          GuideExample('他 把 作业 做 完 了', {
            'id': 'dia sudah menyelesaikan PR-nya',
            'en': 'he finished his homework',
          }, romaji: 'tā bǎ zuòyè zuò wán le'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Negatif & perintah', 'en': 'Negatives & commands'},
        body: const {
          'id':
              '不/没 diletakkan SEBELUM 把, bukan sebelum kata kerja. Untuk larangan pakai 别 + 把.',
          'en':
              '不/没 goes BEFORE 把, not before the verb. For "don\'t" use 别 + 把.',
        },
        examples: const [
          GuideExample('我 没 把 钱包 带 来', {
            'id': 'saya tidak membawa dompetnya',
            'en': 'I didn\'t bring my wallet',
          }, romaji: 'wǒ méi bǎ qiánbāo dài lái'),
          GuideExample('别 把 手机 忘 在 家 里', {
            'id': 'jangan sampai HP-nya ketinggalan di rumah',
            'en': 'don\'t leave your phone at home',
          }, romaji: 'bié bǎ shǒujī wàng zài jiā li'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'zh_grammar_bei',
    emoji: '🙇',
    title: const {'id': '被: Kalimat Pasif', 'en': '被: The Passive'},
    subtitle: const {
      'id': 'Di- … oleh …, sering untuk kejadian tak menyenangkan',
      'en': '"… was … by …", often for unpleasant events',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Pola 被', 'en': 'The 被 pattern'},
        body: const {
          'id':
              'Penerima + 被 + (pelaku) + kata kerja + hasil. Pelakunya boleh dihilangkan. 被 paling sering dipakai untuk hal yang merugikan: dicuri, dimarahi, kehujanan.',
          'en':
              'Receiver + 被 + (doer) + verb + result. The doer can be left out. 被 is most often used for unpleasant things: stolen, scolded, caught in the rain.',
        },
        examples: const [
          GuideExample('我 的 自行车 被 偷 了', {
            'id': 'sepeda saya dicuri',
            'en': 'my bike was stolen',
          }, romaji: 'wǒ de zìxíngchē bèi tōu le'),
          GuideExample('他 被 老师 批评 了', {
            'id': 'dia dimarahi guru',
            'en': 'he was criticized by the teacher',
          }, romaji: 'tā bèi lǎoshī pīpíng le'),
          GuideExample('蛋糕 被 弟弟 吃 了', {
            'id': 'kuenya dimakan adik',
            'en': 'the cake was eaten by my little brother',
          }, romaji: 'dàngāo bèi dìdi chī le'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Negatif', 'en': 'Negatives'},
        body: const {
          'id':
              '没 diletakkan sebelum 被. Dalam percakapan, 被 kadang diganti 让 atau 叫.',
          'en':
              '没 goes before 被. In speech, 被 is sometimes replaced by 让 or 叫.',
        },
        examples: const [
          GuideExample('我 的 钱包 没 被 偷', {
            'id': 'dompet saya tidak dicuri',
            'en': 'my wallet wasn\'t stolen',
          }, romaji: 'wǒ de qiánbāo méi bèi tōu'),
          GuideExample('杯子 让 他 打破 了', {
            'id': 'gelasnya dipecahkan olehnya',
            'en': 'the cup was broken by him',
          }, romaji: 'bēizi ràng tā dǎpò le'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'zh_grammar_zhe',
    emoji: '🧍',
    title: const {'id': '着: Keadaan Berlangsung', 'en': '着: Ongoing States'},
    subtitle: const {
      'id': 'Pintu terbuka, duduk sambil …',
      'en': 'Door is open, sitting while …',
    },
    sections: [
      GuideSection(
        title: const {
          'id': 'Kata kerja + 着: keadaan',
          'en': 'Verb + 着: a lasting state',
        },
        body: const {
          'id':
              '着 menunjukkan keadaan yang bertahan setelah tindakan: pintu (dalam keadaan) terbuka, lampu menyala. Bedanya dengan 在: 在 = sedang melakukan; 着 = sedang dalam keadaan.',
          'en':
              '着 shows a state that lasts after an action: the door is (in an) open (state), the light is on. Compared with 在: 在 = in the middle of doing; 着 = in a state.',
        },
        examples: const [
          GuideExample('门 开 着', {
            'id': 'pintunya terbuka',
            'en': 'the door is open',
          }, romaji: 'mén kāi zhe'),
          GuideExample('他 穿 着 一 件 红 衣服', {
            'id': 'dia memakai baju merah',
            'en': 'he\'s wearing a red top',
          }, romaji: 'tā chuān zhe yí jiàn hóng yīfu'),
          GuideExample('墙 上 挂 着 一 张 地图', {
            'id': 'di dinding tergantung sebuah peta',
            'en': 'a map hangs on the wall',
          }, romaji: 'qiáng shang guà zhe yì zhāng dìtú'),
        ],
      ),
      GuideSection(
        title: const {'id': 'A 着 B: sambil', 'en': 'A 着 B: while'},
        body: const {
          'id':
              'Kata kerja1 + 着 + kata kerja2 = melakukan kata kerja2 sambil kata kerja1. Negatifnya 没 + kata kerja + 着.',
          'en':
              'Verb1 + 着 + verb2 = doing verb2 while verb1. The negative is 没 + verb + 着.',
        },
        examples: const [
          GuideExample('他 笑 着 说 谢谢', {
            'id': 'dia berkata terima kasih sambil tersenyum',
            'en': 'he said thanks with a smile',
          }, romaji: 'tā xiào zhe shuō xièxie'),
          GuideExample('我们 走 着 去 吧', {
            'id': 'kita jalan kaki saja yuk',
            'en': 'let\'s walk there',
          }, romaji: 'wǒmen zǒu zhe qù ba'),
          GuideExample('灯 没 开 着', {
            'id': 'lampunya tidak menyala',
            'en': 'the light isn\'t on',
          }, romaji: 'dēng méi kāi zhe'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'zh_grammar_moods',
    emoji: '💬',
    title: const {
      'id': '呢, 吧, 啊: Nada Kalimat',
      'en': '呢, 吧, 啊: Sentence Mood',
    },
    subtitle: const {
      'id': 'Partikel akhir yang membuat kalimat terdengar alami',
      'en': 'End particles that make sentences sound natural',
    },
    sections: [
      GuideSection(
        title: const {
          'id': '呢: bagaimana dengan …? / sedang',
          'en': '呢: what about …? / ongoing',
        },
        body: const {
          'id':
              'Kata benda + 呢 = "bagaimana dengan …?". 呢 di akhir kalimat tanya membuatnya lebih lembut, dan bersama 在 menegaskan sedang berlangsung.',
          'en':
              'Noun + 呢 = "what about …?". At the end of a question 呢 softens it, and with 在 it stresses an ongoing action.',
        },
        examples: const [
          GuideExample('我 很 好 你 呢', {
            'id': 'saya baik, kamu bagaimana?',
            'en': 'I\'m fine, and you?',
          }, romaji: 'wǒ hěn hǎo nǐ ne'),
          GuideExample('我 的 手机 呢', {
            'id': 'HP saya mana ya?',
            'en': 'where\'s my phone?',
          }, romaji: 'wǒ de shǒujī ne'),
          GuideExample('他 在 睡觉 呢', {
            'id': 'dia sedang tidur',
            'en': 'he\'s sleeping',
          }, romaji: 'tā zài shuìjiào ne'),
        ],
      ),
      GuideSection(
        title: const {
          'id': '吧: ajakan & dugaan',
          'en': '吧: suggestions & assumptions',
        },
        body: const {
          'id':
              '吧 di akhir kalimat = ajakan ("… yuk") atau dugaan yang minta dibenarkan ("… kan?"). Lebih halus daripada perintah biasa.',
          'en':
              '吧 at the end = a suggestion ("let\'s …") or an assumption asking for confirmation ("… right?"). Softer than a plain command.',
        },
        examples: const [
          GuideExample('我们 走 吧', {
            'id': 'ayo kita pergi',
            'en': 'let\'s go',
          }, romaji: 'wǒmen zǒu ba'),
          GuideExample('你 是 学生 吧', {
            'id': 'kamu pelajar, kan?',
            'en': 'you\'re a student, right?',
          }, romaji: 'nǐ shì xuésheng ba'),
          GuideExample('你 试试 吧', {
            'id': 'coba saja',
            'en': 'give it a try',
          }, romaji: 'nǐ shìshi ba'),
        ],
      ),
      GuideSection(
        title: const {
          'id': '啊: seruan & pelembut',
          'en': '啊: exclamations & softening',
        },
        body: const {
          'id':
              '啊 menambah emosi atau membuat kalimat lebih ramah: kagum, setuju, mengingatkan. Bunyinya bisa berubah mengikuti suku sebelumnya (呀 ya, 哪 na).',
          'en':
              '啊 adds feeling or makes a sentence friendlier: amazement, agreement, reminders. Its sound may change after the previous syllable (呀 ya, 哪 na).',
        },
        examples: const [
          GuideExample('今天 好 热 啊', {
            'id': 'hari ini panas sekali!',
            'en': 'it\'s so hot today!',
          }, romaji: 'jīntiān hǎo rè a'),
          GuideExample('好 啊', {'id': 'boleh!', 'en': 'sure!'}, romaji: 'hǎo a'),
          GuideExample('你 快 来 啊', {
            'id': 'cepat datang dong!',
            'en': 'come quickly!',
          }, romaji: 'nǐ kuài lái a'),
        ],
      ),
    ],
  ),
];
