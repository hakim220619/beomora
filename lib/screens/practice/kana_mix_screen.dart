import 'dart:math';

import 'package:flutter/material.dart';

import '../../data/question_bank.dart';
import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../models/guide.dart';
import '../../theme.dart';
import '../../widgets/duo_button.dart';
import '../../widgets/study/study_background.dart';
import 'letter_quiz_screen.dart';

/// Tebak Kana Campur: racik sendiri paket kuis kana — hiragana
/// dan/atau katakana, huruf dasar, dakuten & handakuten, yōon —
/// lalu pilih bebas berapa soal. Kuisnya memakai [LetterQuizScreen].
class KanaMixScreen extends StatefulWidget {
  final Course course;

  const KanaMixScreen({super.key, required this.course});

  @override
  State<KanaMixScreen> createState() => _KanaMixScreenState();
}

class _KanaMixScreenState extends State<KanaMixScreen> {
  static const _presets = [10, 20, 30, 50, 100];
  static const _minCount = 5;

  final Set<String> _scripts = {'hiragana', 'katakana'};
  final Set<KanaGroup> _groups = {KanaGroup.base, KanaGroup.dakuten};
  int _count = 20;

  List<KanaItem> get _pool => [
    for (final script in _scripts)
      for (final group in _groups) ...kanaGroup(script, group),
  ];

  void _toggle<T>(Set<T> set, T value) {
    setState(() {
      // Minimal satu pilihan tetap aktif.
      if (set.contains(value)) {
        if (set.length > 1) set.remove(value);
      } else {
        set.add(value);
      }
    });
  }

  void _start(int poolSize) {
    final l = L.of(context);
    final cat = LetterQuizCategory(
      id: 'kana_custom',
      emoji: '🔀',
      title: {'id': l.t('kana_mix_title'), 'en': l.t('kana_mix_title')},
      items: _pool,
      ttsLocale: 'ja-JP',
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => LetterQuizScreen(
          course: widget.course,
          customCategory: cat,
          questionCount: min(_count, poolSize),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final poolSize = _pool.length;
    final count = min(_count, poolSize);
    final maxSlider = max(poolSize, _minCount + 1).toDouble();

    return StudyScaffold(
      appBar: AppBar(title: Text(l.t('kana_mix_title'))),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          _Heading(l.t('kana_mix_scripts')),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _chip(
                'あ  Hiragana',
                _scripts.contains('hiragana'),
                () => _toggle(_scripts, 'hiragana'),
              ),
              _chip(
                'ア  Katakana',
                _scripts.contains('katakana'),
                () => _toggle(_scripts, 'katakana'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _Heading(l.t('kana_mix_groups')),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _chip(
                l.t('kana_mix_base'),
                _groups.contains(KanaGroup.base),
                () => _toggle(_groups, KanaGroup.base),
              ),
              _chip(
                l.t('kana_mix_dakuten'),
                _groups.contains(KanaGroup.dakuten),
                () => _toggle(_groups, KanaGroup.dakuten),
              ),
              _chip(
                l.t('kana_mix_yoon'),
                _groups.contains(KanaGroup.yoon),
                () => _toggle(_groups, KanaGroup.yoon),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            '$poolSize ${l.t('letters')}',
            style: TextStyle(
              fontSize: 12.5,
              color: Theme.of(context).hintColor,
            ),
          ),
          const SizedBox(height: 20),
          _Heading(l.t('kana_mix_count')),
          Center(
            child: Text(
              '$count ${l.t('kana_mix_questions')}',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: DuoColors.blue,
              ),
            ),
          ),
          Slider(
            value: count.toDouble().clamp(_minCount.toDouble(), maxSlider),
            min: _minCount.toDouble(),
            max: maxSlider,
            divisions: (maxSlider - _minCount).round(),
            label: '$count',
            activeColor: DuoColors.blue,
            onChanged: (v) => setState(() => _count = v.round()),
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final n in _presets)
                if (n < poolSize)
                  _chip('$n', count == n, () => setState(() => _count = n)),
              _chip(
                '${l.t('kana_mix_all')} ($poolSize)',
                count == poolSize,
                () => setState(() => _count = poolSize),
              ),
            ],
          ),
          const SizedBox(height: 28),
          DuoButton(
            label: l.t('kana_mix_start'),
            color: DuoColors.blue,
            onPressed: () => _start(poolSize),
          ),
        ],
      ),
    );
  }

  Widget _chip(String label, bool selected, VoidCallback onTap) {
    return FilterChip(
      label: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          color: selected ? Colors.white : null,
        ),
      ),
      selected: selected,
      showCheckmark: false,
      selectedColor: DuoColors.blue,
      onSelected: (_) => onTap(),
    );
  }
}

class _Heading extends StatelessWidget {
  final String text;
  const _Heading(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
      ),
    );
  }
}
