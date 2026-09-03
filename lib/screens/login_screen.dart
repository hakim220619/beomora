import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_strings.dart';
import '../providers/auth_provider.dart';
import '../widgets/beomora_logo.dart';
import '../widgets/google_sign_in_button.dart';
import 'email_auth_screen.dart';

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
              const SizedBox(height: 14),
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      l.t('or'),
                      style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 14),
              _EmailSignInButton(label: l.t('sign_in_email')),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

/// Tombol "Masuk dengan Email" — visual senada dengan tombol Google.
class _EmailSignInButton extends StatelessWidget {
  final String label;
  const _EmailSignInButton({required this.label});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: auth.busy
          ? null
          : () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_) => const EmailAuthScreen()),
              ),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1F3B57) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color:
                isDark ? const Color(0x59FFFFFF) : const Color(0xFFDADCE0),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              offset: const Offset(0, 3),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.mail_outline,
              size: 22,
              color: isDark ? Colors.white : const Color(0xFF3C4043),
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
                color: isDark ? Colors.white : const Color(0xFF3C4043),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
