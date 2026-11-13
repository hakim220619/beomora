import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/question_bank.dart';
import '../../data/spell_tiles.dart';
import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../models/exercise.dart';
import '../../models/guide.dart';
import '../../providers/auth_provider.dart';
import '../../providers/progress_provider.dart';
import '../../screens/premium_screen.dart';
import '../../services/kana_speech.dart';
import '../../services/tts_service.dart';
import '../../theme.dart';
import '../../widgets/choice_card.dart';
import '../../widgets/duo_button.dart';
import '../../widgets/exercises/token_exercise.dart';
import '../../widgets/study/pencil_progress_bar.dart';
import '../../widgets/study/quiz_result_view.dart';
import '../../widgets/study/study_background.dart';

/// Satu soal tebak huruf: lambang → bacaan, atau sebaliknya.
class _Question {
  final String prompt;
  final String answer;
  final List<String> options;
  final String symbol; // lambang asli (kana/kanji/kata)
  final String speakText; // yang diucapkan TTS
  final bool symbolToReading;
  final String promptKey; // kunci l10n teks pertanyaan
  /// Soal susun huruf: kotak acak (jawaban + pengecoh). null = pilihan
  /// ganda.
  final List<String>? tiles;

  const _Question({
    required this.prompt,
    required this.answer,
    required this.options,
    required this.symbol,
    required this.speakText,
    required this.symbolToReading,
    required this.promptKey,
    this.tiles,
  });
}

/// Tebak Huruf: kuis dari bank soal [letterQuizFor] — hiragana/katakana
/// untuk Jepang, nama huruf alfabet untuk Inggris & Indonesia.
class LetterQuizScreen extends StatefulWidget {
  final Course course;

  /// Kalau diisi (mis. dari tombol latihan di halaman Materi),
  /// kuis langsung mulai di paket ini tanpa lewat pemilih paket.
  final String? initialCategoryId;

  /// Paket racikan sendiri (mis. dari Tebak Kana Campur): kuis
  /// langsung mulai di paket ini, di luar daftar [letterQuizFor].
  final LetterQuizCategory? customCategory;

  /// Jumlah soal per sesi. Paket bawaan dibatasi jumlah hurufnya;
  /// paket racikan ([customCategory]) yang isinya lebih sedikit
  /// diisi ulang dengan item acak dari paket yang sama.
  final int questionCount;

  /// Mode "Susun huruf" (Latihan Kosakata, Tebak Kata, Tebak Kanji):
  /// arti ditampilkan, pengguna menyusun kata dari kotak huruf acak
  /// (soal kanji "Baca kata": susun bacaannya). Soal yang tidak cocok
  /// disusun (panjang, ungkapan, kanji tunggal) tetap pilihan ganda.
  final bool spell;

  const LetterQuizScreen({
    super.key,
    required this.course,
    this.initialCategoryId,
    this.customCategory,
    this.questionCount = 10,
    this.spell = false,
  });

  @override
  State<LetterQuizScreen> createState() => _LetterQuizScreenState();
}

class _LetterQuizScreenState extends State<LetterQuizScreen> {
  final _rng = Random();

  LetterQuizCategory? _category;
  List<_Question> _questions = [];
  int _index = 0;
  int _correct = 0;
  String? _picked; // jawaban yang dipilih di soal aktif
  String _spellInput = ''; // susunan kotak saat ini (mode susun huruf)
  final List<_Question> _missed = []; // soal yang dijawab salah
  bool _finished = false;
  int _earnedXp = 0;

  @override
  void initState() {
    super.initState();
    final custom = widget.customCategory;
    if (custom != null) {
      _startInternal(custom);
      return;
    }
    // Lompat langsung ke paket yang diminta (mis. dari halaman Materi).
    // Paket premium tidak dilompati untuk pengguna gratis: pemilih
    // paket tetap tampil dengan kartu bergembok.
    final id = widget.initialCategoryId;
    if (id != null) {
      final matches = letterQuizFor(widget.course.id).where((c) => c.id == id);
      if (matches.isNotEmpty) {
        final cat = matches.first;
        final isPremium = context.read<AuthProvider>().isPremium;
        if (!cat.premium || isPremium) _startInternal(cat);
      }
    }
  }

  @override
  void dispose() {
    TtsService.instance.stop();
    super.dispose();
  }

