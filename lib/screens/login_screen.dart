import 'package:flutter/material.dart';

import '../l10n/app_strings.dart';
import '../widgets/beomora_logo.dart';
import '../widgets/google_sign_in_button.dart';

/// Gerbang masuk aplikasi: menu utama hanya terbuka setelah login
/// dengan akun Google (dan terdaftar di Firestore). Ditampilkan oleh
/// main.dart selama [AuthProvider.signedIn] masih false.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              const Center(child: BeomoraLogo(size: 150)),
              const SizedBox(height: 24),
              Text(
                l.t('login_title'),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 24, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              Text(
                l.t('login_gate_sub'),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16, color: Theme.of(context).hintColor),
              ),
              const Spacer(),
              const GoogleSignInButton(),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
