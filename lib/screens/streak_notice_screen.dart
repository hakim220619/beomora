import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

import '../l10n/app_strings.dart';
import '../theme.dart';
import '../widgets/duo_button.dart';
import '../widgets/study/pencil_progress_bar.dart';
import '../widgets/study/study_background.dart';
import 'settings_screen.dart';

/// Jenis pemberitahuan streak yang ditampilkan satu halaman penuh.
enum StreakNoticeKind {
  /// Pengguna bolos >1 hari: streak harian mungkin putus, tapi
  /// hitungan tantangan tetap lanjut.
  missed,

  /// Tantangan streak (10/30/50/90/120 hari) selesai — perayaan
  /// plus hadiah koin.
  goalDone,
}

/// Halaman penuh pemberitahuan streak: menggantikan dialog kecil agar
/// pesan "tantanganmu tidak hangus" / perayaan tantangan selesai
/// terasa seperti momen, bukan sekadar popup. Ditutup lewat tombol
/// (pop) — pemanggil boleh `await` push-nya.
class StreakNoticeScreen extends StatefulWidget {
  final StreakNoticeKind kind;
  final int goalDays;
  final int daysDone;
  final int gems;

  const StreakNoticeScreen.missed({
    super.key,
    required this.goalDays,
    required this.daysDone,
  })  : kind = StreakNoticeKind.missed,
        gems = 0;

  const StreakNoticeScreen.goalDone({
    super.key,
    required this.goalDays,
    required this.gems,
  })  : kind = StreakNoticeKind.goalDone,
        daysDone = goalDays;

  @override
  State<StreakNoticeScreen> createState() => _StreakNoticeScreenState();
}

class _StreakNoticeScreenState extends State<StreakNoticeScreen>
    with SingleTickerProviderStateMixin {
  late final ConfettiController _confetti =
      ConfettiController(duration: const Duration(seconds: 2));
  late final AnimationController _halo = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 6),
  )..repeat();

  bool get _celebrate => widget.kind == StreakNoticeKind.goalDone;
  Color get _color => _celebrate ? DuoColors.yellow : DuoColors.blue;

  @override
  void initState() {
    super.initState();
    if (_celebrate) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => _confetti.play());
    }
  }

  @override
  void dispose() {
    _confetti.dispose();
    _halo.dispose();
    super.dispose();
  }

  void _pickNextGoal() {
    // Tutup halaman ini dulu supaya `await` pemanggil selesai, lalu
    // buka Pengaturan di atas menu utama.
    final nav = Navigator.of(context);
    nav.pop();
    nav.push(MaterialPageRoute(builder: (_) => const SettingsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final hint = Theme.of(context).hintColor;
    final goal = widget.goalDays;
    final done = widget.daysDone.clamp(0, goal);

    final String title;
    final String message;
    if (_celebrate) {
      title = l.t('streak_goal_done_title').replaceFirst('{goal}', '$goal');
      message = l
          .t('streak_goal_done_msg')
          .replaceFirst('{goal}', '$goal')
          .replaceFirst('{gems}', '${widget.gems}');
    } else {
      title = l.t('miss_notice_title');
      message = l
          .t('miss_notice_msg')
          .replaceFirst('{done}', '$done')
          .replaceFirst('{goal}', '$goal');
    }

    return StudyScaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Spacer(),
                  // Emoji besar dengan halo berdenyut di belakangnya.
                  SizedBox(
                    width: 190,
                    height: 190,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedBuilder(
                          animation: _halo,
                          builder: (_, _) => CustomPaint(
                            size: const Size(190, 190),
                            painter: _HaloPainter(
                              color: _color,
                              t: _halo.value,
                              sparks: _celebrate,
                            ),
                          ),
                        ),
                        Text(
                          _celebrate ? '🏆' : '😴',
                          style: const TextStyle(fontSize: 76),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.5,
                      height: 1.5,
                      color: hint,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 28),
                  if (_celebrate)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _StatBox(
                          icon: '🔥',
                          value: '$goal',
                          label: l.t('streak_days_label'),
                          color: DuoColors.orange,
                        ),
                        const SizedBox(width: 12),
                        _StatBox(
                          icon: '🪙',
                          value: '+${widget.gems}',
                          label: l.t('gems'),
                          color: DuoColors.yellow,
                        ),
                      ],
                    )
                  else
                    _GoalProgressCard(
                      done: done,
                      goal: goal,
                      color: _color,
                    ),
                  const Spacer(),
                  DuoButton(
                    label: l.t(_celebrate
                        ? 'continue_btn'
                        : 'miss_notice_cta'),
                    color: _celebrate ? DuoColors.green : DuoColors.blue,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  if (_celebrate) ...[
                    const SizedBox(height: 10),
                    DuoButton(
                      label: l.t('streak_goal_pick_next'),
                      color: DuoColors.orange,
                      outlined: true,
                      onPressed: _pickNextGoal,
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (_celebrate)
            ConfettiWidget(
              confettiController: _confetti,
              blastDirection: pi / 2,
              blastDirectionality: BlastDirectionality.explosive,
              numberOfParticles: 30,
              emissionFrequency: 0.05,
              gravity: 0.25,
              colors: const [
                DuoColors.green,
                DuoColors.blue,
                DuoColors.yellow,
                DuoColors.orange,
                DuoColors.purple,
              ],
            ),
        ],
      ),
    );
  }
}

