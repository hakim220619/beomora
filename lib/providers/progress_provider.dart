import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/achievement.dart';

/// Hasil pencocokan progres lokal vs server (lihat
/// [ProgressProvider.reconcileCloudJson]).
enum CloudMerge {
  /// Progres server dipakai menggantikan lokal.
  applied,

  /// Sama persis — tidak perlu apa-apa.
  identical,

  /// Lokal lebih layak — perlu di-push ke server.
  localWins,
}

/// Hasil menyelesaikan pelajaran, untuk layar perayaan.
class LessonReward {
  final int xp;
  final int gems;
  final bool perfect;
  final List<String> newAchievements;
  const LessonReward({
    required this.xp,
    required this.gems,
    required this.perfect,
    required this.newAchievements,
  });
}

class ProgressProvider extends ChangeNotifier {
  static const _key = 'progress_v1';
  static const maxHearts = 5;

  /// Menit per 1 nyawa pulih. Bisa diubah admin lewat field
  /// `heartRegenMinutes` di dokumen `content/config` (berlaku global);
  /// di-cache ke prefs supaya tetap berlaku saat offline.
  static const kHeartRegenPref = 'heart_regen_minutes';
  static const defaultHeartRegenMinutes = 30;
  int heartRegenMinutes = defaultHeartRegenMinutes;
  // Hadiah permata target harian & target bonus (2x), sekali per hari.
  static const goalRewardGems = 10;
  static const bonusRewardGems = 20;
  // Hadiah menyelesaikan tantangan streak (10/30/50/90/120 hari).
  static const streakGoalRewardGems = 50;

  final SharedPreferences _prefs;

  String activeCourseId = 'en';
  int xp = 0;
  int gems = 100;
  int _hearts = maxHearts;
  int _heartsUpdatedAt = 0; // epoch ms, patokan regenerasi
  int streak = 0;
  int longestStreak = 0;
  String lastActiveDay = ''; // yyyy-MM-dd
  int streakFreezes = 0;

  /// Tantangan streak: target hari belajar yang dipilih pengguna
  /// (onboarding/pengaturan). Berbeda dari [streak]: hitungannya
  /// TIDAK hangus saat bolos — bolos hanya memunculkan pemberitahuan.
  int streakGoalDays = 30;
  int goalDaysDone = 0; // total hari belajar menuju target
  int goalCelebrated = 0; // target yang perayaannya sudah tampil
  String missNoticeDate = ''; // yyyy-MM-dd notice bolos terakhir
  /// Menunggu ditampilkan UI saat aplikasi dibuka (tidak disimpan).
  bool pendingMissNotice = false;
  int dailyGoal = 20;
  int xpToday = 0;
  String xpTodayDate = '';
  int weeklyXp = 0;
  String weekKey = '';
  String goalRewardDate = ''; // yyyy-MM-dd hadiah harian diklaim
  String bonusRewardDate = ''; // yyyy-MM-dd hadiah bonus diklaim
  int boostUntil = 0; // epoch ms XP ganda
  int totalLessonsDone = 0;
  int totalAnswers = 0;
  int correctAnswers = 0;
  int bestTimeChallenge = 0;
  int bestMemoryMoves = 0; // 0 = belum pernah main
  bool hadPerfectLesson = false;
  Map<String, Set<String>> completedLessons = {};
  Map<String, Set<String>> masteredWords = {};
  Set<String> unlockedAchievements = {};
  Set<String> coursesTried = {};

  /// Kapan progres terakhir berubah (epoch ms) — dasar pencocokan
  /// lokal vs server saat login/restore.
  int savedAt = 0;

  /// Catatan harian: kunci `yyyy-MM-dd` → XP hari itu. Dipangkas ke
  /// [dailyLogDays] hari terakhir — bahan Kalender Belajar.
  Map<String, int> dailyXp = {};
  static const dailyLogDays = 92;

  /// Status premium (di-update AuthProvider via ProgressSyncService).
  /// Dibaca dari cache prefs saat startup supaya pelindung streak
  /// premium bekerja sebelum profil server termuat.
  bool premiumActive = false;