  void _start(LetterQuizCategory cat) => setState(() => _startInternal(cat));

  void _startInternal(LetterQuizCategory cat) {
    _category = cat;
    _questions = [for (final item in _pickItems(cat)) _makeQuestion(cat, item)];
    _index = 0;
    _correct = 0;
    _picked = null;
    _missed.clear();
    _finished = false;
    _earnedXp = 0;
  }

  /// Urutan item soal, diacak. Kalau jumlah soal paket racikan
  /// melebihi isinya, item diulang merata (selisih maks. satu kali)
  /// dan disusun agar soal yang sama tidak muncul berturut-turut.
  List<KanaItem> _pickItems(LetterQuizCategory cat) {
    final items = [...cat.items]..shuffle(_rng);
    final count = widget.customCategory == null
        ? min(widget.questionCount, items.length)
        : widget.questionCount;
    if (count <= items.length) return items.take(count).toList();
    // Sisa jatah setiap item (per indeks); kelebihannya jatuh ke item
    // terdepan hasil acak.
    final left = [
      for (var i = 0; i < items.length; i++)
        count ~/ items.length + (i < count % items.length ? 1 : 0),
    ];
    final out = <int>[];
    for (var n = count; n > 0; n--) {
      final open = [
        for (var i = 0; i < items.length; i++)
          if (left[i] > 0 && (out.isEmpty || i != out.last)) i,
      ];
      // Item yang jatahnya lebih dari separuh sisa soal wajib diambil
      // sekarang, kalau tidak nanti terpaksa berurutan.
      final forced = open.where((i) => left[i] * 2 > n);
      final pick = open.isEmpty
          ? left.indexWhere((c) => c > 0)
          : forced.isNotEmpty
          ? forced.first
          : open[_rng.nextInt(open.length)];
      out.add(pick);
      left[pick]--;
    }
    return [for (final i in out) items[i]];
  }

  _Question _makeQuestion(LetterQuizCategory cat, KanaItem item) {
    // Susun huruf: kata biasa → tampil arti, susun katanya; kanji
    // "Baca kata" → tampil kata kanjinya, susun bacaan kananya. Jenis
    // kuis kanji lain (arti / bacaan on-kun) tetap pilihan ganda.
    final (String, String, String)? spell = !widget.spell
        ? null
        : switch (item) {
            QuizItem(kind: 'word') when item.kana != item.romaji => (
              item.kana,
              item.romaji,
              'spell_prompt_reading',
            ),
            QuizItem() => null,
            _ => (item.romaji, item.kana, 'unscramble'),
          };
    final units = spell == null ? null : spellUnits(spell.$2);
    if (spell != null && units != null) {
      return _Question(
        prompt: spell.$1,
        answer: spell.$2,
        options: const [],
        symbol: item.kana,
        speakText:
            (item is QuizItem ? item.speak : null) ??
            cat.spokenForm?.call(item) ??
            item.kana,
        symbolToReading: false,
        promptKey: spell.$3,
        tiles: spellTiles(units, _rng),
      );
    }
    final symbolToReading = _rng.nextBool();
    // Kumpulkan 3 pengecoh unik dari paket yang sama.
    String sideOf(KanaItem i) => symbolToReading ? i.romaji : i.kana;
    final answer = sideOf(item);
    final options = <String>{answer};
    final pool = [...(cat.distractors ?? cat.items)]..shuffle(_rng);
    // Kuis campuran (QuizItem): pengecoh hanya dari jenis soal yang sama.
    final kind = item is QuizItem ? item.kind : null;
    for (final p in pool) {
      if (options.length >= 4) break;
      if ((p is QuizItem ? p.kind : null) != kind) continue;
      // Jangan sampai ada dua jawaban benar: di arah bacaan → lambang,
      // lambang lain dengan bacaan sama (mis. あ vs ア di paket
      // campuran, ず vs づ) tidak boleh jadi pengecoh.
      if (!symbolToReading && p.romaji == item.romaji) continue;
      // Begitu pula arah sebaliknya: lambang sama dengan bacaan/arti
      // lain (kata yang sama di dua level JLPT) bukan pengecoh.
      if (symbolToReading && p.kana == item.kana) continue;
      options.add(sideOf(p));
    }
    return _Question(
      prompt: symbolToReading ? item.kana : item.romaji,
      answer: answer,
      options: options.toList()..shuffle(_rng),
      symbol: item.kana,
      speakText:
          (item is QuizItem ? item.speak : null) ??
          cat.spokenForm?.call(item) ??
          spokenFormOf(item),
      symbolToReading: symbolToReading,
      promptKey: switch ((item, symbolToReading)) {
        (QuizItem i, true) => i.symbolPromptKey,
        (QuizItem i, false) => i.readingPromptKey,
        (_, true) => cat.symbolPromptKey,
        (_, false) => cat.readingPromptKey,
      },
    );
  }

