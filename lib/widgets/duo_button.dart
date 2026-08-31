import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme.dart';

/// Tombol utama bertema pelayaran: gradien air, sisi bawah dalam,
/// dan pendar lembut — menekan saat ditap.
class DuoButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color color;
  final Color? shadowColor;
  final Color textColor;
  final bool outlined;
  final double height;

  const DuoButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = DuoColors.green,
    this.shadowColor,
    this.textColor = Colors.white,
    this.outlined = false,
    this.height = 54,
  });

  @override
  State<DuoButton> createState() => _DuoButtonState();
}

class _DuoButtonState extends State<DuoButton> {
  bool _pressed = false;

  Color _darker(Color c, [double amount = 0.14]) {
    final hsl = HSLColor.fromColor(c);
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }

  Color _lighter(Color c, [double amount = 0.08]) {
    final hsl = HSLColor.fromColor(c);
    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onPressed != null;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final depth = _pressed || !enabled ? 0.0 : 4.0;

    final BoxDecoration decoration;
    final Color fg;
    if (widget.outlined) {
      final border =
          isDark ? const Color(0x4DFFFFFF) : Colors.white;
      fg = enabled
          ? widget.color
          : (isDark ? const Color(0xFF52656D) : DuoColors.gray);
      decoration = BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.06)
            : Colors.white.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: border, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            offset: Offset(0, depth),
            blurRadius: 6,
          ),
        ],
      );
    } else if (!enabled) {
      final bg = isDark
          ? Colors.white.withValues(alpha: 0.10)
          : const Color(0xFFCADEE8);
      fg = isDark ? const Color(0xFF6C8291) : const Color(0xFF8FA9B8);
      decoration = BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(18),
      );
    } else {
      fg = widget.textColor;
      final deep = widget.shadowColor ?? _darker(widget.color, 0.18);
      decoration = BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [_lighter(widget.color), _darker(widget.color, 0.06)],
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
            color: Colors.white.withValues(alpha: 0.45), width: 1.5),
        boxShadow: [
          BoxShadow(color: deep, offset: Offset(0, depth)),
          BoxShadow(
            color: widget.color.withValues(alpha: 0.38),
            offset: const Offset(0, 6),
            blurRadius: 16,
          ),
        ],
      );
    }

    return GestureDetector(
      onTapDown: enabled ? (_) => setState(() => _pressed = true) : null,
      onTapCancel: enabled ? () => setState(() => _pressed = false) : null,
      onTapUp: enabled
          ? (_) {
              setState(() => _pressed = false);
              HapticFeedback.lightImpact();
              widget.onPressed!();
            }
          : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 80),
        height: widget.height,
        margin: EdgeInsets.only(top: 4 - depth),
        decoration: decoration,
        alignment: Alignment.center,
        child: Text(
          widget.label,
          style: TextStyle(
            color: fg,
            fontWeight: FontWeight.w900,
            fontSize: 16,
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }
}
