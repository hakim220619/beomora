import 'dart:async';
import 'dart:math' show min;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../models/exercise.dart';
import '../../providers/progress_provider.dart';
import '../../providers/settings_provider.dart';
import '../../services/exercise_generator.dart';
import '../../theme.dart';
import '../../widgets/choice_card.dart';
import '../../widgets/duo_button.dart';
import '../../widgets/study/study_background.dart';
import '../../widgets/study/pencil_progress_bar.dart';

class TimeChallengeScreen extends StatefulWidget {
  final Course course;
  const TimeChallengeScreen({super.key, required this.course});

  @override
  State<TimeChallengeScreen> createState() => _TimeChallengeScreenState();
}

class _TimeChallengeScreenState extends State<TimeChallengeScreen> {
  /// Jumlah soal diisi sendiri: 1 s.d. jumlah kata unik kursus (soal
  /// tidak berulang), atau tanpa batas.
  static const minCount = 1;

  /// Waktu diisi sendiri dalam menit: 1 menit s.d. 10 jam.
  static const minMinutes = 1;
  static const maxMinutes = 600;

  final _generator = ExerciseGenerator();
  Timer? _timer;
  bool _limitOn = false; // bawaan: tanpa batas (jawab sebanyak mungkin)
  /// Kata unik kursus = soal berbeda yang tersedia.
  late final List<WordItem> _words = ExerciseGenerator.uniqueWords(
    widget.course,
  );
  late final int _maxCount = min(999, _words.length);
  late int _countValue = min(20, _maxCount);
  late final _countCtrl = TextEditingController(text: '$_countValue');

  /// Antrean kata acak; diambil berurutan sehingga tak ada soal ulang
  /// sampai semua kata keluar (mode tanpa batas lalu diacak ulang).
  final List<WordItem> _deck = [];

  /// Batas soal sesi ini; null = tanpa batas.
  int? get _count => _limitOn ? _countValue : null;
  int _minutes = minMinutes; // bawaan: 1 menit
  late final _minutesCtrl = TextEditingController(text: '$_minutes');
  int _totalSeconds = 60;
  int _secondsLeft = 60;
  int _score = 0;
  int _answered = 0;
  bool _allDone = false; // berakhir karena semua soal terjawab
  bool _running = false;
  bool _finished = false;
  Exercise? _question;
  String? _picked; // jawaban yang barusan ditap (untuk warna feedback)
  bool _locked = false;

  @override
  void dispose() {
    _timer?.cancel();
    _minutesCtrl.dispose();
    _countCtrl.dispose();
    super.dispose();
  }

  String get _uiLang => context.read<SettingsProvider>().uiLang;

  void _start() {
    setState(() {
      _running = true;
      _finished = false;
      _score = 0;
      _answered = 0;
      _allDone = false;
      _totalSeconds = _minutes * 60;
      _secondsLeft = _totalSeconds;
      _deck.clear();
      _nextQuestion();
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_secondsLeft <= 1) {
        t.cancel();
        _end();
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  void _nextQuestion() {
    if (_deck.isEmpty) _deck.addAll(_words.toList()..shuffle());
    _question = _generator.choiceFor(
      widget.course,
      _deck.removeLast(),
      _uiLang,
    );
    _picked = null;
    _locked = false;
  }

  void _answer(String option) {
    if (_locked || _question == null) return;
    _locked = true;
    final correct = option == _question!.answer;
    if (correct) {
      HapticFeedback.lightImpact();
      _score++;
    } else {
      HapticFeedback.heavyImpact();
    }
    _answered++;
    setState(() => _picked = option);
    Timer(Duration(milliseconds: correct ? 350 : 800), () {
      if (!mounted || !_running) return;
      if (_count != null && _answered >= _count!) {
        _allDone = true;
        _end();
      } else {
        setState(_nextQuestion);
      }
    });
  }

  /// Ubah menit (tombol −/+ atau ketik); di luar 1–600 dijepit.
  void _setMinutes(int v, {bool syncText = true}) {
    setState(() => _minutes = v.clamp(minMinutes, maxMinutes));
    if (syncText) _minutesCtrl.text = '$_minutes';
  }

  /// Ubah jumlah soal; menyentuh isian otomatis mematikan "tanpa batas".
  void _setCount(int v, {bool syncText = true}) {
    setState(() {
      _limitOn = true;
      _countValue = v.clamp(minCount, _maxCount);
    });
    if (syncText) _countCtrl.text = '$_countValue';
  }

  /// "90 menit" → "1 jam 30 menit" sebagai keterangan.
  String _durationLabel(L l, int minutes) {
    final h = minutes ~/ 60, m = minutes % 60;
    final hours = l.t('time_hours').replaceFirst('{n}', '$h');
    final mins = l.t('time_minutes').replaceFirst('{n}', '$m');
    if (h == 0) return mins;
    return m == 0 ? hours : '$hours $mins';
  }

  /// Sisa waktu: m:ss, atau j:mm:ss bila ≥ 1 jam.
  static String _clock(int s) {
    String two(int n) => n.toString().padLeft(2, '0');
    final h = s ~/ 3600, m = (s % 3600) ~/ 60, sec = s % 60;
    return h > 0 ? '$h:${two(m)}:${two(sec)}' : '$m:${two(sec)}';
  }

  void _end() {
    _timer?.cancel();
    _running = false;
    _finished = true;
    context.read<ProgressProvider>().reportTimeChallenge(_score);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final progress = context.watch<ProgressProvider>();

    return StudyScaffold(
      appBar: AppBar(title: Text(l.t('time_challenge'))),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: !_running ? _buildIdle(l, progress) : _buildGame(l),
      ),
    );
  }

  /// Isian angka dengan tombol −/+ di kiri-kanan. Ketik bebas; nilai
  /// dijepit ke [min]–[max] saat selesai mengetik.
  List<Widget> _numberInput({
    required TextEditingController controller,
    required int value,
    required int min,
    required int max,
    required String unit,
    required void Function(int v, {bool syncText}) onSet,
    bool dimmed = false,
  }) {
    final hint = Theme.of(context).hintColor;
    void commit() {
      final n = int.tryParse(controller.text);
      onSet(n ?? value);
      FocusScope.of(context).unfocus();
    }

    return [
      IconButton.filledTonal(
        onPressed: dimmed || value > min
            ? () => onSet(dimmed ? value : value - 1)
            : null,
        icon: const Icon(Icons.remove_rounded),
      ),
      SizedBox(
        // Muat 3 digit + satuan tanpa terpotong (mis. "600 mnt").
        width: 150,
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(3),
          ],
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
            color: dimmed ? hint : DuoColors.orange,
          ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            suffixText: unit,
            suffixStyle: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: hint,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onChanged: (v) {
            final n = int.tryParse(v);
            if (n != null) onSet(n, syncText: n > max);
          },
          onEditingComplete: commit,
          onTapOutside: (_) {
            if (FocusScope.of(context).hasFocus) commit();
          },
        ),
      ),
      IconButton.filledTonal(
        onPressed: dimmed || value < max
            ? () => onSet(dimmed ? value : value + 1)
            : null,
        icon: const Icon(Icons.add_rounded),
      ),
    ];
  }

