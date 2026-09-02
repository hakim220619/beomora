import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

import '../../l10n/app_strings.dart';
import '../../theme.dart';
import '../duo_button.dart';

/// Rangkuman akhir kuis (dipakai Tebak Huruf & Pilihan Ganda): ring
/// skor yang terisi perlahan, hitungan benar/salah yang berjalan naik,
/// konfeti untuk skor bagus, kesimpulan bertingkat, dan [review] —
/// daftar soal yang salah, dirakit oleh layar pemanggil (null = tanpa
/// bagian ulasan, teks "sempurna" yang tampil).
class QuizResultView extends StatefulWidget {
  final int correct;
  final int total;
  final int earnedXp;
  final Widget? review;
  final VoidCallback onAgain;
  final VoidCallback onDone;

  const QuizResultView({
    super.key,
    required this.correct,
    required this.total,
    required this.earnedXp,
    required this.review,
    required this.onAgain,
    required this.onDone,
  });

  @override
  State<QuizResultView> createState() => _QuizResultViewState();
}

class _QuizResultViewState extends State<QuizResultView> {
  late final ConfettiController _confetti =
      ConfettiController(duration: const Duration(seconds: 2));

  double get _accuracy =>
      widget.total == 0 ? 0 : widget.correct / widget.total;

  @override
  void initState() {
    super.initState();
    if (_accuracy >= 0.7) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => _confetti.play());
    }
  }

  @override
  void dispose() {
    _confetti.dispose();
    super.dispose();
  }

  String _verdictKey() {
    if (_accuracy >= 0.9) return 'quiz_verdict_great';
    if (_accuracy >= 0.7) return 'quiz_verdict_good';
    if (_accuracy >= 0.5) return 'quiz_verdict_ok';
    return 'quiz_verdict_retry';
  }

  Color get _ringColor => _accuracy >= 0.7
      ? DuoColors.green
      : _accuracy >= 0.5
          ? DuoColors.orange
          : DuoColors.red;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final wrongCount = widget.total - widget.correct;

    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
          children: [
            Text(
              l.t('quiz_result_title'),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 18),
            // Ring skor + hitungan berjalan — satu animasi penggerak.
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration: const Duration(milliseconds: 1400),
              curve: Curves.easeOutCubic,
              builder: (context, t, _) {
                return Column(
                  children: [
                    SizedBox(
                      width: 170,
                      height: 170,
                      child: CustomPaint(
                        painter: _ScoreRingPainter(
                          value: t * _accuracy,
                          color: _ringColor,
                          track: isDark
                              ? Colors.white.withValues(alpha: 0.12)
                              : Colors.black.withValues(alpha: 0.08),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${(t * _accuracy * 100).round()}%',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                  color: _ringColor,
                                ),
                              ),
                              Text(
                                l.t('accuracy_label'),
                                style: TextStyle(
                                    fontSize: 12,
                                    color:
                                        Theme.of(context).hintColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        _CountChip(
                          emoji: '✅',
                          label: l.t('quiz_correct_label'),
                          value: (t * widget.correct).round(),
                          color: DuoColors.green,
                        ),
                        const SizedBox(width: 10),
                        _CountChip(
                          emoji: '❌',
                          label: l.t('quiz_wrong_label'),
                          value: (t * wrongCount).round(),
                          color: DuoColors.red,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 14),
            // Kesimpulan + XP muncul belakangan (fade & naik).
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration: const Duration(milliseconds: 2000),
              curve: Curves.easeOut,
              builder: (context, t, child) {
                final late = ((t - 0.55) / 0.45).clamp(0.0, 1.0);
                return Opacity(
                  opacity: late,
                  child: Transform.translate(
                    offset: Offset(0, 16 * (1 - late)),
                    child: child,
                  ),
                );
              },
              child: Column(
                children: [
                  Text(
                    '+${widget.earnedXp} ${l.t('xp')} ⚡',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: DuoColors.orange,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    l.t(_verdictKey()),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 18),
                  if (widget.review == null)
                    Text(
                      l.t('quiz_perfect'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: DuoColors.green,
                      ),
                    )
                  else ...[
                    Text(
                      l.t('quiz_review'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).hintColor),
                    ),
                    const SizedBox(height: 10),
                    widget.review!,
                  ],
                  const SizedBox(height: 24),
                  DuoButton(
                    label: l.t('play_again'),
                    onPressed: widget.onAgain,
                  ),
                  TextButton(
                    onPressed: widget.onDone,
                    child: Text(
                      l.t('quiz_done'),
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Hujan konfeti dari atas untuk skor ≥ 70%.
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _confetti,
            blastDirection: pi / 2,
            blastDirectionality: BlastDirectionality.explosive,
            numberOfParticles: 30,
            emissionFrequency: 0.05,
            gravity: 0.25,
            colors: const [
              DuoColors.green,
              DuoColors.blue,
              DuoColors.yellow,
              DuoColors.orange,
              DuoColors.purple,
            ],
          ),
        ),
      ],
    );
  }
}

/// Kartu kecil hitungan benar/salah dengan angka yang berjalan naik.
class _CountChip extends StatelessWidget {
  final String emoji;
  final String label;
  final int value;
  final Color color;

  const _CountChip({
    required this.emoji,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: isDark ? 0.18 : 0.12),
          borderRadius: BorderRadius.circular(14),
          border:
              Border.all(color: color.withValues(alpha: 0.5), width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 8),
            Text(
              '$value',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w900, color: color),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).hintColor),
            ),
          ],
        ),
      ),
    );
  }
}

/// Ring skor melingkar dengan ujung membulat.
class _ScoreRingPainter extends CustomPainter {
  final double value; // 0..1
  final Color color;
  final Color track;

  const _ScoreRingPainter({
    required this.value,
    required this.color,
    required this.track,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.shortestSide / 2 - 8;
    final base = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, base..color = track);
    if (value > 0) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2,
        2 * pi * value.clamp(0.0, 1.0),
        false,
        base..color = color,
      );
    }
  }

  @override
  bool shouldRepaint(_ScoreRingPainter old) =>
      old.value != value || old.color != color || old.track != track;
}
