import 'dart:math';

import '../data/mcq_bank.dart';
import 'listening.dart';

/// Jenis bagian ujian. Urutan enum = urutan tampil di ujian.
enum ExamSectionKind { vocab, grammar, reading, listening, writing }

/// Satu bagian ujian: berapa soal dan berapa menit, meniru struktur
/// ujian aslinya (TOEFL iBT, IELTS, PTE Academic, JLPT N5–N1).
class ExamSection {
  final ExamSectionKind kind;
  final int questionCount;
  final int minutes;

  /// Batas putar audio per bacaan (khusus listening; 0 = bebas).
  final int maxPlays;

  /// Susunan jenis soal di bagian ini (mis. TOEFL Writing: 10 Build a
  /// Sentence + 1 email + 1 diskusi). Kosong = soal diambil dari
  /// [ExamPools] sesuai [kind] (cara lama).
  final List<ExamPart> parts;

  const ExamSection(
    this.kind, {
    required this.questionCount,
    required this.minutes,
    this.maxPlays = 2,
    this.parts = const [],
  });

  /// Bagian berisi beberapa jenis soal; jumlah soal = jumlah tiap part.
  ExamSection.mixed(
    this.kind, {
    required this.minutes,
    required this.parts,
    this.maxPlays = 2,
  }) : questionCount = parts.fold(0, (n, p) => n + p.count);

  ExamSection copyWith({int? questionCount, int? minutes}) => ExamSection(
    kind,
    questionCount: questionCount ?? this.questionCount,
    minutes: minutes ?? this.minutes,
    maxPlays: maxPlays,
    parts: questionCount == null || parts.isEmpty
        ? parts
        : _scaleParts(parts, questionCount),
  );

  /// Bagi [total] soal ke tiap part sebanding jumlah aslinya (esai
  /// dilewati di versi mini karena butuh waktu lama).
  static List<ExamPart> _scaleParts(List<ExamPart> parts, int total) {
    final scorable = [
      for (final p in parts)
        if (p.type != ExamPartType.essay) p,
    ];
    if (scorable.isEmpty) return [parts.first.withCount(min(total, 1))];
    final all = scorable.fold(0, (n, p) => n + p.count);
    final counts = [for (final p in scorable) (p.count * total / all).floor()];
    var rest = total - counts.fold(0, (a, b) => a + b);
    for (var i = 0; rest > 0; i = (i + 1) % counts.length, rest--) {
      counts[i]++;
    }
    return [
      for (var i = 0; i < scorable.length; i++)
        if (counts[i] > 0) scorable[i].withCount(counts[i]),
    ];
  }
}

/// Jenis soal dalam satu [ExamPart].
enum ExamPartType { mcq, reading, listening, typing, order, pick, essay }

/// Sekelompok soal sejenis dalam satu bagian, dengan sumbernya sendiri.
class ExamPart {
  final ExamPartType type;
  final int count;
  final List<McqQuestion> mcq;
  final List<ReadingPassage> passages;
  final List<ListeningPassage> audio;
  final List<WritingItem> typing;
  final List<OrderItem> order;
  final List<WordPickItem> pick;
  final List<EssayItem> essays;

  const ExamPart._(
    this.type,
    this.count, {
    this.mcq = const [],
    this.passages = const [],
    this.audio = const [],
    this.typing = const [],
    this.order = const [],
    this.pick = const [],
    this.essays = const [],
  });

  const ExamPart.mcq(List<McqQuestion> pool, int count)
    : this._(ExamPartType.mcq, count, mcq: pool);
  const ExamPart.reading(List<ReadingPassage> pool, int count)
    : this._(ExamPartType.reading, count, passages: pool);
  const ExamPart.listening(List<ListeningPassage> pool, int count)
    : this._(ExamPartType.listening, count, audio: pool);
  const ExamPart.typing(List<WritingItem> pool, int count)
    : this._(ExamPartType.typing, count, typing: pool);
  const ExamPart.order(List<OrderItem> pool, int count)
    : this._(ExamPartType.order, count, order: pool);
  const ExamPart.pick(List<WordPickItem> pool, int count)
    : this._(ExamPartType.pick, count, pick: pool);
  const ExamPart.essay(List<EssayItem> pool, int count)
    : this._(ExamPartType.essay, count, essays: pool);

