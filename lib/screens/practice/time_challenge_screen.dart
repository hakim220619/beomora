import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../models/exercise.dart';
import '../../providers/progress_provider.dart';
import '../../providers/settings_provider.dart';
import '../../services/exercise_generator.dart';
import '../../theme.dart';
import '../../widgets/choice_card.dart';
import '../../widgets/duo_button.dart';
import '../../widgets/study/study_background.dart';
import '../../widgets/study/pencil_progress_bar.dart';

class TimeChallengeScreen extends StatefulWidget {
  final Course course;
  const TimeChallengeScreen({super.key, required this.course});

  @override
  State<TimeChallengeScreen> createState() => _TimeChallengeScreenState();
}

class _TimeChallengeScreenState extends State<TimeChallengeScreen> {
  static const totalSeconds = 60;

  final _generator = ExerciseGenerator();
  Timer? _timer;
  int _secondsLeft = totalSeconds;
  int _score = 0;
  bool _running = false;
  bool _finished = false;
  Exercise? _question;
  String? _picked; // jawaban yang barusan ditap (untuk warna feedback)
  bool _locked = false;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _uiLang => context.read<SettingsProvider>().uiLang;

  void _start() {
    setState(() {
      _running = true;
      _finished = false;
      _score = 0;
      _secondsLeft = totalSeconds;
      _nextQuestion();
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_secondsLeft <= 1) {
        t.cancel();
        _end();
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  void _nextQuestion() {
    _question = _generator.randomChoice(widget.course, _uiLang);
    _picked = null;
    _locked = false;
  }

  void _answer(String option) {
    if (_locked || _question == null) return;
    _locked = true;
    final correct = option == _question!.answer;
    if (correct) {
      HapticFeedback.lightImpact();
      _score++;
    } else {
      HapticFeedback.heavyImpact();
    }
    setState(() => _picked = option);
    Timer(Duration(milliseconds: correct ? 350 : 800), () {
      if (mounted && _running) setState(_nextQuestion);
    });
  }

  void _end() {
    _running = false;
    _finished = true;
    context.read<ProgressProvider>().reportTimeChallenge(_score);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final progress = context.watch<ProgressProvider>();

    return StudyScaffold(
      appBar: AppBar(title: Text(l.t('time_challenge'))),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: !_running
            ? _buildIdle(l, progress)
            : _buildGame(l),
      ),
    );
  }

  Widget _buildIdle(L l, ProgressProvider progress) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(_finished ? '⏰' : '⏱️',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 72)),
        const SizedBox(height: 16),
        Text(
          _finished ? l.t('time_up') : l.t('time_desc'),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 12),
        if (_finished) ...[
          Text(
            '${l.t('score')}: $_score  (+$_score XP ⚡)',
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: DuoColors.orange),
          ),
          const SizedBox(height: 4),
        ],
        Text(
          '${l.t('best')}: ${progress.bestTimeChallenge}',
          textAlign: TextAlign.center,
          style: TextStyle(color: Theme.of(context).hintColor),
        ),
        const SizedBox(height: 32),
        DuoButton(
          label: _finished ? l.t('play_again') : l.t('start_lesson'),
          color: DuoColors.orange,
          onPressed: _start,
        ),
      ],
    );
  }

  Widget _buildGame(L l) {
    final q = _question!;
    final urgent = _secondsLeft <= 10;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '⏱ $_secondsLeft s',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: urgent ? DuoColors.red : DuoColors.orange,
              ),
            ),
            Text(
              '${l.t('score')}: $_score',
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: DuoColors.green),
            ),
          ],
        ),
        const SizedBox(height: 8),
        PencilProgressBar(
          value: _secondsLeft / totalSeconds,
          height: 12,
          color: urgent ? DuoColors.red : DuoColors.orange,
        ),
        const SizedBox(height: 28),
        Text(
          q.prompt,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
        ),
        if (q.promptSub != null)
          Text(
            q.promptSub!,
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).hintColor),
          ),
        const SizedBox(height: 24),
        Expanded(
          child: ListView(
            children: [
              for (final option in q.options) ...[
                ChoiceCard(
                  label: option,
                  compact: true,
                  state: _picked == null
                      ? ChoiceState.idle
                      : option == q.answer
                          ? ChoiceState.correct
                          : option == _picked
                              ? ChoiceState.wrong
                              : ChoiceState.disabled,
                  onTap: () => _answer(option),
                ),
                const SizedBox(height: 10),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