  Future<void> _answer(String option) async {
    if (_picked != null) return;
    final q = _questions[_index];
    setState(() => _picked = option);
    if (option == q.answer) {
      _correct++;
    } else {
      _missed.add(q);
    }
    unawaited(TtsService.instance.speak(q.speakText, _category!.ttsLocale));
    await Future<void>.delayed(const Duration(milliseconds: 900));
    if (!mounted) return;
    _advance();
  }

  /// Susun huruf: periksa susunan [_spellInput]; lanjut lewat tombol
  /// agar jawaban yang benar sempat dibaca.
  void _checkSpell() {
    if (_picked != null || _spellInput.isEmpty) return;
    final q = _questions[_index];
    setState(() => _picked = _spellInput);
    if (_spellInput == q.answer) {
      _correct++;
    } else {
      _missed.add(q);
    }
    unawaited(TtsService.instance.speak(q.speakText, _category!.ttsLocale));
  }

  void _setSpellInput(String v) => setState(() => _spellInput = v);

  void _advance() {
    _spellInput = '';
    if (_index + 1 < _questions.length) {
      setState(() {
        _index++;
        _picked = null;
      });
    } else {
      _finish();
    }
  }

  void _finish() {
    final progress = context.read<ProgressProvider>();
    // Streak + pulihkan 1 nyawa (+5 XP), plus 1 XP per jawaban benar.
    final baseXp = progress.completePractice();
    final bonusXp = _correct > 0 ? progress.addXp(_correct) : 0;
    setState(() {
      _earnedXp = baseXp + bonusXp;
      _finished = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return StudyScaffold(
      appBar: AppBar(
        title: Text(
          widget.customCategory == null
              ? l.t('letter_quiz')
              : widget.customCategory!.title[l.code] ??
                    widget.customCategory!.title['id']!,
        ),
      ),
      body: _category == null
          ? _buildPicker(l)
          : _finished
          ? QuizResultView(
              correct: _correct,
              total: _questions.length,
              earnedXp: _earnedXp,
              review: _missed.isEmpty
                  ? null
                  : Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final q in _missed)
                          _MissedChip(
                            symbol: q.symbol,
                            reading: q.symbolToReading ? q.answer : q.prompt,
                            onTap: () => TtsService.instance.speak(
                              q.speakText,
                              _category!.ttsLocale,
                            ),
                          ),
                      ],
                    ),
              onAgain: () => _start(_category!),
              onDone: () => Navigator.of(context).pop(),
            )
          : _buildQuiz(l),
    );
  }

  Widget _buildPicker(L l) {
    final categories = letterQuizFor(widget.course.id);
    final isPremium = context.watch<AuthProvider>().isPremium;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: [
        Text(
          l.t('quiz_pick'),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 12),
        for (final cat in categories)
          _CategoryCard(
            cat: cat,
            locked: cat.premium && !isPremium,
            l: l,
            onTap: () {
              if (cat.premium && !isPremium) {
                // Paket premium → tawarkan upgrade.
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const PremiumScreen()),
                );
              } else {
                _start(cat);
              }
            },
          ),
      ],
    );
  }

  Widget _buildQuiz(L l) {
    final q = _questions[_index];
    if (q.tiles != null) return _buildSpell(l, q);
    ChoiceState stateFor(String option) {
      if (_picked == null) return ChoiceState.idle;
      if (option == q.answer) return ChoiceState.correct;
      if (option == _picked) return ChoiceState.wrong;
      return ChoiceState.disabled;
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      children: [
        Row(
          children: [
            Expanded(
              child: PencilProgressBar(
                value: (_index + (_picked == null ? 0 : 1)) / _questions.length,
                height: 14,
                color: DuoColors.blue,
                showPencil: true,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '${_index + 1}/${_questions.length}',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Theme.of(context).hintColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          l.t(q.promptKey),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 14),
        // Lambang/bacaan yang ditanyakan — besar di tengah.
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 28),
            child: Text(
              q.prompt,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: q.symbolToReading ? 56 : 40,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        const SizedBox(height: 18),
        for (final option in q.options)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ChoiceCard(
              label: option,
              state: stateFor(option),
              onTap: _picked == null ? () => _answer(option) : null,
            ),
          ),
      ],
    );
  }
}

extension on _LetterQuizScreenState {
  Widget _progress(int answered) => Row(
    children: [
      Expanded(
        child: PencilProgressBar(
          value: answered / _questions.length,
          height: 14,
          color: DuoColors.blue,
          showPencil: true,
        ),
      ),
      const SizedBox(width: 10),
      Text(
        '${_index + 1}/${_questions.length}',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          color: Theme.of(context).hintColor,
        ),
      ),
    ],
  );

  /// Soal susun huruf: arti + kotak huruf acak, tombol Periksa → umpan
  /// balik (benar / jawaban yang benar) → Lanjut.
  Widget _buildSpell(L l, _Question q) {
    final checked = _picked != null;
    final ok = _picked == q.answer;
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      children: [
        _progress(_index + (checked ? 1 : 0)),
        const SizedBox(height: 20),
        TokenExercise(
          key: ValueKey('spell_$_index'),
          exercise: Exercise(
            type: ExerciseType.scramble,
            prompt: q.prompt,
            answer: q.answer,
            options: q.tiles!,
          ),
          locked: checked,
          onAnswer: _setSpellInput,
          title: l.t(q.promptKey),
        ),
        Align(
          child: TextButton.icon(
            onPressed: () =>
                TtsService.instance.speak(q.speakText, _category!.ttsLocale),
            icon: const Icon(Icons.volume_up_rounded, color: DuoColors.blue),
            label: Text(l.t('spell_hint')),
          ),
        ),
        const SizedBox(height: 12),
        if (checked)
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: (ok ? DuoColors.green : DuoColors.red).withValues(
                alpha: 0.14,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              children: [
                Text(
                  l.t(ok ? 'correct' : 'wrong'),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: ok ? DuoColors.green : DuoColors.red,
                  ),
                ),
                if (!ok)
                  Text(
                    '${l.t('handwriting_answer')}: ${q.answer}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
              ],
            ),
          ),
        DuoButton(
          label: l.t(checked ? 'handwriting_next' : 'handwriting_check'),
          color: checked
              ? (ok ? DuoColors.green : DuoColors.red)
              : DuoColors.blue,
          onPressed: checked
              ? _advance
              : (_spellInput.isEmpty ? null : _checkSpell),
        ),
      ],
    );
  }
}