  ExamPart withCount(int n) => ExamPart._(
    type,
    n,
    mcq: mcq,
    passages: passages,
    audio: audio,
    typing: typing,
    order: order,
    pick: pick,
    essays: essays,
  );
}

/// Cara mengubah persentase benar menjadi perkiraan skor ujian asli.
enum ExamScoring {
  toefl, // per bagian band 1–6 (format 2026) + padanan 0–30
  ielts, // band 1–9
  pte, // 10–90
  jlptN5, // Pengetahuan Bahasa 120 + Choukai 60, lulus 80
  jlptN4, // Pengetahuan Bahasa 120 + Choukai 60, lulus 90
  jlptN3, // 3 × 60, lulus 95
  jlptN2, // 3 × 60, lulus 90
  jlptN1, // 3 × 60, lulus 100
  topik1, // Mendengar 100 + Membaca 100; Level 1 ≥ 80, Level 2 ≥ 140
  epsTopik, // 50 soal × 4 = 200; ambang minimal 80
  goetheA1, // Lesen + Hören per bagian /100; lulus ≥ 60 (rata-rata)
  goetheA2; // modul Lesen & Hören masing-masing lulus ≥ 60/100

  bool get isJlpt =>
      index >= ExamScoring.jlptN5.index && index <= ExamScoring.jlptN1.index;

  /// Ujian bahasa Korea (TOPIK I / EPS-TOPIK).
  bool get isKorean =>
      this == ExamScoring.topik1 || this == ExamScoring.epsTopik;

  /// Ambang lulus total JLPT (0 untuk ujian tanpa ambang).
  int get passMark => switch (this) {
    ExamScoring.jlptN5 => 80,
    ExamScoring.jlptN4 => 90,
    ExamScoring.jlptN3 => 95,
    ExamScoring.jlptN2 => 90,
    ExamScoring.jlptN1 => 100,
    ExamScoring.topik1 => 80,
    ExamScoring.epsTopik => 80,
    ExamScoring.goetheA1 => 60,
    ExamScoring.goetheA2 => 60,
    _ => 0,
  };
}

/// Bacaan untuk bagian reading: teks bahasa target + soal pemahaman.
/// Pilihan pertama tiap soal = jawaban benar (layar yang mengacak).
class ReadingPassage {
  final String id;
  final Map<String, String> title; // per bahasa UI
  final String text; // bahasa target
  final List<McqQuestion> questions;

  const ReadingPassage({
    required this.id,
    required this.title,
    required this.text,
    required this.questions,
  });
}

/// Soal tulis: pengguna mengetik jawaban singkat (isian kata, bacaan
/// hiragana, dsb.). Cocok kalau, setelah dinormalkan (huruf kecil,
/// spasi & tanda baca dibuang), sama dengan salah satu [answers].
class WritingItem {
  final Map<String, String> prompt; // instruksi per bahasa UI
  final String text; // kalimat/kata bahasa target yang ditampilkan besar
  final List<String> answers; // jawaban yang diterima; [0] ditampilkan
  final String? hint; // petunjuk kecil (mis. bentuk dasar kata)

  /// Dikte (PTE Write from Dictation): kalimat [answers] pertama
  /// dibacakan TTS, [text] tidak ditampilkan; benar bila ≥ 80% kata
  /// kalimat itu tertulis.
  final bool dictation;

  const WritingItem({
    required this.prompt,
    required this.text,
    required this.answers,
    this.hint,
    this.dictation = false,
  });

  static String normalize(String s) =>
      s.toLowerCase().replaceAll(RegExp(r"[\s\.,!?;:'’\-—、。「」！？]"), '').trim();

  bool accepts(String input) {
    if (dictation) return dictationScore(input) >= 0.8;
    final n = normalize(input);
    if (n.isEmpty) return false;
    return answers.any((a) => normalize(a) == n);
  }

