import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../services/handwriting_service.dart';
import '../../theme.dart';

/// Menyimpan goresan kanvas tulis; dipakai layar untuk membaca goresan,
/// membatalkan goresan terakhir, atau membersihkan kanvas.
class InkCanvasController extends ChangeNotifier {
  final List<InkStroke> strokes = [];

  /// Ukuran kanvas terakhir (untuk konteks WritingArea saat dikenali).
  Size? area;

  final Stopwatch _clock = Stopwatch()..start();

  bool get isEmpty => strokes.isEmpty;

  void _begin(Offset p) {
    strokes.add(InkStroke()..add(p, _clock.elapsedMilliseconds));
    notifyListeners();
  }

  void _extend(Offset p) {
    if (strokes.isEmpty) return _begin(p);
    strokes.last.add(p, _clock.elapsedMilliseconds);
    notifyListeners();
  }

  void undo() {
    if (strokes.isEmpty) return;
    strokes.removeLast();
    notifyListeners();
  }

  void clear() {
    if (strokes.isEmpty) return;
    strokes.clear();
    notifyListeners();
  }
}

/// Kanvas tulis tangan bergaya kertas latihan: garis bantu silang di
/// tengah, goresan tinta tebal. Hanya CustomPainter yang di-repaint saat
/// jari bergerak, bukan seluruh layar.
class InkCanvas extends StatelessWidget {
  final InkCanvasController controller;
  final bool enabled;
  final String? hint;
  final double height;

  const InkCanvas({
    super.key,
    required this.controller,
    this.enabled = true,
    this.hint,
    this.height = 260,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return LayoutBuilder(
      builder: (context, constraints) {
        controller.area = Size(constraints.maxWidth, height);
        // Kanvas biasanya berada di dalam ListView. Pengenal pan biasa
        // kalah dari scroll vertikal saat goresan lurus ke bawah, jadi
        // pakai pengenal yang langsung mengklaim sentuhan di area kanvas.
        return RawGestureDetector(
          behavior: HitTestBehavior.opaque,
          gestures: <Type, GestureRecognizerFactory>{
            _EagerPanGestureRecognizer:
                GestureRecognizerFactoryWithHandlers<
                  _EagerPanGestureRecognizer
                >(
                  () => _EagerPanGestureRecognizer(),
                  (r) => r
                    ..onStart = enabled
                        ? (d) => controller._begin(d.localPosition)
                        : null
                    ..onUpdate = enabled
                        ? (d) => controller._extend(d.localPosition)
                        : null,
                ),
          },
          child: Container(
            height: height,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1B2A32) : StudyColors.paper,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: isDark ? const Color(0xFF37464F) : StudyColors.paperLine,
                width: 2,
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Positioned.fill(
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (_, _) => CustomPaint(
                      painter: _InkPainter(
                        strokes: controller.strokes,
                        ink: isDark ? Colors.white : DuoColors.eel,
                        guide: isDark
                            ? const Color(0xFF37464F)
                            : StudyColors.paperLine,
                      ),
                    ),
                  ),
                ),
                if (hint != null && controller.isEmpty)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 12,
                    child: IgnorePointer(
                      child: Text(
                        hint!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _InkPainter extends CustomPainter {
  final List<InkStroke> strokes;
  final Color ink;
  final Color guide;

  _InkPainter({required this.strokes, required this.ink, required this.guide});

  @override
  void paint(Canvas canvas, Size size) {
    // Garis bantu silang putus-putus (seperti kotak latihan kana).
    final guidePaint = Paint()
      ..color = guide
      ..strokeWidth = 1.2;
    const dash = 6.0;
    for (var y = 0.0; y < size.height; y += dash * 2) {
      canvas.drawLine(
        Offset(size.width / 2, y),
        Offset(size.width / 2, (y + dash).clamp(0, size.height)),
        guidePaint,
      );
    }
    for (var x = 0.0; x < size.width; x += dash * 2) {
      canvas.drawLine(
        Offset(x, size.height / 2),
        Offset((x + dash).clamp(0, size.width), size.height / 2),
        guidePaint,
      );
    }

    final inkPaint = Paint()
      ..color = ink
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;
    for (final s in strokes) {
      if (s.points.isEmpty) continue;
      if (s.points.length == 1) {
        canvas.drawCircle(s.points.first, 3, Paint()..color = ink);
        continue;
      }
      final path = Path()..moveTo(s.points.first.dx, s.points.first.dy);
      for (final p in s.points.skip(1)) {
        path.lineTo(p.dx, p.dy);
      }
      canvas.drawPath(path, inkPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _InkPainter old) => true;
}

/// Pan yang langsung menang di arena gestur, supaya goresan vertikal tidak
/// direbut ListView di sekitarnya.
class _EagerPanGestureRecognizer extends PanGestureRecognizer {
  @override
  void addAllowedPointer(PointerDownEvent event) {
    super.addAllowedPointer(event);
    resolve(GestureDisposition.accepted);
  }
}
