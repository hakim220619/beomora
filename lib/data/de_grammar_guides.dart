import '../models/guide.dart';

/// Topik tata bahasa Jerman (Materi): urutan kata, kasus Akkusativ &
/// Dativ, preposisi, kata kerja modal & terpisah, Perfekt/Präteritum,
/// negasi & Imperativ, serta perbandingan & akhiran kata sifat.
final List<GuideTopic> deGrammarTopics = [
  // ---------------------------------------------------------------------
  // 1. Urutan kata
  // ---------------------------------------------------------------------
  GuideTopic(
    id: 'de_gr_word_order',
    emoji: '🧩',
    title: const {'id': 'Urutan Kata', 'en': 'Word Order'},
    subtitle: const {
      'id': 'Verba di posisi 2, pertanyaan, dan kalimat dengan weil/dass/wenn',
      'en': 'Verb in position 2, questions, and clauses with weil/dass/wenn',
    },
    sections: [
      GuideSection(
        title: const {
          'id': 'Verba selalu di posisi 2',
          'en': 'The verb is always in position 2',
        },
        body: const {
          'id':
              'Dalam kalimat utama, kata kerja yang dikonjugasi selalu berada di posisi ke-2. Posisi 1 boleh diisi subjek, keterangan waktu, atau tempat. Kalau posisi 1 bukan subjek, subjek pindah ke belakang kata kerja: Ich arbeite heute → Heute arbeite ich.',
          'en':
              'In a main clause, the conjugated verb is always in second position. Position 1 can be the subject, a time phrase or a place. If position 1 is not the subject, the subject moves behind the verb: Ich arbeite heute → Heute arbeite ich.',
        },
        examples: const [
          GuideExample(
            'Ich arbeite heute im Krankenhaus.',
            {
              'id': 'Saya bekerja hari ini di rumah sakit.',
              'en': 'I am working at the hospital today.',
            },
            romaji: 'ikh ar-bai-te hoi-te im krang-ken-haus',
          ),
          GuideExample(
            'Heute arbeite ich im Krankenhaus.',
            {
              'id': 'Hari ini saya bekerja di rumah sakit.',
              'en': 'Today I am working at the hospital.',
            },
            romaji: 'hoi-te ar-bai-te ikh im krang-ken-haus',
          ),
          GuideExample(
            'Morgen fahre ich nach Berlin.',
            {
              'id': 'Besok saya pergi ke Berlin.',
              'en': 'Tomorrow I am going to Berlin.',
            },
            romaji: 'mor-gen fa-re ikh nakh ber-lin',
          ),
          GuideExample(
            'Am Wochenende besuche ich meine Familie.',
            {
              'id': 'Akhir pekan saya mengunjungi keluarga saya.',
              'en': 'At the weekend I visit my family.',
            },
            romaji: 'am vo-khen-en-de be-zu-khe ikh mai-ne fa-mi-li-e',
          ),
        ],
      ),
      GuideSection(
        title: const {'id': 'Pertanyaan W', 'en': 'W-questions'},
        body: const {
          'id':
              'Pertanyaan dengan kata tanya: kata tanya + verba + subjek. Kata tanya penting: wer (siapa), was (apa), wo (di mana), woher (dari mana), wohin (ke mana), wann (kapan), wie (bagaimana), warum (mengapa), wie viel (berapa).',
          'en':
              'Questions with a question word: question word + verb + subject. Key question words: wer (who), was (what), wo (where), woher (where from), wohin (where to), wann (when), wie (how), warum (why), wie viel (how much).',
        },
        examples: const [
          GuideExample('Wo wohnst du?', {
            'id': 'Kamu tinggal di mana?',
            'en': 'Where do you live?',
          }, romaji: 'vo vonst du'),
          GuideExample('Woher kommen Sie?', {
            'id': 'Anda berasal dari mana?',
            'en': 'Where are you from?',
          }, romaji: 'vo-her ko-men zi'),
          GuideExample('Wann beginnt die Schicht?', {
            'id': 'Kapan sif kerjanya mulai?',
            'en': 'When does the shift start?',
          }, romaji: 'van be-gint di syikht'),
          GuideExample('Was machst du heute?', {
            'id': 'Kamu ngapain hari ini?',
            'en': 'What are you doing today?',
          }, romaji: 'vas makhst du hoi-te'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Pertanyaan ya/tidak', 'en': 'Yes/no questions'},
        body: const {
          'id':
              'Untuk pertanyaan ya/tidak, kata kerja pindah ke posisi 1, lalu subjek. Jawabannya Ja (ya) atau Nein (tidak). Kalau pertanyaannya negatif dan jawabannya "ya", pakai Doch.',
          'en':
              'For yes/no questions, the verb moves to position 1, followed by the subject. The answer is Ja (yes) or Nein (no). If the question is negative and the answer is "yes", use Doch.',
        },
        examples: const [
          GuideExample('Sprichst du Deutsch?', {
            'id': 'Kamu bisa bahasa Jerman?',
            'en': 'Do you speak German?',
          }, romaji: 'syprikhst du doitsy'),
          GuideExample('Haben Sie morgen Zeit?', {
            'id': 'Apakah Anda ada waktu besok?',
            'en': 'Do you have time tomorrow?',
          }, romaji: 'ha-ben zi mor-gen tsait'),
          GuideExample('Arbeitest du am Samstag?', {
            'id': 'Kamu kerja hari Sabtu?',
            'en': 'Do you work on Saturday?',
          }, romaji: 'ar-bai-test du am zams-tak'),
          GuideExample('Kommst du nicht? – Doch!', {
            'id': 'Kamu nggak datang? – Datang kok!',
            'en': 'Aren\'t you coming? – Yes, I am!',
          }, romaji: 'komst du nikht – dokh'),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Kalimat sampingan: verba di akhir',
          'en': 'Subordinate clauses: verb at the end',
        },
        body: const {
          'id':
              'Setelah weil (karena), dass (bahwa), wenn (kalau/jika), dan ob (apakah), kata kerja yang dikonjugasi pindah ke akhir kalimat. Kalimat sampingan selalu dipisah dengan koma. Kalau kalimat sampingan ada di depan, kalimat utama dimulai dengan kata kerja: Wenn ich Zeit habe, komme ich.',
          'en':
              'After weil (because), dass (that), wenn (if/when) and ob (whether), the conjugated verb moves to the end of the clause. A subordinate clause is always separated by a comma. If it comes first, the main clause starts with the verb: Wenn ich Zeit habe, komme ich.',
        },
        examples: const [
          GuideExample(
            'Ich lerne Deutsch, weil ich in Deutschland arbeiten möchte.',
            {
              'id':
                  'Saya belajar bahasa Jerman karena saya ingin bekerja di Jerman.',
              'en': 'I am learning German because I want to work in Germany.',
            },
            romaji:
                'ikh ler-ne doitsy, vail ikh in doitsy-lant ar-bai-ten mekh-te',
          ),
          GuideExample(
            'Ich bleibe zu Hause, weil ich krank bin.',
            {
              'id': 'Saya tetap di rumah karena saya sakit.',
              'en': 'I am staying at home because I am ill.',
            },
            romaji: 'ikh blai-be tsu hau-ze, vail ikh krangk bin',
          ),
          GuideExample(
            'Ich weiß, dass er heute arbeitet.',
            {
              'id': 'Saya tahu bahwa dia bekerja hari ini.',
              'en': 'I know that he is working today.',
            },
            romaji: 'ikh vais, das er hoi-te ar-bai-tet',
          ),
          GuideExample(
            'Wenn ich Zeit habe, komme ich mit.',
            {
              'id': 'Kalau saya ada waktu, saya ikut.',
              'en': 'If I have time, I will come along.',
            },
            romaji: 'ven ikh tsait ha-be, ko-me ikh mit',
          ),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'und, aber, oder, denn',
          'en': 'und, aber, oder, denn',
        },
        body: const {
          'id':
              'Kata penghubung und (dan), aber (tetapi), oder (atau), denn (karena), dan sondern (melainkan) tidak mengubah urutan kata. Kata ini berdiri di "posisi 0", jadi kata kerja tetap di posisi 2. Bandingkan: …, denn ich bin krank vs …, weil ich krank bin.',
          'en':
              'The connectors und (and), aber (but), oder (or), denn (because) and sondern (but rather) do not change word order. They stand in "position 0", so the verb stays in position 2. Compare: …, denn ich bin krank vs …, weil ich krank bin.',
        },
        examples: const [
          GuideExample(
            'Ich bin müde, aber ich arbeite weiter.',
            {
              'id': 'Saya capek, tapi saya tetap bekerja.',
              'en': 'I am tired, but I keep working.',
            },
            romaji: 'ikh bin my-de, a-ber ikh ar-bai-te vai-ter',
          ),
          GuideExample(
            'Ich bleibe zu Hause, denn ich bin krank.',
            {
              'id': 'Saya tetap di rumah, sebab saya sakit.',
              'en': 'I am staying at home, because I am ill.',
            },
            romaji: 'ikh blai-be tsu hau-ze, den ikh bin krangk',
          ),
          GuideExample('Trinkst du Kaffee oder Tee?', {
            'id': 'Kamu minum kopi atau teh?',
            'en': 'Do you drink coffee or tea?',
          }, romaji: 'tringkst du ka-fe o-der te'),
        ],
      ),
    ],
  ),

  // ---------------------------------------------------------------------
  // 2. Kasus Akkusativ & Dativ
  // ---------------------------------------------------------------------
  GuideTopic(
    id: 'de_gr_cases',
    emoji: '🎯',
    title: const {
      'id': 'Kasus Akkusativ & Dativ',
      'en': 'Accusative & Dative Cases',
    },
    subtitle: const {
      'id': 'der → den/dem, ich → mich/mir: peran kata dalam kalimat',
      'en': 'der → den/dem, ich → mich/mir: the role of words in a sentence',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Tiga kasus utama', 'en': 'The three main cases'},
        body: const {
          'id':
              'Artikel berubah sesuai peran kata benda. Nominativ = subjek (Wer? siapa yang…). Akkusativ = objek langsung (Wen? Was? siapa/apa yang di-…). Dativ = penerima atau objek tidak langsung (Wem? kepada siapa).',
          'en':
              'The article changes according to the noun\'s role. Nominative = subject (Wer? who does it). Accusative = direct object (Wen? Was? whom/what). Dative = receiver or indirect object (Wem? to whom).',
        },
        examples: const [
          GuideExample('Der Mann kauft einen Apfel.', {
            'id': 'Pria itu membeli sebuah apel.',
            'en': 'The man buys an apple.',
          }, romaji: 'der man kauft ai-nen ap-fel'),
          GuideExample('Ich gebe dem Kind das Buch.', {
            'id': 'Saya memberikan buku itu kepada anak itu.',
            'en': 'I give the child the book.',
          }, romaji: 'ikh ge-be dem kint das bukh'),
          GuideExample(
            'Die Ärztin hilft dem Patienten.',
            {
              'id': 'Dokter (perempuan) itu menolong pasien.',
              'en': 'The doctor helps the patient.',
            },
            romaji: 'di erts-tin hilft dem pa-tsi-en-ten',
          ),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Artikel tertentu (der/die/das)',
          'en': 'Definite articles (der/die/das)',
        },
        body: const {
          'id':
              'Nominativ: der / die / das / die (jamak). Akkusativ: den / die / das / die — hanya maskulin yang berubah. Dativ: dem / der / dem / den (+ -n pada kata benda jamak, misalnya den Kindern).',
          'en':
              'Nominative: der / die / das / die (plural). Accusative: den / die / das / die — only the masculine changes. Dative: dem / der / dem / den (+ -n on plural nouns, e.g. den Kindern).',
        },
        examples: const [
          GuideExample('Ich sehe den Bus.', {
            'id': 'Saya melihat busnya.',
            'en': 'I see the bus.',
          }, romaji: 'ikh ze-e den bus'),
          GuideExample('Wir fahren mit dem Zug.', {
            'id': 'Kami naik kereta.',
            'en': 'We are going by train.',
          }, romaji: 'vir fa-ren mit dem tsuk'),
          GuideExample('Ich helfe der Frau.', {
            'id': 'Saya membantu wanita itu.',
            'en': 'I help the woman.',
          }, romaji: 'ikh hel-fe der frau'),
          GuideExample(
            'Ich gebe den Kindern Wasser.',
            {
              'id': 'Saya memberi anak-anak air.',
              'en': 'I give the children water.',
            },
            romaji: 'ikh ge-be den kin-dern va-ser',
          ),
        ],
      ),
      GuideSection(
        title: const {'id': 'ein, kein, mein', 'en': 'ein, kein, mein'},
        body: const {
          'id':
              'Nominativ: ein / eine / ein. Akkusativ: einen / eine / ein. Dativ: einem / einer / einem. Kata kein (tidak ada) dan kata milik mein, dein, sein, ihr, unser mengikuti pola yang sama: meinen Bruder, meiner Mutter.',
          'en':
              'Nominative: ein / eine / ein. Accusative: einen / eine / ein. Dative: einem / einer / einem. The word kein (no) and the possessives mein, dein, sein, ihr, unser follow the same pattern: meinen Bruder, meiner Mutter.',
        },
        examples: const [
          GuideExample('Ich habe einen Bruder.', {
            'id': 'Saya punya seorang saudara laki-laki.',
            'en': 'I have a brother.',
          }, romaji: 'ikh ha-be ai-nen bru-der'),
          GuideExample('Ich brauche einen Termin.', {
            'id': 'Saya perlu janji temu.',
            'en': 'I need an appointment.',
          }, romaji: 'ikh brau-khe ai-nen ter-min'),
          GuideExample('Er wohnt bei einer Familie.', {
            'id': 'Dia tinggal di rumah sebuah keluarga.',
            'en': 'He lives with a family.',
          }, romaji: 'er vont bai ai-ner fa-mi-li-e'),
          GuideExample(
            'Ich schreibe meinem Chef eine E-Mail.',
            {
              'id': 'Saya menulis email kepada atasan saya.',
              'en': 'I am writing my boss an email.',
            },
            romaji: 'ikh syrai-be mai-nem syef ai-ne i-meil',
          ),
        ],
      ),
      GuideSection(
        title: const {'id': 'Kata ganti: mich/mir', 'en': 'Pronouns: mich/mir'},
        body: const {
          'id':
              'Nom → Akk → Dat: ich → mich → mir; du → dich → dir; er → ihn → ihm; sie → sie → ihr; es → es → ihm; wir → uns → uns; ihr → euch → euch; sie/Sie → sie/Sie → ihnen/Ihnen.',
          'en':
              'Nom → Acc → Dat: ich → mich → mir; du → dich → dir; er → ihn → ihm; sie → sie → ihr; es → es → ihm; wir → uns → uns; ihr → euch → euch; sie/Sie → sie/Sie → ihnen/Ihnen.',
        },
        examples: const [
          GuideExample('Kannst du mir helfen?', {
            'id': 'Bisakah kamu membantu saya?',
            'en': 'Can you help me?',
          }, romaji: 'kanst du mir hel-fen'),
          GuideExample('Ich rufe Sie morgen an.', {
            'id': 'Saya akan menelepon Anda besok.',
            'en': 'I will call you tomorrow.',
          }, romaji: 'ikh ru-fe zi mor-gen an'),
          GuideExample('Ich kenne ihn nicht.', {
            'id': 'Saya tidak kenal dia (laki-laki).',
            'en': 'I don\'t know him.',
          }, romaji: 'ikh ke-ne in nikht'),
          GuideExample('Wie geht es Ihnen?', {
            'id': 'Apa kabar Anda?',
            'en': 'How are you? (formal)',
          }, romaji: 'vi geyt es i-nen'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Kata kerja + Dativ', 'en': 'Verbs + dative'},
        body: const {
          'id':
              'Beberapa kata kerja selalu memakai Dativ walau hanya punya satu objek: helfen (membantu), danken (berterima kasih), gefallen (disukai), gehören (milik), schmecken (terasa enak), antworten (menjawab).',
          'en':
              'Some verbs always take the dative even with only one object: helfen (help), danken (thank), gefallen (please/like), gehören (belong to), schmecken (taste), antworten (answer).',
        },
        examples: const [
          GuideExample('Ich danke Ihnen.', {
            'id': 'Saya berterima kasih kepada Anda.',
            'en': 'Thank you. (formal)',
          }, romaji: 'ikh dang-ke i-nen'),
          GuideExample('Das Essen schmeckt mir.', {
            'id': 'Makanannya enak (menurut saya).',
            'en': 'I like the food.',
          }, romaji: 'das e-sen symekt mir'),
          GuideExample('Die Wohnung gefällt uns.', {
            'id': 'Kami suka apartemen itu.',
            'en': 'We like the flat.',
          }, romaji: 'di vo-nung ge-felt uns'),
          GuideExample(
            'Das Auto gehört meinem Vater.',
            {
              'id': 'Mobil itu milik ayah saya.',
              'en': 'The car belongs to my father.',
            },
            romaji: 'das au-to ge-hert mai-nem fa-ter',
          ),
        ],
      ),
    ],
  ),

  // ---------------------------------------------------------------------
  // 3. Preposisi
  // ---------------------------------------------------------------------
  GuideTopic(
    id: 'de_gr_prepositions',
    emoji: '📍',
    title: const {'id': 'Preposisi', 'en': 'Prepositions'},
    subtitle: const {
      'id': '+ Akkusativ, + Dativ, dan preposisi dua arah (wo? / wohin?)',
      'en': '+ accusative, + dative, and two-way prepositions (wo? / wohin?)',
    },
    sections: [
      GuideSection(
        title: const {
          'id': 'Preposisi + Akkusativ',
          'en': 'Prepositions + accusative',
        },
        body: const {
          'id':
              'für (untuk), ohne (tanpa), durch (melalui), gegen (melawan/sekitar), um (pada jam/mengelilingi), bis (sampai). Setelah preposisi ini, artikel selalu Akkusativ: für den Chef, ohne meinen Pass.',
          'en':
              'für (for), ohne (without), durch (through), gegen (against/around), um (at a time/around), bis (until). After these prepositions the article is always accusative: für den Chef, ohne meinen Pass.',
        },
        examples: const [
          GuideExample('Das Geschenk ist für dich.', {
            'id': 'Hadiah ini untukmu.',
            'en': 'The present is for you.',
          }, romaji: 'das ge-syengk ist fyr dikh'),
          GuideExample(
            'Ich trinke Kaffee ohne Zucker.',
            {
              'id': 'Saya minum kopi tanpa gula.',
              'en': 'I drink coffee without sugar.',
            },
            romaji: 'ikh tring-ke ka-fe o-ne tsu-ker',
          ),
          GuideExample('Wir gehen durch den Park.', {
            'id': 'Kami berjalan melewati taman.',
            'en': 'We walk through the park.',
          }, romaji: 'vir ge-en durkh den park'),
          GuideExample('Der Kurs beginnt um 8 Uhr.', {
            'id': 'Kursusnya mulai jam 8.',
            'en': 'The course starts at 8 o\'clock.',
          }, romaji: 'der kurs be-gint um akht ur'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Preposisi + Dativ', 'en': 'Prepositions + dative'},
        body: const {
          'id':
              'aus (dari, asal), bei (di tempat/pada), mit (dengan), nach (ke kota/negara, setelah), seit (sejak), von (dari), zu (ke orang/tempat). Setelah preposisi ini, artikel selalu Dativ: mit dem Bus, seit einem Jahr.',
          'en':
              'aus (from, origin), bei (at/with), mit (with), nach (to a city/country, after), seit (since/for), von (from/of), zu (to a person/place). After these prepositions the article is always dative: mit dem Bus, seit einem Jahr.',
        },
        examples: const [
          GuideExample('Ich komme aus Indonesien.', {
            'id': 'Saya berasal dari Indonesia.',
            'en': 'I come from Indonesia.',
          }, romaji: 'ikh ko-me aus in-do-ne-zi-en'),
          GuideExample(
            'Ich fahre mit dem Bus zur Arbeit.',
            {
              'id': 'Saya naik bus ke tempat kerja.',
              'en': 'I go to work by bus.',
            },
            romaji: 'ikh fa-re mit dem bus tsur ar-bait',
          ),
          GuideExample(
            'Ich lerne seit einem Jahr Deutsch.',
            {
              'id': 'Saya belajar bahasa Jerman sejak setahun lalu.',
              'en': 'I have been learning German for a year.',
            },
            romaji: 'ikh ler-ne zait ai-nem yar doitsy',
          ),
          GuideExample(
            'Nach der Arbeit gehe ich nach Hause.',
            {
              'id': 'Setelah kerja saya pulang ke rumah.',
              'en': 'After work I go home.',
            },
            romaji: 'nakh der ar-bait ge-e ikh nakh hau-ze',
          ),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Bentuk singkat: zum, im, am…',
          'en': 'Contractions: zum, im, am…',
        },
        body: const {
          'id':
              'Preposisi + artikel sering digabung: zu dem → zum, zu der → zur, bei dem → beim, von dem → vom, in dem → im, an dem → am, in das → ins. Bentuk singkat ini jauh lebih umum dalam percakapan.',
          'en':
              'Preposition + article are often merged: zu dem → zum, zu der → zur, bei dem → beim, von dem → vom, in dem → im, an dem → am, in das → ins. These short forms are much more common in speech.',
        },
        examples: const [
          GuideExample('Ich gehe zum Arzt.', {
            'id': 'Saya pergi ke dokter.',
            'en': 'I am going to the doctor.',
          }, romaji: 'ikh ge-e tsum artst'),
          GuideExample('Sie geht zur Apotheke.', {
            'id': 'Dia pergi ke apotek.',
            'en': 'She is going to the pharmacy.',
          }, romaji: 'zi geyt tsur a-po-te-ke'),
          GuideExample('Ich bin beim Arzt.', {
            'id': 'Saya sedang di dokter.',
            'en': 'I am at the doctor\'s.',
          }, romaji: 'ikh bin baim artst'),
          GuideExample('Wir gehen heute ins Kino.', {
            'id': 'Hari ini kami pergi ke bioskop.',
            'en': 'We are going to the cinema today.',
          }, romaji: 'vir ge-en hoi-te ins ki-no'),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Preposisi dua arah: wo? vs wohin?',
          'en': 'Two-way prepositions: wo? vs wohin?',
        },
        body: const {
          'id':
              'in, an, auf, über, unter, vor, hinter, neben, zwischen bisa memakai dua kasus. Wo? (di mana — posisi diam) → Dativ: auf dem Tisch. Wohin? (ke mana — ada gerakan/arah) → Akkusativ: auf den Tisch. Pasangan kata kerja yang sering muncul: liegen/legen, stehen/stellen, sein/gehen.',
          'en':
              'in, an, auf, über, unter, vor, hinter, neben, zwischen can take two cases. Wo? (where — position) → dative: auf dem Tisch. Wohin? (where to — movement/direction) → accusative: auf den Tisch. Common verb pairs: liegen/legen, stehen/stellen, sein/gehen.',
        },
        examples: const [
          GuideExample('Das Buch liegt auf dem Tisch.', {
            'id': 'Buku itu ada di atas meja. (wo?)',
            'en': 'The book is lying on the table. (wo?)',
          }, romaji: 'das bukh likt auf dem tisy'),
          GuideExample(
            'Ich lege das Buch auf den Tisch.',
            {
              'id': 'Saya menaruh buku itu ke atas meja. (wohin?)',
              'en': 'I put the book on the table. (wohin?)',
            },
            romaji: 'ikh le-ge das bukh auf den tisy',
          ),
          GuideExample('Ich bin in der Küche.', {
            'id': 'Saya ada di dapur. (wo?)',
            'en': 'I am in the kitchen. (wo?)',
          }, romaji: 'ikh bin in der ky-khe'),
          GuideExample('Ich gehe in die Küche.', {
            'id': 'Saya pergi ke dapur. (wohin?)',
            'en': 'I go into the kitchen. (wohin?)',
          }, romaji: 'ikh ge-e in di ky-khe'),
          GuideExample('Das Bild hängt an der Wand.', {
            'id': 'Gambar itu tergantung di dinding.',
            'en': 'The picture is hanging on the wall.',
          }, romaji: 'das bilt hengt an der vant'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Preposisi waktu', 'en': 'Time prepositions'},
        body: const {
          'id':
              'um + jam (um 7 Uhr), am + hari/tanggal/bagian hari (am Montag, am Abend), im + bulan/musim (im Mai, im Winter), seit + Dativ untuk sesuatu yang masih berlangsung, vor + Dativ untuk "… yang lalu" (vor zwei Tagen).',
          'en':
              'um + clock time (um 7 Uhr), am + day/date/part of day (am Montag, am Abend), im + month/season (im Mai, im Winter), seit + dative for something still ongoing, vor + dative for "… ago" (vor zwei Tagen).',
        },
        examples: const [
          GuideExample(
            'Um 7 Uhr beginnt meine Schicht.',
            {
              'id': 'Sif saya mulai jam 7.',
              'en': 'My shift starts at 7 o\'clock.',
            },
            romaji: 'um zi-ben ur be-gint mai-ne syikht',
          ),
          GuideExample('Am Montag habe ich frei.', {
            'id': 'Hari Senin saya libur.',
            'en': 'I am off on Monday.',
          }, romaji: 'am mon-tak ha-be ikh frai'),
          GuideExample('Im Winter ist es sehr kalt.', {
            'id': 'Saat musim dingin cuacanya sangat dingin.',
            'en': 'In winter it is very cold.',
          }, romaji: 'im vin-ter ist es zer kalt'),
          GuideExample(
            'Ich war vor zwei Tagen beim Arzt.',
            {
              'id': 'Dua hari yang lalu saya ke dokter.',
              'en': 'I was at the doctor\'s two days ago.',
            },
            romaji: 'ikh var for tsvai ta-gen baim artst',
          ),
        ],
      ),
    ],
  ),

  // ---------------------------------------------------------------------
  // 4. Modal & kata kerja terpisah
  // ---------------------------------------------------------------------
  GuideTopic(
    id: 'de_gr_modal_separable',
    emoji: '🔧',
    title: const {
      'id': 'Kata Kerja Modal & Terpisah',
      'en': 'Modal & Separable Verbs',
    },
    subtitle: const {
      'id': 'können, müssen, möchten… dan aufstehen → Ich stehe auf',
      'en': 'können, müssen, möchten… and aufstehen → Ich stehe auf',
    },
    sections: [
      GuideSection(
        title: const {
          'id': 'Arti kata kerja modal',
          'en': 'Meaning of modal verbs',
        },
        body: const {
          'id':
              'können (bisa), müssen (harus), wollen (mau, keinginan kuat), möchten (ingin, sopan), dürfen (boleh), sollen (sebaiknya/disuruh). Modal ada di posisi 2, kata kerja utama dalam bentuk infinitif pindah ke akhir kalimat.',
          'en':
              'können (can), müssen (must/have to), wollen (want, strong wish), möchten (would like, polite), dürfen (may/be allowed), sollen (should/be supposed to). The modal sits in position 2; the main verb goes to the end in the infinitive.',
        },
        examples: const [
          GuideExample('Ich kann gut kochen.', {
            'id': 'Saya bisa memasak dengan baik.',
            'en': 'I can cook well.',
          }, romaji: 'ikh kan gut ko-khen'),
          GuideExample(
            'Ich muss heute lange arbeiten.',
            {
              'id': 'Hari ini saya harus kerja lama.',
              'en': 'I have to work late today.',
            },
            romaji: 'ikh mus hoi-te lang-e ar-bai-ten',
          ),
          GuideExample(
            'Wir wollen in Deutschland leben.',
            {
              'id': 'Kami mau tinggal di Jerman.',
              'en': 'We want to live in Germany.',
            },
            romaji: 'vir vo-len in doitsy-lant le-ben',
          ),
          GuideExample(
            'Sie sollen morgen um 8 Uhr kommen.',
            {
              'id': 'Anda diminta datang besok jam 8.',
              'en': 'You are supposed to come tomorrow at 8.',
            },
            romaji: 'zi zo-len mor-gen um akht ur ko-men',
          ),
        ],
      ),
      GuideSection(
        title: const {'id': 'Konjugasi modal', 'en': 'Modal conjugation'},
        body: const {
          'id':
              'ich/er: kann, muss, will, darf, soll, möchte. du: kannst, musst, willst, darfst, sollst, möchtest. wir/sie/Sie: können, müssen, wollen, dürfen, sollen, möchten. ihr: könnt, müsst, wollt, dürft, sollt, möchtet. Perhatikan: bentuk ich dan er sama, dan tanpa akhiran -t.',
          'en':
              'ich/er: kann, muss, will, darf, soll, möchte. du: kannst, musst, willst, darfst, sollst, möchtest. wir/sie/Sie: können, müssen, wollen, dürfen, sollen, möchten. ihr: könnt, müsst, wollt, dürft, sollt, möchtet. Note: ich and er share the same form, with no -t ending.',
        },
        examples: const [
          GuideExample('Kannst du mir helfen?', {
            'id': 'Bisa bantu saya?',
            'en': 'Can you help me?',
          }, romaji: 'kanst du mir hel-fen'),
          GuideExample(
            'Er will Krankenpfleger werden.',
            {
              'id': 'Dia ingin menjadi perawat.',
              'en': 'He wants to become a nurse.',
            },
            romaji: 'er vil krang-ken-pfle-ger ver-den',
          ),
          GuideExample('Darf ich das Fenster öffnen?', {
            'id': 'Boleh saya buka jendelanya?',
            'en': 'May I open the window?',
          }, romaji: 'darf ikh das fens-ter ef-nen'),
          GuideExample('Möchten Sie einen Kaffee?', {
            'id': 'Anda mau kopi?',
            'en': 'Would you like a coffee?',
          }, romaji: 'mekh-ten zi ai-nen ka-fe'),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'nicht müssen vs nicht dürfen',
          'en': 'nicht müssen vs nicht dürfen',
        },
        body: const {
          'id':
              'Hati-hati: nicht müssen = tidak perlu, sedangkan nicht dürfen = dilarang. Untuk permintaan sopan (di toko, kantor, atau dokter), pakai möchten, bukan wollen.',
          'en':
              'Careful: nicht müssen = don\'t have to, while nicht dürfen = must not. For polite requests (in shops, offices or at the doctor\'s), use möchten, not wollen.',
        },
        examples: const [
          GuideExample(
            'Sie müssen heute nicht arbeiten.',
            {
              'id': 'Anda tidak perlu bekerja hari ini.',
              'en': 'You don\'t have to work today.',
            },
            romaji: 'zi my-sen hoi-te nikht ar-bai-ten',
          ),
          GuideExample('Hier darf man nicht rauchen.', {
            'id': 'Di sini dilarang merokok.',
            'en': 'You must not smoke here.',
          }, romaji: 'hir darf man nikht rau-khen'),
          GuideExample(
            'Ich möchte bitte einen Termin.',
            {
              'id': 'Saya ingin membuat janji temu.',
              'en': 'I would like an appointment, please.',
            },
            romaji: 'ikh mekh-te bi-te ai-nen ter-min',
          ),
        ],
      ),
      GuideSection(
        title: const {'id': 'Kata kerja terpisah', 'en': 'Separable verbs'},
        body: const {
          'id':
              'Banyak kata kerja punya awalan yang terlepas: an-, auf-, aus-, ein-, mit-, ab-, zu-, zurück-, fern-. Dalam kalimat utama, awalannya pindah ke akhir: aufstehen → Ich stehe um 6 Uhr auf. Contoh lain: anrufen, einkaufen, anfangen, mitkommen, fernsehen.',
          'en':
              'Many verbs have a detachable prefix: an-, auf-, aus-, ein-, mit-, ab-, zu-, zurück-, fern-. In a main clause the prefix goes to the end: aufstehen → Ich stehe um 6 Uhr auf. Others: anrufen, einkaufen, anfangen, mitkommen, fernsehen.',
        },
        examples: const [
          GuideExample('Ich stehe um 6 Uhr auf.', {
            'id': 'Saya bangun jam 6.',
            'en': 'I get up at 6 o\'clock.',
          }, romaji: 'ikh syte-e um zeks ur auf'),
          GuideExample('Ich rufe dich später an.', {
            'id': 'Nanti saya telepon kamu.',
            'en': 'I will call you later.',
          }, romaji: 'ikh ru-fe dikh sype-ter an'),
          GuideExample('Wir kaufen am Samstag ein.', {
            'id': 'Kami belanja hari Sabtu.',
            'en': 'We go shopping on Saturday.',
          }, romaji: 'vir kau-fen am zams-tak ain'),
          GuideExample('Der Kurs fängt um 9 Uhr an.', {
            'id': 'Kursusnya mulai jam 9.',
            'en': 'The course starts at 9 o\'clock.',
          }, romaji: 'der kurs fengt um noin ur an'),
          GuideExample('Kommst du mit?', {
            'id': 'Kamu ikut?',
            'en': 'Are you coming along?',
          }, romaji: 'komst du mit'),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Terpisah + modal / weil',
          'en': 'Separable + modal / weil',
        },
        body: const {
          'id':
              'Dengan kata kerja modal atau di kalimat sampingan, kata kerja terpisah tetap utuh di akhir: Ich muss früh aufstehen. / …, weil ich früh aufstehe. Awalan be-, ver-, er-, ent-, ge-, zer- tidak pernah terpisah: Ich verstehe, ich besuche.',
          'en':
              'With a modal verb or in a subordinate clause, the separable verb stays whole at the end: Ich muss früh aufstehen. / …, weil ich früh aufstehe. The prefixes be-, ver-, er-, ent-, ge-, zer- never separate: Ich verstehe, ich besuche.',
        },
        examples: const [
          GuideExample(
            'Ich muss morgen früh aufstehen.',
            {
              'id': 'Besok saya harus bangun pagi.',
              'en': 'I have to get up early tomorrow.',
            },
            romaji: 'ikh mus mor-gen fry auf-syte-en',
          ),
          GuideExample(
            'Kannst du mich heute Abend anrufen?',
            {
              'id': 'Bisa telepon saya nanti malam?',
              'en': 'Can you call me this evening?',
            },
            romaji: 'kanst du mikh hoi-te a-bent an-ru-fen',
          ),
          GuideExample(
            'Ich bin müde, weil ich früh aufstehe.',
            {
              'id': 'Saya capek karena saya bangun pagi.',
              'en': 'I am tired because I get up early.',
            },
            romaji: 'ikh bin my-de, vail ikh fry auf-syte-e',
          ),
          GuideExample(
            'Ich verstehe die Frage nicht.',
            {
              'id': 'Saya tidak mengerti pertanyaannya.',
              'en': 'I don\'t understand the question.',
            },
            romaji: 'ikh fer-syte-e di fra-ge nikht',
          ),
        ],
      ),
    ],
  ),

  // ---------------------------------------------------------------------
  // 5. Perfekt & Präteritum
  // ---------------------------------------------------------------------
  GuideTopic(
    id: 'de_gr_perfekt',
    emoji: '🕰️',
    title: const {'id': 'Kala Lampau: Perfekt', 'en': 'Past Tense: Perfekt'},
    subtitle: const {
      'id': 'haben/sein + Partizip II, serta war & hatte',
      'en': 'haben/sein + past participle, plus war & hatte',
    },
    sections: [
      GuideSection(
        title: const {'id': 'Pola Perfekt', 'en': 'The Perfekt pattern'},
        body: const {
          'id':
              'Dalam percakapan, kejadian lampau biasanya diungkapkan dengan Perfekt: haben atau sein (dikonjugasi, posisi 2) + Partizip II (di akhir kalimat). Ich habe gelernt = saya (sudah) belajar.',
          'en':
              'In conversation, past events are usually expressed with the Perfekt: haben or sein (conjugated, position 2) + past participle (at the end). Ich habe gelernt = I learned / have learned.',
        },
        examples: const [
          GuideExample('Ich habe Deutsch gelernt.', {
            'id': 'Saya sudah belajar bahasa Jerman.',
            'en': 'I studied German.',
          }, romaji: 'ikh ha-be doitsy ge-lernt'),
          GuideExample('Wir haben Pizza gegessen.', {
            'id': 'Kami makan pizza.',
            'en': 'We ate pizza.',
          }, romaji: 'vir ha-ben pi-tsa ge-ge-sen'),
          GuideExample('Er ist nach Hause gegangen.', {
            'id': 'Dia sudah pulang.',
            'en': 'He went home.',
          }, romaji: 'er ist nakh hau-ze ge-gang-en'),
          GuideExample('Hast du gut geschlafen?', {
            'id': 'Tidurmu nyenyak?',
            'en': 'Did you sleep well?',
          }, romaji: 'hast du gut ge-syla-fen'),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Verba teratur: ge-…-t',
          'en': 'Regular verbs: ge-…-t',
        },
        body: const {
          'id':
              'Kata kerja teratur membentuk Partizip II dengan ge- + akar kata + -t: machen → gemacht, lernen → gelernt, kaufen → gekauft, spielen → gespielt. Kalau akar kata berakhir -t/-d, tambah -et: arbeiten → gearbeitet.',
          'en':
              'Regular verbs form the participle with ge- + stem + -t: machen → gemacht, lernen → gelernt, kaufen → gekauft, spielen → gespielt. If the stem ends in -t/-d, add -et: arbeiten → gearbeitet.',
        },
        examples: const [
          GuideExample(
            'Was hast du gestern gemacht?',
            {'id': 'Kemarin kamu ngapain?', 'en': 'What did you do yesterday?'},
            romaji: 'vas hast du ges-tern ge-makht',
          ),
          GuideExample(
            'Ich habe den ganzen Tag gearbeitet.',
            {'id': 'Saya bekerja seharian.', 'en': 'I worked all day.'},
            romaji: 'ikh ha-be den gan-tsen tak ge-ar-bai-tet',
          ),
          GuideExample('Sie hat ein Auto gekauft.', {
            'id': 'Dia membeli mobil.',
            'en': 'She bought a car.',
          }, romaji: 'zi hat ain au-to ge-kauft'),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Verba tidak teratur: ge-…-en',
          'en': 'Irregular verbs: ge-…-en',
        },
        body: const {
          'id':
              'Kata kerja tidak teratur berakhiran -en dan vokalnya sering berubah, jadi harus dihafal: essen → gegessen, trinken → getrunken, schreiben → geschrieben, sehen → gesehen, nehmen → genommen, gehen → gegangen, fahren → gefahren.',
          'en':
              'Irregular verbs end in -en and often change their vowel, so they must be memorised: essen → gegessen, trinken → getrunken, schreiben → geschrieben, sehen → gesehen, nehmen → genommen, gehen → gegangen, fahren → gefahren.',
        },
        examples: const [
          GuideExample('Ich habe Tee getrunken.', {
            'id': 'Saya minum teh.',
            'en': 'I drank tea.',
          }, romaji: 'ikh ha-be te ge-trung-ken'),
          GuideExample('Hast du den Film gesehen?', {
            'id': 'Kamu sudah nonton filmnya?',
            'en': 'Have you seen the film?',
          }, romaji: 'hast du den film ge-ze-en'),
          GuideExample(
            'Ich habe eine E-Mail geschrieben.',
            {'id': 'Saya sudah menulis email.', 'en': 'I wrote an email.'},
            romaji: 'ikh ha-be ai-ne i-meil ge-syri-ben',
          ),
          GuideExample('Er hat den Bus genommen.', {
            'id': 'Dia naik bus.',
            'en': 'He took the bus.',
          }, romaji: 'er hat den bus ge-no-men'),
        ],
      ),
      GuideSection(
        title: const {'id': 'haben atau sein?', 'en': 'haben or sein?'},
        body: const {
          'id':
              'Sebagian besar kata kerja memakai haben. Pakai sein untuk perpindahan tempat (gehen, kommen, fahren, fliegen) dan perubahan keadaan (aufstehen, einschlafen, werden), serta sein, bleiben, dan passieren.',
          'en':
              'Most verbs use haben. Use sein for movement from place to place (gehen, kommen, fahren, fliegen) and change of state (aufstehen, einschlafen, werden), as well as sein, bleiben and passieren.',
        },
        examples: const [
          GuideExample(
            'Ich bin nach Deutschland geflogen.',
            {'id': 'Saya terbang ke Jerman.', 'en': 'I flew to Germany.'},
            romaji: 'ikh bin nakh doitsy-lant ge-flo-gen',
          ),
          GuideExample(
            'Sie ist mit dem Zug gefahren.',
            {'id': 'Dia pergi naik kereta.', 'en': 'She went by train.'},
            romaji: 'zi ist mit dem tsuk ge-fa-ren',
          ),
          GuideExample(
            'Er ist Krankenpfleger geworden.',
            {'id': 'Dia sudah menjadi perawat.', 'en': 'He became a nurse.'},
            romaji: 'er ist krang-ken-pfle-ger ge-vor-den',
          ),
          GuideExample('Ich bin zu Hause geblieben.', {
            'id': 'Saya tetap di rumah.',
            'en': 'I stayed at home.',
          }, romaji: 'ikh bin tsu hau-ze ge-bli-ben'),
          GuideExample('Was ist passiert?', {
            'id': 'Apa yang terjadi?',
            'en': 'What happened?',
          }, romaji: 'vas ist pa-sirt'),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Verba terpisah & tanpa ge-',
          'en': 'Separable verbs & no ge-',
        },
        body: const {
          'id':
              'Pada kata kerja terpisah, ge- masuk di tengah: aufstehen → aufgestanden, einkaufen → eingekauft, anrufen → angerufen. Tanpa ge-: kata kerja berakhiran -ieren (studieren → studiert) dan yang berawalan be-/ver-/er-/ent- (besuchen → besucht, verstehen → verstanden).',
          'en':
              'With separable verbs, ge- goes in the middle: aufstehen → aufgestanden, einkaufen → eingekauft, anrufen → angerufen. No ge-: verbs ending in -ieren (studieren → studiert) and verbs with be-/ver-/er-/ent- (besuchen → besucht, verstehen → verstanden).',
        },
        examples: const [
          GuideExample(
            'Ich bin um 6 Uhr aufgestanden.',
            {'id': 'Saya bangun jam 6.', 'en': 'I got up at 6 o\'clock.'},
            romaji: 'ikh bin um zeks ur auf-ge-sytan-den',
          ),
          GuideExample('Hast du schon eingekauft?', {
            'id': 'Kamu sudah belanja?',
            'en': 'Have you already done the shopping?',
          }, romaji: 'hast du syon ain-ge-kauft'),
          GuideExample(
            'Er hat mich gestern angerufen.',
            {
              'id': 'Dia menelepon saya kemarin.',
              'en': 'He called me yesterday.',
            },
            romaji: 'er hat mikh ges-tern an-ge-ru-fen',
          ),
          GuideExample(
            'Ich habe die Frage nicht verstanden.',
            {
              'id': 'Saya tidak mengerti pertanyaannya.',
              'en': 'I didn\'t understand the question.',
            },
            romaji: 'ikh ha-be di fra-ge nikht fer-sytan-den',
          ),
          GuideExample(
            'Sie hat in Jakarta studiert.',
            {'id': 'Dia kuliah di Jakarta.', 'en': 'She studied in Jakarta.'},
            romaji: 'zi hat in ya-kar-ta sytu-dirt',
          ),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Präteritum: war & hatte',
          'en': 'Simple past: war & hatte',
        },
        body: const {
          'id':
              'Untuk sein, haben, dan kata kerja modal, orang Jerman lebih sering memakai Präteritum. sein: ich war, du warst, er war, wir waren, ihr wart, sie waren. haben: ich hatte, du hattest, er hatte, wir hatten. Modal: konnte, musste, wollte, durfte, sollte.',
          'en':
              'For sein, haben and modal verbs, Germans mostly use the simple past. sein: ich war, du warst, er war, wir waren, ihr wart, sie waren. haben: ich hatte, du hattest, er hatte, wir hatten. Modals: konnte, musste, wollte, durfte, sollte.',
        },
        examples: const [
          GuideExample('Ich war gestern krank.', {
            'id': 'Kemarin saya sakit.',
            'en': 'I was ill yesterday.',
          }, romaji: 'ikh var ges-tern krangk'),
          GuideExample('Wo warst du?', {
            'id': 'Kamu tadi di mana?',
            'en': 'Where were you?',
          }, romaji: 'vo varst du'),
          GuideExample('Wir hatten keine Zeit.', {
            'id': 'Kami tidak punya waktu.',
            'en': 'We had no time.',
          }, romaji: 'vir ha-ten kai-ne tsait'),
          GuideExample('Ich musste lange warten.', {
            'id': 'Saya harus menunggu lama.',
            'en': 'I had to wait a long time.',
          }, romaji: 'ikh mus-te lang-e var-ten'),
          GuideExample('Er konnte nicht kommen.', {
            'id': 'Dia tidak bisa datang.',
            'en': 'He couldn\'t come.',
          }, romaji: 'er kon-te nikht ko-men'),
        ],
      ),
    ],
  ),

  // ---------------------------------------------------------------------
  // 6. Negasi & Imperativ
  // ---------------------------------------------------------------------
  GuideTopic(
    id: 'de_gr_negation_imperative',
    emoji: '🚫',
    title: const {
      'id': 'Negasi & Kalimat Perintah',
      'en': 'Negation & Imperative',
    },
    subtitle: const {
      'id': 'nicht vs kein, lalu perintah untuk du, ihr, dan Sie',
      'en': 'nicht vs kein, then commands for du, ihr and Sie',
    },
    sections: [
      GuideSection(
        title: const {'id': 'nicht', 'en': 'nicht'},
        body: const {
          'id':
              'nicht menegasikan kata kerja, kata sifat, keterangan, dan kata benda yang memakai der/die/das. Posisinya di akhir kalimat (Ich arbeite heute nicht) atau tepat sebelum bagian yang dinegasikan, misalnya kata sifat atau keterangan tempat (nicht teuer, nicht aus Berlin).',
          'en':
              'nicht negates verbs, adjectives, adverbs and nouns with der/die/das. It goes at the end of the sentence (Ich arbeite heute nicht) or right before the part being negated, such as an adjective or place phrase (nicht teuer, nicht aus Berlin).',
        },
        examples: const [
          GuideExample('Ich arbeite heute nicht.', {
            'id': 'Hari ini saya tidak bekerja.',
            'en': 'I am not working today.',
          }, romaji: 'ikh ar-bai-te hoi-te nikht'),
          GuideExample('Das ist nicht teuer.', {
            'id': 'Itu tidak mahal.',
            'en': 'That is not expensive.',
          }, romaji: 'das ist nikht toi-er'),
          GuideExample('Ich komme nicht aus Berlin.', {
            'id': 'Saya tidak berasal dari Berlin.',
            'en': 'I am not from Berlin.',
          }, romaji: 'ikh ko-me nikht aus ber-lin'),
          GuideExample('Ich verstehe das nicht.', {
            'id': 'Saya tidak mengerti itu.',
            'en': 'I don\'t understand that.',
          }, romaji: 'ikh fer-syte-e das nikht'),
        ],
      ),
      GuideSection(
        title: const {'id': 'kein', 'en': 'kein'},
        body: const {
          'id':
              'kein menegasikan kata benda yang memakai ein atau tanpa artikel (artinya "tidak ada/tidak punya"). Bentuknya mengikuti ein: kein / keine / kein / keine (jamak), dan Akkusativ maskulin menjadi keinen.',
          'en':
              'kein negates nouns used with ein or with no article (meaning "no/not any"). It declines like ein: kein / keine / kein / keine (plural), and the masculine accusative becomes keinen.',
        },
        examples: const [
          GuideExample('Ich habe kein Auto.', {
            'id': 'Saya tidak punya mobil.',
            'en': 'I don\'t have a car.',
          }, romaji: 'ikh ha-be kain au-to'),
          GuideExample('Wir haben keine Zeit.', {
            'id': 'Kami tidak punya waktu.',
            'en': 'We have no time.',
          }, romaji: 'vir ha-ben kai-ne tsait'),
          GuideExample('Ich habe keinen Hunger.', {
            'id': 'Saya tidak lapar.',
            'en': 'I am not hungry.',
          }, romaji: 'ikh ha-be kai-nen hung-er'),
          GuideExample('Das ist kein Problem.', {
            'id': 'Tidak masalah.',
            'en': 'That\'s no problem.',
          }, romaji: 'das ist kain pro-blem'),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'nichts, nie, niemand, doch',
          'en': 'nichts, nie, niemand, doch',
        },
        body: const {
          'id':
              'Kata negatif lain: nichts (tidak ada apa-apa), nie (tidak pernah), niemand (tidak ada seorang pun). Untuk menjawab "ya" pada pertanyaan negatif, pakai Doch, bukan Ja.',
          'en':
              'Other negative words: nichts (nothing), nie (never), niemand (nobody). To answer "yes" to a negative question, use Doch, not Ja.',
        },
        examples: const [
          GuideExample('Ich habe nichts gesagt.', {
            'id': 'Saya tidak bilang apa-apa.',
            'en': 'I didn\'t say anything.',
          }, romaji: 'ikh ha-be nikhts ge-zakt'),
          GuideExample('Er ist nie pünktlich.', {
            'id': 'Dia tidak pernah tepat waktu.',
            'en': 'He is never on time.',
          }, romaji: 'er ist ni pyngkt-likh'),
          GuideExample('Niemand ist zu Hause.', {
            'id': 'Tidak ada orang di rumah.',
            'en': 'Nobody is at home.',
          }, romaji: 'ni-mant ist tsu hau-ze'),
          GuideExample(
            'Hast du keine Kinder? – Doch, zwei.',
            {
              'id': 'Kamu tidak punya anak? – Punya kok, dua.',
              'en': 'Don\'t you have children? – Yes, I do, two.',
            },
            romaji: 'hast du kai-ne kin-der – dokh, tsvai',
          ),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Perintah sopan (Sie)',
          'en': 'Polite commands (Sie)',
        },
        body: const {
          'id':
              'Untuk Sie: kata kerja bentuk infinitif + Sie, di posisi 1. Tambahkan bitte agar lebih sopan. sein menjadi Seien Sie. Ini yang paling sering didengar di kantor, rumah sakit, dan instansi.',
          'en':
              'For Sie: infinitive verb + Sie, in position 1. Add bitte to be more polite. sein becomes Seien Sie. This is what you hear most in offices, hospitals and public authorities.',
        },
        examples: const [
          GuideExample('Kommen Sie bitte herein.', {
            'id': 'Silakan masuk.',
            'en': 'Please come in.',
          }, romaji: 'ko-men zi bi-te he-rain'),
          GuideExample('Warten Sie bitte hier.', {
            'id': 'Silakan tunggu di sini.',
            'en': 'Please wait here.',
          }, romaji: 'var-ten zi bi-te hir'),
          GuideExample(
            'Nehmen Sie die Tablette nach dem Essen.',
            {
              'id': 'Minum tabletnya setelah makan.',
              'en': 'Take the tablet after meals.',
            },
            romaji: 'ne-men zi di ta-ble-te nakh dem e-sen',
          ),
          GuideExample('Seien Sie bitte vorsichtig.', {
            'id': 'Tolong hati-hati.',
            'en': 'Please be careful.',
          }, romaji: 'zai-en zi bi-te for-zikh-tikh'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Perintah untuk du', 'en': 'Commands for du'},
        body: const {
          'id':
              'Ambil bentuk du, buang -st dan kata du: du kommst → Komm!, du machst → Mach!, du arbeitest → Arbeite! Perubahan e → i tetap (du nimmst → Nimm!, du sprichst → Sprich!), tapi umlaut a → ä hilang (du fährst → Fahr!). sein → Sei!',
          'en':
              'Take the du form and drop -st and du: du kommst → Komm!, du machst → Mach!, du arbeitest → Arbeite! The e → i change stays (du nimmst → Nimm!, du sprichst → Sprich!), but the a → ä umlaut is dropped (du fährst → Fahr!). sein → Sei!',
        },
        examples: const [
          GuideExample('Komm bitte her!', {
            'id': 'Sini, datang ke sini!',
            'en': 'Come here, please!',
          }, romaji: 'kom bi-te her'),
          GuideExample('Sprich bitte langsam!', {
            'id': 'Tolong bicara pelan-pelan!',
            'en': 'Please speak slowly!',
          }, romaji: 'syprikh bi-te lang-zam'),
          GuideExample('Nimm einen Regenschirm mit!', {
            'id': 'Bawa payung!',
            'en': 'Take an umbrella with you!',
          }, romaji: 'nim ai-nen re-gen-syirm mit'),
          GuideExample('Fahr vorsichtig!', {
            'id': 'Hati-hati menyetirnya!',
            'en': 'Drive carefully!',
          }, romaji: 'far for-zikh-tikh'),
          GuideExample('Sei leise!', {
            'id': 'Jangan berisik!',
            'en': 'Be quiet!',
          }, romaji: 'zai lai-ze'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Perintah untuk ihr', 'en': 'Commands for ihr'},
        body: const {
          'id':
              'Untuk beberapa orang yang akrab (ihr): pakai bentuk ihr tanpa kata ihr: ihr kommt → Kommt!, ihr macht → Macht! sein → Seid! Larangan dibentuk dengan nicht: Raucht hier nicht!',
          'en':
              'For several people you know well (ihr): use the ihr form without ihr: ihr kommt → Kommt!, ihr macht → Macht! sein → Seid! Prohibitions use nicht: Raucht hier nicht!',
        },
        examples: const [
          GuideExample('Kommt bitte pünktlich!', {
            'id': 'Tolong datang tepat waktu ya!',
            'en': 'Please be on time!',
          }, romaji: 'komt bi-te pyngkt-likh'),
          GuideExample('Macht die Tür zu!', {
            'id': 'Tutup pintunya!',
            'en': 'Close the door!',
          }, romaji: 'makht di tyr tsu'),
          GuideExample('Seid leise, bitte!', {
            'id': 'Tolong jangan berisik!',
            'en': 'Be quiet, please!',
          }, romaji: 'zait lai-ze, bi-te'),
          GuideExample('Wascht euch die Hände!', {
            'id': 'Cuci tangan kalian!',
            'en': 'Wash your hands!',
          }, romaji: 'vasyt oikh di hen-de'),
        ],
      ),
    ],
  ),

  // ---------------------------------------------------------------------
  // 7. Kata sifat
  // ---------------------------------------------------------------------
  GuideTopic(
    id: 'de_gr_adjectives',
    emoji: '📏',
    title: const {'id': 'Kata Sifat', 'en': 'Adjectives'},
    subtitle: const {
      'id': 'groß – größer – am größten, dan akhiran setelah der/ein',
      'en': 'groß – größer – am größten, and endings after der/ein',
    },
    sections: [
      GuideSection(
        title: const {
          'id': 'Perbandingan: -er + als',
          'en': 'Comparative: -er + als',
        },
        body: const {
          'id':
              'Bentuk "lebih": kata sifat + -er, lalu als (daripada). Banyak kata sifat pendek mendapat umlaut: alt → älter, groß → größer, jung → jünger, kalt → kälter, lang → länger. Untuk "sama … dengan" pakai so … wie.',
          'en':
              'For "more": adjective + -er, then als (than). Many short adjectives take an umlaut: alt → älter, groß → größer, jung → jünger, kalt → kälter, lang → länger. For "as … as" use so … wie.',
        },
        examples: const [
          GuideExample(
            'Berlin ist größer als München.',
            {
              'id': 'Berlin lebih besar daripada München.',
              'en': 'Berlin is bigger than Munich.',
            },
            romaji: 'ber-lin ist gre-ser als myn-khen',
          ),
          GuideExample(
            'Mein Bruder ist älter als ich.',
            {
              'id': 'Kakak laki-laki saya lebih tua daripada saya.',
              'en': 'My brother is older than me.',
            },
            romaji: 'main bru-der ist el-ter als ikh',
          ),
          GuideExample(
            'Der Zug ist schneller als der Bus.',
            {
              'id': 'Kereta lebih cepat daripada bus.',
              'en': 'The train is faster than the bus.',
            },
            romaji: 'der tsuk ist syne-ler als der bus',
          ),
          GuideExample('Lisa ist so alt wie Tom.', {
            'id': 'Lisa seumur dengan Tom.',
            'en': 'Lisa is as old as Tom.',
          }, romaji: 'li-za ist zo alt vi tom'),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Superlatif: am -sten',
          'en': 'Superlative: am -sten',
        },
        body: const {
          'id':
              'Bentuk "paling": am + kata sifat + -sten: schnell → am schnellsten, klein → am kleinsten. Setelah -t, -d, -s, -z biasanya -esten: alt → am ältesten, kurz → am kürzesten (pengecualian: groß → am größten). Di depan kata benda: der/die/das + -ste (der größte Berg).',
          'en':
              'For "most": am + adjective + -sten: schnell → am schnellsten, klein → am kleinsten. After -t, -d, -s, -z it is usually -esten: alt → am ältesten, kurz → am kürzesten (exception: groß → am größten). Before a noun: der/die/das + -ste (der größte Berg).',
        },
        examples: const [
          GuideExample('Wer läuft am schnellsten?', {
            'id': 'Siapa yang larinya paling cepat?',
            'en': 'Who runs the fastest?',
          }, romaji: 'ver loift am synel-sten'),
          GuideExample(
            'Im Januar ist es am kältesten.',
            {
              'id': 'Bulan Januari paling dingin.',
              'en': 'It is coldest in January.',
            },
            romaji: 'im ya-nu-ar ist es am kel-tes-ten',
          ),
          GuideExample('Mein Opa ist am ältesten.', {
            'id': 'Kakek saya yang paling tua.',
            'en': 'My grandpa is the oldest.',
          }, romaji: 'main o-pa ist am el-tes-ten'),
          GuideExample(
            'Die Zugspitze ist der höchste Berg Deutschlands.',
            {
              'id': 'Zugspitze adalah gunung tertinggi di Jerman.',
              'en': 'The Zugspitze is the highest mountain in Germany.',
            },
            romaji: 'di tsuk-sypi-tse ist der hekh-ste berk doitsy-lants',
          ),
        ],
      ),
      GuideSection(
        title: const {'id': 'Bentuk tidak teratur', 'en': 'Irregular forms'},
        body: const {
          'id':
              'Beberapa bentuk harus dihafal: gut – besser – am besten; viel – mehr – am meisten; gern – lieber – am liebsten; hoch – höher – am höchsten; nah – näher – am nächsten.',
          'en':
              'Some forms must be memorised: gut – besser – am besten; viel – mehr – am meisten; gern – lieber – am liebsten; hoch – höher – am höchsten; nah – näher – am nächsten.',
        },
        examples: const [
          GuideExample('Heute geht es mir besser.', {
            'id': 'Hari ini saya merasa lebih baik.',
            'en': 'I feel better today.',
          }, romaji: 'hoi-te geyt es mir be-ser'),
          GuideExample(
            'Ich trinke lieber Tee als Kaffee.',
            {
              'id': 'Saya lebih suka minum teh daripada kopi.',
              'en': 'I prefer tea to coffee.',
            },
            romaji: 'ikh tring-ke li-ber te als ka-fe',
          ),
          GuideExample('Am liebsten esse ich Reis.', {
            'id': 'Yang paling saya suka adalah makan nasi.',
            'en': 'Most of all I like eating rice.',
          }, romaji: 'am lip-sten e-se ikh rais'),
          GuideExample('Er verdient mehr als ich.', {
            'id': 'Gajinya lebih besar daripada saya.',
            'en': 'He earns more than me.',
          }, romaji: 'er fer-dint mer als ikh'),
        ],
      ),
      GuideSection(
        title: const {'id': 'Setelah der/die/das', 'en': 'After der/die/das'},
        body: const {
          'id':
              'Kata sifat setelah sein tidak berubah (Das Auto ist neu). Di depan kata benda dengan der/die/das, akhirannya hanya -e atau -en. Nominativ tunggal: der neue Kollege, die neue Kollegin, das neue Auto → -e. Akkusativ: den neuen Arzt (maskulin -en), die neue, das neue. Jamak dan Dativ selalu -en: die neuen Kollegen, mit dem neuen Auto.',
          'en':
              'Adjectives after sein do not change (Das Auto ist neu). Before a noun with der/die/das the ending is only -e or -en. Nominative singular: der neue Kollege, die neue Kollegin, das neue Auto → -e. Accusative: den neuen Arzt (masculine -en), die neue, das neue. Plural and dative are always -en: die neuen Kollegen, mit dem neuen Auto.',
        },
        examples: const [
          GuideExample(
            'Der neue Kollege kommt aus Polen.',
            {
              'id': 'Rekan kerja baru itu berasal dari Polandia.',
              'en': 'The new colleague is from Poland.',
            },
            romaji: 'der noi-e ko-le-ge komt aus po-len',
          ),
          GuideExample('Ich nehme die rote Jacke.', {
            'id': 'Saya ambil jaket yang merah.',
            'en': 'I\'ll take the red jacket.',
          }, romaji: 'ikh ne-me di ro-te ya-ke'),
          GuideExample('Ich kenne den neuen Arzt.', {
            'id': 'Saya kenal dokter yang baru itu.',
            'en': 'I know the new doctor.',
          }, romaji: 'ikh ke-ne den noi-en artst'),
          GuideExample('Wir wohnen im alten Haus.', {
            'id': 'Kami tinggal di rumah yang lama itu.',
            'en': 'We live in the old house.',
          }, romaji: 'vir vo-nen im al-ten haus'),
        ],
      ),
      GuideSection(
        title: const {
          'id': 'Setelah ein/kein/mein',
          'en': 'After ein/kein/mein',
        },
        body: const {
          'id':
              'Karena ein tidak menunjukkan jenis kata benda, kata sifatnya yang menunjukkan: ein neuer Job (maskulin -er), eine neue Stelle (feminin -e), ein neues Handy (netral -es). Akkusativ: einen neuen Job, eine neue Stelle, ein neues Handy. Dativ dan jamak (meine, keine): -en.',
          'en':
              'Since ein does not show the gender, the adjective does: ein neuer Job (masculine -er), eine neue Stelle (feminine -e), ein neues Handy (neuter -es). Accusative: einen neuen Job, eine neue Stelle, ein neues Handy. Dative and plural (meine, keine): -en.',
        },
        examples: const [
          GuideExample('Das ist ein guter Job.', {
            'id': 'Itu pekerjaan yang bagus.',
            'en': 'That is a good job.',
          }, romaji: 'das ist ain gu-ter dyob'),
          GuideExample(
            'Ich suche eine kleine Wohnung.',
            {
              'id': 'Saya mencari apartemen kecil.',
              'en': 'I am looking for a small flat.',
            },
            romaji: 'ikh zu-khe ai-ne klai-ne vo-nung',
          ),
          GuideExample('Er hat ein neues Handy.', {
            'id': 'Dia punya HP baru.',
            'en': 'He has a new mobile phone.',
          }, romaji: 'er hat ain noi-es hen-di'),
          GuideExample(
            'Ich habe einen neuen Arbeitsvertrag.',
            {
              'id': 'Saya punya kontrak kerja baru.',
              'en': 'I have a new employment contract.',
            },
            romaji: 'ikh ha-be ai-nen noi-en ar-baits-fer-trak',
          ),
          GuideExample(
            'Ich wohne mit meinen netten Kollegen.',
            {
              'id': 'Saya tinggal bersama rekan-rekan kerja saya yang ramah.',
              'en': 'I live with my nice colleagues.',
            },
            romaji: 'ikh vo-ne mit mai-nen ne-ten ko-le-gen',
          ),
        ],
      ),
    ],
  ),
];
