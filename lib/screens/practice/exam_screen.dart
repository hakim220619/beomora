import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/exam_blueprints.dart';
import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../models/exam.dart';
import '../../providers/progress_provider.dart';
import '../../services/tts_service.dart';
import '../../theme.dart';
import '../../widgets/choice_card.dart';
import '../../widgets/duo_button.dart';
import '../../widgets/duo_dialog.dart';
import '../../widgets/study/pencil_progress_bar.dart';
import '../../widgets/study/study_background.dart';
import 'exam_list_screen.dart';

enum _Phase { sectionIntro, running, result }

/// Simulasi ujian: bagian demi bagian dengan batas waktu, tanpa umpan
/// balik benar/salah sampai selesai. Reading menampilkan bacaan, listening
/// membacakan transkrip lewat TTS dengan jatah putar, writing berupa
/// isian yang diketik. Hasil: skor per bagian + perkiraan skor resmi.
class ExamScreen extends StatefulWidget {
  final Course course;
  final ExamBlueprint exam;
  final bool mini;

  const ExamScreen({
    super.key,
    required this.course,
    required this.exam,
    required this.mini,
  });

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  final _rng = Random();
  late ExamSession _session;
  _Phase _phase = _Phase.sectionIntro;
  int _sectionIdx = 0;
  int _itemIdx = 0;

  Timer? _timer;
  int _secondsLeft = 0;

  /// Pemutaran audio yang sudah dipakai per bacaan listening.
  final Map<String, int> _plays = {};
  bool _playing = false;
  int _gen = 0;

  final _typeCtrl = TextEditingController();
  int _earnedXp = 0;
  late ExamScore _score;

  @override
  void initState() {
    super.initState();
    _build();
  }

  void _build() {
    _session = ExamSession.build(
      widget.exam,
      _rng,
      mini: widget.mini,
      miniTotal: kFreeExamQuestions,
    );
    _phase = _Phase.sectionIntro;
    _sectionIdx = 0;
    _itemIdx = 0;
    _plays.clear();
    _earnedXp = 0;
    _stopTimer();
  }

  @override
  void dispose() {
    _gen++;
    _stopTimer();
    _typeCtrl.dispose();
    TtsService.instance.stop();
    super.dispose();
  }

  // --- Bagian & timer ------------------------------------------------------

  ExamSection get _section => _session.sections[_sectionIdx];
  List<ExamItem> get _items => _session.items[_sectionIdx];
  ExamItem get _item => _items[_itemIdx];

