import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../providers/settings_provider.dart';
import '../../services/tts_service.dart';
import '../../theme.dart';
import '../../widgets/study/study_background.dart';

class FlashcardsScreen extends StatefulWidget {
  final Course course;
  const FlashcardsScreen({super.key, required this.course});

  @override
  State<FlashcardsScreen> createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends State<FlashcardsScreen> {
  late final List<WordItem> _words;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _words = List<WordItem>.from(widget.course.allWords)..shuffle(Random());
  }

  @override
  void dispose() {
    TtsService.instance.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final uiLang = context.watch<SettingsProvider>().uiLang;

    return StudyScaffold(
      appBar: AppBar(
        title: Text(l.t('flashcards')),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                '${_page + 1}/${_words.length}',
                style: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: _words.length,
              onPageChanged: (i) => setState(() => _page = i),
              itemBuilder: (_, i) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: _FlipCard(
                  word: _words[i],
                  uiLang: uiLang,
                  ttsLocale: widget.course.ttsLocale,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Text(
              l.t('tap_to_flip'),
              style: TextStyle(color: Theme.of(context).hintColor),
            ),
          ),
        ],
      ),
    );
  }
}

class _FlipCard extends StatefulWidget {
  final WordItem word;
  final String uiLang;
  final String ttsLocale;

  const _FlipCard({
    required this.word,
    required this.uiLang,
    required this.ttsLocale,
  });

  @override
  State<_FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<_FlipCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _flip() {
    if (_ctrl.isAnimating) return;
    _ctrl.value < 0.5 ? _ctrl.forward() : _ctrl.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flip,
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: (_, _) {
          final angle = _ctrl.value * pi;
          final showFront = angle < pi / 2;
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle),
            child: showFront
                ? _face(context, front: true)
                : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateY(pi),
                    child: _face(context, front: false),
                  ),
          );
        },
      ),
    );
  }

  Widget _face(BuildContext context, {required bool front}) {
    final word = widget.word;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = front
        ? DuoColors.blue
        : DuoColors.green;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1B2A32) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: color, width: 3),
        boxShadow: [BoxShadow(color: color, offset: const Offset(0, 6))],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(word.emoji, style: const TextStyle(fontSize: 56)),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              front ? word.target : word.meaningFor(widget.uiLang),
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
            ),
          ),
          if (front && word.romaji != null)
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                word.romaji!,
                style: TextStyle(
                    fontSize: 18, color: Theme.of(context).hintColor),
              ),
            ),
          if (front) ...[
            const SizedBox(height: 16),
            IconButton(
              onPressed: () => TtsService.instance
                  .speak(word.target, widget.ttsLocale),
              icon: const Icon(Icons.volume_up_rounded,
                  color: DuoColors.blue, size: 32),
            ),
          ],
        ],
      ),
    );
  }
}
