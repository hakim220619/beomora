import '../models/exam.dart';
import '../models/listening.dart';
import 'exam_en_listening_more.dart';
import 'exam_en_reading_more.dart';
import 'exam_de_a1_hoeren.dart';
import 'exam_de_a1_lesen.dart';
import 'exam_de_a2_hoeren.dart';
import 'exam_de_a2_lesen.dart';
import 'exam_en_writing_more.dart';
import 'exam_ko_eps_listening.dart';
import 'exam_ko_eps_reading.dart';
import 'exam_ko_topik_listening.dart';
import 'exam_ko_topik_reading.dart';
import 'exam_writing_bank_ja.dart';
import 'jlpt_exam_n4.dart';
import 'jlpt_exam_n5.dart';
import 'jlpt_grammar_bank.dart';
import 'jlpt_vocab_quiz.dart';
import 'kanji_bank.dart';
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
    case 'ko':
      return _ko;
    case 'de':
      return _de;
    default:
      return const [];
  }
}

ExamBlueprint? examById(String id) {
  for (final list in [_en, _ja, _ko, _de]) {
    for (final e in list) {
      if (e.id == id) return e;
    }
  }
  return null;
}

// ---------------------------------------------------------------------------
// Jerman — Goethe-Zertifikat A1 (Start Deutsch 1) & A2
// ---------------------------------------------------------------------------
// Hanya Lesen & Hören yang disimulasikan (Schreiben & Sprechen tidak).
final List<ExamBlueprint> _de = [
  ExamBlueprint(
    id: 'de_goethe_a1',
    courseId: 'de',
    emoji: '🥨',
    title: const {'id': 'Goethe-Zertifikat A1', 'en': 'Goethe-Zertifikat A1'},
    subtitle: const {
      'id': 'Hören 15 · Lesen 15 · lulus ≥ 60/100 (Start Deutsch 1)',
      'en': 'Listening 15 · Reading 15 · pass ≥ 60/100 (Start Deutsch 1)',
    },
    sections: [
      ExamSection.mixed(
        ExamSectionKind.listening,
        minutes: 20,
        parts: [ExamPart.listening(goetheA1Listening, 15)],
      ),
      ExamSection.mixed(
        ExamSectionKind.reading,
        minutes: 25,
        parts: [
          ExamPart.mcq(goetheA1ReadingMcq, 5),
          ExamPart.reading(goetheA1Reading, 10),
        ],
      ),
    ],
    scoring: ExamScoring.goetheA1,
    pools: const ExamPools(),
  ),
  ExamBlueprint(
    id: 'de_goethe_a2',
    courseId: 'de',
    emoji: '🇩🇪',
    title: const {'id': 'Goethe-Zertifikat A2', 'en': 'Goethe-Zertifikat A2'},
    subtitle: const {
      'id': 'Lesen 20 · Hören 20 · tiap modul lulus ≥ 60/100',
      'en': 'Reading 20 · Listening 20 · each module pass ≥ 60/100',
    },
    sections: [
      ExamSection.mixed(
        ExamSectionKind.reading,
        minutes: 30,
        parts: [
          ExamPart.mcq(goetheA2ReadingMcq, 5),
          ExamPart.reading(goetheA2Reading, 15),
        ],
      ),
      ExamSection.mixed(
        ExamSectionKind.listening,
        minutes: 30,
        parts: [ExamPart.listening(goetheA2Listening, 20)],
      ),
    ],
    scoring: ExamScoring.goetheA2,
    pools: const ExamPools(),
  ),
];

// ---------------------------------------------------------------------------
// Korea — TOPIK I & EPS-TOPIK
// ---------------------------------------------------------------------------
final List<ExamBlueprint> _ko = [
  // TOPIK I (level 1–2): 듣기 30 soal / 40 menit + 읽기 40 soal / 60
  // menit, skor 200 (Level 1 ≥ 80, Level 2 ≥ 140). Tanpa bagian menulis.
  ExamBlueprint(
    id: 'ko_topik1',
    courseId: 'ko',
    emoji: '🇰🇷',
    title: const {'id': 'TOPIK I', 'en': 'TOPIK I'},
    subtitle: const {
      'id': 'Mendengar 30 · Membaca 40 · skor 200 (Level 1–2)',
      'en': 'Listening 30 · Reading 40 · 200 points (Level 1–2)',
    },
    sections: [
      ExamSection.mixed(
        ExamSectionKind.listening,
        minutes: 40,
        parts: [
          ExamPart.listening([
            ...topikListening,
            ..._listeningPack('ko', 'ko_listen_topik1'),
          ], 30),
        ],
      ),
      ExamSection.mixed(
        ExamSectionKind.reading,
        minutes: 60,
        parts: [
          ExamPart.mcq(topikReadingMcq, 20),
          ExamPart.reading(topikReading, 20),
        ],
      ),
    ],
    scoring: ExamScoring.topik1,
    pools: const ExamPools(),
  ),
  // EPS-TOPIK (izin kerja Korea): 읽기 25 soal / 40 menit + 듣기 25 soal
  // / 30 menit, 4 poin per soal = 200; ambang minimal 80.
  ExamBlueprint(
    id: 'ko_eps',
    courseId: 'ko',
    emoji: '🏭',
    title: const {'id': 'EPS-TOPIK', 'en': 'EPS-TOPIK'},
    subtitle: const {
      'id': 'Membaca 25 · Mendengar 25 · skor 200 (izin kerja Korea)',
      'en': 'Reading 25 · Listening 25 · 200 points (Korea work permit)',
    },
    sections: [
      ExamSection.mixed(
        ExamSectionKind.reading,
        minutes: 40,
        parts: [ExamPart.mcq(epsReading, 25)],
      ),
      ExamSection.mixed(
        ExamSectionKind.listening,
        minutes: 30,
        parts: [ExamPart.listening(epsListening, 25)],
      ),
    ],
    scoring: ExamScoring.epsTopik,
    pools: const ExamPools(),
  ),
];

