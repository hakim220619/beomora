import 'package:flutter/material.dart';

import '../../l10n/app_strings.dart';
import '../../models/exercise.dart';
import '../../services/tts_service.dart';
import '../../theme.dart';

/// Soal ketik terjemahan.
class TypingExercise extends StatefulWidget {
  final Exercise exercise;
  final String ttsLocale;
  final bool locked;
  final ValueChanged<String> onAnswer;

  const TypingExercise({
    super.key,
    required this.exercise,
    required this.ttsLocale,
    required this.locked,
    required this.onAnswer,
  });

  @override
  State<TypingExercise> createState() => _TypingExerciseState();
}

class _TypingExerciseState extends State<TypingExercise> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final ex = widget.exercise;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l.t('type_translation'),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (ex.word != null)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child:
                    Text(ex.word!.emoji, style: const TextStyle(fontSize: 32)),
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
                          fontSize: 15, color: Theme.of(context).hintColor),
                    ),
                ],
              ),
            ),
            if (ex.ttsText != null)
              IconButton(
                onPressed: () => TtsService.instance
                    .speak(ex.ttsText!, widget.ttsLocale),
                icon: const Icon(Icons.volume_up_rounded,
                    color: DuoColors.blue),
              ),
          ],
        ),
        const SizedBox(height: 24),
        TextField(
          controller: _controller,
          enabled: !widget.locked,
          autofocus: true,
          autocorrect: false,
          textInputAction: TextInputAction.done,
          onChanged: widget.onAnswer,
          maxLines: 2,
          minLines: 1,
          decoration: InputDecoration(
            hintText: l.t('type_hint'),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide:
                  BorderSide(color: Theme.of(context).dividerColor, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide:
                  BorderSide(color: Theme.of(context).dividerColor, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide:
                  const BorderSide(color: DuoColors.blue, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
