import 'package:flutter/material.dart';

import '../data/ja_particles.dart';

/// Kalimat (dipisah spasi) dengan token partikel diwarnai sesuai
/// [kJaParticles]. Tanpa [marks] (atau tanpa partikel) = teks biasa.
class ParticleText extends StatelessWidget {
  final String text;
  final List<JaParticle?>? marks;
  final TextStyle style;

  const ParticleText(this.text, {super.key, this.marks, required this.style});

  @override
  Widget build(BuildContext context) {
    final m = marks;
    if (m == null || m.every((p) => p == null)) {
      return Text(text, style: style);
    }
    final tokens = text.split(' ');
    return Text.rich(
      TextSpan(
        style: style,
        children: [
          for (var i = 0; i < tokens.length; i++)
            TextSpan(
              text: i == tokens.length - 1 ? tokens[i] : '${tokens[i]} ',
              style: m[i] == null
                  ? null
                  : TextStyle(color: m[i]!.color, fontWeight: FontWeight.w900),
            ),
        ],
      ),
    );
  }
}

/// Penjelasan partikel yang muncul di [marks] (urut kemunculan):
/// "● は (wa) — penanda topik".
class ParticleLegend extends StatelessWidget {
  final List<JaParticle?> marks;
  final String uiLang;

  const ParticleLegend({super.key, required this.marks, required this.uiLang});

  @override
  Widget build(BuildContext context) {
    final hint = Theme.of(context).hintColor;
    final seen = <String>{};
    final list = [
      for (final m in marks)
        if (m != null && seen.add(m.kana)) m,
    ];
    if (list.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final p in list)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text.rich(
                TextSpan(
                  style: TextStyle(fontSize: 12.5, color: hint),
                  children: [
                    TextSpan(
                      text: '● ${p.kana} (${p.reading})',
                      style: TextStyle(
                        color: p.color,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextSpan(text: ' — ${p.desc[uiLang] ?? p.desc['id']}'),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
