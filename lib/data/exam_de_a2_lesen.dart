/// Bank soal Lesen (membaca) Goethe-Zertifikat A2 untuk mode Ujian kursus
/// Jerman.
///
/// Tipe soal (meniru bagian Lesen A2):
/// - Teil 1: artikel koran pendek + soal isi.
/// - Teil 2: papan petunjuk toko/gedung (Welcher Stock? Wo finden Sie …?).
/// - Teil 3: email pribadi/kantor.
/// - Teil 4: mencocokkan kebutuhan orang dengan iklan.
/// - Teil 5: petunjuk/pengumuman (Hausordnung, Kursinformation).
///
/// Konten disusun sendiri (bukan salinan soal asli). Semua soal memakai
/// 4 pilihan; soal benar/salah diubah menjadi "Welche Aussage ist richtig?".
/// Pilihan PERTAMA pada setiap soal adalah jawaban benar (`answer: 0`);
/// layar ujian yang bertugas mengacak urutan pilihan.
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

/// Soal satu-teks: instruksi bilingual + teks Jerman.
McqQuestion _read(String id, String en, String text, List<String> o) =>
    _q('$id\n$text', '$en\n$text', o);

/// "Welche Aussage ist richtig?" untuk soal satu-teks.
McqQuestion _true(String text, List<String> o) => _q(
  'Pernyataan mana yang benar? (Welche Aussage ist richtig?)\n$text',
  'Which statement is correct? (Welche Aussage ist richtig?)\n$text',
  o,
);

/// "Welche Aussage ist richtig?" untuk soal bacaan.
McqQuestion _richtig(List<String> o) => _q(
  'Pernyataan mana yang benar menurut teks? (Welche Aussage ist richtig?)',
  'Which statement is correct according to the text? '
      '(Welche Aussage ist richtig?)',
  o,
);

/// Teil 4: mencocokkan kebutuhan orang dengan iklan.
McqQuestion _ad(String situation, List<String> o) => _q(
  'Iklan mana yang paling cocok? (Welche Anzeige passt?)\n$situation',
  'Which ad fits best? (Welche Anzeige passt?)\n$situation',
  o,
);

/// Teil 2: papan petunjuk — ke mana Anda pergi?
McqQuestion _where(String situation, List<String> o) => _q(
  'Ke mana Anda harus pergi? (Wohin gehen Sie?)\n$situation',
  'Where do you go? (Wohin gehen Sie?)\n$situation',
  o,
);

