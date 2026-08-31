import 'package:flutter/material.dart';

import '../theme.dart';
import 'duo_button.dart';

/// Aksi pada [showDuoDialog]. Menutup dialog dengan [value].
/// [primary] = tombol besar bergaya [DuoButton]; selain itu tombol teks.
class DuoDialogAction<T> {
  final String label;
  final T? value;
  final Color? color;
  final bool primary;

  const DuoDialogAction({
    required this.label,
    this.value,
    this.color,
    this.primary = false,
  });
}

/// Dialog khas Beomora: kartu kertas/papan tulis membulat dengan emoji
/// besar dalam lingkaran berwarna, judul tebal, pesan, dan tombol
/// bertumpuk (utama di atas). Pengganti seluruh AlertDialog polos.
Future<T?> showDuoDialog<T>(
  BuildContext context, {
  required String emoji,
  required String title,
  String? message,
  Widget? content,
  required List<DuoDialogAction<T>> actions,
  Color color = DuoColors.green,
  bool dismissible = true,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: dismissible,
    barrierColor: Colors.black.withValues(alpha: 0.55),
    builder: (dialogContext) {
      final isDark =
          Theme.of(dialogContext).brightness == Brightness.dark;
      final hint = Theme.of(dialogContext).hintColor;
      return Dialog(
        backgroundColor:
            isDark ? StudyColors.boardTop : StudyColors.paper,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
          side: BorderSide(
            color: isDark
                ? StudyColors.chalk.withValues(alpha: 0.28)
                : const Color(0xFFE7E0C9),
            width: 1.5,
          ),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 380),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color.withValues(alpha: 0.16),
                      border: Border.all(
                          color: color.withValues(alpha: 0.55),
                          width: 2.5),
                    ),
                    alignment: Alignment.center,
                    child:
                        Text(emoji, style: const TextStyle(fontSize: 34)),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w900),
                ),
                if (message != null || content != null) ...[
                  const SizedBox(height: 10),
                  Flexible(
                    child: SingleChildScrollView(
                      child: content ??
                          Text(
                            message!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.5,
                              height: 1.5,
                              color: hint,
                            ),
                          ),
                    ),
                  ),
                ],
                const SizedBox(height: 22),
                for (final action in actions) ...[
                  if (action != actions.first) const SizedBox(height: 8),
                  if (action.primary)
                    DuoButton(
                      label: action.label,
                      color: action.color ?? color,
                      height: 50,
                      onPressed: () =>
                          Navigator.of(dialogContext).pop(action.value),
                    )
                  else
                    TextButton(
                      onPressed: () =>
                          Navigator.of(dialogContext).pop(action.value),
                      child: Text(
                        action.label,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                          color: action.color ?? hint,
                        ),
                      ),
                    ),
                ],
              ],
            ),
          ),
        ),
      );
    },
  );
}

/// Dialog konfirmasi dua tombol. true = pengguna menekan [confirmLabel];
/// false = batal (termasuk menutup lewat luar dialog).
Future<bool> showDuoConfirm(
  BuildContext context, {
  required String emoji,
  required String title,
  required String message,
  required String confirmLabel,
  required String cancelLabel,
  Color color = DuoColors.green,
}) async {
  final result = await showDuoDialog<bool>(
    context,
    emoji: emoji,
    title: title,
    message: message,
    color: color,
    actions: [
      DuoDialogAction(
          label: confirmLabel, value: true, primary: true, color: color),
      DuoDialogAction(label: cancelLabel, value: false),
    ],
  );
  return result ?? false;
}
