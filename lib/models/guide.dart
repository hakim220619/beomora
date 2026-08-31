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
  final List<KanaItem> kana; // grid huruf (khusus Jepang)
  final List<GuideExample> examples;

  const GuideSection({
    required this.title,
    this.body,
    this.kana = const [],
    this.examples = const [],
  });
}

class KanaItem {
  final String kana;
  final String romaji;
  const KanaItem(this.kana, this.romaji);
}

class GuideExample {
  final String target;
  final String? romaji;
  final Map<String, String> meaning;
  const GuideExample(this.target, this.meaning, {this.romaji});
}