  /// Porsi kata kalimat dikte yang tertulis (urutan bebas, tiap kata
  /// dihitung sekali), 0–1.
  double dictationScore(String input) {
    List<String> words(String s) => s
        .toLowerCase()
        .split(RegExp(r'\s+'))
        .map((w) => w.replaceAll(RegExp(r"[^a-z0-9']"), ''))
        .where((w) => w.isNotEmpty)
        .toList();
    final target = words(answers.first);
    if (target.isEmpty) return 0;
    final typed = words(input);
    var hit = 0;
    for (final w in target) {
      if (typed.remove(w)) hit++;
    }
    return hit / target.length;
  }
}

/// Soal susun: potongan diurutkan menjadi kalimat/paragraf yang benar
/// (TOEFL Build a Sentence, PTE Reorder Paragraphs). [pieces] ditulis
/// dalam URUTAN BENAR; layar yang mengacaknya.
class OrderItem {
  final Map<String, String> prompt; // instruksi per bahasa UI
  /// Konteks opsional (mis. kalimat lawan bicara di Build a Sentence).
  final String? context;
  final List<String> pieces;

  /// Penyambung antarpotongan saat ditampilkan ("" untuk paragraf
  /// yang ditumpuk, " " untuk kata).
  final String joiner;

  const OrderItem({
    required this.prompt,
    required this.pieces,
    this.context,
    this.joiner = ' ',
  });

  String get answerText => pieces.join(joiner == '' ? '\n' : joiner);
}

/// Soal tandai kata (PTE Highlight Incorrect Words): audio membacakan
/// [spoken]; teks yang ditampilkan sama kecuali satu kata di
/// [wrongIndex] (indeks kata, dipisah spasi) yang diganti [shownWord].
class WordPickItem {
  final Map<String, String> prompt;
  final String spoken;
  final int wrongIndex;
  final String shownWord;

  const WordPickItem({
    required this.prompt,
    required this.spoken,
    required this.wrongIndex,
    required this.shownWord,
  });

  List<String> get spokenWords => spoken.split(' ');
  List<String> get shownWords => [
    for (var i = 0; i < spokenWords.length; i++)
      i == wrongIndex ? shownWord : spokenWords[i],
  ];
}

/// Soal esai (IELTS Writing Task 1/2, TOEFL Email & Academic
/// Discussion, PTE Essay/Summarize). Tidak dinilai otomatis: setelah
/// ujian pengguna membandingkan dengan [modelAnswer] dan [checklist].
class EssayItem {
  final Map<String, String> title; // nama tugas per bahasa UI
  final String task; // soal (bahasa Inggris), boleh memuat tabel data
  final int minWords;
  final int? maxWords;
  final String modelAnswer;
  final List<Map<String, String>> checklist; // kriteria per bahasa UI

  const EssayItem({
    required this.title,
    required this.task,
    required this.minWords,
    required this.modelAnswer,
    required this.checklist,
    this.maxWords,
  });

  static int wordCount(String s) =>
      s.trim().isEmpty ? 0 : s.trim().split(RegExp(r'\s+')).length;
}

/// Sumber soal per bagian untuk satu ujian. Pool boleh lebih besar dari
/// yang diminta (diacak tiap sesi); kalau kurang, sesi memakai apa yang
/// ada.
class ExamPools {
  final List<McqQuestion> vocab;
  final List<McqQuestion> grammar;
  final List<ReadingPassage> reading;

  /// Soal reading lepas (tanpa bacaan) untuk melengkapi bila soal dari
  /// bacaan belum mencapai jumlah bagian.
  final List<McqQuestion> readingExtra;
  final List<ListeningPassage> listening;
  final List<WritingItem> writing;

  const ExamPools({
    this.vocab = const [],
    this.grammar = const [],
    this.reading = const [],
    this.readingExtra = const [],
    this.listening = const [],
    this.writing = const [],
  });

  int available(ExamSectionKind kind) => switch (kind) {
    ExamSectionKind.vocab => vocab.length,
    ExamSectionKind.grammar => grammar.length,
    ExamSectionKind.reading =>
      reading.fold(0, (n, p) => n + p.questions.length) + readingExtra.length,
    ExamSectionKind.listening => listening.fold(
      0,
      (n, p) => n + p.questions.length,
    ),
    ExamSectionKind.writing => writing.length,
  };
}

