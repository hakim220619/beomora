/// Konfigurasi OAuth untuk Login Google.
class AuthConfig {
  /// Client ID tipe "Web application". Dipakai sebagai serverClientId
  /// di Android dan sebagai clientId di Web.
  ///
  /// Nilai ini = oauth_client bertipe web (client_type 3) milik proyek
  /// Firebase "beomora-64d64" — dibuat otomatis saat provider Google
  /// diaktifkan (lihat android/app/google-services.json).
  static const String googleWebClientId = String.fromEnvironment(
    'GOOGLE_WEB_CLIENT_ID',
    defaultValue:
        '891762608871-mluctvqgj8gvvmr9t9d96dimmba8mnuc.apps.googleusercontent.com',
  );

  /// Client ID tipe "iOS" (opsional, hanya untuk build iOS).
  static const String googleIosClientId = String.fromEnvironment(
    'GOOGLE_IOS_CLIENT_ID',
    defaultValue: '',
  );

  /// Email admin: satu-satunya akun yang boleh mengunggah materi ke
  /// Firestore. HARUS sama dengan email di firestore.rules.
  static const String adminEmail = String.fromEnvironment(
    'BEOMORA_ADMIN_EMAIL',
    defaultValue: 'danilukman2206@gmail.com',
  );
}
