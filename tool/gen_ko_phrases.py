#!/usr/bin/env python3
"""Generator ungkapan Korea -> lib/data/ko_phrases.dart

Sumber (format GROUPS, lihat tool/check_ko_phrases.py):
- ko_phrases_daily1.py + ko_phrases_daily2.py — ungkapan sehari-hari;
- ko_phrases_work.py      — ungkapan kerja, pabrik & EPS;
- ko_phrases_onomatope.py — onomatope (의성어·의태어) & tanggapan obrolan;
- ko_phrases_idiom.py     — idiom (관용어) & peribahasa (속담).
Contoh kalimat: tool/vocab_examples/ko_09.py … ko_13.py (dibangkitkan
tool/gen_vocab_examples.py).

Jalankan: python3 tool/gen_ko_phrases.py
"""
import runpy
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent

LISTS = [
    ('koPhraseVocab', 'Ungkapan sehari-hari yang paling sering dipakai',
     ['ko_phrases_daily1.py', 'ko_phrases_daily2.py']),
    ('koWorkVocab', 'Ungkapan kerja, pabrik & EPS', ['ko_phrases_work.py']),
    ('koOnomatopeVocab', 'Onomatope (의성어·의태어) & tanggapan obrolan',
     ['ko_phrases_onomatope.py']),
    ('koIdiomVocab', 'Idiom (관용어) & peribahasa (속담) populer',
     ['ko_phrases_idiom.py']),
]

check = subprocess.run([sys.executable, str(HERE / 'check_ko_phrases.py')],
                       capture_output=True, text=True)
if check.returncode != 0:
    sys.exit(check.stdout + check.stderr)


def esc(s):
    return s.replace('\\', '\\\\').replace("'", "\\'").replace('$', '\\$')


out = [
    '// Ungkapan Korea (sehari-hari, kerja & EPS, onomatope, idiom &',
    '// peribahasa) untuk halaman Materi. DIBUAT OTOMATIS oleh',
    '// tool/gen_ko_phrases.py; jangan edit manual. Memakai JVocab:',
    '// `kana` = Hangul, `romaji` = romanisasi.',
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

(ROOT / 'lib/data/ko_phrases.dart').write_text('\n'.join(out), encoding='utf-8')
print('OK: ' + ' '.join(counts))
