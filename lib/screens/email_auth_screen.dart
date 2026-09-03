import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_strings.dart';
import '../providers/auth_provider.dart';
import '../widgets/beomora_logo.dart';
import '../widgets/duo_button.dart';
import 'register_screen.dart';

/// Masuk / daftar dengan email & sandi. Alurnya menyatu dengan jalur
/// Google: setelah autentikasi, profil dicek di Firestore — belum ada
/// profil → halaman pendaftaran (nama), keluar tanpa mendaftar =
/// sesi dibatalkan.
class EmailAuthScreen extends StatefulWidget {
  const EmailAuthScreen({super.key});

  @override
  State<EmailAuthScreen> createState() => _EmailAuthScreenState();
}

class _EmailAuthScreenState extends State<EmailAuthScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _signup = false;
  bool _obscure = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _toast(String msg) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        duration: const Duration(seconds: 5),
        content: Text(msg),
      ));
  }

  Future<void> _submit() async {
    final l = L.read(context);
    final auth = context.read<AuthProvider>();
    final navigator = Navigator.of(context);
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final pass = _passController.text;
    final phone = _phoneController.text.trim();
    if (email.isEmpty || pass.isEmpty) {
      _toast(l.t('email_fill_all'));
      return;
    }
    // Validasi data pendaftaran SEBELUM akun auth dibuat, supaya tidak
    // ada akun "setengah jadi" kalau nama/telepon bermasalah.
    if (_signup) {
      if (name.isEmpty) return _toast(l.t('register_name_empty'));
      if (phone.isEmpty) return _toast(l.t('register_phone_empty'));
      if (!AuthProvider.isValidPhone(phone)) {
        return _toast(l.t('phone_invalid'));
      }
    }

    var errorKey = _signup
        ? await auth.signUpWithEmail(email, pass)
        : await auth.signInWithEmail(email, pass);
    if (!mounted) return;
    if (errorKey != null) {
      final detail = auth.lastErrorDetail;
      _toast(errorKey == 'login_failed' && detail != null
          ? '${l.t(errorKey)}\n($detail)'
          : l.t(errorKey));
      return;
    }

    if (_signup && auth.needsRegistration) {
      // Daftar: profil (nama + telepon) langsung ditulis, satu langkah.
      errorKey = await auth.register(name, phone: phone);
      if (!mounted) return;
      if (errorKey != null) {
        final detail = auth.lastErrorDetail;
        _toast(detail == null
            ? l.t(errorKey)
            : '${l.t(errorKey)}\n($detail)');
        return;
      }
    } else if (auth.needsRegistration) {
      // Masuk dengan akun auth lama yang belum punya profil →
      // lengkapi lewat halaman pendaftaran.
      await navigator.push(
        MaterialPageRoute(builder: (_) => const RegisterScreen()),
      );
      if (!mounted) return;
      if (auth.needsRegistration) {
        // Keluar dari pendaftaran tanpa menyelesaikan.
        await auth.cancelRegistration();
        if (!mounted) return;
        _toast(l.t('register_canceled'));
        return;
      }
    }
    // Sudah masuk penuh — gerbang main.dart menukar home ke MainScreen;
    // tinggal menutup halaman ini.
    if (auth.signedIn) navigator.pop();
  }

  Future<void> _resetPassword() async {
    final l = L.read(context);
    final auth = context.read<AuthProvider>();
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      _toast(l.t('email_fill_all'));
      return;
    }
    final errorKey = await auth.sendPasswordReset(email);
    if (!mounted) return;
    _toast(l.t(errorKey ?? 'reset_sent'));
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final auth = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
            l.t(_signup ? 'email_signup_title' : 'email_login_title')),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const Center(child: BeomoraLogo(size: 88)),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (_signup) ...[
                      TextField(
                        controller: _nameController,
                        textCapitalization: TextCapitalization.words,
                        maxLength: 40,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: l.t('register_name_label'),
                          prefixIcon:
                              const Icon(Icons.person_outline),
                          counterText: '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                    ],
                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: l.t('email_label'),
                        prefixIcon: const Icon(Icons.mail_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    TextField(
                      controller: _passController,
                      obscureText: _obscure,
                      textInputAction: _signup
                          ? TextInputAction.next
                          : TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: l.t('password_label'),
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(_obscure
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                          onPressed: () =>
                              setState(() => _obscure = !_obscure),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onSubmitted: (_) =>
                          _signup || auth.busy ? null : _submit(),
                    ),
                    if (_signup) ...[
                      const SizedBox(height: 14),
                      TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: l.t('register_phone_label'),
                          prefixIcon: const Icon(Icons.phone_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onSubmitted: (_) =>
                            auth.busy ? null : _submit(),
                      ),
                    ],
                    if (!_signup)
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: auth.busy ? null : _resetPassword,
                          child: Text(l.t('forgot_password')),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            DuoButton(
              label:
                  l.t(_signup ? 'email_signup_btn' : 'email_login_btn'),
              onPressed: auth.busy ? null : _submit,
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: auth.busy
                  ? null
                  : () => setState(() => _signup = !_signup),
              child:
                  Text(l.t(_signup ? 'have_account' : 'no_account_yet')),
            ),
            if (auth.busy) ...[
              const SizedBox(height: 8),
              const Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2.5),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