  ProgressProvider(this._prefs) {
    premiumActive = _prefs.getBool('auth_premium') ?? false;
    heartRegenMinutes =
        _prefs.getInt(kHeartRegenPref) ?? defaultHeartRegenMinutes;
    _load();
    _checkStreakOnLaunch();
  }

  /// Terapkan menit regenerasi nyawa dari server/admin (dijepit 1-1440).
  void applyHeartRegenMinutes(int minutes) {
    final m = minutes.clamp(1, 1440);
    if (m == heartRegenMinutes) return;
    heartRegenMinutes = m;
    _prefs.setInt(kHeartRegenPref, m);
    notifyListeners();
  }

  void setPremium(bool value) {
    if (value == premiumActive) return;
    premiumActive = value;
    notifyListeners();
  }

  /// Top-up permata (pembelian uang asli).
  void addGems(int amount) {
    gems += amount;
    _save();
    notifyListeners();
  }

  // ---------- Derivatif ----------

  int get level => xp ~/ 100 + 1;
  int get xpIntoLevel => xp % 100;

  double get accuracy =>
      totalAnswers == 0 ? 0 : correctAnswers / totalAnswers;

  bool get boostActive =>
      DateTime.now().millisecondsSinceEpoch < boostUntil;

  /// Premium menikmati XP dobel permanen.
  int get xpMultiplier => boostActive || premiumActive ? 2 : 1;

  int get wordsMasteredCount =>
      masteredWords.values.fold(0, (a, s) => a + s.length);

  // ---------- Target harian & hadiah ----------

  /// XP hari ini yang sadar tanggal — [xpToday] baru di-reset saat XP
  /// pertama masuk, jadi tanpa ini nilai kemarin ikut terbawa.
  int get xpTodayLive =>
      xpTodayDate == _dayKey(DateTime.now()) ? xpToday : 0;

  /// Target bonus setelah target harian diklaim: 2x target harian.
  int get bonusGoal => dailyGoal * 2;

  bool get dailyGoalReached => xpTodayLive >= dailyGoal;

  bool get canClaimGoalReward =>
      dailyGoalReached && goalRewardDate != _dayKey(DateTime.now());

  /// Target bonus aktif: hadiah harian sudah diklaim hari ini,
  /// hadiah bonus belum.
  bool get bonusGoalActive =>
      goalRewardDate == _dayKey(DateTime.now()) &&
      bonusRewardDate != _dayKey(DateTime.now());

  bool get canClaimBonusReward =>
      bonusGoalActive && xpTodayLive >= bonusGoal;

  bool get bonusRewardClaimed =>
      bonusRewardDate == _dayKey(DateTime.now());

  /// Tantangan streak selesai tapi perayaannya belum ditampilkan.
  bool get pendingGoalCelebration =>
      goalDaysDone >= streakGoalDays && goalCelebrated < streakGoalDays;

  /// Nyawa dengan regenerasi 1 per [heartRegenMinutes] menit.
  /// Premium: hati tak terbatas (selalu penuh).
  int get hearts {
    if (premiumActive) return maxHearts;
    _applyRegen();
    return _hearts;
  }

  Duration? get nextHeartIn {
    _applyRegen();
    if (_hearts >= maxHearts) return null;
    final next = _heartsUpdatedAt + heartRegenMinutes * 60000;
    return Duration(
        milliseconds: next - DateTime.now().millisecondsSinceEpoch);
  }

  void _applyRegen() {
    if (_hearts >= maxHearts) return;
    final now = DateTime.now().millisecondsSinceEpoch;
    final regenMs = heartRegenMinutes * 60000;
    while (_hearts < maxHearts && now - _heartsUpdatedAt >= regenMs) {
      _hearts++;
      _heartsUpdatedAt += regenMs;
    }
    if (_hearts >= maxHearts) _heartsUpdatedAt = now;
  }

  bool isLessonCompleted(String courseId, String lessonId) =>
      completedLessons[courseId]?.contains(lessonId) ?? false;

  int completedInCourse(String courseId) =>
      completedLessons[courseId]?.length ?? 0;

