import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_strings.dart';
import '../../models/exercise.dart';
import '../../providers/settings_provider.dart';
import '../../theme.dart';

/// Soal susun token: scramble (huruf) dan sentenceBuild (kata).
class TokenExercise extends StatefulWidget {
  final Exercise exercise;
  final bool locked;
  final ValueChanged<String> onAnswer;

  const TokenExercise({
    super.key,
    required this.exercise,
    required this.locked,
    required this.onAnswer,
  });

  @override
  State<TokenExercise> createState() => _TokenExerciseState();
}

class _TokenExerciseState extends State<TokenExercise> {
  // Indeks token (ke exercise.options) yang sudah dipilih, berurutan.
  final List<int> _picked = [];

  bool get _isScramble => widget.exercise.type == ExerciseType.scramble;

  String get _joined {
    final parts =
        _picked.map((i) => widget.exercise.options[i]).toList();
    return parts.join(_isScramble ? '' : ' ');
  }

  void _notify() => widget.onAnswer(_joined);

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final ex = widget.exercise;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          _isScramble ? l.t('unscramble') : l.t('build_sentence'),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (ex.word != null &&
                context.watch<SettingsProvider>().showIcons)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child:
                    Text(ex.word!.emoji, style: const TextStyle(fontSize: 28)),
              ),
            Flexible(
              child: Text(
                ex.prompt,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Area jawaban
        Container(
          constraints: const BoxConstraints(minHeight: 64),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Theme.of(context).dividerColor, width: 2),
              bottom:
                  BorderSide(color: Theme.of(context).dividerColor, width: 2),
            ),
          ),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final i in _picked)
                _TokenChip(
                  label: ex.options[i],
                  onTap: widget.locked
                      ? null
                      : () {
                          setState(() => _picked.remove(i));
                          _notify();
                        },
                ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Bank token
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            for (var i = 0; i < ex.options.length; i++)
              _picked.contains(i)
                  ? _TokenChip(
                      label: ex.options[i],
                      ghost: true,
                      onTap: null,
                    )
                  : _TokenChip(
                      label: ex.options[i],
                      onTap: widget.locked
                          ? null
                          : () {
                              HapticFeedback.selectionClick();
                              setState(() => _picked.add(i));
                              _notify();
                            },
                    ),
          ],
        ),
        if (isDark) const SizedBox.shrink(),
      ],
    );
  }
}

class _TokenChip extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool ghost;

  const _TokenChip({required this.label, this.onTap, this.ghost = false});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final border =
        isDark ? const Color(0xFF37464F) : const Color(0xFFE5E5E5);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: ghost
              ? border
              : (isDark ? const Color(0xFF1B2A32) : Colors.white),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: border, width: 2),
          boxShadow: ghost
              ? null
              : [BoxShadow(color: border, offset: const Offset(0, 2))],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: ghost
                ? Colors.transparent
                : (isDark ? Colors.white : DuoColors.eel),
          ),
        ),
      ),
    );
  }
}
