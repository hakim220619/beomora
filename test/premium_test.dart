// Keuntungan premium di ProgressProvider: hati tak terbatas,
// XP dobel, dan pelindung streak otomatis. Plus aturan pencocokan
// status premium lokal vs dokumen profil server di AuthProvider.
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:beomora/providers/auth_provider.dart';
import 'package:beomora/providers/progress_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<ProgressProvider> provider(
      [Map<String, Object> initial = const {}]) async {
    SharedPreferences.setMockInitialValues(initial);
    return ProgressProvider(await SharedPreferences.getInstance());
  }

  test('premium: hati selalu penuh dan tidak bisa berkurang', () async {
    final p = await provider();
    p.setPremium(true);
    p.loseHeart();
    p.loseHeart();
    expect(p.hearts, ProgressProvider.maxHearts);
  });

  test('gratis: hati berkurang seperti biasa', () async {
    final p = await provider();
    p.loseHeart();
    expect(p.hearts, ProgressProvider.maxHearts - 1);
  });

  test('premium: XP dobel permanen', () async {
    final p = await provider();
    expect(p.xpMultiplier, 1);
    p.setPremium(true);
    expect(p.xpMultiplier, 2);
    expect(p.addXp(10), 20);
  });

  test('premium dibaca dari cache prefs saat startup (pelindung streak)',
      () async {
    final p = await provider({'auth_premium': true});
    expect(p.premiumActive, isTrue);
  });

  test('top-up permata menambah saldo', () async {
    final p = await provider();
    final before = p.gems;
    p.addGems(1000);
    expect(p.gems, before + 1000);
  });

  group('applyServerPremium: server tidak menurunkan premium aktif', () {
    Future<AuthProvider> authProvider() async {
      SharedPreferences.setMockInitialValues({});
      return AuthProvider(await SharedPreferences.getInstance());
    }

    test('dokumen server ketinggalan (premium: false) → lokal bertahan',
        () async {
      final auth = await authProvider();
      await auth.activatePremium(
          until: DateTime.now().add(const Duration(days: 31)));
      auth.applyServerPremium({'premium': false});
      expect(auth.isPremium, isTrue);
    });

    test('server lebih panjang / seumur hidup → dinaikkan', () async {
      final auth = await authProvider();
      final longer = DateTime.now()
          .add(const Duration(days: 366))
          .millisecondsSinceEpoch;
      await auth.activatePremium(
          until: DateTime.now().add(const Duration(days: 31)));
      auth.applyServerPremium({'premium': true, 'premiumUntil': longer});
      expect(auth.isPremium, isTrue);
      auth.applyServerPremium({'premium': true, 'premiumUntil': null});
      expect(auth.isPremium, isTrue); // seumur hidup
      // Lifetime tidak bisa diturunkan lagi oleh masa berlaku pendek.
      auth.applyServerPremium({'premium': true, 'premiumUntil': longer});
      expect(auth.isPremium, isTrue);
    });

    test('hadiah admin (premiumGrantUntil): memberi, kedaluwarsa, cabut',
        () async {
      final auth = await authProvider();
      final future = DateTime.now()
          .add(const Duration(days: 7))
          .millisecondsSinceEpoch;
      // Hadiah aktif → premium, tanpa menyentuh premium pribadi.
      auth.applyServerPremium({'premium': false, 'premiumGrantUntil': future});
      expect(auth.isPremium, isTrue);
      // Pencabutan (field hilang) langsung berlaku — server otoritas.
      auth.applyServerPremium({'premium': false});
      expect(auth.isPremium, isFalse);
      // Hadiah yang sudah lewat tidak menghidupkan premium.
      auth.applyServerPremium({
        'premium': false,
        'premiumGrantUntil':
            DateTime.now().millisecondsSinceEpoch - 1000,
      });
      expect(auth.isPremium, isFalse);
    });

    test('saklar global admin: semua akun premium selama menyala',
        () async {
      final auth = await authProvider();
      expect(auth.isPremium, isFalse);
      auth.applyGlobalPremium(true);
      expect(auth.isPremium, isTrue);
      // Profil server premium:false tidak mematikan saklar global.
      auth.applyServerPremium({'premium': false});
      expect(auth.isPremium, isTrue);
      // Saklar mati → kembali mengikuti premium pribadi (tidak ada).
      auth.applyGlobalPremium(false);
      expect(auth.isPremium, isFalse);
      // Premium pribadi dari server tetap tersimpan walau saklar nyala.
      auth.applyGlobalPremium(true);
      final until = DateTime.now()
          .add(const Duration(days: 31))
          .millisecondsSinceEpoch;
      auth.applyServerPremium({'premium': true, 'premiumUntil': until});
      auth.applyGlobalPremium(false);
      expect(auth.isPremium, isTrue); // pribadi masih berlaku
    });

    test('lokal tidak aktif → ikuti server apa adanya', () async {
      final auth = await authProvider();
      expect(auth.isPremium, isFalse);
      final until = DateTime.now()
          .add(const Duration(days: 31))
          .millisecondsSinceEpoch;
      auth.applyServerPremium({'premium': true, 'premiumUntil': until});
      expect(auth.isPremium, isTrue);
      // Server premium yang SUDAH kedaluwarsa tidak menghidupkan.
      final auth2 = await authProvider();
      auth2.applyServerPremium({
        'premium': true,
        'premiumUntil':
            DateTime.now().millisecondsSinceEpoch - 1000,
      });
      expect(auth2.isPremium, isFalse);
    });
  });
}
