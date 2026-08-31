import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../l10n/app_strings.dart';
import '../../models/exercise.dart';
import '../choice_card.dart';

/// Soal mencocokkan pasangan kata ↔ arti. Selesai otomatis
/// saat semua pasangan ketemu; salah cocok tidak mengurangi nyawa.
class MatchingExercise extends StatefulWidget {
  final Exercise exercise;
  final VoidCallback onSolved;

  const MatchingExercise({
    super.key,
    required this.exercise,
    required this.onSolved,
  });

  @override
  State<MatchingExercise> createState() => _MatchingExerciseState();
}

class _MatchingExerciseState extends State<MatchingExercise> {
  late final List<String> _lefts;
  late final List<String> _rights;
  final Set<String> _matchedLefts = {};
  String? _selectedLeft;
  String? _errorLeft;
  String? _errorRight;

  @override
  void initState() {
    super.initState();
    final rng = Random();
    _lefts = widget.exercise.pairs.map((p) => p.left).toList()..shuffle(rng);
    _rights = widget.exercise.pairs.map((p) => p.right).toList()
      ..shuffle(rng);
  }

  String _rightFor(String left) =>
      widget.exercise.pairs.firstWhere((p) => p.left == left).right;

  void _tapLeft(String left) {
    if (_matchedLefts.contains(left)) return;
    setState(() {
      _selectedLeft = left;
      _errorLeft = null;
      _errorRight = null;
    });
  }

  void _tapRight(String right) {
    if (_selectedLeft == null) return;
    if (widget.exercise.pairs
        .any((p) => p.right == right && _matchedLefts.contains(p.left))) {
      return;
    }
    if (_rightFor(_selectedLeft!) == right) {
      HapticFeedback.lightImpact();
      setState(() {
        _matchedLefts.add(_selectedLeft!);
        _selectedLeft = null;
      });
      if (_matchedLefts.length == widget.exercise.pairs.length) {
        widget.onSolved();
      }
    } else {
      HapticFeedback.heavyImpact();
      setState(() {
        _errorLeft = _selectedLeft;
        _errorRight = right;
        _selectedLeft = null;
      });
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          setState(() {
            _errorLeft = null;
            _errorRight = null;
          });
        }
      });
    }
  }

  ChoiceState _leftState(String left) {
    if (_matchedLefts.contains(left)) return ChoiceState.correct;
    if (_errorLeft == left) return ChoiceState.wrong;
    if (_selectedLeft == left) return ChoiceState.selected;
    return ChoiceState.idle;
  }

  ChoiceState _rightState(String right) {
    final matched = widget.exercise.pairs
        .any((p) => p.right == right && _matchedLefts.contains(p.left));
    if (matched) return ChoiceState.correct;
    if (_errorRight == right) return ChoiceState.wrong;
    return ChoiceState.idle;
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l.t('match_pairs'),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  for (final left in _lefts) ...[
                    ChoiceCard(
                      label: left,
                      compact: true,
                      state: _leftState(left),
                      onTap: () => _tapLeft(left),
                    ),
                    const SizedBox(height: 10),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                children: [
                  for (final right in _rights) ...[
                    ChoiceCard(
                      label: right,
                      compact: true,
                      state: _rightState(right),
                      onTap: () => _tapRight(right),
                    ),
                    const SizedBox(height: 10),
                  ],
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