/// Cetak biru satu ujian: identitas, bagian-bagian, dan cara skor.
class ExamBlueprint {
  final String id; // mis. 'en_toefl', 'ja_n3'
  final String courseId;
  final String emoji;
  final Map<String, String> title;
  final Map<String, String> subtitle;
  final List<ExamSection> sections;
  final ExamScoring scoring;
  final ExamPools pools;

  const ExamBlueprint({
    required this.id,
    required this.courseId,
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.sections,
    required this.scoring,
    required this.pools,
  });

  int get totalQuestions => sections.fold(0, (n, s) => n + s.questionCount);
  int get totalMinutes => sections.fold(0, (n, s) => n + s.minutes);

  ExamSection? section(ExamSectionKind kind) {
    for (final s in sections) {
      if (s.kind == kind) return s;
    }
    return null;
  }

  /// Versi mini untuk pengguna gratis: [total] soal dibagi proporsional
  /// ke tiap bagian (minimal 1), waktu 1 menit per soal.
  List<ExamSection> miniSections(int total) {
    final all = totalQuestions;
    final counts = [
      for (final s in sections) max(1, (s.questionCount * total / all).round()),
    ];
    // Sesuaikan supaya jumlahnya tepat [total].
    var sum = counts.fold(0, (a, b) => a + b);
    var i = 0;
    while (sum != total && i < 100) {
      final idx = i % counts.length;
      if (sum > total && counts[idx] > 1) {
        counts[idx]--;
        sum--;
      } else if (sum < total) {
        counts[idx]++;
        sum++;
      }
      i++;
    }
    return [
      for (var k = 0; k < sections.length; k++)
        sections[k].copyWith(questionCount: counts[k], minutes: counts[k]),
    ];
  }
}

/// Satu soal dalam sesi ujian yang sedang berjalan.
class ExamItem {
  final ExamSectionKind section;
  final McqQuestion? mcq;
  final List<String> options; // urutan pilihan yang sudah diacak
  final WritingItem? writing;
  final OrderItem? order;
  final WordPickItem? pick;
  final EssayItem? essay;

  /// Bacaan (reading: ditampilkan; listening: dibacakan TTS, transkrip
  /// baru dibuka di ulasan). Soal-soal dari bacaan yang sama berurutan.
  final String? passageId;
  final Map<String, String>? passageTitle;
  final String? passageText;
  final Map<String, String>? passageTranslation;

  String? userAnswer;

  ExamItem.choice(
    this.section,
    McqQuestion q,
    Random rng, {
    this.passageId,
    this.passageTitle,
    this.passageText,
    this.passageTranslation,
  }) : mcq = q,
       options = [...q.options]..shuffle(rng),
       writing = null,
       order = null,
       pick = null,
       essay = null;

  ExamItem.typing(this.section, WritingItem w)
    : mcq = null,
      options = const [],
      writing = w,
      order = null,
      pick = null,
      essay = null,
      passageId = null,
      passageTitle = null,
      passageText = w.dictation ? w.answers.first : null,
      passageTranslation = null;

  /// Soal susun: [options] = potongan yang sudah diacak; jawaban
  /// pengguna = potongan berurutan dipisah "\u0001".
  ExamItem.ordering(this.section, OrderItem o, Random rng)
    : mcq = null,
      options = _shuffledPieces(o.pieces, rng),
      writing = null,
      order = o,
      pick = null,
      essay = null,
      passageId = null,
      passageTitle = null,
      passageText = null,
      passageTranslation = null;

  /// Soal tandai kata: jawaban pengguna = indeks kata (teks).
  ExamItem.picking(this.section, WordPickItem p)
    : mcq = null,
      options = const [],
      writing = null,
      order = null,
      pick = p,
      essay = null,
      passageId = null,
      passageTitle = null,
      passageText = p.spoken,
      passageTranslation = null;

  ExamItem.essayTask(this.section, EssayItem e)
    : mcq = null,
      options = const [],
      writing = null,
      order = null,
      pick = null,
      essay = e,
      passageId = null,
      passageTitle = null,
      passageText = null,
      passageTranslation = null;

  static const orderSeparator = '\u0001';