/// Soal Lesen A2 satu-soal: pengumuman, pesan singkat, berita pendek,
/// aturan rumah/kursus, iklan lowongan/rumah, dan pencocokan orang–iklan
/// (meniru Teil 1, 3, 4, 5).
final List<McqQuestion> goetheA2ReadingMcq = [
  _read(
    'Pasien punya keluhan mendesak pada 1 Agustus. Apa yang harus dilakukan?',
    'A patient has an urgent problem on 1 August. What should they do?',
    'Praxis Dr. Becker: Vom 22.07. bis 09.08. ist die Praxis geschlossen. '
        'In dringenden Fällen gehen Sie bitte zu Dr. Hoffmann, '
        'Gartenstraße 12.',
    [
      'Zu Dr. Hoffmann gehen.',
      'In die Praxis Becker gehen.',
      'Bis zum 22.07. warten.',
      'Dr. Becker zu Hause anrufen.',
    ],
  ),
  _true(
    'Schwimmbad Nord: Wegen Reparaturarbeiten bleibt das Hallenbad bis '
    'Ende März geschlossen. Das Freibad öffnet wie immer am 1. Mai.',
    [
      'Im März kann man im Hallenbad nicht schwimmen.',
      'Das Freibad ist ab März offen.',
      'Das Hallenbad ist für immer geschlossen.',
      'Das Freibad wird repariert.',
    ],
  ),
  _read(
    'Apa yang Sandra minta dari Tim?',
    'What does Sandra ask Tim to do?',
    'Hallo Tim, ich stehe im Stau auf der A3. Fang bitte schon ohne mich '
        'mit dem Meeting an. Ich bin in etwa 30 Minuten da. Gruß, Sandra',
    [
      'Das Meeting ohne sie beginnen.',
      'Das Meeting absagen.',
      'Sie mit dem Auto abholen.',
      'Mit dem Meeting 30 Minuten warten.',
    ],
  ),
  _ad(
    'Ana aus Rumänien möchte in Deutschland eine Ausbildung als '
    'Pflegefachfrau machen. Sie sucht Informationen.',
    [
      'Pflegeschule am Klinikum: Ausbildungsstart 1. Oktober. Infoabend '
          'jeden ersten Montag im Monat.',
      'Pflegedienst Sonnenschein sucht Pflegehelfer mit Erfahrung, Vollzeit.',
      'Seniorenheim Am Park: Besuchszeiten täglich 10 bis 18 Uhr.',
      'Apotheke Linde: Blutdruck messen kostenlos, jeden Mittwoch.',
    ],
  ),
  _ad('Herr Yilmaz arbeitet bis 18 Uhr und möchte abends Deutsch lernen.', [
    'Volkshochschule: Deutschkurs A2, Dienstag und Donnerstag 19 bis 21 Uhr.',
    'Intensivkurs Deutsch A2: Montag bis Freitag 9 bis 13 Uhr.',
    'Englisch für den Beruf: Mittwoch 19 bis 21 Uhr.',
    'Deutschkurs für Kinder: Samstag 10 bis 12 Uhr.',
  ]),
  _ad(
    'Familie Schulz hat zwei Kinder und sucht eine Wohnung mit mindestens '
    'drei Zimmern in der Nähe einer Schule.',
    [
      '4-Zimmer-Wohnung, 95 m², Balkon, Grundschule 5 Minuten zu Fuß.',
      '1-Zimmer-Apartment, möbliert, ideal für Studenten.',
      '3-Zimmer-Wohnung im Industriegebiet, nächste Schule 8 km entfernt.',
      'Ferienwohnung an der Ostsee, 3 Zimmer, nur wochenweise.',
    ],
  ),
  _ad(
    'Maria hat ein gebrauchtes Fahrrad gekauft. Sie möchte lernen, wie man '
    'es selbst repariert.',
    [
      'Fahrradwerkstatt zum Mitmachen: Wir zeigen Ihnen, wie Sie Ihr Rad '
          'selbst reparieren. Jeden Samstag.',
      'Fahrradverleih am Bahnhof: 10 € pro Tag.',
      'Neue und gebrauchte Fahrräder – jetzt 20 % billiger!',
      'Radtour am Rhein: 60 km mit Picknick.',
    ],
  ),
  _ad(
    'Kofi geht von Montag bis Freitag in die Berufsschule. Am Wochenende '
    'möchte er Geld verdienen.',
    [
      'Bäckerei sucht Aushilfe für Samstag und Sonntag, 6 bis 12 Uhr.',
      'Vollzeitstelle im Lager, Montag bis Freitag 7 bis 16 Uhr.',
      'Kostenlose Nachhilfe in Mathe für Berufsschüler.',
      'Wochenendreise nach Prag – nur 99 €.',
    ],
  ),
  _ad(
    'Frau Lee hat oft Rückenschmerzen und sucht einen Sportkurs, der ihrem '
    'Rücken hilft.',
    [
      'Rückenfit: sanfte Gymnastik für einen starken Rücken. Die '
          'Krankenkasse zahlt mit.',
      'Marathon-Training für Fortgeschrittene.',
      'Kochkurs: gesund essen mit wenig Geld.',
      'Tanzkurs Salsa für Paare, jeden Freitag.',
    ],
  ),
  _ad('Sie möchten Ihr altes Sofa loswerden und nichts dafür bezahlen.', [
    'Sperrmüll: Die Stadt holt Ihre alten Möbel kostenlos ab. Termin unter '
        '0800 123 456.',
    'Möbelhaus Krone: neue Sofas ab 299 €.',
    'Umzugsfirma Schnell: Wir helfen beim Umzug – günstige Preise.',
    'Tischlerei Holz: Wir reparieren alte Stühle und Tische.',
  ]),
  _read(
    'Kapan tong sampah harus diletakkan di pinggir jalan?',
    'When must the bins be put out on the street?',
    'Hausordnung: Die Mülltonnen werden jeden Dienstag geleert. Bitte '
        'stellen Sie die Tonnen am Montagabend an die Straße.',
    ['Am Montagabend.', 'Am Dienstagabend.', 'Jeden Morgen.', 'Am Wochenende.'],
  ),
  _true(
    'Ruhezeiten im Haus: Montag bis Samstag 13 bis 15 Uhr und 22 bis 7 Uhr. '
    'An Sonn- und Feiertagen ganztägig.',
    [
      'Am Samstag um 10 Uhr darf man bohren.',
      'Am Sonntag um 11 Uhr darf man bohren.',
      'Am Mittwoch um 14 Uhr darf man bohren.',
      'Am Freitag um 23 Uhr darf man bohren.',
    ],
  ),
  _true(
    'Kursinformation: Der Kurs am 3. Mai fällt aus. Der Unterricht wird am '
    '10. Mai nachgeholt, dann von 17 bis 20 Uhr.',
    [
      'Am 10. Mai dauert der Unterricht drei Stunden.',
      'Am 3. Mai dauert der Kurs länger als sonst.',
      'Der Kurs ist ab Mai ganz zu Ende.',
      'Am 10. Mai fällt der Kurs aus.',
    ],
  ),
  _read(
    'Apa yang harus dilakukan dengan HP selama ujian?',
    'What must you do with your phone during the exam?',
    'Bitte beachten: Handys sind während der Prüfung auszuschalten und in '
        'die Tasche zu legen. Die Taschen bleiben vorne im Raum.',
    [
      'Ausschalten und in die Tasche legen.',
      'Auf den Tisch legen.',
      'Leise stellen und in der Hand behalten.',
      'Bei der Prüferin abgeben und später abholen.',
    ],
  ),
  _true(
    'Ab Juni fahren die Busse der Linie 5 auch nachts. Am Freitag und '
    'Samstag gibt es zwischen 0 und 4 Uhr jede Stunde einen Bus.',
    [
      'Am Wochenende kann man nachts mit der Linie 5 fahren.',
      'Die Linie 5 fährt jede Nacht.',
      'Nachts fahren die Busse alle 30 Minuten.',
      'Die Linie 5 fährt ab Juni nicht mehr.',
    ],
  ),
  _true(
    'Die Stadtbibliothek hat jetzt auch sonntags geöffnet, von 11 bis '
    '17 Uhr. Am Sonntag kann man aber keine Bücher ausleihen, nur lesen '
    'und lernen.',
    [
      'Am Sonntag kann man in der Bibliothek lernen.',
      'Am Sonntag kann man Bücher ausleihen.',
      'Die Bibliothek ist sonntags geschlossen.',
      'Sonntags ist die Bibliothek bis 20 Uhr offen.',
    ],
  ),
  _read(
    'Ke mana Anda membawa botol kosong?',
    'Where do you take your empty bottles?',
    'Liebe Kunden, der Pfandautomat ist leider defekt. Leere Flaschen geben '
        'Sie bitte an der Information ab. Vielen Dank!',
    [
      'Zur Information.',
      'Zum Pfandautomaten.',
      'In den Glascontainer vor dem Markt.',
      'Zurück nach Hause.',
    ],
  ),
  _read(
    'Mengapa Jan menulis email ini?',
    'Why does Jan write this email?',
    'Liebe Frau Klein, leider bin ich krank und kann morgen nicht zur '
        'Arbeit kommen. Die Krankmeldung schicke ich Ihnen per Post. Viele '
        'Grüße, Jan Weber',
    [
      'Er ist krank und kommt morgen nicht.',
      'Er möchte Urlaub nehmen.',
      'Er kommt morgen etwas später.',
      'Er hat eine neue Adresse.',
    ],
  ),
  _true(
    'Wir suchen: Pflegehelfer/in (m/w/d) in Teilzeit, 20 Stunden pro Woche. '
    'Führerschein Klasse B erforderlich. Deutschkenntnisse B1.',
    [
      'Man braucht einen Führerschein.',
      'Die Stelle ist in Vollzeit.',
      'Man muss 40 Stunden pro Woche arbeiten.',
      'Deutschkenntnisse sind nicht wichtig.',
    ],
  ),
  _read(
    'Di mana Anda bisa membeli obat malam ini?',
    'Where can you buy medicine tonight?',
    'Apotheke am Markt – Notdienst: Heute Nacht ist die Rosen-Apotheke, '
        'Lindenweg 3, bis 8 Uhr morgens geöffnet.',
    [
      'In der Rosen-Apotheke.',
      'In der Apotheke am Markt.',
      'Im Supermarkt am Lindenweg.',
      'Beim Hausarzt.',
    ],
  ),
  _read(
    'Bagaimana Anda pergi ke Bonn pada hari Sabtu?',
    'How do you get to Bonn on Saturday?',
    'Wegen Bauarbeiten fahren zwischen Köln und Bonn am Wochenende keine '
        'Züge. Bitte nutzen Sie die Busse vor dem Bahnhof '
        '(Schienenersatzverkehr).',
    [
      'Mit dem Bus vom Bahnhof.',
      'Mit dem Zug wie immer.',
      'Mit einem kostenlosen Taxi.',
      'Gar nicht, es gibt keine Verbindung.',
    ],
  ),
  _true(
    'Fundbüro – Öffnungszeiten: Montag, Mittwoch, Freitag 8 bis 12 Uhr, '
    'Donnerstag 14 bis 18 Uhr. Dienstag geschlossen.',
    [
      'Am Donnerstagnachmittag ist das Fundbüro offen.',
      'Am Dienstagvormittag ist das Fundbüro offen.',
      'Am Montagnachmittag ist das Fundbüro offen.',
      'Am Freitag ist das Fundbüro bis 18 Uhr offen.',
    ],
  ),
  _ad(
    'Herr Nguyen ist neu in der Stadt und möchte Leute kennenlernen. Er '
    'spielt gern Fußball.',
    [
      'Hobby-Fußballteam sucht neue Spieler – jeden Mittwoch 18 Uhr, alle '
          'sind willkommen!',
      'Fußball-Bundesliga: Tickets jetzt online kaufen.',
      'Sportgeschäft: Fußballschuhe 30 % billiger.',
      'Schachclub: Treffen jeden Montag im Café Zentral.',
    ],
  ),
  _ad(
    'Sie brauchen für Ihr Visum eine beglaubigte Übersetzung Ihres '
    'Abschlusszeugnisses.',
    [
      'Übersetzungsbüro Klar: beglaubigte Übersetzungen von Zeugnissen und '
          'Urkunden.',
      'Sprachschule Babel: Englisch und Spanisch für Anfänger.',
      'Fotostudio Blitz: biometrische Passfotos in 5 Minuten.',
      'Copyshop: Kopien ab 5 Cent.',
    ],
  ),
  _true(
    'An alle Mitarbeiter: Ab 1. März beginnt die Frühschicht um 6 Uhr statt '
    'um 6:30 Uhr. Die Spätschicht bleibt wie bisher.',
    [
      'Die Frühschicht beginnt früher als vorher.',
      'Die Spätschicht beginnt um 6 Uhr.',
      'Die Frühschicht beginnt später als vorher.',
      'Ab März gibt es keine Spätschicht mehr.',
    ],
  ),
  _read(
    'Bagaimana tamu membayar makan siang?',
    'How do guests pay for lunch?',
    'Kantine: Mittagessen von 11:30 bis 14 Uhr. Mitarbeiter zahlen mit '
        'ihrer Mitarbeiterkarte. Gäste zahlen bar an der Kasse.',
    [
      'Bar an der Kasse.',
      'Mit der Mitarbeiterkarte.',
      'Per Überweisung.',
      'Gar nicht, das Essen ist für Gäste kostenlos.',
    ],
  ),
  _read(
    'Apa gagasan utama berita ini?',
    'What is the main idea of this news item?',
    'Immer mehr junge Leute aus dem Ausland machen in Deutschland eine '
        'Ausbildung. Besonders beliebt sind Berufe in der Pflege, im Hotel '
        'und in der Gastronomie.',
    [
      'Viele junge Ausländer machen eine Ausbildung in Deutschland.',
      'Viele junge Deutsche machen eine Ausbildung im Ausland.',
      'Hotels suchen keine Mitarbeiter mehr.',
      'Die Pflege ist kein beliebter Beruf.',
    ],
  ),
  _true(
    '2-Zi.-Whg., 55 m², 3. OG ohne Aufzug, 650 € warm, frei ab 1.4., '
    'keine Haustiere.',
    [
      'Die Heizkosten sind in der Miete enthalten.',
      'Im Haus gibt es einen Aufzug.',
      'Hunde und Katzen sind erlaubt.',
      'Die Wohnung ist ab Januar frei.',
    ],
  ),
  _true(
    'Liebe Eltern, am Freitag machen wir einen Ausflug in den Zoo. Bitte '
    'geben Sie Ihrem Kind 5 € für den Eintritt und ein Lunchpaket mit. '
    'Wir sind um 15 Uhr zurück.',
    [
      'Die Kinder brauchen Geld und etwas zu essen.',
      'Der Eintritt in den Zoo ist kostenlos.',
      'Die Eltern fahren mit in den Zoo.',
      'Die Kinder kommen um 13 Uhr zurück.',
    ],
  ),
  _read(
    'Di mana boleh merokok?',
    'Where is smoking allowed?',
    'Klinikum Süd: Rauchen ist im ganzen Gebäude verboten. Der '
        'Raucherbereich ist hinter Haus B, neben dem Parkplatz.',
    [
      'Hinter Haus B.',
      'Im Gebäude.',
      'Vor dem Haupteingang.',
      'In der Cafeteria.',
    ],
  ),
  _true(
    'Zahnarztpraxis Dr. Roth: Bitte sagen Sie Ihren Termin mindestens '
    '24 Stunden vorher ab. Sonst müssen Sie 30 € bezahlen.',
    [
      'Wer zu spät absagt, muss bezahlen.',
      'Man kann Termine nicht absagen.',
      'Jeder Termin kostet 30 €.',
      'Man muss 24 Stunden im Wartezimmer warten.',
    ],
  ),
  _true(
    'Fitnessstudio Aktiv: Probetraining kostenlos! Mitgliedschaft 25 € im '
    'Monat, Mindestlaufzeit 12 Monate.',
    [
      'Man muss mindestens ein Jahr Mitglied bleiben.',
      'Das Probetraining kostet 25 €.',
      'Man kann jeden Monat kündigen.',
      'Das Studio ist nur für Frauen.',
    ],
  ),
];

