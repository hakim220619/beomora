import '../models/guide.dart';
import 'kanji_bank.dart';
import 'study_guides.dart';

/// Bank soal "Tebak Huruf": paket pasangan lambang ↔ bacaan per kursus.
/// - Jepang: hiragana & katakana (diambil dari tabel Materi Belajar);
/// - Inggris: nama huruf alfabet (A = ei, B = bi, …);
/// - Indonesia: cara baca huruf (a, be, ce, …).
class LetterQuizCategory {
  final String id;
  final String emoji;
  final Map<String, String> title; // per bahasa UI
  final List<KanaItem> items; // lambang ↔ bacaan
  final String ttsLocale;

  /// Paket eksklusif Beomora Premium.
  final bool premium;

  /// Kunci l10n teks soal (bisa dioverride per paket, mis. kata kerja
  /// tak beraturan bertanya "bentuk lampau", bukan "bunyi huruf").
  final String symbolPromptKey; // lambang ditampilkan → tebak bacaan
  final String readingPromptKey; // bacaan ditampilkan → tebak lambang

  /// Teks yang diucapkan TTS untuk satu item. null = bawaan
  /// (`spokenFormOf`: kanji dibaca lewat romaji-nya). Paket kata
  /// mengisinya karena sisi kanannya arti, bukan romaji.
  final String Function(KanaItem item)? spokenForm;

  /// Sumber pengecoh. null = [items]. Dipakai Latihan Kosakata agar
  /// tetap ada 4 pilihan walau kata yang dipilih cuma sedikit.
  final List<KanaItem>? distractors;

  const LetterQuizCategory({
    required this.id,
    required this.emoji,
    required this.title,
    required this.items,
    required this.ttsLocale,
    this.premium = false,
    this.symbolPromptKey = 'quiz_prompt_reading',
    this.readingPromptKey = 'quiz_prompt_symbol',
    this.spokenForm,
    this.distractors,
  });
}

/// Semua huruf kana dari topik Materi Belajar (dasar + tambahan).
List<KanaItem> _kanaOf(String topicId) => _guideKana('ja', topicId);

/// Kelompok kana untuk Tebak Kana Campur — urutannya mengikuti
/// urutan bagian di topik hiragana/katakana Materi Belajar.
enum KanaGroup { base, dakuten, yoon }

/// Huruf satu kelompok dari topik 'hiragana' atau 'katakana'.
List<KanaItem> kanaGroup(String topicId, KanaGroup group) {
  for (final topic in kStudyGuides['ja'] ?? <GuideTopic>[]) {
    if (topic.id == topicId && group.index < topic.sections.length) {
      return topic.sections[group.index].kana;
    }
  }
  return const [];
}

/// Grid huruf dari topik Materi Belajar kursus mana pun.
List<KanaItem> _guideKana(String courseId, String topicId) => [
  for (final topic in kStudyGuides[courseId] ?? <GuideTopic>[])
    if (topic.id == topicId)
      for (final section in topic.sections) ...section.kana,
];

List<KanaItem> _letters(String s) => _parsePairs(s);

List<KanaItem> _parsePairs(String s) => s.trim().split(RegExp(r'\s+')).map((e) {
  final i = e.indexOf(':');
  return KanaItem(e.substring(0, i), e.substring(i + 1));
}).toList();

final List<KanaItem> _englishAlphabet = _letters(
  'A:ei B:bi C:si D:di E:i F:ef G:ji H:eich I:ai J:jei K:kei L:el '
  'M:em N:en O:ou P:pi Q:kiu R:ar S:es T:ti U:yu V:vi W:dabelyu '
  'X:eks Y:wai Z:zi',
);

final List<KanaItem> _indonesianAlphabet = _letters(
  'A:a B:be C:ce D:de E:e F:ef G:ge H:ha I:i J:je K:ka L:el M:em '
  'N:en O:o P:pe Q:ki R:er S:es T:te U:u V:ve W:we X:eks Y:ye Z:zet',
);

/// Kanji per level (lambang ↔ bacaan paling umum) dari [kanjiN5Sections]
/// dst. — paket premium di Tebak Huruf, juga dipakai Tulis Huruf.
List<KanaItem> _kanjiItems(List<KanjiSection> sections) => [
  for (final s in sections)
    for (final k in s.entries) KanaItem(k.kanji, k.romaji),
];

final List<KanaItem> kanjiN5 = _kanjiItems(kanjiN5Sections);
final List<KanaItem> kanjiN4 = _kanjiItems(kanjiN4Sections);

/// Data lengkap satu kanji (bacaan on/kun, arti, contoh kata).
final Map<String, KanjiEntry> _kanjiIndex = {
  for (final s in [...kanjiN5Sections, ...kanjiN4Sections])
    for (final k in s.entries) k.kanji: k,
};

KanjiEntry? kanjiEntryOf(String kanji) => _kanjiIndex[kanji];

/// Item kuis yang membawa jenis soalnya sendiri — dipakai kuis yang
/// mencampur beberapa jenis soal (mis. Tebak Kanji: arti, bacaan, baca
/// kata). Pengecoh hanya diambil dari item berjenis sama, dan teks
/// pertanyaannya mengikuti item, bukan paket.
class QuizItem extends KanaItem {
  final String kind;
  final String symbolPromptKey;
  final String readingPromptKey;

