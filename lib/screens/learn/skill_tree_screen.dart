import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../providers/progress_provider.dart';
import '../../services/ad_service.dart';
import '../../theme.dart';
import '../../widgets/duo_button.dart';
import '../../widgets/duo_dialog.dart';
import '../../widgets/study/pencil_progress_bar.dart';
import '../../widgets/stat_bar.dart';
import '../lesson/lesson_screen.dart';
import '../premium_screen.dart';

Color hexColor(String hex) =>
    Color(int.parse(hex.replaceFirst('#', '0xFF')));

const _kNodeItemHeight = 140.0;
// Pola posisi horizontal buku (fraksi lebar) — jalur belajar zig-zag.
const _kFractions = [0.5, 0.25, 0.5, 0.75];

/// Jalur belajar: tiap pelajaran adalah buku, dihubungkan garis
/// pensil putus-putus; pensil ✏️ menandai posisi belajar saat ini.
/// Saat dibuka, daftar otomatis menggulir ke pelajaran aktif.
class SkillTreeScreen extends StatefulWidget {
  const SkillTreeScreen({super.key});

  @override
  State<SkillTreeScreen> createState() => _SkillTreeScreenState();
}

class _SkillTreeScreenState extends State<SkillTreeScreen> {
  final _scroll = ScrollController();

