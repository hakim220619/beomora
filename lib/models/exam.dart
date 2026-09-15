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

  const ExamSection(
    this.kind, {
    required this.questionCount,
    required this.minutes,
    this.maxPlays = 2,
  });

  ExamSection copyWith({int? questionCount, int? minutes}) => ExamSection(
    kind,
    questionCount: questionCount ?? this.questionCount,
    minutes: minutes ?? this.minutes,
    maxPlays: maxPlays,
  );
}

/// Cara mengubah persentase benar menjadi perkiraan skor ujian asli.
enum ExamScoring {
  toefl, // per bagian 0–30
  ielts, // band 1–9
  pte, // 10–90
  jlptN5, // Pengetahuan Bahasa 120 + Choukai 60, lulus 80
  jlptN4, // Pengetahuan Bahasa 120 + Choukai 60, lulus 90
  jlptN3, // 3 × 60, lulus 95
  jlptN2, // 3 × 60, lulus 90
  jlptN1; // 3 × 60, lulus 100

  bool get isJlpt => index >= ExamScoring.jlptN5.index;

  /// Ambang lulus total JLPT (0 untuk ujian tanpa ambang).
  int get passMark => switch (this) {
    ExamScoring.jlptN5 => 80,
    ExamScoring.jlptN4 => 90,
    ExamScoring.jlptN3 => 95,
    ExamScoring.jlptN2 => 90,
    ExamScoring.jlptN1 => 100,
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

  const WritingItem({
    required this.prompt,
    required this.text,
    required this.answers,
    this.hint,
  });

  static String normalize(String s) =>
      s.toLowerCase().replaceAll(RegExp(r"[\s\.,!?;:'’\-—、。「」！？]"), '').trim();

  bool accepts(String input) {
    final n = normalize(input);
    if (n.isEmpty) return false;
    return answers.any((a) => normalize(a) == n);
  }
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
       writing = null;

  ExamItem.typing(this.section, WritingItem w)
    : mcq = null,
      options = const [],
      writing = w,
      passageId = null,
      passageTitle = null,
      passageText = null,
      passageTranslation = null;

  bool get isTyping => writing != null;
  bool get isAudio => section == ExamSectionKind.listening;

  String get correctAnswer =>
      mcq != null ? mcq!.options[mcq!.answer] : writing!.answers.first;

  bool get answered => userAnswer != null && userAnswer!.trim().isNotEmpty;

  bool get correct {
    final a = userAnswer;
    if (a == null) return false;
    if (writing != null) return writing!.accepts(a);
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
        items[i].where((e) => e.correct).length,
        items[i].length,
      ),
  ];

  int get totalCorrect =>
      items.fold(0, (n, l) => n + l.where((e) => e.correct).length);

  List<ExamItem> get missed => [
    for (final l in items)
      for (final e in l)
        if (!e.correct) e,
  ];
}

/// Perkiraan skor resmi dari hasil per bagian.
class ExamScore {
  /// Label skor per bagian (mis. "24/30", "Band 6.5", "48/60").
  final Map<ExamSectionKind, String> perSection;

  /// Skor keseluruhan (mis. "72/90", "Band 6.5", "112/180").
  final String overall;

  /// Hanya JLPT: lulus/tidak (null untuk ujian tanpa ambang lulus).
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

  static ExamScore compute(ExamScoring scoring, List<ExamSectionResult> rs) {
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
        var total = 0, max = 0;
        for (final r in rs) {
          final s = _scale(r.pct, 30);
          per[r.kind] = '$s/30';
          total += s;
          max += 30;
        }
        return ExamScore(perSection: per, overall: '$total/$max');
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
