import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_strings.dart';
import '../models/course.dart';
import '../providers/progress_provider.dart';
import '../providers/settings_provider.dart';
import '../theme.dart';
import '../widgets/beomora_logo.dart';
import '../widgets/choice_card.dart';
import '../widgets/duo_button.dart';
import '../widgets/study/study_background.dart';
import '../widgets/study/pencil_progress_bar.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _step = 0;
  String? _courseId;
  int _goal = 20;

  static const _goals = [
    (10, 'goal_casual'),
    (20, 'goal_regular'),
    (30, 'goal_serious'),
    (50, 'goal_intense'),
  ];

  bool get _canContinue {
    if (_step == 1) return _courseId != null;
    return true;
  }

  void _next() {
    if (_step < 2) {
      setState(() => _step++);
      return;
    }
    final settings = context.read<SettingsProvider>();
    final progress = context.read<ProgressProvider>();
    progress.setActiveCourse(_courseId!);
    progress.setDailyGoal(_goal);
    // Cukup tandai selesai — gerbang di main.dart yang menentukan
    // layar berikutnya (wajib login dulu sebelum menu utama).
    settings.setOnboarded();
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return StudyScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PencilProgressBar(
                value: (_step + 1) / 3,
                height: 14,
                color: DuoColors.green,
                showPencil: true,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: switch (_step) {
                  0 => _buildLangStep(l),
                  1 => _buildCourseStep(l),
                  _ => _buildGoalStep(l),
                },
              ),
              DuoButton(
                label: _step < 2 ? l.t('continue_btn') : l.t('start_btn'),
                onPressed: _canContinue ? _next : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLangStep(L l) {
    final settings = context.watch<SettingsProvider>();
    return ListView(
      children: [
        const Center(child: BeomoraLogo(size: 88)),
        const SizedBox(height: 12),
        Text(
          l.t('onb_welcome_title'),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 8),
        Text(
          l.t('onb_welcome_sub'),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Theme.of(context).hintColor),
        ),
        const SizedBox(height: 32),
        Text(
          l.t('onb_ui_lang'),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        ChoiceCard(
          label: '🇮🇩  Bahasa Indonesia',
          state: settings.uiLang == 'id'
              ? ChoiceState.selected
              : ChoiceState.idle,
          onTap: () => settings.setUiLang('id'),
        ),
        const SizedBox(height: 12),
        ChoiceCard(
          label: '🇬🇧  English',
          state: settings.uiLang == 'en'
              ? ChoiceState.selected
              : ChoiceState.idle,
          onTap: () => settings.setUiLang('en'),
        ),
      ],
    );
  }

  Widget _buildCourseStep(L l) {
    final courses = context.read<List<Course>>();
    return ListView(
      children: [
        Text(
          l.t('onb_pick_course'),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 24),
        for (final course in courses) ...[
          ChoiceCard(
            label: '${course.flag}  ${course.name[l.code] ?? ''}',
            state: _courseId == course.id
                ? ChoiceState.selected
                : ChoiceState.idle,
            onTap: () => setState(() => _courseId = course.id),
          ),
          const SizedBox(height: 12),
        ],
      ],
    );
  }

  Widget _buildGoalStep(L l) {
    return ListView(
      children: [
        Text(
          l.t('onb_daily_goal'),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 24),
        for (final (xp, key) in _goals) ...[
          ChoiceCard(
            label: '${l.t(key)} — $xp ${l.t('xp_per_day')}',
            state: _goal == xp ? ChoiceState.selected : ChoiceState.idle,
            onTap: () => setState(() => _goal = xp),
          ),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}
