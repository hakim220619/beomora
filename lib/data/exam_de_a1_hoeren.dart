/// Bank Hören A1 untuk mode Ujian: dialog pendek, pengumuman, dan pesan
/// telepon yang dibacakan TTS, meniru tipe soal Goethe-Zertifikat A1
/// (Start Deutsch 1) bagian Hören.
///
/// Tipe soal:
/// - Teil 1: dialog pendek sehari-hari (jam, harga, angka, apa yang dibeli).
/// - Teil 2: pengumuman di stasiun, bandara, supermarket.
/// - Teil 3: pesan telepon di mesin penjawab (siapa, kapan, apa yang harus
///   dilakukan).
///
/// Konten disusun sendiri (bukan salinan soal asli). Semua soal memakai
/// 4 pilihan; soal benar/salah diubah menjadi "Welche Aussage ist richtig?".
/// Pilihan PERTAMA pada [_q] selalu jawaban benar (`answer: 0`); layar
/// ujian mengacaknya.
library;

import '../models/listening.dart';
import 'mcq_bank.dart';

McqQuestion _q(String id, String en, List<String> options) =>
    McqQuestion(question: {'id': id, 'en': en}, options: options, answer: 0);

ListeningPassage _p(
  String id,
  String title,
  String transcript,
  Map<String, String> translation,
  List<McqQuestion> questions,
) => ListeningPassage(
  id: id,
  title: {'id': title, 'en': title},
  transcript: transcript,
  translation: translation,
  questions: questions,
);

const _true = 'Pernyataan mana yang benar?';
const _trueEn = 'Which statement is correct?';

