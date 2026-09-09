import '../models/listening.dart';
import 'mcq_bank.dart';

/// Latihan Dengar Jerman: Hören Dasar (gratis) dan Goethe A1/A2 Hören
/// (premium). Konten disusun sendiri untuk latihan, bukan soal resmi.
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

final List<ListeningPack> deListeningPacks = [
  ListeningPack(
    id: 'de_listen_basic',
    emoji: '🎧',
    title: const {'id': 'Hören Dasar', 'en': 'Basic Listening'},
    subtitle: const {
      'id': 'percakapan & pengumuman sehari-hari',
      'en': 'everyday talks & announcements',
    },
    premium: false,
    maxPlays: 0,
    passages: _deBasic,
  ),
  ListeningPack(
    id: 'de_listen_goethe',
    emoji: '🇩🇪',
    title: const {'id': 'Goethe A1/A2 Hören', 'en': 'Goethe A1/A2 Hören'},
    subtitle: const {
      'id': 'pengumuman, pesan suara & monolog',
      'en': 'announcements, voicemails & monologues',
    },
    premium: true,
    maxPlays: 2,
    passages: _deGoethe,
  ),
];

// ---------------------------------------------------------------------------
// Jerman — Hören Dasar (gratis, putar bebas)
// ---------------------------------------------------------------------------
final List<ListeningPassage> _deBasic = [
  _p(
    'de_b1',
    'Di Toko Roti',
    'At the Bakery',
    'Guten Morgen! Was darf es sein? Ich möchte drei Brötchen und ein Vollkornbrot, bitte. Gern. Die Brötchen kosten heute nur vierzig Cent das Stück. Möchten Sie auch einen Kaffee? Nein, danke. Das macht dann vier Euro zwanzig.',
    {
      'id':
          'Selamat pagi! Mau pesan apa? Saya mau tiga roti kecil dan satu roti gandum utuh. Baik. Roti kecil hari ini hanya 40 sen per buah. Mau kopi juga? Tidak, terima kasih. Totalnya 4 euro 20.',
      'en':
          'Good morning! What would you like? I would like three rolls and one wholegrain loaf, please. Certainly. The rolls are only forty cents each today. Would you like a coffee too? No, thanks. That comes to four euros twenty.',
    },
    [
      _q(
        'Berapa roti kecil yang dibeli?',
        'How many rolls does the customer buy?',
        ['Drei', 'Zwei', 'Vier', 'Fünf'],
      ),
      _q('Roti apa lagi yang dibeli?', 'What else does the customer buy?', [
        'Ein Vollkornbrot',
        'Einen Kuchen',
        'Ein Weißbrot',
        'Eine Brezel',
      ]),
      _q('Berapa harga satu roti kecil?', 'How much is one roll?', [
        'Vierzig Cent',
        'Vierzehn Cent',
        'Vier Euro',
        'Zwanzig Cent',
      ]),
      _q('Apa yang ditolak pelanggan?', 'What does the customer decline?', [
        'Einen Kaffee',
        'Eine Tüte',
        'Einen Tee',
        'Eine Quittung',
      ]),
      _q('Berapa total yang harus dibayar?', 'What is the total?', [
        'Vier Euro zwanzig',
        'Vier Euro zwölf',
        'Zwei Euro vierzig',
        'Vierzehn Euro',
      ]),
    ],
  ),
  _p(
    'de_b2',
    'Pengumuman di Stasiun',
    'Station Announcement',
    'Achtung an Gleis sieben. Der Zug nach München, Abfahrt zwölf Uhr fünfzehn, hat heute etwa zwanzig Minuten Verspätung. Grund dafür ist eine Störung an der Strecke. Reisende nach Nürnberg nutzen bitte den Zug auf Gleis drei. Wir bitten um Entschuldigung.',
    {
      'id':
          'Perhatian di peron tujuh. Kereta ke München, keberangkatan pukul 12.15, hari ini terlambat sekitar 20 menit. Penyebabnya gangguan di jalur. Penumpang ke Nürnberg silakan naik kereta di peron tiga. Kami mohon maaf.',
      'en':
          'Attention on platform seven. The train to Munich, departing at twelve fifteen, is about twenty minutes late today. The reason is a fault on the line. Passengers to Nuremberg please use the train on platform three. We apologize.',
    },
    [
      _q(
        'Ke mana kereta yang terlambat?',
        'Where is the delayed train going?',
        ['Nach München', 'Nach Nürnberg', 'Nach Berlin', 'Nach Hamburg'],
      ),
      _q('Berapa lama keterlambatannya?', 'How late is the train?', [
        'Etwa zwanzig Minuten',
        'Etwa zwölf Minuten',
        'Etwa zwei Minuten',
        'Eine Stunde',
      ]),
      _q('Apa penyebabnya?', 'What is the reason?', [
        'Eine Störung an der Strecke',
        'Schlechtes Wetter',
        'Ein Unfall',
        'Zu viele Reisende',
      ]),
      _q(
        'Di peron mana kereta ke Nürnberg?',
        'Which platform is the train to Nuremberg on?',
        ['Gleis drei', 'Gleis sieben', 'Gleis zwölf', 'Gleis zwei'],
      ),
      _q(
        'Pukul berapa keberangkatan yang dijadwalkan?',
        'What is the scheduled departure time?',
        [
          'Zwölf Uhr fünfzehn',
          'Zwölf Uhr fünfzig',
          'Zwei Uhr fünfzehn',
          'Zwanzig Uhr',
        ],
      ),
    ],
  ),
  _p(
    'de_b3',
    'Di Dokter',
    "At the Doctor's",
    'Guten Tag, Frau Weber. Was fehlt Ihnen? Ich habe seit drei Tagen Halsschmerzen und Husten. Haben Sie Fieber? Ja, gestern Abend achtunddreißig fünf. Ich schreibe Ihnen ein Rezept. Nehmen Sie die Tabletten zweimal täglich und trinken Sie viel Tee. Kommen Sie am Montag wieder.',
    {
      'id':
          'Selamat siang, Bu Weber. Apa keluhannya? Sudah tiga hari sakit tenggorokan dan batuk. Ada demam? Ya, tadi malam 38,5. Saya tulis resep. Minum tablet dua kali sehari dan banyak minum teh. Datang lagi hari Senin.',
      'en':
          'Good afternoon, Ms. Weber. What is wrong? I have had a sore throat and a cough for three days. Do you have a fever? Yes, thirty-eight point five last night. I will write you a prescription. Take the tablets twice a day and drink plenty of tea. Come back on Monday.',
    },
    [
      _q('Sudah berapa lama sakit?', 'How long has she been ill?', [
        'Seit drei Tagen',
        'Seit drei Wochen',
        'Seit gestern',
        'Seit einem Monat',
      ]),
      _q('Apa keluhannya?', 'What are her symptoms?', [
        'Halsschmerzen und Husten',
        'Bauchschmerzen',
        'Kopfschmerzen',
        'Rückenschmerzen',
      ]),
      _q(
        'Berapa suhu tubuhnya tadi malam?',
        'What was her temperature last night?',
        [
          'Achtunddreißig fünf',
          'Siebenunddreißig fünf',
          'Achtunddreißig',
          'Neununddreißig',
        ],
      ),
      _q(
        'Berapa kali sehari tablet diminum?',
        'How often should she take the tablets?',
        ['Zweimal täglich', 'Einmal täglich', 'Dreimal täglich', 'Nur abends'],
      ),
      _q('Kapan dia harus datang lagi?', 'When should she come back?', [
        'Am Montag',
        'Am Freitag',
        'Morgen',
        'Nächsten Monat',
      ]),
    ],
  ),
  _p(
    'de_b4',
    'Ramalan Cuaca',
    'Weather Forecast',
    'Und nun das Wetter. Am Vormittag ist es bewölkt, am Nachmittag scheint die Sonne bei zweiundzwanzig Grad. In der Nacht kann es im Süden regnen. Am Wochenende wird es kühler, nur noch fünfzehn Grad, und es ist windig. Nehmen Sie eine Jacke mit.',
    {
      'id':
          'Dan sekarang cuaca. Pagi berawan, sore cerah dengan suhu 22 derajat. Malam bisa hujan di selatan. Akhir pekan lebih dingin, hanya 15 derajat, dan berangin. Bawalah jaket.',
      'en':
          'And now the weather. In the morning it is cloudy; in the afternoon the sun shines at twenty-two degrees. At night it may rain in the south. At the weekend it gets cooler, only fifteen degrees, and it is windy. Take a jacket.',
    },
    [
      _q('Bagaimana cuaca pagi ini?', 'What is the weather in the morning?', [
        'Bewölkt',
        'Sonnig',
        'Regnerisch',
        'Windig',
      ]),
      _q('Berapa suhu sore ini?', 'What is the afternoon temperature?', [
        'Zweiundzwanzig Grad',
        'Fünfzehn Grad',
        'Zwölf Grad',
        'Dreißig Grad',
      ]),
      _q('Di mana bisa hujan malam ini?', 'Where might it rain tonight?', [
        'Im Süden',
        'Im Norden',
        'Im Westen',
        'Überall',
      ]),
      _q('Berapa suhu akhir pekan?', 'What is the weekend temperature?', [
        'Fünfzehn Grad',
        'Zweiundzwanzig Grad',
        'Fünfundzwanzig Grad',
        'Zehn Grad',
      ]),
      _q('Apa sarannya?', 'What is the advice?', [
        'Eine Jacke mitnehmen',
        'Zu Hause bleiben',
        'Einen Schirm kaufen',
        'Viel trinken',
      ]),
    ],
  ),
  _p(
    'de_b5',
    'Di Supermarket',
    'At the Supermarket',
    'Entschuldigung, wo finde ich die Milch? Die Milchprodukte sind ganz hinten links, neben dem Käse. Und haben Sie auch frisches Brot? Ja, die Bäckerei ist direkt am Eingang. Heute sind Äpfel im Angebot, ein Kilo für einen Euro neunundneunzig. Vielen Dank!',
    {
      'id':
          'Permisi, di mana susu? Produk susu ada paling belakang sebelah kiri, di samping keju. Ada roti segar juga? Ya, toko roti tepat di pintu masuk. Hari ini apel diskon, satu kilo 1,99 euro. Terima kasih banyak!',
      'en':
          'Excuse me, where can I find the milk? The dairy products are at the very back on the left, next to the cheese. And do you also have fresh bread? Yes, the bakery is right at the entrance. Apples are on offer today, one kilo for one euro ninety-nine. Thank you very much!',
    },
    [
      _q(
        'Apa yang dicari pelanggan pertama kali?',
        'What does the customer look for first?',
        ['Die Milch', 'Das Brot', 'Die Äpfel', 'Den Käse'],
      ),
      _q('Di mana produk susu berada?', 'Where are the dairy products?', [
        'Ganz hinten links',
        'Am Eingang',
        'Ganz vorne rechts',
        'In der Mitte',
      ]),
      _q(
        'Di samping apa produk susu?',
        'What are the dairy products next to?',
        [
          'Neben dem Käse',
          'Neben dem Brot',
          'Neben dem Obst',
          'Neben der Kasse',
        ],
      ),
      _q('Di mana toko rotinya?', 'Where is the bakery?', [
        'Direkt am Eingang',
        'Ganz hinten',
        'Im ersten Stock',
        'Neben der Milch',
      ]),
      _q('Berapa harga satu kilo apel?', 'How much is a kilo of apples?', [
        'Ein Euro neunundneunzig',
        'Neun Euro',
        'Ein Euro neunzig',
        'Zwei Euro neunundneunzig',
      ]),
    ],
  ),
  _p(
    'de_b6',
    'Undangan Ulang Tahun',
    'Birthday Invitation',
    'Hallo Lena, hier ist Tim. Ich feiere am Samstag meinen Geburtstag und möchte dich einladen. Wir treffen uns um sieben Uhr bei mir zu Hause. Bring bitte etwas zu trinken mit, Essen habe ich genug. Sag mir bis Donnerstag, ob du kommst. Tschüss!',
    {
      'id':
          'Halo Lena, ini Tim. Sabtu aku merayakan ulang tahun dan ingin mengundangmu. Kita bertemu pukul tujuh di rumahku. Tolong bawa minuman, makanan sudah cukup. Beri tahu aku sebelum Kamis apakah kamu datang. Dah!',
      'en':
          "Hi Lena, it's Tim. I'm celebrating my birthday on Saturday and want to invite you. We meet at seven at my place. Please bring something to drink; I have enough food. Let me know by Thursday if you're coming. Bye!",
    },
    [
      _q('Siapa yang berulang tahun?', 'Whose birthday is it?', [
        'Tim',
        'Lena',
        'Anna',
        'Max',
      ]),
      _q('Hari apa pestanya?', 'On which day is the party?', [
        'Am Samstag',
        'Am Donnerstag',
        'Am Sonntag',
        'Am Freitag',
      ]),
      _q('Jam berapa mereka bertemu?', 'What time do they meet?', [
        'Um sieben Uhr',
        'Um sechs Uhr',
        'Um acht Uhr',
        'Um neun Uhr',
      ]),
      _q('Apa yang harus dibawa Lena?', 'What should Lena bring?', [
        'Etwas zu trinken',
        'Etwas zu essen',
        'Einen Kuchen',
        'Musik',
      ]),
      _q('Sampai kapan Lena harus menjawab?', 'By when should Lena reply?', [
        'Bis Donnerstag',
        'Bis Samstag',
        'Bis morgen',
        'Bis Sonntag',
      ]),
    ],
  ),
  _p(
    'de_b7',
    'Rutinitas Pagi',
    'Morning Routine',
    'Ich stehe jeden Tag um halb sieben auf. Zuerst dusche ich, dann frühstücke ich mit meiner Familie. Um acht Uhr fahre ich mit dem Fahrrad zur Arbeit, das dauert ungefähr fünfzehn Minuten. Mittags esse ich in der Kantine. Abends koche ich gern und sehe fern.',
    {
      'id':
          'Saya bangun setiap hari pukul setengah tujuh. Pertama mandi, lalu sarapan dengan keluarga. Pukul delapan saya bersepeda ke kantor, sekitar 15 menit. Siang makan di kantin. Malam saya suka memasak dan menonton TV.',
      'en':
          'I get up every day at half past six. First I shower, then I have breakfast with my family. At eight I cycle to work, which takes about fifteen minutes. At noon I eat in the canteen. In the evening I like cooking and watching TV.',
    },
    [
      _q('Jam berapa dia bangun?', 'What time does the speaker get up?', [
        'Um halb sieben',
        'Um sieben',
        'Um halb acht',
        'Um sechs',
      ]),
      _q(
        'Apa yang dilakukan pertama kali?',
        'What does the speaker do first?',
        ['Duschen', 'Frühstücken', 'Fernsehen', 'Kochen'],
      ),
      _q('Bagaimana dia ke kantor?', 'How does the speaker get to work?', [
        'Mit dem Fahrrad',
        'Mit dem Bus',
        'Mit dem Auto',
        'Zu Fuß',
      ]),
      _q('Berapa lama perjalanannya?', 'How long does the trip take?', [
        'Ungefähr fünfzehn Minuten',
        'Ungefähr fünfzig Minuten',
        'Eine Stunde',
        'Fünf Minuten',
      ]),
      _q('Di mana dia makan siang?', 'Where does the speaker have lunch?', [
        'In der Kantine',
        'Zu Hause',
        'Im Restaurant',
        'Im Park',
      ]),
    ],
  ),
  _p(
    'de_b8',
    'Menanyakan Arah',
    'Asking for Directions',
    'Entschuldigung, wie komme ich zum Bahnhof? Gehen Sie hier geradeaus bis zur Ampel, dann links in die Schillerstraße. Nach etwa zweihundert Metern sehen Sie rechts die Post. Der Bahnhof ist direkt dahinter. Zu Fuß brauchen Sie zehn Minuten. Danke schön!',
    {
      'id':
          'Permisi, bagaimana ke stasiun? Lurus sampai lampu lalu lintas, lalu belok kiri ke Schillerstraße. Setelah sekitar 200 meter ada kantor pos di kanan. Stasiun tepat di belakangnya. Jalan kaki sepuluh menit. Terima kasih!',
      'en':
          'Excuse me, how do I get to the station? Go straight ahead to the traffic light, then left into Schillerstraße. After about two hundred metres you will see the post office on the right. The station is right behind it. It takes ten minutes on foot. Thank you!',
    },
    [
      _q(
        'Ke mana orang itu ingin pergi?',
        'Where does the person want to go?',
        ['Zum Bahnhof', 'Zur Post', 'Zur Schule', 'Zum Supermarkt'],
      ),
      _q(
        'Ke arah mana belok di lampu lalu lintas?',
        'Which way at the traffic light?',
        ['Links', 'Rechts', 'Geradeaus', 'Zurück'],
      ),
      _q('Apa nama jalannya?', 'What is the street called?', [
        'Schillerstraße',
        'Goethestraße',
        'Bahnhofstraße',
        'Hauptstraße',
      ]),
      _q('Apa yang terlihat di kanan?', 'What can be seen on the right?', [
        'Die Post',
        'Die Bank',
        'Ein Café',
        'Die Kirche',
      ]),
      _q('Berapa lama jalan kaki?', 'How long does it take on foot?', [
        'Zehn Minuten',
        'Zwanzig Minuten',
        'Zwei Minuten',
        'Eine halbe Stunde',
      ]),
    ],
  ),
];

