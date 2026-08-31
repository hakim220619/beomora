import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_strings.dart';
import '../providers/auth_provider.dart';
import '../screens/register_screen.dart';
import '../theme.dart';
import 'duo_dialog.dart';

/// Tombol "Masuk dengan Google" lengkap dengan alurnya:
/// login → (kalau profil belum ada di Firestore) halaman pendaftaran →
/// keluar dari pendaftaran tanpa mendaftar = sesi dibatalkan.
/// Kalau Firebase belum dikonfigurasi, tombol membuka panduan setup.
class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  Future<void> _signIn(BuildContext context) async {
    final l = L.read(context);
    final auth = context.read<AuthProvider>();
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    final errorKey = await auth.signIn();
    if (errorKey != null) {
      final detail = auth.lastErrorDetail;
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
          duration: const Duration(seconds: 6),
          content: Text(detail == null || errorKey == 'provider_disabled'
              ? l.t(errorKey)
              : '${l.t(errorKey)}\n($detail)'),
        ));
      return;
    }
    // Login Google sukses tapi profil belum ada di Firestore →
    // wajib mendaftar dulu. Keluar tanpa mendaftar = sesi dibatalkan.
    if (auth.needsRegistration) {
      await navigator.push(
        MaterialPageRoute(builder: (_) => const RegisterScreen()),
      );
      if (auth.needsRegistration) {
        await auth.cancelRegistration();
        messenger
          ..hideCurrentSnackBar()
          ..showSnackBar(
              SnackBar(content: Text(l.t('register_canceled'))));
      }
    }
  }

  void _showSetupDialog(BuildContext context) {
    final l = L.read(context);
    showDuoDialog<void>(
      context,
      emoji: '⚙️',
      color: DuoColors.blue,
      title: l.t('login_setup_title'),
      content: Text(
        l.t('login_setup_steps'),
        style: TextStyle(
          fontSize: 13.5,
          height: 1.5,
          color: Theme.of(context).hintColor,
        ),
      ),
      actions: [
        DuoDialogAction(label: l.t('ok'), primary: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final auth = context.watch<AuthProvider>();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return _GoogleButtonVisual(
      label: l.t('sign_in_google'),
      busy: auth.busy,
      dark: isDark,
      onPressed: () => auth.configured
          ? _signIn(context)
          : _showSetupDialog(context),
    );
  }
}

/// Tampilan tombol bergaya Google (huruf G + label), netral tema.
class _GoogleButtonVisual extends StatelessWidget {
  final String label;
  final bool busy;
  final bool dark;
  final VoidCallback onPressed;

  const _GoogleButtonVisual({
    required this.label,
    required this.busy,
    required this.dark,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: busy ? null : onPressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: dark ? const Color(0xFF1F3B57) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: dark ? const Color(0x59FFFFFF) : const Color(0xFFDADCE0),
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
            if (busy)
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2.5),
              )
            else
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: const Color(0xFFDADCE0), width: 1),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'G',
                  style: TextStyle(
                    color: Color(0xFF4285F4),
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
              ),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
                color: dark ? Colors.white : const Color(0xFF3C4043),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
