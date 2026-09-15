import '../models/exam.dart';
import '../models/listening.dart';
import 'exam_bank.dart';
import 'exam_writing_bank_en.dart';
import 'exam_writing_bank_ja.dart';
import 'jlpt_grammar_bank.dart';
import 'jlpt_vocab.dart';
import 'jlpt_vocab_adv.dart';
import 'listening_bank.dart';
import 'listening_bank_ja_n1.dart';
import 'listening_bank_ja_n2.dart';
import 'listening_bank_ja_n3.dart';
import 'mcq_packs.dart';
import 'reading_bank_en.dart';
import 'reading_bank_ja.dart';

/// Cetak biru mode Ujian: struktur bagian (jumlah soal & menit) meniru
/// ujian aslinya. Bagian Speaking (TOEFL/IELTS/PTE) tidak ada; esai
/// diganti isian singkat yang diketik supaya bisa dinilai offline.
/// Untuk JLPT, bagian Menulis adalah tambahan (bukan bagian resmi) dan
/// tidak ikut skor 180.

/// Jumlah soal ujian mini untuk pengguna gratis.
const int kFreeExamQuestions = 10;

List<ListeningPassage> _listeningPack(String courseId, String packId) {
  for (final p in listeningPacksFor(courseId)) {
    if (p.id == packId) return p.passages;
  }
  return const [];
}

List<ExamBlueprint> examsFor(String courseId) {
  switch (courseId) {
    case 'en':
      return _en;
    case 'ja':
      return _ja;
    default:
      return const [];
  }
}

ExamBlueprint? examById(String id) {
  for (final list in [_en, _ja]) {
    for (final e in list) {
      if (e.id == id) return e;
    }
  }
  return null;
}

// ---------------------------------------------------------------------------
// Inggris — TOEFL iBT, IELTS Academic, PTE Academic
// ---------------------------------------------------------------------------
final List<ExamBlueprint> _en = [
  ExamBlueprint(
    id: 'en_toefl',
    courseId: 'en',
    emoji: '🎓',
    title: const {'id': 'TOEFL iBT', 'en': 'TOEFL iBT'},
    subtitle: const {
      'id': 'Reading 20 · Listening 28 · Writing 10 (tanpa Speaking)',
      'en': 'Reading 20 · Listening 28 · Writing 10 (no Speaking)',
    },
    sections: const [
      ExamSection(ExamSectionKind.reading, questionCount: 20, minutes: 35),
      ExamSection(
        ExamSectionKind.listening,
        questionCount: 28,
        minutes: 36,
        maxPlays: 1,
      ),
      ExamSection(ExamSectionKind.writing, questionCount: 10, minutes: 30),
    ],
    scoring: ExamScoring.toefl,
    pools: ExamPools(
      reading: readingEnAcademic,
      readingExtra: examToefl,
      listening: _listeningPack('en', 'en_listen_toefl'),
      writing: writingEnAcademic,
    ),
  ),
  ExamBlueprint(
    id: 'en_ielts',
    courseId: 'en',
    emoji: '📘',
    title: const {'id': 'IELTS Academic', 'en': 'IELTS Academic'},
    subtitle: const {
      'id': 'Listening 40 · Reading 40 · Writing 10 (tanpa Speaking)',
      'en': 'Listening 40 · Reading 40 · Writing 10 (no Speaking)',
    },
    sections: const [
      ExamSection(
        ExamSectionKind.listening,
        questionCount: 40,
        minutes: 30,
        maxPlays: 1,
      ),
      ExamSection(ExamSectionKind.reading, questionCount: 40, minutes: 60),
      ExamSection(ExamSectionKind.writing, questionCount: 10, minutes: 30),
    ],
    scoring: ExamScoring.ielts,
    pools: ExamPools(
      reading: readingEnAcademic,
      readingExtra: examIelts,
      listening: _listeningPack('en', 'en_listen_ielts'),
      writing: writingEnAcademic,
    ),
  ),
  ExamBlueprint(
    id: 'en_pte',
    courseId: 'en',
    emoji: '💻',
    title: const {'id': 'PTE Academic', 'en': 'PTE Academic'},
    subtitle: const {
      'id': 'Reading 18 · Listening 18 · Writing 8 (tanpa Speaking)',
      'en': 'Reading 18 · Listening 18 · Writing 8 (no Speaking)',
    },
    sections: const [
      ExamSection(ExamSectionKind.reading, questionCount: 18, minutes: 30),
      ExamSection(
        ExamSectionKind.listening,
        questionCount: 18,
        minutes: 30,
        maxPlays: 1,
      ),
      ExamSection(ExamSectionKind.writing, questionCount: 8, minutes: 20),
    ],
    scoring: ExamScoring.pte,
    pools: ExamPools(
      reading: readingEnAcademic,
      readingExtra: examPte,
      listening: _listeningPack('en', 'en_listen_pte'),
      writing: writingEnAcademic,
    ),
  ),
];