  void _beginSection() {
    setState(() {
      _phase = _Phase.running;
      _itemIdx = 0;
      _secondsLeft = _section.minutes * 60;
      _syncTypeField();
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      if (_secondsLeft <= 1) {
        _onTimeUp();
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _onTimeUp() {
    _stopTimer();
    _stopAudio();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(L.read(context).t('exam_time_up'))));
    _endSection();
  }

  Future<void> _finishSectionPressed() async {
    _commitTyping();
    final unanswered = _items.where((e) => !e.answered).length;
    if (unanswered > 0) {
      final l = L.read(context);
      final ok = await showDuoConfirm(
        context,
        emoji: '⏳',
        title: l.t('exam_finish_section'),
        message: l.t('exam_finish_confirm').replaceFirst('{n}', '$unanswered'),
        confirmLabel: l.t('ok'),
        cancelLabel: l.t('cancel'),
      );
      if (!ok || !mounted) return;
    }
    _stopTimer();
    _stopAudio();
    _endSection();
  }

  void _endSection() {
    if (_sectionIdx + 1 < _session.sections.length) {
      setState(() {
        _sectionIdx++;
        _phase = _Phase.sectionIntro;
      });
    } else {
      _finishExam();
    }
  }

  void _finishExam() {
    final progress = context.read<ProgressProvider>();
    _score = ExamScore.compute(widget.exam.scoring, _session.results);
    final label = widget.mini
        ? '${_session.totalCorrect}/${_session.totalQuestions}'
        : _score.overall;
    final xp = progress.reportExam(
      examId: widget.exam.id + (widget.mini ? '_mini' : ''),
      correct: _session.totalCorrect,
      total: _session.totalQuestions,
      scoreLabel: label,
    );
    setState(() {
      _earnedXp = xp;
      _phase = _Phase.result;
    });
  }

  // --- Navigasi soal -------------------------------------------------------

  void _syncTypeField() {
    if (_items.isEmpty) return;
    _typeCtrl.text = _item.isTyping ? (_item.userAnswer ?? '') : '';
  }

  void _commitTyping() {
    if (_items.isEmpty || !_item.isTyping) return;
    _item.userAnswer = _typeCtrl.text;
  }

  void _go(int delta) {
    _commitTyping();
    final next = _itemIdx + delta;
    if (next < 0 || next >= _items.length) return;
    // Pindah bacaan listening → hentikan audio.
    if (_items[next].passageId != _item.passageId) _stopAudio();
    setState(() {
      _itemIdx = next;
      _syncTypeField();
    });
  }

  void _pick(String option) {
    setState(
      () => _item.userAnswer = _item.userAnswer == option ? null : option,
    );
  }

  // --- Audio listening -----------------------------------------------------

  int _playsLeft(ExamItem it) {
    final max = _section.maxPlays;
    if (max == 0) return 1;
    return max - (_plays[it.passageId!] ?? 0);
  }

  Future<void> _play(ExamItem it) async {
    if (_playing || _playsLeft(it) <= 0) return;
    final id = it.passageId!;
    _plays[id] = (_plays[id] ?? 0) + 1;
    final gen = ++_gen;
    setState(() => _playing = true);
    await TtsService.instance.speakAndWait(
      it.passageText!,
      widget.course.ttsLocale,
    );
    if (!mounted || gen != _gen) return;
    setState(() => _playing = false);
  }

  void _stopAudio() {
    _gen++;
    TtsService.instance.stop();
    if (_playing) _playing = false;
  }

  Future<bool> _confirmQuit() async {
    if (_phase == _Phase.result) return true;
    final l = L.read(context);
    return showDuoConfirm(
      context,
      emoji: '🚪',
      title: l.t('exam_quit_title'),
      message: l.t('exam_quit_msg'),
      confirmLabel: l.t('quit'),
      cancelLabel: l.t('cancel'),
    );
  }

  static String _fmt(int s) =>
      '${s ~/ 60}:${(s % 60).toString().padLeft(2, '0')}';

  // --- Build ---------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final title = switch (_phase) {
      _Phase.result => l.t('exam_result_title'),
      _ => widget.exam.title[l.code] ?? widget.exam.title['id']!,
    };
    return PopScope(
      canPop: _phase == _Phase.result,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final quit = await _confirmQuit();
        if (!quit || !context.mounted) return;
        Navigator.of(context).pop();
      },
      child: StudyScaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            if (_phase == _Phase.running)
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: _TimerChip(
                  text: _fmt(_secondsLeft),
                  urgent: _secondsLeft <= 60,
                ),
              ),
          ],
        ),
        body: switch (_phase) {
          _Phase.sectionIntro => _buildSectionIntro(l),
          _Phase.running => _buildRunning(l),
          _Phase.result => _ExamResultView(
            exam: widget.exam,
            session: _session,
            score: _score,
            earnedXp: _earnedXp,
            course: widget.course,
            onAgain: () => setState(_build),
            onDone: () => Navigator.of(context).pop(),
          ),
        },
      ),
    );
  }

  Widget _buildSectionIntro(L l) {
    final s = _section;
    final n = _items.length;
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  examSectionEmoji(s.kind),
                  style: const TextStyle(fontSize: 52),
                ),
                const SizedBox(height: 10),
                Text(
                  l
                      .t('exam_section_of')
                      .replaceFirst('{i}', '${_sectionIdx + 1}')
                      .replaceFirst('{n}', '${_session.sections.length}'),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  examSectionLabel(l, s.kind),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '$n ${l.t('exam_questions')} · '
                  '${s.minutes} ${l.t('exam_minutes')}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                if (widget.mini) ...[
                  const SizedBox(height: 8),
                  Text(
                    '👑 ${l.t('exam_mini_badge')}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        if (s.kind == ExamSectionKind.listening && s.maxPlays > 0)
          _Note(
            '🎧',
            l.t('exam_rule_audio').replaceFirst('{n}', '${s.maxPlays}'),
          ),
        if (s.kind == ExamSectionKind.writing)
          _Note(
            '✍️',
            widget.exam.scoring.isJlpt
                ? l.t('exam_jlpt_writing_note')
                : l.t('exam_writing_note'),
          ),
        _Note('🙈', l.t('exam_rule_feedback')),
        const SizedBox(height: 20),
        DuoButton(
          label: l.t('exam_begin_section'),
          color: DuoColors.purple,
          onPressed: _beginSection,
        ),
      ],
    );
  }

  Widget _buildRunning(L l) {
    final it = _item;
    final answered = _items.where((e) => e.answered).length;
    final last = _itemIdx + 1 == _items.length;
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      children: [
        Row(
          children: [
            Text(
              examSectionEmoji(_section.kind),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: PencilProgressBar(
                value: answered / _items.length,
                height: 14,
                color: DuoColors.purple,
                showPencil: true,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '${_itemIdx + 1}/${_items.length}',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Theme.of(context).hintColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (it.passageText != null && !it.isAudio) _PassageCard(item: it, l: l),
        if (it.isAudio) _buildAudioCard(l, it),
        const SizedBox(height: 12),
        if (it.isTyping) _buildTyping(l, it) else _buildChoice(l, it),
        const SizedBox(height: 18),
        Row(
          children: [
            if (_itemIdx > 0)
              Expanded(
                child: DuoButton(
                  label: l.t('exam_prev'),
                  outlined: true,
                  color: DuoColors.purple,
                  onPressed: () => _go(-1),
                ),
              ),
            if (_itemIdx > 0) const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: DuoButton(
                label: last ? l.t('exam_finish_section') : l.t('exam_next'),
                color: last ? DuoColors.green : DuoColors.purple,
                onPressed: last ? _finishSectionPressed : () => _go(1),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAudioCard(L l, ExamItem it) {
    final left = _playsLeft(it);
    final unlimited = _section.maxPlays == 0;
    final can = !_playing && (unlimited || left > 0);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: can ? () => _play(it) : null,
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: can
                      ? DuoColors.blue
                      : DuoColors.gray.withValues(alpha: 0.5),
                ),
                child: Icon(
                  _playing
                      ? Icons.graphic_eq_rounded
                      : Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    it.passageTitle?[l.code] ?? it.passageTitle?['id'] ?? '',
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _playing
                        ? l.t('exam_playing')
                        : unlimited
                        ? l.t('exam_play_audio')
                        : left > 0
                        ? '${l.t('exam_play_audio')} · '
                              '${l.t('exam_plays_left').replaceFirst('{n}', '$left')}'
                        : l.t('exam_no_plays'),
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChoice(L l, ExamItem it) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 18),
            child: Text(
              it.mcq!.question[l.code] ?? it.mcq!.question['id']!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                height: 1.4,
              ),
            ),
          ),
        ),
        const SizedBox(height: 14),
        for (final option in it.options)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ChoiceCard(
              label: option,
              state: it.userAnswer == option
                  ? ChoiceState.selected
                  : ChoiceState.idle,
              onTap: () => _pick(option),
            ),
          ),
      ],
    );
  }

  Widget _buildTyping(L l, ExamItem it) {
    final w = it.writing!;
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                Text(
                  w.prompt[l.code] ?? w.prompt['id']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  w.text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    height: 1.45,
                  ),
                ),
                if (w.hint != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    '💡 ${w.hint}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        const SizedBox(height: 14),
        TextField(
          controller: _typeCtrl,
          textAlign: TextAlign.center,
          autocorrect: false,
          enableSuggestions: false,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          decoration: InputDecoration(hintText: l.t('exam_type_answer')),
          onChanged: (v) => it.userAnswer = v,
          onSubmitted: (_) => _go(1),
        ),
      ],
    );
  }
}

