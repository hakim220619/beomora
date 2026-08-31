import '../models/guide.dart';
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

  const LetterQuizCategory({
    required this.id,
    required this.emoji,
    required this.title,
    required this.items,
    required this.ttsLocale,
  });
}

/// Semua huruf kana dari topik Materi Belajar (dasar + tambahan).
List<KanaItem> _kanaOf(String topicId) => [
      for (final topic in kStudyGuides['ja'] ?? <GuideTopic>[])
        if (topic.id == topicId)
          for (final section in topic.sections) ...section.kana,
    ];

List<KanaItem> _letters(String s) => _parsePairs(s);

List<KanaItem> _parsePairs(String s) => s
    .trim()
    .split(RegExp(r'\s+'))
    .map((e) {
      final i = e.indexOf(':');
      return KanaItem(e.substring(0, i), e.substring(i + 1));
    })
    .toList();

final List<KanaItem> _englishAlphabet = _letters(
    'A:ei B:bi C:si D:di E:i F:ef G:ji H:eich I:ai J:jei K:kei L:el '
    'M:em N:en O:ou P:pi Q:kiu R:ar S:es T:ti U:yu V:vi W:dabelyu '
    'X:eks Y:wai Z:zi');

final List<KanaItem> _indonesianAlphabet = _letters(
    'A:a B:be C:ce D:de E:e F:ef G:ge H:ha I:i J:je K:ka L:el M:em '
    'N:en O:o P:pe Q:ki R:er S:es T:te U:u V:ve W:we X:eks Y:ye Z:zet');

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
      ];
    case 'en':
      return [
        LetterQuizCategory(
          id: 'alphabet_en',
          emoji: '🔤',
          title: const {
            'id': 'Alfabet Inggris',
            'en': 'English Alphabet',
          },
          items: _englishAlphabet,
          ttsLocale: 'en-US',
        ),
      ];
    case 'id':
      return [
        LetterQuizCategory(
          id: 'alphabet_id',
          emoji: '🔤',
          title: const {
            'id': 'Alfabet Indonesia',
            'en': 'Indonesian Alphabet',
          },
          items: _indonesianAlphabet,
          ttsLocale: 'id-ID',
        ),
      ];
  }
  return const [];
}
