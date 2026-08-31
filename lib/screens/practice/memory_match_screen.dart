import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../providers/progress_provider.dart';
import '../../providers/settings_provider.dart';
import '../../theme.dart';
import '../../widgets/duo_button.dart';
import '../../widgets/duo_dialog.dart';
import '../../widgets/study/study_background.dart';

class _MemCard {
  final String wordKey; // kunci pasangan
  final String display;
  const _MemCard(this.wordKey, this.display);
}

class MemoryMatchScreen extends StatefulWidget {
  final Course course;
  const MemoryMatchScreen({super.key, required this.course});

  @override
  State<MemoryMatchScreen> createState() => _MemoryMatchScreenState();
}

class _MemoryMatchScreenState extends State<MemoryMatchScreen> {
  static const pairCount = 6;

  late List<_MemCard> _cards;
  final Set<int> _matched = {};
  int? _first;
  int? _second;
  int _moves = 0;
  bool _busy = false;
  bool _done = false;

  @override
  void initState() {
    super.initState();
    _setup();
  }

  void _setup() {
    final uiLang = context.read<SettingsProvider>().uiLang;
    final words = List<WordItem>.from(widget.course.allWords)
      ..shuffle(Random());
    final picked = words.take(pairCount).toList();
    _cards = [
      for (final w in picked) ...[
        _MemCard(w.target, w.target),
        _MemCard(w.target, w.meaningFor(uiLang)),
      ],
    ]..shuffle(Random());
    _matched.clear();
    _first = null;
    _second = null;
    _moves = 0;
    _busy = false;
    _done = false;
  }

  void _tap(int index) {
    if (_busy ||
        _done ||
        _matched.contains(index) ||
        index == _first) {
      return;
    }
    HapticFeedback.selectionClick();
    if (_first == null) {
      setState(() => _first = index);
      return;
    }
    setState(() {
      _second = index;
      _moves++;
    });
    if (_cards[_first!].wordKey == _cards[index].wordKey) {
      setState(() {
        _matched.addAll([_first!, index]);
        _first = null;
        _second = null;
      });
      if (_matched.length == _cards.length) {
        _done = true;
        context.read<ProgressProvider>().reportMemoryGame(_moves);
        Timer(const Duration(milliseconds: 400), _showResult);
      }
    } else {
      _busy = true;
      Timer(const Duration(milliseconds: 700), () {
        if (!mounted) return;
        setState(() {
          _first = null;
          _second = null;
          _busy = false;
        });
      });
    }
  }

  Future<void> _showResult() async {
    if (!mounted) return;
    final l = L.read(context);
    final progress = context.read<ProgressProvider>();
    final choice = await showDuoDialog<String>(
      context,
      dismissible: false,
      emoji: '🧩',
      color: DuoColors.purple,
      title: l.t('pairs_found'),
      message:
          '${l.t('moves')}: $_moves\n${l.t('best')}: ${progress.bestMemoryMoves}\n+5 XP ⚡',
      actions: [
        DuoDialogAction(
            label: l.t('play_again'), value: 'again', primary: true),
        DuoDialogAction(label: l.t('ok'), value: 'close'),
      ],
    );
    if (!mounted) return;
    if (choice == 'again') {
      setState(_setup);
    } else if (choice == 'close') {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return StudyScaffold(
      appBar: AppBar(
        title: Text(l.t('memory_game')),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                '${l.t('moves')}: $_moves',
                style: const TextStyle(
                    fontWeight: FontWeight.w800, color: DuoColors.purple),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.85,
                ),
                itemCount: _cards.length,
                itemBuilder: (_, i) {
                  final revealed = _matched.contains(i) ||
                      _first == i ||
                      _second == i;
                  final matched = _matched.contains(i);
                  return GestureDetector(
                    onTap: () => _tap(i),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        color: matched
                            ? DuoColors.green.withValues(alpha: 0.15)
                            : revealed
                                ? (isDark
                                    ? const Color(0xFF1B2A32)
                                    : Colors.white)
                                : DuoColors.purple,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: matched
                              ? DuoColors.green
                              : revealed
                                  ? DuoColors.blue
                                  : DuoColors.purple,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: matched
                                ? DuoColors.greenDark
                                    .withValues(alpha: 0.4)
                                : revealed
                                    ? DuoColors.blueDark
                                        .withValues(alpha: 0.3)
                                    : const Color(0xFF9E5BC8),
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(6),
                      child: revealed
                          ? Text(
                              _cards[i].display,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: isDark
                                    ? Colors.white
                                    : DuoColors.eel,
                              ),
                            )
                          : const Text('❓',
                              style: TextStyle(fontSize: 26)),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            DuoButton(
              label: l.t('play_again'),
              color: DuoColors.purple,
              onPressed: () => setState(_setup),
            ),
          ],
        ),
      ),
    );
  }
}