class _TimerChip extends StatelessWidget {
  final String text;
  final bool urgent;
  const _TimerChip({required this.text, required this.urgent});

  @override
  Widget build(BuildContext context) {
    final color = urgent ? DuoColors.red : DuoColors.purple;
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.16),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color, width: 1.5),
        ),
        child: Row(
          children: [
            Icon(Icons.timer_outlined, size: 16, color: color),
            const SizedBox(width: 4),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: color,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Note extends StatelessWidget {
  final String emoji;
  final String text;
  const _Note(this.emoji, this.text);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(emoji, style: const TextStyle(fontSize: 16)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(text, style: const TextStyle(fontSize: 13, height: 1.35)),
        ),
      ],
    ),
  );
}

/// Bacaan reading: judul + teks yang bisa digulir di dalam kartu.
class _PassageCard extends StatelessWidget {
  final ExamItem item;
  final L l;
  const _PassageCard({required this.item, required this.l});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '📖 ${item.passageTitle?[l.code] ?? item.passageTitle?['id'] ?? l.t('exam_passage')}',
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 8),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 260),
              child: SingleChildScrollView(
                child: SelectableText(
                  item.passageText!,
                  style: const TextStyle(fontSize: 15, height: 1.55),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Hasil ujian: skor total, tabel per bagian dengan perkiraan skor
/// resmi, status lulus (JLPT), XP, dan ulasan soal yang salah.
class _ExamResultView extends StatelessWidget {
  final ExamBlueprint exam;
  final ExamSession session;
  final ExamScore score;
  final int earnedXp;
  final Course course;
  final VoidCallback onAgain;
  final VoidCallback onDone;

  const _ExamResultView({
    required this.exam,
    required this.session,
    required this.score,
    required this.earnedXp,
    required this.course,
    required this.onAgain,
    required this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final hint = Theme.of(context).hintColor;
    final total = session.totalQuestions;
    final correct = session.totalCorrect;
    final pct = total == 0 ? 0 : (correct * 100 / total).round();
    final ring = pct >= 70
        ? DuoColors.green
        : pct >= 50
        ? DuoColors.orange
        : DuoColors.red;
    final passed = score.passed;
    final missed = session.missed;

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(exam.emoji, style: const TextStyle(fontSize: 40)),
                const SizedBox(height: 6),
                Text(
                  '$pct%',
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.w900,
                    color: ring,
                  ),
                ),
                Text(
                  '$correct ${l.t('exam_correct_of')} $total '
                  '${l.t('exam_questions')}',
                  style: TextStyle(color: hint, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 12),
                if (!session.mini) ...[
                  Text(
                    l.t('exam_estimated'),
                    style: TextStyle(fontSize: 12, color: hint),
                  ),
                  Text(
                    score.overall,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  if (passed != null) ...[
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: (passed ? DuoColors.green : DuoColors.red)
                            .withValues(alpha: 0.16),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        passed ? l.t('exam_passed') : l.t('exam_failed'),
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: passed ? DuoColors.green : DuoColors.red,
                        ),
                      ),
                    ),
                  ],
                ],
                const SizedBox(height: 10),
                Text(
                  '+$earnedXp XP',
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: DuoColors.yellow,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 14),
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                for (final r in session.results)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        Text(
                          examSectionEmoji(r.kind),
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            examSectionLabel(l, r.kind),
                            style: const TextStyle(fontWeight: FontWeight.w800),
                          ),
                        ),
                        Text(
                          '${r.correct}/${r.total}',
                          style: TextStyle(color: hint, fontSize: 13),
                        ),
                        if (!session.mini &&
                            score.perSection[r.kind] != null) ...[
                          const SizedBox(width: 12),
                          SizedBox(
                            width: 86,
                            child: Text(
                              score.perSection[r.kind]!,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                if (!session.mini) ...[
                  const Divider(height: 16),
                  Text(
                    l.t('exam_estimate_disclaimer'),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11, color: hint),
                  ),
                ],
              ],
            ),
          ),
        ),
        const SizedBox(height: 18),
        if (missed.isNotEmpty) ...[
          Text(
            l.t('exam_review_title'),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 8),
          for (final m in missed) _MissedCard(item: m, l: l, course: course),
          const SizedBox(height: 10),
        ],
        DuoButton(
          label: l.t('exam_again'),
          color: DuoColors.purple,
          onPressed: onAgain,
        ),
        const SizedBox(height: 10),
        DuoButton(
          label: l.t('ok'),
          outlined: true,
          color: DuoColors.purple,
          onPressed: onDone,
        ),
      ],
    );
  }
}

