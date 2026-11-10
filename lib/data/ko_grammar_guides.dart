import '../models/guide.dart';

/// Topik tata bahasa Korea (Materi): tingkat bicara, kalimat dasar,
/// konjugasi, kala, negasi, permintaan, dan penghubung kalimat.
final List<GuideTopic> koGrammarTopics = [
  GuideTopic(
    id: 'ko_gr_speech_levels',
    emoji: '🎚️',
    title: const {'id': 'Tingkat Bicara', 'en': 'Speech Levels'},
    subtitle: const {
      'id': '반말 · 해요체 · 합니다체 — kapan memakai masing-masing',
      'en': '반말 · 해요체 · 합니다체 — when to use each',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Tiga tingkat bicara', 'en': 'Three speech levels'},
        body: const {
          'id':
              'Bahasa Korea mengubah akhiran kata kerja sesuai lawan bicara. Ada tiga tingkat yang paling sering dipakai: 합니다체 (formal sopan), 해요체 (sopan sehari-hari), dan 반말 (akrab/santai). Isi kalimatnya sama, hanya akhirannya yang berubah.',
          'en':
              'Korean changes the verb ending depending on who you are talking to. Three levels are used most often: 합니다체 (formal polite), 해요체 (everyday polite) and 반말 (casual/intimate). The content stays the same; only the ending changes.',
        },
        examples: const [
          GuideExample('밥을 먹습니다', {
            'id': 'Saya makan nasi (formal)',
            'en': 'I eat rice (formal)',
          }, romaji: 'babeul meokseumnida'),
          GuideExample('밥을 먹어요', {
            'id': 'Saya makan nasi (sopan)',
            'en': 'I eat rice (polite)',
          }, romaji: 'babeul meogeoyo'),
          GuideExample('밥 먹어', {
            'id': 'Aku makan nasi (santai)',
            'en': 'I eat rice (casual)',
          }, romaji: 'bap meogeo'),
          GuideExample('고맙습니다 · 고마워요 · 고마워', {
            'id': 'Terima kasih (formal · sopan · santai)',
            'en': 'Thank you (formal · polite · casual)',
          }, romaji: 'gomapseumnida · gomawoyo · gomawo'),
        ],
      ),
      GuideSection(
        title: const {'id': '합니다체 — formal', 'en': '합니다체 — formal'},
        body: const {
          'id':
              'Dipakai saat presentasi, berita, pengumuman, rapat, militer, dan saat bicara dengan atasan atau orang yang sangat dihormati. Batang berakhiran vokal + -ㅂ니다, berakhiran konsonan + -습니다. Bentuk tanyanya -ㅂ니까/-습니까.',
          'en':
              'Used in presentations, news, announcements, meetings, the military, and with superiors or highly respected people. A stem ending in a vowel takes -ㅂ니다, a stem ending in a consonant takes -습니다. The question form is -ㅂ니까/-습니까.',
        },
        examples: const [
          GuideExample('처음 뵙겠습니다', {
            'id': 'Senang bertemu Anda (perkenalan formal)',
            'en': 'Nice to meet you (formal)',
          }, romaji: 'cheoeum boepgetseumnida'),
          GuideExample('저는 인도네시아 사람입니다', {
            'id': 'Saya orang Indonesia',
            'en': 'I am Indonesian',
          }, romaji: 'jeoneun indonesia saramimnida'),
          GuideExample('회의는 세 시에 시작합니다', {
            'id': 'Rapat dimulai pukul tiga',
            'en': 'The meeting starts at three',
          }, romaji: 'hoeuineun se sie sijakamnida'),
          GuideExample('어디에 갑니까?', {
            'id': 'Anda pergi ke mana?',
            'en': 'Where are you going?',
          }, romaji: 'eodie gamnikka?'),
        ],
      ),
      GuideSection(
        title: const {
          'id': '해요체 — sopan sehari-hari',
          'en': '해요체 — everyday polite',
        },
        body: const {
          'id':
              'Tingkat yang paling aman dan paling sering dipakai: dengan orang yang baru dikenal, rekan kerja, penjual, atau orang yang lebih tua. Bentuknya batang + -아요/어요. Pernyataan, pertanyaan, dan ajakan memakai bentuk yang sama; bedanya hanya intonasi.',
          'en':
              'The safest and most common level: with new acquaintances, coworkers, shop staff or older people. The form is stem + -아요/어요. Statements, questions and suggestions share the same form; only the intonation differs.',
        },
        examples: const [
          GuideExample('어디 가요?', {
            'id': 'Mau ke mana? (nada naik)',
            'en': 'Where are you going? (rising tone)',
          }, romaji: 'eodi gayo?'),
          GuideExample('집에 가요', {
            'id': 'Saya pulang ke rumah',
            'en': 'I am going home',
          }, romaji: 'jibe gayo'),
          GuideExample('같이 가요', {
            'id': 'Ayo pergi bersama',
            'en': 'Let\'s go together',
          }, romaji: 'gachi gayo'),
          GuideExample('이거 맛있어요', {
            'id': 'Ini enak',
            'en': 'This is delicious',
          }, romaji: 'igeo masisseoyo'),
        ],
      ),
      GuideSection(
        title: const {'id': '반말 — santai', 'en': '반말 — casual'},
        body: const {
          'id':
              'Hapus 요 dari bentuk 해요체: 가요 → 가, 먹어요 → 먹어. Kata benda + 이에요/예요 menjadi 이야/야. Pakai hanya dengan teman akrab, adik, atau anak-anak; jangan dipakai kepada orang yang lebih tua atau orang yang belum akrab.',
          'en':
              'Drop 요 from the 해요체 form: 가요 → 가, 먹어요 → 먹어. Noun + 이에요/예요 becomes 이야/야. Use it only with close friends, younger siblings or children; never with older people or strangers.',
        },
        examples: const [
          GuideExample('어디 가?', {
            'id': 'Mau ke mana? (santai)',
            'en': 'Where are you going? (casual)',
          }, romaji: 'eodi ga?'),
          GuideExample('나 지금 집에 가', {
            'id': 'Aku pulang sekarang',
            'en': 'I\'m going home now',
          }, romaji: 'na jigeum jibe ga'),
          GuideExample('이거 뭐야?', {
            'id': 'Ini apa?',
            'en': 'What is this?',
          }, romaji: 'igeo mwoya?'),
          GuideExample('나는 학생이야', {
            'id': 'Aku pelajar',
            'en': 'I\'m a student',
          }, romaji: 'naneun haksaengiya'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Perbandingan & tips', 'en': 'Comparison & tips'},
        body: const {
          'id':
              'Dalam 합니다체 dan 해요체, "saya" adalah 저; dalam 반말 menjadi 나. Di tempat kerja, gunakan 해요체 dengan rekan, dan 합니다체 untuk laporan atau saat bicara dengan atasan. Kalau ragu, pilih 해요체.',
          'en':
              'In 합니다체 and 해요체, "I" is 저; in 반말 it becomes 나. At work, use 해요체 with coworkers and 합니다체 for reports or when speaking to a boss. When in doubt, choose 해요체.',
        },
        examples: const [
          GuideExample(
            '학생입니다 · 학생이에요 · 학생이야',
            {
              'id': '(Saya) pelajar — formal · sopan · santai',
              'en': '(I) am a student — formal · polite · casual',
            },
            romaji: 'haksaengimnida · haksaengieyo · haksaengiya',
          ),
          GuideExample('저는 괜찮아요', {
            'id': 'Saya baik-baik saja (sopan)',
            'en': 'I\'m fine (polite)',
          }, romaji: 'jeoneun gwaenchanayo'),
          GuideExample('나는 괜찮아', {
            'id': 'Aku baik-baik saja (santai)',
            'en': 'I\'m fine (casual)',
          }, romaji: 'naneun gwaenchana'),
          GuideExample('작업을 끝냈습니다', {
            'id': 'Pekerjaan sudah saya selesaikan (laporan)',
            'en': 'I have finished the work (report)',
          }, romaji: 'jageobeul kkeunnaetseumnida'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'ko_gr_basic',
    emoji: '🧱',
    title: const {'id': 'Kalimat Dasar', 'en': 'Basic Sentences'},
    subtitle: const {
      'id': '이에요/예요, 아니에요, 있어요/없어요',
      'en': '이에요/예요, 아니에요, 있어요/없어요',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Urutan kata S-O-P', 'en': 'Word order S-O-V'},
        body: const {
          'id':
              'Kalimat Korea berpola Subjek – Objek – Predikat: kata kerja selalu di akhir. Peran kata ditandai partikel (은/는, 이/가, 을/를, 에), jadi subjek yang sudah jelas sering dihilangkan.',
          'en':
              'Korean sentences follow Subject – Object – Verb: the verb always comes last. Particles (은/는, 이/가, 을/를, 에) mark each word\'s role, so an obvious subject is often dropped.',
        },
        examples: const [
          GuideExample('저는 밥을 먹어요', {
            'id': 'Saya makan nasi',
            'en': 'I eat rice',
          }, romaji: 'jeoneun babeul meogeoyo'),
          GuideExample('동생이 학교에 가요', {
            'id': 'Adik pergi ke sekolah',
            'en': 'My younger sibling goes to school',
          }, romaji: 'dongsaengi hakgyoe gayo'),
          GuideExample('저는 한국어를 공부해요', {
            'id': 'Saya belajar bahasa Korea',
            'en': 'I study Korean',
          }, romaji: 'jeoneun hangugeoreul gongbuhaeyo'),
          GuideExample('커피 마셔요?', {
            'id': '(Kamu) minum kopi?',
            'en': 'Do you drink coffee?',
          }, romaji: 'keopi masyeoyo?'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Kata benda + 이에요/예요', 'en': 'Noun + 이에요/예요'},
        body: const {
          'id':
              'Artinya "adalah". Kata benda berakhiran konsonan (ada 받침) + 이에요; berakhiran vokal + 예요. Bentuk formalnya 입니다. Untuk bertanya, cukup naikkan intonasi.',
          'en':
              'It means "to be". A noun ending in a consonant (with 받침) takes 이에요; one ending in a vowel takes 예요. The formal form is 입니다. To ask a question, just raise your intonation.',
        },
        examples: const [
          GuideExample('저는 회사원이에요', {
            'id': 'Saya karyawan kantor',
            'en': 'I am an office worker',
          }, romaji: 'jeoneun hoesawonieyo'),
          GuideExample('이건 의자예요', {
            'id': 'Ini kursi',
            'en': 'This is a chair',
          }, romaji: 'igeon uijayeyo'),
          GuideExample('제 이름은 아니타예요', {
            'id': 'Nama saya Anita',
            'en': 'My name is Anita',
          }, romaji: 'je ireumeun anitayeyo'),
          GuideExample('이거 뭐예요?', {
            'id': 'Ini apa?',
            'en': 'What is this?',
          }, romaji: 'igeo mwoyeyo?'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Kata benda + 이/가 아니에요', 'en': 'Noun + 이/가 아니에요'},
        body: const {
          'id':
              'Untuk menyangkal "bukan", pakai kata benda + 이/가 아니에요 (이 setelah konsonan, 가 setelah vokal). Bentuk formalnya 이/가 아닙니다.',
          'en':
              'To say "is not", use noun + 이/가 아니에요 (이 after a consonant, 가 after a vowel). The formal form is 이/가 아닙니다.',
        },
        examples: const [
          GuideExample('저는 학생이 아니에요', {
            'id': 'Saya bukan pelajar',
            'en': 'I am not a student',
          }, romaji: 'jeoneun haksaengi anieyo'),
          GuideExample('이건 커피가 아니에요', {
            'id': 'Ini bukan kopi',
            'en': 'This is not coffee',
          }, romaji: 'igeon keopiga anieyo'),
          GuideExample(
            '한국 사람이 아니에요. 인도네시아 사람이에요',
            {
              'id': 'Saya bukan orang Korea. Saya orang Indonesia',
              'en': 'I\'m not Korean. I\'m Indonesian',
            },
            romaji: 'hanguk sarami anieyo. indonesia saramieyo',
          ),
          GuideExample('제 가방이 아닙니다', {
            'id': 'Itu bukan tas saya (formal)',
            'en': 'It is not my bag (formal)',
          }, romaji: 'je gabangi animnida'),
        ],
      ),
      GuideSection(
        title: const {'id': '있어요 / 없어요', 'en': '있어요 / 없어요'},
        body: const {
          'id':
              '있어요 berarti "ada/punya", 없어요 berarti "tidak ada/tidak punya". Polanya: benda + 이/가 있어요. Untuk menyatakan letak: benda + 이/가 + tempat + 에 있어요.',
          'en':
              '있어요 means "there is / to have", 없어요 means "there isn\'t / not to have". Pattern: thing + 이/가 있어요. For location: thing + 이/가 + place + 에 있어요.',
        },
        examples: const [
          GuideExample('시간이 있어요?', {
            'id': 'Ada waktu?',
            'en': 'Do you have time?',
          }, romaji: 'sigani isseoyo?'),
          GuideExample('지금 돈이 없어요', {
            'id': 'Sekarang saya tidak punya uang',
            'en': 'I don\'t have money now',
          }, romaji: 'jigeum doni eopseoyo'),
          GuideExample('화장실이 어디에 있어요?', {
            'id': 'Toilet ada di mana?',
            'en': 'Where is the restroom?',
          }, romaji: 'hwajangsiri eodie isseoyo?'),
          GuideExample('책상 위에 책이 있어요', {
            'id': 'Ada buku di atas meja',
            'en': 'There is a book on the desk',
          }, romaji: 'chaeksang wie chaegi isseoyo'),
          GuideExample('저는 동생이 두 명 있어요', {
            'id': 'Saya punya dua adik',
            'en': 'I have two younger siblings',
          }, romaji: 'jeoneun dongsaengi du myeong isseoyo'),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Ini · itu: 이 · 그 · 저',
          'en': 'This · that: 이 · 그 · 저',
        },
        body: const {
          'id':
              '이 = ini (dekat pembicara), 그 = itu (dekat lawan bicara / yang sudah disebut), 저 = itu (jauh dari keduanya). 이것/그것/저것 berarti "benda ini/itu"; dalam percakapan disingkat 이거, 이건 (+은), 이게 (+이).',
          'en':
              '이 = this (near the speaker), 그 = that (near the listener / already mentioned), 저 = that over there (far from both). 이것/그것/저것 mean "this/that thing"; in speech they shorten to 이거, 이건 (+은), 이게 (+이).',
        },
        examples: const [
          GuideExample('이게 뭐예요?', {
            'id': 'Ini apa?',
            'en': 'What is this?',
          }, romaji: 'ige mwoyeyo?'),
          GuideExample('그건 제 가방이에요', {
            'id': 'Itu tas saya',
            'en': 'That is my bag',
          }, romaji: 'geugeon je gabangieyo'),
          GuideExample('저 사람은 누구예요?', {
            'id': 'Orang itu siapa?',
            'en': 'Who is that person?',
          }, romaji: 'jeo sarameun nuguyeyo?'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'ko_gr_present',
    emoji: '🔄',
    title: const {
      'id': 'Konjugasi Bentuk Kini',
      'en': 'Present Tense Conjugation',
    },
    subtitle: const {
      'id': '-아요/어요/해요 dan kata kerja tak beraturan',
      'en': '-아요/어요/해요 and irregular verbs',
    },
    sections: [
      GuideSection(
        title: const {
          'id': 'Aturan vokal: -아요 / -어요',
          'en': 'Vowel rule: -아요 / -어요',
        },
        body: const {
          'id':
              'Buang 다 untuk mendapatkan batang kata. Jika vokal terakhir batang adalah ㅏ atau ㅗ, tambahkan -아요; selain itu tambahkan -어요. Kata kerja dan kata sifat memakai aturan yang sama.',
          'en':
              'Remove 다 to get the stem. If the stem\'s last vowel is ㅏ or ㅗ, add -아요; otherwise add -어요. Verbs and adjectives follow the same rule.',
        },
        examples: const [
          GuideExample('살다 → 살아요', {
            'id': 'tinggal',
            'en': 'to live',
          }, romaji: 'salda → sarayo'),
          GuideExample('좋다 → 좋아요', {
            'id': 'bagus/suka',
            'en': 'to be good',
          }, romaji: 'jota → joayo'),
          GuideExample('먹다 → 먹어요', {
            'id': 'makan',
            'en': 'to eat',
          }, romaji: 'meokda → meogeoyo'),
          GuideExample('읽다 → 읽어요', {
            'id': 'membaca',
            'en': 'to read',
          }, romaji: 'ikda → ilgeoyo'),
          GuideExample('있다 → 있어요', {
            'id': 'ada',
            'en': 'to exist / have',
          }, romaji: 'itda → isseoyo'),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Batang berakhiran vokal',
          'en': 'Stems ending in a vowel',
        },
        body: const {
          'id':
              'Jika batang berakhiran vokal, vokalnya melebur: ㅏ + 아요 → ㅏ요 (가요), ㅗ + 아요 → ㅘ요 (와요), ㅜ + 어요 → ㅝ요, ㅣ + 어요 → ㅕ요. Batang berakhiran ㅓ, ㅐ, ㅔ cukup ditambah 요. 되다 menjadi 돼요.',
          'en':
              'When the stem ends in a vowel, the vowels merge: ㅏ + 아요 → ㅏ요 (가요), ㅗ + 아요 → ㅘ요 (와요), ㅜ + 어요 → ㅝ요, ㅣ + 어요 → ㅕ요. Stems ending in ㅓ, ㅐ, ㅔ just add 요. 되다 becomes 돼요.',
        },
        examples: const [
          GuideExample('가다 → 가요', {
            'id': 'pergi',
            'en': 'to go',
          }, romaji: 'gada → gayo'),
          GuideExample('오다 → 와요', {
            'id': 'datang',
            'en': 'to come',
          }, romaji: 'oda → wayo'),
          GuideExample('배우다 → 배워요', {
            'id': 'belajar (dari orang)',
            'en': 'to learn',
          }, romaji: 'baeuda → baewoyo'),
          GuideExample('마시다 → 마셔요', {
            'id': 'minum',
            'en': 'to drink',
          }, romaji: 'masida → masyeoyo'),
          GuideExample('보내다 → 보내요', {
            'id': 'mengirim',
            'en': 'to send',
          }, romaji: 'bonaeda → bonaeyo'),
        ],
      ),
      GuideSection(
        title: const {'id': '하다 → 해요', 'en': '하다 → 해요'},
        body: const {
          'id':
              'Semua kata yang berakhiran 하다 berubah menjadi 해요. Banyak kata kerja dibentuk dari kata benda + 하다 (공부 + 하다), jadi pola ini sangat sering dipakai. Bentuk formalnya 합니다.',
          'en':
              'Every word ending in 하다 becomes 해요. Many verbs are built from noun + 하다 (공부 + 하다), so this pattern is extremely common. The formal form is 합니다.',
        },
        examples: const [
          GuideExample('공부하다 → 공부해요', {
            'id': 'belajar',
            'en': 'to study',
          }, romaji: 'gongbuhada → gongbuhaeyo'),
          GuideExample('일하다 → 일해요', {
            'id': 'bekerja',
            'en': 'to work',
          }, romaji: 'ilhada → ilhaeyo'),
          GuideExample('운동하다 → 운동해요', {
            'id': 'berolahraga',
            'en': 'to exercise',
          }, romaji: 'undonghada → undonghaeyo'),
          GuideExample('깨끗하다 → 깨끗해요', {
            'id': 'bersih',
            'en': 'to be clean',
          }, romaji: 'kkaekkeutada → kkaekkeutaeyo'),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Tak beraturan ㅂ · ㄷ · ㅅ',
          'en': 'Irregular ㅂ · ㄷ · ㅅ',
        },
        body: const {
          'id':
              'ㅂ: banyak kata sifat ber-받침 ㅂ mengganti ㅂ dengan 우 → 워요 (돕다 dan 곱다 → 와요). ㄷ: beberapa kata kerja mengganti ㄷ dengan ㄹ sebelum vokal. ㅅ: beberapa kata membuang ㅅ sebelum vokal. Ada juga yang beraturan: 입다 → 입어요, 받다 → 받아요, 웃다 → 웃어요.',
          'en':
              'ㅂ: many adjectives with a ㅂ 받침 replace ㅂ with 우 → 워요 (돕다 and 곱다 → 와요). ㄷ: some verbs change ㄷ to ㄹ before a vowel. ㅅ: some words drop ㅅ before a vowel. Some stay regular: 입다 → 입어요, 받다 → 받아요, 웃다 → 웃어요.',
        },
        examples: const [
          GuideExample('춥다 → 추워요', {
            'id': 'dingin',
            'en': 'to be cold',
          }, romaji: 'chupda → chuwoyo'),
          GuideExample('돕다 → 도와요', {
            'id': 'membantu',
            'en': 'to help',
          }, romaji: 'dopda → dowayo'),
          GuideExample('듣다 → 들어요', {
            'id': 'mendengar',
            'en': 'to listen',
          }, romaji: 'deutda → deureoyo'),
          GuideExample('걷다 → 걸어요', {
            'id': 'berjalan kaki',
            'en': 'to walk',
          }, romaji: 'geotda → georeoyo'),
          GuideExample('낫다 → 나아요', {
            'id': 'sembuh',
            'en': 'to get better',
          }, romaji: 'natda → naayo'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Tak beraturan ㅡ · 르', 'en': 'Irregular ㅡ · 르'},
        body: const {
          'id':
              'ㅡ: vokal ㅡ hilang. Jika suku kata sebelumnya bervokal ㅏ/ㅗ, pakai -아요; selain itu -어요 (쓰다 → 써요). 르: 르 hilang dan ㄹ ditambahkan ke suku kata sebelumnya → ㄹ라요 / ㄹ러요.',
          'en':
              'ㅡ: the ㅡ vowel drops. If the previous syllable has ㅏ/ㅗ, use -아요; otherwise -어요 (쓰다 → 써요). 르: 르 drops and ㄹ is added to the previous syllable → ㄹ라요 / ㄹ러요.',
        },
        examples: const [
          GuideExample('쓰다 → 써요', {
            'id': 'menulis / memakai',
            'en': 'to write / to use',
          }, romaji: 'sseuda → sseoyo'),
          GuideExample('바쁘다 → 바빠요', {
            'id': 'sibuk',
            'en': 'to be busy',
          }, romaji: 'bappeuda → bappayo'),
          GuideExample('아프다 → 아파요', {
            'id': 'sakit',
            'en': 'to be sick / hurt',
          }, romaji: 'apeuda → apayo'),
          GuideExample('모르다 → 몰라요', {
            'id': 'tidak tahu',
            'en': 'to not know',
          }, romaji: 'moreuda → mollayo'),
          GuideExample('부르다 → 불러요', {
            'id': 'memanggil / menyanyi',
            'en': 'to call / to sing',
          }, romaji: 'bureuda → bulleoyo'),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Batang ㄹ · tak beraturan ㅎ',
          'en': 'ㄹ stems · irregular ㅎ',
        },
        body: const {
          'id':
              'ㄹ: dengan -아요/어요 tetap beraturan, tetapi ㄹ hilang sebelum ㄴ, ㅂ, ㅅ (압니다, 사세요). ㅎ: kata sifat warna dan 그렇다/어떻다 membuang ㅎ, lalu vokalnya menjadi ㅐ (하얗다 → 하얘요). 좋다 tetap beraturan: 좋아요.',
          'en':
              'ㄹ: regular with -아요/어요, but ㄹ drops before ㄴ, ㅂ, ㅅ (압니다, 사세요). ㅎ: color adjectives and 그렇다/어떻다 drop ㅎ and the vowel becomes ㅐ (하얗다 → 하얘요). 좋다 stays regular: 좋아요.',
        },
        examples: const [
          GuideExample('알다 → 알아요 · 압니다', {
            'id': 'tahu',
            'en': 'to know',
          }, romaji: 'alda → arayo · amnida'),
          GuideExample('살다 → 살아요 · 사세요', {
            'id': 'tinggal',
            'en': 'to live',
          }, romaji: 'salda → sarayo · saseyo'),
          GuideExample('그렇다 → 그래요', {
            'id': 'begitu / benar',
            'en': 'to be so',
          }, romaji: 'geureota → geuraeyo'),
          GuideExample('어떻다 → 어때요', {
            'id': 'bagaimana',
            'en': 'to be how',
          }, romaji: 'eotteota → eottaeyo'),
          GuideExample('빨갛다 → 빨개요', {
            'id': 'merah',
            'en': 'to be red',
          }, romaji: 'ppalgata → ppalgaeyo'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'ko_gr_tense',
    emoji: '⏳',
    title: const {
      'id': 'Lampau, Masa Depan & Progresif',
      'en': 'Past, Future & Progressive',
    },
    subtitle: const {
      'id': '-았/었어요, -(으)ㄹ 거예요, -고 있어요',
      'en': '-았/었어요, -(으)ㄹ 거예요, -고 있어요',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Lampau -았/었어요', 'en': 'Past -았/었어요'},
        body: const {
          'id':
              'Aturan vokalnya sama dengan bentuk kini: ㅏ/ㅗ → -았어요, lainnya → -었어요, 하다 → 했어요. Vokal juga melebur (가다 → 갔어요, 보다 → 봤어요) dan kata tak beraturan tetap berubah (춥다 → 추웠어요). Bentuk formalnya -았/었습니다.',
          'en':
              'The vowel rule is the same as the present: ㅏ/ㅗ → -았어요, others → -었어요, 하다 → 했어요. Vowels still merge (가다 → 갔어요, 보다 → 봤어요) and irregulars still change (춥다 → 추웠어요). The formal form is -았/었습니다.',
        },
        examples: const [
          GuideExample('어제 친구를 만났어요', {
            'id': 'Kemarin saya bertemu teman',
            'en': 'I met a friend yesterday',
          }, romaji: 'eoje chingureul mannasseoyo'),
          GuideExample('아침에 빵을 먹었어요', {
            'id': 'Pagi tadi saya makan roti',
            'en': 'I ate bread this morning',
          }, romaji: 'achime ppangeul meogeosseoyo'),
          GuideExample('주말에 청소했어요', {
            'id': 'Akhir pekan saya bersih-bersih',
            'en': 'I cleaned on the weekend',
          }, romaji: 'jumare cheongsohaesseoyo'),
          GuideExample('그 영화를 봤어요?', {
            'id': 'Sudah nonton film itu?',
            'en': 'Did you see that movie?',
          }, romaji: 'geu yeonghwareul bwasseoyo?'),
          GuideExample('어제는 너무 추웠어요', {
            'id': 'Kemarin dingin sekali',
            'en': 'It was really cold yesterday',
          }, romaji: 'eojeneun neomu chuwosseoyo'),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Lampau kata benda: 이었어요/였어요',
          'en': 'Past with nouns: 이었어요/였어요',
        },
        body: const {
          'id':
              'Kata benda berakhiran konsonan + 이었어요, berakhiran vokal + 였어요. Bentuk negatif lampaunya 이/가 아니었어요.',
          'en':
              'A noun ending in a consonant takes 이었어요; one ending in a vowel takes 였어요. The negative past is 이/가 아니었어요.',
        },
        examples: const [
          GuideExample('어제는 일요일이었어요', {
            'id': 'Kemarin hari Minggu',
            'en': 'Yesterday was Sunday',
          }, romaji: 'eojeneun iryoirieosseoyo'),
          GuideExample('그 사람은 제 친구였어요', {
            'id': 'Orang itu dulu teman saya',
            'en': 'That person was my friend',
          }, romaji: 'geu sarameun je chinguyeosseoyo'),
          GuideExample('어릴 때 꿈은 의사였어요', {
            'id': 'Cita-cita saya waktu kecil adalah dokter',
            'en': 'My childhood dream was to be a doctor',
          }, romaji: 'eoril ttae kkumeun uisayeosseoyo'),
          GuideExample('거짓말이 아니었어요', {
            'id': 'Itu bukan bohong',
            'en': 'It wasn\'t a lie',
          }, romaji: 'geojinmari anieosseoyo'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Masa depan -(으)ㄹ 거예요', 'en': 'Future -(으)ㄹ 거예요'},
        body: const {
          'id':
              'Menyatakan rencana atau dugaan. Batang berakhiran konsonan + -을 거예요; berakhiran vokal atau ㄹ + -ㄹ 거예요 (ㄹ tidak ditulis dua kali: 만들다 → 만들 거예요). Untuk orang ketiga atau cuaca, artinya sering "mungkin akan".',
          'en':
              'Expresses a plan or a guess. A stem ending in a consonant takes -을 거예요; a stem ending in a vowel or ㄹ takes -ㄹ 거예요 (ㄹ is not doubled: 만들다 → 만들 거예요). With third persons or the weather it often means "will probably".',
        },
        examples: const [
          GuideExample('내일 부산에 갈 거예요', {
            'id': 'Besok saya akan ke Busan',
            'en': 'I will go to Busan tomorrow',
          }, romaji: 'naeil busane gal geoyeyo'),
          GuideExample('저녁에 비빔밥을 먹을 거예요', {
            'id': 'Nanti malam saya akan makan bibimbap',
            'en': 'I\'ll have bibimbap for dinner',
          }, romaji: 'jeonyeoge bibimbabeul meogeul geoyeyo'),
          GuideExample('주말에는 집에서 쉴 거예요', {
            'id': 'Akhir pekan saya akan istirahat di rumah',
            'en': 'I\'ll rest at home on the weekend',
          }, romaji: 'jumareneun jibeseo swil geoyeyo'),
          GuideExample('내년에 한국에서 일할 거예요', {
            'id': 'Tahun depan saya akan bekerja di Korea',
            'en': 'I will work in Korea next year',
          }, romaji: 'naenyeone hangugeseo ilhal geoyeyo'),
          GuideExample('오후에 비가 올 거예요', {
            'id': 'Sore nanti mungkin akan hujan',
            'en': 'It will probably rain this afternoon',
          }, romaji: 'ohue biga ol geoyeyo'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Progresif -고 있어요', 'en': 'Progressive -고 있어요'},
        body: const {
          'id':
              'Batang + -고 있어요 berarti "sedang …". Tidak ada aturan vokal; cukup tempel -고 있어요 pada batang. Untuk "tadi sedang …" pakai -고 있었어요.',
          'en':
              'Stem + -고 있어요 means "is …-ing". There is no vowel rule; just attach -고 있어요 to the stem. For "was …-ing" use -고 있었어요.',
        },
        examples: const [
          GuideExample('지금 공부하고 있어요', {
            'id': 'Saya sedang belajar sekarang',
            'en': 'I am studying now',
          }, romaji: 'jigeum gongbuhago isseoyo'),
          GuideExample('동생이 텔레비전을 보고 있어요', {
            'id': 'Adik sedang menonton TV',
            'en': 'My younger sibling is watching TV',
          }, romaji: 'dongsaengi tellebijeoneul bogo isseoyo'),
          GuideExample('밖에 비가 오고 있어요', {
            'id': 'Di luar sedang hujan',
            'en': 'It is raining outside',
          }, romaji: 'bakke biga ogo isseoyo'),
          GuideExample(
            '그때 저는 밥을 먹고 있었어요',
            {
              'id': 'Waktu itu saya sedang makan',
              'en': 'I was eating at that time',
            },
            romaji: 'geuttae jeoneun babeul meokgo isseosseoyo',
          ),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Tiga waktu dalam satu kata',
          'en': 'Three tenses of one verb',
        },
        body: const {
          'id':
              'Kata keterangan waktu membantu memilih bentuk: 어제/지난주 → lampau, 오늘/지금 → kini, 내일/다음 주 → masa depan. Bentuk kini (-아요/어요) juga bisa dipakai untuk rencana yang sudah pasti dalam waktu dekat.',
          'en':
              'Time words help you pick the form: 어제/지난주 → past, 오늘/지금 → present, 내일/다음 주 → future. The present form (-아요/어요) can also express a fixed plan in the near future.',
        },
        examples: const [
          GuideExample('지난주에 서울에 갔어요', {
            'id': 'Minggu lalu saya pergi ke Seoul',
            'en': 'I went to Seoul last week',
          }, romaji: 'jinanjue seoure gasseoyo'),
          GuideExample('오늘은 회사에 가요', {
            'id': 'Hari ini saya ke kantor',
            'en': 'I\'m going to the office today',
          }, romaji: 'oneureun hoesae gayo'),
          GuideExample('다음 주에 고향에 갈 거예요', {
            'id': 'Minggu depan saya akan pulang kampung',
            'en': 'I will go to my hometown next week',
          }, romaji: 'daeum jue gohyange gal geoyeyo'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'ko_gr_negation',
    emoji: '🚫',
    title: const {'id': 'Negasi & Larangan', 'en': 'Negation & Prohibition'},
    subtitle: const {
      'id': '안, 못, -지 않아요, -지 마세요',
      'en': '안, 못, -지 않아요, -지 마세요',
    },
    sections: [
      GuideSection(
        title: const {'id': '안 + kata kerja', 'en': '안 + verb'},
        body: const {
          'id':
              'Letakkan 안 tepat sebelum kata kerja/sifat untuk berarti "tidak" (karena pilihan atau keadaan). Untuk kata kerja kata benda + 하다, 안 masuk di tengah: 운동 안 해요. Kata sifat 하다 tetap utuh: 안 깨끗해요.',
          'en':
              'Put 안 right before the verb/adjective to mean "not" (by choice or state). With noun + 하다 verbs, 안 goes in the middle: 운동 안 해요. 하다 adjectives stay whole: 안 깨끗해요.',
        },
        examples: const [
          GuideExample('저는 고기를 안 먹어요', {
            'id': 'Saya tidak makan daging',
            'en': 'I don\'t eat meat',
          }, romaji: 'jeoneun gogireul an meogeoyo'),
          GuideExample('오늘은 회사에 안 가요', {
            'id': 'Hari ini saya tidak ke kantor',
            'en': 'I\'m not going to the office today',
          }, romaji: 'oneureun hoesae an gayo'),
          GuideExample('어제는 운동 안 했어요', {
            'id': 'Kemarin saya tidak berolahraga',
            'en': 'I didn\'t exercise yesterday',
          }, romaji: 'eojeneun undong an haesseoyo'),
          GuideExample('이 김치는 안 매워요', {
            'id': 'Kimchi ini tidak pedas',
            'en': 'This kimchi isn\'t spicy',
          }, romaji: 'i gimchineun an maewoyo'),
        ],
      ),
      GuideSection(
        title: const {'id': '-지 않아요', 'en': '-지 않아요'},
        body: const {
          'id':
              'Batang + -지 않아요 artinya sama dengan 안, tetapi terdengar sedikit lebih resmi dan sering dipakai dalam tulisan. Bisa dipakai dengan semua kata kerja dan kata sifat. Lampaunya -지 않았어요.',
          'en':
              'Stem + -지 않아요 means the same as 안 but sounds a little more formal and is common in writing. It works with every verb and adjective. The past is -지 않았어요.',
        },
        examples: const [
          GuideExample('날씨가 덥지 않아요', {
            'id': 'Cuacanya tidak panas',
            'en': 'The weather isn\'t hot',
          }, romaji: 'nalssiga deopji anayo'),
          GuideExample('저는 술을 마시지 않아요', {
            'id': 'Saya tidak minum alkohol',
            'en': 'I don\'t drink alcohol',
          }, romaji: 'jeoneun sureul masiji anayo'),
          GuideExample('그 식당은 비싸지 않아요', {
            'id': 'Restoran itu tidak mahal',
            'en': 'That restaurant isn\'t expensive',
          }, romaji: 'geu sikdangeun bissaji anayo'),
          GuideExample('어제는 일하지 않았어요', {
            'id': 'Kemarin saya tidak bekerja',
            'en': 'I didn\'t work yesterday',
          }, romaji: 'eojeneun ilhaji anasseoyo'),
        ],
      ),
      GuideSection(
        title: const {'id': '못 / -지 못해요', 'en': '못 / -지 못해요'},
        body: const {
          'id':
              '못 berarti "tidak bisa": tidak mampu atau terhalang keadaan. Posisinya sama dengan 안, dan bentuk panjangnya -지 못해요. 못 hanya dipakai dengan kata kerja, tidak dengan kata sifat. Pelafalannya berubah: 못 먹어요 [몬머거요], 못 해요 [모태요].',
          'en':
              '못 means "cannot": unable, or prevented by circumstances. It sits where 안 does, and the long form is -지 못해요. 못 is used only with verbs, not adjectives. Pronunciation changes: 못 먹어요 [몬머거요], 못 해요 [모태요].',
        },
        examples: const [
          GuideExample('저는 수영을 못 해요', {
            'id': 'Saya tidak bisa berenang',
            'en': 'I can\'t swim',
          }, romaji: 'jeoneun suyeongeul motaeyo'),
          GuideExample('매운 음식을 못 먹어요', {
            'id': 'Saya tidak bisa makan makanan pedas',
            'en': 'I can\'t eat spicy food',
          }, romaji: 'maeun eumsigeul mon meogeoyo'),
          GuideExample('바빠서 못 가요', {
            'id': 'Saya sibuk, jadi tidak bisa datang',
            'en': 'I\'m busy, so I can\'t go',
          }, romaji: 'bappaseo mot gayo'),
          GuideExample('어제 잠을 잘 자지 못했어요', {
            'id': 'Semalam saya tidak bisa tidur nyenyak',
            'en': 'I couldn\'t sleep well last night',
          }, romaji: 'eoje jameul jal jaji motaesseoyo'),
        ],
      ),
      GuideSection(
        title: const {'id': '안 vs 못', 'en': '안 vs 못'},
        body: const {
          'id':
              '안 = tidak mau / memang tidak (pilihan sendiri). 못 = ingin tetapi tidak bisa (kemampuan atau keadaan). Untuk menolak dengan sopan, 못 terdengar lebih halus karena menunjukkan ada halangan.',
          'en':
              '안 = won\'t / simply don\'t (own choice). 못 = want to but can\'t (ability or circumstances). When declining politely, 못 sounds softer because it implies something is in the way.',
        },
        examples: const [
          GuideExample('오늘 회의에 안 가요', {
            'id': 'Saya tidak ikut rapat hari ini (memilih tidak)',
            'en': 'I\'m not going to today\'s meeting (by choice)',
          }, romaji: 'oneul hoeuie an gayo'),
          GuideExample('오늘 회의에 못 가요', {
            'id': 'Saya tidak bisa ikut rapat hari ini',
            'en': 'I can\'t make it to today\'s meeting',
          }, romaji: 'oneul hoeuie mot gayo'),
          GuideExample('커피를 안 마셔요', {
            'id': 'Saya tidak minum kopi (tidak mau)',
            'en': 'I don\'t drink coffee (choose not to)',
          }, romaji: 'keopireul an masyeoyo'),
          GuideExample('커피를 못 마셔요', {
            'id': 'Saya tidak bisa minum kopi',
            'en': 'I can\'t drink coffee',
          }, romaji: 'keopireul mon masyeoyo'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Larangan -지 마세요', 'en': 'Prohibition -지 마세요'},
        body: const {
          'id':
              'Batang + -지 마세요 berarti "jangan …" secara sopan. Dalam 반말 menjadi -지 마, dan pada papan peringatan atau pengumuman formal menjadi -지 마십시오. Pola ini sering muncul di tempat kerja dan rambu keselamatan.',
          'en':
              'Stem + -지 마세요 means "please don\'t …". In 반말 it is -지 마, and on signs or formal notices it is -지 마십시오. It is very common at work and on safety signs.',
        },
        examples: const [
          GuideExample('여기에서 담배를 피우지 마세요', {
            'id': 'Jangan merokok di sini',
            'en': 'Please don\'t smoke here',
          }, romaji: 'yeogieseo dambaereul piuji maseyo'),
          GuideExample('걱정하지 마세요', {
            'id': 'Jangan khawatir',
            'en': 'Don\'t worry',
          }, romaji: 'geokjeonghaji maseyo'),
          GuideExample('기계를 만지지 마세요', {
            'id': 'Jangan menyentuh mesin',
            'en': 'Don\'t touch the machine',
          }, romaji: 'gigyereul manjiji maseyo'),
          GuideExample('사진을 찍지 마십시오', {
            'id': 'Dilarang memotret',
            'en': 'Do not take photos',
          }, romaji: 'sajineul jjikji masipsio'),
          GuideExample('늦지 마', {
            'id': 'Jangan telat ya (santai)',
            'en': 'Don\'t be late (casual)',
          }, romaji: 'neutji ma'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'ko_gr_requests',
    emoji: '🙏',
    title: const {'id': 'Permintaan & Keinginan', 'en': 'Requests & Wishes'},
    subtitle: const {
      'id': '-(으)세요, -아/어 주세요, -고 싶어요, -(으)ㄹ 수 있어요, -아/어야 해요',
      'en': '-(으)세요, -아/어 주세요, -고 싶어요, -(으)ㄹ 수 있어요, -아/어야 해요',
    },
    sections: [
      GuideSection(
        title: const {
          'id': 'Perintah sopan -(으)세요',
          'en': 'Polite command -(으)세요',
        },
        body: const {
          'id':
              'Batang berakhiran konsonan + -으세요, berakhiran vokal + -세요; batang ㄹ membuang ㄹ (살다 → 사세요). Beberapa kata punya bentuk hormat khusus: 먹다/마시다 → 드세요, 자다 → 주무세요, 있다 → 계세요.',
          'en':
              'A stem ending in a consonant takes -으세요, one ending in a vowel takes -세요; ㄹ stems drop ㄹ (살다 → 사세요). Some verbs have special honorific forms: 먹다/마시다 → 드세요, 자다 → 주무세요, 있다 → 계세요.',
        },
        examples: const [
          GuideExample('여기 앉으세요', {
            'id': 'Silakan duduk di sini',
            'en': 'Please sit here',
          }, romaji: 'yeogi anjeuseyo'),
          GuideExample('이쪽으로 오세요', {
            'id': 'Silakan ke sebelah sini',
            'en': 'Please come this way',
          }, romaji: 'ijjogeuro oseyo'),
          GuideExample('맛있게 드세요', {
            'id': 'Selamat makan',
            'en': 'Enjoy your meal',
          }, romaji: 'masitge deuseyo'),
          GuideExample('안녕히 주무세요', {
            'id': 'Selamat tidur',
            'en': 'Good night',
          }, romaji: 'annyeonghi jumuseyo'),
          GuideExample('안녕히 계세요', {
            'id': 'Sampai jumpa (kepada yang tinggal)',
            'en': 'Goodbye (to someone staying)',
          }, romaji: 'annyeonghi gyeseyo'),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Meminta tolong -아/어 주세요',
          'en': 'Asking a favor -아/어 주세요',
        },
        body: const {
          'id':
              'Bentuk -아/어 (aturan vokal yang sama dengan -아요/어요) + 주세요 berarti "tolong … (untuk saya)". Untuk meminta barang, cukup kata benda + 주세요. Tambahkan 좀 agar terdengar lebih lembut.',
          'en':
              'The -아/어 form (same vowel rule as -아요/어요) + 주세요 means "please … (for me)". To ask for an item, just say noun + 주세요. Adding 좀 makes it softer.',
        },
        examples: const [
          GuideExample('물 좀 주세요', {
            'id': 'Tolong minta air',
            'en': 'Some water, please',
          }, romaji: 'mul jom juseyo'),
          GuideExample('다시 한번 말해 주세요', {
            'id': 'Tolong ulangi sekali lagi',
            'en': 'Please say it once more',
          }, romaji: 'dasi hanbeon malhae juseyo'),
          GuideExample('천천히 말해 주세요', {
            'id': 'Tolong bicara pelan-pelan',
            'en': 'Please speak slowly',
          }, romaji: 'cheoncheonhi malhae juseyo'),
          GuideExample('문 좀 닫아 주세요', {
            'id': 'Tolong tutup pintunya',
            'en': 'Please close the door',
          }, romaji: 'mun jom dada juseyo'),
          GuideExample('이것 좀 도와주세요', {
            'id': 'Tolong bantu saya dengan ini',
            'en': 'Please help me with this',
          }, romaji: 'igeot jom dowajuseyo'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Keinginan -고 싶어요', 'en': 'Wish -고 싶어요'},
        body: const {
          'id':
              'Batang + -고 싶어요 berarti "ingin …" untuk diri sendiri atau lawan bicara (dalam pertanyaan). Untuk orang ketiga, pakai -고 싶어 해요. Lampaunya -고 싶었어요.',
          'en':
              'Stem + -고 싶어요 means "want to …" for yourself or, in questions, the listener. For a third person, use -고 싶어 해요. The past is -고 싶었어요.',
        },
        examples: const [
          GuideExample('한국에 가고 싶어요', {
            'id': 'Saya ingin pergi ke Korea',
            'en': 'I want to go to Korea',
          }, romaji: 'hanguge gago sipeoyo'),
          GuideExample('뭐 먹고 싶어요?', {
            'id': 'Mau makan apa?',
            'en': 'What do you want to eat?',
          }, romaji: 'mwo meokgo sipeoyo?'),
          GuideExample('오늘은 집에서 쉬고 싶어요', {
            'id': 'Hari ini saya ingin istirahat di rumah',
            'en': 'I want to rest at home today',
          }, romaji: 'oneureun jibeseo swigo sipeoyo'),
          GuideExample('동생은 가수가 되고 싶어 해요', {
            'id': 'Adik saya ingin menjadi penyanyi',
            'en': 'My younger sibling wants to become a singer',
          }, romaji: 'dongsaengeun gasuga doego sipeo haeyo'),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Bisa / tidak bisa -(으)ㄹ 수 있어요/없어요',
          'en': 'Can / cannot -(으)ㄹ 수 있어요/없어요',
        },
        body: const {
          'id':
              'Batang berakhiran konsonan + -을 수 있어요, berakhiran vokal atau ㄹ + -ㄹ 수 있어요. Ganti 있어요 dengan 없어요 untuk "tidak bisa". Pola ini menyatakan kemampuan maupun kemungkinan/izin.',
          'en':
              'A stem ending in a consonant takes -을 수 있어요; one ending in a vowel or ㄹ takes -ㄹ 수 있어요. Replace 있어요 with 없어요 for "cannot". It expresses both ability and possibility/permission.',
        },
        examples: const [
          GuideExample(
            '저는 한국어를 조금 할 수 있어요',
            {
              'id': 'Saya bisa sedikit bahasa Korea',
              'en': 'I can speak a little Korean',
            },
            romaji: 'jeoneun hangugeoreul jogeum hal su isseoyo',
          ),
          GuideExample('운전할 수 있어요?', {
            'id': 'Kamu bisa menyetir?',
            'en': 'Can you drive?',
          }, romaji: 'unjeonhal su isseoyo?'),
          GuideExample('내일은 올 수 없어요', {
            'id': 'Besok saya tidak bisa datang',
            'en': 'I can\'t come tomorrow',
          }, romaji: 'naeireun ol su eopseoyo'),
          GuideExample('여기에서 사진을 찍을 수 없어요', {
            'id': 'Di sini tidak boleh memotret',
            'en': 'You can\'t take photos here',
          }, romaji: 'yeogieseo sajineul jjigeul su eopseoyo'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Keharusan -아/어야 해요', 'en': 'Obligation -아/어야 해요'},
        body: const {
          'id':
              'Bentuk -아/어 + 야 해요 berarti "harus …". Dalam percakapan, -아/어야 돼요 juga sangat umum dengan arti yang sama. Lampaunya -아/어야 했어요.',
          'en':
              'The -아/어 form + 야 해요 means "have to …". In conversation, -아/어야 돼요 is just as common with the same meaning. The past is -아/어야 했어요.',
        },
        examples: const [
          GuideExample('내일 일찍 일어나야 해요', {
            'id': 'Besok saya harus bangun pagi',
            'en': 'I have to get up early tomorrow',
          }, romaji: 'naeil iljjik ireonaya haeyo'),
          GuideExample(
            '공장에서는 안전모를 써야 해요',
            {
              'id': 'Di pabrik harus memakai helm pengaman',
              'en': 'You must wear a safety helmet in the factory',
            },
            romaji: 'gongjangeseoneun anjeonmoreul sseoya haeyo',
          ),
          GuideExample('하루에 세 번 약을 먹어야 해요', {
            'id': 'Obatnya harus diminum tiga kali sehari',
            'en': 'You have to take the medicine three times a day',
          }, romaji: 'harue se beon yageul meogeoya haeyo'),
          GuideExample('오늘까지 보고서를 써야 돼요', {
            'id': 'Laporannya harus saya tulis hari ini',
            'en': 'I have to write the report by today',
          }, romaji: 'oneulkkaji bogoseoreul sseoya dwaeyo'),
        ],
      ),
    ],
  ),
  GuideTopic(
    id: 'ko_gr_connectors',
    emoji: '🔗',
    title: const {'id': 'Penghubung Kalimat', 'en': 'Connecting Sentences'},
    subtitle: const {
      'id': '-고, -지만, -아/어서, -(으)니까, -(으)면, -(으)려고',
      'en': '-고, -지만, -아/어서, -(으)니까, -(으)면, -(으)려고',
    },
    sections: [
      GuideSection(
        title: const {'id': '-고: dan, lalu', 'en': '-고: and, and then'},
        body: const {
          'id':
              'Batang + -고 menggabungkan dua kalimat ("dan") atau dua tindakan berurutan ("lalu"). Penanda waktu (lampau/masa depan) biasanya cukup diletakkan pada kata kerja terakhir. Kata benda memakai -이고/고.',
          'en':
              'Stem + -고 joins two clauses ("and") or two actions in sequence ("and then"). Tense is usually marked only on the final verb. Nouns take -이고/고.',
        },
        examples: const [
          GuideExample('저는 밥을 먹고 커피를 마셔요', {
            'id': 'Saya makan lalu minum kopi',
            'en': 'I eat and then drink coffee',
          }, romaji: 'jeoneun babeul meokgo keopireul masyeoyo'),
          GuideExample('이 식당은 싸고 맛있어요', {
            'id': 'Restoran ini murah dan enak',
            'en': 'This restaurant is cheap and tasty',
          }, romaji: 'i sikdangeun ssago masisseoyo'),
          GuideExample('손을 씻고 밥을 먹었어요', {
            'id': 'Saya cuci tangan lalu makan',
            'en': 'I washed my hands and ate',
          }, romaji: 'soneul ssitgo babeul meogeosseoyo'),
          GuideExample(
            '형은 회사원이고 저는 학생이에요',
            {
              'id': 'Kakak saya karyawan, dan saya pelajar',
              'en': 'My older brother is an office worker and I am a student',
            },
            romaji: 'hyeongeun hoesawonigo jeoneun haksaengieyo',
          ),
        ],
      ),
      GuideSection(
        title: const {'id': '-지만: tetapi', 'en': '-지만: but'},
        body: const {
          'id':
              'Batang + -지만 berarti "tetapi" dan menghubungkan dua hal yang berlawanan. Bisa didahului penanda lampau: -았/었지만.',
          'en':
              'Stem + -지만 means "but" and links two contrasting ideas. It can follow the past marker: -았/었지만.',
        },
        examples: const [
          GuideExample('한국어는 어렵지만 재미있어요', {
            'id': 'Bahasa Korea sulit, tetapi menyenangkan',
            'en': 'Korean is hard but fun',
          }, romaji: 'hangugeoneun eoryeopjiman jaemiisseoyo'),
          GuideExample('이 옷은 비싸지만 예뻐요', {
            'id': 'Baju ini mahal, tetapi bagus',
            'en': 'These clothes are expensive but pretty',
          }, romaji: 'i oseun bissajiman yeppeoyo'),
          GuideExample(
            '어제는 바빴지만 오늘은 한가해요',
            {
              'id': 'Kemarin sibuk, tetapi hari ini santai',
              'en': 'I was busy yesterday, but today I\'m free',
            },
            romaji: 'eojeneun bappatjiman oneureun hangahaeyo',
          ),
          GuideExample('키는 작지만 힘이 세요', {
            'id': 'Badannya pendek, tetapi kuat',
            'en': 'He is short but strong',
          }, romaji: 'kineun jakjiman himi seyo'),
        ],
      ),
      GuideSection(
        title: const {
          'id': '-아/어서: karena, lalu',
          'en': '-아/어서: because, and then',
        },
        body: const {
          'id':
              'Bentuk -아/어 + 서 menyatakan alasan ("karena") atau urutan tindakan yang berkaitan ("lalu", misalnya pergi ke suatu tempat lalu melakukan sesuatu di sana). Tidak boleh diberi penanda lampau sebelum -서, dan tidak dipakai dengan perintah/ajakan. Kata benda memakai -이라서/라서.',
          'en':
              'The -아/어 form + 서 gives a reason ("because") or a linked sequence ("and then", e.g. go somewhere and do something there). No past marker before -서, and it is not used with commands or suggestions. Nouns take -이라서/라서.',
        },
        examples: const [
          GuideExample('배가 아파서 병원에 갔어요', {
            'id': 'Karena sakit perut, saya pergi ke rumah sakit',
            'en': 'I went to the hospital because my stomach hurt',
          }, romaji: 'baega apaseo byeongwone gasseoyo'),
          GuideExample('늦어서 죄송합니다', {
            'id': 'Maaf saya terlambat',
            'en': 'Sorry I\'m late',
          }, romaji: 'neujeoseo joesonghamnida'),
          GuideExample('시간이 없어서 택시를 탔어요', {
            'id': 'Karena tidak ada waktu, saya naik taksi',
            'en': 'I took a taxi because I had no time',
          }, romaji: 'sigani eopseoseo taeksireul tasseoyo'),
          GuideExample(
            '친구를 만나서 영화를 봤어요',
            {
              'id': 'Saya bertemu teman lalu (bersama dia) menonton film',
              'en': 'I met a friend and we watched a movie',
            },
            romaji: 'chingureul mannaseo yeonghwareul bwasseoyo',
          ),
        ],
      ),
      GuideSection(
        title: const {
          'id': '-(으)니까: karena (dengan perintah/ajakan)',
          'en': '-(으)니까: because (with commands/suggestions)',
        },
        body: const {
          'id':
              'Batang berakhiran konsonan + -으니까, berakhiran vokal atau ㄹ + -니까. Berbeda dengan -아/어서, -(으)니까 boleh diikuti perintah atau ajakan, dan boleh didahului penanda lampau (-았/었으니까).',
          'en':
              'A stem ending in a consonant takes -으니까; one ending in a vowel or ㄹ takes -니까. Unlike -아/어서, -(으)니까 can be followed by commands or suggestions and can take the past marker (-았/었으니까).',
        },
        examples: const [
          GuideExample('비가 오니까 우산을 가져가세요', {
            'id': 'Sedang hujan, jadi bawalah payung',
            'en': 'It\'s raining, so take an umbrella',
          }, romaji: 'biga onikka usaneul gajyeogaseyo'),
          GuideExample('위험하니까 만지지 마세요', {
            'id': 'Berbahaya, jadi jangan disentuh',
            'en': 'It\'s dangerous, so don\'t touch it',
          }, romaji: 'wiheomhanikka manjiji maseyo'),
          GuideExample('늦었으니까 택시를 탑시다', {
            'id': 'Sudah telat, jadi ayo naik taksi',
            'en': 'We\'re late, so let\'s take a taxi',
          }, romaji: 'neujeosseunikka taeksireul tapsida'),
          GuideExample(
            '지금 바쁘니까 나중에 전화해 주세요',
            {
              'id': 'Sekarang saya sibuk, tolong telepon nanti',
              'en': 'I\'m busy now, so please call later',
            },
            romaji: 'jigeum bappeunikka najunge jeonhwahae juseyo',
          ),
        ],
      ),
      GuideSection(
        title: const {'id': '-(으)면: kalau, jika', 'en': '-(으)면: if, when'},
        body: const {
          'id':
              'Batang berakhiran konsonan + -으면, berakhiran vokal atau ㄹ + -면. Menyatakan syarat ("kalau") atau kebiasaan ("setiap kali"). Kalimat kedua boleh berupa perintah, ajakan, atau rencana.',
          'en':
              'A stem ending in a consonant takes -으면; one ending in a vowel or ㄹ takes -면. It expresses a condition ("if") or a habit ("whenever"). The second clause may be a command, suggestion or plan.',
        },
        examples: const [
          GuideExample('시간이 있으면 같이 가요', {
            'id': 'Kalau ada waktu, ayo pergi bersama',
            'en': 'If you have time, let\'s go together',
          }, romaji: 'sigani isseumyeon gachi gayo'),
          GuideExample('비가 오면 집에 있을 거예요', {
            'id': 'Kalau hujan, saya akan di rumah saja',
            'en': 'If it rains, I\'ll stay home',
          }, romaji: 'biga omyeon jibe isseul geoyeyo'),
          GuideExample('모르면 물어보세요', {
            'id': 'Kalau tidak tahu, tanyakan saja',
            'en': 'If you don\'t know, please ask',
          }, romaji: 'moreumyeon mureoboseyo'),
          GuideExample('피곤하면 좀 쉬세요', {
            'id': 'Kalau capek, istirahatlah sebentar',
            'en': 'If you\'re tired, take a rest',
          }, romaji: 'pigonhamyeon jom swiseyo'),
        ],
      ),
      GuideSection(
        title: const {
          'id': '-(으)려고: supaya, berniat',
          'en': '-(으)려고: in order to, intend to',
        },
        body: const {
          'id':
              'Batang berakhiran konsonan + -으려고, berakhiran vokal atau ㄹ + -려고. Menyatakan tujuan atau niat subjek. Tidak dipakai dengan perintah/ajakan. -(으)려고 해요 di akhir kalimat berarti "berencana/berniat …".',
          'en':
              'A stem ending in a consonant takes -으려고; one ending in a vowel or ㄹ takes -려고. It states the subject\'s purpose or intention. It is not used with commands or suggestions. Sentence-final -(으)려고 해요 means "plan/intend to …".',
        },
        examples: const [
          GuideExample(
            '한국에서 일하려고 한국어를 배워요',
            {
              'id': 'Saya belajar bahasa Korea supaya bisa bekerja di Korea',
              'en': 'I\'m learning Korean in order to work in Korea',
            },
            romaji: 'hangugeseo ilharyeogo hangugeoreul baewoyo',
          ),
          GuideExample('선물을 사려고 시장에 갔어요', {
            'id': 'Saya pergi ke pasar untuk membeli hadiah',
            'en': 'I went to the market to buy a present',
          }, romaji: 'seonmureul saryeogo sijange gasseoyo'),
          GuideExample('살을 빼려고 매일 운동해요', {
            'id': 'Saya olahraga setiap hari untuk menurunkan berat badan',
            'en': 'I exercise every day to lose weight',
          }, romaji: 'sareul ppaeryeogo maeil undonghaeyo'),
          GuideExample('주말에 친구를 만나려고 해요', {
            'id': 'Akhir pekan saya berencana bertemu teman',
            'en': 'I\'m planning to meet a friend this weekend',
          }, romaji: 'jumare chingureul mannaryeogo haeyo'),
        ],
      ),
    ],
  ),
];
