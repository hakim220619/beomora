import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_strings.dart';
import '../providers/auth_provider.dart';
import '../providers/progress_provider.dart';
import '../services/leaderboard_service.dart';
import '../theme.dart';
import '../widgets/study/study_background.dart';

class _Entry {
  final String name;
  final String? photoUrl;
  final int xp;
  final bool isUser;
  const _Entry(this.name, this.photoUrl, this.xp, {this.isUser = false});
}

/// Papan Juara: podium kelas untuk 3 besar + daftar pelajar lain.
/// Data diambil dari pengguna sungguhan di Firestore (XP minggu
/// berjalan), di-cache 5 menit; tarik ke bawah untuk menyegarkan.
class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  List<LeaderEntry>? _server;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load({bool force = false}) async {
    final entries = await LeaderboardService.fetch(force: force);
    if (mounted) setState(() => _server = entries);
  }

  /// Gabungkan hasil server dengan diri sendiri: baris pengguna selalu
  /// tampil, memakai XP mingguan lokal (paling mutakhir).
  List<_Entry> _compose(BuildContext context, L l) {
    final progress = context.watch<ProgressProvider>();
    final auth = context.watch<AuthProvider>();
    final week = ProgressProvider.weekOf(DateTime.now());
    final myWeeklyXp = progress.weekKey == week ? progress.weeklyXp : 0;
    final myUid = auth.uid;
    final myName = auth.signedIn
        ? '${auth.firstName} ${l.t('you')}'
        : l.t('you');

    final entries = <_Entry>[
      for (final e in _server ?? const <LeaderEntry>[])
        if (e.uid != myUid) _Entry(e.name, e.photoUrl, e.weeklyXp),
      _Entry(myName, auth.photoUrl, myWeeklyXp, isUser: true),
    ]..sort((a, b) => b.xp.compareTo(a.xp));
    return entries;
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final loading = _server == null;
    final entries = loading ? const <_Entry>[] : _compose(context, l);
    final top3 = entries.take(3).toList();
    final rest = entries.skip(3).toList();

    return StudyScaffold(
      appBar: AppBar(title: Text(l.t('leaderboard_title'))),
      body: RefreshIndicator(
        onRefresh: () => _load(force: true),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
          children: [
            Text(
              l.t('leaderboard_info'),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: isDark ? Colors.white70 : DuoColors.eel),
            ),
            const SizedBox(height: 16),
            if (loading)
              const Padding(
                padding: EdgeInsets.only(top: 80),
                child: Center(
                  child: CircularProgressIndicator(strokeWidth: 2.5),
                ),
              )
            else ...[
              // Podium dermaga: urutan 2-1-3.
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (top3.length > 1)
                    Expanded(
                        child: _PodiumColumn(
                            entry: top3[1],
                            rank: 2,
                            height: 86,
                            l: l)),
                  if (top3.isNotEmpty)
                    Expanded(
                        child: _PodiumColumn(
                            entry: top3[0],
                            rank: 1,
                            height: 116,
                            l: l)),
                  if (top3.length > 2)
                    Expanded(
                        child: _PodiumColumn(
                            entry: top3[2],
                            rank: 3,
                            height: 66,
                            l: l)),
                ],
              ),
              const SizedBox(height: 18),
              for (var i = 0; i < rest.length; i++)
                _RowTile(entry: rest[i], rank: i + 4, l: l),
              if (entries.length == 1) ...[
                const SizedBox(height: 24),
                Text(
                  l.t('leaderboard_alone'),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Theme.of(context).hintColor),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}

/// Avatar pelajar: foto akun Google kalau ada, selain itu si burung
/// hantu Beomora.
class _Avatar extends StatelessWidget {
  final String? photoUrl;
  final double size;
  const _Avatar({required this.photoUrl, required this.size});

  @override
  Widget build(BuildContext context) {
    final fallback = Text('🦉', style: TextStyle(fontSize: size * 0.6));
    if (photoUrl == null) return fallback;
    return ClipOval(
      child: Image.network(
        photoUrl!,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => fallback,
      ),
    );
  }
}

class _PodiumColumn extends StatelessWidget {
  final _Entry entry;
  final int rank;
  final double height;
  final L l;

  const _PodiumColumn({
    required this.entry,
    required this.rank,
    required this.height,
    required this.l,
  });

  @override
  Widget build(BuildContext context) {
    final medal = switch (rank) { 1 => '🥇', 2 => '🥈', _ => '🥉' };
    final ringColor = switch (rank) {
      1 => DuoColors.yellow,
      2 => const Color(0xFFC0CDD6),
      _ => const Color(0xFFCD8A54),
    };

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Text(medal, style: const TextStyle(fontSize: 22)),
          const SizedBox(height: 4),
          // Avatar dalam lencana juara
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.25),
              border: Border.all(color: ringColor, width: 4),
              boxShadow: [
                BoxShadow(
                  color: ringColor.withValues(alpha: 0.5),
                  blurRadius: 12,
                ),
              ],
            ),
            alignment: Alignment.center,
            child: _Avatar(photoUrl: entry.photoUrl, size: 50),
          ),
          const SizedBox(height: 6),
          Text(
            entry.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 13,
              color: entry.isUser
                  ? DuoColors.green
                  : (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : DuoColors.eel),
            ),
          ),
          Text(
            '${entry.xp} ${l.t('xp')}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: DuoColors.orange,
            ),
          ),
          const SizedBox(height: 6),
          // Panggung podium kayu kelas
          Container(
            height: height,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [StudyColors.wood, StudyColors.woodDark],
              ),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              border:
                  Border.all(color: const Color(0xFF4E2F1A), width: 2),
            ),
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              '$rank',
              style: const TextStyle(
                color: Color(0xFFFFF1DC),
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RowTile extends StatelessWidget {
  final _Entry entry;
  final int rank;
  final L l;

  const _RowTile(
      {required this.entry, required this.rank, required this.l});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: entry.isUser
            ? DuoColors.green.withValues(alpha: 0.18)
            : (isDark
                ? Colors.white.withValues(alpha: 0.08)
                : Colors.white.withValues(alpha: 0.72)),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: entry.isUser
              ? DuoColors.green
              : (isDark ? const Color(0x40FFFFFF) : Colors.white),
          width: entry.isUser ? 2 : 1.5,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 30,
            child: Text(
              '$rank',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
          _Avatar(photoUrl: entry.photoUrl, size: 30),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              entry.name,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: entry.isUser ? DuoColors.green : null,
              ),
            ),
          ),
          Text(
            '${entry.xp} ${l.t('xp')}',
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              color: DuoColors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