// ---------------------------------------------------------------------------
// Jepang — JLPT N5 … N1
// ---------------------------------------------------------------------------
final List<ExamBlueprint> _ja = [
  ExamBlueprint(
    id: 'ja_n5',
    courseId: 'ja',
    emoji: '🌸',
    title: const {'id': 'JLPT N5', 'en': 'JLPT N5'},
    subtitle: const {
      'id': 'Kosakata 35 · Tata bahasa 20 · Bacaan 12 · Dengar 24',
      'en': 'Vocabulary 35 · Grammar 20 · Reading 12 · Listening 24',
    },
    sections: const [
      ExamSection(ExamSectionKind.vocab, questionCount: 35, minutes: 20),
      ExamSection(ExamSectionKind.grammar, questionCount: 20, minutes: 20),
      ExamSection(ExamSectionKind.reading, questionCount: 12, minutes: 20),
      ExamSection(ExamSectionKind.listening, questionCount: 24, minutes: 30),
      ExamSection(ExamSectionKind.writing, questionCount: 10, minutes: 10),
    ],
    scoring: ExamScoring.jlptN5,
    pools: ExamPools(
      vocab: vocabToMcq(jlptN5),
      grammar: grammarN5,
      reading: readingJaN5,
      listening: _listeningPack('ja', 'ja_listen_n5'),
      writing: writingJaN5,
    ),
  ),
  ExamBlueprint(
    id: 'ja_n4',
    courseId: 'ja',
    emoji: '🍁',
    title: const {'id': 'JLPT N4', 'en': 'JLPT N4'},
    subtitle: const {
      'id': 'Kosakata 35 · Tata bahasa 20 · Bacaan 15 · Dengar 28',
      'en': 'Vocabulary 35 · Grammar 20 · Reading 15 · Listening 28',
    },
    sections: const [
      ExamSection(ExamSectionKind.vocab, questionCount: 35, minutes: 25),
      ExamSection(ExamSectionKind.grammar, questionCount: 20, minutes: 25),
      ExamSection(ExamSectionKind.reading, questionCount: 15, minutes: 30),
      ExamSection(ExamSectionKind.listening, questionCount: 28, minutes: 35),
      ExamSection(ExamSectionKind.writing, questionCount: 10, minutes: 10),
    ],
    scoring: ExamScoring.jlptN4,
    pools: ExamPools(
      vocab: vocabToMcq(jlptN4),
      grammar: grammarN4,
      reading: readingJaN4,
      listening: _listeningPack('ja', 'ja_listen_n4'),
      writing: writingJaN4,
    ),
  ),
  ExamBlueprint(
    id: 'ja_n3',
    courseId: 'ja',
    emoji: '🗻',
    title: const {'id': 'JLPT N3', 'en': 'JLPT N3'},
    subtitle: const {
      'id': 'Kosakata 35 · Tata bahasa 23 · Bacaan 16 · Dengar 28',
      'en': 'Vocabulary 35 · Grammar 23 · Reading 16 · Listening 28',
    },
    sections: const [
      ExamSection(ExamSectionKind.vocab, questionCount: 35, minutes: 30),
      ExamSection(ExamSectionKind.grammar, questionCount: 23, minutes: 30),
      ExamSection(ExamSectionKind.reading, questionCount: 16, minutes: 40),
      ExamSection(ExamSectionKind.listening, questionCount: 28, minutes: 40),
      ExamSection(ExamSectionKind.writing, questionCount: 10, minutes: 10),
    ],
    scoring: ExamScoring.jlptN3,
    pools: ExamPools(
      vocab: vocabToMcq(jlptN3),
      grammar: grammarN3,
      reading: readingJaN3,
      listening: jaListeningN3,
      writing: writingJaN3,
    ),
  ),
  ExamBlueprint(
    id: 'ja_n2',
    courseId: 'ja',
    emoji: '⛩️',
    title: const {'id': 'JLPT N2', 'en': 'JLPT N2'},
    subtitle: const {
      'id': 'Kosakata 30 · Tata bahasa 25 · Bacaan 20 · Dengar 30',
      'en': 'Vocabulary 30 · Grammar 25 · Reading 20 · Listening 30',
    },
    sections: const [
      ExamSection(ExamSectionKind.vocab, questionCount: 30, minutes: 25),
      ExamSection(ExamSectionKind.grammar, questionCount: 25, minutes: 30),
      ExamSection(ExamSectionKind.reading, questionCount: 20, minutes: 50),
      ExamSection(ExamSectionKind.listening, questionCount: 30, minutes: 50),
      ExamSection(ExamSectionKind.writing, questionCount: 10, minutes: 10),
    ],
    scoring: ExamScoring.jlptN2,
    pools: ExamPools(
      vocab: vocabToMcq(jlptN2),
      grammar: grammarN2,
      reading: readingJaN2,
      listening: jaListeningN2,
      writing: writingJaN2,
    ),
  ),
  ExamBlueprint(
    id: 'ja_n1',
    courseId: 'ja',
    emoji: '🏯',
    title: const {'id': 'JLPT N1', 'en': 'JLPT N1'},
    subtitle: const {
      'id': 'Kosakata 25 · Tata bahasa 25 · Bacaan 20 · Dengar 37',
      'en': 'Vocabulary 25 · Grammar 25 · Reading 20 · Listening 37',
    },
    sections: const [
      ExamSection(ExamSectionKind.vocab, questionCount: 25, minutes: 25),
      ExamSection(ExamSectionKind.grammar, questionCount: 25, minutes: 30),
      ExamSection(ExamSectionKind.reading, questionCount: 20, minutes: 55),
      ExamSection(ExamSectionKind.listening, questionCount: 37, minutes: 60),
      ExamSection(ExamSectionKind.writing, questionCount: 10, minutes: 10),
    ],
    scoring: ExamScoring.jlptN1,
    pools: ExamPools(
      vocab: vocabToMcq(jlptN1),
      grammar: grammarN1,
      reading: readingJaN1,
      listening: jaListeningN1,
      writing: writingJaN1,
    ),
  ),
];
