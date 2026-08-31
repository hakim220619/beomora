/// Definisi achievement. Nama & deskripsi diambil dari l10n dengan
/// kunci `ach_{id}` dan `ach_{id}_desc`.
class Achievement {
  final String id;
  final String emoji;

  const Achievement(this.id, this.emoji);
}

const List<Achievement> kAchievements = [
  Achievement('first_lesson', '🐣'),
  Achievement('lessons_10', '📗'),
  Achievement('lessons_30', '📚'),
  Achievement('streak_3', '🔥'),
  Achievement('streak_7', '🚀'),
  Achievement('streak_30', '🏆'),
  Achievement('xp_500', '⭐'),
  Achievement('xp_2000', '🌟'),
  Achievement('words_50', '🗣️'),
  Achievement('words_150', '🧠'),
  Achievement('perfect_lesson', '💯'),
  Achievement('polyglot', '🌍'),
];
