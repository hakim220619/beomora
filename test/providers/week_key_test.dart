import 'package:beomora/providers/progress_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // WIB = UTC+7, jadi Minggu 23:59:59 WIB = Minggu 16:59:59 UTC.
  test('minggu WIB: Senin 00:00:00 s.d. Minggu 23:59:59', () {
    final sunLast = DateTime.utc(2026, 11, 8, 16, 59, 59);
    final monFirst = DateTime.utc(2026, 11, 8, 17);
    expect(ProgressProvider.weekOf(sunLast), 'w20261102');
    expect(ProgressProvider.weekOf(monFirst), 'w20261109');
    // Senin 00:00 WIB awal minggu = Minggu 17:00 UTC sebelumnya.
    expect(ProgressProvider.weekOf(DateTime.utc(2026, 11, 1, 17)), 'w20261102');
  });

  test('reset tepat setelah Minggu 23:59:59 WIB', () {
    final reset = DateTime.utc(2026, 11, 8, 17);
    expect(ProgressProvider.weekResetAt(DateTime.utc(2026, 11, 4, 3)), reset);
    expect(
      ProgressProvider.weekResetAt(DateTime.utc(2026, 11, 8, 16, 59, 59)),
      reset,
    );
  });

  test('pergantian tahun tidak membuat minggu pendek', () {
    // Rabu 31 Des 2026 & Kamis 1 Jan 2027 di minggu yang sama.
    expect(
      ProgressProvider.weekOf(DateTime.utc(2026, 12, 31, 5)),
      ProgressProvider.weekOf(DateTime.utc(2027, 1, 1, 5)),
    );
  });

  test('kunci muat aturan Firestore (< 12 karakter)', () {
    expect(ProgressProvider.weekOf(DateTime.now()).length, lessThan(12));
  });
}
