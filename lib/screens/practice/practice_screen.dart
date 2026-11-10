import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/exam_blueprints.dart';
import '../../data/handwriting_bank.dart';
import '../../data/listening_bank.dart';
import '../../models/listening.dart';
import '../../data/mcq_packs.dart';
import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../providers/progress_provider.dart';
import '../../services/exercise_generator.dart';
import '../../providers/settings_provider.dart';
import '../../services/handwriting_service.dart';
import '../../services/speech_scorer.dart';
import '../../theme.dart';
import '../../widgets/duo_button.dart';
import '../lesson/lesson_screen.dart';
import 'exam_list_screen.dart';
import 'handwriting_activation.dart';
import 'handwriting_screen.dart';
import 'quiz_setup_screen.dart';
import 'letter_quiz_screen.dart';
import 'listening_pack_screen.dart';
import 'mcq_pack_screen.dart';
import 'speaking_screen.dart';
import 'time_challenge_screen.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final progress = context.watch<ProgressProvider>();
    final courses = context.read<List<Course>>();
    final course = courses.firstWhere(
      (c) => c.id == progress.activeCourseId,
      orElse: () => courses.first,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: Text(l.t('practice_title'))),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 110),
        children: [
          // Kartu Kilat & Memory Match dikeluarkan dari Ruang Latihan
          // (FlashcardsScreen & MemoryMatchScreen tetap ada di kode bila
          // ingin dipasang lagi).
          // Jepang: Tebak Huruf diganti tiga kuis racikan dengan jumlah
          // soal bebas (Kana Campur, Kanji, Kata). Paket Tebak Huruf
          // tetap bisa dibuka dari halaman Materi.
          if (course.id == 'ja') ...[
            _GameCard(
              emoji: '🔀',
              color: DuoColors.blue,
              title: l.t('kana_mix_title'),
              subtitle: l.t('kana_mix_desc'),
              onTap: () => _push(context, KanaMixScreen(course: course)),
            ),
            _GameCard(
              emoji: '漢',
              color: DuoColors.red,
              title: l.t('kanji_quiz_title'),
              subtitle: l.t('kanji_quiz_desc'),
              trailing: progress.premiumActive
                  ? null
                  : '👑 ${l.t('quiz_free_badge').replaceFirst('{n}', '$kFreeMcqLimit')}',
              onTap: () => _push(context, KanjiQuizScreen(course: course)),
            ),
            _GameCard(
              emoji: '📖',
              color: DuoColors.green,
              title: l.t('word_quiz_title'),
              subtitle: l.t('word_quiz_desc'),
              trailing: progress.premiumActive
                  ? null
                  : '👑 ${l.t('quiz_free_badge').replaceFirst('{n}', '$kFreeMcqLimit')}',
              onTap: () => _push(context, WordQuizScreen(course: course)),
            ),
          ] else
            _GameCard(
              emoji: '🔤',
              color: DuoColors.red,
              title: l.t('letter_quiz'),
              subtitle: l.t('letter_quiz_desc'),
              onTap: () => _push(context, LetterQuizScreen(course: course)),
            ),
          // Korea/Jerman: Tebak Kata dari kosakata inti per kategori.
          if (course.id == 'ko' || course.id == 'de')
            _GameCard(
              emoji: '📖',
              color: DuoColors.green,
              title: l.t('word_quiz_title'),
              subtitle: l.t('word_quiz_desc_${course.id}'),
              trailing: progress.premiumActive
                  ? null
                  : '👑 ${l.t('quiz_free_badge').replaceFirst('{n}', '$kFreeMcqLimit')}',
              onTap: () => _push(context, WordQuizScreen(course: course)),
            ),
          // Tulis Huruf: kanvas tulisan tangan. Kartu selalu tampil;
          // kalau fitur belum aktif / model belum ada, ketuk → alur
          // aktivasi (cek RAM & ruang, unduh model) lalu masuk.
          if (writingCategoriesFor(course.id).isNotEmpty)
            _GameCard(
              emoji: '✍️',
              color: DuoColors.green,
              title: l.t('handwriting_title'),
              subtitle: l.t('handwriting_desc'),
              trailing: progress.premiumActive
                  ? null
                  : '👑 ${l.t('practice_free_handwriting').replaceFirst('{n}', '$kFreeHandwritingQuestions')}',
              onTap: () => _openHandwriting(context, course),
            ),
          // Hanya kursus yang punya bank soal pilihan ganda (ja/en).
          if (mcqPacksFor(course.id).isNotEmpty)
            _GameCard(
              emoji: '📝',
              color: DuoColors.yellow,
              title: l.t('mcq_title'),
              subtitle: l.t('mcq_desc'),
              onTap: () => _push(context, McqPackScreen(course: course)),
            ),
          // Hanya kursus yang punya bank bacaan dengar (ja/en).
          if (listeningPacksFor(course.id).isNotEmpty)
            _GameCard(
              emoji: '🎧',
              color: DuoColors.blue,
              title: l.t('listening_title'),
              subtitle: l.t('listening_desc'),
              trailing: progress.premiumActive
                  ? null
                  : '👑 ${l.t('practice_free_listening').replaceFirst('{n}', '$kFreeListeningPassages')}',
              onTap: () => _push(context, ListeningPackScreen(course: course)),
            ),
          // Latihan Bicara: pengenal suara bawaan HP (ja/en/de/ko).
          if (kSpeakingEnabled && kSpeakingCourses.contains(course.id))
            _GameCard(
              emoji: '🎙️',
              color: DuoColors.orange,
              title: l.t('speaking_title'),
              subtitle: l.t('speaking_desc'),
              trailing: progress.premiumActive
                  ? null
                  : '👑 ${l.t('practice_free_speaking').replaceFirst('{n}', '$kFreeSpeakingUnits')}',
              onTap: () => _push(context, SpeakingScreen(course: course)),
            ),
          // Mode Ujian: simulasi TOEFL/IELTS/PTE (en) & JLPT N5–N1 (ja).
          if (examsFor(course.id).isNotEmpty)
            _GameCard(
              emoji: '🎯',
              color: DuoColors.purple,
              title: l.t('exam_title'),
              subtitle: l.t('exam_desc'),
              trailing: progress.premiumActive
                  ? null
                  : '👑 ${l.t('exam_mini_badge')} $kFreeExamQuestions',
              onTap: () => _push(context, ExamListScreen(course: course)),
            ),
          _GameCard(
            emoji: '⏱️',
            color: DuoColors.orange,
            title: l.t('time_challenge'),
            subtitle: l.t('time_desc'),
            trailing: progress.bestTimeChallenge > 0
                ? '${l.t('best')}: ${progress.bestTimeChallenge}'
                : null,
            onTap: () => _push(context, TimeChallengeScreen(course: course)),
          ),
          _GameCard(
            emoji: '💪',
            color: DuoColors.green,
            title: l.t('free_practice'),
            subtitle: l.t('free_practice_desc'),
            onTap: () => _openFreePractice(context, course),
          ),
        ],
      ),
    );
  }

  Future<void> _openHandwriting(BuildContext context, Course course) async {
    final settings = context.read<SettingsProvider>();
    final language = HandwritingService.languageFor(course.id);
    if (language == null) return;
    // Model sudah terbukti ada di sesi ini → langsung buka. Selain itu,
    // dialog aktivasi tampil seketika dengan loading selagi model dicek
    // (cek native bisa beberapa detik) dan menutup sendiri kalau siap.
    final ready =
        (settings.handwritingOn &&
            HandwritingService.instance.isKnownDownloaded(language)) ||
        await showHandwritingActivation(context, course);
    if (!ready || !context.mounted) return;
    _push(context, HandwritingScreen(course: course));
  }

  /// Latihan Bebas: pilih jumlah soal dulu (minimal 10), lalu mulai.
  Future<void> _openFreePractice(BuildContext context, Course course) async {
    final learned =
        context.read<ProgressProvider>().masteredWords[course.id] ?? <String>{};
    final available = ExerciseGenerator.practicePool(course, learned).length;
    final count = await showModalBottomSheet<int>(
      context: context,
      showDragHandle: true,
      builder: (_) => _FreePracticeSheet(available: available),
    );
    if (count == null || !context.mounted) return;
    _push(context, LessonScreen(course: course, practiceCount: count));
  }

  void _push(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }
}

