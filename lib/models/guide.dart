/// Model materi referensi (Materi Belajar): tabel kana, penjelasan
/// tata bahasa, dan contoh kalimat — per kursus bahasa.
class GuideTopic {
  final String id;
  final String emoji;
  final Map<String, String> title; // per bahasa UI
  final Map<String, String> subtitle;
  final List<GuideSection> sections;

  const GuideTopic({
    required this.id,
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.sections,
  });
}

class GuideSection {
  final Map<String, String> title;
  final Map<String, String>? body; // paragraf penjelasan
  /// Grid huruf apa adanya, termasuk sel kosong ([KanaItem.isBlank])
  /// agar tiap baris tabel tetap rapi (mis. や・ゆ・よ).
  final List<KanaItem> kanaGrid;
  final List<GuideExample> examples;

  /// Jumlah kolom grid huruf (gojūon 5, yōon 3).
  final int kanaColumns;

  const GuideSection({
    required this.title,
    this.body,
    List<KanaItem> kana = const [],
    this.examples = const [],
    this.kanaColumns = 5,
  }) : kanaGrid = kana;

  /// Huruf saja, tanpa sel kosong (untuk latihan, pencarian, dsb.).
  List<KanaItem> get kana => [
    for (final k in kanaGrid)
      if (!k.isBlank) k,
  ];
}

class KanaItem {
  final String kana;
  final String romaji;
  const KanaItem(this.kana, this.romaji);

  /// Sel kosong pengisi grid (tidak bisa diketuk).
  bool get isBlank => kana.isEmpty;
}

class GuideExample {
  final String target;
  final String? romaji;
  final Map<String, String> meaning;
  const GuideExample(this.target, this.meaning, {this.romaji});
}
