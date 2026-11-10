#!/usr/bin/env python3
"""Generator ungkapan Jerman -> lib/data/de_phrases.dart

Sumber (format GROUPS, lihat tool/check_de_phrases.py):
- de_phrases_daily1.py + de_phrases_daily2.py — ungkapan sehari-hari;
- de_phrases_work.py      — ungkapan kerja, Ausbildung, Pflege & kantor;
- de_phrases_particles.py — partikel (doch, mal, halt…) & pengisi obrolan;
- de_phrases_idiom.py     — idiom (Redewendungen) & peribahasa.
Contoh kalimat: tool/vocab_examples/de_09.py … de_13.py.

Jalankan: python3 tool/gen_de_phrases.py
"""
import runpy
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent

LISTS = [
    ('dePhraseVocab', 'Ungkapan sehari-hari yang paling sering dipakai',
     ['de_phrases_daily1.py', 'de_phrases_daily2.py']),
    ('deWorkVocab', 'Ungkapan kerja, Ausbildung, Pflege & kantor',
     ['de_phrases_work.py']),
    ('deParticleVocab', 'Partikel (doch, mal, halt…) & pengisi obrolan',
     ['de_phrases_particles.py']),
    ('deIdiomVocab', 'Idiom (Redewendungen) & peribahasa populer',
     ['de_phrases_idiom.py']),
]

check = subprocess.run([sys.executable, str(HERE / 'check_de_phrases.py')],
                       capture_output=True, text=True)
if check.returncode != 0:
    sys.exit(check.stdout + check.stderr)


def esc(s):
    return s.replace('\\', '\\\\').replace("'", "\\'").replace('$', '\\$')


out = [
    '// Ungkapan Jerman (sehari-hari, kerja, partikel, idiom) untuk',
    '// halaman Materi. DIBUAT OTOMATIS oleh tool/gen_de_phrases.py;',
    '// jangan edit manual. Memakai JVocab: `kana` = ungkapan,',
    '// `romaji` = cara baca.',
    "import 'jlpt_vocab.dart';",
    '',
]
counts = []
for name, doc, files in LISTS:
    titles, rows = [], []
    for f in files:
        for tid, ten, items in runpy.run_path(str(HERE / f))['GROUPS']:
            titles.append((tid, ten))
            rows += [(r, len(titles) - 1) for r in items]
    out.append(f'/// Judul grup untuk [{name}].')
    out.append(f'const List<Map<String, String>> {name}Groups = [')
    for tid, ten in titles:
        out.append(f"  {{'id': '{esc(tid)}', 'en': '{esc(ten)}'}},")
    out.append('];')
    out.append('')
    out.append(f'/// {doc}.')
    out.append(f'const List<JVocab> {name} = [')
    for (kana, romaji, mid, men), g in rows:
        out.append(
            f"  JVocab('{esc(kana)}', '{esc(romaji)}', "
            f"{{'id': '{esc(mid)}', 'en': '{esc(men)}'}}, {g}),")
    out.append('];')
    out.append('')
    counts.append(f'{name}={len(rows)}')

(ROOT / 'lib/data/de_phrases.dart').write_text('\n'.join(out), encoding='utf-8')
print('OK: ' + ' '.join(counts))