/// Bacaan Lesen A2 (artikel koran pendek, papan petunjuk, email, iklan,
/// informasi/aturan) + 2–3 soal per bacaan (meniru Teil 1–5).
final List<ReadingPassage> goetheA2Reading = [
  // ---------------- Teil 1: artikel koran pendek ----------------
  _p(
    'de_a2_r_1',
    'Sekolah perawat baru',
    'A new nursing school',
    'Neue Pflegeschule in Kassel\n'
        'In Kassel hat am Montag eine neue Pflegeschule eröffnet. 120 junge '
        'Menschen beginnen dort ihre Ausbildung. Viele von ihnen kommen aus '
        'dem Ausland, zum Beispiel aus Indonesien, Vietnam und Marokko. Die '
        'Schule bietet auch Deutschkurse an, denn für die Ausbildung braucht '
        'man mindestens das Sprachniveau B1. Die Ausbildung dauert drei '
        'Jahre. Die Schülerinnen und Schüler bekommen schon im ersten Jahr '
        'Geld: etwa 1.200 Euro im Monat.',
    [
      _q('Berapa lama pendidikannya?', 'How long does the training last?', [
        'Drei Jahre.',
        'Ein Jahr.',
        'Zwei Jahre.',
        'Vier Jahre.',
      ]),
      _q(
        'Berapa uang yang diterima siswa pada tahun pertama?',
        'How much money do trainees get in the first year?',
        [
          'Etwa 1.200 Euro im Monat.',
          'Nichts.',
          'Etwa 120 Euro im Monat.',
          'Etwa 1.200 Euro im Jahr.',
        ],
      ),
      _richtig([
        'Die Schule bietet auch Deutschkurse an.',
        'Für die Ausbildung braucht man kein Deutsch.',
        'Alle Schüler kommen aus Kassel.',
        'Die Schule eröffnet erst nächstes Jahr.',
      ]),
    ],
  ),
  _p(
    'de_a2_r_2',
    'Festival kota',
    'The town festival',
    'Stadtfest in Freiburg\n'
        'Am Wochenende feiert Freiburg wieder sein Stadtfest. Am Samstag gibt '
        'es ab 14 Uhr Live-Musik auf dem Marktplatz, am Sonntag findet ein '
        'großer Flohmarkt am Fluss statt. Wegen des Festes ist die Altstadt '
        'für Autos gesperrt. Die Stadt bittet alle Besucher, mit Bus und '
        'Bahn zu kommen. Das Tagesticket kostet an beiden Tagen nur 5 Euro '
        'statt 8 Euro.',
    [
      _richtig([
        'Mit dem Auto kann man nicht in die Altstadt fahren.',
        'Der Flohmarkt ist am Samstag.',
        'Die Musik beginnt am Sonntag um 14 Uhr.',
        'Bus und Bahn fahren am Wochenende nicht.',
      ]),
      _q(
        'Berapa harga tiket harian pada akhir pekan ini?',
        'How much is the day ticket this weekend?',
        ['5 Euro.', '8 Euro.', '3 Euro.', 'Es ist kostenlos.'],
      ),
    ],
  ),
  _p(
    'de_a2_r_3',
    'Sepeda sewaan',
    'Rental bikes',
    'Leihräder in Münster\n'
        'Seit April gibt es in Münster 500 Leihfahrräder. Mit einer App kann '
        'man ein freies Rad finden und öffnen. Die erste halbe Stunde ist '
        'kostenlos, danach kostet jede halbe Stunde 1 Euro. Besonders '
        'Studentinnen und Studenten nutzen das Angebot gern, aber auch viele '
        'Touristen fahren mit den Rädern durch die Stadt.',
    [
      _q(
        'Berapa biaya naik sepeda selama satu jam?',
        'How much does a one-hour ride cost?',
        ['1 Euro.', '2 Euro.', 'Nichts.', '50 Cent.'],
      ),
      _q('Bagaimana cara membuka kunci sepeda?', 'How do you unlock a bike?', [
        'Mit einer App.',
        'Mit einem Schlüssel vom Bahnhof.',
        'Mit dem Studentenausweis.',
        'Mit Bargeld am Automaten.',
      ]),
    ],
  ),
  _p(
    'de_a2_r_4',
    'Tips saat panas',
    'Tips for hot weather',
    'Tipps bei Hitze\n'
        'Der Wetterdienst erwartet bis Donnerstag Temperaturen über 35 Grad. '
        'Ärzte raten: Trinken Sie mindestens zwei Liter Wasser am Tag und '
        'machen Sie Sport nur am frühen Morgen oder am Abend. Ältere Menschen '
        'sollten zwischen 11 und 17 Uhr nicht in die Sonne gehen. Ab Freitag '
        'soll es wieder kühler werden.',
    [
      _q('Kapan sebaiknya berolahraga?', 'When should you do sport?', [
        'Am frühen Morgen oder am Abend.',
        'Am Mittag.',
        'Zwischen 11 und 17 Uhr.',
        'Nur am Freitag.',
      ]),
      _richtig([
        'Bis Donnerstag bleibt es sehr heiß.',
        'Man soll weniger Wasser trinken.',
        'Ab Freitag wird es noch heißer.',
        'Ältere Menschen sollen mittags spazieren gehen.',
      ]),
    ],
  ),
  _p(
    'de_a2_r_5',
    'Asrama untuk peserta Ausbildung',
    'A dormitory for trainees',
    'Neues Wohnheim für Azubis\n'
        'Für Auszubildende ist es in großen Städten oft schwer, ein Zimmer zu '
        'finden. In Hamburg gibt es deshalb jetzt ein neues Wohnheim nur für '
        'Azubis. Es hat 150 Zimmer, jedes mit eigenem Bad. Küche und '
        'Waschraum teilen sich die Bewohner. Ein Zimmer kostet 420 Euro im '
        'Monat, Strom und Internet sind inklusive. Wer ein Zimmer möchte, '
        'kann sich online bewerben.',
    [
      _q('Untuk siapa asrama ini?', 'Who is the dormitory for?', [
        'Für Auszubildende.',
        'Für Studenten.',
        'Für Familien.',
        'Für Touristen.',
      ]),
      _richtig([
        'Jedes Zimmer hat ein eigenes Bad.',
        'Jedes Zimmer hat eine eigene Küche.',
        'Internet kostet extra.',
        'Man muss sich persönlich im Wohnheim bewerben.',
      ]),
    ],
  ),

  // ---------------- Teil 2: papan petunjuk ----------------
  _p(
    'de_a2_r_6',
    'Petunjuk toserba',
    'Department store directory',
    'Kaufhaus Merkur – Wegweiser\n'
        'UG: Lebensmittel · Getränke · Bäckerei\n'
        'EG: Kosmetik · Schmuck · Taschen · Information\n'
        '1. Stock: Damenmode · Damenschuhe\n'
        '2. Stock: Herrenmode · Herrenschuhe · Sportbekleidung\n'
        '3. Stock: Kinderabteilung · Spielwaren · Schreibwaren\n'
        '4. Stock: Elektrogeräte · Haushalt · Restaurant',
    [
      _where('Sie brauchen Hefte und Stifte für die Berufsschule.', [
        'In den 3. Stock.',
        'Ins Erdgeschoss.',
        'In den 4. Stock.',
        'Ins Untergeschoss.',
      ]),
      _where('Ihr Mann braucht einen Anzug für ein Vorstellungsgespräch.', [
        'In den 2. Stock.',
        'In den 1. Stock.',
        'In den 3. Stock.',
        'Ins Erdgeschoss.',
      ]),
      _where('Ihr Wasserkocher ist kaputt. Sie möchten einen neuen kaufen.', [
        'In den 4. Stock.',
        'Ins Untergeschoss.',
        'Ins Erdgeschoss.',
        'In den 3. Stock.',
      ]),
    ],
  ),
  _p(
    'de_a2_r_7',
    'Gedung praktik dokter',
    'Medical centre directory',
    'Ärztehaus am Bahnhof\n'
        'EG: Apotheke · Labor (Blutabnahme)\n'
        '1. OG: Dr. med. Kaya – Allgemeinmedizin · Physiotherapie Bewegt\n'
        '2. OG: Dr. med. Schmitt – Zahnarzt · Dr. med. Braun – Augenarzt\n'
        '3. OG: Dr. med. Wolf – Kinderarzt · Hebammenpraxis\n'
        '4. OG: Dr. med. Lange – Hals-Nasen-Ohren-Arzt',
    [
      _where(
        'Sie können nicht mehr gut lesen und brauchen vielleicht eine Brille.',
        [
          'In den 2. Stock.',
          'In den 1. Stock.',
          'In den 3. Stock.',
          'In den 4. Stock.',
        ],
      ),
      _where('Ihre kleine Tochter hat seit zwei Tagen Fieber.', [
        'In den 3. Stock.',
        'In den 1. Stock.',
        'In den 2. Stock.',
        'Ins Erdgeschoss.',
      ]),
      _where(
        'Ihr Arzt hat Ihnen Krankengymnastik für den Rücken verschrieben.',
        [
          'In den 1. Stock.',
          'In den 2. Stock.',
          'In den 4. Stock.',
          'Ins Erdgeschoss.',
        ],
      ),
    ],
  ),
  _p(
    'de_a2_r_8',
    'Petunjuk balai kota',
    'Town hall directory',
    'Rathaus – Wegweiser\n'
        'EG: Bürgerbüro (Anmeldung, Personalausweis, Reisepass) · Information\n'
        '1. Stock: Standesamt (Heirat, Geburt) · Stadtkasse\n'
        '2. Stock: Ausländerbehörde · Sozialamt\n'
        '3. Stock: Wohngeldstelle · Jobcenter-Beratung\n'
        '4. Stock: Bürgermeister · Sitzungssaal',
    [
      _where('Sie sind umgezogen und müssen Ihre neue Adresse anmelden.', [
        'Ins Erdgeschoss.',
        'In den 1. Stock.',
        'In den 2. Stock.',
        'In den 3. Stock.',
      ]),
      _where('Sie möchten Ihre Aufenthaltserlaubnis verlängern.', [
        'In den 2. Stock.',
        'Ins Erdgeschoss.',
        'In den 1. Stock.',
        'In den 4. Stock.',
      ]),
      _where(
        'Sie verdienen wenig und möchten Wohngeld für die Miete beantragen.',
        [
          'In den 3. Stock.',
          'In den 1. Stock.',
          'In den 4. Stock.',
          'Ins Erdgeschoss.',
        ],
      ),
    ],
  ),
  _p(
    'de_a2_r_9',
    'Bagian toko bangunan',
    'DIY store departments',
    'Baumarkt Hammer – Abteilungen\n'
        'Halle A: Farben · Tapeten · Teppiche\n'
        'Halle B: Werkzeug · Schrauben · Elektro (Lampen, Kabel)\n'
        'Halle C: Holz · Türen · Fenster\n'
        'Gartencenter (draußen): Pflanzen · Erde · Gartenmöbel\n'
        'Kasse und Kundenservice: am Ausgang',
    [
      _where('Sie möchten die Wände in Ihrem Zimmer neu streichen.', [
        'In Halle A.',
        'In Halle B.',
        'In Halle C.',
        'Ins Gartencenter.',
      ]),
      _where('Sie suchen eine neue Lampe für die Küche.', [
        'In Halle B.',
        'In Halle A.',
        'In Halle C.',
        'Zum Kundenservice.',
      ]),
      _where('Sie möchten Blumen für Ihren Balkon kaufen.', [
        'Ins Gartencenter.',
        'In Halle A.',
        'In Halle C.',
        'Zum Kundenservice.',
      ]),
    ],
  ),

  // ---------------- Teil 3: email ----------------
  _p(
    'de_a2_r_10',
    'Email dari Dewi',
    'An email from Dewi',
    'Liebe Anna,\n'
        'vielen Dank für deine Mail! Endlich habe ich Zeit zu antworten. Seit '
        'zwei Monaten mache ich jetzt meine Ausbildung als Köchin in einem '
        'Hotel in München. Die Arbeit ist anstrengend, ich arbeite oft am '
        'Abend und am Wochenende. Aber meine Kollegen sind sehr nett und ich '
        'lerne jeden Tag etwas Neues. Zweimal pro Woche gehe ich in die '
        'Berufsschule.\n'
        'Im Juni habe ich eine Woche Urlaub. Hast du Lust, mich zu besuchen? '
        'Ich habe nur ein kleines Zimmer, aber du kannst bei mir auf dem Sofa '
        'schlafen.\n'
        'Viele Grüße\nDewi',
    [
      _q('Apa yang Dewi lakukan di München?', 'What is Dewi doing in Munich?', [
        'Eine Ausbildung als Köchin.',
        'Ein Studium an der Universität.',
        'Einen Deutschkurs.',
        'Urlaub in einem Hotel.',
      ]),
      _richtig([
        'Dewi arbeitet auch am Wochenende.',
        'Dewi geht jeden Tag in die Berufsschule.',
        'Dewi findet ihre Kollegen unfreundlich.',
        'Dewi hat eine große Wohnung.',
      ]),
      _q('Apa yang Dewi inginkan?', 'What does Dewi want?', [
        'Anna soll sie im Juni besuchen.',
        'Anna soll ihr ein Sofa schenken.',
        'Anna soll mit ihr in Urlaub fliegen.',
        'Anna soll ein Hotelzimmer reservieren.',
      ]),
    ],
  ),
  _p(
    'de_a2_r_11',
    'Surat pengelola rumah',
    'A letter from the property manager',
    'Sehr geehrte Mieterinnen und Mieter,\n'
        'am Mittwoch, den 14. Mai, wird in allen Wohnungen die Heizung '
        'kontrolliert. Der Techniker kommt zwischen 8 und 12 Uhr. Bitte sorgen '
        'Sie dafür, dass jemand zu Hause ist. Wenn Sie an diesem Tag keine '
        'Zeit haben, können Sie Ihren Schlüssel bei Frau Neumann im '
        'Erdgeschoss abgeben. Bei Fragen erreichen Sie mich unter '
        '0341 55678.\n'
        'Mit freundlichen Grüßen\nKarl Fischer, Hausverwaltung',
    [
      _q('Mengapa Pak Fischer menulis?', 'Why does Mr Fischer write?', [
        'Ein Techniker kontrolliert die Heizung.',
        'Die Miete wird teurer.',
        'Frau Neumann zieht aus.',
        'Die Heizung bleibt im Mai aus.',
      ]),
      _q(
        'Apa yang bisa dilakukan penyewa kalau tidak di rumah?',
        'What can tenants do if they are not at home?',
        [
          'Den Schlüssel bei Frau Neumann abgeben.',
          'Einen neuen Termin im Juni nehmen.',
          'Die Wohnungstür offen lassen.',
          'Den Schlüssel in den Briefkasten werfen.',
        ],
      ),
    ],
  ),
  _p(
    'de_a2_r_12',
    'Email ke sekolah bahasa',
    'An email to a language school',
    'Sehr geehrte Damen und Herren,\n'
        'ich habe Ihre Anzeige im Internet gelesen und interessiere mich für '
        'den Deutschkurs B1 für Pflegekräfte. Ich arbeite seit einem Jahr als '
        'Pflegehelferin in einem Seniorenheim und möchte im nächsten Jahr die '
        'Ausbildung zur Pflegefachfrau beginnen. Leider arbeite ich im '
        'Schichtdienst. Gibt es auch Kurse am Wochenende oder online? Und wie '
        'viel kostet der Kurs?\n'
        'Mit freundlichen Grüßen\nSiti Rahma',
    [
      _q('Apa yang ingin Siti ketahui?', 'What does Siti want to know?', [
        'Ob es Kurse am Wochenende oder online gibt.',
        'Wie lange die Ausbildung dauert.',
        'Ob das Seniorenheim neue Mitarbeiter sucht.',
        'Wo die Sprachschule ist.',
      ]),
      _richtig([
        'Siti arbeitet schon in der Pflege.',
        'Siti macht schon die Ausbildung zur Pflegefachfrau.',
        'Siti arbeitet nur am Vormittag.',
        'Siti hat den Kurs schon bezahlt.',
      ]),
    ],
  ),
  _p(
    'de_a2_r_13',
    'Tukar sif',
    'Swapping shifts',
    'Hallo Markus,\n'
        'kannst du morgen meine Frühschicht übernehmen? Mein Sohn ist krank '
        'und ich muss mit ihm zum Kinderarzt. Ich kann dafür am Samstag deine '
        'Spätschicht machen. Ich habe schon mit Frau Berger gesprochen, sie '
        'ist einverstanden, wenn du Ja sagst. Bitte ruf mich heute Abend kurz '
        'an.\n'
        'Danke!\nLena',
    [
      _q(
        'Mengapa Lena tidak bisa bekerja besok?',
        'Why can Lena not work tomorrow?',
        [
          'Ihr Sohn ist krank.',
          'Sie ist selbst krank.',
          'Sie hat am Samstag frei.',
          'Sie hat einen Termin bei Frau Berger.',
        ],
      ),
      _q('Apa yang Lena tawarkan?', 'What does Lena offer?', [
        'Sie arbeitet am Samstag für Markus.',
        'Sie bezahlt Markus für die Schicht.',
        'Sie bringt Markus zum Arzt.',
        'Sie macht morgen die Spätschicht.',
      ]),
    ],
  ),
  _p(
    'de_a2_r_14',
    'Undangan perpisahan',
    'A farewell invitation',
    'Liebe Kolleginnen und Kollegen,\n'
        'am Freitag, den 20. Juni, feiere ich meinen Abschied: Nach 25 Jahren '
        'gehe ich in Rente! Ich lade euch herzlich ab 16 Uhr in die Kantine '
        'ein. Es gibt Kaffee und Kuchen und später auch Würstchen vom Grill. '
        'Bitte sagt mir bis Montag Bescheid, ob ihr kommt, damit ich genug '
        'Essen bestellen kann. Geschenke braucht ihr nicht mitzubringen.\n'
        'Herzliche Grüße\nGabi',
    [
      _q('Mengapa Gabi mengadakan pesta?', 'Why is Gabi having a party?', [
        'Sie hört auf zu arbeiten.',
        'Sie hat Geburtstag.',
        'Sie hat eine neue Stelle.',
        'Sie heiratet im Juni.',
      ]),
      _q(
        'Apa yang harus dilakukan rekan kerja?',
        'What should the colleagues do?',
        [
          'Bis Montag sagen, ob sie kommen.',
          'Ein Geschenk mitbringen.',
          'Einen Kuchen backen.',
          'Das Essen bestellen.',
        ],
      ),
    ],
  ),

  // ---------------- Teil 4: orang dan iklan ----------------
  _p(
    'de_a2_r_15',
    'Iklan: kursus & bantuan',
    'Ads: courses and help',
    'Anzeige A: Sprachcafé – jeden Donnerstag 18 bis 20 Uhr im '
        'Jugendzentrum. Deutsch sprechen mit Muttersprachlern, kostenlos und '
        'ohne Anmeldung.\n'
        'Anzeige B: Computerkurs für Anfänger – E-Mails schreiben, im '
        'Internet suchen. 6 Termine, 40 €.\n'
        'Anzeige C: Bewerbungstraining – Wir prüfen Ihren Lebenslauf und üben '
        'mit Ihnen das Vorstellungsgespräch. Termine nach Vereinbarung.\n'
        'Anzeige D: Kinderbetreuung – Studentin passt abends und am '
        'Wochenende auf Ihre Kinder auf. 12 € pro Stunde.',
    [
      _ad(
        'Herr Osei hat übermorgen ein Vorstellungsgespräch und ist sehr '
        'nervös.',
        ['Anzeige C', 'Anzeige A', 'Anzeige B', 'Anzeige D'],
      ),
      _ad(
        'Frau Tran möchte mehr Deutsch sprechen, hat aber kein Geld für '
        'einen Kurs.',
        ['Anzeige A', 'Anzeige B', 'Anzeige C', 'Anzeige D'],
      ),
      _ad(
        'Herr und Frau Rossi möchten am Samstagabend ins Kino gehen. Ihre '
        'Kinder sind 4 und 6 Jahre alt.',
        ['Anzeige D', 'Anzeige A', 'Anzeige B', 'Anzeige C'],
      ),
    ],
  ),
  _p(
    'de_a2_r_16',
    'Iklan: tempat tinggal & waktu luang',
    'Ads: housing and leisure',
    'Anzeige A: Wandergruppe „Grüne Schuhe“ – jeden Sonntag 10 bis 15 km '
        'in der Umgebung. Für alle ab 50 Jahren.\n'
        'Anzeige B: Möbliertes WG-Zimmer, 380 € warm, 5 Minuten zur Uni. Ab '
        'sofort frei.\n'
        'Anzeige C: Kochkurs „Schnell und gesund“ – 4 Abende ab 19 Uhr, ideal '
        'nach der Arbeit.\n'
        'Anzeige D: Ferienhaus in Bayern, 3 Schlafzimmer, großer Garten, '
        'Haustiere willkommen.',
    [
      _ad(
        'Ravi aus Indien beginnt im Oktober sein Studium und sucht eine '
        'günstige Unterkunft.',
        ['Anzeige B', 'Anzeige A', 'Anzeige C', 'Anzeige D'],
      ),
      _ad(
        'Herr und Frau Maier (62 und 65) möchten am Wochenende draußen aktiv '
        'sein.',
        ['Anzeige A', 'Anzeige B', 'Anzeige C', 'Anzeige D'],
      ),
      _ad('Familie Kim möchte mit ihrem Hund Urlaub auf dem Land machen.', [
        'Anzeige D',
        'Anzeige A',
        'Anzeige B',
        'Anzeige C',
      ]),
    ],
  ),
  _p(
    'de_a2_r_17',
    'Iklan lowongan kerja',
    'Job ads',
    'Anzeige A: Hotel Seeblick sucht Zimmermädchen/Roomboy (m/w/d), '
        'Teilzeit, auch ohne Erfahrung. Unterkunft im Hotel möglich.\n'
        'Anzeige B: Krankenhaus St. Marien – Ausbildung zur Pflegefachfrau / '
        'zum Pflegefachmann, Beginn April und Oktober. Voraussetzung: '
        'Deutsch B2.\n'
        'Anzeige C: Spedition Weber sucht LKW-Fahrer (m/w/d) mit Führerschein '
        'C/CE, Vollzeit.\n'
        'Anzeige D: Restaurant Da Mario – Aushilfe in der Küche, nur am '
        'Wochenende, 14 € pro Stunde.',
    [
      _ad(
        'Herr Lopez ist neu in Deutschland. Er braucht schnell eine Arbeit '
        'und eine Wohnung.',
        ['Anzeige A', 'Anzeige B', 'Anzeige C', 'Anzeige D'],
      ),
      _ad(
        'Fatima hat das B2-Zertifikat und möchte einen Beruf im '
        'Gesundheitsbereich lernen.',
        ['Anzeige B', 'Anzeige A', 'Anzeige C', 'Anzeige D'],
      ),
      _ad(
        'Jonas studiert von Montag bis Freitag und möchte nebenbei etwas Geld '
        'verdienen.',
        ['Anzeige D', 'Anzeige A', 'Anzeige B', 'Anzeige C'],
      ),
    ],
  ),

  // ---------------- Teil 5: petunjuk & aturan ----------------
  _p(
    'de_a2_r_18',
    'Tata tertib rumah',
    'House rules',
    'Hausordnung – Wohnanlage Sonnenhof\n'
        '1. Ruhezeiten: täglich von 22 bis 6 Uhr und sonntags den ganzen Tag.\n'
        '2. Fahrräder und Kinderwagen gehören in den Fahrradkeller, nicht in '
        'den Hausflur.\n'
        '3. Bitte trennen Sie den Müll: Papier (blaue Tonne), Verpackungen '
        '(gelbe Tonne), Bioabfall (braune Tonne), Restmüll (schwarze Tonne).\n'
        '4. Grillen auf dem Balkon ist nur mit einem Elektrogrill erlaubt.\n'
        '5. Die Waschküche kann man von Montag bis Samstag von 7 bis 20 Uhr '
        'benutzen.',
    [
      _q('Ke mana kulit kentang dibuang?', 'Where do potato peels go?', [
        'In die braune Tonne.',
        'In die blaue Tonne.',
        'In die gelbe Tonne.',
        'In die schwarze Tonne.',
      ]),
      _richtig([
        'Auf dem Balkon darf man mit einem Elektrogrill grillen.',
        'Man darf Fahrräder im Hausflur abstellen.',
        'Am Sonntag kann man in der Waschküche waschen.',
        'Man darf bis 23 Uhr laut Musik hören.',
      ]),
      _q(
        'Kapan ruang cuci boleh dipakai?',
        'When may the laundry room be used?',
        [
          'Am Samstag um 9 Uhr.',
          'Am Sonntag um 10 Uhr.',
          'Am Montag um 21 Uhr.',
          'Am Freitag um 6 Uhr.',
        ],
      ),
    ],
  ),
  _p(
    'de_a2_r_19',
    'Info kursus integrasi',
    'Integration course information',
    'Informationen zum Integrationskurs\n'
        'Der Kurs findet von Montag bis Freitag von 8:30 bis 12:45 Uhr statt. '
        'Bitte kommen Sie pünktlich. Wenn Sie krank sind, rufen Sie bitte vor '
        '8 Uhr im Sekretariat an. Ab dem dritten Tag brauchen Sie eine '
        'Krankmeldung vom Arzt. Die Bücher bekommen Sie am ersten Kurstag, '
        'sie kosten 25 Euro. Am Ende des Kurses gibt es die Prüfung '
        '„Deutsch-Test für Zuwanderer“. Zur Prüfung melden Sie sich im '
        'Sekretariat an.',
    [
      _q(
        'Apa yang harus dilakukan kalau Anda sakit?',
        'What must you do if you are ill?',
        [
          'Vor 8 Uhr im Sekretariat anrufen.',
          'Nach dem Kurs eine E-Mail schreiben.',
          'Am nächsten Tag früher kommen.',
          'Die Lehrerin am Nachmittag besuchen.',
        ],
      ),
      _richtig([
        'Die Bücher muss man bezahlen.',
        'Der Kurs findet am Nachmittag statt.',
        'Zur Prüfung meldet man sich bei der Lehrerin an.',
        'Die Bücher bekommt man am Ende des Kurses.',
      ]),
    ],
  ),
  _p(
    'de_a2_r_20',
    'Petunjuk untuk karyawan baru',
    'Notes for new staff',
    'Hinweise für neue Mitarbeiter – Pflegeheim Abendrot\n'
        '• Tragen Sie bei der Arbeit immer Ihre Dienstkleidung. Sie bekommen '
        'sie in der Wäscherei im Keller.\n'
        '• Waschen oder desinfizieren Sie Ihre Hände vor und nach jedem '
        'Kontakt mit Bewohnern.\n'
        '• Schmuck und lange Fingernägel sind nicht erlaubt.\n'
        '• Ihr Dienstplan hängt jeden Freitag im Stationszimmer. Wenn Sie eine '
        'Schicht tauschen möchten, sprechen Sie mit der Stationsleitung.\n'
        '• Machen Sie Ihre Pause bitte im Pausenraum, nicht in den Zimmern '
        'der Bewohner.',
    [
      _q(
        'Di mana karyawan baru mendapat seragam kerja?',
        'Where do new staff get their work clothes?',
        [
          'In der Wäscherei im Keller.',
          'Im Stationszimmer.',
          'Im Pausenraum.',
          'Bei der Stationsleitung.',
        ],
      ),
      _richtig([
        'Bei der Arbeit darf man keinen Ring tragen.',
        'Den Dienstplan bekommt man per E-Mail.',
        'Man kann im Zimmer der Bewohner Pause machen.',
        'Man darf Schichten ohne Absprache tauschen.',
      ]),
      _q(
        'Dengan siapa bicara kalau ingin tukar sif?',
        'Who do you talk to if you want to swap a shift?',
        [
          'Mit der Stationsleitung.',
          'Mit den Bewohnern.',
          'Mit der Wäscherei.',
          'Mit dem Hausmeister.',
        ],
      ),
    ],
  ),
  _p(
    'de_a2_r_21',
    'Aturan kolam renang',
    'Swimming pool rules',
    'Badeordnung – Hallenbad Mitte\n'
        '• Kinder unter 7 Jahren dürfen nur mit einem Erwachsenen ins Bad.\n'
        '• Bitte duschen Sie vor dem Schwimmen.\n'
        '• Springen ist nur vom Sprungturm erlaubt, nicht vom Beckenrand.\n'
        '• Essen und Getränke bitte nur im Bistro.\n'
        '• Wertsachen gehören in die Schließfächer. Sie brauchen dafür eine '
        '1-Euro-Münze, die Sie später zurückbekommen.',
    [
      _q('Apa yang diperlukan untuk loker?', 'What do you need for a locker?', [
        'Eine 1-Euro-Münze.',
        'Eine Karte von der Kasse.',
        'Einen eigenen Schlüssel.',
        'Nichts, die Fächer sind immer offen.',
      ]),
      _richtig([
        'Ein Kind mit 5 Jahren darf nicht allein ins Bad.',
        'Man darf am Beckenrand essen.',
        'Man darf vom Beckenrand springen.',
        'Das Geld für das Schließfach bekommt man nicht zurück.',
      ]),
    ],
  ),
];
