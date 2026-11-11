import 'package:flutter/material.dart';

import '../data/en_grammar.dart';
import '../data/study_guides.dart';
import '../l10n/app_strings.dart';
import '../services/tts_service.dart';
import '../theme.dart';

/// Kalimat Inggris: kata fungsi diwarnai per golongan, kosakata yang
/// sedang dipelajari ([vocabIndex]) ditebalkan + digarisbawahi.
class EnSentenceText extends StatelessWidget {
  final String sentence;
  final TextStyle style;
  final int? vocabIndex;

  const EnSentenceText(
    this.sentence, {
    super.key,
    required this.style,
    this.vocabIndex,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = sentence.split(' ');
    final marks = enFunctionWordsOf(sentence);
    return Text.rich(
      TextSpan(
        style: style,
        children: [
          for (var i = 0; i < tokens.length; i++)
            TextSpan(
              text: i == tokens.length - 1 ? tokens[i] : '${tokens[i]} ',
              style: i == vocabIndex
                  ? const TextStyle(
                      fontWeight: FontWeight.w900,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                    )
                  : marks[i] == null
                  ? null
                  : TextStyle(
                      color: marks[i]!.cls.color,
                      fontWeight: FontWeight.w900,
                    ),
            ),
        ],
      ),
    );
  }
}

/// Keterangan di bawah kalimat Inggris: label tense (ketuk → penjelasan),
/// bentuk kosakata di kalimat, lalu arti tiap kata fungsi yang muncul.
class EnSentenceNotes extends StatelessWidget {
  final String sentence;
  final String? vocab;

  const EnSentenceNotes(this.sentence, {super.key, this.vocab});

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final hint = Theme.of(context).hintColor;
    final tense = enTenseOf(sentence);
    final found = vocab == null ? null : enVocabIn(sentence, vocab!);
    final formNote = found == null ? null : enFormNote(found.$2, vocab!);
    final seen = <String>{};
    final words = [
      for (final w in enFunctionWordsOf(sentence))
        if (w != null && seen.add(w.word)) w,
    ];
    if (tense == null && formNote == null && words.isEmpty) {
      return const SizedBox.shrink();
    }
    final small = TextStyle(fontSize: 12.5, color: hint);
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (tense != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: ActionChip(
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                avatar: const Icon(Icons.schedule_rounded, size: 16),
                label: Text(
                  tense.label,
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                tooltip: l.t('en_tense_open'),
                onPressed: () => showTenseSheet(context, tense),
              ),
            ),
          if (formNote != null)
            Text.rich(
              TextSpan(
                style: small,
                children: [
                  TextSpan(
                    text: '▍${enBare(sentence.split(' ')[found!.$1])}',
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                  TextSpan(text: ' — ${formNote[l.code] ?? formNote['id']}'),
                ],
              ),
            ),
          for (final w in words)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text.rich(
                TextSpan(
                  style: small,
                  children: [
                    TextSpan(
                      text: '● ${w.word}',
                      style: TextStyle(
                        color: w.cls.color,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextSpan(
                      text:
                          ' (${w.cls.label[l.code] ?? w.cls.label['id']}) — '
                          '${w.desc[l.code] ?? w.desc['id']}',
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Lembar penjelasan satu tense dari topik Materi `en_tenses`.
void showTenseSheet(BuildContext context, EnTense tense) {
  final topic = kStudyGuides['en']!.firstWhere((t) => t.id == 'en_tenses');
  final section = topic.sections[tense.sectionIndex];
  final l = L.read(context);
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (ctx) {
      final hint = Theme.of(ctx).hintColor;
      return SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(ctx).height * 0.85,
          ),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            children: [
              Text(
                '🕐 ${section.title[l.code] ?? section.title['id']}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                section.body?[l.code] ?? section.body?['id'] ?? '',
                style: const TextStyle(fontSize: 14, height: 1.45),
              ),
              const SizedBox(height: 12),
              for (final ex in section.examples)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: EnSentenceText(
                    ex.target,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  subtitle: l.code == 'en'
                      ? null
                      : Text(
                          ex.meaning[l.code] ?? '',
                          style: TextStyle(color: hint),
                        ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.volume_up_rounded,
                      color: DuoColors.blue,
                    ),
                    onPressed: () =>
                        TtsService.instance.speak(ex.target, 'en-US'),
                  ),
                ),
            ],
          ),
        ),
      );
    },
  );
}