final List<ListeningPassage> goetheA1Listening = [
  // -------------------------------------------------------------------------
  // Teil 1 – kurze Alltagsdialoge
  // -------------------------------------------------------------------------
  _p(
    'de_a1_h1_01',
    'Teil 1 – Dialog 1',
    'Frau: Entschuldigung, wie spät ist es? Mann: Es ist Viertel nach drei. Frau: Oh, schon so spät! Mein Bus fährt um halb vier. Mann: Dann haben Sie noch fünfzehn Minuten.',
    {
      'id':
          'Wanita: Permisi, jam berapa sekarang? Pria: Jam tiga lewat seperempat. Wanita: Oh, sudah sesiang ini! Bus saya berangkat jam setengah empat. Pria: Berarti Anda masih punya lima belas menit.',
      'en':
          'Woman: Excuse me, what time is it? Man: It is quarter past three. Woman: Oh, already that late! My bus leaves at half past three. Man: Then you still have fifteen minutes.',
    },
    [
      _q(
        'Jam berapa bus wanita itu berangkat?',
        'When does the woman\'s bus leave?',
        ['Um 15:30 Uhr', 'Um 15:15 Uhr', 'Um 14:30 Uhr', 'Um 15:45 Uhr'],
      ),
    ],
  ),
  _p(
    'de_a1_h1_02',
    'Teil 1 – Dialog 2',
    'Mann: Guten Tag, ich möchte ein Kilo Äpfel und zwei Bananen. Frau: Gern. Das macht zusammen drei Euro zwanzig. Mann: Hier sind fünf Euro. Frau: Und ein Euro achtzig zurück. Danke schön!',
    {
      'id':
          'Pria: Selamat siang, saya mau satu kilo apel dan dua pisang. Wanita: Baik. Semuanya tiga euro dua puluh. Pria: Ini lima euro. Wanita: Kembaliannya satu euro delapan puluh. Terima kasih!',
      'en':
          'Man: Good afternoon, I would like a kilo of apples and two bananas. Woman: Sure. That comes to three euros twenty altogether. Man: Here are five euros. Woman: And one euro eighty change. Thank you!',
    },
    [
      _q(
        'Berapa yang harus dibayar pria itu?',
        'How much does the man have to pay?',
        ['3,20 €', '1,80 €', '5,00 €', '2,30 €'],
      ),
      _q('Apa yang dibeli pria itu?', 'What does the man buy?', [
        'Äpfel und Bananen',
        'Äpfel und Birnen',
        'Nur Bananen',
        'Orangen und Äpfel',
      ]),
    ],
  ),
  _p(
    'de_a1_h1_03',
    'Teil 1 – Dialog 3',
    'Frau: Wann beginnt der Deutschkurs? Mann: Der Kurs beginnt am Montag, den vierten März. Frau: Und um wie viel Uhr? Mann: Um neun Uhr morgens, im Raum zwölf.',
    {
      'id':
          'Wanita: Kapan kursus bahasa Jerman dimulai? Pria: Kursus dimulai hari Senin, tanggal empat Maret. Wanita: Jam berapa? Pria: Jam sembilan pagi, di ruang dua belas.',
      'en':
          'Woman: When does the German course start? Man: The course starts on Monday, the fourth of March. Woman: And at what time? Man: At nine in the morning, in room twelve.',
    },
    [
      _q('Kapan kursus dimulai?', 'When does the course start?', [
        'Am Montag um 9 Uhr',
        'Am Montag um 12 Uhr',
        'Am Mittwoch um 9 Uhr',
        'Am Dienstag um 4 Uhr',
      ]),
      _q('Di ruang berapa kursusnya?', 'In which room is the course?', [
        'Raum 12',
        'Raum 4',
        'Raum 9',
        'Raum 20',
      ]),
    ],
  ),
  _p(
    'de_a1_h1_04',
    'Teil 1 – Dialog 4',
    'Mann: Hallo Anna, was machst du am Wochenende? Frau: Am Samstag besuche ich meine Eltern. Aber am Sonntag habe ich Zeit. Mann: Wollen wir am Sonntag ins Kino gehen? Frau: Ja, gern!',
    {
      'id':
          'Pria: Halo Anna, apa rencanamu akhir pekan ini? Wanita: Hari Sabtu aku mengunjungi orang tuaku. Tapi hari Minggu aku punya waktu. Pria: Mau ke bioskop hari Minggu? Wanita: Ya, mau!',
      'en':
          'Man: Hi Anna, what are you doing at the weekend? Woman: On Saturday I am visiting my parents. But on Sunday I have time. Man: Shall we go to the cinema on Sunday? Woman: Yes, I\'d love to!',
    },
    [
      _q(
        'Kapan mereka pergi ke bioskop?',
        'When are they going to the cinema?',
        ['Am Sonntag', 'Am Samstag', 'Am Freitag', 'Am Montag'],
      ),
    ],
  ),
  _p(
    'de_a1_h1_05',
    'Teil 1 – Dialog 5',
    'Frau: Wie ist Ihre Telefonnummer, bitte? Mann: Null eins fünf sieben, drei acht, zwei sechs, vier null. Frau: Noch einmal langsam, bitte. Mann: Null eins fünf sieben, drei acht, zwei sechs, vier null.',
    {
      'id':
          'Wanita: Berapa nomor telepon Anda? Pria: Nol satu lima tujuh, tiga delapan, dua enam, empat nol. Wanita: Sekali lagi pelan-pelan, ya. Pria: Nol satu lima tujuh, tiga delapan, dua enam, empat nol.',
      'en':
          'Woman: What is your phone number, please? Man: Zero one five seven, three eight, two six, four zero. Woman: Once more slowly, please. Man: Zero one five seven, three eight, two six, four zero.',
    },
    [
      _q('Berapa nomor telepon pria itu?', 'What is the man\'s phone number?', [
        '0157 382640',
        '0157 832640',
        '0175 382640',
        '0157 382604',
      ]),
    ],
  ),
  _p(
    'de_a1_h1_06',
    'Teil 1 – Dialog 6',
    'Mann: Ich brauche ein Ticket nach Hamburg. Was kostet das? Frau: Hin und zurück kostet es neunundfünfzig Euro. Mann: Und nur hin? Frau: Nur hin kostet es fünfunddreißig Euro. Mann: Dann nehme ich nur hin, bitte.',
    {
      'id':
          'Pria: Saya perlu tiket ke Hamburg. Berapa harganya? Wanita: Pulang-pergi lima puluh sembilan euro. Pria: Kalau sekali jalan? Wanita: Sekali jalan tiga puluh lima euro. Pria: Kalau begitu sekali jalan saja.',
      'en':
          'Man: I need a ticket to Hamburg. How much is it? Woman: A return ticket costs fifty-nine euros. Man: And one way? Woman: One way costs thirty-five euros. Man: Then just one way, please.',
    },
    [
      _q('Berapa yang dibayar pria itu?', 'How much does the man pay?', [
        '35 €',
        '59 €',
        '53 €',
        '95 €',
      ]),
    ],
  ),
  _p(
    'de_a1_h1_07',
    'Teil 1 – Dialog 7',
    'Frau: Guten Morgen, ich habe einen Termin bei Doktor Weber. Mein Name ist Fischer. Mann: Ja, Frau Fischer, Ihr Termin ist um zehn Uhr. Bitte nehmen Sie im Wartezimmer Platz. Frau: Danke. Muss ich lange warten? Mann: Nein, nur etwa zehn Minuten.',
    {
      'id':
          'Wanita: Selamat pagi, saya punya janji dengan Dokter Weber. Nama saya Fischer. Pria: Ya, Ibu Fischer, janji Anda jam sepuluh. Silakan duduk di ruang tunggu. Wanita: Terima kasih. Apakah saya harus menunggu lama? Pria: Tidak, hanya sekitar sepuluh menit.',
      'en':
          'Woman: Good morning, I have an appointment with Doctor Weber. My name is Fischer. Man: Yes, Mrs Fischer, your appointment is at ten o\'clock. Please take a seat in the waiting room. Woman: Thank you. Do I have to wait long? Man: No, only about ten minutes.',
    },
    [
      _q('Di mana wanita itu berada?', 'Where is the woman?', [
        'In einer Arztpraxis',
        'In einer Bank',
        'Im Supermarkt',
        'Am Bahnhof',
      ]),
      _q(_true, _trueEn, [
        'Frau Fischer muss nur kurz warten.',
        'Frau Fischer hat keinen Termin.',
        'Der Termin ist um elf Uhr.',
        'Frau Fischer muss eine Stunde warten.',
      ]),
    ],
  ),
  _p(
    'de_a1_h1_08',
    'Teil 1 – Dialog 8',
    'Mann: Entschuldigung, wo ist hier die Post? Frau: Gehen Sie hier geradeaus und dann die zweite Straße links. Die Post ist neben der Apotheke. Mann: Vielen Dank!',
    {
      'id':
          'Pria: Permisi, kantor pos di mana? Wanita: Jalan lurus dari sini, lalu jalan kedua belok kiri. Kantor posnya di sebelah apotek. Pria: Terima kasih banyak!',
      'en':
          'Man: Excuse me, where is the post office? Woman: Go straight on here and then take the second street on the left. The post office is next to the pharmacy. Man: Thank you very much!',
    },
    [
      _q('Di mana kantor pos?', 'Where is the post office?', [
        'Neben der Apotheke',
        'Neben dem Bahnhof',
        'Gegenüber der Bank',
        'Hinter dem Supermarkt',
      ]),
      _q('Bagaimana pria itu harus berjalan?', 'Which way should the man go?', [
        'Geradeaus, dann die zweite Straße links',
        'Geradeaus, dann die erste Straße rechts',
        'Die zweite Straße rechts',
        'Zurück und dann links',
      ]),
    ],
  ),
  _p(
    'de_a1_h1_09',
    'Teil 1 – Dialog 9',
    'Frau: Was möchten Sie trinken? Mann: Einen Kaffee mit Milch, bitte. Frau: Und möchten Sie auch etwas essen? Mann: Ja, ein Käsebrötchen, bitte. Frau: Gern. Ein Kaffee und ein Käsebrötchen, das macht vier Euro fünfzig.',
    {
      'id':
          'Wanita: Mau minum apa? Pria: Kopi pakai susu. Wanita: Mau makan sesuatu juga? Pria: Ya, roti isi keju. Wanita: Baik. Satu kopi dan satu roti keju, jadi empat euro lima puluh.',
      'en':
          'Woman: What would you like to drink? Man: A coffee with milk, please. Woman: And would you like something to eat too? Man: Yes, a cheese roll, please. Woman: Sure. One coffee and one cheese roll, that is four euros fifty.',
    },
    [
      _q('Apa yang dipesan pria itu?', 'What does the man order?', [
        'Kaffee und ein Käsebrötchen',
        'Tee und ein Käsebrötchen',
        'Kaffee und ein Stück Kuchen',
        'Milch und ein Wurstbrötchen',
      ]),
      _q('Berapa harganya?', 'How much does it cost?', [
        '4,50 €',
        '5,40 €',
        '4,15 €',
        '3,50 €',
      ]),
    ],
  ),
  _p(
    'de_a1_h1_10',
    'Teil 1 – Dialog 10',
    'Mann: Wann hat der Supermarkt geöffnet? Frau: Von Montag bis Samstag von sieben bis zweiundzwanzig Uhr. Mann: Und am Sonntag? Frau: Am Sonntag ist er geschlossen.',
    {
      'id':
          'Pria: Supermarket buka kapan? Wanita: Senin sampai Sabtu dari jam tujuh sampai jam dua puluh dua. Pria: Kalau hari Minggu? Wanita: Hari Minggu tutup.',
      'en':
          'Man: When is the supermarket open? Woman: Monday to Saturday from seven a.m. to ten p.m. Man: And on Sunday? Woman: On Sunday it is closed.',
    },
    [
      _q(_true, _trueEn, [
        'Am Sonntag ist der Supermarkt geschlossen.',
        'Der Supermarkt öffnet um neun Uhr.',
        'Am Samstag ist der Supermarkt geschlossen.',
        'Der Supermarkt schließt um zwanzig Uhr.',
      ]),
    ],
  ),
  _p(
    'de_a1_h1_11',
    'Teil 1 – Dialog 11',
    'Frau: Ich suche eine Jacke. Mann: Welche Größe haben Sie? Frau: Größe achtunddreißig. Mann: Hier ist eine schöne Jacke in Blau. Sie kostet neunundvierzig Euro. Frau: Haben Sie die auch in Schwarz? Mann: Ja, natürlich.',
    {
      'id':
          'Wanita: Saya mencari jaket. Pria: Ukuran Anda berapa? Wanita: Ukuran tiga puluh delapan. Pria: Ini ada jaket biru yang bagus. Harganya empat puluh sembilan euro. Wanita: Ada yang hitam juga? Pria: Ya, tentu.',
      'en':
          'Woman: I am looking for a jacket. Man: What size are you? Woman: Size thirty-eight. Man: Here is a nice jacket in blue. It costs forty-nine euros. Woman: Do you also have it in black? Man: Yes, of course.',
    },
    [
      _q(
        'Wanita itu memakai ukuran berapa?',
        'What size does the woman wear?',
        ['38', '36', '40', '49'],
      ),
      _q(
        'Warna apa yang diinginkan wanita itu?',
        'Which colour does the woman want?',
        ['Schwarz', 'Blau', 'Rot', 'Grau'],
      ),
    ],
  ),
  _p(
    'de_a1_h1_12',
    'Teil 1 – Dialog 12',
    'Mann: Wo wohnst du jetzt, Sara? Frau: Ich wohne jetzt in der Gartenstraße, Nummer siebzehn. Mann: Ist die Wohnung groß? Frau: Nein, sie hat nur zwei Zimmer, aber sie ist hell und billig.',
    {
      'id':
          'Pria: Sekarang kamu tinggal di mana, Sara? Wanita: Aku sekarang tinggal di Gartenstraße nomor tujuh belas. Pria: Apartemennya besar? Wanita: Tidak, hanya dua kamar, tapi terang dan murah.',
      'en':
          'Man: Where do you live now, Sara? Woman: I live in Gartenstraße now, number seventeen. Man: Is the flat big? Woman: No, it only has two rooms, but it is bright and cheap.',
    },
    [
      _q('Berapa nomor rumah Sara?', 'What is Sara\'s house number?', [
        '17',
        '70',
        '7',
        '27',
      ]),
      _q(_true, _trueEn, [
        'Die Wohnung hat zwei Zimmer.',
        'Die Wohnung ist sehr groß.',
        'Die Wohnung ist teuer.',
        'Die Wohnung ist dunkel.',
      ]),
    ],
  ),
  _p(
    'de_a1_h1_13',
    'Teil 1 – Dialog 13',
    'Frau: Wann arbeitest du morgen? Mann: Morgen habe ich Frühdienst im Krankenhaus. Ich fange um sechs Uhr an und bin um vierzehn Uhr fertig. Frau: Dann können wir am Nachmittag zusammen einkaufen. Mann: Gute Idee.',
    {
      'id':
          'Wanita: Besok kamu kerja jam berapa? Pria: Besok aku dapat sif pagi di rumah sakit. Aku mulai jam enam dan selesai jam empat belas. Wanita: Kalau begitu sore hari kita bisa belanja bersama. Pria: Ide bagus.',
      'en':
          'Woman: When are you working tomorrow? Man: Tomorrow I have the early shift at the hospital. I start at six and finish at two p.m. Woman: Then we can go shopping together in the afternoon. Man: Good idea.',
    },
    [
      _q(
        'Jam berapa pria itu selesai bekerja?',
        'When does the man finish work?',
        ['Um 14 Uhr', 'Um 6 Uhr', 'Um 16 Uhr', 'Um 12 Uhr'],
      ),
    ],
  ),
  _p(
    'de_a1_h1_14',
    'Teil 1 – Dialog 14',
    'Mann: Was hast du gestern Abend gekocht? Frau: Ich habe Nudeln mit Tomatensoße gekocht. Und du? Mann: Ich hatte keine Zeit. Ich habe eine Pizza gekauft.',
    {
      'id':
          'Pria: Kemarin malam kamu masak apa? Wanita: Aku masak pasta dengan saus tomat. Kamu? Pria: Aku tidak sempat. Aku beli pizza.',
      'en':
          'Man: What did you cook yesterday evening? Woman: I cooked pasta with tomato sauce. And you? Man: I didn\'t have time. I bought a pizza.',
    },
    [
      _q(
        'Apa yang dimakan pria itu kemarin malam?',
        'What did the man eat yesterday evening?',
        ['Pizza', 'Nudeln mit Tomatensoße', 'Reis mit Gemüse', 'Suppe'],
      ),
    ],
  ),

  // -------------------------------------------------------------------------
  // Teil 2 – Durchsagen
  // -------------------------------------------------------------------------
  _p(
    'de_a1_h2_01',
    'Teil 2 – Durchsage 1',
    'Achtung am Gleis vier. Der Regionalexpress nach Köln, planmäßige Abfahrt zehn Uhr zwölf, hat heute etwa zwanzig Minuten Verspätung. Wir bitten um Entschuldigung.',
    {
      'id':
          'Perhatian di peron empat. Kereta Regionalexpress tujuan Köln, jadwal berangkat pukul sepuluh lewat dua belas, hari ini terlambat sekitar dua puluh menit. Mohon maaf.',
      'en':
          'Attention at platform four. The regional express to Cologne, scheduled departure ten twelve, is about twenty minutes late today. We apologise.',
    },
    [
      _q(_true, _trueEn, [
        'Der Zug nach Köln kommt etwa 20 Minuten später.',
        'Der Zug nach Köln fällt heute aus.',
        'Der Zug nach Köln fährt heute von Gleis 12.',
        'Der Zug nach Köln fährt pünktlich ab.',
      ]),
    ],
  ),
  _p(
    'de_a1_h2_02',
    'Teil 2 – Durchsage 2',
    'Liebe Kundinnen und Kunden, heute im Sonderangebot: frische Erdbeeren, die Schale nur ein Euro neunundneunzig. Sie finden die Erdbeeren am Eingang neben dem Obst.',
    {
      'id':
          'Para pelanggan yang terhormat, promo hari ini: stroberi segar, satu wadah hanya satu euro sembilan puluh sembilan. Stroberi ada di dekat pintu masuk, di samping buah-buahan.',
      'en':
          'Dear customers, today\'s special offer: fresh strawberries, only one euro ninety-nine a punnet. You will find the strawberries at the entrance next to the fruit.',
    },
    [
      _q(
        'Berapa harga stroberi hari ini?',
        'How much are the strawberries today?',
        ['1,99 €', '1,09 €', '2,99 €', '9,90 €'],
      ),
      _q(
        'Di mana stroberi bisa ditemukan?',
        'Where can you find the strawberries?',
        ['Am Eingang', 'An der Kasse', 'Beim Brot', 'Im ersten Stock'],
      ),
    ],
  ),
  _p(
    'de_a1_h2_03',
    'Teil 2 – Durchsage 3',
    'Information für die Fluggäste des Fluges LH vierhundertzwanzig nach Frankfurt: Ihr Flug startet heute nicht von Gate B zehn, sondern von Gate C sieben. Das Boarding beginnt um vierzehn Uhr dreißig.',
    {
      'id':
          'Informasi untuk penumpang penerbangan LH empat ratus dua puluh tujuan Frankfurt: penerbangan Anda hari ini tidak berangkat dari Gate B sepuluh, melainkan dari Gate C tujuh. Boarding dimulai pukul empat belas tiga puluh.',
      'en':
          'Information for passengers on flight LH four hundred and twenty to Frankfurt: your flight today does not depart from gate B ten but from gate C seven. Boarding starts at two thirty p.m.',
    },
    [
      _q(
        'Dari gate mana pesawat ke Frankfurt berangkat?',
        'From which gate does the flight to Frankfurt leave?',
        ['Gate C7', 'Gate B10', 'Gate C10', 'Gate B7'],
      ),
      _q('Kapan boarding dimulai?', 'When does boarding start?', [
        'Um 14:30 Uhr',
        'Um 14:20 Uhr',
        'Um 4:30 Uhr',
        'Um 15:30 Uhr',
      ]),
    ],
  ),
  _p(
    'de_a1_h2_04',
    'Teil 2 – Durchsage 4',
    'Liebe Kunden, unser Markt schließt in fünfzehn Minuten. Bitte kommen Sie jetzt zur Kasse. Wir danken für Ihren Einkauf und wünschen Ihnen einen schönen Abend.',
    {
      'id':
          'Para pelanggan yang terhormat, toko kami tutup dalam lima belas menit. Silakan menuju kasir sekarang. Terima kasih telah berbelanja dan selamat malam.',
      'en':
          'Dear customers, our store closes in fifteen minutes. Please come to the checkout now. Thank you for shopping with us and have a nice evening.',
    },
    [
      _q(
        'Apa yang harus dilakukan pelanggan?',
        'What should the customers do?',
        [
          'Zur Kasse gehen',
          'Morgen wiederkommen',
          'Zum Ausgang am Parkplatz gehen',
          'Die Sonderangebote kaufen',
        ],
      ),
    ],
  ),
  _p(
    'de_a1_h2_05',
    'Teil 2 – Durchsage 5',
    'Meine Damen und Herren, am Gleis zwei fährt ein: der Intercity nach Berlin Hauptbahnhof über Hannover. Bitte Vorsicht bei der Einfahrt.',
    {
      'id':
          'Bapak dan Ibu sekalian, di peron dua akan masuk: kereta Intercity tujuan Berlin Hauptbahnhof melalui Hannover. Harap berhati-hati saat kereta masuk.',
      'en':
          'Ladies and gentlemen, now arriving at platform two: the Intercity to Berlin main station via Hanover. Please be careful as the train arrives.',
    },
    [
      _q('Ke mana kereta itu pergi?', 'Where is the train going?', [
        'Nach Berlin',
        'Nach Hannover',
        'Nach Hamburg',
        'Nach München',
      ]),
      _q(
        'Di peron berapa kereta itu masuk?',
        'At which platform does the train arrive?',
        ['Gleis 2', 'Gleis 3', 'Gleis 12', 'Gleis 8'],
      ),
    ],
  ),
  _p(
    'de_a1_h2_06',
    'Teil 2 – Durchsage 6',
    'Achtung, eine Information für die Fahrgäste der S-Bahn-Linie drei: Wegen Bauarbeiten fährt heute zwischen Hauptbahnhof und Flughafen keine S-Bahn. Bitte nehmen Sie den Bus. Der Bus fährt vor dem Bahnhof ab.',
    {
      'id':
          'Perhatian, informasi untuk penumpang S-Bahn jalur tiga: karena pekerjaan konstruksi, hari ini tidak ada S-Bahn antara stasiun pusat dan bandara. Silakan naik bus. Bus berangkat dari depan stasiun.',
      'en':
          'Attention, information for passengers of S-Bahn line three: due to construction work there is no S-Bahn between the main station and the airport today. Please take the bus. The bus leaves in front of the station.',
    },
    [
      _q(
        'Bagaimana penumpang bisa ke bandara hari ini?',
        'How can passengers get to the airport today?',
        ['Mit dem Bus', 'Mit der S-Bahn', 'Mit dem Taxi', 'Mit der U-Bahn'],
      ),
    ],
  ),
  _p(
    'de_a1_h2_07',
    'Teil 2 – Durchsage 7',
    'Der kleine Paul sucht seine Mutter. Paul ist fünf Jahre alt und trägt eine rote Jacke. Die Mutter von Paul kommt bitte zur Information im Erdgeschoss.',
    {
      'id':
          'Si kecil Paul mencari ibunya. Paul berumur lima tahun dan memakai jaket merah. Ibu Paul dimohon datang ke bagian informasi di lantai dasar.',
      'en':
          'Little Paul is looking for his mother. Paul is five years old and is wearing a red jacket. Would Paul\'s mother please come to the information desk on the ground floor.',
    },
    [
      _q('Di mana ibu Paul harus datang?', 'Where should Paul\'s mother go?', [
        'Zur Information im Erdgeschoss',
        'Zur Kasse im ersten Stock',
        'Zum Ausgang',
        'Zur Information im zweiten Stock',
      ]),
      _q(_true, _trueEn, [
        'Paul ist fünf Jahre alt.',
        'Paul trägt eine blaue Jacke.',
        'Paul sucht seinen Vater.',
        'Paul ist fünfzehn Jahre alt.',
      ]),
    ],
  ),
  _p(
    'de_a1_h2_08',
    'Teil 2 – Durchsage 8',
    'Letzter Aufruf für Passagier Ahmad Rahman, gebucht auf den Flug nach Jakarta. Bitte kommen Sie sofort zum Gate A fünf. Das Gate schließt in zehn Minuten.',
    {
      'id':
          'Panggilan terakhir untuk penumpang Ahmad Rahman, yang terdaftar pada penerbangan ke Jakarta. Harap segera menuju Gate A lima. Gate ditutup dalam sepuluh menit.',
      'en':
          'Final call for passenger Ahmad Rahman, booked on the flight to Jakarta. Please come to gate A five immediately. The gate closes in ten minutes.',
    },
    [
      _q(
        'Apa yang harus dilakukan Ahmad Rahman?',
        'What should Ahmad Rahman do?',
        [
          'Sofort zum Gate A5 gehen',
          'In zehn Minuten zur Information gehen',
          'Einen neuen Flug buchen',
          'Am Gate A10 warten',
        ],
      ),
    ],
  ),
  _p(
    'de_a1_h2_09',
    'Teil 2 – Durchsage 9',
    'Liebe Kundinnen und Kunden, diese Woche in unserer Getränkeabteilung: Beim Kauf von zwei Kästen Mineralwasser bekommen Sie den dritten Kasten gratis. Das Angebot gilt bis Samstag.',
    {
      'id':
          'Para pelanggan yang terhormat, minggu ini di bagian minuman kami: dengan membeli dua krat air mineral, Anda mendapat krat ketiga gratis. Penawaran berlaku sampai hari Sabtu.',
      'en':
          'Dear customers, this week in our drinks department: buy two crates of mineral water and get the third crate free. The offer is valid until Saturday.',
    },
    [
      _q(_true, _trueEn, [
        'Der dritte Kasten Wasser ist kostenlos.',
        'Jeder Kasten Wasser kostet nur einen Euro.',
        'Das Angebot gilt nur heute.',
        'Saft ist diese Woche billiger.',
      ]),
    ],
  ),
  _p(
    'de_a1_h2_10',
    'Teil 2 – Durchsage 10',
    'Information zum Zug nach München, Abfahrt elf Uhr fünfundvierzig: Der Zug fährt heute nicht von Gleis sieben, sondern von Gleis neun ab.',
    {
      'id':
          'Informasi tentang kereta ke München, berangkat pukul sebelas empat puluh lima: hari ini kereta tidak berangkat dari peron tujuh, melainkan dari peron sembilan.',
      'en':
          'Information about the train to Munich, departure eleven forty-five: today the train does not leave from platform seven but from platform nine.',
    },
    [
      _q(
        'Dari peron mana kereta ke München berangkat hari ini?',
        'From which platform does the train to Munich leave today?',
        ['Gleis 9', 'Gleis 7', 'Gleis 11', 'Gleis 5'],
      ),
    ],
  ),
  _p(
    'de_a1_h2_11',
    'Teil 2 – Durchsage 11',
    'Sehr geehrte Fahrgäste, in wenigen Minuten erreichen wir Frankfurt Hauptbahnhof. Sie haben dort Anschluss an den ICE nach Stuttgart, Abfahrt sechzehn Uhr zehn von Gleis acht.',
    {
      'id':
          'Para penumpang yang terhormat, dalam beberapa menit kita tiba di Frankfurt Hauptbahnhof. Di sana ada sambungan ke ICE tujuan Stuttgart, berangkat pukul enam belas lewat sepuluh dari peron delapan.',
      'en':
          'Dear passengers, in a few minutes we will reach Frankfurt main station. There you have a connection to the ICE to Stuttgart, departing at four ten p.m. from platform eight.',
    },
    [
      _q(
        'Jam berapa kereta sambungan ke Stuttgart berangkat?',
        'When does the connecting train to Stuttgart leave?',
        ['Um 16:10 Uhr', 'Um 16:08 Uhr', 'Um 18:10 Uhr', 'Um 6:10 Uhr'],
      ),
    ],
  ),

  // -------------------------------------------------------------------------
  // Teil 3 – Nachrichten auf dem Anrufbeantworter
  // -------------------------------------------------------------------------
  _p(
    'de_a1_h3_01',
    'Teil 3 – Nachricht 1',
    'Hallo Lisa, hier ist Tom. Ich kann heute Abend leider nicht ins Kino kommen. Ich bin krank. Können wir am Freitag gehen? Ruf mich bitte zurück. Tschüss!',
    {
      'id':
          'Halo Lisa, ini Tom. Sayangnya malam ini aku tidak bisa ikut ke bioskop. Aku sakit. Bisakah kita pergi hari Jumat? Tolong telepon aku balik. Dah!',
      'en':
          'Hi Lisa, it\'s Tom. Unfortunately I can\'t come to the cinema tonight. I am ill. Can we go on Friday? Please call me back. Bye!',
    },
    [
      _q('Mengapa Tom tidak bisa datang?', 'Why can\'t Tom come?', [
        'Er ist krank.',
        'Er muss arbeiten.',
        'Er hat kein Geld.',
        'Er besucht seine Eltern.',
      ]),
      _q('Apa yang harus dilakukan Lisa?', 'What should Lisa do?', [
        'Tom zurückrufen',
        'Kinokarten kaufen',
        'Tom am Freitag besuchen',
        'Eine E-Mail schreiben',
      ]),
    ],
  ),
  _p(
    'de_a1_h3_02',
    'Teil 3 – Nachricht 2',
    'Guten Tag, Herr Nguyen, hier ist die Praxis Doktor Schulz. Ihr Termin am Dienstag um neun Uhr geht leider nicht. Können Sie am Mittwoch um elf Uhr kommen? Bitte rufen Sie uns an unter null sechs neun, vier fünf, sechs sieben, acht. Danke.',
    {
      'id':
          'Selamat siang, Bapak Nguyen, ini dari praktik Dokter Schulz. Janji Anda hari Selasa jam sembilan sayangnya tidak bisa. Bisakah Anda datang hari Rabu jam sebelas? Mohon telepon kami di nol enam sembilan, empat lima, enam tujuh, delapan. Terima kasih.',
      'en':
          'Good afternoon, Mr Nguyen, this is Doctor Schulz\'s practice. Unfortunately your appointment on Tuesday at nine is not possible. Can you come on Wednesday at eleven? Please call us on zero six nine, four five, six seven, eight. Thank you.',
    },
    [
      _q('Kapan janji yang baru?', 'When is the new appointment?', [
        'Mittwoch um 11 Uhr',
        'Dienstag um 9 Uhr',
        'Mittwoch um 9 Uhr',
        'Dienstag um 11 Uhr',
      ]),
    ],
  ),
  _p(
    'de_a1_h3_03',
    'Teil 3 – Nachricht 3',
    'Hallo Mama, hier ist Lena. Ich bin noch im Büro und komme heute erst um acht Uhr nach Hause. Kannst du bitte Brot und Milch kaufen? Danke, bis später!',
    {
      'id':
          'Halo Ma, ini Lena. Aku masih di kantor dan hari ini baru pulang jam delapan. Bisa tolong beli roti dan susu? Terima kasih, sampai nanti!',
      'en':
          'Hi Mum, it\'s Lena. I am still at the office and won\'t be home until eight o\'clock today. Can you please buy bread and milk? Thanks, see you later!',
    },
    [
      _q('Apa yang harus dibeli ibu?', 'What should the mother buy?', [
        'Brot und Milch',
        'Brot und Butter',
        'Milch und Eier',
        'Käse und Brot',
      ]),
      _q('Jam berapa Lena pulang?', 'When will Lena come home?', [
        'Um 20 Uhr',
        'Um 18 Uhr',
        'Um 8 Uhr morgens',
        'Um 21 Uhr',
      ]),
    ],
  ),
  _p(
    'de_a1_h3_04',
    'Teil 3 – Nachricht 4',
    'Guten Morgen, hier spricht Frau Becker von der Sprachschule Lingua. Der Kurs heute Abend fällt leider aus. Die Lehrerin ist krank. Der nächste Kurs ist am Donnerstag wie immer um achtzehn Uhr.',
    {
      'id':
          'Selamat pagi, ini Ibu Becker dari sekolah bahasa Lingua. Kursus malam ini sayangnya dibatalkan. Gurunya sakit. Kursus berikutnya hari Kamis seperti biasa jam delapan belas.',
      'en':
          'Good morning, this is Mrs Becker from the Lingua language school. Unfortunately tonight\'s course is cancelled. The teacher is ill. The next course is on Thursday at six p.m. as usual.',
    },
    [
      _q('Siapa yang menelepon?', 'Who is calling?', [
        'Die Sprachschule',
        'Die Lehrerin',
        'Eine Arztpraxis',
        'Ein Kursteilnehmer',
      ]),
      _q(_true, _trueEn, [
        'Der Kurs heute Abend findet nicht statt.',
        'Der Kurs beginnt heute später.',
        'Der nächste Kurs ist am Dienstag.',
        'Der Kurs am Donnerstag fällt aus.',
      ]),
    ],
  ),
  _p(
    'de_a1_h3_05',
    'Teil 3 – Nachricht 5',
    'Hallo Herr Wagner, hier ist Autohaus Klein. Ihr Auto ist fertig. Sie können es heute bis achtzehn Uhr oder morgen ab acht Uhr abholen. Die Reparatur kostet zweihundertzehn Euro. Auf Wiederhören.',
    {
      'id':
          'Halo Bapak Wagner, ini dari bengkel mobil Klein. Mobil Anda sudah selesai. Anda bisa mengambilnya hari ini sampai jam delapan belas atau besok mulai jam delapan. Biaya perbaikannya dua ratus sepuluh euro. Sampai jumpa.',
      'en':
          'Hello Mr Wagner, this is Klein car dealership. Your car is ready. You can pick it up today until six p.m. or tomorrow from eight a.m. The repair costs two hundred and ten euros. Goodbye.',
    },
    [
      _q('Berapa biaya perbaikannya?', 'How much does the repair cost?', [
        '210 €',
        '200 €',
        '120 €',
        '218 €',
      ]),
      _q('Apa yang harus dilakukan Pak Wagner?', 'What should Mr Wagner do?', [
        'Sein Auto abholen',
        'Sein Auto in die Werkstatt bringen',
        'Einen Termin machen',
        'Ein neues Auto kaufen',
      ]),
    ],
  ),
  _p(
    'de_a1_h3_06',
    'Teil 3 – Nachricht 6',
    'Hallo Sven, hier ist Maria. Die Party am Samstag beginnt nicht um sieben, sondern um acht Uhr. Kannst du bitte Getränke mitbringen? Ich mache den Salat. Bis Samstag!',
    {
      'id':
          'Halo Sven, ini Maria. Pesta hari Sabtu tidak mulai jam tujuh, melainkan jam delapan. Bisa tolong bawa minuman? Aku yang buat salad. Sampai Sabtu!',
      'en':
          'Hi Sven, it\'s Maria. The party on Saturday doesn\'t start at seven but at eight. Can you please bring drinks? I am making the salad. See you on Saturday!',
    },
    [
      _q('Jam berapa pesta dimulai?', 'When does the party start?', [
        'Um 20 Uhr',
        'Um 19 Uhr',
        'Um 18 Uhr',
        'Um 21 Uhr',
      ]),
      _q('Apa yang harus dibawa Sven?', 'What should Sven bring?', [
        'Getränke',
        'Salat',
        'Kuchen',
        'Musik',
      ]),
    ],
  ),
  _p(
    'de_a1_h3_07',
    'Teil 3 – Nachricht 7',
    'Guten Tag, hier ist Frau Hoffmann vom Pflegeheim Sonnenhof. Wir haben Ihre Bewerbung bekommen. Wir möchten Sie gern zu einem Gespräch einladen, am Montag um vierzehn Uhr. Bitte bringen Sie Ihre Zeugnisse mit.',
    {
      'id':
          'Selamat siang, ini Ibu Hoffmann dari panti werdha Sonnenhof. Kami sudah menerima lamaran Anda. Kami ingin mengundang Anda wawancara hari Senin jam empat belas. Mohon bawa ijazah dan sertifikat Anda.',
      'en':
          'Good afternoon, this is Mrs Hoffmann from the Sonnenhof care home. We have received your application. We would like to invite you to an interview on Monday at two p.m. Please bring your certificates.',
    },
    [
      _q('Mengapa Ibu Hoffmann menelepon?', 'Why is Mrs Hoffmann calling?', [
        'Sie lädt zu einem Vorstellungsgespräch ein.',
        'Sie sucht ein Zimmer im Pflegeheim.',
        'Sie sagt einen Termin ab.',
        'Sie möchte eine Bewerbung schreiben.',
      ]),
      _q('Apa yang harus dibawa?', 'What should be brought along?', [
        'Die Zeugnisse',
        'Den Reisepass',
        'Ein Foto',
        'Die Krankenversicherungskarte',
      ]),
    ],
  ),
  _p(
    'de_a1_h3_08',
    'Teil 3 – Nachricht 8',
    'Hallo Jonas, hier ist Papa. Ich hole dich heute nicht um fünf Uhr von der Schule ab, sondern um halb sechs. Warte bitte vor der Bibliothek. Bis dann!',
    {
      'id':
          'Halo Jonas, ini Papa. Hari ini Papa tidak menjemputmu dari sekolah jam lima, tapi jam setengah enam. Tolong tunggu di depan perpustakaan. Sampai nanti!',
      'en':
          'Hi Jonas, it\'s Dad. Today I won\'t pick you up from school at five but at half past five. Please wait in front of the library. See you then!',
    },
    [
      _q('Di mana Jonas harus menunggu?', 'Where should Jonas wait?', [
        'Vor der Bibliothek',
        'Vor der Schule',
        'An der Bushaltestelle',
        'Zu Hause',
      ]),
      _q('Jam berapa ayahnya datang?', 'When is his father coming?', [
        'Um 17:30 Uhr',
        'Um 17 Uhr',
        'Um 16:30 Uhr',
        'Um 18:30 Uhr',
      ]),
    ],
  ),
  _p(
    'de_a1_h3_09',
    'Teil 3 – Nachricht 9',
    'Guten Tag, hier ist die Stadtbibliothek. Sie haben noch zwei Bücher von uns. Die Bücher müssen Sie bis Freitag zurückbringen. Unsere Öffnungszeiten sind von zehn bis neunzehn Uhr.',
    {
      'id':
          'Selamat siang, ini perpustakaan kota. Anda masih meminjam dua buku dari kami. Buku-buku itu harus dikembalikan paling lambat hari Jumat. Jam buka kami dari jam sepuluh sampai jam sembilan belas.',
      'en':
          'Good afternoon, this is the city library. You still have two books from us. You must return the books by Friday. Our opening hours are from ten a.m. to seven p.m.',
    },
    [
      _q(
        'Apa yang harus dilakukan pendengar?',
        'What should the listener do?',
        [
          'Zwei Bücher bis Freitag zurückbringen',
          'Zwei neue Bücher abholen',
          'Am Freitag anrufen',
          'Bis Freitag zehn Bücher lesen',
        ],
      ),
    ],
  ),
  _p(
    'de_a1_h3_10',
    'Teil 3 – Nachricht 10',
    'Hallo, hier ist Dewi. Ich bin jetzt am Bahnhof, aber mein Zug hat eine Stunde Verspätung. Ich komme erst um zehn Uhr an. Du musst mich nicht abholen, ich nehme ein Taxi. Bis später!',
    {
      'id':
          'Halo, ini Dewi. Aku sekarang di stasiun, tapi keretaku terlambat satu jam. Aku baru sampai jam sepuluh. Kamu tidak perlu menjemputku, aku naik taksi. Sampai nanti!',
      'en':
          'Hi, it\'s Dewi. I am at the station now, but my train is an hour late. I won\'t arrive until ten o\'clock. You don\'t have to pick me up, I\'ll take a taxi. See you later!',
    },
    [
      _q(_true, _trueEn, [
        'Dewi fährt mit dem Taxi.',
        'Dewi muss abgeholt werden.',
        'Der Zug ist pünktlich.',
        'Dewi kommt um neun Uhr an.',
      ]),
    ],
  ),
  _p(
    'de_a1_h3_11',
    'Teil 3 – Nachricht 11',
    'Hallo Frau Yilmaz, hier ist Herr Braun, Ihr Vermieter. Morgen um neun Uhr kommt der Techniker und repariert die Heizung. Bitte seien Sie zu Hause. Wenn das nicht geht, rufen Sie mich bitte heute noch an.',
    {
      'id':
          'Halo Ibu Yilmaz, ini Pak Braun, pemilik sewaan Anda. Besok jam sembilan teknisi datang untuk memperbaiki pemanas. Mohon Anda ada di rumah. Kalau tidak bisa, tolong telepon saya hari ini juga.',
      'en':
          'Hello Mrs Yilmaz, this is Mr Braun, your landlord. Tomorrow at nine the technician is coming to repair the heating. Please be at home. If that is not possible, please call me today.',
    },
    [
      _q('Siapa yang menelepon?', 'Who is calling?', [
        'Der Vermieter',
        'Der Techniker',
        'Ein Nachbar',
        'Der Hausarzt',
      ]),
      _q('Apa yang akan diperbaiki?', 'What will be repaired?', [
        'Die Heizung',
        'Die Waschmaschine',
        'Das Fenster',
        'Die Tür',
      ]),
    ],
  ),
];
