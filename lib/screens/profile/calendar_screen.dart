import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_strings.dart';
import '../../providers/progress_provider.dart';
import '../../theme.dart';
import '../../widgets/study/study_background.dart';

/// Kalender Belajar: hari mana saja aktif + visualisasi streak.
/// Sumber data: [ProgressProvider.dailyXp] (92 hari terakhir, ikut
/// tersinkron ke Firebase bersama progres lain).
class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late DateTime _month; // selalu tanggal 1

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _month = DateTime(now.year, now.month);
  }

  DateTime get _thisMonth {
    final now = DateTime.now();
    return DateTime(now.year, now.month);
  }

  /// Batas mundur: cukup untuk menampung jendela catatan 92 hari.
  DateTime get _oldestMonth {
    final oldest =
        DateTime.now().subtract(const Duration(days: ProgressProvider.dailyLogDays));
    return DateTime(oldest.year, oldest.month);
  }

  bool get _canBack => _month.isAfter(_oldestMonth);
  bool get _canForward => _month.isBefore(_thisMonth);

  void _shiftMonth(int delta) {
    setState(() => _month = DateTime(_month.year, _month.month + delta));
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final progress = context.watch<ProgressProvider>();
    final months = l.t('month_names').split(',');
    final weekdays = l.t('weekday_short').split(',');

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final daysInMonth = DateTime(_month.year, _month.month + 1, 0).day;
    final leadingBlanks = DateTime(_month.year, _month.month, 1).weekday - 1;
    var activeDays = 0;
    for (var d = 1; d <= daysInMonth; d++) {
      if (progress.xpOn(DateTime(_month.year, _month.month, d)) > 0) {
        activeDays++;
      }
    }

    return StudyScaffold(
      appBar: AppBar(title: Text(l.t('calendar_title'))),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
        children: [
          // Ringkasan streak
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 14),
              child: Row(
                children: [
                  _Summary(
                      emoji: '🔥',
                      value: '${progress.streak}',
                      label: l.t('streak_now')),
                  _Summary(
                      emoji: '🏔️',
                      value: '${progress.longestStreak}',
                      label: l.t('longest_streak')),
                  _Summary(
                      emoji: '📅',
                      value: '$activeDays',
                      label: l.t('active_days_month')),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          // Navigasi bulan
          Row(
            children: [
              IconButton(
                onPressed: _canBack ? () => _shiftMonth(-1) : null,
                icon: const Icon(Icons.chevron_left_rounded),
              ),
              Expanded(
                child: Text(
                  '${months[_month.month - 1]} ${_month.year}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w900),
                ),
              ),
              IconButton(
                onPressed: _canForward ? () => _shiftMonth(1) : null,
                icon: const Icon(Icons.chevron_right_rounded),
              ),
            ],
          ),
          const SizedBox(height: 6),
          // Nama hari (Senin dulu)
          Row(
            children: [
              for (final w in weekdays)
                Expanded(
                  child: Text(
                    w,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          // Petak tanggal
          GridView.count(
            crossAxisCount: 7,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            children: [
              for (var i = 0; i < leadingBlanks; i++)
                const SizedBox.shrink(),
              for (var d = 1; d <= daysInMonth; d++)
                _DayCell(
                  day: d,
                  date: DateTime(_month.year, _month.month, d),
                  today: today,
                  xp: progress.xpOn(
                      DateTime(_month.year, _month.month, d)),
                  goal: progress.dailyGoal,
                ),
            ],
          ),
          const SizedBox(height: 16),
          // Legenda
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 18,
            runSpacing: 6,
            children: [
              _LegendDot(
                  color: DuoColors.green,
                  label: l.t('cal_legend_goal')),
              _LegendDot(
                  color: DuoColors.green.withValues(alpha: 0.30),
                  label: l.t('cal_legend_active')),
            ],
          ),
        ],
      ),
    );
  }
}

class _Summary extends StatelessWidget {
  final String emoji;
  final String value;
  final String label;
  const _Summary(
      {required this.emoji, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text('$emoji $value',
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w900)),
          const SizedBox(height: 2),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 11, color: Theme.of(context).hintColor),
          ),
        ],
      ),
    );
  }
}

class _DayCell extends StatelessWidget {
  final int day;
  final DateTime date;
  final DateTime today;
  final int xp;
  final int goal;

  const _DayCell({
    required this.day,
    required this.date,
    required this.today,
    required this.xp,
    required this.goal,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isToday = date == today;
    final isFuture = date.isAfter(today);
    final goalMet = xp >= goal && xp > 0;
    final active = xp > 0;

    final Color bg;
    final Color fg;
    if (goalMet) {
      bg = DuoColors.green;
      fg = Colors.white;
    } else if (active) {
      bg = DuoColors.green.withValues(alpha: 0.30);
      fg = isDark ? Colors.white : DuoColors.greenDark;
    } else {
      bg = Colors.transparent;
      fg = isFuture
          ? Theme.of(context).hintColor.withValues(alpha: 0.4)
          : Theme.of(context).hintColor;
    }

    return Tooltip(
      message: active ? '$xp XP' : '',
      child: Container(
        decoration: BoxDecoration(
          color: bg,
          shape: BoxShape.circle,
          border: isToday
              ? Border.all(color: DuoColors.yellow, width: 2.5)
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          '$day',
          style: TextStyle(
            fontSize: 13,
            fontWeight:
                goalMet || isToday ? FontWeight.w900 : FontWeight.w600,
            color: fg,
          ),
        ),
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;
  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(label,
            style: TextStyle(
                fontSize: 12, color: Theme.of(context).hintColor)),
      ],
    );
  }
}
