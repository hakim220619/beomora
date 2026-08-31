import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

import '../../l10n/app_strings.dart';
import '../../providers/progress_provider.dart';
import '../../theme.dart';
import '../../widgets/duo_button.dart';
import '../../widgets/study/study_background.dart';

/// Layar perayaan: nilai keluar! Sinar emas berputar, confetti,
/// dan hasil belajar (XP, koin, akurasi).
class LessonCompleteScreen extends StatefulWidget {
  final LessonReward reward;
  final int mistakes;
  final int totalExercises;
  final bool heartRestored;

  const LessonCompleteScreen({
    super.key,
    required this.reward,
    required this.mistakes,
    required this.totalExercises,
    this.heartRestored = false,
  });

  @override
  State<LessonCompleteScreen> createState() => _LessonCompleteScreenState();
}

class _LessonCompleteScreenState extends State<LessonCompleteScreen>
    with SingleTickerProviderStateMixin {
  late final ConfettiController _confetti =
      ConfettiController(duration: const Duration(seconds: 2));
  late final AnimationController _rays = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 14),
  )..repeat();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _confetti.play());
  }

  @override
  void dispose() {
    _confetti.dispose();
    _rays.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final accuracy = widget.totalExercises == 0
        ? 100
        : (((widget.totalExercises - widget.mistakes) /
                    widget.totalExercises) *
                100)
            .clamp(0, 100)
            .round();

    return StudyScaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Spacer(),
                  // Bintang nilai dengan sinar emas berputar di belakangnya.
                  SizedBox(
                    width: 190,
                    height: 190,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedBuilder(
                          animation: _rays,
                          builder: (_, _) => Transform.rotate(
                            angle: _rays.value * 2 * pi,
                            child: CustomPaint(
                              size: const Size(190, 190),
                              painter: _RaysPainter(
                                color: widget.reward.perfect
                                    ? DuoColors.yellow
                                    : DuoColors.green,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          widget.reward.perfect ? '🏆' : '🌟',
                          style: const TextStyle(fontSize: 76),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l.t('lesson_complete'),
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.reward.perfect
                        ? l.t('perfect')
                        : l.t('great_job'),
                    style: TextStyle(
                      fontSize: 16,
                      color: widget.reward.perfect
                          ? DuoColors.orange
                          : Theme.of(context).hintColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _RewardBox(
                        label: l.t('xp'),
                        value: '+${widget.reward.xp}',
                        color: DuoColors.yellow,
                        icon: '⚡',
                      ),
                      const SizedBox(width: 12),
                      if (widget.reward.gems > 0)
                        _RewardBox(
                          label: l.t('gems'),
                          value: '+${widget.reward.gems}',
                          color: DuoColors.blue,
                          icon: '🪙',
                        ),
                      if (widget.heartRestored) ...[
                        const SizedBox(width: 12),
                        _RewardBox(
                          label: l.t('hearts'),
                          value: '+1',
                          color: DuoColors.red,
                          icon: '❤️',
                        ),
                      ],
                      const SizedBox(width: 12),
                      _RewardBox(
                        label: l.t('accuracy_label'),
                        value: '$accuracy%',
                        color: DuoColors.green,
                        icon: '🎯',
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  for (final achId in widget.reward.newAchievements)
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: DuoColors.purple.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                            color: DuoColors.purple, width: 2),
                      ),
                      child: Row(
                        children: [
                          const Text('🏅',
                              style: TextStyle(fontSize: 24)),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l.t('ach_unlocked'),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: DuoColors.purple,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  l.t('ach_$achId'),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  const Spacer(),
                  DuoButton(
                    label: l.t('continue_btn'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ),
          ConfettiWidget(
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
        ],
      ),
    );
  }
}

/// Sinar matahari/harta yang memancar dari tengah.
class _RaysPainter extends CustomPainter {
  final Color color;
  _RaysPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    final r = size.width / 2;
    const rayCount = 12;
    final paint = Paint()..color = color.withValues(alpha: 0.28);
    for (var i = 0; i < rayCount; i++) {
      final a1 = i * 2 * pi / rayCount;
      final a2 = a1 + pi / rayCount * 0.75;
      final path = Path()
        ..moveTo(c.dx, c.dy)
        ..lineTo(c.dx + cos(a1) * r, c.dy + sin(a1) * r)
        ..arcToPoint(
          Offset(c.dx + cos(a2) * r, c.dy + sin(a2) * r),
          radius: Radius.circular(r),
        )
        ..close();
      canvas.drawPath(path, paint);
    }
    canvas.drawCircle(
        c, r * 0.42, Paint()..color = color.withValues(alpha: 0.18));
  }

  @override
  bool shouldRepaint(covariant _RaysPainter old) => old.color != color;
}

class _RewardBox extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final String icon;

  const _RewardBox({
    required this.label,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isDark
            ? color.withValues(alpha: 0.20)
            : Colors.white.withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color, width: 2),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text('$icon $value',
              style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w900,
                  fontSize: 16)),
          Text(label,
              style: TextStyle(
                  color: color, fontSize: 11, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