  // ---------- Aksi ----------

  void setActiveCourse(String courseId) {
    activeCourseId = courseId;
    coursesTried.add(courseId);
    _checkAchievements();
    _save();
    notifyListeners();
  }

  void setDailyGoal(int goal) {
    dailyGoal = goal;
    _save();
    notifyListeners();
  }

  /// Ubah target tantangan streak (10/30/50/90/120 hari).
  void setStreakGoal(int days) {
    streakGoalDays = days;
    // Target yang sudah terlampaui dianggap selesai tanpa perayaan
    // ulang; target lebih tinggi membuka perayaan berikutnya.
    if (goalDaysDone >= days) goalCelebrated = days;
    _save();
    notifyListeners();
  }

  /// Rayakan tantangan streak yang selesai: +permata, sekali per
  /// target. Mengembalikan jumlah permata (0 jika tidak ada perayaan).
  int celebrateStreakGoal() {
    if (!pendingGoalCelebration) return 0;
    goalCelebrated = streakGoalDays;
    gems += streakGoalRewardGems;
    _save();
    notifyListeners();
    return streakGoalRewardGems;
  }

  /// Tandai notice bolos sudah ditampilkan hari ini.
  void markMissNoticeShown() {
    pendingMissNotice = false;
    missNoticeDate = _dayKey(DateTime.now());
    _save();
  }

  /// Klaim hadiah target harian (sekali per hari).
  /// Mengembalikan jumlah permata; 0 jika belum berhak.
  int claimGoalReward() {
    if (!canClaimGoalReward) return 0;
    goalRewardDate = _dayKey(DateTime.now());
    gems += goalRewardGems;
    _save();
    notifyListeners();
    return goalRewardGems;
  }

  /// Klaim hadiah target bonus 2x (sekali per hari).
  int claimBonusReward() {
    if (!canClaimBonusReward) return 0;
    bonusRewardDate = _dayKey(DateTime.now());
    gems += bonusRewardGems;
    _save();
    notifyListeners();
    return bonusRewardGems;
  }

  void loseHeart() {
    if (premiumActive) return; // hati tak terbatas
    _applyRegen();
    if (_hearts > 0) {
      if (_hearts == maxHearts) {
        _heartsUpdatedAt = DateTime.now().millisecondsSinceEpoch;
      }
      _hearts--;
    }
    _save();
    notifyListeners();
  }

  void restoreHeart([int n = 1]) {
    _applyRegen();
    _hearts = (_hearts + n).clamp(0, maxHearts);
    _save();
    notifyListeners();
  }

  void refillHearts() {
    _hearts = maxHearts;
    _heartsUpdatedAt = DateTime.now().millisecondsSinceEpoch;
    _save();
    notifyListeners();
  }

  bool spendGems(int amount) {
    if (gems < amount) return false;
    gems -= amount;
    _save();
    notifyListeners();
    return true;
  }

  void addStreakFreeze() {
    streakFreezes++;
    _save();
    notifyListeners();
  }

  void activateBoost(Duration duration) {
    boostUntil =
        DateTime.now().add(duration).millisecondsSinceEpoch;
    _save();
    notifyListeners();
  }

  void recordAnswer(bool correct) {
    totalAnswers++;
    if (correct) correctAnswers++;
    // Disimpan bersama event besar berikutnya (hemat I/O).
  }

  /// Tambah XP dari sumber apa pun; mengembalikan XP final setelah boost.
  int addXp(int base) {
    final earned = base * xpMultiplier;
    xp += earned;
    _touchDaily(earned);
    _save();
    notifyListeners();
    return earned;
  }

  LessonReward completeLesson({
    required String courseId,
    required String lessonId,
    required List<String> wordTargets,
    required bool perfect,
    required bool firstTime,
  }) {
    final baseXp = (firstTime ? 10 : 5) + (perfect ? 5 : 0);
    final earnedXp = baseXp * xpMultiplier;
    final earnedGems = perfect ? 15 : 10;

    xp += earnedXp;
    gems += earnedGems;
    totalLessonsDone++;
    if (perfect) hadPerfectLesson = true;
    (completedLessons[courseId] ??= {}).add(lessonId);
    (masteredWords[courseId] ??= {}).addAll(wordTargets);
    coursesTried.add(courseId);

    _touchDaily(earnedXp);
    _updateStreak();
    final newAch = _checkAchievements();

    _save();
    notifyListeners();
    return LessonReward(
      xp: earnedXp,
      gems: earnedGems,
      perfect: perfect,
      newAchievements: newAch,
    );
  }

