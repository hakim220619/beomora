/// Bank soal tulis bahasa Inggris akademik untuk bagian Writing ujian
/// (gaya PTE "Reading & Writing: Fill in the blanks" / tata bahasa
/// TOEFL). Satu kalimat akademik dengan SATU rumpang `____`; pengguna
/// mengetik kata yang hilang. Tiga kelompok: preposisi/artikel/kata
/// hubung, bentuk kata kerja (petunjuk memberi kata dasar + tense), dan
/// kolokasi akademik (petunjuk memberi huruf awal + jumlah kata).
///
/// [WritingItem.answers] pertama = jawaban kanonik yang ditampilkan di
/// ulasan; varian lain (ejaan British, sinonim yang sama tepatnya)
/// juga diterima. Pencocokan abai huruf besar/kecil, spasi & tanda baca.
library;

import '../models/exam.dart';

const Map<String, String> _pGap = {
  'id': 'Lengkapi kalimat dengan satu kata yang tepat.',
  'en': 'Complete the sentence with one suitable word.',
};

const Map<String, String> _pVerb = {
  'id': 'Tulis bentuk kata kerja yang tepat sesuai petunjuk.',
  'en': 'Write the correct verb form as indicated by the hint.',
};

const Map<String, String> _pColloc = {
  'id': 'Lengkapi kolokasi akademik dengan satu kata.',
  'en': 'Complete the academic collocation with one word.',
};

WritingItem _gap(String text, List<String> answers, {String? hint}) =>
    WritingItem(prompt: _pGap, text: text, answers: answers, hint: hint);

WritingItem _verb(String text, List<String> answers, {required String hint}) =>
    WritingItem(prompt: _pVerb, text: text, answers: answers, hint: hint);

WritingItem _colloc(
  String text,
  List<String> answers, {
  required String hint,
}) => WritingItem(prompt: _pColloc, text: text, answers: answers, hint: hint);

final List<WritingItem> writingEnAcademic = [
  // ---- Preposisi / artikel / kata hubung -------------------------------
  _gap(
    'The results of the experiment are consistent ____ earlier findings.',
    ['with'],
    hint: 'preposisi',
  ),
  _gap(
    'Researchers attribute the decline in bird numbers ____ habitat loss.',
    ['to'],
    hint: 'preposisi',
  ),
  _gap(
    '____ the sample size was small, the results were statistically '
    'significant.',
    ['Although', 'Though', 'While'],
    hint: 'kata hubung (pertentangan)',
  ),
  _gap(
    'The theory was rejected ____ the grounds that it lacked empirical '
    'support.',
    ['on'],
    hint: 'preposisi',
  ),
  _gap(
    'Global average temperatures have risen ____ roughly one degree '
    'Celsius since 1900.',
    ['by'],
    hint: 'preposisi (besar perubahan)',
  ),
  _gap(
    'The present study focuses ____ the effects of caffeine on attention.',
    ['on', 'upon'],
    hint: 'preposisi',
  ),
  _gap(
    'Fossil fuels account ____ the majority of global carbon emissions.',
    ['for'],
    hint: 'preposisi',
  ),
  _gap(
    'Participants were divided ____ three groups of equal size.',
    ['into'],
    hint: 'preposisi',
  ),
  _gap(
    'Photosynthesis is ____ process by which plants convert light into '
    'chemical energy.',
    ['the'],
    hint: 'artikel',
  ),
  _gap(
    'There is little doubt that the treatment is effective; ____, larger '
    'trials are still needed.',
    ['however', 'nevertheless', 'nonetheless'],
    hint: 'kata penghubung (pertentangan)',
  ),

  // ---- Bentuk kata kerja -----------------------------------------------
  _verb(
    'Since 1990, the population of the city ____ by nearly forty percent.',
    ['has grown'],
    hint: 'grow → present perfect',
  ),
  _verb(
    'The samples ____ in a laboratory before the results were announced.',
    ['were analyzed', 'were analysed'],
    hint: 'analyze → past simple, pasif',
  ),
  _verb(
    'If the data ____ correct, the hypothesis would have to be revised.',
    ['were', 'was'],
    hint: 'be → second conditional',
  ),
  _verb(
    'The committee recommended that the proposal ____ approved without '
    'delay.',
    ['be'],
    hint: 'be → subjunctive setelah "recommended that"',
  ),
  _verb(
    'Scientists ____ currently investigating the causes of the outbreak.',
    ['are'],
    hint: 'be → present continuous',
  ),
  _verb(
    'By the time the study ended, the researchers ____ over two thousand '
    'participants.',
    ['had interviewed'],
    hint: 'interview → past perfect',
  ),
  _verb(
    'The final report ____ to the ministry next month.',
    ['will be submitted'],
    hint: 'submit → future simple, pasif (will)',
  ),
  _verb(
    'The government is considering ____ the tax on sugary drinks.',
    ['raising'],
    hint: 'raise → gerund (-ing)',
  ),
  _verb(
    'The main results ____ in Table 2 below.',
    ['are summarized', 'are summarised'],
    hint: 'summarize → present simple, pasif',
  ),
  _verb(
    'Had the funding been available, the project ____ completed on time.',
    ['would have been'],
    hint: 'be → third conditional (would)',
  ),

  // ---- Kolokasi akademik -----------------------------------------------
  _colloc(
    'The study ____ light on the relationship between diet and mood.',
    ['sheds'],
    hint: 's… (1 kata)',
  ),
  _colloc(
    'The author ____ a clear distinction between correlation and '
    'causation.',
    ['draws', 'drew'],
    hint: 'd… (1 kata)',
  ),
  _colloc(
    'The evidence strongly ____ the hypothesis that sleep improves '
    'memory.',
    ['supports'],
    hint: 's… (1 kata)',
  ),
  _colloc(
    'Further research is needed to ____ the gap in our understanding.',
    ['fill', 'bridge'],
    hint: 'f… atau b… (1 kata)',
  ),
  _colloc(
    'These findings ____ a serious challenge to the conventional view.',
    ['pose'],
    hint: 'p… (1 kata)',
  ),
  _colloc(
    'Given the small sample, the results should be interpreted with '
    '____.',
    ['caution', 'care'],
    hint: 'c… (1 kata)',
  ),
  _colloc(
    'This research ____ several important questions for future study.',
    ['raises'],
    hint: 'r… (1 kata)',
  ),
  _colloc('Smoking is a major ____ factor for lung cancer.', [
    'risk',
  ], hint: 'r… (1 kata)'),
  _colloc('The data were collected over a ____ of five years.', [
    'period',
  ], hint: 'p… (1 kata)'),
  _colloc(
    'The author ____ the conclusion that the policy had failed.',
    ['reached', 'drew', 'reaches', 'draws'],
    hint: 'r… atau d… (1 kata)',
  ),
];
