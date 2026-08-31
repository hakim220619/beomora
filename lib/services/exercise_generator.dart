import 'dart:math';

import '../models/course.dart';
import '../models/exercise.dart';

/// Membuat daftar soal dari konten pelajaran secara prosedural.
class ExerciseGenerator {
  final Random _rng;
  ExerciseGenerator({int? seed}) : _rng = Random(seed);

  List<Exercise> forLesson(Course course, Lesson lesson, String uiLang) {
    final pool = course.allWords;
    final exercises = <Exercise>[];

    for (final word in lesson.words) {
      final types = <ExerciseType>[
        ExerciseType.multipleChoice,
        ExerciseType.reverseChoice,
        ExerciseType.listening,
        ExerciseType.typing,
        if (_canScramble(word.target)) ExerciseType.scramble,
      ]..shuffle(_rng);
      for (final type in types.take(2)) {
        exercises.add(_forWord(type, word, pool, uiLang));
      }
    }

    if (lesson.words.length >= 4) {
      exercises.add(_matching(lesson.words, uiLang));
    }

    for (final sentence in lesson.sentences.take(3)) {
      exercises.add(_sentenceBuild(sentence, lesson.sentences, uiLang));
    }

    exercises.shuffle(_rng);
    return exercises.take(12).toList();
  }

  /// Soal pilihan ganda acak untuk mode Tantangan Waktu.
  Exercise randomChoice(Course course, String uiLang) {
    final pool = course.allWords;
    final word = pool[_rng.nextInt(pool.length)];
    final type = _rng.nextBool()
        ? ExerciseType.multipleChoice
        : ExerciseType.reverseChoice;
    return _forWord(type, word, pool, uiLang);
  }

  /// Soal campuran dari kata-kata yang sudah dipelajari (latihan bebas).
  List<Exercise> freePractice(
      Course course, Set<String> learnedTargets, String uiLang,
      {int count = 8}) {
    final pool = course.allWords;
    var learned =
        pool.where((w) => learnedTargets.contains(w.target)).toList();
    if (learned.length < 4) learned = pool;
    learned.shuffle(_rng);
    final exercises = <Exercise>[];
    for (final word in learned.take(count)) {
      final types = <ExerciseType>[
        ExerciseType.multipleChoice,
        ExerciseType.reverseChoice,
        ExerciseType.listening,
        ExerciseType.typing,
        if (_canScramble(word.target)) ExerciseType.scramble,
      ];
      exercises.add(_forWord(types[_rng.nextInt(types.length)], word, pool, uiLang));
    }
    return exercises;
  }

  // ---------- Pembuat per tipe ----------

  bool _canScramble(String target) =>
      !target.contains(' ') && target.length >= 3 && target.length <= 10;

  Exercise _forWord(
      ExerciseType type, WordItem word, List<WordItem> pool, String uiLang) {
    switch (type) {
      case ExerciseType.multipleChoice:
        return Exercise(
          type: type,
          prompt: word.target,
          promptSub: word.romaji,
          answer: word.meaningFor(uiLang),
          options: _choiceOptions(
              word.meaningFor(uiLang),
              pool
                  .where((w) => w.target != word.target)
                  .map((w) => w.meaningFor(uiLang))),
          ttsText: word.target,
          word: word,
        );
      case ExerciseType.reverseChoice:
        return Exercise(
          type: type,
          prompt: word.meaningFor(uiLang),
          answer: word.target,
          options: _choiceOptions(
              word.target,
              pool
                  .where((w) => w.meaningFor(uiLang) != word.meaningFor(uiLang))
                  .map((w) => w.target)),
          word: word,
        );
      case ExerciseType.listening:
        return Exercise(
          type: type,
          prompt: '',
          answer: word.target,
          options: _choiceOptions(
              word.target,
              pool
                  .where((w) => w.target != word.target)
                  .map((w) => w.target)),
          ttsText: word.target,
          word: word,
        );
      case ExerciseType.typing:
        return Exercise(
          type: type,
          prompt: word.target,
          promptSub: word.romaji,
          answer: word.meaningFor(uiLang),
          ttsText: word.target,
          word: word,
        );
      case ExerciseType.scramble:
        final letters = word.target.split('')..shuffle(_rng);
        // Pastikan urutan acak beda dari jawaban.
        if (letters.join() == word.target && letters.length > 1) {
          final first = letters.removeAt(0);
          letters.add(first);
        }
        return Exercise(
          type: type,
          prompt: word.meaningFor(uiLang),
          answer: word.target,
          options: letters,
          word: word,
        );
      default:
        throw ArgumentError('Tipe $type bukan soal per kata');
    }
  }

  List<String> _choiceOptions(String answer, Iterable<String> distractors) {
    final unique = distractors.toSet()..remove(answer);
    final picked = unique.toList()..shuffle(_rng);
    final options = <String>[answer, ...picked.take(3)]..shuffle(_rng);
    return options;
  }

  Exercise _matching(List<WordItem> words, String uiLang) {
    final picked = List<WordItem>.from(words)..shuffle(_rng);
    final pairs = picked
        .take(5)
        .map((w) => MatchPair(w.target, w.meaningFor(uiLang)))
        .toList();
    return Exercise(
      type: ExerciseType.matching,
      prompt: '',
      answer: '',
      pairs: pairs,
    );
  }

  Exercise _sentenceBuild(
      SentenceItem sentence, List<SentenceItem> all, String uiLang) {
    final distractorTokens = all
        .where((s) => s.target != sentence.target)
        .expand((s) => s.tokens)
        .where((t) => !sentence.tokens.contains(t))
        .toSet()
        .toList()
      ..shuffle(_rng);
    final tokens = [...sentence.tokens, ...distractorTokens.take(3)]
      ..shuffle(_rng);
    return Exercise(
      type: ExerciseType.sentenceBuild,
      prompt: sentence.meaningFor(uiLang),
      promptSub: sentence.romaji,
      answer: sentence.tokens.join(' '),
      options: tokens,
      ttsText: sentence.target,
    );
  }
}

/// Penilaian jawaban ketik: toleran huruf besar, tanda baca,
/// varian dipisah '/', isi tanda kurung, dan typo 1 huruf.
class AnswerGrader {
  static String _normalize(String s) => s
      .toLowerCase()
      .replaceAll(RegExp(r'\(.*?\)'), '')
      .replaceAll(RegExp(r"[^\p{L}\p{N}\s]", unicode: true), '')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();

  /// 2 = benar persis, 1 = hampir (typo), 0 = salah.
  static int grade(String input, String expected) {
    final user = _normalize(input);
    if (user.isEmpty) return 0;
    final variants = expected
        .split('/')
        .map(_normalize)
        .where((v) => v.isNotEmpty)
        .toList();
    for (final v in variants) {
      if (user == v) return 2;
    }
    for (final v in variants) {
      if (v.length > 4 && _levenshtein(user, v) == 1) return 1;
    }
    return 0;
  }

  static int _levenshtein(String a, String b) {
    if ((a.length - b.length).abs() > 1) return 99;
    final m = a.length, n = b.length;
    var prev = List<int>.generate(n + 1, (i) => i);
    for (var i = 1; i <= m; i++) {
      final cur = List<int>.filled(n + 1, 0)..[0] = i;
      for (var j = 1; j <= n; j++) {
        final cost = a[i - 1] == b[j - 1] ? 0 : 1;
        cur[j] = [
          cur[j - 1] + 1,
          prev[j] + 1,
          prev[j - 1] + cost,
        ].reduce((x, y) => x < y ? x : y);
      }
      prev = cur;
    }
    return prev[n];
  }
}