  Widget _buildIdle(L l, ProgressProvider progress) {
    return ListView(
      children: [
        const SizedBox(height: 8),
        Text(
          _finished ? '⏰' : '⏱️',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 64),
        ),
        const SizedBox(height: 16),
        Text(
          _finished
              ? (_allDone ? l.t('time_all_done') : l.t('time_up'))
              : l.t('time_desc'),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 12),
        if (_finished) ...[
          Text(
            _count == null
                ? '${l.t('score')}: $_score  (+$_score XP ⚡)'
                : '${l.t('score')}: $_score/$_count  (+$_score XP ⚡)',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: DuoColors.orange,
            ),
          ),
          const SizedBox(height: 4),
        ],
        Text(
          '${l.t('best')}: ${progress.bestTimeChallenge}',
          textAlign: TextAlign.center,
          style: TextStyle(color: Theme.of(context).hintColor),
        ),
        const SizedBox(height: 24),
        _OptionGroup(
          title: l.t('time_count'),
          children: _numberInput(
            controller: _countCtrl,
            value: _countValue,
            min: minCount,
            max: _maxCount,
            unit: l.t('kana_mix_questions'),
            onSet: _setCount,
            dimmed: !_limitOn,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          l.t('questions_available').replaceFirst('{n}', '$_maxCount'),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).hintColor,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: FilterChip(
            label: Text(
              '∞ ${l.t('time_unlimited')}',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: _limitOn ? null : Colors.white,
              ),
            ),
            selected: !_limitOn,
            showCheckmark: false,
            selectedColor: DuoColors.orange,
            visualDensity: VisualDensity.compact,
            onSelected: (on) => setState(() => _limitOn = !on),
          ),
        ),
        const SizedBox(height: 16),
        _OptionGroup(
          title: l.t('time_duration'),
          children: _numberInput(
            controller: _minutesCtrl,
            value: _minutes,
            min: minMinutes,
            max: maxMinutes,
            unit: l.t('time_minutes_unit'),
            onSet: _setMinutes,
          ),
        ),
        // Keterangan jam hanya bila ≥ 60 menit (mis. "= 1 jam 30 menit").
        if (_minutes >= 60) ...[
          const SizedBox(height: 6),
          Text(
            '= ${_durationLabel(l, _minutes)}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).hintColor,
            ),
          ),
        ],
        const SizedBox(height: 28),
        DuoButton(
          label: _finished ? l.t('play_again') : l.t('start_lesson'),
          color: DuoColors.orange,
          onPressed: _start,
        ),
      ],
    );
  }

  Widget _buildGame(L l) {
    final q = _question!;
    final urgent = _secondsLeft <= 10;
    final countText = _count == null
        ? null
        : l
              .t('time_question_of')
              .replaceFirst('{i}', '${min(_answered + 1, _count!)}')
              .replaceFirst('{n}', '$_count');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '⏱ ${_clock(_secondsLeft)}',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: urgent ? DuoColors.red : DuoColors.orange,
              ),
            ),
            Text(
              '${l.t('score')}: $_score',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: DuoColors.green,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        PencilProgressBar(
          value: _secondsLeft / _totalSeconds,
          height: 12,
          color: urgent ? DuoColors.red : DuoColors.orange,
        ),
        if (countText != null) ...[
          const SizedBox(height: 8),
          Text(
            countText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Theme.of(context).hintColor,
            ),
          ),
        ],
        const SizedBox(height: 24),
        Text(
          q.prompt,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
        ),
        if (q.promptSub != null)
          Text(
            q.promptSub!,
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).hintColor),
          ),
        const SizedBox(height: 24),
        Expanded(
          child: ListView(
            children: [
              for (final option in q.options) ...[
                ChoiceCard(
                  label: option,
                  compact: true,
                  state: _picked == null
                      ? ChoiceState.idle
                      : option == q.answer
                      ? ChoiceState.correct
                      : option == _picked
                      ? ChoiceState.wrong
                      : ChoiceState.disabled,
                  onTap: () => _answer(option),
                ),
                const SizedBox(height: 10),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

/// Judul kecil + deretan chip pilihan.
class _OptionGroup extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _OptionGroup({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 8),
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: children,
        ),
      ],
    );
  }
}