  static List<String> _shuffledPieces(List<String> pieces, Random rng) {
    final out = [...pieces];
    // Jangan sampai acakannya kebetulan sudah urut.
    for (var i = 0; i < 5; i++) {
      out.shuffle(rng);
      if (out.join() != pieces.join() || pieces.length < 2) break;
    }
    return out;
  }

  bool get isTyping => writing != null || essay != null;
  bool get isDictation => writing?.dictation ?? false;
  bool get isOrder => order != null;
  bool get isPick => pick != null;
  bool get isEssay => essay != null;

  /// Ada audio yang dibacakan (bagian listening, dikte, tandai kata).
  bool get isAudio =>
      section == ExamSectionKind.listening || isDictation || isPick;

  /// Esai tidak dinilai otomatis — tidak ikut hitungan benar/salah.
  bool get scored => !isEssay;

  String get correctAnswer {
    if (mcq != null) return mcq!.options[mcq!.answer];
    if (order != null) return order!.answerText;
    if (pick != null) {
      return '${pick!.shownWord} → ${pick!.spokenWords[pick!.wrongIndex]}';
    }
    if (essay != null) return essay!.modelAnswer;
    return writing!.answers.first;
  }

  bool get answered => userAnswer != null && userAnswer!.trim().isNotEmpty;

  bool get correct {
    final a = userAnswer;
    if (a == null) return false;
    if (writing != null) return writing!.accepts(a);
    if (order != null) {
      return a.split(orderSeparator).join('\u0002') ==
          order!.pieces.join('\u0002');
    }
    if (pick != null) return a == '${pick!.wrongIndex}';
    if (essay != null) return false;
    return a == correctAnswer;
  }
}

/// Hasil satu bagian setelah ujian selesai.
class ExamSectionResult {
  final ExamSectionKind kind;
  final int correct;
  final int total;
  const ExamSectionResult(this.kind, this.correct, this.total);
  double get pct => total == 0 ? 0 : correct / total;
}

/// Sesi ujian: daftar soal per bagian, dibangun acak dari pool.
class ExamSession {
  final ExamBlueprint blueprint;
  final List<ExamSection> sections;
  final bool mini;

  /// Soal per bagian, indeks sejajar dengan [sections].
  final List<List<ExamItem>> items;

  ExamSession._(this.blueprint, this.sections, this.mini, this.items);

  factory ExamSession.build(
    ExamBlueprint bp,
    Random rng, {
    bool mini = false,
    int miniTotal = 10,
  }) {
    final sections = mini ? bp.miniSections(miniTotal) : bp.sections;
    final items = <List<ExamItem>>[];
    for (final s in sections) {
      final list = _buildSection(bp.pools, s, rng);
      items.add(list);
    }
    // Buang bagian yang pool-nya kosong sama sekali.
    final keep = <int>[
      for (var i = 0; i < sections.length; i++)
        if (items[i].isNotEmpty) i,
    ];
    return ExamSession._(
      bp,
      [for (final i in keep) sections[i]],
      mini,
      [for (final i in keep) items[i]],
    );
  }

  static List<ExamItem> _buildSection(
    ExamPools pools,
    ExamSection s,
    Random rng,
  ) {
    if (s.parts.isNotEmpty) {
      return [for (final part in s.parts) ..._buildPart(s.kind, part, rng)];
    }
    final n = s.questionCount;
    switch (s.kind) {
      case ExamSectionKind.vocab:
        return _pickMcq(s.kind, pools.vocab, n, rng);
      case ExamSectionKind.grammar:
        return _pickMcq(s.kind, pools.grammar, n, rng);
      case ExamSectionKind.writing:
        final pool = [...pools.writing]..shuffle(rng);
        return [for (final w in pool.take(n)) ExamItem.typing(s.kind, w)];
      case ExamSectionKind.reading:
        final out = <ExamItem>[];
        final passages = [...pools.reading]..shuffle(rng);
        for (final p in passages) {
          if (out.length >= n) break;
          final qs = [...p.questions]..shuffle(rng);
          for (final q in qs.take(n - out.length)) {
            out.add(
              ExamItem.choice(
                s.kind,
                q,
                rng,
                passageId: p.id,
                passageTitle: p.title,
                passageText: p.text,
              ),
            );
          }
        }
        if (out.length < n) {
          out.addAll(_pickMcq(s.kind, pools.readingExtra, n - out.length, rng));
        }
        return out;
      case ExamSectionKind.listening:
        final out = <ExamItem>[];
        final passages = [...pools.listening]..shuffle(rng);
        for (final p in passages) {
          if (out.length >= n) break;
          final qs = [...p.questions]..shuffle(rng);
          for (final q in qs.take(n - out.length)) {
            out.add(
              ExamItem.choice(
                s.kind,
                q,
                rng,
                passageId: p.id,
                passageTitle: p.title,
                passageText: p.transcript,
                passageTranslation: p.translation,
              ),
            );
          }
        }
        return out;
    }
  }

