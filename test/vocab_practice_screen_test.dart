import 'package:beomora/models/course.dart';
import 'package:beomora/models/guide.dart';
import 'package:beomora/providers/progress_provider.dart';
import 'package:beomora/providers/settings_provider.dart';
import 'package:beomora/screens/practice/letter_quiz_screen.dart';
import 'package:beomora/screens/practice/vocab_practice_screen.dart';
import 'package:beomora/widgets/choice_card.dart';
import 'package:beomora/widgets/study/quiz_result_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  const course = Course(
    id: 'ja',
    name: {'id': 'Bahasa Jepang', 'en': 'Japanese'},
    flag: '🇯🇵',
    ttsLocale: 'ja-JP',
    units: [],
  );
  const words = {
    'ねこ': 'kucing',
    'いぬ': 'anjing',
    'さかな': 'ikan',
    'みず': 'air',
    'ほん': 'buku',
    'いえ': 'rumah',
  };
  final topic = GuideTopic(
    id: 'vocab_test',
    emoji: '🐱',
    title: const {'id': 'Tes', 'en': 'Test'},
    subtitle: const {'id': '', 'en': ''},
    sections: [
      GuideSection(
        title: const {'id': 'Bagian 1', 'en': 'Part 1'},
        examples: [
          for (final e in words.entries)
            GuideExample(e.key, {'id': e.value, 'en': e.value}),
        ],
      ),
    ],
  );

  Future<void> pump(WidgetTester tester, {bool premium = true}) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final progress = ProgressProvider(prefs)..setPremium(premium);
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SettingsProvider(prefs)),
          ChangeNotifierProvider.value(value: progress),
        ],
        child: MaterialApp(
          home: VocabPracticeScreen(course: course, topics: [topic]),
        ),
      ),
    );
  }

  /// Kata yang sedang ditanyakan (prompt besar di tengah kartu).
  String promptWord(WidgetTester tester) {
    final prompt = tester
        .widgetList<Text>(find.byType(Text))
        .firstWhere((t) => (t.style?.fontSize ?? 0) >= 40)
        .data!;
    return words.containsKey(prompt)
        ? prompt
        : words.entries.firstWhere((e) => e.value == prompt).key;
  }

  testWidgets('2 kata, 5 soal: sisanya diulang acak, tak berurutan sama', (
    tester,
  ) async {
    await pump(tester);
    await tester.tap(find.text('ねこ'));
    await tester.tap(find.text('いぬ'));
    await tester.pump();
    expect(find.textContaining('· 2 kata'), findsOneWidget);

    await tester.tap(find.textContaining('Lanjut'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.widgetWithText(ChoiceChip, '5'));
    await tester.pump();
    expect(find.textContaining('diulang acak'), findsOneWidget);
    await tester.tap(find.text('Mulai'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.byType(LetterQuizScreen), findsOneWidget);
    final asked = <String>[];
    for (var i = 1; i <= 5; i++) {
      expect(find.text('$i/5'), findsOneWidget);
      // Pengecoh diambil dari seluruh topik: tetap 4 pilihan.
      expect(find.byType(ChoiceCard), findsNWidgets(4));
      asked.add(promptWord(tester));
      await tester.tap(find.byType(ChoiceCard).first);
      await tester.pump(const Duration(seconds: 1));
    }
    expect(asked.toSet(), {'ねこ', 'いぬ'});
    for (var i = 1; i < asked.length; i++) {
      expect(asked[i], isNot(asked[i - 1]));
    }
  });

  testWidgets('pengguna gratis: jumlah soal maksimal 10', (tester) async {
    await pump(tester, premium: false);
    await tester.tap(find.byTooltip('Pilih semua'));
    await tester.pump();
    await tester.tap(find.textContaining('Lanjut'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(find.textContaining('Premium bebas pilih'), findsOneWidget);
    expect(find.widgetWithText(ChoiceChip, '20'), findsNothing);
    await tester.tap(find.byIcon(Icons.add_rounded));
    await tester.pump();
    await tester.tap(find.text('Mulai'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('1/10'), findsOneWidget);
  });

  testWidgets('kartu Favorit di atas: kata berbintang bisa langsung dipilih', (
    tester,
  ) async {
    await pump(tester);
    expect(find.text('⭐ Favorit'), findsNothing);
    final ctx = tester.element(find.byType(VocabPracticeScreen));
    ctx.read<SettingsProvider>().toggleStarred('ja', 'いぬ');
    await tester.pump();
    expect(find.text('⭐ Favorit'), findsOneWidget);
    expect(
      tester.getTopLeft(find.text('⭐ Favorit')).dy,
      lessThan(tester.getTopLeft(find.text('🐱 Tes')).dy),
    );
    // Centang kartu Favorit → kata ikut terpilih di topiknya juga.
    await tester.tap(find.text('いぬ').first);
    await tester.pump();
    expect(find.textContaining('· 1 kata'), findsOneWidget);
  });

  group('putar kosakata', () {
    const ttsChannel = MethodChannel('flutter_tts');
    final spoken = <String>[];
    void mockTts(WidgetTester tester) {
      spoken.clear();
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        ttsChannel,
        (call) async {
          if (call.method == 'speak') {
            final a = call.arguments;
            spoken.add(a is Map ? a['text'] as String : a as String);
          }
          return 1;
        },
      );
      addTearDown(
        () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          ttsChannel,
          null,
        ),
      );
    }

    Future<void> playAll(WidgetTester tester) async {
      await tester.tap(find.byTooltip('Putar kata yang dipilih'));
      for (var i = 0; i < 20; i++) {
        await tester.pump(const Duration(milliseconds: 800));
      }
    }

    testWidgets('urut: kata Favorit dulu, lalu dari atas ke bawah', (
      tester,
    ) async {
      mockTts(tester);
      await pump(tester);
      final ctx = tester.element(find.byType(VocabPracticeScreen));
      final settings = ctx.read<SettingsProvider>();
      settings.toggleStarred('ja', 'いえ');
      settings.toggleStarred('ja', 'さかな');
      await tester.pump();
      await tester.tap(find.byTooltip('Pilih semua'));
      await tester.pump();
      expect(settings.playShuffle, isFalse); // bawaan: urut
      await playAll(tester);
      expect(spoken, ['いえ', 'さかな', 'ねこ', 'いぬ', 'みず', 'ほん']);
    });

    testWidgets('acak: semua kata terpilih tetap diputar sekali', (
      tester,
    ) async {
      mockTts(tester);
      await pump(tester);
      await tester.tap(find.byTooltip('Pilih semua'));
      await tester.pump();
      // Ketuk tombol urut → jadi acak (tersimpan di pengaturan).
      await tester.tap(find.byTooltip('Putar urut dari atas'));
      await tester.pump();
      final ctx = tester.element(find.byType(VocabPracticeScreen));
      expect(ctx.read<SettingsProvider>().playShuffle, isTrue);
      expect(find.byTooltip('Putar acak'), findsOneWidget);
      await playAll(tester);
      expect(spoken, hasLength(6));
      expect(spoken.toSet(), {'ねこ', 'いぬ', 'さかな', 'みず', 'ほん', 'いえ'});
    });
  });

  testWidgets('layar sempit (320 dp): bar bawah tidak tumpuk/meluap', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(640, 1400);
    tester.view.devicePixelRatio = 2;
    addTearDown(tester.view.reset);
    await pump(tester);
    await tester.tap(find.byTooltip('Pilih semua'));
    await tester.pump();
    expect(tester.takeException(), isNull); // tanpa RenderFlex overflow

    Rect box(Finder f) => tester.getRect(f);
    final speed = box(find.byTooltip('Kecepatan suara'));
    final order = box(find.byTooltip('Putar urut dari atas'));
    final loop = box(find.byTooltip('Ulangi terus-menerus'));
    final play = box(find.byTooltip('Putar kata yang dipilih'));
    final next = box(find.textContaining('Lanjut'));
    // Tombol kontrol suara tidak saling menimpa.
    for (final (a, b) in [(speed, order), (order, loop), (loop, play)]) {
      expect(a.overlaps(b), isFalse, reason: '$a vs $b');
    }
    // Lanjut di baris terpisah di bawah kontrol suara.
    expect(next.top, greaterThanOrEqualTo(play.bottom - 1));
  });

  testWidgets('susun huruf: pilih jenis soal, susun kotak, periksa', (
    tester,
  ) async {
    await pump(tester);
    await tester.tap(find.text('ねこ'));
    await tester.tap(find.text('いぬ'));
    await tester.pump();
    await tester.tap(find.textContaining('Lanjut'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    // Jenis soal: pilih "Susun huruf" (tersimpan).
    await tester.tap(find.text('Susun huruf'));
    await tester.pump();
    final ctx = tester.element(find.byType(VocabPracticeScreen));
    expect(ctx.read<SettingsProvider>().vocabSpellMode, isTrue);
    await tester.tap(find.widgetWithText(ChoiceChip, '2'));
    await tester.pump();
    await tester.tap(find.text('Mulai'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    for (var i = 0; i < 2; i++) {
      expect(find.text('Susun huruf jadi kata yang berarti:'), findsOneWidget);
      final meaning = tester
          .widgetList<Text>(find.byType(Text))
          .map((t) => t.data)
          .firstWhere((d) => words.containsValue(d));
      final word = words.entries.firstWhere((e) => e.value == meaning).key;
      for (final ch in word.split('')) {
        await tester.tap(find.text(ch).last);
        await tester.pump();
      }
      await tester.tap(find.text('Periksa'));
      await tester.pump();
      expect(find.text('Benar sekali! 🎉'), findsOneWidget);
      await tester.tap(find.text('Lanjut').last);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));
    }
    // Selesai: layar hasil, tanpa jawaban salah untuk diulas.
    final result = tester.widget<QuizResultView>(find.byType(QuizResultView));
    expect(result.correct, 2);
    expect(result.total, 2);
  });
}