  // Perkiraan tinggi papan kayu judul unit (padding + isi + border).
  static const _kUnitHeaderHeight = 100.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _scrollToCurrent());
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  /// Gulir ke pelajaran yang sedang dikerjakan (sekali, saat layar
  /// pertama tampil) — hanya kalau sudah ada progres.
  void _scrollToCurrent() {
    if (!mounted || !_scroll.hasClients) return;
    final progress = context.read<ProgressProvider>();
    final courses = context.read<List<Course>>();
    final course = courses.firstWhere(
      (c) => c.id == progress.activeCourseId,
      orElse: () => courses.first,
    );
    final allLessons = course.allLessons;
    var current = allLessons.indexWhere(
        (les) => !progress.isLessonCompleted(course.id, les.id));
    if (current == -1) current = allLessons.length - 1;
    if (current <= 0) return;

    var offset = 0.0;
    var found = false;
    for (final unit in course.units) {
      final idxInUnit = unit.lessons.indexOf(allLessons[current]);
      if (idxInUnit != -1) {
        offset += _kUnitHeaderHeight + idxInUnit * _kNodeItemHeight;
        found = true;
        break;
      }
      offset +=
          _kUnitHeaderHeight + unit.lessons.length * _kNodeItemHeight;
    }
    if (!found) return;
    // Sisakan ruang atas supaya node aktif tampil di tengah layar.
    offset -= 170;
    if (offset <= 0) return;
    _scroll.animateTo(
      offset.clamp(0.0, _scroll.position.maxScrollExtent),
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final progress = context.watch<ProgressProvider>();
    final courses = context.read<List<Course>>();
    final course = courses.firstWhere(
      (c) => c.id == progress.activeCourseId,
      orElse: () => courses.first,
    );

    final allLessons = course.allLessons;
    var currentIndex = allLessons
        .indexWhere((les) => !progress.isLessonCompleted(course.id, les.id));
    if (currentIndex == -1) currentIndex = allLessons.length;

    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Tahapan target harian: menuju target → klaim hadiah → target
    // bonus 2x → klaim bonus → selesai untuk hari ini.
    final xpNow = progress.xpTodayLive;
    final goalReached = progress.dailyGoalReached;
    final bonusInProgress =
        progress.bonusGoalActive && !progress.canClaimBonusReward;
    final barTarget =
        progress.bonusGoalActive ? progress.bonusGoal : progress.dailyGoal;
    final barColor = !goalReached
        ? DuoColors.green
        : bonusInProgress
            ? DuoColors.blue
            : DuoColors.yellow;
    // Setelah target tercapai, "77/10" diganti tanda selesai.
    final xpLabel = !goalReached
        ? '$xpNow/${progress.dailyGoal} XP'
        : bonusInProgress
            ? '$xpNow/${progress.bonusGoal} XP'
            : '✓ $xpNow XP';

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          const StatBar(),
          // Target harian sebagai "tangki air" berombak.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Text('🎯', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                Expanded(
                  child: PencilProgressBar(
                    value: xpNow / barTarget,
                    height: 14,
                    color: barColor,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  xpLabel,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: isDark ? StudyColors.chalk : DuoColors.eel,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: ListView(
              controller: _scroll,
              padding: const EdgeInsets.only(bottom: 110),
              children: [
                if (progress.canClaimGoalReward)
                  _GoalBanner(
                    text: l.t('daily_goal_reached'),
                    buttonLabel:
                        '${l.t('claim')} +${ProgressProvider.goalRewardGems} 💎',
                    onClaim: () => _claimReward(context, bonus: false),
                  )
                else if (progress.canClaimBonusReward)
                  _GoalBanner(
                    text: l.t('bonus_goal_reached'),
                    buttonLabel:
                        '${l.t('claim')} +${ProgressProvider.bonusRewardGems} 💎',
                    onClaim: () => _claimReward(context, bonus: true),
                  )
                else if (bonusInProgress)
                  _GoalBanner(
                    text: l
                        .t('bonus_goal_hint')
                        .replaceFirst('{xp}', '${progress.bonusGoal}')
                        .replaceFirst('{gems}',
                            '${ProgressProvider.bonusRewardGems}'),
                  )
                else if (progress.bonusRewardClaimed)
                  _GoalBanner(text: l.t('daily_all_done')),
                for (final unit in course.units)
                  _UnitSection(
                    course: course,
                    unit: unit,
                    allLessons: allLessons,
                    currentIndex: currentIndex,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _claimReward(BuildContext context,
      {required bool bonus}) async {
    final progress = context.read<ProgressProvider>();
    final l = L.read(context);
    final got =
        bonus ? progress.claimBonusReward() : progress.claimGoalReward();
    if (got == 0) return;
    if (!context.mounted) return;
    await showDuoDialog<void>(
      context,
      emoji: '🎁',
      color: DuoColors.yellow,
      title: '+$got 💎',
      message: l.t('gems_added'),
      actions: [DuoDialogAction(label: l.t('ok'), primary: true)],
    );
  }
}

/// Banner target harian: pengumuman pasif, atau tombol klaim hadiah
/// bila [buttonLabel] & [onClaim] diisi.
class _GoalBanner extends StatelessWidget {
  final String text;
  final String? buttonLabel;
  final VoidCallback? onClaim;

  const _GoalBanner({required this.text, this.buttonLabel, this.onClaim});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: GestureDetector(
        onTap: onClaim,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            // Tema gelap: alas gelap pekat (bukan kuning transparan
            // yang melebur jadi olive) supaya teks kuning menonjol.
            color: isDark
                ? Colors.black.withValues(alpha: 0.35)
                : DuoColors.yellow.withValues(alpha: 0.25),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: DuoColors.yellow, width: 1.5),
          ),
          child: Column(
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: isDark
                      ? const Color(0xFFFFD54F)
                      : const Color(0xFF8A6100),
                ),
              ),
              if (buttonLabel != null) ...[
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18, vertical: 7),
                  decoration: BoxDecoration(
                    color: DuoColors.yellow,
                    borderRadius: BorderRadius.circular(999),
                    boxShadow: [
                      BoxShadow(
                        color: DuoColors.yellow.withValues(alpha: 0.45),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Text(
                    buttonLabel!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF5B4300),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _UnitSection extends StatelessWidget {
  final Course course;
  final CourseUnit unit;
  final List<Lesson> allLessons;
  final int currentIndex;

  const _UnitSection({
    required this.course,
    required this.unit,
    required this.allLessons,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final color = hexColor(unit.color);

    return Column(
      children: [
        // Papan kayu penanda unit, sedikit miring seperti buatan tangan.
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 22, 20, 10),
          child: Transform.rotate(
            angle: -0.012,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [StudyColors.wood, StudyColors.woodDark],
                ),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                    color: const Color(0xFF4E2F1A), width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    offset: const Offset(0, 5),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Text(unit.icon, style: const TextStyle(fontSize: 30)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      unit.title[l.code] ?? '',
                      style: const TextStyle(
                        color: Color(0xFFFFF1DC),
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                  // Paku papan
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _nail(),
                      const SizedBox(height: 14),
                      _nail(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            final w = constraints.maxWidth;
            final centers = <Offset>[
              for (var i = 0; i < unit.lessons.length; i++)
                Offset(
                  _fractionFor(allLessons.indexOf(unit.lessons[i])) * w,
                  i * _kNodeItemHeight + 50,
                ),
            ];
            return SizedBox(
              height: unit.lessons.length * _kNodeItemHeight,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _RoutePainter(
                        centers: centers,
                        color: Theme.of(context).brightness ==
                                Brightness.dark
                            ? StudyColors.chalk.withValues(alpha: 0.5)
                            : StudyColors.pencil.withValues(alpha: 0.6),
                      ),
                    ),
                  ),
                  for (var i = 0; i < unit.lessons.length; i++)
                    Positioned(
                      left: centers[i].dx - 60,
                      top: i * _kNodeItemHeight,
                      width: 120,
                      child: _IslandNode(
                        course: course,
                        lesson: unit.lessons[i],
                        color: color,
                        globalIndex: allLessons.indexOf(unit.lessons[i]),
                        currentIndex: currentIndex,
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  double _fractionFor(int globalIndex) =>
      _kFractions[globalIndex % _kFractions.length];

  Widget _nail() => Container(
        width: 7,
        height: 7,
        decoration: const BoxDecoration(
          color: Color(0xFF3B2313),
          shape: BoxShape.circle,
        ),
      );
}

/// Garis jalur belajar putus-putus, seperti goresan pensil di kertas
/// (atau kapur di papan tulis saat mode gelap).
class _RoutePainter extends CustomPainter {
  final List<Offset> centers;
  final Color color;

  _RoutePainter({required this.centers, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (centers.length < 2) return;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round
      ..color = color;

    for (var i = 0; i < centers.length - 1; i++) {
      final a = centers[i];
      final b = centers[i + 1];
      final curl = (i.isEven ? 1 : -1) * 34.0;
      final path = Path()
        ..moveTo(a.dx, a.dy + 34)
        ..quadraticBezierTo(
          (a.dx + b.dx) / 2 + curl,
          (a.dy + b.dy) / 2,
          b.dx,
          b.dy - 40,
        );
      _drawDashed(canvas, path, paint);
    }
  }

  void _drawDashed(Canvas canvas, Path path, Paint paint) {
    for (final metric in path.computeMetrics()) {
      var dist = 0.0;
      while (dist < metric.length) {
        final len = min(9.0, metric.length - dist);
        canvas.drawPath(metric.extractPath(dist, dist + len), paint);
        dist += 18;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _RoutePainter old) =>
      old.centers != centers || old.color != color;
}

class _IslandNode extends StatelessWidget {
  final Course course;
  final Lesson lesson;
  final Color color;
  final int globalIndex;
  final int currentIndex;

  const _IslandNode({
    required this.course,
    required this.lesson,
    required this.color,
    required this.globalIndex,
    required this.currentIndex,
  });

  bool get _completed => globalIndex < currentIndex;
  bool get _isCurrent => globalIndex == currentIndex;
  bool get _locked => globalIndex > currentIndex;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final List<Color> discColors;
    final Color glow;
    if (_completed) {
      discColors = const [Color(0xFFFFE082), Color(0xFFE0A22E)];
      glow = DuoColors.yellow.withValues(alpha: 0.5);
    } else if (_isCurrent) {
      discColors = const [Color(0xFF3BE3C0), Color(0xFF00997F)];
      glow = DuoColors.green.withValues(alpha: 0.55);
    } else {
      discColors = const [Color(0xFF7E96A6), Color(0xFF54707F)];
      glow = Colors.transparent;
    }

    final disc = Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: discColors,
        ),
        border: Border.all(
          color: Colors.white.withValues(alpha: _locked ? 0.35 : 0.8),
          width: 2.5,
        ),
        boxShadow: [
          if (!_locked) BoxShadow(color: glow, blurRadius: 18),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            offset: const Offset(0, 5),
            blurRadius: 6,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Opacity(
        opacity: _locked ? 0.55 : 1,
        child: Text(
          _locked ? '📓' : (_completed ? '📕' : '📖'),
          style: const TextStyle(fontSize: 32),
        ),
      ),
    );

    return GestureDetector(
      onTap: () {
        if (_locked) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(l.t('locked'))));
          return;
        }
        _showLessonSheet(context);
      },
      child: Column(
        children: [
          SizedBox(
            width: 104,
            height: 96,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // Alas sorot di bawah buku
                Positioned(
                  bottom: 4,
                  child: Container(
                    width: 88,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(44),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.35),
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                if (_isCurrent)
                  _Bobbing(
                    builder: (bob) => Transform.scale(
                      scale: 1 + bob * 0.10,
                      child: Container(
                        width: 86,
                        height: 86,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: DuoColors.green
                                .withValues(alpha: 0.6 - bob * 0.35),
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                Positioned(bottom: 12, child: disc),
                // Lencana status
                if (_completed)
                  Positioned(
                    bottom: 10,
                    right: 16,
                    child: _badge(const Icon(Icons.check_rounded,
                        size: 14, color: Colors.white)),
                  ),
                if (_locked)
                  Positioned(
                    bottom: 10,
                    right: 16,
                    child: _badge(const Icon(Icons.lock_rounded,
                        size: 12, color: Colors.white70)),
                  ),
                // Pensil menandai pelajaran yang sedang dikerjakan
                if (_isCurrent)
                  Positioned(
                    left: 0,
                    top: 0,
                    child: _Bobbing(
                      builder: (bob) => Transform.translate(
                        offset: Offset(0, bob * 5),
                        child: Transform.rotate(
                          angle: (bob - 0.5) * 0.16,
                          child: const Text('✏️',
                              style: TextStyle(fontSize: 26)),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.35)
                  : Colors.white.withValues(alpha: 0.65),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              lesson.title[l.code] ?? '',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w700,
                color: _locked
                    ? (isDark ? Colors.white60 : DuoColors.gray)
                    : (isDark ? Colors.white : DuoColors.eel),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _badge(Widget child) => Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: _completed ? DuoColors.greenDark : Colors.black45,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white70, width: 1.5),
        ),
        alignment: Alignment.center,
        child: child,
      );

  void _showLessonSheet(BuildContext context) {
    final l = L.read(context);
    final progress = context.read<ProgressProvider>();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => Container(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 28),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? const [Color(0xFF1C4434), Color(0xFF0F2A20)]
                : const [Colors.white, Color(0xFFF7F1DE)],
          ),
          borderRadius:
              const BorderRadius.vertical(top: Radius.circular(28)),
          border: Border.all(
            color: isDark ? const Color(0x40FFFFFF) : Colors.white,
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 44,
                height: 5,
                decoration: BoxDecoration(
                  color: isDark ? Colors.white24 : Colors.black12,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(height: 14),
            const Center(
                child: Text('📖', style: TextStyle(fontSize: 44))),
            const SizedBox(height: 8),
            Text(
              lesson.title[l.code] ?? '',
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 21, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 6),
            Text(
              '${lesson.words.length} ${l.t('words_learned').toLowerCase()} · +${_completed ? 5 : 10} XP',
              textAlign: TextAlign.center,
              style: TextStyle(color: Theme.of(context).hintColor),
            ),
            const SizedBox(height: 20),
            DuoButton(
              label:
                  _completed ? l.t('review_lesson') : l.t('start_lesson'),
              color: _completed ? DuoColors.yellow : color,
              textColor: _completed ? const Color(0xFF6B4E00) : Colors.white,
              onPressed: () {
                Navigator.of(sheetContext).pop();
                if (progress.hearts <= 0) {
                  _showNoHeartsDialog(context);
                  return;
                }
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) =>
                        LessonScreen(course: course, lesson: lesson),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showNoHeartsDialog(BuildContext context) async {
    final l = L.read(context);
    final progress = context.read<ProgressProvider>();
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final choice = await showDuoDialog<String>(
      context,
      emoji: '💔',
      color: DuoColors.red,
      title: l.t('no_hearts_title'),
      message: l.t('no_hearts_msg'),
      actions: [
        if (AdService.supported)
          DuoDialogAction(
              label: l.t('watch_ad_heart'), value: 'ad', primary: true),
        DuoDialogAction(
            label: l.t('premium_cta'),
            value: 'premium',
            color: DuoColors.purple),
        DuoDialogAction(
            label: l.t('ok'),
            value: 'ok',
            primary: !AdService.supported),
      ],
    );
    switch (choice) {
      case 'ad':
        final shown = await AdService.showRewarded(
            onReward: () => progress.restoreHeart());
        messenger
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content:
                Text(l.t(shown ? 'ad_reward_heart' : 'ad_not_ready')),
          ));
      case 'premium':
        await navigator.push(MaterialPageRoute(
            builder: (_) => const PremiumScreen()));
    }
  }
}

/// Animasi apung sederhana yang bisa dipakai ulang (kapal, cincin pulsa).
class _Bobbing extends StatefulWidget {
  final Widget Function(double t) builder;
  const _Bobbing({required this.builder});

  @override
  State<_Bobbing> createState() => _BobbingState();
}

class _BobbingState extends State<_Bobbing>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1600),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _ctrl,
        builder: (_, _) => widget.builder(
            Curves.easeInOut.transform(_ctrl.value)),
      );
}
