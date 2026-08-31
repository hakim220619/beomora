// Konfigurasi Firebase proyek "beomora-64d64".
//
// Android: nilai diambil dari google-services.json (Firebase Console →
// Project settings → aplikasi Android com.example.beomora).
//
// Web & iOS BELUM terdaftar — kalau nanti butuh:
// - Web: Firebase Console → Project settings → "Add app" → Web,
//   lalu salin nilainya ke [web] di bawah (apiKey, appId 1:...:web:...,
//   authDomain beomora-64d64.firebaseapp.com).
// - iOS: daftarkan app iOS + GoogleService-Info.plist, atau jalankan
//   `flutterfire configure`.
// Selama apiKey sebuah platform masih mengandung 'GANTI', platform itu
// berjalan dalam mode tamu.

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        return android;
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDb-RMgZwOPFdObDE93fDGBGc4h0RHF8aM',
    appId: '1:891762608871:android:81ffef328118d5537db042',
    messagingSenderId: '891762608871',
    projectId: 'beomora-64d64',
    storageBucket: 'beomora-64d64.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'GANTI-daftarkan-app-iOS-dulu',
    appId: 'GANTI',
    messagingSenderId: '891762608871',
    projectId: 'beomora-64d64',
    iosBundleId: 'com.example.beomora',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'GANTI-daftarkan-app-Web-dulu',
    appId: 'GANTI',
    messagingSenderId: '891762608871',
    projectId: 'beomora-64d64',
    authDomain: 'beomora-64d64.firebaseapp.com',
  );
}
