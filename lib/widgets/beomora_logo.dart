import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Palet khusus logo — burung hantu globe dengan sayap balon obrolan.
const _navy = Color(0xFF21425F);
const _globeBlue = Color(0xFFA9C7D8);
const _teal = Color(0xFF2E9FB8);
const _tealLight = Color(0xFF8FD0DC);
const _orange = Color(0xFFEE9B1F);
const _cream = Color(0xFFF6EFDC);
const _iris = Color(0xFF2E6B9E);
const _gold = Color(0xFFF0A81C);

/// Latar di belakang emblem pada [BeomoraLogoPainter].
enum BeomoraLogoBackground {
  /// Tanpa latar — hanya emblem (dipakai di dalam aplikasi).
  none,

  /// Kotak putih gading bersudut bulat (ikon launcher Android/web).
  rounded,

  /// Kotak putih gading penuh tanpa sudut (ikon iOS & maskable PWA).
  square,
}

/// Logo Beomora: burung hantu yang badannya adalah globe berjaring
/// meridian — sayap kiri (teal) dan kanan (oranye) sekaligus menjadi
/// balon obrolan, simbol percakapan lintas bahasa.
class BeomoraLogo extends StatelessWidget {
  const BeomoraLogo({
    super.key,
    this.size = 96,
    this.withBackground = false,
  });

  final double size;
  final bool withBackground;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(size),
      painter: BeomoraLogoPainter(
        background: withBackground
            ? BeomoraLogoBackground.rounded
            : BeomoraLogoBackground.none,
      ),
    );
  }
}

class BeomoraLogoPainter extends CustomPainter {
  const BeomoraLogoPainter({
    this.background = BeomoraLogoBackground.rounded,
    this.inset = 0,
  });

  final BeomoraLogoBackground background;

  /// Margin aman di tiap sisi (fraksi sisi kanvas) — ikon maskable PWA
  /// menuntut emblem berada di 80% area tengah.
  final double inset;

  /// Jari-jari globe (fraksi kotak emblem).
  static const _r = 0.40;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.shortestSide;
    if (background != BeomoraLogoBackground.none) {
      _paintBackground(canvas, s);
    }

    // Kotak isi setelah margin aman; seluruh koordinat emblem adalah
    // fraksi dari sisi kotak ini, relatif ke titik tengahnya.
    final cs = s * (1 - 2 * inset);
    final scale = background == BeomoraLogoBackground.none ? 1.0 : 0.8;
    final u = cs * scale;
    final center = Offset(s / 2, s / 2 + 0.02 * u);
    Offset at(double dx, double dy) => center + Offset(dx * u, dy * u);

