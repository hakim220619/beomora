import 'dart:math';

import '../data/mcq_bank.dart';

/// Satu bacaan dengar: paragraf yang dibacakan TTS lalu beberapa
/// pertanyaan pemahaman. Transkrip disembunyikan sampai semua soal
/// dijawab, meniru ujian listening (TOEFL/IELTS/PTE/JLPT Choukai).
class ListeningPassage {
  final String id;
  final Map<String, String> title; // per bahasa UI
  final String transcript; // teks yang dibacakan, bahasa target
  final Map<String, String> translation; // terjemahan per bahasa UI
  final List<McqQuestion> questions; // pilihan pertama = jawaban benar

  const ListeningPassage({
    required this.id,
    required this.title,
    required this.transcript,
    required this.translation,
    required this.questions,
  });

  /// Jumlah soal yang ditanyakan sekali main (bank punya lebih banyak).
  int get questionsPerRound =>
      min(kListeningQuestionsPerRound, questions.length);

  /// Ambil [questionsPerRound] soal acak dari bank bacaan ini, urutan acak.
  /// Dipanggil tiap kali bacaan dibuka supaya soal tidak selalu sama.
  List<McqQuestion> pickQuestions(Random rng) =>
      ([...questions]..shuffle(rng)).take(questionsPerRound).toList();
}

/// Paket bacaan dengar per kursus (Dasar, TOEFL, IELTS, PTE, JLPT N5/N4).
class ListeningPack {
  final String id;
  final String emoji;
  final Map<String, String> title;
  final Map<String, String> subtitle;

  /// Paket premium: non-premium hanya bisa membuka
  /// [kFreeListeningPassages] bacaan pertama.
  final bool premium;

  /// Batas pemutaran audio per bacaan (0 = tanpa batas).
  final int maxPlays;
  final List<ListeningPassage> passages;

  const ListeningPack({
    required this.id,
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.premium,
    required this.maxPlays,
    required this.passages,
  });

  int get questionCount => passages.fold(0, (n, p) => n + p.questions.length);
}

/// Jumlah bacaan pertama yang bisa dibuka pengguna gratis di paket premium.
const int kFreeListeningPassages = 2;

/// Soal yang keluar per bacaan sekali main; dipilih acak dari bank bacaan
/// (setiap bacaan punya lebih banyak soal daripada ini).
const int kListeningQuestionsPerRound = 3;
