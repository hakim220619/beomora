import 'dart:math';

import 'package:flutter/material.dart';

/// Progress bar bergaya coretan stabilo: isian tinta dengan tepi
/// tidak rata seperti goresan tangan, plus pensil ✏️ yang "menulis"
/// di ujung isian.
class PencilProgressBar extends StatefulWidget {
  final double value; // 0..1
  final Color color;
  final double height;
  final bool showPencil;

  const PencilProgressBar({
    super.key,
    required this.value,
    required this.color,
    this.height = 18,
    this.showPencil = false,
  });

  @override
  State<PencilProgressBar> createState() => _PencilProgressBarState();
}

class _PencilProgressBarState extends State<PencilProgressBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat();

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TweenAnimationBuilder<double>(
      tween: Tween(end: widget.value.clamp(0.0, 1.0)),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutCubic,
      builder: (_, v, _) => LayoutBuilder(
        builder: (_, constraints) {
          final w = constraints.maxWidth;
          return SizedBox(
            height: widget.height + (widget.showPencil ? 10 : 0),
            child: AnimatedBuilder(
              animation: _ctrl,
              builder: (_, _) => Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomLeft,
                children: [
                  CustomPaint(
                    size: Size(w, widget.height),
                    painter: _StrokeBarPainter(
                      value: v,
                      phase: _ctrl.value,
                      color: widget.color,
                      trackColor: isDark
                          ? Colors.white.withValues(alpha: 0.14)
                          : Colors.black.withValues(alpha: 0.08),
                    ),
                  ),
                  if (widget.showPencil)
                    Positioned(
                      left: (v * w - 10).clamp(0.0, w - 20),
                      bottom: widget.height - 4,
                      child: Transform.rotate(
                        // Goyangan kecil seperti sedang menulis.
                        angle: 0.5 + sin(_ctrl.value * 2 * pi * 3) * 0.06,
                        child:
                            const Text('✏️', style: TextStyle(fontSize: 17)),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _StrokeBarPainter extends CustomPainter {
  final double value;
  final double phase;
  final Color color;
  final Color trackColor;

  _StrokeBarPainter({
    required this.value,
    required this.phase,
    required this.color,
    required this.trackColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final r = Radius.circular(size.height / 2);
    final track = RRect.fromRectAndRadius(Offset.zero & size, r);
    canvas.drawRRect(track, Paint()..color = trackColor);
    if (value <= 0.005) return;

    canvas.save();
    canvas.clipRRect(track);
    final fillW = size.width * value;
    // Ujung kanan tidak rata seperti goresan stabilo.
    final path = Path()..moveTo(0, 0);
    for (double y = 0; y <= size.height; y += 2) {
      path.lineTo(
          fillW + sin(y / size.height * 2 * pi + phase * 2 * pi * 2) * 2.5,
          y);
    }
    path
      ..lineTo(0, size.height)
      ..close();
    final rect = Rect.fromLTWH(0, 0, fillW, size.height);
    canvas.drawPath(
      path,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color,
            HSLColor.fromColor(color)
                .withLightness(
                    (HSLColor.fromColor(color).lightness - 0.12)
                        .clamp(0.0, 1.0))
                .toColor()
          ],
        ).createShader(rect),
    );
    // Kilap tipis khas tinta stabilo.
    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromLTWH(4, 2.5, (fillW - 10).clamp(0, size.width), 3),
          const Radius.circular(2)),
      Paint()..color = Colors.white.withValues(alpha: 0.35),
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _StrokeBarPainter old) =>
      old.value != value ||
      old.phase != phase ||
      old.color != color;
}
