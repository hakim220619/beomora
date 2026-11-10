/// Bank soal Lesen Goethe-Zertifikat A1 (Start Deutsch 1) untuk mode Ujian
/// kursus Jerman.
///
/// Konvensi: pilihan PERTAMA pada setiap soal adalah jawaban benar
/// (`answer: 0`); layar ujian yang bertugas mengacak urutan pilihan.
/// Konten disusun sendiri (bukan salinan soal asli), meniru tipe soal
/// Lesen A1: Teil 1 (email/surat pendek), Teil 2 (memilih iklan/situs yang
/// cocok) dan Teil 3 (papan info, pengumuman, jam buka).
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

/// Teil 3: papan info / pengumuman — pernyataan mana yang benar?
McqQuestion _sign(String text, List<String> o) => _q(
  'Baca tulisan ini. Pernyataan mana yang benar?\n$text',
  'Read this notice. Which statement is correct?\n$text',
  o,
);

/// Teil 2: situasi + dua iklan (A/B) — mana yang cocok?
McqQuestion _ad(String situation, String a, String b, List<String> o) => _q(
  'Baca situasi dan kedua iklan. Mana yang cocok?\n$situation\n\nA: $a\nB: $b',
  'Read the situation and both ads. Which one fits?\n$situation\n\nA: $a\nB: $b',
  o,
);

/// Soal teks bacaan: pernyataan mana yang benar menurut teks?
McqQuestion _true(List<String> o) => _q(
  'Pernyataan mana yang benar menurut teks?',
  'Which statement is correct according to the text?',
  o,
);

