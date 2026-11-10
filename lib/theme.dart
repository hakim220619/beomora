import 'package:flutter/material.dart';

/// Palet aksen aplikasi — nama anggota dipertahankan agar seluruh
/// layar ikut berganti kulit tanpa perlu diubah satu-satu.
class DuoColors {
  // Aksi utama: hijau papan tulis segar
  static const green = Color(0xFF00B884);
  static const greenDark = Color(0xFF008F66);
  // Tinta pulpen biru
  static const blue = Color(0xFF2E86E8);
  static const blueDark = Color(0xFF1D66BE);
  // Pena koreksi merah
  static const red = Color(0xFFEF5350);
  static const redDark = Color(0xFFC62828);
  // Bintang prestasi
  static const yellow = Color(0xFFF5B300);
  // Stabilo oranye
  static const orange = Color(0xFFF57C3B);
  // Stabilo ungu
  static const purple = Color(0xFF8E6FE8);
  static const gray = Color(0xFF9AA5B1);
  static const snow = Color(0xFFFAF8F0);
  // Tinta catatan (teks gelap)
  static const eel = Color(0xFF2B3440);
}

/// Warna suasana belajar: kertas buku catatan (terang) dan papan
/// tulis kapur (gelap), plus kayu meja belajar.
class StudyColors {
  // Buku catatan
  static const paper = Color(0xFFFDFBF2);
  static const paperShade = Color(0xFFF4EFDD);
  static const paperLine = Color(0xFFBBD7EE);
  static const paperMargin = Color(0xFFE89AA4);
  static const pencil = Color(0xFF8A8F98);
  // Papan tulis
  static const boardTop = Color(0xFF1A4033);
  static const boardBottom = Color(0xFF0C241B);
  static const chalk = Color(0xFFEFEEE4);
  // Meja / bingkai kayu
  static const wood = Color(0xFF9C6B45);
  static const woodDark = Color(0xFF6E4527);
}

ThemeData buildTheme(Brightness brightness) {
  final isDark = brightness == Brightness.dark;
  final base = ThemeData(
    useMaterial3: true,
    brightness: brightness,
    colorScheme: ColorScheme.fromSeed(
      seedColor: DuoColors.green,
      brightness: brightness,
      primary: DuoColors.green,
      secondary: DuoColors.blue,
      error: DuoColors.red,
    ),
    scaffoldBackgroundColor: isDark
        ? StudyColors.boardBottom
        : StudyColors.paper,
    fontFamily: 'Roboto',
  );
  return base.copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: isDark ? StudyColors.chalk : DuoColors.eel,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w900,
        letterSpacing: 0.3,
        color: isDark ? StudyColors.chalk : DuoColors.eel,
      ),
    ),
    // Kartu "kertas indeks" di atas buku / papan tulis.
    cardTheme: CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(
          color: isDark
              ? StudyColors.chalk.withValues(alpha: 0.28)
              : const Color(0xFFE7E0C9),
          width: 1.5,
        ),
      ),
      color: isDark
          ? Colors.white.withValues(alpha: 0.07)
          : Colors.white.withValues(alpha: 0.92),
    ),
    dividerColor: isDark ? const Color(0xFF2E5546) : const Color(0xFFDDD6C0),
    // Warna teks snackbar ditetapkan eksplisit: bawaan Material 3 di tema
    // gelap memakai onInverseSurface (gelap) — tak terbaca di latar hijau
    // papan tulis.
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: isDark ? const Color(0xFF1C4434) : DuoColors.eel,
      contentTextStyle: TextStyle(
        fontSize: 14,
        height: 1.35,
        color: isDark ? StudyColors.chalk : Colors.white,
      ),
      actionTextColor: isDark ? DuoColors.yellow : const Color(0xFF7CE0B8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
    // Lembar bawah (detail kosakata, jumlah soal, dll.) senada dialog.
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: isDark ? StudyColors.boardTop : StudyColors.paper,
      surfaceTintColor: Colors.transparent,
      modalBackgroundColor: isDark ? StudyColors.boardTop : StudyColors.paper,
    ),
    // AlertDialog biasa disamakan dengan dialog khas Beomora
    // (showDuoDialog): kertas di tema terang, papan tulis di tema gelap.
    dialogTheme: DialogThemeData(
      backgroundColor: isDark ? StudyColors.boardTop : StudyColors.paper,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
        side: BorderSide(
          color: isDark
              ? StudyColors.chalk.withValues(alpha: 0.28)
              : const Color(0xFFE7E0C9),
          width: 1.5,
        ),
      ),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w900,
        color: isDark ? StudyColors.chalk : DuoColors.eel,
      ),
      contentTextStyle: TextStyle(
        fontSize: 14.5,
        height: 1.5,
        color: isDark
            ? StudyColors.chalk.withValues(alpha: 0.85)
            : DuoColors.eel.withValues(alpha: 0.85),
      ),
    ),
  );
}
