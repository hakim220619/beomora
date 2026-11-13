import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/mcq_packs.dart';
import '../l10n/app_strings.dart';
import '../providers/progress_provider.dart';
import '../providers/settings_provider.dart';
import '../screens/premium_screen.dart';
import '../theme.dart';
import 'duo_button.dart';

/// Tampilkan [QuestionCountSheet] untuk [selected] item terpilih.
/// Pengguna gratis dibatasi [freeLimit] (bawaan [kFreeMcqLimit]) soal,
/// premium 100. Mengembalikan jumlah soal, atau null bila dibatalkan.
Future<int?> showQuestionCountSheet(
  BuildContext context, {
  required int selected,
  int? freeLimit,
  bool modeSelector = false,
}) {
  final premium = context.read<ProgressProvider>().premiumActive;
  final maxCount = premium ? 100 : (freeLimit ?? kFreeMcqLimit);
  return showModalBottomSheet<int>(
    context: context,
    isScrollControlled: true,
    builder: (_) => QuestionCountSheet(
      selected: selected,
      initial: min(max(selected, 10), maxCount),
      maxCount: maxCount,
      capped: !premium,
      presets: const [5, 10, 20, 30, 50],
      modeSelector: modeSelector,
    ),
  );
}

/// Lembar bawah: tentukan jumlah soal (−/+ dan pilihan cepat).
/// Dipakai Latihan Kosakata dan latihan huruf/kanji dari Materi.
class QuestionCountSheet extends StatefulWidget {
  final int selected;
  final int initial;
  final int maxCount;
  final bool capped;
  final List<int> presets;

  /// Tampilkan pilihan jenis soal (pilihan ganda / susun huruf) —
  /// tersimpan di [SettingsProvider.vocabSpellMode].
  final bool modeSelector;

  const QuestionCountSheet({
    super.key,
    required this.selected,
    required this.initial,
    required this.maxCount,
    required this.capped,
    required this.presets,
    this.modeSelector = false,
  });

  @override
  State<QuestionCountSheet> createState() => _QuestionCountSheetState();
}

class _QuestionCountSheetState extends State<QuestionCountSheet> {
  late int _count = widget.initial;

  List<Widget> _modeSelector(L l) {
    final settings = context.watch<SettingsProvider>();
    final spell = settings.vocabSpellMode;
    return [
      Text(
        l.t('vocab_mode_title'),
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
      ),
      const SizedBox(height: 8),
      SegmentedButton<bool>(
        segments: [
          ButtonSegment(
            value: false,
            icon: const Icon(Icons.radio_button_checked_rounded),
            label: Text(l.t('vocab_mode_mcq')),
          ),
          ButtonSegment(
            value: true,
            icon: const Icon(Icons.abc_rounded),
            label: Text(l.t('vocab_mode_spell')),
          ),
        ],
        selected: {spell},
        showSelectedIcon: false,
        onSelectionChanged: (v) => settings.setVocabSpellMode(v.first),
      ),
      if (spell)
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            l.t('vocab_mode_spell_note'),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Theme.of(context).hintColor),
          ),
        ),
      const SizedBox(height: 16),
    ];
  }

  void _set(int v) => setState(() => _count = v.clamp(1, widget.maxCount));

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.modeSelector) ..._modeSelector(l),
            Text(
              l.t('kana_mix_count'),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filledTonal(
                  onPressed: _count > 1 ? () => _set(_count - 1) : null,
                  icon: const Icon(Icons.remove_rounded),
                ),
                SizedBox(
                  width: 120,
                  child: Text(
                    '$_count',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: DuoColors.blue,
                    ),
                  ),
                ),
                IconButton.filledTonal(
                  onPressed: _count < widget.maxCount
                      ? () => _set(_count + 1)
                      : null,
                  icon: const Icon(Icons.add_rounded),
                ),
              ],
            ),
            Center(child: Text(l.t('kana_mix_questions'))),
            const SizedBox(height: 12),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final n in {
                  widget.selected,
                  ...widget.presets,
                }.where((n) => n <= widget.maxCount).toList()..sort())
                  ChoiceChip(
                    label: Text(
                      '$n',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: _count == n ? Colors.white : null,
                      ),
                    ),
                    selected: _count == n,
                    showCheckmark: false,
                    selectedColor: DuoColors.blue,
                    onSelected: (_) => _set(n),
                  ),
              ],
            ),
            if (_count > widget.selected) ...[
              const SizedBox(height: 12),
              Text(
                '🔁 ${l.t('vocab_practice_repeat')}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.5,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ],
            if (widget.capped) ...[
              const SizedBox(height: 12),
              InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const PremiumScreen()),
                ),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: DuoColors.yellow.withValues(alpha: 0.16),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: DuoColors.yellow, width: 1.5),
                  ),
                  child: Row(
                    children: [
                      const Text('👑', style: TextStyle(fontSize: 20)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          l
                              .t('quiz_free_cap')
                              .replaceFirst('{n}', '${widget.maxCount}'),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const Icon(Icons.chevron_right_rounded),
                    ],
                  ),
                ),
              ),
            ],
            const SizedBox(height: 18),
            DuoButton(
              label: l.t('kana_mix_start'),
              color: DuoColors.blue,
              onPressed: () => Navigator.of(context).pop(_count),
            ),
          ],
        ),
      ),
    );
  }
}
