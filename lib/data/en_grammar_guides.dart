import '../models/guide.dart';

// Materi tata bahasa Inggris lanjutan: Tenses lengkap (urutan bagian
// mengikuti EnTense.sectionIndex di en_grammar.dart) dan Kata Fungsi.

/// Contoh kalimat; arti 'en' = kalimatnya sendiri (konvensi kursus Inggris).
GuideExample _ex(String en, String id) =>
    GuideExample(en, {'id': id, 'en': en});

final List<GuideTopic> kEnGrammarTopics = [
  GuideTopic(
    id: 'en_tenses',
    emoji: '🕐',
    title: const {'id': 'Tenses Lengkap', 'en': 'Complete Tenses'},
    subtitle: const {
      'id': '8 tenses utama: rumus, kapan dipakai, penanda waktu',
      'en': '8 main tenses: formulas, usage, time signals',
    },
    sections: [
      GuideSection(
        title: const {
          'id': 'Simple Present — kebiasaan & fakta',
          'en': 'Simple Present — habits & facts',
        },
        body: const {
          'id':
              "Rumus:\n"
              "(+) S + V1 (he/she/it: V1 + s/es)\n"
              "(−) S + do/does + not + V1\n"
              "(?) Do/Does + S + V1?\n\n"
              "Kapan dipakai: kebiasaan/rutinitas, fakta umum & kebenaran ilmiah, "
              "jadwal tetap (kereta, film), perasaan & keadaan (like, know, want).\n\n"
              "Penanda waktu: always, usually, often, sometimes, never, every day, "
              "on Mondays, once a week.\n\n"
              "Aturan -s/-es: work → works, watch → watches, go → goes, "
              "study → studies, have → has.\n\n"
              "Kesalahan umum: ✗ She go to school → ✓ She goes to school. "
              "✗ He doesn't works → ✓ He doesn't work (setelah does, V1 tanpa s).",
          'en':
              "Formula:\n"
              "(+) S + V1 (he/she/it: V1 + s/es)\n"
              "(−) S + do/does + not + V1\n"
              "(?) Do/Does + S + V1?\n\n"
              "Use: habits/routines, general facts & scientific truths, "
              "fixed schedules, feelings & states (like, know, want).\n\n"
              "Time signals: always, usually, often, sometimes, never, every day, "
              "on Mondays, once a week.\n\n"
              "-s/-es rule: work → works, watch → watches, go → goes, "
              "study → studies, have → has.\n\n"
              "Common mistakes: ✗ She go to school → ✓ She goes to school. "
              "✗ He doesn't works → ✓ He doesn't work.",
        },
        examples: [
          _ex('I drink coffee every morning.', 'Saya minum kopi setiap pagi.'),
          _ex(
            'Water boils at 100 degrees Celsius.',
            'Air mendidih pada suhu 100 derajat Celsius.',
          ),
          _ex('She does not eat meat.', 'Dia tidak makan daging.'),
          _ex(
            'Does the train leave at seven?',
            'Apakah keretanya berangkat jam tujuh?',
          ),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Present Continuous — sedang terjadi',
          'en': 'Present Continuous — happening now',
        },
        body: const {
          'id':
              "Rumus:\n"
              "(+) S + am/is/are + V-ing\n"
              "(−) S + am/is/are + not + V-ing\n"
              "(?) Am/Is/Are + S + V-ing?\n\n"
              "Kapan dipakai: kegiatan yang sedang berlangsung saat ini, "
              "keadaan sementara, perubahan yang sedang terjadi, dan rencana pasti "
              "di masa dekat (I'm meeting him tomorrow).\n\n"
              "Penanda waktu: now, right now, at the moment, currently, today, "
              "this week, Look!, Listen!\n\n"
              "Aturan -ing: make → making, run → running, lie → lying.\n\n"
              "Catatan: kata kerja keadaan (know, like, want, believe, own) "
              "biasanya TIDAK dipakai dalam bentuk -ing. "
              "✗ I am knowing → ✓ I know.",
          'en':
              "Formula:\n"
              "(+) S + am/is/are + V-ing\n"
              "(−) S + am/is/are + not + V-ing\n"
              "(?) Am/Is/Are + S + V-ing?\n\n"
              "Use: actions happening right now, temporary situations, "
              "changing trends, and fixed near-future plans "
              "(I'm meeting him tomorrow).\n\n"
              "Time signals: now, right now, at the moment, currently, today, "
              "this week, Look!, Listen!\n\n"
              "-ing rule: make → making, run → running, lie → lying.\n\n"
              "Note: state verbs (know, like, want, believe, own) are usually "
              "NOT used in -ing form. ✗ I am knowing → ✓ I know.",
        },
        examples: [
          _ex('She is cooking dinner now.', 'Dia sedang memasak makan malam.'),
          _ex('They are not working today.', 'Mereka tidak bekerja hari ini.'),
          _ex(
            'Are you studying for the exam?',
            'Apakah kamu sedang belajar untuk ujian?',
          ),
          _ex(
            'Prices are rising this year.',
            'Harga-harga sedang naik tahun ini.',
          ),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Present Perfect — sudah (hasilnya terasa sekarang)',
          'en': 'Present Perfect — done, with a present result',
        },
        body: const {
          'id':
              "Rumus:\n"
              "(+) S + have/has + V3\n"
              "(−) S + have/has + not + V3\n"
              "(?) Have/Has + S + V3?\n\n"
              "Kapan dipakai: pengalaman (pernah), kejadian yang baru selesai dan "
              "hasilnya masih terasa, keadaan yang dimulai di masa lalu dan "
              "masih berlanjut (for/since).\n\n"
              "Penanda waktu: already, just, yet, ever, never, recently, so far, "
              "for two years, since 2020.\n\n"
              "Beda dengan Simple Past: Present Perfect TIDAK memakai waktu "
              "lampau yang spesifik. ✗ I have seen him yesterday → "
              "✓ I saw him yesterday / ✓ I have seen him (sebelumnya).\n\n"
              "for = lamanya (for three years); since = titik awal (since Monday).",
          'en':
              "Formula:\n"
              "(+) S + have/has + V3\n"
              "(−) S + have/has + not + V3\n"
              "(?) Have/Has + S + V3?\n\n"
              "Use: life experiences, recently finished actions with a present "
              "result, situations that started in the past and continue "
              "(for/since).\n\n"
              "Time signals: already, just, yet, ever, never, recently, so far, "
              "for two years, since 2020.\n\n"
              "Unlike Simple Past, it is NOT used with a specific past time. "
              "✗ I have seen him yesterday → ✓ I saw him yesterday.\n\n"
              "for = duration (for three years); since = starting point "
              "(since Monday).",
        },
        examples: [
          _ex(
            'I have visited Japan twice.',
            'Saya sudah dua kali mengunjungi Jepang.',
          ),
          _ex(
            'She has just finished her homework.',
            'Dia baru saja menyelesaikan PR-nya.',
          ),
          _ex(
            'We have lived here since 2020.',
            'Kami sudah tinggal di sini sejak 2020.',
          ),
          _ex(
            'Have you ever eaten durian?',
            'Apakah kamu pernah makan durian?',
          ),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Present Perfect Continuous — sudah sedang (dan masih)',
          'en': 'Present Perfect Continuous — ongoing up to now',
        },
        body: const {
          'id':
              "Rumus:\n"
              "(+) S + have/has + been + V-ing\n"
              "(−) S + have/has + not + been + V-ing\n"
              "(?) Have/Has + S + been + V-ing?\n\n"
              "Kapan dipakai: kegiatan yang dimulai di masa lalu dan MASIH "
              "berlangsung (menekankan lamanya), atau baru berhenti dan "
              "akibatnya terlihat (You're wet — have you been running?).\n\n"
              "Penanda waktu: for, since, all day, how long, lately.\n\n"
              "Bandingkan: I have read the book (sudah selesai) vs "
              "I have been reading the book (masih membaca).",
          'en':
              "Formula:\n"
              "(+) S + have/has + been + V-ing\n"
              "(−) S + have/has + not + been + V-ing\n"
              "(?) Have/Has + S + been + V-ing?\n\n"
              "Use: activities that started in the past and are STILL going "
              "(stressing duration), or just stopped with visible effects "
              "(You're wet — have you been running?).\n\n"
              "Time signals: for, since, all day, how long, lately.\n\n"
              "Compare: I have read the book (finished) vs "
              "I have been reading the book (still reading).",
        },
        examples: [
          _ex(
            'I have been learning English for three years.',
            'Saya sudah belajar bahasa Inggris selama tiga tahun.',
          ),
          _ex(
            'It has been raining since this morning.',
            'Hujan sudah turun sejak tadi pagi.',
          ),
          _ex(
            'How long have you been waiting?',
            'Sudah berapa lama kamu menunggu?',
          ),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Simple Past — sudah terjadi di masa lalu',
          'en': 'Simple Past — finished in the past',
        },
        body: const {
          'id':
              "Rumus:\n"
              "(+) S + V2\n"
              "(−) S + did + not + V1\n"
              "(?) Did + S + V1?\n"
              "To be: was (I/he/she/it), were (you/we/they).\n\n"
              "Kapan dipakai: kejadian yang sudah selesai pada waktu tertentu di "
              "masa lalu, rangkaian kejadian dalam cerita.\n\n"
              "Penanda waktu: yesterday, last week, last year, ago, in 2019, "
              "when I was a child.\n\n"
              "V2 beraturan: + ed (work → worked, stop → stopped, study → studied). "
              "Tak beraturan harus dihafal (go → went, buy → bought, see → saw).\n\n"
              "Kesalahan umum: ✗ I didn't went → ✓ I didn't go "
              "(setelah did pakai V1).",
          'en':
              "Formula:\n"
              "(+) S + V2\n"
              "(−) S + did + not + V1\n"
              "(?) Did + S + V1?\n"
              "To be: was (I/he/she/it), were (you/we/they).\n\n"
              "Use: actions finished at a specific time in the past, "
              "sequences of events in a story.\n\n"
              "Time signals: yesterday, last week, last year, ago, in 2019, "
              "when I was a child.\n\n"
              "Regular V2: + ed (work → worked, stop → stopped, study → studied). "
              "Irregular ones must be memorized (go → went, buy → bought).\n\n"
              "Common mistake: ✗ I didn't went → ✓ I didn't go.",
        },
        examples: [
          _ex(
            'I watched a movie last night.',
            'Saya menonton film tadi malam.',
          ),
          _ex(
            'She bought a new phone yesterday.',
            'Dia membeli ponsel baru kemarin.',
          ),
          _ex(
            'We did not go to school last Monday.',
            'Kami tidak pergi ke sekolah Senin lalu.',
          ),
          _ex('Did you see the news?', 'Apakah kamu melihat beritanya?'),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Past Continuous — sedang terjadi di masa lalu',
          'en': 'Past Continuous — in progress in the past',
        },
        body: const {
          'id':
              "Rumus:\n"
              "(+) S + was/were + V-ing\n"
              "(−) S + was/were + not + V-ing\n"
              "(?) Was/Were + S + V-ing?\n\n"
              "Kapan dipakai: kegiatan yang sedang berlangsung pada saat tertentu "
              "di masa lalu, sering dipotong kejadian lain (Simple Past), atau "
              "dua kegiatan yang berlangsung bersamaan (while).\n\n"
              "Penanda waktu: at 8 p.m. yesterday, when, while, all morning.\n\n"
              "Pola umum: I was cooking WHEN the phone rang. "
              "WHILE I was cooking, the phone rang.",
          'en':
              "Formula:\n"
              "(+) S + was/were + V-ing\n"
              "(−) S + was/were + not + V-ing\n"
              "(?) Was/Were + S + V-ing?\n\n"
              "Use: an action in progress at a past moment, often interrupted by "
              "another action (Simple Past), or two simultaneous actions "
              "(while).\n\n"
              "Time signals: at 8 p.m. yesterday, when, while, all morning.\n\n"
              "Common pattern: I was cooking WHEN the phone rang.",
        },
        examples: [
          _ex(
            'I was cooking when the phone rang.',
            'Saya sedang memasak ketika telepon berdering.',
          ),
          _ex(
            'They were playing football at five o’clock.',
            'Mereka sedang bermain sepak bola pada jam lima.',
          ),
          _ex(
            'What were you doing last night?',
            'Apa yang sedang kamu lakukan tadi malam?',
          ),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Past Perfect — sudah terjadi sebelum kejadian lampau lain',
          'en': 'Past Perfect — before another past event',
        },
        body: const {
          'id':
              "Rumus:\n"
              "(+) S + had + V3\n"
              "(−) S + had + not + V3\n"
              "(?) Had + S + V3?\n\n"
              "Kapan dipakai: kejadian yang terjadi LEBIH DULU sebelum kejadian "
              "lain di masa lalu. Kejadian kedua biasanya memakai Simple Past.\n\n"
              "Penanda waktu: before, after, by the time, already, when.\n\n"
              "Contoh urutan: (1) The train left. (2) We arrived. → "
              "When we arrived, the train HAD already LEFT.",
          'en':
              "Formula:\n"
              "(+) S + had + V3\n"
              "(−) S + had + not + V3\n"
              "(?) Had + S + V3?\n\n"
              "Use: an action that happened EARLIER than another past action. "
              "The later action usually uses Simple Past.\n\n"
              "Time signals: before, after, by the time, already, when.\n\n"
              "Sequence: (1) The train left. (2) We arrived. → "
              "When we arrived, the train HAD already LEFT.",
        },
        examples: [
          _ex(
            'The movie had started before we arrived.',
            'Filmnya sudah dimulai sebelum kami tiba.',
          ),
          _ex(
            'She had never seen snow until last winter.',
            'Dia belum pernah melihat salju sampai musim dingin lalu.',
          ),
          _ex(
            'Had you finished the report by Friday?',
            'Apakah kamu sudah menyelesaikan laporannya sebelum Jumat?',
          ),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Simple Future — akan (will / be going to)',
          'en': 'Simple Future — will / be going to',
        },
        body: const {
          'id':
              "Rumus will:\n"
              "(+) S + will + V1\n"
              "(−) S + will not (won't) + V1\n"
              "(?) Will + S + V1?\n\n"
              "Rumus be going to:\n"
              "(+) S + am/is/are + going to + V1\n\n"
              "Kapan pakai WILL: keputusan spontan saat bicara (I'll help you), "
              "janji, tawaran, ramalan/pendapat (I think it will rain).\n"
              "Kapan pakai GOING TO: rencana yang sudah diputuskan sebelumnya "
              "(I'm going to study abroad), ramalan berdasarkan bukti "
              "(Look at the clouds — it's going to rain).\n\n"
              "Penanda waktu: tomorrow, next week, next year, soon, later, "
              "in two days, tonight.\n\n"
              "Kesalahan umum: ✗ I will to go → ✓ I will go.",
          'en':
              "WILL formula:\n"
              "(+) S + will + V1\n"
              "(−) S + will not (won't) + V1\n"
              "(?) Will + S + V1?\n\n"
              "BE GOING TO formula:\n"
              "(+) S + am/is/are + going to + V1\n\n"
              "Use WILL for: spontaneous decisions (I'll help you), promises, "
              "offers, predictions/opinions (I think it will rain).\n"
              "Use GOING TO for: plans decided earlier (I'm going to study "
              "abroad), predictions based on evidence (Look at the clouds — "
              "it's going to rain).\n\n"
              "Time signals: tomorrow, next week, next year, soon, later, "
              "in two days, tonight.\n\n"
              "Common mistake: ✗ I will to go → ✓ I will go.",
        },
        examples: [
          _ex('I will call you tomorrow.', 'Saya akan meneleponmu besok.'),
          _ex(
            'We are going to visit Bali next month.',
            'Kami akan mengunjungi Bali bulan depan.',
          ),
          _ex('It will not take long.', 'Itu tidak akan lama.'),
          _ex(
            'Will you come to the party?',
            'Apakah kamu akan datang ke pesta?',
          ),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'en_function_words',
    emoji: '🧩',
    title: const {
      'id': 'Kata Fungsi: Preposisi, Kata Bantu & Kata Sambung',
      'en': 'Function Words: Prepositions, Auxiliaries & Conjunctions',
    },
    subtitle: const {
      'id': 'in/on/at, to/for/of, is/have/do, can/must, and/but/because',
      'en': 'in/on/at, to/for/of, is/have/do, can/must, and/but/because',
    },
    sections: [
      GuideSection(
        title: const {
          'id': 'in / on / at — waktu',
          'en': 'in / on / at — time',
        },
        body: const {
          'id':
              "Dari yang paling luas ke paling sempit:\n"
              "IN = bulan, tahun, musim, abad, bagian hari (in May, in 2026, "
              "in summer, in the morning).\n"
              "ON = hari & tanggal (on Monday, on 17 August, on my birthday).\n"
              "AT = jam & titik waktu (at 7 o'clock, at noon, at night, "
              "at the weekend).",
          'en':
              "From widest to narrowest:\n"
              "IN = months, years, seasons, parts of the day (in May, in 2026, "
              "in the morning).\n"
              "ON = days & dates (on Monday, on 17 August).\n"
              "AT = clock times & points (at 7 o'clock, at noon, at night).",
        },
        examples: [
          _ex('My birthday is in May.', 'Ulang tahun saya di bulan Mei.'),
          _ex(
            'The meeting is on Monday at nine.',
            'Rapatnya hari Senin jam sembilan.',
          ),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'in / on / at — tempat',
          'en': 'in / on / at — place',
        },
        body: const {
          'id':
              "IN = di dalam ruang/wilayah (in the room, in Jakarta, "
              "in the box).\n"
              "ON = di atas permukaan / menempel (on the table, on the wall, "
              "on the second floor).\n"
              "AT = di titik/lokasi tertentu (at the station, at home, at work, "
              "at the door).",
          'en':
              "IN = inside a space/area (in the room, in Jakarta).\n"
              "ON = on a surface (on the table, on the wall, on the second "
              "floor).\n"
              "AT = at a specific point (at the station, at home, at work).",
        },
        examples: [
          _ex(
            'The keys are on the table in the kitchen.',
            'Kuncinya di atas meja di dapur.',
          ),
          _ex(
            'I will wait for you at the station.',
            'Saya akan menunggumu di stasiun.',
          ),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Preposisi lain — to, from, for, with, by, of, about',
          'en': 'Other prepositions — to, from, for, with, by, of, about',
        },
        body: const {
          'id':
              "TO = ke (arah); to + V1 = untuk (I came to help).\n"
              "FROM = dari (asal): from Bandung, from 9 to 5.\n"
              "FOR = untuk; selama: a gift for you, for two hours.\n"
              "WITH = dengan / bersama: with my friend, with a pen.\n"
              "BY = oleh (kalimat pasif); naik (by bus); paling lambat "
              "(by Friday).\n"
              "OF = dari / milik: a cup of tea, the capital of Japan.\n"
              "ABOUT = tentang; kira-kira: a book about history, about ten "
              "people.",
          'en':
              "TO = direction; to + V1 = in order to (I came to help).\n"
              "FROM = origin: from Bandung, from 9 to 5.\n"
              "FOR = purpose; duration: a gift for you, for two hours.\n"
              "WITH = together / using: with my friend, with a pen.\n"
              "BY = agent (passive); means (by bus); deadline (by Friday).\n"
              "OF = belonging/part: a cup of tea, the capital of Japan.\n"
              "ABOUT = topic; approximately: a book about history.",
        },
        examples: [
          _ex(
            'I bought this gift for you.',
            'Saya membeli hadiah ini untukmu.',
          ),
          _ex('She goes to work by train.', 'Dia pergi bekerja naik kereta.'),
          _ex(
            'This is a book about the history of Indonesia.',
            'Ini buku tentang sejarah Indonesia.',
          ),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Kata kerja bantu — be, do, have',
          'en': 'Auxiliary verbs — be, do, have',
        },
        body: const {
          'id':
              "BE (am/is/are/was/were): untuk continuous (is working), "
              "pasif (was built), dan kalimat tanpa kata kerja (She is a "
              "doctor).\n"
              "DO (do/does/did): untuk kalimat tanya & negatif Simple Present/Past "
              "(Do you like…? She doesn't…).\n"
              "HAVE (have/has/had): untuk perfect (have finished). Sebagai kata "
              "kerja biasa artinya \"punya\" (I have a car).\n\n"
              "Kata bantu yang menunjukkan waktu: is/are → sekarang, "
              "was/were/did/had → lampau, will → akan datang.",
          'en':
              "BE (am/is/are/was/were): continuous (is working), passive "
              "(was built), and sentences without a main verb (She is a "
              "doctor).\n"
              "DO (do/does/did): questions & negatives in Simple Present/Past "
              "(Do you like…? She doesn't…).\n"
              "HAVE (have/has/had): perfect tenses (have finished). As a main "
              "verb it means \"possess\" (I have a car).",
        },
        examples: [
          _ex(
            'The bridge was built in 1990.',
            'Jembatan itu dibangun pada tahun 1990.',
          ),
          _ex('Do you have a pen?', 'Apakah kamu punya pulpen?'),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Modal — can, will, should, must, may',
          'en': 'Modals — can, will, should, must, may',
        },
        body: const {
          'id':
              "Modal selalu diikuti V1 tanpa to dan tanpa -s:\n"
              "CAN = bisa / boleh (I can swim).\n"
              "COULD = bisa (lampau) / permintaan sopan (Could you help me?).\n"
              "WILL = akan; WOULD = akan (lampau) / sopan (I would like…).\n"
              "SHOULD = sebaiknya (saran).\n"
              "MUST = harus (kewajiban kuat); must not = dilarang.\n"
              "MAY / MIGHT = mungkin; may juga = boleh (sopan).\n\n"
              "Kesalahan umum: ✗ She can sings → ✓ She can sing. "
              "✗ You must to go → ✓ You must go.",
          'en':
              "Modals are always followed by V1 without to and without -s:\n"
              "CAN = ability / permission. COULD = past ability / polite "
              "request.\n"
              "WILL = future; WOULD = conditional / polite (I would like…).\n"
              "SHOULD = advice. MUST = strong obligation; must not = "
              "prohibited.\n"
              "MAY / MIGHT = possibility; may = polite permission.\n\n"
              "Common mistakes: ✗ She can sings → ✓ She can sing.",
        },
        examples: [
          _ex(
            'You should drink more water.',
            'Kamu sebaiknya minum lebih banyak air.',
          ),
          _ex('Students must wear a uniform.', 'Siswa harus memakai seragam.'),
          _ex(
            'Could you open the window, please?',
            'Bisakah kamu membuka jendelanya?',
          ),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Kata sambung — and, but, or, because, so, if, when',
          'en': 'Conjunctions — and, but, or, because, so, if, when',
        },
        body: const {
          'id':
              "AND = dan (menambah). BUT = tetapi (pertentangan). "
              "OR = atau (pilihan).\n"
              "BECAUSE = karena (alasan) ↔ SO = jadi/sehingga (akibat):\n"
              "  I was tired, so I slept early. = I slept early because I was "
              "tired.\n"
              "IF = jika (syarat). WHEN = ketika. WHILE = sementara/selagi. "
              "ALTHOUGH = meskipun.\n\n"
              "Kesalahan umum: jangan pakai because dan so sekaligus. "
              "✗ Because it rained, so we stayed home.",
          'en':
              "AND = adds. BUT = contrast. OR = choice.\n"
              "BECAUSE = reason ↔ SO = result:\n"
              "  I was tired, so I slept early. = I slept early because I was "
              "tired.\n"
              "IF = condition. WHEN = time. WHILE = during / whereas. "
              "ALTHOUGH = despite.\n\n"
              "Common mistake: don't use because and so together.",
        },
        examples: [
          _ex(
            'I stayed home because it was raining.',
            'Saya tinggal di rumah karena sedang hujan.',
          ),
          _ex(
            'It was raining, so we stayed home.',
            'Sedang hujan, jadi kami tinggal di rumah.',
          ),
          _ex(
            'If you study hard, you will pass the exam.',
            'Jika kamu belajar giat, kamu akan lulus ujian.',
          ),
        ],
      ),
    ],
  ),
];
