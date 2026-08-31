// Generator ikon aplikasi dari BeomoraLogoPainter — bukan test biasa.
// Jalankan manual saat logo berubah:
//
//   RENDER_ICONS=1 flutter test test/tools/render_icons_test.dart
//
// Menulis ulang ikon launcher Android, AppIcon iOS (PNG RGB tanpa kanal
// alpha, syarat App Store), ikon web/PWA, dan favicon.
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:beomora/widgets/beomora_logo.dart';

Future<ui.Image> _render(int size, BeomoraLogoPainter painter) async {
  final recorder = ui.PictureRecorder();
  painter.paint(Canvas(recorder), Size.square(size.toDouble()));
  return recorder.endRecording().toImage(size, size);
}

Future<void> _writePng(String path, int size, BeomoraLogoPainter painter) async {
  final image = await _render(size, painter);
  final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
  File(path)
    ..createSync(recursive: true)
    ..writeAsBytesSync(bytes!.buffer.asUint8List());
}

Future<void> _writeOpaquePng(
    String path, int size, BeomoraLogoPainter painter) async {
  final image = await _render(size, painter);
  final rgba = await image.toByteData(format: ui.ImageByteFormat.rawRgba);
  File(path)
    ..createSync(recursive: true)
    ..writeAsBytesSync(_encodeRgbPng(size, size, rgba!.buffer.asUint8List()));
}

/// Encoder PNG minimal (color type 2 = RGB) — kanal alpha dibuang karena
/// `ImageByteFormat.png` selalu menghasilkan RGBA.
Uint8List _encodeRgbPng(int width, int height, Uint8List rgba) {
  final raw = BytesBuilder();
  for (var y = 0; y < height; y++) {
    raw.addByte(0); // filter: None
    for (var x = 0; x < width; x++) {
      final i = (y * width + x) * 4;
      raw.add([rgba[i], rgba[i + 1], rgba[i + 2]]);
    }
  }
  final idat = zlib.encode(raw.takeBytes());

  final ihdr = ByteData(13)
    ..setUint32(0, width)
    ..setUint32(4, height)
    ..setUint8(8, 8) // bit depth
    ..setUint8(9, 2); // color type: truecolor
  final out = BytesBuilder()
    ..add(const [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A])
    ..add(_chunk('IHDR', ihdr.buffer.asUint8List()))
    ..add(_chunk('IDAT', Uint8List.fromList(idat)))
    ..add(_chunk('IEND', Uint8List(0)));
  return out.takeBytes();
}

Uint8List _chunk(String type, Uint8List data) {
  final body = Uint8List.fromList([...type.codeUnits, ...data]);
  final out = ByteData(12 + data.length)..setUint32(0, data.length);
  out.buffer.asUint8List().setRange(4, 8 + data.length, body);
  out.setUint32(8 + data.length, _crc32(body));
  return out.buffer.asUint8List();
}

int _crc32(Uint8List data) {
  var crc = 0xFFFFFFFF;
  for (final byte in data) {
    crc ^= byte;
    for (var i = 0; i < 8; i++) {
      crc = (crc >> 1) ^ (0xEDB88320 & -(crc & 1));
    }
  }
  return (crc ^ 0xFFFFFFFF) & 0xFFFFFFFF;
}

void main() {
  const rounded = BeomoraLogoPainter(background: BeomoraLogoBackground.rounded);
  const square = BeomoraLogoPainter(background: BeomoraLogoBackground.square);
  const maskable = BeomoraLogoPainter(
      background: BeomoraLogoBackground.square, inset: 0.11);

  test(
    'render ikon aplikasi dari logo',
    () async {
      // Android (ikon launcher legacy, sudut bulat transparan).
      const mipmaps = {
        'mdpi': 48,
        'hdpi': 72,
        'xhdpi': 96,
        'xxhdpi': 144,
        'xxxhdpi': 192,
      };
      for (final e in mipmaps.entries) {
        await _writePng(
          'android/app/src/main/res/mipmap-${e.key}/ic_launcher.png',
          e.value,
          rounded,
        );
      }

      // iOS — kotak penuh, opaque, tanpa kanal alpha.
      const iosIcons = {
        'Icon-App-20x20@1x.png': 20,
        'Icon-App-20x20@2x.png': 40,
        'Icon-App-20x20@3x.png': 60,
        'Icon-App-29x29@1x.png': 29,
        'Icon-App-29x29@2x.png': 58,
        'Icon-App-29x29@3x.png': 87,
        'Icon-App-40x40@1x.png': 40,
        'Icon-App-40x40@2x.png': 80,
        'Icon-App-40x40@3x.png': 120,
        'Icon-App-60x60@2x.png': 120,
        'Icon-App-60x60@3x.png': 180,
        'Icon-App-76x76@1x.png': 76,
        'Icon-App-76x76@2x.png': 152,
        'Icon-App-83.5x83.5@2x.png': 167,
        'Icon-App-1024x1024@1x.png': 1024,
      };
      for (final e in iosIcons.entries) {
        await _writeOpaquePng(
          'ios/Runner/Assets.xcassets/AppIcon.appiconset/${e.key}',
          e.value,
          square,
        );
      }

      // Web/PWA + favicon.
      await _writePng('web/icons/Icon-192.png', 192, rounded);
      await _writePng('web/icons/Icon-512.png', 512, rounded);
      await _writePng('web/icons/Icon-maskable-192.png', 192, maskable);
      await _writePng('web/icons/Icon-maskable-512.png', 512, maskable);
      await _writePng('web/favicon.png', 64, rounded);

      // Pratinjau besar untuk dicek mata (tidak dipakai aplikasi).
      await _writePng('build/logo_preview.png', 512, rounded);
    },
    skip: Platform.environment['RENDER_ICONS'] != '1'
        ? 'Hanya berjalan dengan RENDER_ICONS=1 (menulis ulang ikon).'
        : false,
  );
}