// ---------------------------------------------------------------------------
// Jerman — Goethe A1/A2 Hören (premium, 2x putar)
// ---------------------------------------------------------------------------
final List<ListeningPassage> _deGoethe = [
  _p(
    'de_g1',
    'Pesan Suara Kantor',
    'Office Voicemail',
    'Guten Tag, Herr Schmidt, hier spricht Frau Bauer von der Firma Neumann. Unser Termin am Dienstag um zehn Uhr muss leider verschoben werden. Passt es Ihnen am Mittwoch um vierzehn Uhr? Bitte rufen Sie mich unter der Nummer null drei null, vier fünf sechs, sieben acht zurück. Vielen Dank und auf Wiederhören.',
    {
      'id':
          'Selamat siang, Pak Schmidt, ini Bu Bauer dari perusahaan Neumann. Janji kita Selasa pukul sepuluh sayangnya harus digeser. Apakah Rabu pukul 14.00 cocok? Mohon telepon balik ke nomor 030 456 78. Terima kasih dan sampai jumpa.',
      'en':
          'Good afternoon, Mr. Schmidt, this is Ms. Bauer from the Neumann company. Our appointment on Tuesday at ten unfortunately has to be postponed. Would Wednesday at two p.m. suit you? Please call me back on 030 456 78. Thank you and goodbye.',
    },
    [
      _q('Siapa yang menelepon?', 'Who is calling?', [
        'Frau Bauer',
        'Herr Schmidt',
        'Herr Neumann',
        'Frau Schmidt',
      ]),
      _q('Kapan janji semula?', 'When was the original appointment?', [
        'Dienstag um zehn Uhr',
        'Mittwoch um zehn Uhr',
        'Dienstag um vierzehn Uhr',
        'Montag um neun Uhr',
      ]),
      _q('Waktu baru yang diusulkan?', 'What new time is suggested?', [
        'Mittwoch um vierzehn Uhr',
        'Dienstag um vierzehn Uhr',
        'Mittwoch um zehn Uhr',
        'Donnerstag um zwölf Uhr',
      ]),
      _q(
        'Apa yang harus dilakukan Pak Schmidt?',
        'What should Mr. Schmidt do?',
        ['Zurückrufen', 'Eine E-Mail schreiben', 'Ins Büro kommen', 'Warten'],
      ),
      _q(
        'Berapa awalan nomor teleponnya?',
        'How does the phone number begin?',
        [
          'Null drei null',
          'Null vier null',
          'Null drei drei',
          'Null acht null',
        ],
      ),
    ],
  ),
  _p(
    'de_g2',
    'Pengumuman di Sekolah Bahasa',
    'Language School Announcement',
    'Liebe Kursteilnehmer, der Deutschkurs am Freitag fällt aus, weil die Lehrerin krank ist. Der Unterricht wird am Samstag von neun bis zwölf Uhr nachgeholt. Bitte bringen Sie Ihr Arbeitsbuch und einen Bleistift mit. Die Prüfung findet wie geplant am fünfzehnten Juni statt.',
    {
      'id':
          'Peserta kursus yang terhormat, kursus bahasa Jerman hari Jumat ditiadakan karena gurunya sakit. Pelajaran diganti hari Sabtu pukul sembilan sampai dua belas. Bawalah buku latihan dan pensil. Ujian tetap berlangsung sesuai rencana pada 15 Juni.',
      'en':
          'Dear course participants, the German course on Friday is cancelled because the teacher is ill. The lesson will be made up on Saturday from nine to twelve. Please bring your workbook and a pencil. The exam takes place as planned on the fifteenth of June.',
    },
    [
      _q(
        'Mengapa kursus Jumat ditiadakan?',
        'Why is the Friday course cancelled?',
        [
          'Die Lehrerin ist krank',
          'Es ist ein Feiertag',
          'Der Raum ist besetzt',
          'Es gibt Prüfungen',
        ],
      ),
      _q('Kapan kelas pengganti?', 'When is the make-up lesson?', [
        'Samstag von neun bis zwölf',
        'Freitag von neun bis zwölf',
        'Samstag von zwölf bis drei',
        'Sonntag um neun',
      ]),
      _q('Apa yang harus dibawa?', 'What should participants bring?', [
        'Arbeitsbuch und Bleistift',
        'Laptop und Wörterbuch',
        'Nur einen Stift',
        'Essen und Trinken',
      ]),
      _q('Kapan ujiannya?', 'When is the exam?', [
        'Am fünfzehnten Juni',
        'Am fünften Juni',
        'Am fünfzehnten Juli',
        'Am ersten Juni',
      ]),
      _q('Apa yang dikatakan tentang ujian?', 'What is said about the exam?', [
        'Sie findet wie geplant statt',
        'Sie wird verschoben',
        'Sie fällt aus',
        'Sie ist schon vorbei',
      ]),
    ],
  ),
  _p(
    'de_g3',
    'Mencari Apartemen',
    'Looking for a Flat',
    'Guten Tag, ich rufe wegen der Wohnungsanzeige an. Ja, die Wohnung hat zwei Zimmer, eine Küche und ein Bad, insgesamt fünfundfünfzig Quadratmeter. Die Miete beträgt sechshundertfünfzig Euro warm. Sie liegt im dritten Stock ohne Aufzug, aber die U-Bahn ist nur fünf Minuten entfernt. Sie können sie morgen um achtzehn Uhr besichtigen.',
    {
      'id':
          'Selamat siang, saya menelepon soal iklan apartemen. Ya, apartemennya dua kamar, dapur, dan kamar mandi, total 55 meter persegi. Sewanya 650 euro sudah termasuk biaya. Di lantai tiga tanpa lift, tapi U-Bahn hanya lima menit. Bisa dilihat besok pukul 18.00.',
      'en':
          'Good afternoon, I am calling about the flat advertisement. Yes, the flat has two rooms, a kitchen and a bathroom, fifty-five square metres in total. The rent is six hundred and fifty euros including utilities. It is on the third floor without a lift, but the underground is only five minutes away. You can view it tomorrow at six p.m.',
    },
    [
      _q('Berapa kamar apartemennya?', 'How many rooms does the flat have?', [
        'Zwei Zimmer',
        'Drei Zimmer',
        'Ein Zimmer',
        'Vier Zimmer',
      ]),
      _q('Berapa luasnya?', 'How big is it?', [
        'Fünfundfünfzig Quadratmeter',
        'Fünfundvierzig Quadratmeter',
        'Sechzig Quadratmeter',
        'Fünfzig Quadratmeter',
      ]),
      _q('Berapa sewanya?', 'How much is the rent?', [
        'Sechshundertfünfzig Euro',
        'Sechshundertfünfzehn Euro',
        'Fünfhundertfünfzig Euro',
        'Siebenhundert Euro',
      ]),
      _q('Apa kekurangannya?', 'What is the downside?', [
        'Kein Aufzug',
        'Kein Bad',
        'Keine Küche',
        'Weit von der U-Bahn',
      ]),
      _q('Kapan bisa dilihat?', 'When can it be viewed?', [
        'Morgen um achtzehn Uhr',
        'Heute um achtzehn Uhr',
        'Morgen um acht Uhr',
        'Am Wochenende',
      ]),
    ],
  ),
  _p(
    'de_g4',
    'Pengumuman Toko',
    'Store Announcement',
    'Liebe Kundinnen und Kunden, heute gibt es in der zweiten Etage alle Winterjacken zum halben Preis. Außerdem erhalten Sie ab einem Einkauf von fünfzig Euro einen Gutschein für unser Café. Unser Geschäft schließt heute bereits um achtzehn Uhr. Wir wünschen Ihnen noch einen schönen Einkauf.',
    {
      'id':
          'Pelanggan yang terhormat, hari ini di lantai dua semua jaket musim dingin setengah harga. Selain itu, belanja mulai 50 euro mendapat voucher untuk kafe kami. Toko kami hari ini tutup lebih awal pukul 18.00. Selamat berbelanja.',
      'en':
          'Dear customers, today on the second floor all winter jackets are half price. In addition, from a purchase of fifty euros you receive a voucher for our café. Our store closes early today at six p.m. We wish you a pleasant shopping experience.',
    },
    [
      _q('Apa yang diskon?', 'What is on sale?', [
        'Winterjacken',
        'Schuhe',
        'Hosen',
        'Taschen',
      ]),
      _q('Berapa diskonnya?', 'How much is the discount?', [
        'Der halbe Preis',
        'Zwanzig Prozent',
        'Zehn Prozent',
        'Ein Drittel',
      ]),
      _q('Di lantai berapa?', 'On which floor?', [
        'In der zweiten Etage',
        'In der ersten Etage',
        'Im Erdgeschoss',
        'In der dritten Etage',
      ]),
      _q(
        'Mulai belanja berapa dapat voucher?',
        'From what purchase amount is there a voucher?',
        ['Fünfzig Euro', 'Fünfzehn Euro', 'Hundert Euro', 'Zwanzig Euro'],
      ),
      _q(
        'Jam berapa toko tutup hari ini?',
        'What time does the store close today?',
        [
          'Um achtzehn Uhr',
          'Um zwanzig Uhr',
          'Um sechzehn Uhr',
          'Um neunzehn Uhr',
        ],
      ),
    ],
  ),
  _p(
    'de_g5',
    'Liburan di Pegunungan',
    'Holiday in the Mountains',
    'Letzten Sommer war ich mit meiner Freundin zwei Wochen in Österreich. Wir haben in einem kleinen Dorf in den Bergen gewohnt und sind jeden Tag gewandert. Das Wetter war meistens gut, nur an zwei Tagen hat es geregnet. Am besten hat mir der See gefallen, dort haben wir oft gebadet. Nächstes Jahr wollen wir wieder hinfahren.',
    {
      'id':
          'Musim panas lalu saya dan pacar saya dua minggu di Austria. Kami tinggal di desa kecil di pegunungan dan setiap hari mendaki. Cuacanya kebanyakan bagus, hanya dua hari hujan. Yang paling saya suka danaunya, kami sering berenang di sana. Tahun depan kami mau ke sana lagi.',
      'en':
          'Last summer I spent two weeks in Austria with my girlfriend. We stayed in a small village in the mountains and hiked every day. The weather was mostly good; it rained on only two days. I liked the lake best; we often swam there. Next year we want to go there again.',
    },
    [
      _q('Di mana mereka berlibur?', 'Where did they go on holiday?', [
        'In Österreich',
        'In der Schweiz',
        'In Italien',
        'In Deutschland',
      ]),
      _q('Berapa lama liburannya?', 'How long was the holiday?', [
        'Zwei Wochen',
        'Eine Woche',
        'Zwei Tage',
        'Einen Monat',
      ]),
      _q('Apa yang dilakukan setiap hari?', 'What did they do every day?', [
        'Wandern',
        'Schwimmen',
        'Ski fahren',
        'Einkaufen',
      ]),
      _q('Berapa hari hujan?', 'On how many days did it rain?', [
        'An zwei Tagen',
        'An zehn Tagen',
        'An einem Tag',
        'Nie',
      ]),
      _q('Apa yang paling disukai?', 'What did the speaker like best?', [
        'Der See',
        'Das Dorf',
        'Das Essen',
        'Die Berge',
      ]),
    ],
  ),
  _p(
    'de_g6',
    'Di Kantor Dokter (Telepon)',
    'Calling the Doctor',
    'Praxis Dr. Müller, guten Tag. Guten Tag, ich möchte einen Termin vereinbaren. Ich habe starke Rückenschmerzen. Sind Sie schon Patient bei uns? Ja, mein Name ist Peter Lang. Ich kann Ihnen morgen um acht Uhr dreißig anbieten. Das passt. Bitte bringen Sie Ihre Versichertenkarte mit und kommen Sie zehn Minuten früher.',
    {
      'id':
          'Praktik Dr. Müller, selamat siang. Selamat siang, saya ingin membuat janji. Punggung saya sangat sakit. Sudah jadi pasien kami? Ya, nama saya Peter Lang. Saya bisa tawarkan besok pukul 08.30. Cocok. Bawa kartu asuransi dan datang sepuluh menit lebih awal.',
      'en':
          "Dr. Müller's practice, good afternoon. Good afternoon, I would like to make an appointment. I have severe back pain. Are you already a patient with us? Yes, my name is Peter Lang. I can offer you tomorrow at eight thirty. That works. Please bring your insurance card and come ten minutes early.",
    },
    [
      _q('Apa keluhan penelepon?', "What is the caller's problem?", [
        'Starke Rückenschmerzen',
        'Kopfschmerzen',
        'Zahnschmerzen',
        'Fieber',
      ]),
      _q('Siapa nama penelepon?', "What is the caller's name?", [
        'Peter Lang',
        'Peter Müller',
        'Paul Lang',
        'Peter Klein',
      ]),
      _q('Kapan janjinya?', 'When is the appointment?', [
        'Morgen um acht Uhr dreißig',
        'Heute um acht Uhr',
        'Morgen um neun Uhr dreißig',
        'Übermorgen um acht',
      ]),
      _q('Apa yang harus dibawa?', 'What should he bring?', [
        'Die Versichertenkarte',
        'Den Reisepass',
        'Bargeld',
        'Ein Rezept',
      ]),
      _q(
        'Berapa menit lebih awal dia harus datang?',
        'How many minutes early should he come?',
        [
          'Zehn Minuten',
          'Fünf Minuten',
          'Zwanzig Minuten',
          'Eine halbe Stunde',
        ],
      ),
    ],
  ),
  _p(
    'de_g7',
    'Pengumuman Kolam Renang',
    'Swimming Pool Announcement',
    'Liebe Badegäste, das Hallenbad ist im Sommer von sieben bis einundzwanzig Uhr geöffnet. Kinder unter sechs Jahren haben freien Eintritt. Eine Tageskarte für Erwachsene kostet vier Euro fünfzig, die Zehnerkarte vierzig Euro. Am Montag ist das Bad wegen Reinigung geschlossen. Bitte duschen Sie vor dem Schwimmen.',
    {
      'id':
          'Para pengunjung, kolam renang dalam ruangan musim panas buka pukul tujuh sampai 21.00. Anak di bawah enam tahun gratis. Tiket harian dewasa 4,50 euro, tiket sepuluh kali 40 euro. Senin kolam tutup untuk pembersihan. Mandilah sebelum berenang.',
      'en':
          'Dear guests, the indoor pool is open in summer from seven to nine p.m. Children under six have free entry. A day ticket for adults costs four euros fifty, the ten-visit card forty euros. On Monday the pool is closed for cleaning. Please shower before swimming.',
    },
    [
      _q('Jam berapa kolam tutup?', 'What time does the pool close?', [
        'Um einundzwanzig Uhr',
        'Um neunzehn Uhr',
        'Um zwanzig Uhr',
        'Um zweiundzwanzig Uhr',
      ]),
      _q('Siapa yang gratis masuk?', 'Who gets free entry?', [
        'Kinder unter sechs Jahren',
        'Alle Kinder',
        'Senioren',
        'Studenten',
      ]),
      _q('Berapa tiket harian dewasa?', 'How much is an adult day ticket?', [
        'Vier Euro fünfzig',
        'Vierzig Euro',
        'Vier Euro fünfzehn',
        'Fünf Euro',
      ]),
      _q('Mengapa Senin tutup?', 'Why is it closed on Monday?', [
        'Wegen Reinigung',
        'Wegen eines Feiertags',
        'Wegen Reparatur',
        'Wegen des Wetters',
      ]),
      _q(
        'Apa yang harus dilakukan sebelum berenang?',
        'What should you do before swimming?',
        ['Duschen', 'Essen', 'Bezahlen', 'Warten'],
      ),
    ],
  ),
  _p(
    'de_g8',
    'Pekerjaan Baru',
    'New Job',
    'Seit März arbeite ich als Verkäuferin in einem Buchladen in der Innenstadt. Ich arbeite von Dienstag bis Samstag, montags habe ich frei. Die Arbeit macht mir Spaß, weil ich gern lese und mit Menschen spreche. Nur der Weg ist lang: Ich brauche fünfundvierzig Minuten mit dem Bus. Deshalb suche ich eine Wohnung in der Nähe.',
    {
      'id':
          'Sejak Maret saya bekerja sebagai pramuniaga di toko buku di pusat kota. Saya kerja Selasa sampai Sabtu, Senin libur. Pekerjaannya menyenangkan karena saya suka membaca dan berbicara dengan orang. Hanya perjalanannya jauh: 45 menit naik bus. Karena itu saya mencari apartemen di dekatnya.',
      'en':
          'Since March I have been working as a sales assistant in a bookshop in the city centre. I work from Tuesday to Saturday; I have Mondays off. I enjoy the work because I like reading and talking to people. Only the commute is long: I need forty-five minutes by bus. That is why I am looking for a flat nearby.',
    },
    [
      _q(
        'Sejak kapan dia bekerja di sana?',
        'Since when has she worked there?',
        ['Seit März', 'Seit Mai', 'Seit Montag', 'Seit einem Jahr'],
      ),
      _q('Di mana dia bekerja?', 'Where does she work?', [
        'In einem Buchladen',
        'In einer Bäckerei',
        'In einem Café',
        'In einer Schule',
      ]),
      _q('Hari apa dia libur?', 'Which day is she off?', [
        'Montags',
        'Sonntags',
        'Samstags',
        'Dienstags',
      ]),
      _q(
        'Berapa lama perjalanan ke tempat kerja?',
        'How long is the commute?',
        [
          'Fünfundvierzig Minuten',
          'Fünfzehn Minuten',
          'Fünfundzwanzig Minuten',
          'Eine Stunde',
        ],
      ),
      _q('Apa yang dia cari?', 'What is she looking for?', [
        'Eine Wohnung in der Nähe',
        'Einen neuen Job',
        'Ein Auto',
        'Einen Busfahrplan',
      ]),
    ],
  ),
];
