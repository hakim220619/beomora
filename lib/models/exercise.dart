import 'course.dart';

enum ExerciseType {
  multipleChoice, // target -> pilih arti
  reverseChoice, // arti -> pilih kata target
  listening, // dengar audio -> pilih kata
  typing, // ketik terjemahan
  scramble, // susun huruf jadi kata
  sentenceBuild, // susun kata jadi kalimat
  matching, // cocokkan 5 pasang
}

class MatchPair {
  final String left;
  final String right;
  const MatchPair(this.left, this.right);
}

class Exercise {
  final ExerciseType type;
  final String prompt; // teks soal utama
  final String? promptSub; // sub-teks, misal romaji
  final String answer; // jawaban benar
  final List<String> options; // pilihan / token
  final List<MatchPair> pairs; // untuk matching
  final String? ttsText; // teks yang diucapkan TTS
  final WordItem? word; // kata sumber (untuk emoji dsb.)

  const Exercise({
    required this.type,
    required this.prompt,
    this.promptSub,
    required this.answer,
    this.options = const [],
    this.pairs = const [],
    this.ttsText,
    this.word,
  });
}
