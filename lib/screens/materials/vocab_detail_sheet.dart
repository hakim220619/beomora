import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/en_grammar.dart';
import '../../data/ja_chapter_examples.dart';
import '../../data/ja_particles.dart';
import '../../data/vocab_examples.dart';
import '../../l10n/app_strings.dart';
import '../../models/guide.dart';
import '../../services/tts_service.dart';
import '../../theme.dart';
import '../../widgets/en_sentence_text.dart';
import '../../widgets/ja_particle_text.dart';

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
  if (courseId == 'ko') {
    // Kata kerja/sifat Korea berubah di akhir (심다 → 심어요): cocokkan
    // stem tanpa 다 (dan tanpa 하 untuk kata kerja 하다).
    final flat = sentence.replaceAll(' ', '');
    var stem = word.endsWith('다') && word.length >= 2
        ? word.substring(0, word.length - 1)
        : word;
    if (stem.endsWith('하') && stem.length >= 2) {
      stem = stem.substring(0, stem.length - 1);
    }
    return flat.contains(stem);
  }
  // Jerman: buang artikel/sich (der Tisch → tisch, sich freuen → freuen).
  final needle = word
      .toLowerCase()
      .replaceFirst(RegExp(r'^(to|der|die|das|sich) '), '')
      .trim();
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
  // Jepang: contoh khusus kartu Bab 1–25 (per kata + arti, agar kata
  // yang bunyinya sama tidak tertukar) → contoh umum → bentuk kamus.
  final meaningId = word.meaning['id'] ?? '';
  final usage =
      (courseId == 'ja'
          ? vocabUsageJaChapter['${word.target}|$meaningId']
          : null) ??
      vocabUsageFor(courseId, word.target) ??
      (courseId == 'ja' ? chapterUsageFor(word.target, meaningId) : null);
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
            reading: courseId == 'ja' || courseId == 'ko' ? e.romaji : null,
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
    builder: (_) => _VocabSheet(
      word: word,
      detail: detail,
      l: l,
      onSpeak: speak,
      particles: courseId == 'ja',
      english: courseId == 'en',
    ),
  );
}

class _VocabSheet extends StatelessWidget {
  final GuideExample word;
  final VocabDetail detail;
  final L l;
  final ValueChanged<String> onSpeak;

  /// Warnai partikel (は, を, に, …) + penjelasannya (kursus Jepang).
  final bool particles;

  /// Kursus Inggris: warnai kata fungsi, tandai kosakata, label tense.
  final bool english;

  const _VocabSheet({
    required this.word,
    required this.detail,
    required this.l,
    required this.onSpeak,
    this.particles = false,
    this.english = false,
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
                            if (english)
                              EnSentenceText(
                                s.text,
                                vocabIndex: enVocabIn(s.text, word.target)?.$1,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              )
                            else
                              ParticleText(
                                s.text,
                                marks: particles
                                    ? particlesOf(s.text, s.reading)
                                    : null,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            if (s.reading != null)
                              ParticleText(
                                s.reading!,
                                marks: particles
                                    ? readingParticlesOf(s.text, s.reading)
                                    : null,
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
                            if (english)
                              EnSentenceNotes(s.text, vocab: word.target),
                            if (particles)
                              ParticleLegend(
                                marks: particlesOf(s.text, s.reading),
                                uiLang: l.code,
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
