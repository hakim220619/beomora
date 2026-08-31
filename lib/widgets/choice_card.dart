import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme.dart';

enum ChoiceState { idle, selected, correct, wrong, disabled }

/// Kartu pilihan jawaban gaya "kaca apung" dengan status warna.
class ChoiceCard extends StatelessWidget {
  final String label;
  final String? subLabel;
  final ChoiceState state;
  final VoidCallback? onTap;
  final bool compact;

  const ChoiceCard({
    super.key,
    required this.label,
    this.subLabel,
    this.state = ChoiceState.idle,
    this.onTap,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseBorder =
        isDark ? const Color(0x40FFFFFF) : Colors.white;
    final baseBg = isDark
        ? Colors.white.withValues(alpha: 0.08)
        : Colors.white.withValues(alpha: 0.72);
    final baseText = isDark ? Colors.white : DuoColors.eel;

    Color border = baseBorder, bg = baseBg, text = baseText;
    var glow = Colors.black.withValues(alpha: 0.08);
    switch (state) {
      case ChoiceState.selected:
        border = DuoColors.blue;
        bg = isDark
            ? DuoColors.blue.withValues(alpha: 0.22)
            : const Color(0xFFD8F0FF);
        text = isDark ? const Color(0xFF9BD8FF) : DuoColors.blueDark;
        glow = DuoColors.blue.withValues(alpha: 0.35);
      case ChoiceState.correct:
        border = DuoColors.green;
        bg = isDark
            ? DuoColors.green.withValues(alpha: 0.22)
            : const Color(0xFFCFF7EC);
        text = isDark ? const Color(0xFF7DF0D8) : DuoColors.greenDark;
        glow = DuoColors.green.withValues(alpha: 0.35);
      case ChoiceState.wrong:
        border = DuoColors.red;
        bg = isDark
            ? DuoColors.red.withValues(alpha: 0.20)
            : const Color(0xFFFFE1E2);
        text = DuoColors.red;
        glow = DuoColors.red.withValues(alpha: 0.35);
      case ChoiceState.disabled:
        text = isDark ? const Color(0xFF6C8291) : DuoColors.gray;
      case ChoiceState.idle:
        break;
    }

    return GestureDetector(
      onTap: state == ChoiceState.disabled || onTap == null
          ? null
          : () {
              HapticFeedback.selectionClick();
              onTap!();
            },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        padding: EdgeInsets.symmetric(
            horizontal: 16, vertical: compact ? 10 : 16),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: border, width: 2),
          boxShadow: [
            BoxShadow(color: glow, offset: const Offset(0, 4), blurRadius: 10),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: text,
                fontSize: compact ? 15 : 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (subLabel != null && subLabel!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  subLabel!,
                  style: TextStyle(
                    color: text.withValues(alpha: 0.7),
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
