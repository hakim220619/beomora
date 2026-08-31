import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../models/exercise.dart';
import '../../providers/progress_provider.dart';
import '../../providers/settings_provider.dart';
import '../../services/exercise_generator.dart';
import '../../services/tts_service.dart';
import '../../theme.dart';
import '../../widgets/duo_button.dart';
import '../../widgets/duo_dialog.dart';
import '../../widgets/exercises/choice_exercise.dart';
import '../../widgets/exercises/matching_exercise.dart';
import '../../widgets/exercises/token_exercise.dart';
import '../../widgets/exercises/typing_exercise.dart';
import '../../widgets/study/study_background.dart';
import '../../widgets/study/pencil_progress_bar.dart';
import 'lesson_complete_screen.dart';

enum _CheckResult { correct, almost, wrong }

/// Layar pengerjaan soal — dipakai untuk pelajaran biasa dan latihan bebas.
class LessonScreen extends StatefulWidget {
  final Course course;
  final Lesson? lesson; // null saat latihan bebas
  final bool isPractice;

  const LessonScreen({
    super.key,
    required this.course,
    this.lesson,
  }) : isPractice = lesson == null;

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late final List<Exercise> _queue;
  final Set<Exercise> _requeued = {};
  int _index = 0;
  String _pendingAnswer = '';
  _CheckResult? _result;
  int _mistakes = 0;

  Exercise get _current => _queue[_index];

  @override
  void initState() {
    super.initState();
    final uiLang = context.read<SettingsProvider>().uiLang;
    final generator = ExerciseGenerator();
    if (widget.isPractice) {
      final progress = context.read<ProgressProvider>();
      final learned =
          progress.masteredWords[widget.course.id] ?? <String>{};
      _queue = generator.freePractice(widget.course, learned, uiLang);
    } else {
      _queue = generator.forLesson(widget.course, widget.lesson!, uiLang);
    }
  }

  @override
  void dispose() {
    TtsService.instance.stop();
    super.dispose();
  }

  // ---------- Alur soal ----------

  void _check() {
    final ex = _current;
    final progress = context.read<ProgressProvider>();

    final int grade;
    if (ex.type == ExerciseType.typing) {
      grade = AnswerGrader.grade(_pendingAnswer, ex.answer);
    } else {
      grade = _pendingAnswer.trim() == ex.answer ? 2 : 0;
    }

    final correct = grade > 0;
    progress.recordAnswer(correct);

    if (correct) {
      HapticFeedback.lightImpact();
      if (ex.ttsText != null) {
        TtsService.instance.speak(ex.ttsText!, widget.course.ttsLocale);
      }
    } else {
      HapticFeedback.heavyImpact();
      _mistakes++;
      if (!widget.isPractice) {
        progress.loseHeart();
        if (progress.hearts <= 0) {
          setState(() => _result = _CheckResult.wrong);
          _showFailedDialog();
          return;
        }
      }
      // Soal yang salah diulang lagi di akhir (sekali saja).
      if (!_requeued.contains(ex)) {
        _requeued.add(ex);
        _queue.add(ex);
      }
    }

    setState(() {
      _result = switch (grade) {
        2 => _CheckResult.correct,
        1 => _CheckResult.almost,
        _ => _CheckResult.wrong,
      };
    });
  }

  void _continue() {
    if (_index + 1 >= _queue.length) {
      _finish();
      return;
    }
    setState(() {
      _index++;
      _pendingAnswer = '';
      _result = null;
    });
  }