/// Kartu progres tantangan: "{done}/{goal} hari" dengan bar stabilo
/// dan sisa hari — menegaskan bahwa hitungan tidak hangus.
class _GoalProgressCard extends StatelessWidget {
  final int done;
  final int goal;
  final Color color;

  const _GoalProgressCard({
    required this.done,
    required this.goal,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hint = Theme.of(context).hintColor;
    final left = (goal - done).clamp(0, goal);
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.08)
            : Colors.white.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? StudyColors.chalk.withValues(alpha: 0.28)
              : const Color(0xFFE7E0C9),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.18),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '${l.t('streak_goal_setting')} 🔥',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: hint,
                  ),
                ),
              ),
              Text(
                '$done/$goal ${l.t('streak_days_label')}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          PencilProgressBar(
            value: goal == 0 ? 0 : done / goal,
            color: color,
            showPencil: true,
          ),
          const SizedBox(height: 8),
          Text(
            l.t('miss_notice_days_left').replaceFirst('{n}', '$left'),
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: hint,
            ),
          ),
        ],
      ),
    );
  }
}

/// Kotak angka kecil (hari tantangan / hadiah koin) untuk perayaan.
class _StatBox extends StatelessWidget {
  final String icon;
  final String value;
  final String label;
  final Color color;

  const _StatBox({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: isDark
            ? color.withValues(alpha: 0.20)
            : Colors.white.withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color, width: 2),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text('$icon $value',
              style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w900,
                  fontSize: 18)),
          Text(label,
              style: TextStyle(
                  color: color, fontSize: 11, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

/// Halo berdenyut di belakang emoji: tiga cincin yang mengembang dan
/// memudar bergantian; mode perayaan menambah percikan kecil yang
/// mengorbit.
class _HaloPainter extends CustomPainter {
  final Color color;
  final double t; // 0..1 berulang
  final bool sparks;

  _HaloPainter({required this.color, required this.t, required this.sparks});

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    final rMax = size.width / 2;

    // Inti lembut.
    canvas.drawCircle(
        c, rMax * 0.42, Paint()..color = color.withValues(alpha: 0.18));

    // Cincin mengembang.
    final ring = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2;
    for (var i = 0; i < 3; i++) {
      final phase = (t * 1.5 + i / 3) % 1; // 0..1 per cincin
      final r = rMax * (0.42 + 0.58 * phase);
      ring.color = color.withValues(alpha: (1 - phase) * 0.45);
      canvas.drawCircle(c, r, ring);
    }

    if (!sparks) return;
    // Percikan mengorbit dengan ukuran berkedip.
    final spark = Paint()..color = color;
    const count = 8;
    for (var i = 0; i < count; i++) {
      final a = t * 2 * pi + i * 2 * pi / count;
      final wobble = 0.72 + 0.08 * sin(t * 6 * pi + i);
      final p = Offset(c.dx + cos(a) * rMax * wobble,
          c.dy + sin(a) * rMax * wobble);
      final s = 2.0 + 1.6 * (0.5 + 0.5 * sin(t * 8 * pi + i * 1.3));
      spark.color = color.withValues(alpha: 0.55 + 0.35 * (s - 2) / 1.6);
      _star(canvas, p, s + 1.5, spark);
    }
  }

  void _star(Canvas canvas, Offset c, double r, Paint paint) {
    final path = Path();
    for (var i = 0; i < 8; i++) {
      final rad = i.isEven ? r : r * 0.45;
      final a = -pi / 2 + i * pi / 4;
      final p = Offset(c.dx + cos(a) * rad, c.dy + sin(a) * rad);
      i == 0 ? path.moveTo(p.dx, p.dy) : path.lineTo(p.dx, p.dy);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _HaloPainter old) =>
      old.t != t || old.color != color || old.sparks != sparks;
}
