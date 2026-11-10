/// Bank Hören A2 untuk mode Ujian: pengumuman radio/telepon, percakapan
/// panjang, dialog pendek, dan wawancara yang dibacakan TTS, meniru tipe
/// soal Goethe-Zertifikat A2 bagian Hören.
///
/// Tipe soal:
/// - Teil 1: pengumuman radio/telepon (cuaca, lalu lintas, acara).
/// - Teil 2: percakapan lebih panjang antara dua orang, beberapa soal.
/// - Teil 3: dialog pendek (Wo? Was? Wann? Wie viel?).
/// - Teil 4: wawancara/obrolan radio; soal Ja/Nein diubah menjadi
///   "Welche Aussage ist richtig?" dengan 4 pernyataan.
///
/// Konten disusun sendiri (bukan salinan soal asli). Semua soal memakai
/// 4 pilihan. Pilihan PERTAMA pada [_q] selalu jawaban benar (`answer: 0`);
/// layar ujian mengacaknya.
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

final List<ListeningPassage> goetheA2Listening = [
  // -------------------------------------------------------------------------
  // Teil 1 – Ansagen im Radio und am Telefon
  // -------------------------------------------------------------------------
  _p(
    'de_a2_h1_01',
    'Teil 1 – Ansage 1',
    'Und jetzt das Wetter für morgen, Samstag: Im Norden bleibt es leider grau und regnerisch, die Temperaturen liegen bei zwölf Grad. Im Süden scheint dagegen die Sonne, und es wird bis zu zweiundzwanzig Grad warm. Am Sonntag kommt der Regen dann auch in den Süden.',
    {
      'id':
          'Dan sekarang cuaca untuk besok, Sabtu: Di utara sayangnya tetap mendung dan hujan, suhu sekitar dua belas derajat. Sebaliknya di selatan matahari bersinar, dan suhunya bisa mencapai dua puluh dua derajat. Pada hari Minggu hujan juga akan sampai ke selatan.',
      'en':
          'And now the weather for tomorrow, Saturday: In the north it unfortunately stays grey and rainy, with temperatures around twelve degrees. In the south, however, the sun shines and it gets up to twenty-two degrees. On Sunday the rain will reach the south as well.',
    },
    [
      _q(
        'Bagaimana cuaca di selatan pada hari Sabtu?',
        'What is the weather like in the south on Saturday?',
        [
          'Sonnig und warm',
          'Regnerisch und kalt',
          'Bewölkt mit zwölf Grad',
          'Es schneit',
        ],
      ),
    ],
  ),
  _p(
    'de_a2_h1_02',
    'Teil 1 – Ansage 2',
    'Hier sind die Verkehrsmeldungen. Auf der A3 zwischen Würzburg und Nürnberg gibt es nach einem Unfall acht Kilometer Stau. Bitte fahren Sie über die B8. Die Brücke in der Hafenstraße ist wegen Bauarbeiten noch bis Freitag gesperrt.',
    {
      'id':
          'Berikut info lalu lintas. Di jalan tol A3 antara Würzburg dan Nürnberg terjadi kemacetan delapan kilometer setelah kecelakaan. Silakan lewat jalan B8. Jembatan di Hafenstraße ditutup karena pekerjaan konstruksi sampai hari Jumat.',
      'en':
          'Here are the traffic reports. On the A3 between Würzburg and Nuremberg there is an eight-kilometre traffic jam after an accident. Please take the B8. The bridge in Hafenstraße is closed for construction work until Friday.',
    },
    [
      _q(
        'Mengapa ada kemacetan di A3?',
        'Why is there a traffic jam on the A3?',
        [
          'Wegen eines Unfalls',
          'Wegen Bauarbeiten',
          'Wegen schlechten Wetters',
          'Wegen einer Demonstration',
        ],
      ),
      _q(
        'Sampai kapan jembatan di Hafenstraße ditutup?',
        'Until when is the bridge in Hafenstraße closed?',
        ['Bis Freitag', 'Bis Montag', 'Bis heute Abend', 'Bis nächste Woche'],
      ),
    ],
  ),
  _p(
    'de_a2_h1_03',
    'Teil 1 – Ansage 3',
    'Hallo Frau Becker, hier ist die Praxis Dr. Wolf. Ihr Termin am Dienstag um zehn Uhr muss leider ausfallen, weil der Doktor krank ist. Wir können Ihnen Donnerstag um vierzehn Uhr anbieten. Bitte rufen Sie uns kurz zurück. Vielen Dank.',
    {
      'id':
          'Halo Ibu Becker, ini dari praktik Dr. Wolf. Janji temu Anda hari Selasa jam sepuluh sayangnya batal karena dokternya sakit. Kami bisa menawarkan hari Kamis jam empat belas. Mohon telepon kami kembali. Terima kasih banyak.',
      'en':
          'Hello Ms Becker, this is Dr Wolf\'s practice. Unfortunately your appointment on Tuesday at ten o\'clock has to be cancelled because the doctor is ill. We can offer you Thursday at 2 p.m. Please call us back briefly. Thank you very much.',
    },
    [
      _q('Kapan janji temu yang baru?', 'When is the new appointment?', [
        'Donnerstag um 14 Uhr',
        'Dienstag um 10 Uhr',
        'Donnerstag um 10 Uhr',
        'Dienstag um 14 Uhr',
      ]),
    ],
  ),
  _p(
    'de_a2_h1_04',
    'Teil 1 – Ansage 4',
    'Liebe Hörerinnen und Hörer, am Wochenende findet im Stadtpark wieder das große Sommerfest statt. Es gibt Musik, Essen aus vielen Ländern und ein Programm für Kinder. Der Eintritt ist frei. Das Fest beginnt am Samstag um elf Uhr.',
    {
      'id':
          'Para pendengar yang terhormat, akhir pekan ini di taman kota kembali diadakan festival musim panas besar. Ada musik, makanan dari banyak negara, dan acara untuk anak-anak. Masuknya gratis. Festival dimulai hari Sabtu jam sebelas.',
      'en':
          'Dear listeners, this weekend the big summer festival takes place again in the city park. There is music, food from many countries and a programme for children. Admission is free. The festival begins on Saturday at eleven o\'clock.',
    },
    [
      _q(
        'Berapa biaya masuk festival?',
        'How much does admission to the festival cost?',
        ['Nichts', 'Fünf Euro', 'Elf Euro', 'Nur Kinder zahlen'],
      ),
    ],
  ),
  _p(
    'de_a2_h1_05',
    'Teil 1 – Ansage 5',
    'Guten Tag, Sie sind verbunden mit der Stadtbibliothek. Unsere Öffnungszeiten: Montag bis Freitag von zehn bis neunzehn Uhr, samstags von zehn bis vierzehn Uhr. Sonntags ist die Bibliothek geschlossen. Bücher können Sie auch online verlängern.',
    {
      'id':
          'Selamat siang, Anda tersambung dengan perpustakaan kota. Jam buka kami: Senin sampai Jumat pukul sepuluh hingga sembilan belas, hari Sabtu pukul sepuluh hingga empat belas. Hari Minggu perpustakaan tutup. Anda juga bisa memperpanjang buku secara online.',
      'en':
          'Good day, you have reached the city library. Our opening hours: Monday to Friday from ten to seven p.m., Saturdays from ten to two p.m. On Sundays the library is closed. You can also renew books online.',
    },
    [
      _q(
        'Kapan perpustakaan buka pada hari Sabtu?',
        'When is the library open on Saturday?',
        [
          'Von 10 bis 14 Uhr',
          'Von 10 bis 19 Uhr',
          'Gar nicht',
          'Von 14 bis 19 Uhr',
        ],
      ),
    ],
  ),
  _p(
    'de_a2_h1_06',
    'Teil 1 – Ansage 6',
    'Hallo Jonas, hier ist Mira. Ich kann heute Abend leider nicht ins Kino kommen, ich muss länger arbeiten. Aber wie wäre es mit morgen? Der Film läuft auch um zwanzig Uhr. Schreib mir einfach eine Nachricht. Tschüss!',
    {
      'id':
          'Halo Jonas, ini Mira. Malam ini aku sayangnya tidak bisa ke bioskop, aku harus kerja lebih lama. Tapi bagaimana kalau besok? Filmnya juga diputar jam dua puluh. Kirim pesan saja ke aku. Dah!',
      'en':
          'Hi Jonas, it\'s Mira. Unfortunately I can\'t come to the cinema tonight, I have to work late. But how about tomorrow? The film is also showing at eight p.m. Just send me a message. Bye!',
    },
    [
      _q(
        'Mengapa Mira tidak bisa datang hari ini?',
        'Why can\'t Mira come today?',
        [
          'Sie muss länger arbeiten.',
          'Sie ist krank.',
          'Der Film ist ausverkauft.',
          'Sie hat keine Lust.',
        ],
      ),
    ],
  ),
  _p(
    'de_a2_h1_07',
    'Teil 1 – Ansage 7',
    'Achtung, eine Information für alle Fahrgäste der Linie U2: Wegen einer technischen Störung fahren zwischen Hauptbahnhof und Rathaus heute keine Bahnen. Bitte nehmen Sie die Ersatzbusse. Die Busse fahren alle zehn Minuten vor dem Hauptbahnhof ab.',
    {
      'id':
          'Perhatian, informasi untuk semua penumpang jalur U2: Karena gangguan teknis, hari ini tidak ada kereta antara stasiun utama dan balai kota. Silakan naik bus pengganti. Bus berangkat setiap sepuluh menit dari depan stasiun utama.',
      'en':
          'Attention, information for all passengers on line U2: Due to a technical fault, no trains are running between the main station and the town hall today. Please take the replacement buses. The buses leave every ten minutes in front of the main station.',
    },
    [
      _q(_true, _trueEn, [
        'Zwischen Hauptbahnhof und Rathaus fahren Busse.',
        'Die U2 fährt heute normal.',
        'Die Busse fahren jede Stunde.',
        'Die Busse fahren vor dem Rathaus ab.',
      ]),
    ],
  ),
  _p(
    'de_a2_h1_08',
    'Teil 1 – Ansage 8',
    'Guten Morgen, hier ist das Pflegeheim Sonnenhof, Frau Krause. Sie haben sich als Pflegehelferin beworben. Wir möchten Sie gern zu einem Gespräch einladen, am Mittwoch um neun Uhr. Bitte bringen Sie Ihren Lebenslauf und Ihre Zeugnisse mit.',
    {
      'id':
          'Selamat pagi, ini panti werdha Sonnenhof, dengan Ibu Krause. Anda melamar sebagai asisten perawat. Kami ingin mengundang Anda wawancara hari Rabu jam sembilan. Mohon bawa CV dan ijazah/sertifikat Anda.',
      'en':
          'Good morning, this is the Sonnenhof care home, Ms Krause speaking. You applied as a nursing assistant. We would like to invite you to an interview on Wednesday at nine o\'clock. Please bring your CV and your certificates.',
    },
    [
      _q(
        'Apa yang harus dibawa ke wawancara?',
        'What should be brought to the interview?',
        [
          'Lebenslauf und Zeugnisse',
          'Reisepass und Foto',
          'Arbeitskleidung',
          'Ein Attest vom Arzt',
        ],
      ),
    ],
  ),
  _p(
    'de_a2_h1_09',
    'Teil 1 – Ansage 9',
    'Und hier noch ein Tipp für Familien: Das Naturkundemuseum hat ab diesem Monat eine neue Ausstellung über Dinosaurier. Kinder unter sechs Jahren zahlen nichts, Schüler zahlen drei Euro und Erwachsene sieben Euro. Jeden ersten Sonntag im Monat ist der Eintritt für alle frei.',
    {
      'id':
          'Dan ini tips untuk keluarga: Mulai bulan ini museum sejarah alam punya pameran baru tentang dinosaurus. Anak di bawah enam tahun gratis, pelajar membayar tiga euro, dan orang dewasa tujuh euro. Setiap Minggu pertama setiap bulan masuknya gratis untuk semua.',
      'en':
          'And here\'s a tip for families: from this month the natural history museum has a new exhibition about dinosaurs. Children under six pay nothing, pupils pay three euros and adults seven euros. Every first Sunday of the month admission is free for everyone.',
    },
    [
      _q(
        'Berapa harga tiket untuk orang dewasa?',
        'How much is a ticket for adults?',
        ['Sieben Euro', 'Drei Euro', 'Sechs Euro', 'Nichts'],
      ),
    ],
  ),
  _p(
    'de_a2_h1_10',
    'Teil 1 – Ansage 10',
    'Hallo, hier ist Autohaus Brandt. Ihr Auto ist fertig. Wir haben die Bremsen repariert und die Reifen gewechselt. Die Rechnung beträgt zweihundertvierzig Euro. Sie können das Auto heute bis achtzehn Uhr oder morgen ab acht Uhr abholen.',
    {
      'id':
          'Halo, ini bengkel mobil Brandt. Mobil Anda sudah selesai. Kami sudah memperbaiki rem dan mengganti ban. Tagihannya dua ratus empat puluh euro. Anda bisa mengambil mobilnya hari ini sampai jam delapan belas atau besok mulai jam delapan.',
      'en':
          'Hello, this is Brandt car dealership. Your car is ready. We repaired the brakes and changed the tyres. The bill comes to two hundred and forty euros. You can pick up the car today until 6 p.m. or tomorrow from 8 a.m.',
    },
    [
      _q(
        'Apa yang diperbaiki pada mobil itu?',
        'What was repaired on the car?',
        ['Die Bremsen', 'Das Licht', 'Der Motor', 'Die Tür'],
      ),
      _q('Berapa yang harus dibayar?', 'How much has to be paid?', [
        '240 €',
        '214 €',
        '180 €',
        '420 €',
      ]),
    ],
  ),

  // -------------------------------------------------------------------------
  // Teil 2 – längere Gespräche
  // -------------------------------------------------------------------------
  _p(
    'de_a2_h2_01',
    'Teil 2 – Gespräch 1',
    'Frau: Hallo Tim, wie war dein Wochenende? Mann: Sehr schön! Am Samstag war ich mit meinem Bruder in den Bergen wandern. Frau: Bei dem Wetter? Es hat doch geregnet. Mann: Nur am Nachmittag. Am Morgen war es sonnig. Und am Sonntag habe ich zu Hause gekocht, meine Eltern waren zum Mittagessen da. Frau: Was hast du gekocht? Mann: Fisch mit Kartoffeln und Salat. Und du? Frau: Ich habe für meine Prüfung gelernt. Am Montag schreibe ich den Deutschtest.',
    {
      'id':
          'Wanita: Halo Tim, bagaimana akhir pekanmu? Pria: Menyenangkan sekali! Hari Sabtu aku mendaki gunung bersama kakakku. Wanita: Dengan cuaca seperti itu? Kan hujan. Pria: Cuma sore hari. Paginya cerah. Hari Minggu aku masak di rumah, orang tuaku datang makan siang. Wanita: Kamu masak apa? Pria: Ikan dengan kentang dan salad. Kalau kamu? Wanita: Aku belajar untuk ujianku. Hari Senin aku ikut tes bahasa Jerman.',
      'en':
          'Woman: Hi Tim, how was your weekend? Man: Very nice! On Saturday I went hiking in the mountains with my brother. Woman: In that weather? It rained. Man: Only in the afternoon. In the morning it was sunny. And on Sunday I cooked at home, my parents came for lunch. Woman: What did you cook? Man: Fish with potatoes and salad. And you? Woman: I studied for my exam. On Monday I\'m taking the German test.',
    },
    [
      _q('Dengan siapa Tim mendaki?', 'Who did Tim go hiking with?', [
        'Mit seinem Bruder',
        'Mit seinen Eltern',
        'Allein',
        'Mit Kollegen',
      ]),
      _q(
        'Apa yang Tim masak pada hari Minggu?',
        'What did Tim cook on Sunday?',
        [
          'Fisch mit Kartoffeln',
          'Fleisch mit Reis',
          'Nudeln mit Salat',
          'Suppe mit Brot',
        ],
      ),
      _q(
        'Apa yang dilakukan wanita itu pada akhir pekan?',
        'What did the woman do at the weekend?',
        [
          'Sie hat gelernt.',
          'Sie war wandern.',
          'Sie hat gekocht.',
          'Sie hat eine Prüfung geschrieben.',
        ],
      ),
    ],
  ),
  _p(
    'de_a2_h2_02',
    'Teil 2 – Gespräch 2',
    'Mann: Guten Tag, ich suche eine Wohnung. Ich habe Ihre Anzeige gelesen. Frau: Ja, die Wohnung hat zwei Zimmer, eine Küche und ein Bad mit Dusche. Sie liegt im dritten Stock. Mann: Gibt es einen Aufzug? Frau: Nein, leider nicht. Aber es gibt einen Balkon. Mann: Und wie hoch ist die Miete? Frau: Sechshundertfünfzig Euro warm, also mit Heizung. Mann: Kann ich die Wohnung ansehen? Frau: Gern, morgen um siebzehn Uhr?',
    {
      'id':
          'Pria: Selamat siang, saya sedang mencari apartemen. Saya sudah membaca iklan Anda. Wanita: Ya, apartemennya punya dua kamar, dapur, dan kamar mandi dengan pancuran. Letaknya di lantai tiga. Pria: Ada lift? Wanita: Sayangnya tidak. Tapi ada balkon. Pria: Berapa sewanya? Wanita: Enam ratus lima puluh euro termasuk pemanas. Pria: Boleh saya lihat apartemennya? Wanita: Boleh, besok jam tujuh belas?',
      'en':
          'Man: Good afternoon, I\'m looking for a flat. I read your advert. Woman: Yes, the flat has two rooms, a kitchen and a bathroom with a shower. It is on the third floor. Man: Is there a lift? Woman: No, unfortunately not. But there is a balcony. Man: And how much is the rent? Woman: Six hundred and fifty euros including heating. Man: Can I see the flat? Woman: Of course, tomorrow at 5 p.m.?',
    },
    [
      _q(_true, _trueEn, [
        'Die Wohnung hat einen Balkon.',
        'Die Wohnung hat einen Aufzug.',
        'Die Wohnung hat drei Zimmer.',
        'Die Wohnung liegt im Erdgeschoss.',
      ]),
      _q('Berapa sewa apartemen itu?', 'How much is the rent?', [
        '650 € mit Heizung',
        '650 € ohne Heizung',
        '560 € mit Heizung',
        '600 € ohne Heizung',
      ]),
      _q(
        'Kapan pria itu bisa melihat apartemen?',
        'When can the man see the flat?',
        [
          'Morgen um 17 Uhr',
          'Heute um 17 Uhr',
          'Morgen um 7 Uhr',
          'Am Wochenende',
        ],
      ),
    ],
  ),
  _p(
    'de_a2_h2_03',
    'Teil 2 – Gespräch 3',
    'Frau: Herr Schulz, haben Sie schon den Dienstplan für nächste Woche gesehen? Mann: Ja, ich habe Frühdienst von Montag bis Mittwoch. Frau: Ich auch. Aber am Donnerstag habe ich einen Arzttermin. Können Sie mit mir tauschen? Mann: Am Donnerstag habe ich Spätdienst. Ich kann gern früh arbeiten, dann machen Sie den Spätdienst. Frau: Super, danke! Ich sage es der Stationsleitung. Mann: Gut, und vergessen Sie nicht: Am Freitag ist die Teambesprechung um vierzehn Uhr.',
    {
      'id':
          'Wanita: Pak Schulz, sudah lihat jadwal jaga minggu depan? Pria: Sudah, saya dinas pagi dari Senin sampai Rabu. Wanita: Saya juga. Tapi hari Kamis saya ada janji ke dokter. Bisa tukar dengan saya? Pria: Hari Kamis saya dinas sore. Saya mau saja kerja pagi, lalu Anda ambil dinas sore. Wanita: Bagus, terima kasih! Saya beri tahu kepala ruangan. Pria: Baik, dan jangan lupa: hari Jumat rapat tim jam empat belas.',
      'en':
          'Woman: Mr Schulz, have you seen the duty roster for next week? Man: Yes, I have the early shift from Monday to Wednesday. Woman: Me too. But on Thursday I have a doctor\'s appointment. Can you swap with me? Man: On Thursday I have the late shift. I\'m happy to work early, then you do the late shift. Woman: Great, thanks! I\'ll tell the ward manager. Man: Good, and don\'t forget: the team meeting is on Friday at 2 p.m.',
    },
    [
      _q(
        'Mengapa wanita itu ingin bertukar dinas?',
        'Why does the woman want to swap shifts?',
        [
          'Sie hat einen Arzttermin.',
          'Sie hat Urlaub.',
          'Ihr Kind ist krank.',
          'Sie hat eine Prüfung.',
        ],
      ),
      _q(
        'Dinas apa yang dikerjakan wanita itu hari Kamis?',
        'Which shift does the woman work on Thursday?',
        ['Spätdienst', 'Frühdienst', 'Nachtdienst', 'Sie hat frei.'],
      ),
      _q('Kapan rapat tim?', 'When is the team meeting?', [
        'Freitag um 14 Uhr',
        'Donnerstag um 14 Uhr',
        'Freitag um 10 Uhr',
        'Montag um 14 Uhr',
      ]),
    ],
  ),
  _p(
    'de_a2_h2_04',
    'Teil 2 – Gespräch 4',
    'Mann: Du, Anna, nächsten Samstag hat Lisa Geburtstag. Was schenken wir ihr? Frau: Sie liest doch so gern. Vielleicht ein Buch? Mann: Hm, sie hat schon so viele Bücher. Sie hat gesagt, sie möchte mal wieder ins Theater. Frau: Gute Idee! Dann kaufen wir zwei Karten, und sie kann mit ihrem Freund gehen. Mann: Ich kümmere mich um die Karten. Kannst du einen Kuchen backen? Frau: Klar, einen Schokoladenkuchen. Den mag sie am liebsten.',
    {
      'id':
          'Pria: Eh Anna, Sabtu depan Lisa ulang tahun. Kita kasih hadiah apa? Wanita: Dia kan suka sekali membaca. Mungkin buku? Pria: Hm, bukunya sudah banyak sekali. Dia bilang ingin ke teater lagi. Wanita: Ide bagus! Kita beli dua tiket, jadi dia bisa pergi dengan pacarnya. Pria: Aku yang urus tiketnya. Kamu bisa bikin kue? Wanita: Tentu, kue cokelat. Itu yang paling dia suka.',
      'en':
          'Man: Hey Anna, next Saturday is Lisa\'s birthday. What shall we give her? Woman: She loves reading. Maybe a book? Man: Hm, she already has so many books. She said she\'d like to go to the theatre again. Woman: Good idea! Then we\'ll buy two tickets and she can go with her boyfriend. Man: I\'ll take care of the tickets. Can you bake a cake? Woman: Sure, a chocolate cake. That\'s her favourite.',
    },
    [
      _q('Apa hadiah untuk Lisa?', 'What is the present for Lisa?', [
        'Theaterkarten',
        'Ein Buch',
        'Kinokarten',
        'Blumen',
      ]),
      _q('Apa yang dilakukan Anna?', 'What will Anna do?', [
        'Sie backt einen Kuchen.',
        'Sie kauft die Karten.',
        'Sie kauft ein Buch.',
        'Sie kocht das Abendessen.',
      ]),
    ],
  ),
  _p(
    'de_a2_h2_05',
    'Teil 2 – Gespräch 5',
    'Frau: Guten Tag, ich möchte mich für einen Deutschkurs anmelden. Mann: Gern. Welches Niveau haben Sie? Frau: Ich habe A1 schon gemacht. Jetzt möchte ich A2 lernen, weil ich eine Ausbildung in Deutschland machen will. Mann: Wir haben einen Abendkurs, montags und mittwochs von achtzehn bis einundzwanzig Uhr, und einen Intensivkurs jeden Vormittag. Frau: Ich arbeite vormittags. Dann nehme ich den Abendkurs. Was kostet er? Mann: Dreihundertzwanzig Euro für acht Wochen, die Bücher sind extra.',
    {
      'id':
          'Wanita: Selamat siang, saya ingin mendaftar kursus bahasa Jerman. Pria: Baik. Level Anda apa? Wanita: Saya sudah selesai A1. Sekarang saya mau belajar A2 karena ingin ikut Ausbildung di Jerman. Pria: Kami punya kursus malam, Senin dan Rabu jam delapan belas sampai dua puluh satu, dan kursus intensif setiap pagi. Wanita: Saya kerja pagi hari. Jadi saya ambil kursus malam. Berapa biayanya? Pria: Tiga ratus dua puluh euro untuk delapan minggu, bukunya terpisah.',
      'en':
          'Woman: Good afternoon, I\'d like to register for a German course. Man: Of course. What level are you? Woman: I\'ve already done A1. Now I\'d like to learn A2 because I want to do vocational training in Germany. Man: We have an evening course, Mondays and Wednesdays from 6 to 9 p.m., and an intensive course every morning. Woman: I work in the mornings. Then I\'ll take the evening course. How much is it? Man: Three hundred and twenty euros for eight weeks, the books are extra.',
    },
    [
      _q(
        'Mengapa wanita itu belajar bahasa Jerman?',
        'Why is the woman learning German?',
        [
          'Sie will eine Ausbildung machen.',
          'Sie will in Deutschland studieren.',
          'Sie will Urlaub machen.',
          'Ihr Mann ist Deutscher.',
        ],
      ),
      _q(
        'Kursus mana yang dipilih wanita itu?',
        'Which course does the woman choose?',
        [
          'Den Abendkurs',
          'Den Intensivkurs',
          'Einen Onlinekurs',
          'Einen Wochenendkurs',
        ],
      ),
      _q(_true, _trueEn, [
        'Die Bücher kosten extra.',
        'Der Kurs dauert zwölf Wochen.',
        'Der Kurs kostet 230 Euro.',
        'Der Kurs ist am Dienstag und Donnerstag.',
      ]),
    ],
  ),
  _p(
    'de_a2_h2_06',
    'Teil 2 – Gespräch 6',
    'Mann: Entschuldigung, ich habe gestern hier diese Jacke gekauft, aber sie ist mir zu klein. Frau: Haben Sie den Kassenzettel dabei? Mann: Ja, hier. Frau: Möchten Sie die Jacke eine Nummer größer? Mann: Gern, in Größe L. Frau: Die haben wir leider nur noch in Grau, nicht in Blau. Mann: Hm, Grau gefällt mir nicht so. Kann ich das Geld zurückbekommen? Frau: Natürlich, ich gebe Ihnen die neunundachtzig Euro zurück.',
    {
      'id':
          'Pria: Permisi, kemarin saya beli jaket ini di sini, tapi terlalu kecil untuk saya. Wanita: Anda bawa struknya? Pria: Ya, ini. Wanita: Mau jaketnya satu ukuran lebih besar? Pria: Boleh, ukuran L. Wanita: Sayangnya ukuran itu tinggal warna abu-abu, tidak ada yang biru. Pria: Hm, saya kurang suka abu-abu. Bisa uangnya dikembalikan? Wanita: Tentu, saya kembalikan delapan puluh sembilan euro.',
      'en':
          'Man: Excuse me, I bought this jacket here yesterday, but it\'s too small for me. Woman: Do you have the receipt with you? Man: Yes, here. Woman: Would you like the jacket one size bigger? Man: Yes, please, in size L. Woman: Unfortunately we only have that in grey, not in blue. Man: Hm, I don\'t really like grey. Can I get my money back? Woman: Of course, I\'ll give you back the eighty-nine euros.',
    },
    [
      _q('Apa masalah jaketnya?', 'What is the problem with the jacket?', [
        'Sie ist zu klein.',
        'Sie ist kaputt.',
        'Sie ist zu teuer.',
        'Sie hat die falsche Farbe.',
      ]),
      _q(
        'Apa yang akhirnya dilakukan pria itu?',
        'What does the man do in the end?',
        [
          'Er bekommt sein Geld zurück.',
          'Er nimmt die graue Jacke.',
          'Er nimmt eine blaue Jacke in L.',
          'Er kauft eine Hose.',
        ],
      ),
    ],
  ),
  _p(
    'de_a2_h2_07',
    'Teil 2 – Gespräch 7',
    'Frau: Herr Yilmaz, wie war Ihr erster Tag bei uns in der Firma? Mann: Gut, danke. Die Kollegen sind sehr nett. Nur den Weg zur Kantine habe ich noch nicht gefunden. Frau: Die Kantine ist im Erdgeschoss, neben dem Eingang. Mittagessen gibt es von zwölf bis vierzehn Uhr. Mann: Und wo bekomme ich meinen Mitarbeiterausweis? Frau: Im Personalbüro, zweiter Stock, Zimmer zweihundertfünf. Bringen Sie bitte ein Passfoto mit.',
    {
      'id':
          'Wanita: Pak Yilmaz, bagaimana hari pertama Anda di perusahaan kami? Pria: Baik, terima kasih. Rekan-rekannya ramah sekali. Hanya saja saya belum menemukan jalan ke kantin. Wanita: Kantinnya di lantai dasar, di sebelah pintu masuk. Makan siang ada dari jam dua belas sampai empat belas. Pria: Lalu di mana saya bisa dapat kartu karyawan? Wanita: Di bagian personalia, lantai dua, ruang dua ratus lima. Tolong bawa pasfoto.',
      'en':
          'Woman: Mr Yilmaz, how was your first day with us at the company? Man: Good, thank you. The colleagues are very nice. I just haven\'t found the way to the canteen yet. Woman: The canteen is on the ground floor, next to the entrance. Lunch is from twelve to two. Man: And where do I get my staff ID card? Woman: In the HR office, second floor, room two hundred and five. Please bring a passport photo.',
    },
    [
      _q('Di mana kantinnya?', 'Where is the canteen?', [
        'Im Erdgeschoss',
        'Im zweiten Stock',
        'In Zimmer 205',
        'Im Keller',
      ]),
      _q(
        'Apa yang harus dibawa pria itu ke bagian personalia?',
        'What must the man bring to the HR office?',
        ['Ein Passfoto', 'Seinen Vertrag', 'Seinen Pass', 'Ein Zeugnis'],
      ),
    ],
  ),
  _p(
    'de_a2_h2_08',
    'Teil 2 – Gespräch 8',
    'Mann: Sabine, wollen wir im Sommer zusammen Urlaub machen? Frau: Gern! Wohin möchtest du? Mann: Ich dachte an die Ostsee. Wir könnten mit dem Zug fahren und eine Ferienwohnung mieten. Frau: Die Ostsee finde ich schön, aber im Juli ist dort alles so voll. Wie wäre es im September? Mann: Im September muss ich arbeiten, aber Ende August geht. Frau: Okay, dann die letzte Augustwoche. Ich suche heute Abend im Internet nach einer Wohnung.',
    {
      'id':
          'Pria: Sabine, mau liburan bareng musim panas nanti? Wanita: Mau! Kamu mau ke mana? Pria: Aku kepikiran Laut Baltik. Kita bisa naik kereta dan sewa apartemen liburan. Wanita: Laut Baltik bagus, tapi bulan Juli di sana penuh sekali. Bagaimana kalau September? Pria: September aku harus kerja, tapi akhir Agustus bisa. Wanita: Oke, berarti minggu terakhir Agustus. Nanti malam aku cari apartemen di internet.',
      'en':
          'Man: Sabine, shall we go on holiday together in the summer? Woman: Yes! Where would you like to go? Man: I was thinking of the Baltic Sea. We could go by train and rent a holiday flat. Woman: I like the Baltic Sea, but in July everything there is so crowded. How about September? Man: In September I have to work, but the end of August is fine. Woman: Okay, then the last week of August. I\'ll look for a flat on the internet this evening.',
    },
    [
      _q('Kapan mereka berlibur?', 'When are they going on holiday?', [
        'Ende August',
        'Im Juli',
        'Im September',
        'Anfang August',
      ]),
      _q('Bagaimana mereka bepergian?', 'How are they travelling?', [
        'Mit dem Zug',
        'Mit dem Auto',
        'Mit dem Flugzeug',
        'Mit dem Bus',
      ]),
    ],
  ),

  // -------------------------------------------------------------------------
  // Teil 3 – kurze Dialoge (Wo? Was? Wann? Wie viel?)
  // -------------------------------------------------------------------------
  _p(
    'de_a2_h3_01',
    'Teil 3 – Dialog 1',
    'Frau: Wo treffen wir uns morgen? Vor dem Kino? Mann: Lieber am Bahnhof, da ist es einfacher. Frau: Gut, dann am Bahnhof, beim Kiosk, um sieben.',
    {
      'id':
          'Wanita: Besok kita ketemu di mana? Di depan bioskop? Pria: Lebih baik di stasiun, lebih gampang. Wanita: Oke, di stasiun, dekat kios, jam tujuh.',
      'en':
          'Woman: Where shall we meet tomorrow? In front of the cinema? Man: Better at the station, that\'s easier. Woman: Fine, at the station then, by the kiosk, at seven.',
    },
    [
      _q('Di mana mereka bertemu?', 'Where are they meeting?', [
        'Am Bahnhof',
        'Vor dem Kino',
        'Im Café',
        'An der Bushaltestelle',
      ]),
    ],
  ),
  _p(
    'de_a2_h3_02',
    'Teil 3 – Dialog 2',
    'Mann: Was möchtest du trinken? Kaffee? Frau: Nein danke, ich habe heute schon drei Tassen getrunken. Ich nehme einen Tee mit Zitrone. Mann: Und ich ein Wasser.',
    {
      'id':
          'Pria: Kamu mau minum apa? Kopi? Wanita: Tidak, terima kasih, hari ini aku sudah minum tiga cangkir. Aku pesan teh lemon. Pria: Aku air putih.',
      'en':
          'Man: What would you like to drink? Coffee? Woman: No thanks, I\'ve already had three cups today. I\'ll have a tea with lemon. Man: And I\'ll have a water.',
    },
    [
      _q('Apa yang diminum wanita itu?', 'What does the woman drink?', [
        'Tee mit Zitrone',
        'Kaffee',
        'Wasser',
        'Orangensaft',
      ]),
    ],
  ),
  _p(
    'de_a2_h3_03',
    'Teil 3 – Dialog 3',
    'Frau: Wann fährt der nächste Zug nach Köln? Mann: Um vierzehn Uhr zwölf, von Gleis sieben. Der um vierzehn Uhr fällt heute aus. Frau: Danke!',
    {
      'id':
          'Wanita: Kapan kereta berikutnya ke Köln? Pria: Jam empat belas lewat dua belas, dari jalur tujuh. Kereta jam empat belas hari ini batal. Wanita: Terima kasih!',
      'en':
          'Woman: When is the next train to Cologne? Man: At 2:12 p.m., from platform seven. The 2 p.m. one is cancelled today. Woman: Thanks!',
    },
    [
      _q(
        'Kapan kereta berikutnya ke Köln berangkat?',
        'When does the next train to Cologne leave?',
        ['Um 14:12 Uhr', 'Um 14:00 Uhr', 'Um 7:12 Uhr', 'Um 14:20 Uhr'],
      ),
    ],
  ),
  _p(
    'de_a2_h3_04',
    'Teil 3 – Dialog 4',
    'Mann: Was kosten die Tomaten? Frau: Das Kilo kostet zwei Euro fünfzig. Mann: Dann nehme ich zwei Kilo. Frau: Das macht fünf Euro.',
    {
      'id':
          'Pria: Berapa harga tomatnya? Wanita: Sekilo dua euro lima puluh. Pria: Saya ambil dua kilo. Wanita: Jadi lima euro.',
      'en':
          'Man: How much are the tomatoes? Woman: A kilo costs two euros fifty. Man: Then I\'ll take two kilos. Woman: That\'s five euros.',
    },
    [
      _q('Berapa yang dibayar pria itu?', 'How much does the man pay?', [
        '5,00 €',
        '2,50 €',
        '2,00 €',
        '7,50 €',
      ]),
    ],
  ),
  _p(
    'de_a2_h3_05',
    'Teil 3 – Dialog 5',
    'Frau: Wo ist denn mein Handy? Ich finde es nicht. Mann: Hast du in deiner Tasche gesucht? Frau: Ja, da ist es nicht. Mann: Schau mal, da liegt es, auf dem Sofa unter der Zeitung.',
    {
      'id':
          'Wanita: Di mana HP-ku ya? Aku tidak menemukannya. Pria: Sudah cari di tasmu? Wanita: Sudah, tidak ada di situ. Pria: Lihat, itu dia, di sofa di bawah koran.',
      'en':
          'Woman: Where is my mobile? I can\'t find it. Man: Have you looked in your bag? Woman: Yes, it isn\'t there. Man: Look, there it is, on the sofa under the newspaper.',
    },
    [
      _q('Di mana HP-nya?', 'Where is the mobile phone?', [
        'Auf dem Sofa',
        'In der Tasche',
        'Auf dem Tisch',
        'In der Küche',
      ]),
    ],
  ),
  _p(
    'de_a2_h3_06',
    'Teil 3 – Dialog 6',
    'Mann: Wann hast du morgen Zeit? Am Vormittag? Frau: Nein, vormittags arbeite ich. Aber ab sechzehn Uhr bin ich frei. Mann: Gut, dann komme ich um halb fünf zu dir.',
    {
      'id':
          'Pria: Besok kamu punya waktu kapan? Pagi? Wanita: Tidak, pagi aku kerja. Tapi mulai jam enam belas aku bebas. Pria: Baik, aku datang ke tempatmu jam setengah lima.',
      'en':
          'Man: When do you have time tomorrow? In the morning? Woman: No, I work in the mornings. But from 4 p.m. I\'m free. Man: Good, then I\'ll come to your place at half past four.',
    },
    [
      _q('Jam berapa pria itu datang?', 'At what time is the man coming?', [
        'Um 16:30 Uhr',
        'Um 16:00 Uhr',
        'Um 15:30 Uhr',
        'Am Vormittag',
      ]),
    ],
  ),
  _p(
    'de_a2_h3_07',
    'Teil 3 – Dialog 7',
    'Frau: Wie bist du heute zur Arbeit gekommen? Mit dem Fahrrad? Mann: Nein, das ist kaputt. Und der Bus war mir zu voll. Ich bin zu Fuß gegangen, das dauert nur zwanzig Minuten.',
    {
      'id':
          'Wanita: Hari ini kamu ke kantor naik apa? Sepeda? Pria: Bukan, sepedanya rusak. Busnya juga terlalu penuh. Aku jalan kaki, cuma dua puluh menit.',
      'en':
          'Woman: How did you get to work today? By bike? Man: No, it\'s broken. And the bus was too full for me. I walked, it only takes twenty minutes.',
    },
    [
      _q(
        'Bagaimana pria itu pergi kerja hari ini?',
        'How did the man get to work today?',
        ['Zu Fuß', 'Mit dem Fahrrad', 'Mit dem Bus', 'Mit dem Auto'],
      ),
    ],
  ),
  _p(
    'de_a2_h3_08',
    'Teil 3 – Dialog 8',
    'Mann: Entschuldigung, wo finde ich die Milch? Frau: Die Milchprodukte sind ganz hinten links, neben dem Käse. Mann: Und das Brot? Frau: Das Brot ist vorne beim Eingang.',
    {
      'id':
          'Pria: Permisi, susunya di mana ya? Wanita: Produk susu ada di paling belakang sebelah kiri, di samping keju. Pria: Kalau roti? Wanita: Roti ada di depan dekat pintu masuk.',
      'en':
          'Man: Excuse me, where can I find the milk? Woman: The dairy products are right at the back on the left, next to the cheese. Man: And the bread? Woman: The bread is at the front by the entrance.',
    },
    [
      _q('Di mana susunya?', 'Where is the milk?', [
        'Hinten links neben dem Käse',
        'Vorne beim Eingang',
        'Hinten rechts neben dem Brot',
        'An der Kasse',
      ]),
    ],
  ),
  _p(
    'de_a2_h3_09',
    'Teil 3 – Dialog 9',
    'Frau: Was machst du am Wochenende? Mann: Eigentlich wollte ich Fußball spielen, aber ich habe mir das Bein verletzt. Jetzt bleibe ich zu Hause und sehe Filme. Frau: Gute Besserung!',
    {
      'id':
          'Wanita: Akhir pekan ini kamu ngapain? Pria: Sebenarnya aku mau main sepak bola, tapi kakiku cedera. Sekarang aku di rumah saja nonton film. Wanita: Semoga cepat sembuh!',
      'en':
          'Woman: What are you doing at the weekend? Man: Actually I wanted to play football, but I\'ve hurt my leg. Now I\'m staying at home and watching films. Woman: Get well soon!',
    },
    [
      _q(
        'Apa yang dilakukan pria itu akhir pekan ini?',
        'What is the man doing at the weekend?',
        [
          'Er sieht zu Hause Filme.',
          'Er spielt Fußball.',
          'Er geht zum Arzt.',
          'Er besucht Freunde.',
        ],
      ),
    ],
  ),
  _p(
    'de_a2_h3_10',
    'Teil 3 – Dialog 10',
    'Mann: Wie viel kostet ein Monatsticket für den Bus? Frau: Normal sind es neunundvierzig Euro. Für Auszubildende gibt es ein Ticket für neununddreißig Euro. Mann: Ich bin Azubi. Dann nehme ich das.',
    {
      'id':
          'Pria: Berapa harga tiket bulanan bus? Wanita: Normalnya empat puluh sembilan euro. Untuk peserta Ausbildung ada tiket seharga tiga puluh sembilan euro. Pria: Saya peserta Ausbildung. Saya ambil itu.',
      'en':
          'Man: How much is a monthly bus ticket? Woman: Normally it\'s forty-nine euros. For apprentices there is a ticket for thirty-nine euros. Man: I\'m an apprentice. Then I\'ll take that one.',
    },
    [
      _q(
        'Berapa yang dibayar pria itu untuk tiketnya?',
        'How much does the man pay for his ticket?',
        ['39 €', '49 €', '29 €', '93 €'],
      ),
    ],
  ),
  _p(
    'de_a2_h3_11',
    'Teil 3 – Dialog 11',
    'Frau: Pfleger Thomas, wann bekommt Herr Lang seine Tabletten? Mann: Die blauen Tabletten nach dem Frühstück, die weiße am Abend vor dem Schlafen. Frau: Gut, ich schreibe es auf.',
    {
      'id':
          'Wanita: Perawat Thomas, kapan Pak Lang minum obatnya? Pria: Tablet biru setelah sarapan, yang putih malam hari sebelum tidur. Wanita: Baik, saya catat.',
      'en':
          'Woman: Nurse Thomas, when does Mr Lang get his tablets? Man: The blue tablets after breakfast, the white one in the evening before sleeping. Woman: Good, I\'ll write it down.',
    },
    [
      _q(
        'Kapan Pak Lang minum tablet putih?',
        'When does Mr Lang take the white tablet?',
        [
          'Am Abend vor dem Schlafen',
          'Nach dem Frühstück',
          'Vor dem Mittagessen',
          'In der Nacht',
        ],
      ),
    ],
  ),
  _p(
    'de_a2_h3_12',
    'Teil 3 – Dialog 12',
    'Mann: Was hast du deiner Mutter zum Muttertag geschenkt? Frau: Letztes Jahr Blumen. Dieses Jahr habe ich sie zum Essen in ein Restaurant eingeladen. Mann: Schöne Idee!',
    {
      'id':
          'Pria: Kamu kasih apa ke ibumu waktu Hari Ibu? Wanita: Tahun lalu bunga. Tahun ini aku mengajaknya makan di restoran. Pria: Ide bagus!',
      'en':
          'Man: What did you give your mother for Mother\'s Day? Woman: Last year flowers. This year I invited her for a meal at a restaurant. Man: Nice idea!',
    },
    [
      _q(
        'Apa hadiah tahun ini untuk ibunya?',
        'What was the present for her mother this year?',
        ['Ein Essen im Restaurant', 'Blumen', 'Ein Buch', 'Eine Reise'],
      ),
    ],
  ),
  _p(
    'de_a2_h3_13',
    'Teil 3 – Dialog 13',
    'Frau: Wo wohnst du jetzt? Immer noch in der Gartenstraße? Mann: Nein, seit März wohne ich in der Bergstraße, direkt gegenüber vom Krankenhaus. Da arbeite ich ja auch.',
    {
      'id':
          'Wanita: Sekarang kamu tinggal di mana? Masih di Gartenstraße? Pria: Tidak, sejak Maret aku tinggal di Bergstraße, tepat di seberang rumah sakit. Aku kan juga kerja di sana.',
      'en':
          'Woman: Where do you live now? Still in Gartenstraße? Man: No, since March I\'ve been living in Bergstraße, directly opposite the hospital. That\'s where I work, too.',
    },
    [
      _q('Di mana pria itu tinggal sekarang?', 'Where does the man live now?', [
        'In der Bergstraße',
        'In der Gartenstraße',
        'Im Krankenhaus',
        'In der Marktstraße',
      ]),
    ],
  ),
  _p(
    'de_a2_h3_14',
    'Teil 3 – Dialog 14',
    'Mann: Wie lange dauert die Reparatur von meinem Laptop? Frau: Wir müssen ein neues Teil bestellen. Das dauert etwa eine Woche. Mann: Eine Woche? Na gut, dann komme ich nächsten Montag.',
    {
      'id':
          'Pria: Berapa lama perbaikan laptop saya? Wanita: Kami harus memesan suku cadang baru. Kira-kira satu minggu. Pria: Satu minggu? Ya sudah, saya datang Senin depan.',
      'en':
          'Man: How long will the repair of my laptop take? Woman: We have to order a new part. That will take about a week. Man: A week? All right, then I\'ll come next Monday.',
    },
    [
      _q('Berapa lama perbaikannya?', 'How long does the repair take?', [
        'Etwa eine Woche',
        'Einen Tag',
        'Zwei Wochen',
        'Eine Stunde',
      ]),
    ],
  ),

  // -------------------------------------------------------------------------
  // Teil 4 – Interviews und Radiogespräche
  // -------------------------------------------------------------------------
  _p(
    'de_a2_h4_01',
    'Teil 4 – Interview 1',
    'Mann: Heute ist Frau Santos bei uns im Studio. Frau Santos, Sie kommen aus Brasilien und arbeiten als Pflegefachkraft in Hamburg. Wie lange sind Sie schon hier? Frau: Seit drei Jahren. Am Anfang war es schwer, besonders die Sprache und das Wetter. Mann: Und jetzt? Frau: Jetzt geht es gut. Ich arbeite auf einer Kinderstation, und die Arbeit macht mir viel Spaß. Nur meine Familie fehlt mir. Ich fliege einmal im Jahr nach Hause.',
    {
      'id':
          'Pria: Hari ini Ibu Santos hadir di studio kami. Ibu Santos, Anda berasal dari Brasil dan bekerja sebagai perawat di Hamburg. Sudah berapa lama di sini? Wanita: Sejak tiga tahun. Awalnya sulit, terutama bahasa dan cuacanya. Pria: Sekarang? Wanita: Sekarang baik-baik saja. Saya bekerja di bangsal anak, dan pekerjaannya sangat menyenangkan. Hanya saja saya rindu keluarga. Saya pulang sekali setahun.',
      'en':
          'Man: Today Ms Santos is with us in the studio. Ms Santos, you come from Brazil and work as a nurse in Hamburg. How long have you been here? Woman: For three years. At the beginning it was hard, especially the language and the weather. Man: And now? Woman: Now it\'s going well. I work on a children\'s ward and I really enjoy the work. I just miss my family. I fly home once a year.',
    },
    [
      _q(_true, _trueEn, [
        'Frau Santos arbeitet gern auf der Kinderstation.',
        'Frau Santos lebt seit einem Jahr in Hamburg.',
        'Frau Santos fand die Sprache am Anfang leicht.',
        'Frau Santos fliegt jeden Monat nach Brasilien.',
      ]),
      _q(
        'Apa yang sulit bagi Ibu Santos di awal?',
        'What was difficult for Ms Santos at the beginning?',
        [
          'Die Sprache und das Wetter',
          'Die Arbeit mit Kindern',
          'Die Kollegen',
          'Das Essen',
        ],
      ),
    ],
  ),
  _p(
    'de_a2_h4_02',
    'Teil 4 – Interview 2',
    'Frau: Herr Peters, Sie fahren jeden Tag mit dem Fahrrad zur Arbeit, auch im Winter. Warum? Mann: Erstens ist es gesund. Zweitens bin ich mit dem Rad schneller als mit dem Auto, weil es in der Stadt so viel Stau gibt. Frau: Und wenn es regnet? Mann: Dann ziehe ich eine Regenjacke an. Nur bei Schnee und Eis nehme ich die Straßenbahn.',
    {
      'id':
          'Wanita: Pak Peters, Anda bersepeda ke kantor setiap hari, bahkan saat musim dingin. Kenapa? Pria: Pertama, itu sehat. Kedua, dengan sepeda saya lebih cepat daripada dengan mobil, karena di kota sering macet. Wanita: Kalau hujan? Pria: Saya pakai jaket hujan. Hanya kalau ada salju dan es saya naik trem.',
      'en':
          'Woman: Mr Peters, you cycle to work every day, even in winter. Why? Man: Firstly, it\'s healthy. Secondly, I\'m faster by bike than by car because there\'s so much traffic in the city. Woman: And when it rains? Man: Then I put on a rain jacket. Only when there\'s snow and ice do I take the tram.',
    },
    [
      _q(_true, _trueEn, [
        'Bei Schnee fährt Herr Peters mit der Straßenbahn.',
        'Bei Regen fährt Herr Peters mit dem Auto.',
        'Herr Peters findet Radfahren zu gefährlich.',
        'Mit dem Auto ist Herr Peters schneller.',
      ]),
    ],
  ),
  _p(
    'de_a2_h4_03',
    'Teil 4 – Interview 3',
    'Mann: In unserer Sendung sprechen wir heute über Hobbys. Frau Klein, Sie sind dreiundsiebzig Jahre alt und lernen Gitarre. Frau: Ja, das wollte ich schon immer. Früher hatte ich keine Zeit, ich hatte vier Kinder und habe viel gearbeitet. Jetzt bin ich Rentnerin. Mann: Wo lernen Sie? Frau: Mein Enkel gibt mir Unterricht, jeden Dienstag. Und ich übe jeden Tag eine halbe Stunde.',
    {
      'id':
          'Pria: Dalam acara kami hari ini kita membahas hobi. Ibu Klein, Anda berusia tujuh puluh tiga tahun dan sedang belajar gitar. Wanita: Ya, itu sudah lama saya inginkan. Dulu saya tidak punya waktu, anak saya empat dan saya banyak bekerja. Sekarang saya pensiunan. Pria: Belajar di mana? Wanita: Cucu saya yang mengajar, setiap Selasa. Dan saya berlatih setiap hari setengah jam.',
      'en':
          'Man: In our programme today we\'re talking about hobbies. Ms Klein, you are seventy-three years old and you\'re learning the guitar. Woman: Yes, I always wanted to. In the past I had no time, I had four children and worked a lot. Now I\'m retired. Man: Where do you learn? Woman: My grandson gives me lessons every Tuesday. And I practise for half an hour every day.',
    },
    [
      _q('Siapa yang mengajari Ibu Klein?', 'Who teaches Ms Klein?', [
        'Ihr Enkel',
        'Ihr Sohn',
        'Eine Musikschule',
        'Ihre Nachbarin',
      ]),
      _q(_true, _trueEn, [
        'Frau Klein übt jeden Tag.',
        'Frau Klein arbeitet noch.',
        'Frau Klein hat zwei Kinder.',
        'Frau Klein spielt schon lange Gitarre.',
      ]),
    ],
  ),
  _p(
    'de_a2_h4_04',
    'Teil 4 – Interview 4',
    'Frau: Herr Nguyen, Sie machen eine Ausbildung zum Koch. Wie sieht Ihr Tag aus? Mann: Ich fange um zehn Uhr an und arbeite oft bis zweiundzwanzig Uhr, mit einer Pause am Nachmittag. Zweimal pro Woche gehe ich in die Berufsschule. Frau: Ist das nicht anstrengend? Mann: Doch, manchmal schon. Aber ich lerne viel, und mein Chef ist sehr geduldig. Nach der Ausbildung möchte ich gern ein eigenes Restaurant eröffnen.',
    {
      'id':
          'Wanita: Pak Nguyen, Anda sedang Ausbildung sebagai juru masak. Seperti apa hari Anda? Pria: Saya mulai jam sepuluh dan sering kerja sampai jam dua puluh dua, dengan istirahat di sore hari. Dua kali seminggu saya ke sekolah kejuruan. Wanita: Apa itu tidak melelahkan? Pria: Kadang memang iya. Tapi saya belajar banyak, dan bos saya sangat sabar. Setelah Ausbildung saya ingin membuka restoran sendiri.',
      'en':
          'Woman: Mr Nguyen, you are training to be a cook. What does your day look like? Man: I start at ten and often work until ten p.m., with a break in the afternoon. Twice a week I go to vocational school. Woman: Isn\'t that tiring? Man: Yes, sometimes. But I learn a lot, and my boss is very patient. After my training I\'d like to open my own restaurant.',
    },
    [
      _q(_true, _trueEn, [
        'Herr Nguyen geht zweimal pro Woche in die Berufsschule.',
        'Herr Nguyen beginnt um acht Uhr.',
        'Der Chef von Herrn Nguyen ist oft ungeduldig.',
        'Herr Nguyen hat schon ein eigenes Restaurant.',
      ]),
      _q(
        'Apa rencana Pak Nguyen setelah Ausbildung?',
        'What is Mr Nguyen\'s plan after his training?',
        [
          'Ein eigenes Restaurant eröffnen',
          'Studieren',
          'In sein Heimatland zurückgehen',
          'Als Lehrer arbeiten',
        ],
      ),
    ],
  ),
  _p(
    'de_a2_h4_05',
    'Teil 4 – Interview 5',
    'Mann: Frau Hoffmann, Sie haben vor zwei Jahren aufgehört, Fleisch zu essen. Warum? Frau: Ich habe einen Film über Tiere gesehen, danach wollte ich kein Fleisch mehr. Mann: War die Umstellung schwer? Frau: Am Anfang ein bisschen, weil ich nicht viele vegetarische Rezepte kannte. Aber jetzt koche ich viel mit Gemüse und Linsen. Fisch esse ich manchmal noch.',
    {
      'id':
          'Pria: Ibu Hoffmann, dua tahun lalu Anda berhenti makan daging. Kenapa? Wanita: Saya menonton film tentang hewan, setelah itu saya tidak mau makan daging lagi. Pria: Apakah peralihannya sulit? Wanita: Awalnya sedikit, karena saya tidak tahu banyak resep vegetarian. Tapi sekarang saya banyak memasak sayur dan lentil. Ikan kadang-kadang masih saya makan.',
      'en':
          'Man: Ms Hoffmann, two years ago you stopped eating meat. Why? Woman: I saw a film about animals, and after that I didn\'t want meat any more. Man: Was the change difficult? Woman: A little at the beginning, because I didn\'t know many vegetarian recipes. But now I cook a lot with vegetables and lentils. I still eat fish sometimes.',
    },
    [
      _q(_true, _trueEn, [
        'Frau Hoffmann isst manchmal Fisch.',
        'Frau Hoffmann isst seit fünf Jahren kein Fleisch.',
        'Der Arzt hat Frau Hoffmann kein Fleisch erlaubt.',
        'Frau Hoffmann kocht nicht gern.',
      ]),
    ],
  ),
  _p(
    'de_a2_h4_06',
    'Teil 4 – Interview 6',
    'Frau: Herr Weber, Sie sind Hausmeister in einer großen Schule. Was gefällt Ihnen an Ihrem Beruf? Mann: Jeder Tag ist anders. Mal repariere ich eine Lampe, mal ein Fenster, mal helfe ich beim Schulfest. Und ich habe viel Kontakt mit den Schülern. Frau: Gibt es auch etwas, das Ihnen nicht gefällt? Mann: Ja, ich muss sehr früh aufstehen, schon um fünf Uhr. Im Winter ist das nicht schön.',
    {
      'id':
          'Wanita: Pak Weber, Anda pengurus gedung di sebuah sekolah besar. Apa yang Anda sukai dari pekerjaan Anda? Pria: Setiap hari berbeda. Kadang saya memperbaiki lampu, kadang jendela, kadang membantu di festival sekolah. Dan saya banyak berinteraksi dengan murid. Wanita: Ada juga yang tidak Anda sukai? Pria: Ada, saya harus bangun sangat pagi, sudah jam lima. Saat musim dingin itu tidak enak.',
      'en':
          'Woman: Mr Weber, you are the caretaker at a big school. What do you like about your job? Man: Every day is different. Sometimes I repair a lamp, sometimes a window, sometimes I help at the school festival. And I have a lot of contact with the pupils. Woman: Is there anything you don\'t like? Man: Yes, I have to get up very early, at five o\'clock. In winter that\'s not nice.',
    },
    [
      _q('Apa yang tidak disukai Pak Weber?', 'What does Mr Weber not like?', [
        'Früh aufstehen',
        'Den Kontakt mit Schülern',
        'Lampen reparieren',
        'Das Schulfest',
      ]),
      _q(_true, _trueEn, [
        'Für Herrn Weber ist jeder Arbeitstag anders.',
        'Herr Weber arbeitet in einem Krankenhaus.',
        'Herr Weber steht um sieben Uhr auf.',
        'Herr Weber hat keinen Kontakt mit Schülern.',
      ]),
    ],
  ),
  _p(
    'de_a2_h4_07',
    'Teil 4 – Interview 7',
    'Mann: Frau Rahman, Sie sind vor einem Jahr aus Indonesien nach Deutschland gekommen. Wie haben Sie Deutsch gelernt? Frau: Zuerst in einem Kurs in Jakarta, dann hier in der Volkshochschule. Aber am meisten lerne ich bei der Arbeit, im Altenheim. Die Bewohner erzählen mir viel. Mann: Was ist für Sie am schwierigsten? Frau: Der Dialekt! Viele ältere Leute sprechen Schwäbisch, das verstehe ich oft nicht.',
    {
      'id':
          'Pria: Ibu Rahman, Anda datang dari Indonesia ke Jerman setahun lalu. Bagaimana Anda belajar bahasa Jerman? Wanita: Pertama di kursus di Jakarta, lalu di sini di Volkshochschule. Tapi paling banyak saya belajar di tempat kerja, di panti werdha. Para penghuni banyak bercerita kepada saya. Pria: Apa yang paling sulit bagi Anda? Wanita: Dialeknya! Banyak orang tua berbicara bahasa Schwaben, itu sering tidak saya mengerti.',
      'en':
          'Man: Ms Rahman, you came from Indonesia to Germany a year ago. How did you learn German? Woman: First in a course in Jakarta, then here at the adult education centre. But I learn most at work, in the old people\'s home. The residents tell me a lot. Man: What is the most difficult thing for you? Woman: The dialect! Many older people speak Swabian, and I often don\'t understand it.',
    },
    [
      _q(
        'Apa yang paling sulit bagi Ibu Rahman?',
        'What is most difficult for Ms Rahman?',
        ['Der Dialekt', 'Die Grammatik', 'Das Schreiben', 'Die Arbeit'],
      ),
      _q(_true, _trueEn, [
        'Frau Rahman lernt bei der Arbeit am meisten.',
        'Frau Rahman hat nur in Jakarta Deutsch gelernt.',
        'Frau Rahman arbeitet in einem Kindergarten.',
        'Frau Rahman lebt seit fünf Jahren in Deutschland.',
      ]),
    ],
  ),
  _p(
    'de_a2_h4_08',
    'Teil 4 – Interview 8',
    'Frau: Herr Fischer, Sie wohnen seit zehn Jahren ohne Auto. Wie geht das? Mann: Sehr gut. Ich wohne in der Stadtmitte, der Supermarkt ist um die Ecke, und zur Arbeit fahre ich mit der U-Bahn. Frau: Und wenn Sie verreisen? Mann: Dann nehme ich den Zug. Und für große Einkäufe leihe ich mir manchmal ein Auto beim Carsharing. Das ist viel billiger als ein eigenes Auto.',
    {
      'id':
          'Wanita: Pak Fischer, sudah sepuluh tahun Anda hidup tanpa mobil. Bagaimana caranya? Pria: Sangat lancar. Saya tinggal di pusat kota, supermarket ada di dekat sini, dan ke kantor saya naik kereta bawah tanah. Wanita: Kalau bepergian? Pria: Saya naik kereta. Dan untuk belanja besar kadang saya meminjam mobil lewat carsharing. Itu jauh lebih murah daripada punya mobil sendiri.',
      'en':
          'Woman: Mr Fischer, you\'ve lived without a car for ten years. How does that work? Man: Very well. I live in the city centre, the supermarket is round the corner, and I take the underground to work. Woman: And when you travel? Man: Then I take the train. And for big shopping trips I sometimes rent a car through car sharing. That\'s much cheaper than having my own car.',
    },
    [
      _q(_true, _trueEn, [
        'Für große Einkäufe leiht Herr Fischer manchmal ein Auto.',
        'Herr Fischer fährt mit dem Bus zur Arbeit.',
        'Herr Fischer wohnt außerhalb der Stadt.',
        'Herr Fischer findet Carsharing zu teuer.',
      ]),
    ],
  ),
  _p(
    'de_a2_h4_09',
    'Teil 4 – Interview 9',
    'Mann: Frau Lehmann, Sie haben im Frühling einen Laden für gebrauchte Kleidung eröffnet. Wie läuft es? Frau: Besser als gedacht! Viele junge Leute kommen, weil die Sachen günstig sind und weil sie die Umwelt schützen wollen. Mann: Woher bekommen Sie die Kleidung? Frau: Die Leute bringen sie mir. Für jedes Stück bekommen sie einen kleinen Gutschein für den Laden.',
    {
      'id':
          'Pria: Ibu Lehmann, musim semi lalu Anda membuka toko pakaian bekas. Bagaimana perkembangannya? Wanita: Lebih baik dari dugaan! Banyak anak muda datang karena barangnya murah dan karena mereka ingin menjaga lingkungan. Pria: Dari mana Anda mendapat pakaiannya? Wanita: Orang-orang membawanya ke saya. Untuk setiap potong mereka mendapat voucher kecil untuk toko.',
      'en':
          'Man: Ms Lehmann, in spring you opened a second-hand clothes shop. How is it going? Woman: Better than expected! Lots of young people come because the things are cheap and because they want to protect the environment. Man: Where do you get the clothes from? Woman: People bring them to me. For each item they get a small voucher for the shop.',
    },
    [
      _q(
        'Apa yang didapat orang untuk pakaian yang mereka bawa?',
        'What do people get for the clothes they bring?',
        ['Einen Gutschein', 'Bargeld', 'Nichts', 'Einen Kaffee'],
      ),
      _q(_true, _trueEn, [
        'Viele junge Leute kaufen in dem Laden.',
        'Der Laden läuft schlechter als gedacht.',
        'Frau Lehmann verkauft neue Kleidung.',
        'Frau Lehmann hat den Laden im Herbst eröffnet.',
      ]),
    ],
  ),
  _p(
    'de_a2_h4_10',
    'Teil 4 – Interview 10',
    'Frau: Herr Braun, Sie arbeiten seit zwanzig Jahren als Busfahrer. Was ist das Schönste an Ihrem Beruf? Mann: Die Menschen. Ich kenne viele Fahrgäste schon lange, und wir sprechen jeden Morgen kurz miteinander. Frau: Und was ist schwierig? Mann: Der Verkehr wird immer schlimmer, und manche Fahrgäste sind unfreundlich, wenn der Bus Verspätung hat. Aber in zwei Jahren gehe ich in Rente.',
    {
      'id':
          'Wanita: Pak Braun, Anda sudah dua puluh tahun bekerja sebagai sopir bus. Apa yang paling menyenangkan dari pekerjaan Anda? Pria: Orang-orangnya. Saya sudah lama kenal banyak penumpang, dan setiap pagi kami mengobrol sebentar. Wanita: Lalu apa yang sulit? Pria: Lalu lintas makin parah, dan beberapa penumpang tidak ramah kalau busnya terlambat. Tapi dua tahun lagi saya pensiun.',
      'en':
          'Woman: Mr Braun, you\'ve been working as a bus driver for twenty years. What is the best thing about your job? Man: The people. I\'ve known many passengers for a long time, and we chat briefly every morning. Woman: And what is difficult? Man: The traffic is getting worse and worse, and some passengers are unfriendly when the bus is late. But in two years I\'m retiring.',
    },
    [
      _q(_true, _trueEn, [
        'Herr Braun geht in zwei Jahren in Rente.',
        'Herr Braun ist seit zwei Jahren Busfahrer.',
        'Herr Braun spricht nicht gern mit Fahrgästen.',
        'Der Verkehr wird immer besser.',
      ]),
    ],
  ),
];
