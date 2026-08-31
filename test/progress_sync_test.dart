// Kebijakan pencocokan progres lokal vs server (ProgressProvider.
// reconcileCloudJson): server dipakai saat lokal masih segar atau
// server lebih baru; lokal menang saat lebih baru; stempel sama =
// tidak perlu apa-apa.
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:beomora/providers/progress_provider.dart';

Future<ProgressProvider> freshProvider(
    [Map<String, Object> initial = const {}]) async {
  SharedPreferences.setMockInitialValues(initial);
  return ProgressProvider(await SharedPreferences.getInstance());
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('lokal segar → progres server dipakai (restore di HP baru)',
      () async {
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

  test('lokal sudah berisi & lebih baru → lokal menang (perlu push)',
      () async {
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

    expect(local.reconcileCloudJson(jsonEncode(cloudMap)),
        CloudMerge.applied);
    expect(local.xp, 999);
  });

  test('stempel waktu sama → identical, tanpa perubahan', () async {
    final local = await freshProvider();
    local.addXp(10);
    expect(local.reconcileCloudJson(local.exportCloudJson()),
        CloudMerge.identical);
    expect(local.xp, 10);
  });

  test('JSON server korup → lokal menang', () async {
    final local = await freshProvider();
    local.addXp(10);
    expect(local.reconcileCloudJson('bukan { json'),
        CloudMerge.localWins);
    expect(local.xp, 10);
  });

  test('kalender: XP tercatat per hari & entri kedaluwarsa terpangkas',
      () async {
    final local = await freshProvider();

    // Selundupkan entri lama lewat data "server".
    final cloudMap =
        jsonDecode(local.exportCloudJson()) as Map<String, dynamic>;
    cloudMap['dailyXp'] = {'2020-01-01': 10};
    cloudMap['savedAt'] = (cloudMap['savedAt'] as int) + 10000;
    expect(local.reconcileCloudJson(jsonEncode(cloudMap)),
        CloudMerge.applied);
    expect(local.xpOn(DateTime(2020, 1, 1)), 10);

    // XP baru tercatat di hari ini, entri 2020 terpangkas (>92 hari).
    local.addXp(15);
    local.addXp(5);
    expect(local.xpOn(DateTime.now()), 20);
    expect(local.xpOn(DateTime(2020, 1, 1)), 0);
  });
}