/// Kartu satu paket soal di pemilih; paket premium tampil dengan
/// gembok untuk pengguna gratis (ketuk → tawaran Premium).
class _CategoryCard extends StatelessWidget {
  final LetterQuizCategory cat;
  final bool locked;
  final L l;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.cat,
    required this.locked,
    required this.l,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final accent = locked ? DuoColors.purple : DuoColors.blue;
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(14),
                ),
                alignment: Alignment.center,
                child: Text(cat.emoji, style: const TextStyle(fontSize: 26)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cat.title[l.code] ?? cat.title['id']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      locked
                          ? l.t('premium_locked')
                          : '${cat.items.length} ${l.t('letters')}',
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: locked ? FontWeight.w800 : FontWeight.w400,
                        color: locked
                            ? DuoColors.purple
                            : Theme.of(context).hintColor,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                locked ? Icons.lock_rounded : Icons.chevron_right_rounded,
                color: locked ? DuoColors.purple : Theme.of(context).hintColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Huruf yang terlewat: lambang + bacaan, ketuk untuk mendengar.
class _MissedChip extends StatelessWidget {
  final String symbol;
  final String reading;
  final VoidCallback onTap;

  const _MissedChip({
    required this.symbol,
    required this.reading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              symbol,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            const SizedBox(width: 6),
            Text(
              reading,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).hintColor,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.volume_up_rounded,
              size: 16,
              color: DuoColors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