  /// Yang dibacakan TTS; null = bawaan paket.
  final String? speak;

  const QuizItem(
    super.kana,
    super.romaji, {
    required this.kind,
    required this.symbolPromptKey,
    required this.readingPromptKey,
    this.speak,
  });
}

/// Kata kerja tak beraturan Inggris (dasar → lampau) — paket premium.
final List<KanaItem> _irregularVerbs = _parsePairs(
  'go:went eat:ate see:saw come:came take:took give:gave get:got '
  'make:made know:knew think:thought find:found tell:told '
  'become:became leave:left feel:felt bring:brought begin:began '
  'keep:kept hold:held write:wrote stand:stood hear:heard let:let '
  'mean:meant meet:met run:ran pay:paid sit:sat speak:spoke '
  'grow:grew lose:lost fall:fell send:sent build:built '
  'understand:understood draw:drew break:broke spend:spent cut:cut '
  'rise:rose drive:drove buy:bought wear:wore choose:chose',
);

/// Paket soal untuk satu kursus.
List<LetterQuizCategory> letterQuizFor(String courseId) {
  switch (courseId) {
    case 'ja':
      return [
        LetterQuizCategory(
          id: 'hiragana',
          emoji: 'あ',
          title: const {'id': 'Hiragana', 'en': 'Hiragana'},
          items: _kanaOf('hiragana'),
          ttsLocale: 'ja-JP',
        ),
        LetterQuizCategory(
          id: 'katakana',
          emoji: 'ア',
          title: const {'id': 'Katakana', 'en': 'Katakana'},
          items: _kanaOf('katakana'),
          ttsLocale: 'ja-JP',
        ),
        // Campuran: soal hiragana & katakana diaduk jadi satu.
        LetterQuizCategory(
          id: 'kana_mix',
          emoji: '🔀',
          title: const {
            'id': 'Campuran Hiragana & Katakana',
            'en': 'Hiragana & Katakana Mix',
          },
          items: [..._kanaOf('hiragana'), ..._kanaOf('katakana')],
          ttsLocale: 'ja-JP',
        ),
        LetterQuizCategory(
          id: 'kanji_n5',
          emoji: '🈴',
          title: const {'id': 'Kanji Dasar (N5)', 'en': 'Basic Kanji (N5)'},
          items: kanjiN5,
          ttsLocale: 'ja-JP',
          premium: true,
        ),
        LetterQuizCategory(
          id: 'kanji_n4',
          emoji: '🈷️',
          title: const {'id': 'Kanji N4', 'en': 'Kanji N4'},
          items: kanjiN4,
          ttsLocale: 'ja-JP',
          premium: true,
        ),
      ];
    case 'en':
      return [
        LetterQuizCategory(
          id: 'alphabet_en',
          emoji: '🔤',
          title: const {'id': 'Alfabet Inggris', 'en': 'English Alphabet'},
          items: _englishAlphabet,
          ttsLocale: 'en-US',
        ),
        LetterQuizCategory(
          id: 'irregular_verbs',
          emoji: '⏳',
          title: const {
            'id': 'Kata Kerja Tak Beraturan',
            'en': 'Irregular Verbs',
          },
          items: _irregularVerbs,
          ttsLocale: 'en-US',
          premium: true,
          symbolPromptKey: 'quiz_prompt_past',
          readingPromptKey: 'quiz_prompt_base',
        ),
      ];
    case 'id':
      return [
        LetterQuizCategory(
          id: 'alphabet_id',
          emoji: '🔤',
          title: const {'id': 'Alfabet Indonesia', 'en': 'Indonesian Alphabet'},
          items: _indonesianAlphabet,
          ttsLocale: 'id-ID',
        ),
      ];
    case 'ko':
      return [
        LetterQuizCategory(
          id: 'hangul',
          emoji: '한',
          title: const {'id': 'Hangul', 'en': 'Hangul'},
          items: _guideKana('ko', 'hangul'),
          ttsLocale: 'ko-KR',
        ),
        LetterQuizCategory(
          id: 'ko_numbers',
          emoji: '🔢',
          title: const {'id': 'Angka Korea', 'en': 'Korean Numbers'},
          items: _guideKana('ko', 'ko_numbers'),
          ttsLocale: 'ko-KR',
        ),
      ];
    case 'de':
      return [
        LetterQuizCategory(
          id: 'alphabet_de',
          emoji: '🔤',
          title: const {'id': 'Alfabet Jerman', 'en': 'German Alphabet'},
          items: _germanAlphabet,
          ttsLocale: 'de-DE',
        ),
        LetterQuizCategory(
          id: 'de_numbers',
          emoji: '🔢',
          title: const {'id': 'Angka Jerman', 'en': 'German Numbers'},
          items: _guideKana('de', 'de_numbers'),
          ttsLocale: 'de-DE',
        ),
      ];
  }
  return const [];
}

/// Nama huruf alfabet Jerman (a = "a", w = "ve", z = "tset", dst.).
final List<KanaItem> _germanAlphabet = _letters('''
a:a b:be c:tse d:de e:e f:ef g:ge h:ha i:i j:yot k:ka l:el m:em
n:en o:o p:pe q:ku r:er s:es t:te u:u v:fau w:ve x:iks
y:ipsilon z:tset ä:ae ö:oe ü:ue ß:es-tset
''');
