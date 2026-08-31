/// Model konten kursus. Dimuat dari assets/content/*.json.
class Course {
  final String id; // 'en', 'ja', 'id'
  final Map<String, String> name; // per bahasa UI: {'id': ..., 'en': ...}
  final String flag;
  final String ttsLocale; // locale untuk text-to-speech
  final List<CourseUnit> units;

  const Course({
    required this.id,
    required this.name,
    required this.flag,
    required this.ttsLocale,
    required this.units,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json['id'] as String,
        name: Map<String, String>.from(json['name'] as Map),
        flag: json['flag'] as String,
        ttsLocale: json['ttsLocale'] as String,
        units: (json['units'] as List)
            .map((u) => CourseUnit.fromJson(u as Map<String, dynamic>))
            .toList(),
      );

  /// Semua kata dalam kursus, untuk distraktor & mini-game.
  List<WordItem> get allWords =>
      units.expand((u) => u.lessons).expand((l) => l.words).toList();

  List<Lesson> get allLessons => units.expand((u) => u.lessons).toList();
}

class CourseUnit {
  final String id;
  final Map<String, String> title;
  final String color; // hex, misal '#58CC02'
  final String icon; // emoji
  final List<Lesson> lessons;

  const CourseUnit({
    required this.id,
    required this.title,
    required this.color,
    required this.icon,
    required this.lessons,
  });

  factory CourseUnit.fromJson(Map<String, dynamic> json) => CourseUnit(
        id: json['id'] as String,
        title: Map<String, String>.from(json['title'] as Map),
        color: json['color'] as String,
        icon: json['icon'] as String,
        lessons: (json['lessons'] as List)
            .map((l) => Lesson.fromJson(l as Map<String, dynamic>))
            .toList(),
      );
}

class Lesson {
  final String id;
  final Map<String, String> title;
  final List<WordItem> words;
  final List<SentenceItem> sentences;

  const Lesson({
    required this.id,
    required this.title,
    required this.words,
    required this.sentences,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json['id'] as String,
        title: Map<String, String>.from(json['title'] as Map),
        words: (json['words'] as List? ?? [])
            .map((w) => WordItem.fromJson(w as Map<String, dynamic>))
            .toList(),
        sentences: (json['sentences'] as List? ?? [])
            .map((s) => SentenceItem.fromJson(s as Map<String, dynamic>))
            .toList(),
      );
}

class WordItem {
  final String target; // kata dalam bahasa yang dipelajari
  final String? romaji; // bacaan latin (untuk bahasa Jepang)
  final Map<String, String> meaning; // arti per bahasa UI
  final String emoji;

  const WordItem({
    required this.target,
    this.romaji,
    required this.meaning,
    required this.emoji,
  });

  factory WordItem.fromJson(Map<String, dynamic> json) => WordItem(
        target: json['target'] as String,
        romaji: json['romaji'] as String?,
        meaning: Map<String, String>.from(json['meaning'] as Map),
        emoji: json['emoji'] as String? ?? '📖',
      );

  String meaningFor(String uiLang) =>
      meaning[uiLang] ?? meaning.values.first;
}

class SentenceItem {
  final String target; // kalimat lengkap dalam bahasa target
  final List<String> tokens; // token untuk soal susun kalimat
  final String? romaji;
  final Map<String, String> meaning;

  const SentenceItem({
    required this.target,
    required this.tokens,
    this.romaji,
    required this.meaning,
  });

  factory SentenceItem.fromJson(Map<String, dynamic> json) => SentenceItem(
        target: json['target'] as String,
        tokens: List<String>.from(json['tokens'] as List),
        romaji: json['romaji'] as String?,
        meaning: Map<String, String>.from(json['meaning'] as Map),
      );

  String meaningFor(String uiLang) =>
      meaning[uiLang] ?? meaning.values.first;
}