    _paintGlobe(canvas, at, u);
    _paintTufts(canvas, at, u);
    _paintWings(canvas, at, u);
    _paintEyes(canvas, at, u);
    _paintBeak(canvas, at, u);
  }

  void _paintGlobe(Canvas canvas, Offset Function(double, double) at, double u) {
    final globeCenter = at(0, 0);
    final r = _r * u;

    canvas.save();
    canvas.clipPath(
      Path()..addOval(Rect.fromCircle(center: globeCenter, radius: r)),
    );
    canvas.drawCircle(globeCenter, r, Paint()..color = _globeBlue);

    // Belahan bawah diwarnai mengikuti sayap: kiri teal, kanan oranye.
    canvas.drawRect(
      Rect.fromPoints(at(-_r, 0.02), at(0, _r)),
      Paint()..color = _teal,
    );
    canvas.drawRect(
      Rect.fromPoints(at(0, 0.02), at(_r, _r)),
      Paint()..color = _orange,
    );

    // Jaring globe: garis bujur…
    final line = Paint()
      ..color = _navy
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.018 * u;
    canvas.drawLine(at(0, -_r), at(0, _r), line);
    for (final rx in const [0.17, 0.31]) {
      canvas.drawOval(
        Rect.fromCenter(
            center: globeCenter, width: 2 * rx * u, height: 2 * r),
        line,
      );
    }
    // …dan garis lintang yang sedikit melengkung ke bawah.
    for (final y in const [-0.20, 0.02, 0.24]) {
      final x = math.sqrt(_r * _r - y * y);
      final arc = Path()
        ..moveTo(at(-x, y).dx, at(-x, y).dy)
        ..quadraticBezierTo(
            at(0, y + 0.05).dx, at(0, y + 0.05).dy, at(x, y).dx, at(x, y).dy);
      canvas.drawPath(arc, line);
    }
    canvas.restore();

    // Bingkai globe.
    canvas.drawCircle(
      globeCenter,
      r,
      Paint()
        ..color = _navy
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.028 * u,
    );
  }

  void _paintTufts(Canvas canvas, Offset Function(double, double) at, double u) {
    final fill = Paint()..color = _navy;
    for (final side in const [-1.0, 1.0]) {
      Offset m(double dx, double dy) => at(side * dx, dy);
      // Jumbai telinga terlipat: tanduk di luar bingkai, alis di dalam.
      final tuft = Path()
        ..moveTo(m(0.15, -0.365).dx, m(0.15, -0.365).dy)
        ..lineTo(m(0.26, -0.425).dx, m(0.26, -0.425).dy)
        ..lineTo(m(0.30, -0.26).dx, m(0.30, -0.26).dy)
        ..lineTo(m(0.18, -0.275).dx, m(0.18, -0.275).dy)
        ..close();
      canvas.drawPath(tuft, fill);
    }
  }

  void _paintWings(Canvas canvas, Offset Function(double, double) at, double u) {
    final outline = Paint()
      ..color = _navy
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 0.022 * u;

    for (final side in const [-1.0, 1.0]) {
      Offset m(double dx, double dy) => at(side * dx, dy);
      final color = side < 0 ? _teal : _orange;
      final fill = Paint()..color = color;

      // Kipas sayap: ujung runcing di atas, tiga jari bulu di sisi luar.
      final fan = Path()
        ..moveTo(m(0.13, -0.04).dx, m(0.13, -0.04).dy)
        ..cubicTo(m(0.20, -0.05).dx, m(0.20, -0.05).dy, m(0.33, -0.10).dx,
            m(0.33, -0.10).dy, m(0.44, -0.20).dx, m(0.44, -0.20).dy)
        ..cubicTo(m(0.47, -0.14).dx, m(0.47, -0.14).dy, m(0.49, -0.06).dx,
            m(0.49, -0.06).dy, m(0.49, 0.02).dx, m(0.49, 0.02).dy)
        ..lineTo(m(0.395, 0.075).dx, m(0.395, 0.075).dy)
        ..quadraticBezierTo(m(0.49, 0.10).dx, m(0.49, 0.10).dy,
            m(0.475, 0.17).dx, m(0.475, 0.17).dy)
        ..lineTo(m(0.365, 0.19).dx, m(0.365, 0.19).dy)
        ..quadraticBezierTo(m(0.46, 0.22).dx, m(0.46, 0.22).dy,
            m(0.415, 0.30).dx, m(0.415, 0.30).dy)
        ..quadraticBezierTo(m(0.38, 0.36).dx, m(0.38, 0.36).dy,
            m(0.29, 0.35).dx, m(0.29, 0.35).dy)
        ..quadraticBezierTo(m(0.22, 0.24).dx, m(0.22, 0.24).dy,
            m(0.15, 0.08).dx, m(0.15, 0.08).dy)
        ..close();
      canvas.drawPath(fan, fill);
      canvas.drawPath(fan, outline);

      // Balon obrolan menyatu dengan ekor menunjuk keluar-bawah.
      final tail = Path()
        ..moveTo(m(0.32, 0.185).dx, m(0.32, 0.185).dy)
        ..lineTo(m(0.35, 0.345).dx, m(0.35, 0.345).dy)
        ..lineTo(m(0.22, 0.225).dx, m(0.22, 0.225).dy)
        ..close();
      final bubble = Path.combine(
        PathOperation.union,
        Path()
          ..addRRect(RRect.fromRectAndRadius(
            Rect.fromCenter(
                center: m(0.235, 0.115), width: 0.28 * u, height: 0.24 * u),
            Radius.circular(0.09 * u),
          )),
        tail,
      );
      canvas.drawPath(bubble, fill);
      canvas.drawPath(bubble, outline);

      // Titik-titik obrolan: terang di balon teal, navy di balon oranye.
      final dot = Paint()..color = side < 0 ? _tealLight : _navy;
      for (final dx in const [-0.062, 0.0, 0.062]) {
        canvas.drawCircle(m(0.235 + side * dx, 0.115), 0.023 * u, dot);
      }
    }
  }

  void _paintEyes(Canvas canvas, Offset Function(double, double) at, double u) {
    for (final side in const [-1.0, 1.0]) {
      final eye = at(side * 0.125, -0.135);
      canvas.drawCircle(eye, 0.118 * u, Paint()..color = _cream);
      canvas.drawCircle(
        eye,
        0.118 * u,
        Paint()
          ..color = _navy
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.020 * u,
      );
      final pupilCenter = at(side * 0.115, -0.115);
      canvas.drawCircle(pupilCenter, 0.068 * u, Paint()..color = _iris);
      canvas.drawCircle(pupilCenter, 0.042 * u, Paint()..color = _navy);
      canvas.drawCircle(
        pupilCenter + Offset(-0.022 * u, -0.022 * u),
        0.019 * u,
        Paint()..color = Colors.white,
      );
    }
  }

  void _paintBeak(Canvas canvas, Offset Function(double, double) at, double u) {
    final beak = Path()
      ..moveTo(at(0, -0.065).dx, at(0, -0.065).dy)
      ..lineTo(at(0.035, -0.015).dx, at(0.035, -0.015).dy)
      ..lineTo(at(0, 0.05).dx, at(0, 0.05).dy)
      ..lineTo(at(-0.035, -0.015).dx, at(-0.035, -0.015).dy)
      ..close();
    canvas.drawPath(beak, Paint()..color = _gold);
    canvas.drawPath(
      beak,
      Paint()
        ..color = _navy
        ..style = PaintingStyle.stroke
        ..strokeJoin = StrokeJoin.round
        ..strokeWidth = 0.014 * u,
    );
  }

  void _paintBackground(Canvas canvas, double s) {
    final rect = Rect.fromLTWH(0, 0, s, s);
    // Putih gading lembut — biar emblem teal-oranyenya yang bicara.
    final fill = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFFFFFFF), Color(0xFFF1ECDC)],
      ).createShader(rect);
    if (background == BeomoraLogoBackground.rounded) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(0.225 * s)),
        fill,
      );
    } else {
      canvas.drawRect(rect, fill);
    }
  }

  @override
  bool shouldRepaint(BeomoraLogoPainter oldDelegate) =>
      oldDelegate.background != background || oldDelegate.inset != inset;
}
