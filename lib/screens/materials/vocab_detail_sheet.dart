import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/vocab_examples.dart';
import '../../l10n/app_strings.dart';
import '../../models/guide.dart';
import '../../services/tts_service.dart';
import '../../theme.dart';

/// Satu contoh kalimat yang ditampilkan di lembar detail kosakata.
class VocabSentence {
  final String text;
  final String? reading;
  final String? translation;
  const VocabSentence(this.text, {this.reading, this.translation});
}

/// Isi lembar detail satu kata: contoh kalimat (data khusus per kata
/// ditambah kalimat dari topik yang sama) dan catatan penggunaan.
class VocabDetail {
  final List<VocabSentence> sentences;
  final String? usage;
  const VocabDetail(this.sentences, this.usage);

  bool get isEmpty => sentences.isEmpty && usage == null;
}

/// Contoh di topik tematik dianggap kalimat bila ≥ 3 kata (kata
/// bertanda spasi, seperti 「たんぼ に みず を いれます」).
bool isVocabSentence(GuideExample e) => e.target.trim().split(' ').length >= 3;

/// Apakah [sentence] memuat [word]. Kata kerja/sifat Jepang dicocokkan
/// lewat stem-nya (うえる → うえます), kata Inggris lewat awal kata
/// (seed → seeds, "to plant" → plant).
bool _mentions(String courseId, String sentence, String word) {
  if (courseId == 'ja') {
    final flat = sentence.replaceAll(' ', '');
    if (flat.contains(word)) return true;
    const ends = 'うくぐすつぬぶむるい';
    return word.length >= 3 &&
        ends.contains(word[word.length - 1]) &&
        flat.contains(word.substring(0, word.length - 1));
  }
  final needle = word.toLowerCase().replaceFirst(RegExp(r'^to '), '').trim();
  if (needle.isEmpty) return false;
  return RegExp(
    r'\b' + RegExp.escape(needle),
    caseSensitive: false,
  ).hasMatch(sentence);
}

VocabDetail vocabDetailOf({
  required String courseId,
  required GuideExample word,
  required String uiLang,
  GuideTopic? topic,
}) {
  final sentences = <VocabSentence>[];
  final usage = vocabUsageFor(courseId, word.target);
  if (usage != null) {
    final t = usage.translation(uiLang);
    sentences.add(
      VocabSentence(
        usage.sentence,
        reading: usage.reading.isEmpty ? null : usage.reading,
        translation: t.isEmpty ? null : t,
      ),
    );
  }
  if (topic != null && !isVocabSentence(word)) {
    for (final s in topic.sections) {
      for (final e in s.examples) {
        if (sentences.length >= 3) break;
        if (!isVocabSentence(e) ||
            !_mentions(courseId, e.target, word.target)) {
          continue;
        }
        if (sentences.any((x) => x.text == e.target)) continue;
        final t = e.meaning[uiLang] ?? e.meaning.values.first;
        sentences.add(
          VocabSentence(
            e.target,
            reading: courseId == 'ja' ? e.romaji : null,
            // Kalimat Inggris dengan UI Inggris: terjemahannya sama persis.
            translation: t == e.target ? null : t,
          ),
        );
      }
    }
  }
  return VocabDetail(sentences, usage?.usage(uiLang));
}

/// Tampilkan lembar detail [word]: arti, contoh kalimat (bisa didengar)
/// dan catatan penggunaan. Kata tanpa contoh tetap menampilkan artinya.
void showVocabDetail(
  BuildContext context, {
  required String courseId,
  required String ttsLocale,
  required GuideExample word,
  GuideTopic? topic,
}) {
  final l = L.read(context);
  final detail = vocabDetailOf(
    courseId: courseId,
    word: word,
    uiLang: l.code,
    topic: topic,
  );
  void speak(String text) {
    HapticFeedback.selectionClick();
    TtsService.instance.speak(text, ttsLocale);
  }

  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (_) =>
        _VocabSheet(word: word, detail: detail, l: l, onSpeak: speak),
  );
}

class _VocabSheet extends StatelessWidget {
  final GuideExample word;
  final VocabDetail detail;
  final L l;
  final ValueChanged<String> onSpeak;

  const _VocabSheet({
    required this.word,
    required this.detail,
    required this.l,
    required this.onSpeak,
  });

  @override
  Widget build(BuildContext context) {
    final hint = Theme.of(context).hintColor;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    Widget heading(String text) => Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 6),
      child: Text(
        text,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
      ),
    );

    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.8,
        ),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        word.target,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      if (word.romaji != null)
                        Text(
                          word.romaji!,
                          style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            color: hint,
                          ),
                        ),
                      const SizedBox(height: 4),
                      Text(
                        word.meaning[l.code] ?? word.meaning.values.first,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  tooltip: word.target,
                  icon: const Icon(
                    Icons.volume_up_rounded,
                    color: DuoColors.blue,
                    size: 28,
                  ),
                  onPressed: () => onSpeak(word.target),
                ),
              ],
            ),
            if (detail.sentences.isNotEmpty) ...[
              heading(l.t('vocab_detail_examples')),
              for (final s in detail.sentences)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  padding: const EdgeInsets.fromLTRB(12, 10, 4, 10),
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
                              s.text,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            if (s.reading != null)
                              Text(
                                s.reading!,
                                style: TextStyle(
                                  fontSize: 12.5,
                                  fontStyle: FontStyle.italic,
                                  color: hint,
                                ),
                              ),
                            if (s.translation != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Text(
                                  s.translation!,
                                  style: TextStyle(fontSize: 13.5, color: hint),
                                ),
                              ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.volume_up_rounded,
                          color: DuoColors.blue,
                        ),
                        onPressed: () => onSpeak(s.text),
                      ),
                    ],
                  ),
                ),
            ],
            if (detail.usage != null) ...[
              heading(l.t('vocab_detail_usage')),
              Text(detail.usage!, style: const TextStyle(fontSize: 14.5)),
            ],
            if (detail.isEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  l.t('vocab_detail_none'),
                  style: TextStyle(color: hint),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