  static List<ExamItem> _buildPart(
    ExamSectionKind kind,
    ExamPart part,
    Random rng,
  ) {
    final n = part.count;
    List<T> pick<T>(List<T> pool) => ([...pool]..shuffle(rng)).take(n).toList();
    switch (part.type) {
      case ExamPartType.mcq:
        return _pickMcq(kind, part.mcq, n, rng);
      case ExamPartType.typing:
        return [for (final w in pick(part.typing)) ExamItem.typing(kind, w)];
      case ExamPartType.order:
        return [
          for (final o in pick(part.order)) ExamItem.ordering(kind, o, rng),
        ];
      case ExamPartType.pick:
        return [for (final p in pick(part.pick)) ExamItem.picking(kind, p)];
      case ExamPartType.essay:
        return [for (final e in pick(part.essays)) ExamItem.essayTask(kind, e)];
      case ExamPartType.reading:
        return _fromPassages(
          n,
          [...part.passages]..shuffle(rng),
          (p) => p.questions,
          (p, q) => ExamItem.choice(
            kind,
            q,
            rng,
            passageId: p.id,
            passageTitle: p.title,
            passageText: p.text,
          ),
          rng,
        );
      case ExamPartType.listening:
        return _fromPassages(
          n,
          [...part.audio]..shuffle(rng),
          (p) => p.questions,
          (p, q) => ExamItem.choice(
            kind,
            q,
            rng,
            passageId: p.id,
            passageTitle: p.title,
            passageText: p.transcript,
            passageTranslation: p.translation,
          ),
          rng,
        );
    }
  }

  /// Ambil soal dari bacaan/audio teracak sampai [n] soal; soal dari
  /// bacaan yang sama tetap berurutan.
  static List<ExamItem> _fromPassages<P>(
    int n,
    List<P> passages,
    List<McqQuestion> Function(P) questionsOf,
    ExamItem Function(P, McqQuestion) make,
    Random rng,
  ) {
    final out = <ExamItem>[];
    for (final p in passages) {
      if (out.length >= n) break;
      final qs = [...questionsOf(p)]..shuffle(rng);
      for (final q in qs.take(n - out.length)) {
        out.add(make(p, q));
      }
    }
    return out;
  }

  static List<ExamItem> _pickMcq(
    ExamSectionKind kind,
    List<McqQuestion> pool,
    int n,
    Random rng,
  ) {
    final p = [...pool]..shuffle(rng);
    return [for (final q in p.take(n)) ExamItem.choice(kind, q, rng)];
  }

  int get totalQuestions => items.fold(0, (n, l) => n + l.length);
  int get totalMinutes => sections.fold(0, (n, s) => n + s.minutes);

  List<ExamSectionResult> get results => [
    for (var i = 0; i < sections.length; i++)
      ExamSectionResult(
        sections[i].kind,
        items[i].where((e) => e.scored && e.correct).length,
        items[i].where((e) => e.scored).length,
      ),
  ];

  int get totalCorrect =>
      items.fold(0, (n, l) => n + l.where((e) => e.scored && e.correct).length);

  /// Soal yang dinilai otomatis (tanpa esai).
  int get totalScored =>
      items.fold(0, (n, l) => n + l.where((e) => e.scored).length);

  List<ExamItem> get missed => [
    for (final l in items)
      for (final e in l)
        if (e.scored && !e.correct) e,
  ];

  /// Esai yang ditulis — diulas dengan contoh jawaban & daftar cek.
  List<ExamItem> get essays => [
    for (final l in items)
      for (final e in l)
        if (e.isEssay) e,
  ];
}

