import 'dart:math';

import 'package:flutter/material.dart';

import '../../theme.dart';

/// Latar suasana belajar yang hidup:
/// - Terang: kertas buku catatan (garis biru + margin merah) dengan
///   pesawat kertas melayang dan coretan pensil kecil.
/// - Gelap: papan tulis kapur dengan serbuk kapur berkelip dan
///   coretan kapur samar.
class StudyBackground extends StatefulWidget {
  const StudyBackground({super.key});

  @override
  State<StudyBackground> createState() => _StudyBackgroundState();
}

class _StudyBackgroundState extends State<StudyBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 16),
  )..repeat();

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return RepaintBoundary(
      child: CustomPaint(
        painter: _StudyPainter(animation: _ctrl, chalkboard: isDark),
        size: Size.infinite,
        isComplex: true,
      ),
    );
  }
}

class _StudyPainter extends CustomPainter {
  final Animation<double> animation;
  final bool chalkboard;

  _StudyPainter({required this.animation, required this.chalkboard})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final t = animation.value; // 0..1 berulang
    if (chalkboard) {
      _paintChalkboard(canvas, size, t);
    } else {
      _paintNotebook(canvas, size, t);
    }
  }

  // ---------- Mode terang: buku catatan ----------

  void _paintNotebook(Canvas canvas, Size size, double t) {
    final w = size.width, h = size.height;
    // Kertas dengan gradasi hangat tipis.
    final rect = Offset.zero & size;
    canvas.drawRect(
      rect,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [StudyColors.paper, StudyColors.paperShade],
        ).createShader(rect),
    );

    // Garis-garis buku.
    final line = Paint()
      ..color = StudyColors.paperLine.withValues(alpha: 0.55)
      ..strokeWidth = 1.2;
    for (double y = 90; y < h; y += 42) {
      canvas.drawLine(Offset(0, y), Offset(w, y), line);
    }
    // Margin merah ganda di kiri.
    final margin = Paint()
      ..color = StudyColors.paperMargin.withValues(alpha: 0.6)
      ..strokeWidth = 1.6;
    canvas.drawLine(Offset(34, 0), Offset(34, h), margin);
    canvas.drawLine(Offset(39, 0), Offset(39, h), margin);

    _doodles(canvas, w, h, t,
        color: StudyColors.pencil.withValues(alpha: 0.35));
    _paperPlane(canvas, w, h, t,
        color: StudyColors.pencil.withValues(alpha: 0.75));
  }

  // ---------- Mode gelap: papan tulis ----------

  void _paintChalkboard(Canvas canvas, Size size, double t) {
    final w = size.width, h = size.height;
    final rect = Offset.zero & size;
    canvas.drawRect(
      rect,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [StudyColors.boardTop, StudyColors.boardBottom],
        ).createShader(rect),
    );

    // Serbuk kapur berkelip.
    final speck = Paint();
    for (var i = 0; i < 44; i++) {
      final fx = (sin(i * 12.9898) * 43758.5453).abs() % 1;
      final fy = (sin(i * 78.233) * 12345.6789).abs() % 1;
      final twinkle =
          0.15 + 0.55 * (0.5 + 0.5 * sin(t * 4 * pi + i * 1.7));
      speck.color = StudyColors.chalk.withValues(alpha: twinkle);
      canvas.drawCircle(
          Offset(fx * w, fy * h), i % 7 == 0 ? 1.6 : 1.0, speck);
    }

    // Bekas hapusan kapur: garis lengkung samar yang bergeser pelan.
    final smear = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10
      ..color = StudyColors.chalk.withValues(alpha: 0.045);
    for (var k = 0; k < 4; k++) {
      final y = h * (0.18 + k * 0.22) + sin(t * 2 * pi + k) * 4;
      final path = Path()..moveTo(-20, y);
      for (double x = 0; x <= w + 20; x += 24) {
        path.quadraticBezierTo(
            x + 12, y + sin(x / 60 + k * 2) * 10, x + 24, y);
      }
      canvas.drawPath(path, smear);
    }

    _doodles(canvas, w, h, t,
        color: StudyColors.chalk.withValues(alpha: 0.30));
    _paperPlane(canvas, w, h, t,
        color: StudyColors.chalk.withValues(alpha: 0.8));
  }

  // ---------- Elemen bersama ----------

  /// Coretan kecil (bintang & lingkaran) yang melayang pelan.
  void _doodles(Canvas canvas, double w, double h, double t,
      {required Color color}) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round
      ..color = color;
    for (var i = 0; i < 10; i++) {
      final fx = ((i * 97) % 100) / 100;
      final fy = ((i * 53) % 100) / 100;
      final drift = sin(t * 2 * pi + i) * 5;
      final c = Offset(fx * w + drift, 70 + fy * (h - 140));
      if (i.isEven) {
        _star(canvas, c, 6.5, paint);
      } else {
        canvas.drawCircle(c, 4.5, paint);
      }
    }
  }

  void _star(Canvas canvas, Offset c, double r, Paint paint) {
    final path = Path();
    for (var i = 0; i < 5; i++) {
      final a = -pi / 2 + i * 4 * pi / 5;
      final p = Offset(c.dx + cos(a) * r, c.dy + sin(a) * r);
      i == 0 ? path.moveTo(p.dx, p.dy) : path.lineTo(p.dx, p.dy);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  /// Pesawat kertas melintas dengan jejak putus-putus.
  void _paperPlane(Canvas canvas, double w, double h, double t,
      {required Color color}) {
    final x = ((t * 0.9) % 1.3) * (w + 220) - 110;
    final y = h * 0.10 + sin(t * 4 * pi) * 8;
    final tilt = cos(t * 4 * pi) * 0.12;

    // Jejak terbang.
    final trail = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round
      ..color = color.withValues(alpha: 0.35);
    for (var i = 1; i <= 5; i++) {
      final tx = x - 22.0 * i;
      final ty = y + sin((t * 4 * pi) - i * 0.7) * 6;
      canvas.drawLine(Offset(tx - 8, ty), Offset(tx, ty), trail);
    }

    canvas.save();
    canvas.translate(x, y);
    canvas.rotate(tilt);
    final body = Paint()..color = color;
    final plane = Path()
      ..moveTo(16, 0)
      ..lineTo(-12, -8)
      ..lineTo(-6, 0)
      ..lineTo(-12, 8)
      ..close();
    canvas.drawPath(plane, body);
    // Lipatan tengah.
    canvas.drawLine(
        const Offset(16, 0),
        const Offset(-6, 0),
        Paint()
          ..color = color.withValues(alpha: 0.5)
          ..strokeWidth = 1);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _StudyPainter old) =>
      old.chalkboard != chalkboard;
}

/// Scaffold bertema belajar: konten transparan di atas buku catatan
/// (terang) atau papan tulis (gelap) yang beranimasi.
class StudyScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool paintBackground;

  const StudyScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.paintBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold(
      backgroundColor: Colors.transparent,
      appBar: appBar,
      body: body,
      extendBody: bottomNavigationBar != null,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
    if (!paintBackground) return scaffold;
    return Stack(
      fit: StackFit.expand,
      children: [const StudyBackground(), scaffold],
    );
  }
}
