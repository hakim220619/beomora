import 'package:beomora/data/handwriting_bank.dart';
import 'package:beomora/data/question_bank.dart';
import 'package:beomora/services/device_info_service.dart';
import 'package:beomora/services/handwriting_service.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('HandwritingService', () {
    test('kode bahasa ML Kit per kursus; kursus tak dikenal → null', () {
      expect(HandwritingService.languageFor('ja'), 'ja');
      expect(HandwritingService.languageFor('ko'), 'ko');
      expect(HandwritingService.languageFor('de'), 'de');
      expect(HandwritingService.languageFor('en'), 'en');
      expect(HandwritingService.languageFor('id'), 'id');
      expect(HandwritingService.languageFor('zz'), isNull);
    });

    test('perkiraan ukuran model: ja terbesar, bahasa lain 20 MB', () {
      expect(HandwritingService.estimatedModelMb('ja'), 30);
      expect(HandwritingService.estimatedModelMb('ko'), 25);
      expect(HandwritingService.estimatedModelMb('de'), 20);
    });

    test('matches: hanya 3 kandidat teratas, abaikan huruf besar & spasi', () {
      expect(HandwritingService.matches('あ', ['お', 'あ', 'ぬ']), isTrue);
      expect(
        HandwritingService.matches('あ', ['お', 'ぬ', 'め', 'あ']),
        isFalse,
        reason: 'kandidat ke-4 tidak dihitung',
      );
      expect(HandwritingService.matches('A', ['a']), isTrue);
      expect(HandwritingService.matches('a', [' A ']), isTrue);
      expect(HandwritingService.matches('한', ['환']), isFalse);
      expect(HandwritingService.matches('あ', const []), isFalse);
    });
  });

  group('HandwritingService kanal', () {
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    const recognizer = MethodChannel('google_mlkit_digital_ink_recognizer');
    const recognition = MethodChannel('google_mlkit_digital_ink_recognition');
    tearDown(() {
      messenger.setMockMethodCallHandler(recognizer, null);
      messenger.setMockMethodCallHandler(recognition, null);
    });

    test(
      'jatuh ke kanal "_recognition" saat "_recognizer" tidak ada',
      () async {
        final calls = <String>[];
        messenger.setMockMethodCallHandler(recognition, (call) async {
          calls.add('${call.method}:${(call.arguments as Map)['task']}');
          return true;
        });
        // Instance baru agar cache kanal kosong.
        expect(HandwritingService.channelNames.first, recognizer.name);
        expect(
          await HandwritingService.instance.isModelDownloaded('ja'),
          isTrue,
        );
        expect(calls, ['vision#manageInkModels:check']);
      },
    );

    test(
      'recognize tetap selesai walau CLOSE tidak pernah dibalas plugin',
      () async {
        final methods = <String>[];
        messenger.setMockMethodCallHandler(recognizer, (call) async {
          methods.add(call.method);
          switch (call.method) {
            case 'vision#startDigitalInkRecognizer':
              return [
                {'text': 'あ', 'score': 0.0},
                {'text': 'お', 'score': 1.0},
              ];
            case 'vision#closeDigitalInkRecognizer':
              // Seperti plugin 0.15.0 di Android: tidak pernah membalas.
              return Completer<Object?>().future;
          }
          return null;
        });
        final stroke = InkStroke()
          ..add(const Offset(1, 1), 0)
          ..add(const Offset(5, 9), 10);
        final out = await HandwritingService.instance.recognize(
          [stroke],
          'ja',
          area: const Size(100, 100),
        );
        expect(out, ['あ', 'お']);
        expect(methods, [
          'vision#startDigitalInkRecognizer',
          'vision#closeDigitalInkRecognizer',
        ]);
        // Goresan kosong tidak dikirim ke native.
        expect(
          await HandwritingService.instance.recognize([InkStroke()], 'ja'),
          isEmpty,
        );
      },
    );

    test('describeError meringkas PlatformException', () {
      expect(
        HandwritingService.describeError(
          PlatformException(code: 'error', message: 'MlKitException: x'),
        ),
        'error: MlKitException: x',
      );
      expect(HandwritingService.describeError(StateError('y')), contains('y'));
    });
  });

  group('writingCategoriesFor', () {
    test('tiap kursus punya paket tulis; angka & kata kerja dikecualikan', () {
      for (final courseId in ['ja', 'ko', 'de', 'en', 'id']) {
        final cats = writingCategoriesFor(courseId);
        expect(cats, isNotEmpty, reason: courseId);
        for (final c in cats) {
          expect(kWritableLetterCategories, contains(c.id));
          expect(c.items, isNotEmpty, reason: c.id);
        }
      }
      expect(writingCategoriesFor('ko').map((c) => c.id), ['hangul']);
      expect(writingCategoriesFor('en').map((c) => c.id), ['alphabet_en']);
      expect(
        writingCategoriesFor('ja').map((c) => c.id),
        containsAll(['hiragana', 'katakana']),
      );
      // Subset dari Tebak Huruf, bukan bank terpisah.
      final all = letterQuizFor('ja').map((c) => c.id).toSet();
      for (final c in writingCategoriesFor('ja')) {
        expect(all, contains(c.id));
      }
    });
  });

  group('writingGroupsFor', () {
    test('kana & hangul dibagi per seksi materi; alfabet tanpa cakupan', () {
      final ja = writingCategoriesFor('ja');
      final hira = writingGroupsFor(
        'ja',
        ja.firstWhere((c) => c.id == 'hiragana'),
      );
      expect(hira.map((g) => g.items.length), [46, 25, 33]);
      expect(hira.first.title['id'], contains('Gojūon'));
      final mix = writingGroupsFor(
        'ja',
        ja.firstWhere((c) => c.id == 'kana_mix'),
      );
      expect(mix.length, 6);
      expect(mix.first.title['id'], startsWith('Hiragana: '));
      expect(mix.last.title['id'], startsWith('Katakana: '));
      final hangul = writingGroupsFor('ko', writingCategoriesFor('ko').first);
      expect(hangul.map((g) => g.items.length), [10, 14, 7, 5]);
      expect(writingGroupsFor('en', writingCategoriesFor('en').first), isEmpty);
      // Tiap huruf di kelompok memang ada di paketnya.
      final kanji = ja.firstWhere((c) => c.id == 'kanji_n5');
      final inPack = kanji.items.map((i) => i.kana).toSet();
      for (final g in writingGroupsFor('ja', kanji)) {
        for (final i in g.items) {
          expect(inPack, contains(i.kana));
        }
      }
    });
  });

  group('DeviceResources', () {
    const gb = 1024 * 1024 * 1024;
    const mb = 1024 * 1024;

    test('ambang RAM 3 GB dan ruang 200 MB', () {
      const ok = DeviceResources(
        totalRamBytes: 4 * gb,
        freeStorageBytes: 2 * gb,
      );
      expect(ok.ramOk, isTrue);
      expect(ok.storageOk, isTrue);
      expect(ok.storageShortfallMb, 0);

      const low = DeviceResources(
        totalRamBytes: 2 * gb,
        freeStorageBytes: 50 * mb,
      );
      expect(low.ramOk, isFalse);
      expect(low.storageOk, isFalse);
      expect(low.storageShortfallMb, 150);

      const unknown = DeviceResources();
      expect(unknown.ramOk, isNull);
      expect(unknown.storageOk, isNull);
      expect(unknown.storageShortfallMb, 0);
    });

    test('format mudah dibaca', () {
      expect(DeviceResources.format(null), '—');
      expect(DeviceResources.format(512 * mb), '512 MB');
      expect(DeviceResources.format((3.8 * gb).round()), '3,8 GB');
      expect(DeviceResources.format(12 * gb), '12 GB');
      expect(DeviceResources.format(kHandwritingRecommendedRamBytes), '3,0 GB');
      expect(DeviceResources.format(kHandwritingMinFreeBytes), '200 MB');
    });
  });

  group('DeviceInfoService', () {
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;

    tearDown(
      () => messenger.setMockMethodCallHandler(DeviceInfoService.channel, null),
    );

    test('membaca RAM & ruang dari kanal native', () async {
      messenger.setMockMethodCallHandler(DeviceInfoService.channel, (
        call,
      ) async {
        expect(call.method, 'getResources');
        return {
          'totalRamBytes': 6 * 1024 * 1024 * 1024,
          'availableRamBytes': 1,
          'freeStorageBytes': 300 * 1024 * 1024,
        };
      });
      final d = await DeviceInfoService.read();
      expect(d.totalRamBytes, 6 * 1024 * 1024 * 1024);
      expect(d.freeStorageBytes, 300 * 1024 * 1024);
      expect(d.ramOk, isTrue);
      expect(d.storageOk, isTrue);
    });

    test('kanal tidak ada → nilai kosong, bukan error', () async {
      final d = await DeviceInfoService.read();
      expect(d.totalRamBytes, isNull);
      expect(d.freeStorageBytes, isNull);
    });
  });
}