/// Perkiraan skor resmi dari hasil per bagian.
class ExamScore {
  /// Label skor per bagian (mis. "24/30", "Band 6.5", "48/60").
  final Map<ExamSectionKind, String> perSection;

  /// Skor keseluruhan (mis. "72/90", "Band 6.5", "112/180").
  final String overall;

  /// JLPT / TOPIK / EPS-TOPIK: lulus/tidak (null untuk ujian tanpa
  /// ambang lulus).
  final bool? passed;

  const ExamScore({
    required this.perSection,
    required this.overall,
    this.passed,
  });

  static int _scale(double pct, int max) => (pct * max).round();

  static double _ieltsBand(double p) {
    if (p >= 0.975) return 9;
    if (p >= 0.9) return 8.5;
    if (p >= 0.85) return 8;
    if (p >= 0.775) return 7.5;
    if (p >= 0.7) return 7;
    if (p >= 0.6) return 6.5;
    if (p >= 0.525) return 6;
    if (p >= 0.45) return 5.5;
    if (p >= 0.375) return 5;
    if (p >= 0.3) return 4.5;
    if (p >= 0.225) return 4;
    if (p >= 0.15) return 3.5;
    return 3;
  }

  static String _fmtBand(double b) =>
      b == b.roundToDouble() ? b.toInt().toString() : b.toStringAsFixed(1);

  /// Band TOEFL iBT 2026: 1–6 per setengah band.
  static double _toeflBand(double p) => ((1 + 5 * p) * 2).round() / 2;

