// Perender aset Play Store dari BeomoraLogoPainter.
// Jalankan manual (tidak ikut `flutter test` biasa karena di luar test/):
//   flutter test tool/render_store_assets_test.dart
// Hasil ke store_assets/: ikon Play 512, sumber ikon launcher 1024,
// foreground ikon adaptif, dan feature graphic 1024x500.
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:beomora/widgets/beomora_logo.dart';

const _navy = Color(0xFF21425F);
const _teal = Color(0xFF2E9FB8);
const _tealLight = Color(0xFF8FD0DC);
const _orange = Color(0xFFEE9B1F);
const _creamBg = Color(0xFFF1ECDC);

Future<void> _save(ui.Image img, String path) async {
  final data = await img.toByteData(format: ui.ImageByteFormat.png);
  File(path)
    ..createSync(recursive: true)
    ..writeAsBytesSync(data!.buffer.asUint8List());
  debugPrint('tersimpan: $path (${img.width}x${img.height})');
}

Future<ui.Image> _render(
    int w, int h, void Function(Canvas, Size) paint) {
  final rec = ui.PictureRecorder();
  paint(Canvas(rec), Size(w.toDouble(), h.toDouble()));
  return rec.endRecording().toImage(w, h);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('render aset Play Store', () async {
    // Font sistem untuk wordmark (flutter test hanya punya font kotak).
    const fontPath =
        '/System/Library/Fonts/Supplemental/Arial Rounded Bold.ttf';
    final fontData = File(fontPath).readAsBytesSync();
    final loader = FontLoader('Brand')
      ..addFont(Future.value(ByteData.view(fontData.buffer)));
    await loader.load();

    // 1. Ikon Play Store 512x512 — latar penuh (Google membulatkan
    //    sudutnya sendiri di Store).
    await _save(
      await _render(512, 512, (c, s) {
        const BeomoraLogoPainter(background: BeomoraLogoBackground.square)
            .paint(c, s);
      }),
      'store_assets/play_icon_512.png',
    );

    // 2. Sumber ikon launcher 1024 (legacy, latar penuh).
    await _save(
      await _render(1024, 1024, (c, s) {
        const BeomoraLogoPainter(background: BeomoraLogoBackground.square)
            .paint(c, s);
      }),
      'store_assets/icon_1024.png',
    );

    // 3. Foreground ikon adaptif: transparan, emblem di zona aman
    //    (~57% tengah kanvas, syarat maskable 61%).
    await _save(
      await _render(1024, 1024, (c, s) {
        const BeomoraLogoPainter(
                background: BeomoraLogoBackground.none, inset: 0.21)
            .paint(c, s);
      }),
      'store_assets/icon_foreground.png',
    );

    // 4. Feature graphic 1024x500.
    await _save(
      await _render(1024, 500, _paintFeatureGraphic),
      'store_assets/feature_graphic_1024x500.png',
    );
  });
}

void _paintFeatureGraphic(Canvas c, Size s) {
  final rect = Offset.zero & s;

  // Latar: gradien navy → teal diagonal.
  c.drawRect(
    rect,
    Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [_navy, Color(0xFF17618F), _teal],
      ).createShader(rect),
  );

  // Lingkaran dekoratif translusen.
  final glow = Paint()..color = Colors.white.withValues(alpha: 0.06);
  c.drawCircle(const Offset(940, 60), 180, glow);
  c.drawCircle(const Offset(80, 470), 140, glow);
  c.drawCircle(const Offset(620, -40), 110, glow);

  // Tile logo di kiri: kotak gading bersudut bulat + emblem.
  const tile = Rect.fromLTWH(78, 92, 316, 316);
  c.drawRRect(
    RRect.fromRectAndRadius(tile.shift(const Offset(0, 10)),
        const Radius.circular(72)),
    Paint()..color = Colors.black.withValues(alpha: 0.22),
  );
  c.drawRRect(
    RRect.fromRectAndRadius(tile, const Radius.circular(72)),
    Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.white, _creamBg],
      ).createShader(tile),
  );
  c.save();
  c.translate(tile.left + 26, tile.top + 26);
  const BeomoraLogoPainter(background: BeomoraLogoBackground.none)
      .paint(c, const Size.square(264));
  c.restore();

  // Wordmark & tagline.
  void text(String str, double x, double y, double size, Color color,
      {FontWeight weight = FontWeight.w700}) {
    final tp = TextPainter(
      text: TextSpan(
        text: str,
        style: TextStyle(
          fontFamily: 'Brand',
          fontSize: size,
          color: color,
          fontWeight: weight,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(c, Offset(x, y));
  }

  text('Beomora', 452, 128, 118, Colors.white);
  text('Belajar bahasa jadi seru!', 458, 276, 44, _tealLight);

  // Balon obrolan kecil beraksen — menggemakan motif sayap logo.
  void bubble(Offset center, Color color, Color dotColor) {
    final r = RRect.fromRectAndRadius(
      Rect.fromCenter(center: center, width: 92, height: 60),
      const Radius.circular(22),
    );
    final tail = Path()
      ..moveTo(center.dx - 18, center.dy + 26)
      ..lineTo(center.dx - 30, center.dy + 46)
      ..lineTo(center.dx + 2, center.dy + 28)
      ..close();
    c.drawPath(
      Path.combine(PathOperation.union, Path()..addRRect(r), tail),
      Paint()..color = color,
    );
    for (final dx in const [-22.0, 0.0, 22.0]) {
      c.drawCircle(center.translate(dx, 0), 6.5, Paint()..color = dotColor);
    }
  }

  bubble(const Offset(520, 386), _teal, _tealLight);
  bubble(const Offset(640, 386), _orange, _navy);
  text('EN - JA - ID', 706, 360, 46, Colors.white.withValues(alpha: 0.85));
}