class _MissedCard extends StatelessWidget {
  final ExamItem item;
  final L l;
  final Course course;
  const _MissedCard({
    required this.item,
    required this.l,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hint = Theme.of(context).hintColor;
    final question = item.isTyping
        ? '${item.writing!.prompt[l.code] ?? item.writing!.prompt['id']!}\n'
              '${item.writing!.text}'
        : item.mcq!.question[l.code] ?? item.mcq!.question['id']!;
    final yours = item.answered ? item.userAnswer! : l.t('exam_unanswered');
    final transcript = item.isAudio ? item.passageText : null;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.08)
            : Colors.white.withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: DuoColors.red.withValues(alpha: 0.5),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${examSectionEmoji(item.section)} $question',
            style: TextStyle(fontSize: 13, color: hint, height: 1.35),
          ),
          const SizedBox(height: 6),
          Text(
            '❌ ${l.t('exam_your_answer')}: $yours',
            style: const TextStyle(fontSize: 13, color: DuoColors.red),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  '✅ ${item.correctAnswer}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: DuoColors.green,
                  ),
                ),
              ),
              IconButton(
                visualDensity: VisualDensity.compact,
                icon: const Icon(Icons.volume_up_rounded, size: 20),
                onPressed: () => TtsService.instance.speak(
                  item.correctAnswer.split(' (').first,
                  course.ttsLocale,
                ),
              ),
            ],
          ),
          if (transcript != null) ...[
            const SizedBox(height: 4),
            Theme(
              data: Theme.of(
                context,
              ).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                childrenPadding: const EdgeInsets.only(bottom: 8),
                title: Text(
                  '🎧 ${l.t('exam_transcript')}',
                  style: TextStyle(fontSize: 12, color: hint),
                ),
                children: [
                  SelectableText(
                    transcript,
                    style: const TextStyle(fontSize: 13, height: 1.5),
                  ),
                  if (item.passageTranslation?[l.code] != null) ...[
                    const SizedBox(height: 6),
                    Text(
                      item.passageTranslation![l.code]!,
                      style: TextStyle(fontSize: 12, color: hint, height: 1.4),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