// ---------------------------------------------------------------------------
// Inggris — TOEFL iBT, IELTS Academic, PTE Academic
// ---------------------------------------------------------------------------
final List<ExamBlueprint> _en = [
  // TOEFL iBT format Januari 2026 (Speaking belum tersedia). Tes aslinya
  // adaptif; di sini jumlah soal tetap mendekati satu tahap tes.
  ExamBlueprint(
    id: 'en_toefl',
    courseId: 'en',
    emoji: '🎓',
    title: const {'id': 'TOEFL iBT (2026)', 'en': 'TOEFL iBT (2026)'},
    subtitle: const {
      'id': 'Reading 28 · Listening 24 · Writing 12 · skor band 1–6',
      'en': 'Reading 28 · Listening 24 · Writing 12 · 1–6 band score',
    },
    sections: [
      ExamSection.mixed(
        ExamSectionKind.reading,
        minutes: 30,
        parts: [
          ExamPart.typing(toeflCompleteWords, 10),
          ExamPart.reading(toeflDailyLife, 8),
          ExamPart.reading([
            ...readingEnAcademic,
            ...readingEnAcademicMore,
          ], 10),
        ],
      ),
      ExamSection.mixed(
        ExamSectionKind.listening,
        minutes: 29,
        maxPlays: 1,
        parts: [
          ExamPart.listening(toeflChooseResponse, 8),
          ExamPart.listening([..._listeningPack('en', 'en_listen_toefl')], 16),
        ],
      ),
      ExamSection.mixed(
        ExamSectionKind.writing,
        minutes: 23,
        parts: [
          ExamPart.order(toeflBuildSentence, 10),
          ExamPart.essay(toeflEmail, 1),
          ExamPart.essay(toeflDiscussion, 1),
        ],
      ),
    ],
    scoring: ExamScoring.toefl,
    pools: const ExamPools(),
  ),
  ExamBlueprint(
    id: 'en_ielts',
    courseId: 'en',
    emoji: '📘',
    title: const {'id': 'IELTS Academic', 'en': 'IELTS Academic'},
    subtitle: const {
      'id': 'Listening 40 · Reading 40 · Writing Task 1 & 2 (tanpa Speaking)',
      'en': 'Listening 40 · Reading 40 · Writing Task 1 & 2 (no Speaking)',
    },
    sections: [
      ExamSection.mixed(
        ExamSectionKind.listening,
        minutes: 30,
        maxPlays: 1,
        parts: [
          ExamPart.listening([..._listeningPack('en', 'en_listen_ielts')], 40),
        ],
      ),
      ExamSection.mixed(
        ExamSectionKind.reading,
        minutes: 60,
        parts: [
          ExamPart.reading([
            ...readingEnAcademic,
            ...readingEnAcademicMore,
          ], 40),
        ],
      ),
      ExamSection.mixed(
        ExamSectionKind.writing,
        minutes: 60,
        parts: [ExamPart.essay(ieltsTask1, 1), ExamPart.essay(ieltsTask2, 1)],
      ),
    ],
    scoring: ExamScoring.ielts,
    pools: const ExamPools(),
  ),
  // PTE Academic: urutan resmi Speaking & Writing → Reading → Listening
  // (bagian Speaking belum tersedia, jadi bagian pertama hanya Writing).
  ExamBlueprint(
    id: 'en_pte',
    courseId: 'en',
    emoji: '💻',
    title: const {'id': 'PTE Academic', 'en': 'PTE Academic'},
    subtitle: const {
      'id': 'Writing 2 · Reading 15 · Listening 14 (tanpa Speaking)',
      'en': 'Writing 2 · Reading 15 · Listening 14 (no Speaking)',
    },
    sections: [
      ExamSection.mixed(
        ExamSectionKind.writing,
        minutes: 30,
        parts: [
          ExamPart.essay(pteSummarizeWritten, 1),
          ExamPart.essay(pteEssay, 1),
        ],
      ),
      ExamSection.mixed(
        ExamSectionKind.reading,
        minutes: 30,
        parts: [
          ExamPart.mcq(pteReadingFillBlanks, 6),
          ExamPart.reading([...readingEnAcademic, ...readingEnAcademicMore], 5),
          ExamPart.order(pteReorder, 4),
        ],
      ),
      ExamSection.mixed(
        ExamSectionKind.listening,
        minutes: 35,
        maxPlays: 1,
        parts: [
          ExamPart.listening([..._listeningPack('en', 'en_listen_pte')], 8),
          ExamPart.pick(pteHighlightIncorrect, 3),
          ExamPart.typing(pteDictation, 3),
        ],
      ),
    ],
    scoring: ExamScoring.pte,
    pools: const ExamPools(),
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
      'id': 'Kosakata 21 · Tata bahasa 17 · Bacaan 6 · Dengar 24',
      'en': 'Vocabulary 21 · Grammar 17 · Reading 6 · Listening 24',
    },
    // Susunan soal JLPT sejak 2020: 漢字読み 7, 表記 5, 文脈規定 6,
    // 言い換え類義 3 · 文法 17 · 読解 6 · 聴解 24.
    sections: [
      ExamSection.mixed(
        ExamSectionKind.vocab,
        minutes: 20,
        parts: [
          ExamPart.mcq(kanjiReadingQuestions(kanjiN5Sections), 7),
          ExamPart.mcq(kanjiSpellingQuestions(kanjiN5Sections), 5),
          ExamPart.mcq(vocabContextN5, 6),
          ExamPart.mcq(vocabParaphraseN5, 3),
        ],
      ),
      ExamSection.mixed(
        ExamSectionKind.grammar,
        minutes: 20,
        parts: [
          ExamPart.mcq([...grammarN5, ...grammarN5More], 17),
        ],
      ),
      ExamSection.mixed(
        ExamSectionKind.reading,
        minutes: 20,
        parts: [
          ExamPart.reading([...readingJaN5, ...readingJaN5More], 6),
        ],
      ),
      ExamSection.mixed(
        ExamSectionKind.listening,
        minutes: 30,
        parts: [ExamPart.listening(_listeningPack('ja', 'ja_listen_n5'), 24)],
      ),
      const ExamSection(
        ExamSectionKind.writing,
        questionCount: 10,
        minutes: 10,
      ),
    ],
    scoring: ExamScoring.jlptN5,
    pools: ExamPools(writing: writingJaN5),
  ),
  ExamBlueprint(
    id: 'ja_n4',
    courseId: 'ja',
    emoji: '🍁',
    title: const {'id': 'JLPT N4', 'en': 'JLPT N4'},
    subtitle: const {
      'id': 'Kosakata 28 · Tata bahasa 21 · Bacaan 8 · Dengar 28',
      'en': 'Vocabulary 28 · Grammar 21 · Reading 8 · Listening 28',
    },
    // Susunan soal JLPT sejak 2020: 漢字読み 7, 表記 5, 文脈規定 8,
    // 言い換え類義 4, 用法 4 · 文法 21 · 読解 8 · 聴解 28.
    sections: [
      ExamSection.mixed(
        ExamSectionKind.vocab,
        minutes: 25,
        parts: [
          ExamPart.mcq(kanjiReadingQuestions(kanjiN4Sections), 7),
          ExamPart.mcq(kanjiSpellingQuestions(kanjiN4Sections), 5),
          ExamPart.mcq(vocabContextN4, 8),
          ExamPart.mcq(vocabParaphraseN4, 4),
          ExamPart.mcq(vocabUsageN4, 4),
        ],
      ),
      ExamSection.mixed(
        ExamSectionKind.grammar,
        minutes: 25,
        parts: [
          ExamPart.mcq([...grammarN4, ...grammarN4More], 21),
        ],
      ),
      ExamSection.mixed(
        ExamSectionKind.reading,
        minutes: 30,
        parts: [
          ExamPart.reading([...readingJaN4, ...readingJaN4More], 8),
        ],
      ),
      ExamSection.mixed(
        ExamSectionKind.listening,
        minutes: 35,
        parts: [ExamPart.listening(_listeningPack('ja', 'ja_listen_n4'), 28)],
      ),
      const ExamSection(
        ExamSectionKind.writing,
        questionCount: 10,
        minutes: 10,
      ),
    ],
    scoring: ExamScoring.jlptN4,
    pools: ExamPools(writing: writingJaN4),
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
