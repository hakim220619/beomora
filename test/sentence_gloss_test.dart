import 'package:beomora/data/ja_gloss_cards.dart';
import 'package:beomora/models/course.dart';
import 'package:beomora/providers/progress_provider.dart';
import 'package:beomora/providers/settings_provider.dart';
import 'package:beomora/screens/practice/sentence_gloss_screen.dart';
import 'package:beomora/services/ja_gloss.dart';
import 'package:beomora/services/name_katakana.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map<String, String?> _gl(List<GlossToken> t) => {
  for (final x in t) x.text: x.gloss?['id'],
};

void main() {
  group('Arti per kata kalimat Jepang', () {
    test('partikel tanpa arti, kata kerja ます/ました dikenali', () {
      final t = glossJaSentence(
        'あたらしい ふく を かいました',
        'atarashii fuku o kaimashita',
      )!;
      expect(t[2].particle?.kana, 'を');
      expect(t[2].gloss, isNull);
      expect(_gl(t)['かいました'], startsWith('sudah '));
      expect(t[3].vocab?.kana, 'かう');
    });

    test('～て います disatukan = sedang …', () {
      final t = glossJaSentence(
        'あね は ぎんこう で はたらいて います',
        'ane wa ginkou de hataraite imasu',
      )!;
      // Disatukan seperti di kartu: はたらいています = sedang bekerja.
      expect(t.last.text, 'はたらいています');
      expect(t.last.gloss?['id'], 'sedang bekerja');
      expect(t.last.vocab?.kana, 'はたらく');
    });

    test('kata yang tak dikenal → kalimat dilewati', () {
      expect(glossJaSentence('ほげほげ です', 'hogehoge desu'), isNull);
      expect(glossJaSentence('わたし は', 'watashi'), isNull); // tak sejajar
    });

    test('angka + satuan hitung & arti tambahan', () {
      final t = glossJaSentence(
        'わたし の かぞく は よにん です',
        'watashi no kazoku wa yonin desu',
      )!;
      expect(_gl(t)['よにん'], '4 orang');
      final r = glossJaSentence('まいあさ ろくじ に おきます', 'maiasa rokuji ni okimasu')!;
      expect(_gl(r)['ろくじ'], 'jam 6');
      expect(r.last.vocab?.kana, 'おきる'); // bukan おく
      final g = glossJaSentence('がっこう へ いきます', 'gakkou e ikimasu')!;
      expect(g.last.vocab?.kana, 'いく'); // bukan いきる
      final x = glossJaSentence(
        'インドネシア から きました',
        'indoneshia kara kimashita',
        extra: const {
          'インドネシア': {'id': 'Indonesia', 'en': 'Indonesia'},
        },
      )!;
      expect(_gl(x)['インドネシア'], 'Indonesia');
    });
  });

  group('Kartu situasi', () {
    test('tiap kartu 10–12 kalimat & semua kata isi berarti', () {
      expect(kJaGlossCards.length, greaterThanOrEqualTo(46));
      final n = <String, int>{};
      for (final c in kJaGlossCards) {
        n['${c.level}/${c.kind.name}'] =
            (n['${c.level}/${c.kind.name}'] ?? 0) + 1;
      }
      expect(n['N5/situation'], 24);
      expect(n['N4/situation'], 12);
      expect(n['N5/story'], 4);
      expect(n['N5/particle'], 6);
      expect(
        {for (final c in kJaGlossCards) c.id}.length,
        kJaGlossCards.length,
      );
      for (final c in kJaGlossCards) {
        expect(c.lines.length, inInclusiveRange(10, 12), reason: c.id);
        final lines = glossCardLines(c);
        for (final g in lines) {
          for (final w in g.tokens) {
            expect(
              w.particle != null || (w.gloss?['id']?.isNotEmpty ?? false),
              isTrue,
              reason: '${g.line.text} → ${w.text}',
            );
          }
          expect(g.line.meaning['id'], isNotEmpty);
          expect(g.line.meaning['en'], isNotEmpty);
        }
        if (lines.length != c.lines.length) {
          for (final l in c.lines) {
            String? why;
            glossJaSentence(
              l.text,
              l.romaji,
              extra: l.extra,
              onFail: (r) => why = r,
            );
            expect(why, isNull, reason: '${c.id}: ${l.text}');
          }
        }
        expect(glossCardLines(c).length, c.lines.length);
      }
    });
  });

  testWidgets('grid 3 kolom → ketuk kartu → semua kalimat, mode tebak', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2;
    addTearDown(tester.view.reset);
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    const ja = Course(
      id: 'ja',
      name: {'id': 'Bahasa Jepang', 'en': 'Japanese'},
      flag: '🇯🇵',
      ttsLocale: 'ja-JP',
      units: [],
    );
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SettingsProvider(prefs)),
          ChangeNotifierProvider(create: (_) => ProgressProvider(prefs)),
        ],
        child: const MaterialApp(home: SentenceGlossScreen(course: ja)),
      ),
    );
    // Tampilan awal: ubin kartu (3 per baris), belum ada kalimat.
    final first = kJaGlossCards.first;
    final second = kJaGlossCards[1];
    final third = kJaGlossCards[2];
    final y1 = tester.getCenter(find.text(first.title['id']!)).dy;
    expect(tester.getCenter(find.text(second.title['id']!)).dy, y1);
    expect(tester.getCenter(find.text(third.title['id']!)).dy, y1);
    expect(find.text('BELAJAR BAHASA JEPANG'), findsNothing);
    // Semua kartu gratis; kartu dikelompokkan per jenis.
    expect(find.text('👑'), findsNothing);
    expect(find.text('🗺️ Situasi'), findsOneWidget);

    await tester.tap(find.text(first.title['id']!));
    await tester.pumpAndSettle();
    expect(find.text('BELAJAR BAHASA JEPANG'), findsOneWidget);
    final line = glossCardLines(first).first;
    final word = line.tokens.firstWhere((t) => t.gloss != null);
    expect(find.text(word.gloss!['id']!), findsWidgets);
    expect(find.byTooltip('Dengar kalimat'), findsAtLeastNWidgets(5));

    await tester.tap(find.byTooltip('Mode tebak arti'));
    await tester.pumpAndSettle();
    expect(find.text('👁 Lihat arti'), findsWidgets);
    expect(find.text(line.line.meaning['id']!), findsNothing);

    // Layar penuh: AppBar hilang, tombol keluar muncul, lalu kembali.
    await tester.tap(find.byTooltip('Layar penuh'));
    await tester.pumpAndSettle();
    expect(find.byType(AppBar), findsNothing);
    expect(find.text('BELAJAR BAHASA JEPANG'), findsOneWidget);
    await tester.tap(find.byTooltip('Keluar layar penuh'));
    await tester.pumpAndSettle();
    expect(find.byType(AppBar), findsOneWidget);
  });

  group('Nama pengguna di kalimat perkenalan', () {
    test('nama Latin → katakana', () {
      expect(nameToKatakana('Dani'), 'ダニ');
      expect(nameToKatakana('Riana'), 'リアナ');
      expect(nameToKatakana('Hakim'), 'ハキム');
      expect(nameToKatakana('Siti'), 'シティ');
      expect(nameToKatakana('Bambang'), 'バンバン');
      expect(nameToKatakana('Muhammad'), 'ムハンマド');
      expect(nameToKatakana('Putri'), 'プトリ');
      expect(nameToKatakana('Cahya'), 'チャヤ');
    });

    test('{name} diganti nama depan pengguna', () {
      final intro = kJaGlossCards.firstWhere((c) => c.id == 'n5_intro');
      final line = glossCardLines(
        intro,
        userName: 'dani lukman hakim',
      ).firstWhere((g) => g.line.text.contains('なまえ は'));
      expect(line.line.text, 'わたし の なまえ は ダニ です');
      expect(line.line.romaji, 'watashi no namae wa dani desu');
      expect(line.line.meaning['id'], 'Nama saya Dani.');
      expect(
        line.tokens.firstWhere((t) => t.text == 'ダニ').gloss?['id'],
        'Dani (nama)',
      );
      // Tanpa login → nama contoh.
      final anon = glossCardLines(
        intro,
      ).firstWhere((g) => g.line.text.contains('なまえ は'));
      expect(anon.line.text, contains('リナ'));
    });
  });
}