class _GameCard extends StatelessWidget {
  final String emoji;
  final Color color;
  final String title;
  final String subtitle;
  final String? trailing;
  final VoidCallback onTap;

  const _GameCard({
    required this.emoji,
    required this.color,
    required this.title,
    required this.subtitle,
    this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(emoji, style: const TextStyle(fontSize: 28)),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    if (trailing != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          trailing!,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: color,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: Theme.of(context).hintColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Pilih jumlah soal Latihan Bebas: −/+ dan angka cepat, minimal 10,
/// maksimal 100 atau sebanyak kata yang tersedia (soal tak berulang).
class _FreePracticeSheet extends StatefulWidget {
  /// Kata tersedia untuk latihan (selalu ≥ 10, lihat practicePool).
  final int available;
  const _FreePracticeSheet({required this.available});

  static const minCount = 10;
  static const presets = [10, 15, 20, 30, 50, 100];

  int get maxCount => available.clamp(minCount, 100);

  @override
  State<_FreePracticeSheet> createState() => _FreePracticeSheetState();
}

class _FreePracticeSheetState extends State<_FreePracticeSheet> {
  int _count = _FreePracticeSheet.minCount;

  void _set(int v) => setState(
    () => _count = v.clamp(_FreePracticeSheet.minCount, widget.maxCount),
  );

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '💪 ${l.t('free_practice_count')}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
            ),
            Text(
              l.t('free_practice_min'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.5,
                color: Theme.of(context).hintColor,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filledTonal(
                  onPressed: _count > _FreePracticeSheet.minCount
                      ? () => _set(_count - 5)
                      : null,
                  icon: const Icon(Icons.remove_rounded),
                ),
                SizedBox(
                  width: 110,
                  child: Text(
                    '$_count',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: DuoColors.green,
                    ),
                  ),
                ),
                IconButton.filledTonal(
                  onPressed: _count < widget.maxCount
                      ? () => _set(_count + 5)
                      : null,
                  icon: const Icon(Icons.add_rounded),
                ),
              ],
            ),
            Center(child: Text(l.t('kana_mix_questions'))),
            const SizedBox(height: 4),
            Text(
              l
                  .t('questions_available')
                  .replaceFirst('{n}', '${widget.maxCount}'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).hintColor,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final n in _FreePracticeSheet.presets.where(
                  (n) => n <= widget.maxCount,
                ))
                  ChoiceChip(
                    label: Text(
                      '$n',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: _count == n ? Colors.white : null,
                      ),
                    ),
                    selected: _count == n,
                    showCheckmark: false,
                    selectedColor: DuoColors.green,
                    onSelected: (_) => _set(n),
                  ),
              ],
            ),
            const SizedBox(height: 18),
            DuoButton(
              label: l.t('start_lesson'),
              color: DuoColors.green,
              onPressed: () => Navigator.of(context).pop(_count),
            ),
          ],
        ),
      ),
    );
  }
}