/// Soal Lesen A1 satu-soal (papan info, iklan pendek): Teil 2 (memilih
/// iklan yang cocok) dan Teil 3 (papan info, jam buka, pengumuman).
final List<McqQuestion> goetheA1ReadingMcq = [
  // ---------------------------------------------------------------------
  // Teil 3 — Schilder und Aushänge
  // ---------------------------------------------------------------------
  _sign(
    'Arztpraxis Dr. Weber\nVom 2. bis 13. August geschlossen.\n'
    'Vertretung: Dr. Klein, Bahnhofstraße 5.',
    [
      'Im August kann man zu Dr. Klein gehen.',
      'Dr. Weber arbeitet im August jeden Tag.',
      'Die Praxis von Dr. Weber ist jetzt in der Bahnhofstraße.',
      'Dr. Klein hat im August Urlaub.',
    ],
  ),
  _sign(
    'Bäckerei Sonne\nMo–Fr 6.30–18.00 Uhr\nSa 7.00–13.00 Uhr\n'
    'So geschlossen',
    [
      'Am Samstag um 12 Uhr kann man hier Brot kaufen.',
      'Am Sonntag ist die Bäckerei bis 13 Uhr offen.',
      'Am Montag öffnet die Bäckerei um 7 Uhr.',
      'Am Freitag schließt die Bäckerei um 13 Uhr.',
    ],
  ),
  _sign('Nur heute: alle Getränke 20 % billiger!', [
    'Wasser und Saft kosten heute weniger.',
    'Obst und Gemüse sind heute billiger.',
    'Getränke sind erst ab morgen billiger.',
    'Heute gibt es keine Getränke.',
  ]),
  _sign(
    'Aufzug kaputt!\nBitte nehmen Sie die Treppe.\n'
    'Wir reparieren den Aufzug bis Mittwoch.',
    [
      'Man muss heute zu Fuß nach oben gehen.',
      'Der Aufzug funktioniert heute wieder.',
      'Die Treppe ist bis Mittwoch geschlossen.',
      'Man darf den Aufzug nur am Mittwoch benutzen.',
    ],
  ),
  _sign(
    'Sprachschule Lingua\nAnmeldung für Deutschkurse:\n'
    'Büro, Raum 205, 2. Stock',
    [
      'Für die Anmeldung geht man in den 2. Stock.',
      'Das Büro ist im Erdgeschoss.',
      'Man kann sich nur im Internet anmelden.',
      'In Raum 205 gibt es Englischkurse.',
    ],
  ),
  _sign('Gleis 4\nAchtung! Der Zug nach Hamburg fährt heute von Gleis 7.', [
    'Heute fährt der Zug nach Hamburg von Gleis 7.',
    'Heute fährt der Zug nach Hamburg von Gleis 4.',
    'Heute fährt kein Zug nach Hamburg.',
    'Von Gleis 7 fährt heute ein Zug nach Berlin.',
  ]),
  _sign(
    'Frühstück: 7–10 Uhr im Restaurant (Erdgeschoss).\n'
    'Samstag und Sonntag bis 11 Uhr.',
    [
      'Am Sonntag kann man um 10.30 Uhr frühstücken.',
      'Am Montag gibt es bis 11 Uhr Frühstück.',
      'Das Restaurant ist im 1. Stock.',
      'Das Frühstück beginnt um 6 Uhr.',
    ],
  ),
  _sign(
    'Klinikum Nord – Besuchszeiten\nTäglich 14 bis 19 Uhr.\n'
    'Bitte nicht mehr als zwei Besucher pro Patient.',
    [
      'Ein Patient darf zwei Besucher zusammen haben.',
      'Man kann um 10 Uhr morgens zu Besuch kommen.',
      'Am Sonntag sind keine Besuche möglich.',
      'Jeder Patient darf nur einen Besucher haben.',
    ],
  ),
  _sign(
    'Bürgeramt\nHeute nur mit Termin!\n'
    'Termine im Internet oder unter Tel. 0611 223344.',
    [
      'Heute braucht man einen Termin.',
      'Heute kann man ohne Termin kommen.',
      'Das Bürgeramt ist heute geschlossen.',
      'Einen Termin bekommt man nur am Telefon.',
    ],
  ),
  _sign('Parkplatz nur für Kunden.\nHöchstens 2 Stunden.', [
    'Kunden können hier zwei Stunden parken.',
    'Hier kann jeder den ganzen Tag parken.',
    'Hier darf niemand parken.',
    'Parken kostet 2 Euro pro Stunde.',
  ]),
  _sign(
    'Liebe Mieterinnen und Mieter,\nam Donnerstag um 9 Uhr kommt der '
    'Hausmeister und kontrolliert die Heizung in allen Wohnungen.',
    [
      'Am Donnerstag kontrolliert der Hausmeister die Heizung.',
      'Die Mieter müssen die Heizung selbst reparieren.',
      'Der Hausmeister kommt am Donnerstag um 19 Uhr.',
      'Der Hausmeister kommt nur in eine Wohnung.',
    ],
  ),
  _sign(
    'Wir suchen eine Verkäuferin / einen Verkäufer\n'
    '20 Stunden pro Woche.\nBitte im Geschäft fragen!',
    [
      'Man kann im Geschäft nach der Arbeit fragen.',
      'Die Arbeit hat 40 Stunden pro Woche.',
      'Man muss eine E-Mail schreiben.',
      'Das Geschäft sucht einen Koch.',
    ],
  ),
  _sign(
    'Stadtmuseum\nEintritt: Erwachsene 8 €, Kinder unter 12 Jahren frei.\n'
    'Montag Ruhetag.',
    [
      'Ein Kind mit 10 Jahren bezahlt nichts.',
      'Kinder bezahlen 8 Euro.',
      'Das Museum ist am Montag offen.',
      'Erwachsene bezahlen keinen Eintritt.',
    ],
  ),
  _sign('Bitte Tür schließen!\nDie Katze darf nicht nach draußen.', [
    'Man soll die Tür zumachen.',
    'Die Tür muss immer offen bleiben.',
    'Hier darf man keine Katze haben.',
    'Die Katze wartet draußen.',
  ]),
  _sign(
    'Post – Paketannahme heute geschlossen.\n'
    'Bitte gehen Sie zur Filiale am Marktplatz.',
    [
      'Heute kann man Pakete in der Filiale am Marktplatz abgeben.',
      'Hier kann man heute Pakete abgeben.',
      'Die Filiale am Marktplatz ist heute geschlossen.',
      'Am Marktplatz gibt es keine Post.',
    ],
  ),
  _sign(
    'Mittagstisch Mo–Fr, 11.30–14.30 Uhr\n'
    'Suppe + Hauptgericht: 9,50 €',
    [
      'Am Dienstag bekommt man mittags Suppe und Hauptgericht für 9,50 €.',
      'Den Mittagstisch gibt es auch am Samstag.',
      'Nur die Suppe kostet 9,50 €.',
      'Der Mittagstisch beginnt um 14.30 Uhr.',
    ],
  ),
  _sign(
    'Zahnarztpraxis Dr. Yilmaz\nAb 1. März neue Telefonnummer: '
    '030 556677.\nDie alte Nummer funktioniert nicht mehr.',
    [
      'Ab März hat die Praxis eine neue Telefonnummer.',
      'Ab März ist die Praxis geschlossen.',
      'Man kann die alte Nummer weiter benutzen.',
      'Ab März hat die Praxis eine neue Adresse.',
    ],
  ),
  _sign(
    'Kita Regenbogen\nAm Freitag ist Sommerfest, 15–18 Uhr.\n'
    'Eltern und Geschwister sind herzlich willkommen!',
    [
      'Auch die Eltern können zum Fest kommen.',
      'Das Fest ist am Freitagmorgen.',
      'Nur die Kinder der Kita dürfen kommen.',
      'Das Fest ist im Winter.',
    ],
  ),
  _sign(
    'Buslinie 12\nWegen Bauarbeiten hält der Bus vom 3. bis 7. Mai '
    'nicht an der Haltestelle „Rathaus“.',
    [
      'Vom 3. bis 7. Mai hält der Bus nicht am Rathaus.',
      'Die Linie 12 fährt im Mai gar nicht.',
      'Das Rathaus ist im Mai geschlossen.',
      'Ab 3. Mai hält der Bus nur noch am Rathaus.',
    ],
  ),

  // ---------------------------------------------------------------------
  // Teil 2 — Die richtige Anzeige / Webseite finden
  // ---------------------------------------------------------------------
  _ad(
    'Sie möchten am Wochenende einen Deutschkurs machen.',
    'Deutschkurs A1 – Montag bis Donnerstag, 18–20 Uhr.',
    'Intensivkurs Deutsch A1 – Samstag und Sonntag, 9–13 Uhr.',
    [
      'Anzeige B: Der Kurs ist am Samstag und Sonntag.',
      'Anzeige A: Der Kurs ist am Abend.',
      'Anzeige A: Der Kurs ist am Wochenende.',
      'Anzeige B: Der Kurs ist von Montag bis Donnerstag.',
    ],
  ),
  _ad(
    'Sie suchen eine Wohnung für sich, Ihren Mann und zwei Kinder.',
    '1-Zimmer-Apartment, 30 m², Stadtmitte, 450 € warm.',
    '3-Zimmer-Wohnung, 85 m², mit Garten, 950 € warm.',
    [
      'Anzeige B: Die Wohnung hat drei Zimmer.',
      'Anzeige A: Die Wohnung ist billig.',
      'Anzeige A: Die Wohnung hat einen Garten.',
      'Anzeige B: Die Wohnung ist im Zentrum und hat ein Zimmer.',
    ],
  ),
  _ad(
    'Sie möchten billig mit dem Zug nach München fahren.',
    'Zugtickets nach München schon ab 19,90 € – jetzt online buchen!',
    'Flüge nach München ab 89 € – schnell und bequem.',
    [
      'Anzeige A: Zugtickets für 19,90 €.',
      'Anzeige B: Flüge nach München.',
      'Anzeige B: Zugtickets für 89 €.',
      'Anzeige A: Flüge für 19,90 €.',
    ],
  ),
  _ad(
    'Es ist Sonntag. Ihr Kind hat hohes Fieber. Sie brauchen einen Arzt.',
    'Hausarztpraxis Dr. Berg – Mo–Fr 8–12 Uhr.',
    'Ärztlicher Bereitschaftsdienst – am Wochenende und an Feiertagen. '
        'Tel. 116117.',
    [
      'Anzeige B: Der Dienst ist auch am Wochenende da.',
      'Anzeige A: Die Praxis ist am Sonntag offen.',
      'Anzeige A: Die Praxis ist von Montag bis Freitag offen.',
      'Anzeige B: Der Dienst ist nur am Montag da.',
    ],
  ),
  _ad(
    'Sie möchten ein gebrauchtes Fahrrad kaufen.',
    'Fahrradladen Rad & Tat – Reparatur in 24 Stunden.',
    'Verkaufe Damenfahrrad, 3 Jahre alt, sehr gut, nur 80 €.',
    [
      'Anzeige B: Eine Frau verkauft ihr altes Fahrrad.',
      'Anzeige A: Der Laden repariert Fahrräder.',
      'Anzeige A: Der Laden verkauft neue Autos.',
      'Anzeige B: Hier kann man Fahrräder reparieren lassen.',
    ],
  ),
  _ad(
    'Sie möchten in der Pflege arbeiten. Sie haben noch keine Erfahrung.',
    'Seniorenheim Lindenhof sucht Pflegehelfer/in – auch ohne Erfahrung. '
        'Deutsch A2.',
    'Restaurant Adler sucht Koch/Köchin – mit 3 Jahren Erfahrung.',
    [
      'Anzeige A: Man braucht keine Erfahrung.',
      'Anzeige B: Das Restaurant sucht eine Pflegekraft.',
      'Anzeige B: Man braucht keine Erfahrung.',
      'Anzeige A: Man braucht drei Jahre Erfahrung.',
    ],
  ),
  _ad(
    'Sie arbeiten bis 18 Uhr. Danach möchten Sie schwimmen gehen.',
    'Hallenbad Mitte – Mo–Fr 6–21 Uhr.',
    'Freibad am See – täglich 9–17 Uhr.',
    [
      'Anzeige A: Das Hallenbad ist bis 21 Uhr offen.',
      'Anzeige B: Das Freibad ist bis 21 Uhr offen.',
      'Anzeige B: Das Freibad ist täglich offen.',
      'Anzeige A: Das Hallenbad öffnet um 21 Uhr.',
    ],
  ),
  _ad(
    'Ihr Sohn ist 6 Jahre alt und möchte Fußball spielen.',
    'FC Grün-Weiß: Fußballtraining für Kinder von 5 bis 10 Jahren, '
        'dienstags 16 Uhr.',
    'Fitnessstudio Power – nur für Erwachsene ab 18 Jahren.',
    [
      'Anzeige A: Training für Kinder von 5 bis 10 Jahren.',
      'Anzeige B: Das Studio ist für alle.',
      'Anzeige B: Training für Kinder ab 6 Jahren.',
      'Anzeige A: Training nur für Erwachsene.',
    ],
  ),
  _ad(
    'Sie brauchen Möbel für Ihre neue Wohnung, aber Sie haben wenig Geld.',
    'Möbelhaus Wohnwelt – neue Sofas ab 1.200 €.',
    'Flohmarkt am Samstag: Tische, Stühle und Schränke – sehr billig!',
    [
      'Anzeige B: Auf dem Flohmarkt sind die Möbel billig.',
      'Anzeige A: Das Möbelhaus hat billige Tische.',
      'Anzeige A: Die Sofas kosten wenig.',
      'Anzeige B: Auf dem Flohmarkt gibt es nur Kleidung.',
    ],
  ),
  _ad(
    'Sie sind neu in Deutschland und brauchen eine SIM-Karte für Ihr Handy.',
    'Handyshop – Prepaid-Karten ab 10 €, ohne Vertrag.',
    'PC-Service – Reparatur von Laptops und Computern.',
    [
      'Anzeige A: Hier gibt es SIM-Karten ohne Vertrag.',
      'Anzeige B: Hier gibt es billige SIM-Karten.',
      'Anzeige B: Hier repariert man Handys.',
      'Anzeige A: Hier repariert man Computer.',
    ],
  ),
  _ad(
    'Sie möchten am Samstagabend essen gehen. Sie essen kein Fleisch.',
    'Steakhaus Texas – die besten Steaks der Stadt!',
    'Restaurant Grünkern – vegetarische Küche, Di–So 17–23 Uhr.',
    [
      'Anzeige B: Das Restaurant kocht ohne Fleisch.',
      'Anzeige A: Das Steakhaus hat viel Fleisch.',
      'Anzeige A: Das Steakhaus ist vegetarisch.',
      'Anzeige B: Das Restaurant ist am Samstag geschlossen.',
    ],
  ),
  _ad(
    'Sie fliegen morgen früh von Frankfurt nach Jakarta. Sie suchen ein '
        'Hotel für eine Nacht in der Nähe vom Flughafen.',
    'Airport-Hotel Frankfurt – 5 Minuten zum Terminal, kostenloser Bus.',
    'Hotel Waldruhe im Schwarzwald – ruhig, viel Natur.',
    [
      'Anzeige A: Das Hotel ist nah am Flughafen.',
      'Anzeige B: Das Hotel ist ruhig.',
      'Anzeige B: Das Hotel ist am Flughafen.',
      'Anzeige A: Das Hotel ist im Wald.',
    ],
  ),
  _ad(
    'Sie haben keine Waschmaschine. Sie möchten am Sonntag Ihre Wäsche '
        'waschen.',
    'Waschsalon Blitzblank – täglich 7–22 Uhr, auch am Sonntag.',
    'Reinigung Fein – nur Anzüge und Kleider, Mo–Fr 9–18 Uhr.',
    [
      'Anzeige A: Der Waschsalon ist auch am Sonntag offen.',
      'Anzeige B: Die Reinigung ist am Sonntag offen.',
      'Anzeige B: Die Reinigung wäscht alles.',
      'Anzeige A: Der Waschsalon ist am Sonntag geschlossen.',
    ],
  ),
  _ad(
    'Sie brauchen Hilfe mit einem Formular vom Amt.',
    'Beratungsstelle für Migranten – kostenlose Hilfe bei Formularen, '
        'mittwochs 10–12 Uhr.',
    'Copyshop Express – Kopieren und Drucken.',
    [
      'Anzeige A: Hier hilft man kostenlos bei Formularen.',
      'Anzeige B: Hier hilft man bei Formularen.',
      'Anzeige B: Hier kann man nichts drucken.',
      'Anzeige A: Die Hilfe kostet viel Geld.',
    ],
  ),
];