  void _finish() {
    final progress = context.read<ProgressProvider>();
    final LessonReward reward;
    bool heartRestored = false;

    if (widget.isPractice) {
      final xp = progress.completePractice();
      heartRestored = true;
      reward = LessonReward(
        xp: xp,
        gems: 0,
        perfect: _mistakes == 0,
        newAchievements: const [],
      );
    } else {
      reward = progress.completeLesson(
        courseId: widget.course.id,
        lessonId: widget.lesson!.id,
        wordTargets:
            widget.lesson!.words.map((w) => w.target).toList(),
        perfect: _mistakes == 0,
        firstTime: !progress.isLessonCompleted(
            widget.course.id, widget.lesson!.id),
      );
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => LessonCompleteScreen(
          reward: reward,
          mistakes: _mistakes,
          totalExercises: _queue.length,
          heartRestored: heartRestored,
        ),
      ),
    );
  }

  Future<void> _showFailedDialog() async {
    final l = L.read(context);
    await showDuoDialog<void>(
      context,
      dismissible: false,
      emoji: '💔',
      color: DuoColors.red,
      title: l.t('no_hearts_title'),
      message: l.t('lesson_failed'),
      actions: [
        DuoDialogAction(label: l.t('ok'), primary: true),
      ],
    );
    if (mounted) Navigator.of(context).pop();
  }

  Future<void> _confirmQuit() async {
    final l = L.read(context);
    // Tombol utama = tetap belajar; keluar hanya lewat tombol merah.
    final quit = await showDuoDialog<bool>(
      context,
      emoji: '✋',
      color: DuoColors.orange,
      title: l.t('quit_title'),
      message: l.t('quit_msg'),
      actions: [
        DuoDialogAction(
            label: l.t('stay'),
            value: false,
            primary: true,
            color: DuoColors.green),
        DuoDialogAction(
            label: l.t('quit'), value: true, color: DuoColors.red),
      ],
    );
    if (quit == true && mounted) Navigator.of(context).pop();
  }

  // ---------- UI ----------

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final progress = context.watch<ProgressProvider>();
    final ex = _current;
    final isMatching = ex.type == ExerciseType.matching;
    final isNewWord = ex.word != null &&
        !(progress.masteredWords[widget.course.id]
                ?.contains(ex.word!.target) ??
            false);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _confirmQuit();
      },
      child: StudyScaffold(
        body: SafeArea(
          child: Column(
            children: [
              // Bar atas: keluar, progres, nyawa
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: _confirmQuit,
                      icon: Icon(Icons.close_rounded,
                          color: Theme.of(context).hintColor),
                    ),
                    Expanded(
                      child: PencilProgressBar(
                        value: _index / _queue.length,
                        height: 16,
                        color: DuoColors.green,
                        showPencil: true,
                      ),
                    ),
                    const SizedBox(width: 10),
                    if (!widget.isPractice) ...[
                      const Text('❤️', style: TextStyle(fontSize: 18)),
                      const SizedBox(width: 2),
                      Text(
                        '${progress.hearts}',
                        style: const TextStyle(
                          color: DuoColors.red,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              // Badan soal
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (isNewWord && !isMatching)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color:
                                  DuoColors.purple.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '✨ ${l.t('new_word')}',
                              style: const TextStyle(
                                color: DuoColors.purple,
                                fontWeight: FontWeight.w800,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      _buildExercise(ex),
                    ],
                  ),
                ),
              ),
              _buildBottom(l, ex, isMatching),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExercise(Exercise ex) {
    final key = ValueKey('$_index-${ex.hashCode}');
    switch (ex.type) {
      case ExerciseType.multipleChoice:
      case ExerciseType.reverseChoice:
      case ExerciseType.listening:
        return ChoiceExercise(
          key: key,
          exercise: ex,
          ttsLocale: widget.course.ttsLocale,
          locked: _result != null,
          onAnswer: (a) => setState(() => _pendingAnswer = a),
        );
      case ExerciseType.typing:
        return TypingExercise(
          key: key,
          exercise: ex,
          ttsLocale: widget.course.ttsLocale,
          locked: _result != null,
          onAnswer: (a) => setState(() => _pendingAnswer = a),
        );
      case ExerciseType.scramble:
      case ExerciseType.sentenceBuild:
        return TokenExercise(
          key: key,
          exercise: ex,
          locked: _result != null,
          onAnswer: (a) => setState(() => _pendingAnswer = a),
        );
      case ExerciseType.matching:
        return MatchingExercise(
          key: key,
          exercise: ex,
          onSolved: () {
            context.read<ProgressProvider>().recordAnswer(true);
            setState(() => _result = _CheckResult.correct);
          },
        );
    }
  }

  Widget _buildBottom(L l, Exercise ex, bool isMatching) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Color panelColor = Colors.transparent;
    Color panelBorder = Colors.transparent;
    String message = '';
    Color messageColor = DuoColors.green;
    if (_result == _CheckResult.correct) {
      panelColor = isDark ? const Color(0xF00E3D36) : const Color(0xFFCFF7EC);
      panelBorder = DuoColors.green;
      message = l.t('correct');
      messageColor = isDark ? const Color(0xFF7DF0D8) : DuoColors.greenDark;
    } else if (_result == _CheckResult.almost) {
      panelColor = isDark ? const Color(0xF03A2F10) : const Color(0xFFFFF3C9);
      panelBorder = DuoColors.yellow;
      message = l.t('almost');
      messageColor = DuoColors.orange;
    } else if (_result == _CheckResult.wrong) {
      panelColor = isDark ? const Color(0xF0431C22) : const Color(0xFFFFE1E2);
      panelBorder = DuoColors.red;
      message = l.t('wrong');
      messageColor = DuoColors.red;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: panelColor,
        borderRadius: _result == null
            ? null
            : const BorderRadius.vertical(top: Radius.circular(24)),
        border: _result == null
            ? null
            : Border.all(color: panelBorder, width: 2),
      ),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_result != null) ...[
            Row(
              children: [
                Icon(
                  _result == _CheckResult.wrong
                      ? Icons.cancel_rounded
                      : Icons.check_circle_rounded,
                  color: messageColor,
                  size: 28,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    message,
                    style: TextStyle(
                      color: messageColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
            if (_result == _CheckResult.wrong && ex.answer.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 36, top: 4, bottom: 4),
                child: Text(
                  '${l.t('correct_answer')} ${ex.answer}',
                  style: TextStyle(color: messageColor, fontSize: 15),
                ),
              ),
            const SizedBox(height: 12),
          ],
          if (_result == null)
            DuoButton(
              label: l.t('check_btn'),
              onPressed: (isMatching || _pendingAnswer.trim().isEmpty)
                  ? null
                  : _check,
            )
          else
            DuoButton(
              label: l.t('continue_btn'),
              color: _result == _CheckResult.wrong
                  ? DuoColors.red
                  : DuoColors.green,
              onPressed: _continue,
            ),
        ],
      ),
    );
  }
}
