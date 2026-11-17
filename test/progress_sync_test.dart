// Kebijakan pencocokan progres lokal vs server (ProgressProvider.
// reconcileCloudJson): server dipakai saat lokal masih segar atau
// server lebih baru; lokal menang saat lebih baru; stempel sama =
// tidak perlu apa-apa.
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:beomora/providers/progress_provider.dart';

Future<ProgressProvider> freshProvider([
  Map<String, Object> initial = const {},
]) async {
  SharedPreferences.setMockInitialValues(initial);
  return ProgressProvider(await SharedPreferences.getInstance());
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('lokal segar → progres server dipakai (restore di HP baru)', () async {
    final local = await freshProvider();
    // Onboarding sempat memilih kursus — lokal tetap dianggap segar.
    local.setActiveCourse('ja');

    final cloud = await freshProvider();
    cloud.addXp(120); // savedAt cloud < savedAt lokal (dibuat duluan)
    final raw = cloud.exportCloudJson();

    expect(local.reconcileCloudJson(raw), CloudMerge.applied);
    expect(local.xp, 120);
    expect(local.savedAt, cloud.savedAt); // stempel server dipertahankan
  });

  test('lokal sudah berisi & lebih baru → lokal menang (perlu push)', () async {
    final cloud = await freshProvider();
    cloud.addXp(50);
    final raw = cloud.exportCloudJson();

    final local = await freshProvider();
    await Future<void>.delayed(const Duration(milliseconds: 5));
    local.addXp(200); // lebih baru dari cloud

    expect(local.reconcileCloudJson(raw), CloudMerge.localWins);
    expect(local.xp, 200); // tidak tertimpa
  });

  test('server lebih baru → dipakai walau lokal berisi', () async {
    final local = await freshProvider();
    local.addXp(30);

    final cloudMap =
        jsonDecode(local.exportCloudJson()) as Map<String, dynamic>;
    cloudMap['xp'] = 999;
    cloudMap['savedAt'] = (cloudMap['savedAt'] as int) + 10000;

    expect(local.reconcileCloudJson(jsonEncode(cloudMap)), CloudMerge.applied);
    expect(local.xp, 999);
  });

  test('stempel waktu sama → identical, tanpa perubahan', () async {
    final local = await freshProvider();
    local.addXp(10);
    expect(
      local.reconcileCloudJson(local.exportCloudJson()),
      CloudMerge.identical,
    );
    expect(local.xp, 10);
  });

  test('JSON server korup → lokal menang', () async {
    final local = await freshProvider();
    local.addXp(10);
    expect(local.reconcileCloudJson('bukan { json'), CloudMerge.localWins);
    expect(local.xp, 10);
  });

  test(
    'kalender: XP tercatat per hari & entri kedaluwarsa terpangkas',
    () async {
      final local = await freshProvider();

      // Selundupkan entri lama lewat data "server".
      final cloudMap =
          jsonDecode(local.exportCloudJson()) as Map<String, dynamic>;
      cloudMap['dailyXp'] = {'2020-01-01': 10};
      cloudMap['savedAt'] = (cloudMap['savedAt'] as int) + 10000;
      expect(
        local.reconcileCloudJson(jsonEncode(cloudMap)),
        CloudMerge.applied,
      );
      expect(local.xpOn(DateTime(2020, 1, 1)), 10);

      // XP baru tercatat di hari ini, entri 2020 terpangkas (>92 hari).
      local.addXp(15);
      local.addXp(5);
      expect(local.xpOn(DateTime.now()), 20);
      expect(local.xpOn(DateTime(2020, 1, 1)), 0);
    },
  );

  test('HP baru: onboarding, target & bahasa ikut dari akun', () async {
    final oldPhone = await freshProvider();
    oldPhone.setActiveCourse('ja');
    oldPhone.setStreakGoal(90);
    oldPhone.setUiLang('en');
    oldPhone.completeOnboarding();
    oldPhone.addXp(10);
    final cloud = oldPhone.exportCloudJson();

    final newPhone = await freshProvider();
    expect(newPhone.onboarded, isFalse);
    expect(newPhone.reconcileCloudJson(cloud), CloudMerge.applied);
    expect(newPhone.onboarded, isTrue);
    expect(newPhone.activeCourseId, 'ja');
    expect(newPhone.streakGoalDays, 90);
    expect(newPhone.uiLang, 'en');
  });

  test(
    'data server versi lama (tanpa kunci onboarded) → dianggap sudah',
    () async {
      final oldPhone = await freshProvider();
      oldPhone.addXp(10);
      final m = jsonDecode(oldPhone.exportCloudJson()) as Map<String, dynamic>
        ..remove('onboarded');
      final newPhone = await freshProvider();
      newPhone.reconcileCloudJson(jsonEncode(m));
      expect(newPhone.onboarded, isTrue);
    },
  );

  test('akun baru yang belum onboarding tetap belum', () async {
    final half = await freshProvider();
    half.setUiLang('id');
    final newPhone = await freshProvider();
    newPhone.reconcileCloudJson(half.exportCloudJson());
    expect(newPhone.onboarded, isFalse);
  });

  test('versi lama sudah onboarding di HP ini → tidak diulang', () async {
    SharedPreferences.setMockInitialValues({'onboarded': true});
    final p = ProgressProvider(await SharedPreferences.getInstance());
    expect(p.onboarded, isTrue);
    p.resetAll(); // keluar akun → akun berikutnya memilih ulang
    expect(
      ProgressProvider(await SharedPreferences.getInstance()).onboarded,
      isFalse,
    );
  });

  group('Favorit kosakata ikut sinkron', () {
    test('ganti HP: favorit dari server dipulihkan', () async {
      final oldPhone = await freshProvider();
      oldPhone.addXp(30);
      oldPhone.toggleStarred('ja', 'いぬ');
      oldPhone.toggleStarred('ja', 'ねこ');
      oldPhone.toggleStarred('en', 'apple');
      final raw = oldPhone.exportCloudJson();

      final newPhone = await freshProvider();
      expect(newPhone.reconcileCloudJson(raw), CloudMerge.applied);
      expect(newPhone.starredWords('ja'), ['いぬ', 'ねこ']);
      expect(newPhone.starredWords('en'), ['apple']);
    });

    test('lepas bintang terakhir ikut tersinkron', () async {
      final a = await freshProvider();
      a.toggleStarred('ja', 'いぬ');
      a.toggleStarred('ja', 'いぬ');
      expect(a.starredWords('ja'), isEmpty);
      final m = jsonDecode(a.exportCloudJson()) as Map<String, dynamic>;
      expect(m['starred'], isEmpty);
    });

    test(
      'payload versi lama (tanpa starred) → favorit lokal dipertahankan',
      () async {
        final local = await freshProvider();
        local.addXp(10);
        local.toggleStarred('ja', 'いぬ');
        final cloudMap =
            jsonDecode(local.exportCloudJson()) as Map<String, dynamic>;
        cloudMap.remove('starred');
        cloudMap['savedAt'] = local.savedAt + 1000; // server lebih baru
        expect(
          local.reconcileCloudJson(jsonEncode(cloudMap)),
          CloudMerge.applied,
        );
        expect(local.starredWords('ja'), ['いぬ']);
      },
    );

    test('baru menandai kata (tanpa XP) tidak tertimpa server lama', () async {
      final local = await freshProvider();
      local.toggleStarred('ja', 'いぬ');
      final cloudMap = <String, dynamic>{
        'xp': 50,
        'savedAt': local.savedAt - 1000, // data server lebih lama
      };
      expect(
        local.reconcileCloudJson(jsonEncode(cloudMap)),
        CloudMerge.localWins,
      );
      expect(local.starredWords('ja'), ['いぬ']);
    });

    test('migrasi: favorit di pengaturan perangkat lama dipindah', () async {
      SharedPreferences.setMockInitialValues({
        'vocab_starred_ja': ['いぬ', 'ねこ'],
        'vocab_starred_de': ['Hund'],
      });
      final prefs = await SharedPreferences.getInstance();
      final p = ProgressProvider(prefs);
      expect(p.starredWords('ja'), ['いぬ', 'ねこ']);
      expect(p.starredWords('de'), ['Hund']);
      expect(
        prefs.getKeys().where((k) => k.startsWith('vocab_starred_')),
        isEmpty,
      );
      expect(p.savedAt, greaterThan(0)); // dimajukan → akan diunggah
      // Bertahan setelah aplikasi dibuka ulang.
      expect(ProgressProvider(prefs).starredWords('ja'), ['いぬ', 'ねこ']);
    });

    test('keluar akun → favorit dikosongkan untuk akun berikutnya', () async {
      final p = await freshProvider();
      p.toggleStarred('ja', 'いぬ');
      p.resetAll();
      expect(p.starredWords('ja'), isEmpty);
    });
  });
}
