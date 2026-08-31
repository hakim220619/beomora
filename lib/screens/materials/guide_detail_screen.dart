import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/question_bank.dart';
import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../models/guide.dart';
import '../../services/tts_service.dart';
import '../../theme.dart';
import '../../widgets/study/study_background.dart';
import '../practice/letter_quiz_screen.dart';

/// Detail satu topik materi: grid kana yang bisa diketuk untuk
/// mendengar pengucapan, paragraf penjelasan, dan contoh berbunyi.
/// Topik yang punya paket di bank soal (mis. Hiragana/Katakana)
/// menampilkan tombol mengapung menuju latihan khusus paket itu.
class GuideDetailScreen extends StatefulWidget {
  final Course course;
  final GuideTopic topic;
  final String ttsLocale;

  const GuideDetailScreen({
    super.key,
    required this.course,
    required this.topic,
    required this.ttsLocale,
  });

  @override
  State<GuideDetailScreen> createState() => _GuideDetailScreenState();
}

class _GuideDetailScreenState extends State<GuideDetailScreen> {
  String? _activeKana; // huruf yang barusan diketuk (disorot sebentar)

  @override
  void dispose() {
    TtsService.instance.stop();
    super.dispose();
  }

  void _speak(String text) {
    HapticFeedback.selectionClick();
    TtsService.instance.speak(text, widget.ttsLocale);
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final hasKana =
        widget.topic.sections.any((s) => s.kana.isNotEmpty);
    // Paket bank soal yang persis untuk topik ini (mis. 'hiragana').
    final quizMatches = letterQuizFor(widget.course.id)
        .where((c) => c.id == widget.topic.id)
        .toList();
    final quizCat = quizMatches.isEmpty ? null : quizMatches.first;

    return StudyScaffold(
      appBar: AppBar(
        title: Text(widget.topic.title[l.code] ?? ''),
      ),
      floatingActionButton: quizCat == null
          ? null
          : FloatingActionButton.extended(
              backgroundColor: DuoColors.green,
              foregroundColor: Colors.white,
              icon: const Icon(Icons.fitness_center_rounded),
              label: Text(
                '${l.t('practice_btn')} ${quizCat.title[l.code] ?? ''}',
                style: const TextStyle(
                    fontWeight: FontWeight.w900, letterSpacing: 0.4),
              ),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => LetterQuizScreen(
                    course: widget.course,
                    initialCategoryId: quizCat.id,
                  ),
                ),
              ),
            ),
      body: ListView(
        padding:
            EdgeInsets.fromLTRB(16, 4, 16, quizCat == null ? 32 : 96),
        children: [
          if (hasKana)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                '🔊 ${l.t('tap_kana_hint')}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 13, color: Theme.of(context).hintColor),
              ),
            ),
          for (final section in widget.topic.sections)
            _buildSection(context, l, section),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, L l, GuideSection section) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              section.title[l.code] ?? '',
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w900),
            ),
            if (section.body != null) ...[
              const SizedBox(height: 6),
              Text(
                section.body![l.code] ?? '',
                style: TextStyle(
                  fontSize: 13.5,
                  height: 1.5,
                  color: isDark ? Colors.white70 : DuoColors.eel,
                ),
              ),
            ],
            if (section.kana.isNotEmpty) ...[
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.9,
                ),
                itemCount: section.kana.length,
                itemBuilder: (_, i) =>
                    _KanaCell(
                  item: section.kana[i],
                  active: _activeKana == section.kana[i].kana,
                  onTap: () {
                    _speak(section.kana[i].kana);
                    setState(
                        () => _activeKana = section.kana[i].kana);
                  },
                ),
              ),
            ],
            if (section.examples.isNotEmpty) ...[
              const SizedBox(height: 10),
              for (final ex in section.examples)
                _ExampleRow(
                  example: ex,
                  uiLang: l.code,
                  onSpeak: () => _speak(ex.target),
                ),
            ],
          ],
        ),
      ),
    );
  }
}

class _KanaCell extends StatelessWidget {
  final KanaItem item;
  final bool active;
  final VoidCallback onTap;

  const _KanaCell({
    required this.item,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: active
              ? DuoColors.green.withValues(alpha: 0.20)
              : (isDark
                  ? Colors.white.withValues(alpha: 0.06)
                  : Colors.white),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: active
                ? DuoColors.green
                : (isDark
                    ? const Color(0x33FFFFFF)
                    : const Color(0xFFE7E0C9)),
            width: active ? 2 : 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item.kana,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: isDark ? Colors.white : DuoColors.eel,
              ),
            ),
            Text(
              item.romaji,
              style: TextStyle(
                fontSize: 10.5,
                fontWeight: FontWeight.w600,
                color: active
                    ? DuoColors.green
                    : Theme.of(context).hintColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExampleRow extends StatelessWidget {
  final GuideExample example;
  final String uiLang;
  final VoidCallback onSpeak;

  const _ExampleRow({
    required this.example,
    required this.uiLang,
    required this.onSpeak,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.05)
            : DuoColors.snow,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark
              ? const Color(0x26FFFFFF)
              : const Color(0xFFEDE6CF),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  example.target,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w800),
                ),
                if (example.romaji != null)
                  Text(
                    example.romaji!,
                    style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: Theme.of(context).hintColor),
                  ),
                Text(
                  example.meaning[uiLang] ??
                      example.meaning.values.first,
                  style: TextStyle(
                      fontSize: 12.5,
                      color: Theme.of(context).hintColor),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onSpeak,
            icon: const Icon(Icons.volume_up_rounded,
                color: DuoColors.blue, size: 22),
          ),
        ],
      ),
    );
  }
}
