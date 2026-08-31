import 'package:flutter/material.dart';

import '../../l10n/app_strings.dart';
import '../../models/exercise.dart';
import '../../services/tts_service.dart';
import '../../theme.dart';
import '../choice_card.dart';

/// Soal pilihan ganda: multipleChoice, reverseChoice, dan listening.
class ChoiceExercise extends StatefulWidget {
  final Exercise exercise;
  final String ttsLocale;
  final bool locked;
  final ValueChanged<String> onAnswer;

  const ChoiceExercise({
    super.key,
    required this.exercise,
    required this.ttsLocale,
    required this.locked,
    required this.onAnswer,
  });

  @override
  State<ChoiceExercise> createState() => _ChoiceExerciseState();
}

class _ChoiceExerciseState extends State<ChoiceExercise> {
  String? _selected;

  bool get _isListening => widget.exercise.type == ExerciseType.listening;

  @override
  void initState() {
    super.initState();
    if (_isListening) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _speak());
    }
  }

  void _speak() {
    final text = widget.exercise.ttsText;
    if (text != null) TtsService.instance.speak(text, widget.ttsLocale);
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final ex = widget.exercise;
    final instruction = switch (ex.type) {
      ExerciseType.multipleChoice => l.t('choose_meaning'),
      ExerciseType.reverseChoice => l.t('choose_word'),
      _ => l.t('listen_choose'),
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          instruction,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 20),
        if (_isListening)
          Center(
            child: GestureDetector(
              onTap: _speak,
              child: Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: DuoColors.blue,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(color: DuoColors.blueDark, offset: Offset(0, 4)),
                  ],
                ),
                child: const Icon(Icons.volume_up_rounded,
                    color: Colors.white, size: 48),
              ),
            ),
          )
        else
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (ex.word != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(ex.word!.emoji,
                      style: const TextStyle(fontSize: 32)),
                ),
              Flexible(
                child: Column(
                  children: [
                    Text(
                      ex.prompt,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.w700),
                    ),
                    if (ex.promptSub != null)
                      Text(
                        ex.promptSub!,
                        style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).hintColor),
                      ),
                  ],
                ),
              ),
              if (ex.ttsText != null)
                IconButton(
                  onPressed: _speak,
                  icon: const Icon(Icons.volume_up_rounded,
                      color: DuoColors.blue),
                ),
            ],
          ),
        const SizedBox(height: 24),
        for (final option in ex.options) ...[
          ChoiceCard(
            label: option,
            state: widget.locked
                ? (option == ex.answer
                    ? ChoiceState.correct
                    : (option == _selected
                        ? ChoiceState.wrong
                        : ChoiceState.disabled))
                : (option == _selected
                    ? ChoiceState.selected
                    : ChoiceState.idle),
            onTap: widget.locked
                ? null
                : () {
                    setState(() => _selected = option);
                    widget.onAnswer(option);
                  },
          ),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}
