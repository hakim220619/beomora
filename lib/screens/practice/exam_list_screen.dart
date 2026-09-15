import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/exam_blueprints.dart';
import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../models/exam.dart';
import '../../providers/progress_provider.dart';
import '../../theme.dart';
import '../../widgets/duo_button.dart';
import '../../widgets/study/study_background.dart';
import '../premium_screen.dart';
import 'exam_screen.dart';

/// Label bagian ujian sesuai bahasa UI.
String examSectionLabel(L l, ExamSectionKind kind) => l.t(switch (kind) {
  ExamSectionKind.vocab => 'exam_section_vocab',
  ExamSectionKind.grammar => 'exam_section_grammar',
  ExamSectionKind.reading => 'exam_section_reading',
  ExamSectionKind.listening => 'exam_section_listening',
  ExamSectionKind.writing => 'exam_section_writing',
});

String examSectionEmoji(ExamSectionKind kind) => switch (kind) {
  ExamSectionKind.vocab => '📚',
  ExamSectionKind.grammar => '🧩',
  ExamSectionKind.reading => '📖',
  ExamSectionKind.listening => '🎧',
  ExamSectionKind.writing => '✍️',
};

/// Pemilih ujian: TOEFL/IELTS/PTE (Inggris) atau JLPT N5–N1 (Jepang).
/// Tiap kartu menampilkan jumlah soal, durasi, dan hasil terbaik.
class ExamListScreen extends StatelessWidget {
  final Course course;

  const ExamListScreen({super.key, required this.course});

  static const _accent = [
    DuoColors.purple,
    DuoColors.blue,
    DuoColors.green,
    DuoColors.orange,
    DuoColors.red,
  ];

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final progress = context.watch<ProgressProvider>();
    final exams = examsFor(course.id);

    return StudyScaffold(
      appBar: AppBar(title: Text(l.t('exam_title'))),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          Text(
            l.t('exam_pick'),
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).hintColor),
          ),
          const SizedBox(height: 14),
          for (var i = 0; i < exams.length; i++)
            _ExamCard(
              exam: exams[i],
              color: _accent[i % _accent.length],
              best: progress.examBest[exams[i].id],
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) =>
                      ExamIntroScreen(course: course, exam: exams[i]),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ExamCard extends StatelessWidget {
  final ExamBlueprint exam;
  final Color color;
  final Map<String, dynamic>? best;
  final VoidCallback onTap;

  const _ExamCard({
    required this.exam,
    required this.color,
    required this.best,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final hint = Theme.of(context).hintColor;
    final bestLabel = best?['label'] as String?;
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(exam.emoji, style: const TextStyle(fontSize: 28)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exam.title[l.code] ?? exam.title['id']!,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      exam.subtitle[l.code] ?? exam.subtitle['id']!,
                      style: TextStyle(fontSize: 12, color: hint),
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: [
                        _Chip(
                          '${exam.totalQuestions} ${l.t('exam_questions')}',
                          color,
                        ),
                        _Chip(
                          '${exam.totalMinutes} ${l.t('exam_minutes')}',
                          color,
                        ),
                        if (bestLabel != null)
                          _Chip(
                            '🏅 ${l.t('exam_best')}: $bestLabel',
                            DuoColors.yellow,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: hint),
            ],
          ),
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String text;
  final Color color;
  const _Chip(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w800,
          color: color,
        ),
      ),
    );
  }
}

/// Halaman pembuka satu ujian: struktur bagian, aturan, hasil terbaik,
/// lalu tombol mulai. Pengguna gratis hanya bisa ujian mini
/// ([kFreeExamQuestions] soal campur); ujian penuh untuk Premium.
class ExamIntroScreen extends StatelessWidget {
  final Course course;
  final ExamBlueprint exam;

  const ExamIntroScreen({super.key, required this.course, required this.exam});

  void _start(BuildContext context, {required bool mini}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ExamScreen(course: course, exam: exam, mini: mini),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final progress = context.watch<ProgressProvider>();
    final premium = progress.premiumActive;
    final hint = Theme.of(context).hintColor;
    final best = progress.examBest[exam.id];
    final listening = exam.section(ExamSectionKind.listening);
    final isJlpt = exam.scoring.isJlpt;

    return StudyScaffold(
      appBar: AppBar(title: Text(exam.title[l.code] ?? exam.title['id']!)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(exam.emoji, style: const TextStyle(fontSize: 48)),
                  const SizedBox(height: 8),
                  Text(
                    '${exam.totalQuestions} ${l.t('exam_questions')} · '
                    '${exam.totalMinutes} ${l.t('exam_minutes')}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: hint,
                    ),
                  ),
                  if (best != null) ...[
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: DuoColors.yellow.withValues(alpha: 0.16),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '🏅 ${l.t('exam_best')}: ${best['label']} '
                        '(${best['pct']}%) · ${best['date']}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          _SectionTitle(l.t('exam_structure')),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  for (final s in exam.sections)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          Text(
                            examSectionEmoji(s.kind),
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              examSectionLabel(l, s.kind) +
                                  (isJlpt && s.kind == ExamSectionKind.writing
                                      ? ' *'
                                      : ''),
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Text(
                            '${s.questionCount} ${l.t('exam_questions')}',
                            style: TextStyle(color: hint, fontSize: 13),
                          ),
                          const SizedBox(width: 12),
                          SizedBox(
                            width: 64,
                            child: Text(
                              '${s.minutes} ${l.t('exam_minutes')}',
                              textAlign: TextAlign.right,
                              style: TextStyle(color: hint, fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          _SectionTitle(l.t('exam_rules_title')),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Rule('⏱️', l.t('exam_rule_timer')),
                  _Rule('🙈', l.t('exam_rule_feedback')),
                  if (listening != null && listening.maxPlays > 0)
                    _Rule(
                      '🎧',
                      l
                          .t('exam_rule_audio')
                          .replaceFirst('{n}', '${listening.maxPlays}'),
                    ),
                  _Rule(
                    '✍️',
                    isJlpt
                        ? '* ${l.t('exam_jlpt_writing_note')}'
                        : l.t('exam_writing_note'),
                  ),
                  if (!isJlpt) _Rule('🗣️', l.t('exam_speaking_note')),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          if (premium)
            DuoButton(
              label: l.t('exam_start_full'),
              color: DuoColors.purple,
              onPressed: () => _start(context, mini: false),
            )
          else ...[
            DuoButton(
              label: l
                  .t('exam_start_mini')
                  .replaceFirst('{n}', '$kFreeExamQuestions'),
              color: DuoColors.purple,
              onPressed: () => _start(context, mini: true),
            ),
            const SizedBox(height: 12),
            InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const PremiumScreen())),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: DuoColors.yellow.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: DuoColors.yellow, width: 1.5),
                ),
                child: Row(
                  children: [
                    const Text('👑', style: TextStyle(fontSize: 22)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        l
                            .t('exam_premium_hint')
                            .replaceFirst('{n}', '$kFreeExamQuestions'),
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const Icon(Icons.chevron_right_rounded),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
  );
}

class _Rule extends StatelessWidget {
  final String emoji;
  final String text;
  const _Rule(this.emoji, this.text);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(emoji, style: const TextStyle(fontSize: 16)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(text, style: const TextStyle(fontSize: 13, height: 1.35)),
        ),
      ],
    ),
  );
}
