import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_strings.dart';
import '../providers/settings_provider.dart';
import '../theme.dart';
import 'duo_dialog.dart';

/// Bintang favorit untuk satu kosakata. Kata berbintang dikumpulkan di
/// bagian "⭐ Favorit" paling atas di halaman Kosakata.
class VocabStarButton extends StatelessWidget {
  final String courseId;
  final String word;

  const VocabStarButton({
    super.key,
    required this.courseId,
    required this.word,
  });

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final settings = context.watch<SettingsProvider>();
    final on = settings.isStarred(courseId, word);
    return IconButton(
      tooltip: l.t(on ? 'vocab_unstar' : 'vocab_star'),
      visualDensity: VisualDensity.compact,
      onPressed: () => _toggleKeepingPlace(context, settings),
      icon: Icon(
        on ? Icons.star_rounded : Icons.star_border_rounded,
        color: on ? DuoColors.yellow : Theme.of(context).hintColor,
        size: 22,
      ),
    );
  }
}

/// Bagian "⭐ Favorit" di atas daftar bisa muncul/membesar/mengecil saat
/// bintang ditekan, yang mendorong isi daftar. Posisi gulir digeser
/// sebesar selisihnya agar kata yang ditekan tetap di tempat yang sama.
extension on VocabStarButton {
  void _toggleKeepingPlace(BuildContext context, SettingsProvider settings) {
    final box = context.findRenderObject() as RenderBox?;
    final position = Scrollable.maybeOf(context)?.position;
    final before = box?.localToGlobal(Offset.zero).dy;
    settings.toggleStarred(courseId, word);
    if (position == null || before == null) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return; // baris ikut hilang (lepas di Favorit)
      final after = context.findRenderObject() as RenderBox?;
      if (after == null || !after.attached || !position.hasPixels) return;
      final dy = after.localToGlobal(Offset.zero).dy - before;
      if (dy.abs() < 0.5) return;
      position.jumpTo(
        (position.pixels + dy).clamp(
          position.minScrollExtent,
          position.maxScrollExtent,
        ),
      );
    });
  }
}

/// Ikon reset di judul bagian Favorit: lepas bintang dari semua [words]
/// setelah konfirmasi.
class VocabStarClearButton extends StatelessWidget {
  final String courseId;
  final List<String> words;

  const VocabStarClearButton({
    super.key,
    required this.courseId,
    required this.words,
  });

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return IconButton(
      tooltip: l.t('vocab_starred_clear'),
      visualDensity: VisualDensity.compact,
      icon: Icon(
        Icons.delete_sweep_rounded,
        color: Theme.of(context).hintColor,
      ),
      onPressed: () async {
        final settings = context.read<SettingsProvider>();
        final ok = await showDuoConfirm(
          context,
          emoji: '⭐',
          title: l.t('vocab_starred_clear'),
          message: l
              .t('vocab_starred_clear_msg')
              .replaceFirst('{n}', '${words.length}'),
          confirmLabel: l.t('vocab_starred_clear_ok'),
          cancelLabel: l.t('cancel'),
          color: DuoColors.red,
        );
        if (ok) settings.removeStarred(courseId, words);
      },
    );
  }
}
