import 'package:beomora/data/ja_particles.dart';
import 'package:beomora/data/study_guides.dart';
import 'package:beomora/models/guide.dart';
import 'package:beomora/providers/settings_provider.dart';
import 'package:beomora/screens/materials/vocab_detail_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  List<String?> kinds(String text, String? reading) => [
    for (final p in particlesOf(text, reading)) p?.kana,
  ];

  test('partikel dikenali per token, termasuk tanda baca di ujung', () {
    expect(
      kinds(
        'わたし の でんわ ばんごう は ゼロ から はじまります',
        'watashi no denwa bangou wa zero kara hajimarimasu',
      ),
      [null, 'の', null, null, 'は', null, 'から', null],
    );
    expect(kinds('いい です か。', 'ii desu ka.'), [null, null, 'か']);
  });

  test('は "gigi" (dibaca ha) bukan partikel', () {
    expect(kinds('は が いたい です', 'ha ga itai desu'), [null, 'が', null, null]);
  });

  test('に sebagai angka 2 sebelum satuan bukan partikel', () {
    expect(kinds('りんご が に こ あります', 'ringo ga ni ko arimasu'), [
      null,
      'が',
      null,
      null,
      null,
    ]);
    // に setelah partikel lain (の うえ に ほん) tetap partikel.
    expect(
      kinds(
        'つくえ の うえ に ほん や ペン が あります',
        'tsukue no ue ni hon ya pen ga arimasu',
      ),
      [null, 'の', null, 'に', null, 'や', null, 'が', null],
    );
    // に + ほん (buku) tetap partikel.
    expect(kinds('ともだち に ほん を あげました', 'tomodachi ni hon o agemashita'), [
      null,
      'に',
      null,
      'を',
      null,
    ]);
  });

  test('romaji hanya diwarnai kalau sejajar', () {
    expect(readingParticlesOf('ほん を よみます', 'hon o yomimasu'), isNotNull);
    expect(readingParticlesOf('ほん を よみます', 'hon o yomi masu'), isNull);
  });

  testWidgets('lembar kosakata Jepang: penjelasan partikel tampil', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => SettingsProvider(prefs),
        child: MaterialApp(
          home: Builder(
            builder: (context) => TextButton(
              onPressed: () => showVocabDetail(
                context,
                courseId: 'ja',
                ttsLocale: 'ja-JP',
                word: const GuideExample('ゼロ', {'id': 'nol', 'en': 'zero'}),
              ),
              child: const Text('buka'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('buka'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(find.textContaining('(wa)', findRichText: true), findsOneWidget);
    expect(
      find.textContaining('penanda topik', findRichText: true),
      findsOneWidget,
    );
  });

  test('Materi Partikel Dasar memuat ke-16 partikel yang diwarnai', () {
    final topic = kStudyGuides['ja']!.firstWhere((t) => t.id == 'ja_particles');
    final heads = {
      for (final s in topic.sections) s.title['id']!.split(' ').first,
    };
    expect(heads, containsAll(kJaParticles.keys));
    // Setiap contoh: partikel bagiannya dikenali di kalimatnya.
    for (final s in topic.sections) {
      final head = s.title['id']!.split(' ').first;
      for (final e in s.examples) {
        expect(
          particlesOf(e.target, e.romaji).map((p) => p?.kana),
          contains(head),
          reason: e.target,
        );
      }
    }
  });
}
