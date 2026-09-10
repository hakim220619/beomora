import '../models/guide.dart';
import 'question_bank.dart';
import 'study_guides.dart';

/// Paket "Tulis Huruf": subset paket Tebak Huruf yang lambangnya memang
/// ditulis tangan (kana, kanji, hangul, alfabet). Paket angka dan kata
/// kerja tak beraturan tidak masuk karena bukan latihan menulis lambang.
const Set<String> kWritableLetterCategories = {
  'hiragana',
  'katakana',
  'kana_mix',
  'kanji_n5',
  'hangul',
  'alphabet_en',
  'alphabet_id',
  'alphabet_de',
};

/// Huruf per sesi Tulis Huruf untuk pengguna gratis (Premium: 10).
const int kFreeHandwritingQuestions = 3;

List<LetterQuizCategory> writingCategoriesFor(String courseId) => letterQuizFor(
  courseId,
).where((c) => kWritableLetterCategories.contains(c.id)).toList();

/// Satu kelompok huruf yang bisa dipilih sebelum mulai menulis (mis.
/// "Gojūon", "Dakuten & Handakuten", "Yōon"; untuk hangul "Vokal Dasar",
/// dst.). Diturunkan dari seksi Materi Belajar supaya pembagiannya sama
/// dengan yang dipelajari.
class LetterGroup {
  final Map<String, String> title;
  final List<KanaItem> items;
  const LetterGroup({required this.title, required this.items});
}

/// Topik Materi Belajar yang menjadi sumber kelompok tiap paket tulis.
/// Paket tanpa entri (alfabet) tidak punya pilihan cakupan.
const Map<String, List<String>> _groupTopics = {
  'hiragana': ['hiragana'],
  'katakana': ['katakana'],
  'kana_mix': ['hiragana', 'katakana'],
  'kanji_n5': ['kanji_n5'],
  'hangul': ['hangul'],
};

/// Kelompok huruf untuk [cat]; kosong kalau paket tidak dibagi (alfabet)
/// atau hanya punya satu kelompok. Hanya huruf yang memang ada di paket
/// yang dimasukkan, jadi jumlahnya tidak pernah melebihi [cat.items].
List<LetterGroup> writingGroupsFor(String courseId, LetterQuizCategory cat) {
  final topicIds = _groupTopics[cat.id];
  if (topicIds == null) return const [];
  final inPack = cat.items.map((i) => i.kana).toSet();
  final topics = kStudyGuides[courseId] ?? const <GuideTopic>[];
  final groups = <LetterGroup>[];
  for (final topicId in topicIds) {
    for (final topic in topics.where((t) => t.id == topicId)) {
      for (final section in topic.sections) {
        final items = section.kana
            .where((k) => inPack.contains(k.kana))
            .toList();
        if (items.isEmpty) continue;
        // Paket campuran: awali judul dengan nama topiknya.
        final prefix = topicIds.length > 1 ? topic.title : null;
        groups.add(
          LetterGroup(
            title: {
              for (final code in section.title.keys)
                code: prefix == null
                    ? section.title[code]!
                    : '${prefix[code] ?? prefix['id']}: ${section.title[code]}',
            },
            items: items,
          ),
        );
      }
    }
  }
  return groups.length > 1 ? groups : const [];
}
