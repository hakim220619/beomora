import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_strings.dart';
import '../providers/auth_provider.dart';
import '../theme.dart';
import '../widgets/beomora_logo.dart';
import '../widgets/duo_button.dart';

/// Halaman pendaftaran: muncul saat akun Google berhasil login tapi
/// profilnya belum ada di Firestore. Sukses mendaftar berarti profil
/// TERBUKTI tersimpan (ditulis + diverifikasi baca-ulang dari server
/// oleh [AuthProvider.register]). Menutup halaman tanpa mendaftar
/// membatalkan sesi (ditangani pemanggil via
/// [AuthProvider.needsRegistration]).
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _nameController;
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final user = context.read<AuthProvider>().pendingUser;
    _nameController = TextEditingController(
      text: user?.displayName ?? (user?.email ?? '').split('@').first,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final l = L.read(context);
    final auth = context.read<AuthProvider>();
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    final errorKey = await auth.register(_nameController.text,
        phone: _phoneController.text);
    if (!mounted) return;
    if (errorKey == null) {
      // Gerbang di main.dart sudah menukar home menjadi MainScreen;
      // tinggal menutup halaman ini.
      navigator.pop();
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(l.t('register_success'))));
    } else {
      final detail = auth.lastErrorDetail;
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
          duration: const Duration(seconds: 6),
          content: Text(errorKey == 'register_name_empty' ||
                  errorKey == 'register_phone_empty' ||
                  errorKey == 'phone_invalid' ||
                  detail == null
              ? l.t(errorKey)
              : '${l.t(errorKey)}\n($detail)'),
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final auth = context.watch<AuthProvider>();
    final user = auth.pendingUser;

    return Scaffold(
      appBar: AppBar(title: Text(l.t('register_title'))),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const Center(child: BeomoraLogo(size: 88)),
            const SizedBox(height: 16),
            Text(
              l.t('register_sub'),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor:
                              DuoColors.blue.withValues(alpha: 0.18),
                          foregroundImage: user?.photoURL != null
                              ? NetworkImage(user!.photoURL!)
                              : null,
                          child: const Text('🦉',
                              style: TextStyle(fontSize: 22)),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            user?.email ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _nameController,
                      textCapitalization: TextCapitalization.words,
                      maxLength: 40,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: l.t('register_name_label'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
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
                ),
              ),
            ),
            const SizedBox(height: 24),
            DuoButton(
              label: l.t('register_btn'),
              onPressed: auth.busy ? null : _submit,
            ),
            if (auth.busy) ...[
              const SizedBox(height: 16),
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
