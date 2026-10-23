import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../l10n/app_strings.dart';
import '../../models/exercise.dart';
import '../../theme.dart';
import '../choice_card.dart';

/// Soal mencocokkan pasangan kata ↔ arti. Cocokkan dengan ketuk
/// kiri → kanan, atau tarik garis dari kotak kiri ke kotak kanan.
/// Pasangan yang benar tersambung garis berwarna. Selesai otomatis
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
  /// Warna garis per pasangan (merah sengaja tidak dipakai: tanda salah).
  static const _lineColors = [
    DuoColors.blue,
    DuoColors.purple,
    DuoColors.orange,
    DuoColors.green,
    DuoColors.yellow,
    DuoColors.blueDark,
  ];

  late final List<String> _lefts;
  late final List<String> _rights;
  final Set<String> _matchedLefts = {};
  String? _selectedLeft;
  String? _errorLeft;
  String? _errorRight;

  final _stackKey = GlobalKey();
  final Map<String, GlobalKey> _leftKeys = {};
  final Map<String, GlobalKey> _rightKeys = {};

  /// Posisi jari (global) saat menarik garis dari kotak kiri.
  Offset? _dragGlobal;

  @override
  void initState() {
    super.initState();
    final rng = Random();
    _lefts = widget.exercise.pairs.map((p) => p.left).toList()..shuffle(rng);
    _rights = widget.exercise.pairs.map((p) => p.right).toList()..shuffle(rng);
    for (final s in _lefts) {
      _leftKeys[s] = GlobalKey();
    }
    for (final s in _rights) {
      _rightKeys[s] = GlobalKey();
    }
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
    if (widget.exercise.pairs.any(
      (p) => p.right == right && _matchedLefts.contains(p.left),
    )) {
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

  // ── Tarik garis ────────────────────────────────────────────────
  // Pakai drag horizontal supaya tidak berebut dengan gulir vertikal
  // halaman soal; posisi jari tetap diikuti ke segala arah.

  void _dragStart(String left, Offset global) {
    if (_matchedLefts.contains(left)) return;
    _tapLeft(left);
    setState(() => _dragGlobal = global);
  }

  void _dragUpdate(Offset global) {
    if (_dragGlobal == null) return;
    setState(() => _dragGlobal = global);
  }

  void _dragEnd() {
    final drop = _dragGlobal;
    if (drop == null) return;
    setState(() => _dragGlobal = null);
    for (final right in _rights) {
      final rect = _globalRect(_rightKeys[right]!);
      if (rect != null && rect.inflate(8).contains(drop)) {
        _tapRight(right);
        return;
      }
    }
    // Dilepas di luar kotak kanan: batal.
    setState(() => _selectedLeft = null);
  }

  Rect? _globalRect(GlobalKey key) {
    final box = key.currentContext?.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return null;
    return box.localToGlobal(Offset.zero) & box.size;
  }

  /// Titik ujung garis relatif ke Stack: sisi kanan kotak kiri atau
  /// sisi kiri kotak kanan, di tengah tinggi kotak.
  Offset? _anchor(GlobalKey key, {required bool rightEdge}) {
    final box = key.currentContext?.findRenderObject() as RenderBox?;
    final stack = _stackKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null || stack == null || !box.hasSize) return null;
    return box.localToGlobal(
      Offset(rightEdge ? box.size.width : 0, box.size.height / 2),
      ancestor: stack,
    );
  }

  /// Dihitung saat menggambar (setelah layout) agar posisi selalu pas.
  List<_Line> _lines() {
    final lines = <_Line>[];
    final pairs = widget.exercise.pairs;
    for (var i = 0; i < pairs.length; i++) {
      final p = pairs[i];
      if (!_matchedLefts.contains(p.left)) continue;
      final a = _anchor(_leftKeys[p.left]!, rightEdge: true);
      final b = _anchor(_rightKeys[p.right]!, rightEdge: false);
      if (a != null && b != null) {
        lines.add(_Line(a, b, _lineColors[i % _lineColors.length]));
      }
    }
    final drag = _dragGlobal;
    final stack = _stackKey.currentContext?.findRenderObject() as RenderBox?;
    if (drag != null && _selectedLeft != null && stack != null) {
      final a = _anchor(_leftKeys[_selectedLeft!]!, rightEdge: true);
      if (a != null) {
        lines.add(
          _Line(a, stack.globalToLocal(drag), DuoColors.blue, active: true),
        );
      }
    }
    return lines;
  }

  ChoiceState _leftState(String left) {
    if (_matchedLefts.contains(left)) return ChoiceState.correct;
    if (_errorLeft == left) return ChoiceState.wrong;
    if (_selectedLeft == left) return ChoiceState.selected;
    return ChoiceState.idle;
  }

  ChoiceState _rightState(String right) {
    final matched = widget.exercise.pairs.any(
      (p) => p.right == right && _matchedLefts.contains(p.left),
    );
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
        Stack(
          key: _stackKey,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      for (final left in _lefts) ...[
                        GestureDetector(
                          onHorizontalDragStart: (d) =>
                              _dragStart(left, d.globalPosition),
                          onHorizontalDragUpdate: (d) =>
                              _dragUpdate(d.globalPosition),
                          onHorizontalDragEnd: (_) => _dragEnd(),
                          onHorizontalDragCancel: _dragEnd,
                          child: ChoiceCard(
                            key: _leftKeys[left],
                            label: left,
                            compact: true,
                            state: _leftState(left),
                            onTap: () => _tapLeft(left),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ],
                  ),
                ),
                // Celah lebar agar garis penghubung terlihat jelas.
                const SizedBox(width: 36),
                Expanded(
                  child: Column(
                    children: [
                      for (final right in _rights) ...[
                        ChoiceCard(
                          key: _rightKeys[right],
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
            Positioned.fill(
              child: IgnorePointer(
                child: CustomPaint(painter: _LinePainter(_lines)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Line {
  final Offset from;
  final Offset to;
  final Color color;
  final bool active; // garis yang sedang ditarik jari

  const _Line(this.from, this.to, this.color, {this.active = false});
}

/// Garis lengkung penghubung pasangan, dengan titik di kedua ujung.
class _LinePainter extends CustomPainter {
  final List<_Line> Function() lines;

  _LinePainter(this.lines);

  @override
  void paint(Canvas canvas, Size size) {
    for (final line in lines()) {
      final a = line.from, b = line.to;
      final dx = (b.dx - a.dx).abs() / 2;
      final path = Path()
        ..moveTo(a.dx, a.dy)
        ..cubicTo(a.dx + dx, a.dy, b.dx - dx, b.dy, b.dx, b.dy);
      final color = line.active
          ? line.color.withValues(alpha: 0.75)
          : line.color;
      canvas.drawPath(
        path,
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3.5
          ..strokeCap = StrokeCap.round,
      );
      final dot = Paint()..color = color;
      canvas.drawCircle(a, 5, dot);
      canvas.drawCircle(b, line.active ? 7 : 5, dot);
    }
  }

  @override
  bool shouldRepaint(covariant _LinePainter oldDelegate) => true;
}