  /// Latihan bebas selesai: +XP dan pulihkan 1 nyawa.
  int completePractice() {
    final earned = addXp(5);
    restoreHeart();
    _updateStreak();
    _save();
    notifyListeners();
    return earned;
  }

  void reportTimeChallenge(int score) {
    if (score > bestTimeChallenge) bestTimeChallenge = score;
    addXp(score);
    _save();
    notifyListeners();
  }

  void reportMemoryGame(int moves) {
    if (bestMemoryMoves == 0 || moves < bestMemoryMoves) {
      bestMemoryMoves = moves;
    }
    addXp(5);
    _save();
    notifyListeners();
  }

  void resetAll() {
    activeCourseId = 'en';
    xp = 0;
    gems = 100;
    _hearts = maxHearts;
    _heartsUpdatedAt = DateTime.now().millisecondsSinceEpoch;
    streak = 0;
    longestStreak = 0;
    lastActiveDay = '';
    streakFreezes = 0;
    streakGoalDays = 30;
    goalDaysDone = 0;
    goalCelebrated = 0;
    missNoticeDate = '';
    pendingMissNotice = false;
    xpToday = 0;
    weeklyXp = 0;
    goalRewardDate = '';
    bonusRewardDate = '';
    boostUntil = 0;
    totalLessonsDone = 0;
    totalAnswers = 0;
    correctAnswers = 0;
    bestTimeChallenge = 0;
    bestMemoryMoves = 0;
    hadPerfectLesson = false;
    completedLessons = {};
    masteredWords = {};
    unlockedAchievements = {};
    coursesTried = {};
    dailyXp = {};
    _save();
    notifyListeners();
  }

  // ---------- Streak & harian ----------

