import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/listening_bank.dart';
import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../models/listening.dart';
import '../../providers/progress_provider.dart';
import '../../theme.dart';
import '../../widgets/study/study_background.dart';
import 'listening_screen.dart';

/// Pemilih paket "Latihan Dengar": Dasar/TOEFL/IELTS/PTE (Inggris) atau
/// Choukai N5/N4 (Jepang). Pengguna gratis hanya bisa membuka
/// [kFreeListeningPassages] bacaan pertama di setiap paket (ditandai
/// mahkota); Premium membuka semua.
class ListeningPackScreen extends StatelessWidget {
  final Course course;

  const ListeningPackScreen({super.key, required this.course});

  static const _accent = [
    DuoColors.green,
    DuoColors.blue,
    DuoColors.orange,
    DuoColors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final premium = context.watch<ProgressProvider>().premiumActive;
    final packs = listeningPacksFor(course.id);

    return StudyScaffold(
      appBar: AppBar(title: Text(l.t('listening_title'))),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          Text(
            l.t('listening_pick_pack'),
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).hintColor),
          ),
          const SizedBox(height: 14),
          for (var i = 0; i < packs.length; i++)
            _PackCard(
              pack: packs[i],
              color: _accent[i % _accent.length],
              premium: premium,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) =>
                      ListeningScreen(course: course, pack: packs[i]),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _PackCard extends StatelessWidget {
  final ListeningPack pack;
  final Color color;
  final bool premium;
  final VoidCallback onTap;

  const _PackCard({
    required this.pack,
    required this.color,
    required this.premium,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final total = pack.passages.length;
    final capped = !premium;
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: color.withValues(alpha: 0.6),
                    width: 1.5,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(pack.emoji, style: const TextStyle(fontSize: 26)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            pack.title[l.code] ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: color.withValues(alpha: 0.16),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            capped
                                ? '$kFreeListeningPassages / $total'
                                : '$total',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                              color: color,
                            ),
                          ),
                        ),
                        if (capped) ...[
                          const SizedBox(width: 4),
                          const Text('👑', style: TextStyle(fontSize: 13)),
                        ],
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${pack.subtitle[l.code] ?? ''} · '
                      '${pack.maxPlays == 0 || premium ? l.t('listening_unlimited') : '${pack.maxPlays}x ${l.t('listening_plays_per_passage')}'}',
                      style: TextStyle(
                        fontSize: 12.5,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: Theme.of(context).hintColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