  static ExamScore compute(
    ExamScoring scoring,
    List<ExamSectionResult> results,
  ) {
    // Bagian yang seluruhnya esai (dinilai sendiri) tidak ikut skor.
    final rs = [
      for (final r in results)
        if (r.total > 0) r,
    ];
    final per = <ExamSectionKind, String>{};
    double pctOf(ExamSectionKind k) {
      for (final r in rs) {
        if (r.kind == k) return r.pct;
      }
      return -1;
    }

    // Gabungan beberapa bagian: total benar / total soal.
    double pctOfAll(List<ExamSectionKind> ks) {
      var c = 0, t = 0;
      for (final r in rs) {
        if (ks.contains(r.kind)) {
          c += r.correct;
          t += r.total;
        }
      }
      return t == 0 ? -1 : c / t;
    }

    switch (scoring) {
      case ExamScoring.toefl:
        // Format 2026: band 1–6 per bagian; skor lama 0–120 (0–30 per
        // bagian) ditampilkan sebagai padanan seperti laporan resmi.
        var bands = 0.0, legacy = 0, max = 0;
        for (final r in rs) {
          final b = _toeflBand(r.pct);
          per[r.kind] = 'Band ${_fmtBand(b)}';
          bands += b;
          legacy += _scale(r.pct, 30);
          max += 30;
        }
        final avg = rs.isEmpty ? 1.0 : (bands / rs.length * 2).round() / 2;
        return ExamScore(
          perSection: per,
          overall: 'Band ${_fmtBand(avg)} · ≈ $legacy/$max',
        );
      case ExamScoring.ielts:
        var sum = 0.0;
        for (final r in rs) {
          final b = _ieltsBand(r.pct);
          per[r.kind] = 'Band ${_fmtBand(b)}';
          sum += b;
        }
        final avg = rs.isEmpty ? 0.0 : (sum / rs.length * 2).round() / 2;
        return ExamScore(perSection: per, overall: 'Band ${_fmtBand(avg)}');
      case ExamScoring.pte:
        var sum = 0;
        for (final r in rs) {
          final s = 10 + _scale(r.pct, 80);
          per[r.kind] = '$s/90';
          sum += s;
        }
        final avg = rs.isEmpty ? 0 : (sum / rs.length).round();
        return ExamScore(perSection: per, overall: '$avg/90');
      case ExamScoring.topik1:
        // TOPIK I: Mendengar /100 + Membaca /100 = /200. Level 1 ≥ 80,
        // Level 2 ≥ 140 (tanpa ambang per bagian).
        final li = pctOf(ExamSectionKind.listening);
        final rd = pctOf(ExamSectionKind.reading);
        final liS = li < 0 ? 0 : _scale(li, 100);
        final rdS = rd < 0 ? 0 : _scale(rd, 100);
        if (li >= 0) per[ExamSectionKind.listening] = '$liS/100';
        if (rd >= 0) per[ExamSectionKind.reading] = '$rdS/100';
        final total = liS + rdS;
        final level = total >= 140
            ? ' · Level 2'
            : total >= 80
            ? ' · Level 1'
            : '';
        return ExamScore(
          perSection: per,
          overall: '$total/200$level',
          passed: total >= scoring.passMark,
        );
      case ExamScoring.goetheA1:
      case ExamScoring.goetheA2:
        // Goethe-Zertifikat: tiap bagian /100; Schreiben & Sprechen tidak
        // disimulasikan. A1: lulus bila rata-rata ≥ 60. A2 (modular):
        // tiap modul harus ≥ 60.
        var sum = 0, n = 0, allPass = true;
        for (final r in rs) {
          final s = _scale(r.pct, 100);
          per[r.kind] = '$s/100';
          sum += s;
          n++;
          if (s < scoring.passMark) allPass = false;
        }
        final avg = n == 0 ? 0 : (sum / n).round();
        return ExamScore(
          perSection: per,
          overall: '$avg/100',
          passed: scoring == ExamScoring.goetheA2
              ? (n > 0 && allPass)
              : avg >= scoring.passMark,
        );
      case ExamScoring.epsTopik:
        // EPS-TOPIK: 25 Membaca + 25 Mendengar, 4 poin per soal = /200.
        // Ambang lulus minimal 80 (bisa lebih tinggi per sektor/negara).
        var correct = 0, totalQ = 0;
        for (final r in rs) {
          final s = _scale(r.pct, r.total * 4);
          per[r.kind] = '$s/${r.total * 4}';
          correct += r.correct;
          totalQ += r.total;
        }
        final score = totalQ == 0 ? 0 : (correct * 200 / totalQ).round();
        return ExamScore(
          perSection: per,
          overall: '$score/200',
          passed: score >= scoring.passMark,
        );
      case ExamScoring.jlptN5:
      case ExamScoring.jlptN4:
      case ExamScoring.jlptN3:
      case ExamScoring.jlptN2:
      case ExamScoring.jlptN1:
        // Writing bukan bagian JLPT resmi: ditampilkan sendiri, tidak
        // ikut skor 180.
        for (final r in rs) {
          if (r.kind == ExamSectionKind.writing) {
            per[r.kind] = '${r.correct}/${r.total}';
          }
        }
        const lkKinds = [ExamSectionKind.vocab, ExamSectionKind.grammar];
        final li = pctOf(ExamSectionKind.listening);
        final liS = li < 0 ? 0 : _scale(li, 60);
        if (li >= 0) per[ExamSectionKind.listening] = '$liS/60';
        int total;
        bool sectional;
        if (scoring == ExamScoring.jlptN5 || scoring == ExamScoring.jlptN4) {
          // N5/N4: Pengetahuan Bahasa (kosakata+tata bahasa+bacaan) /120.
          final kinds = [...lkKinds, ExamSectionKind.reading];
          final lk = pctOfAll(kinds);
          final lkS = lk < 0 ? 0 : _scale(lk, 120);
          for (final k in kinds) {
            if (pctOf(k) >= 0) per[k] = '$lkS/120';
          }
          total = lkS + liS;
          sectional = lkS >= 38 && liS >= 19;
        } else {
          final lk = pctOfAll(lkKinds);
          final rd = pctOf(ExamSectionKind.reading);
          final lkS = lk < 0 ? 0 : _scale(lk, 60);
          final rdS = rd < 0 ? 0 : _scale(rd, 60);
          for (final k in lkKinds) {
            if (pctOf(k) >= 0) per[k] = '$lkS/60';
          }
          if (rd >= 0) per[ExamSectionKind.reading] = '$rdS/60';
          total = lkS + rdS + liS;
          sectional = lkS >= 19 && rdS >= 19 && liS >= 19;
        }
        return ExamScore(
          perSection: per,
          overall: '$total/180',
          passed: sectional && total >= scoring.passMark,
        );
    }
  }
}