/// Bacaan Lesen A1 (email/surat pendek, pengumuman) + soal: gaya Teil 1
/// (email & surat) dan Teil 3 (pengumuman panjang).
final List<ReadingPassage> goetheA1Reading = [
  _p(
    'de_a1_r1',
    'Undangan ulang tahun',
    'Birthday invitation',
    'Liebe Maria,\n'
        'am Samstag habe ich Geburtstag. Ich mache eine kleine Party bei mir '
        'zu Hause. Die Party beginnt um 19 Uhr. Kannst du einen Salat '
        'mitbringen? Getränke habe ich schon. Meine Adresse ist '
        'Gartenstraße 8, 3. Stock.\n'
        'Viele Grüße\nAnna',
    [
      _true([
        'Anna feiert am Samstag ihren Geburtstag.',
        'Maria hat am Samstag Geburtstag.',
        'Die Party ist in einem Restaurant.',
        'Die Party beginnt um 17 Uhr.',
      ]),
      _q('Apa yang harus dibawa Maria?', 'What should Maria bring?', [
        'einen Salat',
        'Getränke',
        'einen Kuchen',
        'Musik',
      ]),
      _q('Di lantai berapa Anna tinggal?', 'Which floor does Anna live on?', [
        'im 3. Stock',
        'im Erdgeschoss',
        'im 1. Stock',
        'im 8. Stock',
      ]),
    ],
  ),
  _p(
    'de_a1_r2',
    'Rapat dipindah',
    'Meeting moved',
    'Hallo Herr Santoso,\n'
        'die Besprechung am Montag fällt leider aus. Wir treffen uns jetzt '
        'am Dienstag um 10 Uhr in Raum 3. Bitte bringen Sie Ihren '
        'Arbeitsplan mit.\n'
        'Mit freundlichen Grüßen\nPetra Schulz',
    [
      _true([
        'Die Besprechung ist jetzt am Dienstag.',
        'Die Besprechung ist am Montag um 10 Uhr.',
        'Herr Santoso hat am Dienstag frei.',
        'Die Besprechung ist in Raum 10.',
      ]),
      _q(
        'Apa yang harus dibawa Pak Santoso?',
        'What should Mr Santoso bring?',
        ['seinen Arbeitsplan', 'seinen Laptop', 'Kaffee', 'seinen Ausweis'],
      ),
    ],
  ),
  _p(
    'de_a1_r3',
    'Surat dari pemilik rumah',
    'Letter from the landlord',
    'Liebe Mieterinnen und Mieter,\n'
        'am Mittwoch, den 14. Juni, gibt es von 8 bis 12 Uhr kein Wasser. '
        'Wir reparieren die Wasserleitung im Keller. Bitte stellen Sie '
        'vorher Wasser in Flaschen bereit. Ab 12 Uhr funktioniert alles '
        'wieder.\n'
        'Ihre Hausverwaltung Meyer',
    [
      _true([
        'Am Mittwochvormittag gibt es kein Wasser.',
        'Am Mittwoch gibt es den ganzen Tag kein Wasser.',
        'Die Mieter müssen die Leitung reparieren.',
        'Am 14. Juni gibt es keinen Strom.',
      ]),
      _q('Di mana perbaikannya dilakukan?', 'Where is the repair being done?', [
        'im Keller',
        'in der Küche',
        'im Bad',
        'auf dem Dach',
      ]),
      _q(
        'Apa yang sebaiknya disiapkan penghuni?',
        'What should the tenants prepare?',
        [
          'Wasser in Flaschen',
          'eine Taschenlampe',
          'warme Kleidung',
          'Geld für die Reparatur',
        ],
      ),
    ],
  ),
  _p(
    'de_a1_r4',
    'Pesan dari praktik dokter',
    'Message from the doctor\'s office',
    'Guten Tag Frau Putri,\n'
        'Ihr Termin am Donnerstag um 9 Uhr ist leider nicht möglich. '
        'Dr. Hartmann ist krank. Können Sie am Freitag um 11.30 Uhr kommen? '
        'Bitte rufen Sie uns kurz an.\n'
        'Ihre Praxis Dr. Hartmann',
    [
      _true([
        'Frau Putri soll in der Praxis anrufen.',
        'Frau Putri ist krank.',
        'Der Termin am Donnerstag bleibt.',
        'Frau Putri soll eine E-Mail schreiben.',
      ]),
      _q(
        'Kapan janji temu yang baru ditawarkan?',
        'When is the new appointment offered?',
        [
          'am Freitag um 11.30 Uhr',
          'am Donnerstag um 9 Uhr',
          'am Freitag um 9 Uhr',
          'am Donnerstag um 11.30 Uhr',
        ],
      ),
    ],
  ),
  _p(
    'de_a1_r5',
    'Kakak datang berkunjung',
    'Sister comes to visit',
    'Hallo Dewi,\n'
        'ich komme am Freitag mit dem Zug aus Köln. Der Zug kommt um 16.45 '
        'Uhr an. Kannst du mich am Bahnhof abholen? Ich bleibe bis Sonntag. '
        'Am Samstag möchte ich gern in die Stadt gehen und einkaufen.\n'
        'Bis bald!\nDeine Sari',
    [
      _true([
        'Sari kommt mit dem Zug.',
        'Sari kommt mit dem Bus.',
        'Sari fährt am Freitag nach Köln.',
        'Sari bleibt eine Woche.',
      ]),
      _q(
        'Jam berapa kereta Sari tiba?',
        'What time does Sari\'s train arrive?',
        ['um 16.45 Uhr', 'um 14.45 Uhr', 'um 16.15 Uhr', 'um 6.45 Uhr'],
      ),
      _q(
        'Apa rencana Sari pada hari Sabtu?',
        'What does Sari want to do on Saturday?',
        [
          'in die Stadt gehen und einkaufen',
          'nach Köln zurückfahren',
          'zu Hause kochen',
          'ins Kino gehen',
        ],
      ),
    ],
  ),
  _p(
    'de_a1_r6',
    'Email dari sekolah bahasa',
    'Email from the language school',
    'Sehr geehrte Frau Lestari,\n'
        'vielen Dank für Ihre Anmeldung. Ihr Deutschkurs A1 beginnt am '
        '5. September. Der Unterricht ist montags und mittwochs von 18 bis '
        '20.30 Uhr. Das Kursbuch kostet 25 Euro. Sie können es am ersten '
        'Tag im Büro kaufen.\n'
        'Mit freundlichen Grüßen\nSprachschule Lingua',
    [
      _true([
        'Der Kurs ist zweimal pro Woche.',
        'Der Kurs ist jeden Tag.',
        'Der Kurs ist am Vormittag.',
        'Das Kursbuch ist kostenlos.',
      ]),
      _q('Kapan kursus dimulai?', 'When does the course start?', [
        'am 5. September',
        'am 5. Oktober',
        'am 15. September',
        'am 25. September',
      ]),
      _q(
        'Di mana Bu Lestari bisa membeli buku kursus?',
        'Where can Ms Lestari buy the course book?',
        [
          'im Büro der Sprachschule',
          'im Internet',
          'in der Buchhandlung',
          'beim Lehrer zu Hause',
        ],
      ),
    ],
  ),
  _p(
    'de_a1_r7',
    'Pesta tetangga',
    'House party notice',
    'Hausfest im Hof!\n'
        'Liebe Nachbarn, am Samstag, 10. Juli, feiern wir ab 15 Uhr im Hof. '
        'Bitte bringen Sie etwas zu essen mit – Kuchen, Salat oder Brot. '
        'Getränke gibt es von der Hausverwaltung. Bei Regen feiern wir im '
        'Keller.',
    [
      _true([
        'Bei schlechtem Wetter ist das Fest im Keller.',
        'Das Fest ist im Restaurant.',
        'Die Nachbarn sollen Getränke mitbringen.',
        'Das Fest beginnt am Abend um 20 Uhr.',
      ]),
      _q('Siapa yang menyediakan minuman?', 'Who provides the drinks?', [
        'die Hausverwaltung',
        'die Nachbarn',
        'der Hausmeister',
        'ein Restaurant',
      ]),
    ],
  ),
  _p(
    'de_a1_r8',
    'Undangan wawancara Ausbildung',
    'Interview invitation (Ausbildung)',
    'Sehr geehrter Herr Rahman,\n'
        'vielen Dank für Ihre Bewerbung als Auszubildender in der Pflege. '
        'Wir möchten Sie gern kennenlernen. Kommen Sie bitte am 22. März um '
        '14 Uhr zu uns ins Seniorenheim Lindenhof, Parkweg 3. Bitte bringen '
        'Sie Ihren Pass und Ihr Deutschzertifikat mit.\n'
        'Mit freundlichen Grüßen\nClaudia Fischer',
    [
      _true([
        'Herr Rahman hat ein Vorstellungsgespräch.',
        'Herr Rahman arbeitet schon im Seniorenheim.',
        'Frau Fischer möchte eine Ausbildung machen.',
        'Herr Rahman soll am Telefon sprechen.',
      ]),
      _q('Ke mana Pak Rahman harus datang?', 'Where must Mr Rahman go?', [
        'ins Seniorenheim im Parkweg 3',
        'ins Krankenhaus im Parkweg 3',
        'in die Sprachschule',
        'zum Bürgeramt',
      ]),
      _q('Apa yang harus dibawa Pak Rahman?', 'What must Mr Rahman bring?', [
        'seinen Pass und sein Deutschzertifikat',
        'nur seinen Pass',
        'ein Foto und seinen Lebenslauf',
        'seine Arbeitskleidung',
      ]),
    ],
  ),
  _p(
    'de_a1_r9',
    'Kartu pos liburan',
    'Holiday postcard',
    'Liebe Oma,\n'
        'viele Grüße aus Hamburg! Das Wetter ist leider nicht so gut, es '
        'regnet oft. Aber die Stadt ist sehr schön. Gestern waren wir am '
        'Hafen und haben eine Schifffahrt gemacht. Morgen fahren wir wieder '
        'nach Hause.\n'
        'Dein Lukas',
    [
      _true([
        'In Hamburg regnet es oft.',
        'In Hamburg ist das Wetter sehr gut.',
        'Lukas wohnt in Hamburg.',
        'Lukas bleibt noch zwei Wochen in Hamburg.',
      ]),
      _q('Apa yang dilakukan Lukas kemarin?', 'What did Lukas do yesterday?', [
        'eine Schifffahrt im Hafen',
        'einen Ausflug in die Berge',
        'einen Museumsbesuch',
        'einen Einkauf im Supermarkt',
      ]),
    ],
  ),
  _p(
    'de_a1_r10',
    'Teman tidak bisa datang',
    'A friend can\'t come',
    'Hi Tom,\n'
        'es tut mir leid, ich kann heute Abend nicht ins Kino kommen. Ich '
        'bin krank und habe Kopfschmerzen. Ich bleibe heute im Bett. '
        'Können wir nächste Woche gehen? Vielleicht am Mittwoch?\n'
        'Liebe Grüße\nJulia',
    [
      _true([
        'Julia möchte nächste Woche ins Kino gehen.',
        'Julia geht heute Abend ins Kino.',
        'Tom ist krank.',
        'Julia muss heute arbeiten.',
      ]),
      _q('Mengapa Julia tidak datang?', 'Why isn\'t Julia coming?', [
        'Sie ist krank.',
        'Sie hat keine Zeit.',
        'Sie hat kein Geld.',
        'Sie mag keine Filme.',
      ]),
    ],
  ),
  _p(
    'de_a1_r11',
    'Pengumuman TK: ke kebun binatang',
    'Kindergarten notice: zoo trip',
    'Liebe Eltern,\n'
        'am Dienstag fahren wir mit den Kindern in den Zoo. Wir treffen uns '
        'um 8.30 Uhr vor der Kita und fahren mit dem Bus. Bitte geben Sie '
        'Ihrem Kind ein Frühstück und etwas zu trinken mit. Der Eintritt '
        'kostet 3 Euro. Wir sind um 14 Uhr wieder zurück.\n'
        'Ihr Kita-Team',
    [
      _true([
        'Die Kinder fahren mit dem Bus in den Zoo.',
        'Die Eltern fahren mit dem Auto in den Zoo.',
        'Der Ausflug ist am Donnerstag.',
        'Der Eintritt ist kostenlos.',
      ]),
      _q(
        'Apa yang perlu dibawa anak-anak?',
        'What should the children bring?',
        [
          'Frühstück und etwas zu trinken',
          'nur Geld für Eis',
          'ein Buch',
          'Spielzeug',
        ],
      ),
      _q(
        'Jam berapa anak-anak kembali?',
        'What time will the children be back?',
        ['um 14 Uhr', 'um 8.30 Uhr', 'um 12 Uhr', 'um 16 Uhr'],
      ),
    ],
  ),
  _p(
    'de_a1_r12',
    'Ganti jadwal shift',
    'Shift change',
    'Hallo Ayu,\n'
        'ich habe eine Frage: Kannst du am Samstag meinen Frühdienst '
        'machen? Der Dienst beginnt um 6 Uhr und endet um 14 Uhr. Meine '
        'Tochter hat Geburtstag. Ich mache dann gern deinen Spätdienst am '
        'Sonntag. Bitte sag mir bis morgen Bescheid.\n'
        'Danke und viele Grüße\nMarkus',
    [
      _true([
        'Markus möchte am Samstag nicht arbeiten.',
        'Ayu hat am Samstag Geburtstag.',
        'Markus möchte am Sonntag frei haben.',
        'Ayu soll am Sonntag den Frühdienst machen.',
      ]),
      _q(
        'Jam berapa Frühdienst berakhir?',
        'What time does the early shift end?',
        ['um 14 Uhr', 'um 6 Uhr', 'um 12 Uhr', 'um 16 Uhr'],
      ),
      _q('Apa yang ditawarkan Markus?', 'What does Markus offer?', [
        'Er macht Ayus Spätdienst am Sonntag.',
        'Er macht Ayus Frühdienst am Montag.',
        'Er bezahlt Ayu 50 Euro.',
        'Er lädt Ayu zum Geburtstag ein.',
      ]),
    ],
  ),
  _p(
    'de_a1_r13',
    'Daftar belanja dari Ibu',
    'Shopping list from Mum',
    'Hallo Kevin,\n'
        'ich komme heute erst um 19 Uhr nach Hause. Kannst du bitte im '
        'Supermarkt einkaufen? Wir brauchen Milch, Eier, Reis und Tomaten. '
        'Das Geld liegt auf dem Tisch in der Küche.\n'
        'Danke! Mama',
    [
      _true([
        'Das Geld liegt in der Küche.',
        'Mama kauft heute selbst ein.',
        'Mama kommt um 17 Uhr nach Hause.',
        'Kevin braucht kein Geld.',
      ]),
      _q(
        'Apa yang TIDAK ada di daftar belanja?',
        'What is NOT on the shopping list?',
        ['Brot', 'Milch', 'Eier', 'Reis'],
      ),
    ],
  ),
  _p(
    'de_a1_r14',
    'Konfirmasi pemesanan hotel',
    'Hotel booking confirmation',
    'Sehr geehrte Frau Wulandari,\n'
        'vielen Dank für Ihre Buchung. Sie haben ein Einzelzimmer vom '
        '3. bis 5. Mai (zwei Nächte). Der Preis ist 79 Euro pro Nacht mit '
        'Frühstück. Sie können ab 15 Uhr einchecken. Das Hotel ist nur zwei '
        'Minuten vom Hauptbahnhof.\n'
        'Mit freundlichen Grüßen\nHotel Am Bahnhof',
    [
      _true([
        'Das Frühstück ist im Preis inklusive.',
        'Frau Wulandari hat ein Doppelzimmer.',
        'Das Hotel ist weit vom Bahnhof.',
        'Frau Wulandari bleibt drei Nächte.',
      ]),
      _q('Berapa harga per malam?', 'How much is it per night?', [
        '79 Euro',
        '158 Euro',
        '15 Euro',
        '97 Euro',
      ]),
      _q(
        'Mulai jam berapa bisa check-in?',
        'From what time can she check in?',
        ['ab 15 Uhr', 'ab 12 Uhr', 'ab 5 Uhr', 'ab 18 Uhr'],
      ),
    ],
  ),
  _p(
    'de_a1_r15',
    'Toko pindah alamat',
    'Shop has moved',
    'Wir sind umgezogen!\n'
        'Unser Supermarkt ist jetzt in der Lindenstraße 20, neben der '
        'Apotheke. Neue Öffnungszeiten: Montag bis Samstag 7 bis 21 Uhr. '
        'In der ersten Woche gibt es für alle Kunden einen Kaffee gratis!',
    [
      _true([
        'Der Supermarkt hat eine neue Adresse.',
        'Der Supermarkt ist jetzt in der Apotheke.',
        'Der Supermarkt ist auch am Sonntag offen.',
        'Der Kaffee kostet in der ersten Woche 1 Euro.',
      ]),
      _q(
        'Apa yang didapat pelanggan pada minggu pertama?',
        'What do customers get in the first week?',
        [
          'einen Kaffee gratis',
          'ein Brot gratis',
          'zehn Prozent Rabatt',
          'eine Tasche gratis',
        ],
      ),
    ],
  ),
  _p(
    'de_a1_r16',
    'Paket di tetangga',
    'Parcel with the neighbour',
    'Liebe Frau Nguyen,\n'
        'heute Morgen war der Paketbote da. Sie waren nicht zu Hause. Ich '
        'habe Ihr Paket genommen. Sie können es heute ab 17 Uhr bei mir '
        'abholen. Ich wohne im 1. Stock links.\n'
        'Viele Grüße\nHelga Braun',
    [
      _true([
        'Frau Braun hat das Paket für Frau Nguyen.',
        'Frau Nguyen hat das Paket schon bekommen.',
        'Das Paket ist bei der Post.',
        'Frau Braun bringt das Paket um 17 Uhr zur Post.',
      ]),
      _q(
        'Kapan Bu Nguyen bisa mengambil paketnya?',
        'When can Ms Nguyen pick up the parcel?',
        [
          'heute ab 17 Uhr',
          'heute Morgen',
          'morgen ab 17 Uhr',
          'nur am Wochenende',
        ],
      ),
    ],
  ),
];