  static String _dayKey(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  /// Kunci minggu (mis. `2026-w35`) — juga dipakai LeaderboardService
  /// untuk menyaring papan juara ke minggu berjalan.
  static String weekOf(DateTime d) {
    final firstDay = DateTime(d.year, 1, 1);
    final week = ((d.difference(firstDay).inDays) / 7).floor();
    return '${d.year}-w$week';
  }

  void _touchDaily(int earnedXp) {
    final today = _dayKey(DateTime.now());
    if (xpTodayDate != today) {
      xpTodayDate = today;
      xpToday = 0;
    }
    xpToday += earnedXp;
    final wk = weekOf(DateTime.now());
    if (weekKey != wk) {
      weekKey = wk;
      weeklyXp = 0;
    }
    weeklyXp += earnedXp;
    // Catatan kalender: XP per hari, buang yang lebih tua dari jendela.
    dailyXp[today] = (dailyXp[today] ?? 0) + earnedXp;
    final cutoff = _dayKey(
        DateTime.now().subtract(const Duration(days: dailyLogDays)));
    dailyXp.removeWhere((k, _) => k.compareTo(cutoff) < 0);
  }

  /// XP yang diraih pada satu tanggal (untuk Kalender Belajar).
  int xpOn(DateTime day) => dailyXp[_dayKey(day)] ?? 0;

  void _updateStreak() {
    final now = DateTime.now();
    final today = _dayKey(now);
    if (lastActiveDay == today) return;
    final yesterday = _dayKey(now.subtract(const Duration(days: 1)));
    if (lastActiveDay == yesterday || streak == 0) {
      streak++;
    } else {
      streak = 1;
    }
    lastActiveDay = today;
    if (streak > longestStreak) longestStreak = streak;
    // Tantangan streak: setiap hari belajar dihitung, bolos tidak
    // menghanguskan hitungan.
    goalDaysDone++;
  }

  /// Saat aplikasi dibuka: kalau bolos >1 hari, pakai pembeku streak
  /// (jika ada) atau reset streak. Bolos juga memunculkan notice
  /// (sekali per hari) — tantangan streak sendiri tidak hangus.
  void _checkStreakOnLaunch() {
    final now = DateTime.now();
    final today = _dayKey(now);
    final yesterday = _dayKey(now.subtract(const Duration(days: 1)));
    if (lastActiveDay.isNotEmpty &&
        lastActiveDay != today &&
        lastActiveDay != yesterday &&
        missNoticeDate != today) {
      pendingMissNotice = true;
    }
    if (lastActiveDay.isEmpty || streak == 0) return;
    if (lastActiveDay == today || lastActiveDay == yesterday) return;
    if (premiumActive) {
      lastActiveDay = yesterday; // pelindung streak premium (gratis)
    } else if (streakFreezes > 0) {
      streakFreezes--;
      lastActiveDay = yesterday; // streak diselamatkan
    } else {
      streak = 0;
    }
    _save();
  }

  // ---------- Achievement ----------

  List<String> _checkAchievements() {
    final newly = <String>[];
    bool met(String id) {
      switch (id) {
        case 'first_lesson':
          return totalLessonsDone >= 1;
        case 'lessons_10':
          return totalLessonsDone >= 10;
        case 'lessons_30':
          return totalLessonsDone >= 30;
        case 'streak_3':
          return longestStreak >= 3;
        case 'streak_7':
          return longestStreak >= 7;
        case 'streak_30':
          return longestStreak >= 30;
        case 'xp_500':
          return xp >= 500;
        case 'xp_2000':
          return xp >= 2000;
        case 'words_50':
          return wordsMasteredCount >= 50;
        case 'words_150':
          return wordsMasteredCount >= 150;
        case 'perfect_lesson':
          return hadPerfectLesson;
        case 'polyglot':
          return coursesTried.length >= 3;
      }
      return false;
    }

    for (final ach in kAchievements) {
      if (!unlockedAchievements.contains(ach.id) && met(ach.id)) {
        unlockedAchievements.add(ach.id);
        newly.add(ach.id);
      }
    }
    return newly;
  }

  // ---------- Persistensi & sinkronisasi ----------

  void _load() {
    final raw = _prefs.getString(_key);
    if (raw == null) {
      _heartsUpdatedAt = DateTime.now().millisecondsSinceEpoch;
      return;
    }
    try {
      _applyMap(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      // Data korup — mulai dari awal.
    }
  }

  void _applyMap(Map<String, dynamic> m) {
    activeCourseId = m['activeCourseId'] ?? 'en';
    xp = m['xp'] ?? 0;
    gems = m['gems'] ?? 100;
    _hearts = m['hearts'] ?? maxHearts;
    _heartsUpdatedAt =
        m['heartsUpdatedAt'] ?? DateTime.now().millisecondsSinceEpoch;
    streak = m['streak'] ?? 0;
    longestStreak = m['longestStreak'] ?? 0;
    lastActiveDay = m['lastActiveDay'] ?? '';
    streakFreezes = m['streakFreezes'] ?? 0;
    streakGoalDays = m['streakGoalDays'] ?? 30;
    goalDaysDone = m['goalDaysDone'] ?? 0;
    goalCelebrated = m['goalCelebrated'] ?? 0;
    missNoticeDate = m['missNoticeDate'] ?? '';
    dailyGoal = m['dailyGoal'] ?? 20;
    xpToday = m['xpToday'] ?? 0;
    xpTodayDate = m['xpTodayDate'] ?? '';
    weeklyXp = m['weeklyXp'] ?? 0;
    weekKey = m['weekKey'] ?? '';
    goalRewardDate = m['goalRewardDate'] ?? '';
    bonusRewardDate = m['bonusRewardDate'] ?? '';
    boostUntil = m['boostUntil'] ?? 0;
    totalLessonsDone = m['totalLessonsDone'] ?? 0;
    totalAnswers = m['totalAnswers'] ?? 0;
    correctAnswers = m['correctAnswers'] ?? 0;
    bestTimeChallenge = m['bestTimeChallenge'] ?? 0;
    bestMemoryMoves = m['bestMemoryMoves'] ?? 0;
    hadPerfectLesson = m['hadPerfectLesson'] ?? false;
    completedLessons = (m['completedLessons'] as Map<String, dynamic>? ??
            {})
        .map((k, v) => MapEntry(k, Set<String>.from(v as List)));
    masteredWords = (m['masteredWords'] as Map<String, dynamic>? ?? {})
        .map((k, v) => MapEntry(k, Set<String>.from(v as List)));
    unlockedAchievements =
        Set<String>.from(m['unlockedAchievements'] as List? ?? []);
    coursesTried = Set<String>.from(m['coursesTried'] as List? ?? []);
    dailyXp = (m['dailyXp'] as Map<String, dynamic>? ?? {})
        .map((k, v) => MapEntry(k, (v as num).toInt()));
    savedAt = (m['savedAt'] as num?)?.toInt() ?? 0;
  }

  Map<String, dynamic> _toMap() => {
        'activeCourseId': activeCourseId,
        'xp': xp,
        'gems': gems,
        'hearts': _hearts,
        'heartsUpdatedAt': _heartsUpdatedAt,
        'streak': streak,
        'longestStreak': longestStreak,
        'lastActiveDay': lastActiveDay,
        'streakFreezes': streakFreezes,
        'streakGoalDays': streakGoalDays,
        'goalDaysDone': goalDaysDone,
        'goalCelebrated': goalCelebrated,
        'missNoticeDate': missNoticeDate,
        'dailyGoal': dailyGoal,
        'xpToday': xpToday,
        'xpTodayDate': xpTodayDate,
        'weeklyXp': weeklyXp,
        'weekKey': weekKey,
        'goalRewardDate': goalRewardDate,
        'bonusRewardDate': bonusRewardDate,
        'boostUntil': boostUntil,
        'totalLessonsDone': totalLessonsDone,
        'totalAnswers': totalAnswers,
        'correctAnswers': correctAnswers,
        'bestTimeChallenge': bestTimeChallenge,
        'bestMemoryMoves': bestMemoryMoves,
        'hadPerfectLesson': hadPerfectLesson,
        'completedLessons':
            completedLessons.map((k, v) => MapEntry(k, v.toList())),
        'masteredWords':
            masteredWords.map((k, v) => MapEntry(k, v.toList())),
        'unlockedAchievements': unlockedAchievements.toList(),
        'coursesTried': coursesTried.toList(),
        'dailyXp': dailyXp,
        'savedAt': savedAt,
      };

  /// [touch] memajukan [savedAt] — false hanya saat menerapkan data
  /// server agar stempel waktunya ikut persis (untuk pencocokan).
  void _save({bool touch = true}) {
    if (touch) savedAt = DateTime.now().millisecondsSinceEpoch;
    _prefs.setString(_key, jsonEncode(_toMap()));
  }

  /// Seluruh progres sebagai JSON — payload sinkronisasi ke Firestore.
  String exportCloudJson() => jsonEncode(_toMap());

  /// Cocokkan progres server dengan lokal saat login/restore:
  /// - stempel waktu sama → [CloudMerge.identical];
  /// - lokal masih segar (belum ada XP/pelajaran — install baru atau
  ///   habis ganti akun) ATAU server lebih baru → server dipakai;
  /// - selain itu lokal menang dan perlu di-push.
  CloudMerge reconcileCloudJson(String raw) {
    Map<String, dynamic> m;
    try {
      m = jsonDecode(raw) as Map<String, dynamic>;
    } catch (_) {
      return CloudMerge.localWins; // data server korup — timpa
    }
    final cloudSavedAt = (m['savedAt'] as num?)?.toInt() ?? 0;
    if (cloudSavedAt == savedAt) return CloudMerge.identical;
    final localFresh = xp == 0 && totalLessonsDone == 0;
    if (!localFresh && cloudSavedAt < savedAt) return CloudMerge.localWins;
    _applyMap(m);
    _save(touch: false);
    notifyListeners();
    return CloudMerge.applied;
  }
}
