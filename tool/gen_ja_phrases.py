#!/usr/bin/env python3
"""Generator ungkapan Jepang -> lib/data/ja_phrases.dart

Sumber (format GROUPS = [(judul_id, judul_en, [(kana, romaji, arti_id,
arti_en), ...]), ...]):
- ja_phrases_daily1.py + ja_phrases_daily2.py — ungkapan sehari-hari;
- ja_phrases_aizuchi.py   — aizuchi & pengisi obrolan;
- ja_phrases_onomatope.py — onomatope (giongo/gitaigo);
- ja_phrases_work.py      — ungkapan kerja & keigo;
- ja_phrases_idiom.py     — idiom (慣用句) & peribahasa (ことわざ).
Contoh kalimat tiap entri ada di tool/vocab_examples/ja_07.py … ja_12.py
(dibangkitkan tool/gen_vocab_examples.py).

Validasi lengkap dulu: python3 tool/check_ja_phrases.py
Jalankan: python3 tool/gen_ja_phrases.py
"""
import runpy
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent

LISTS = [
    ('jaPhraseVocab', 'Ungkapan sehari-hari yang paling sering dipakai',
     ['ja_phrases_daily1.py', 'ja_phrases_daily2.py']),
    ('jaAizuchiVocab', 'Aizuchi (tanggapan saat mendengarkan) & pengisi obrolan',
     ['ja_phrases_aizuchi.py']),
    ('jaOnomatopeVocab', 'Onomatope (giongo/gitaigo) yang umum',
     ['ja_phrases_onomatope.py']),
    ('jaWorkVocab', 'Ungkapan kerja & keigo', ['ja_phrases_work.py']),
    ('jaIdiomVocab', 'Idiom (慣用句) & peribahasa (ことわざ) populer',
     ['ja_phrases_idiom.py']),
]

check = subprocess.run([sys.executable, str(HERE / 'check_ja_phrases.py')],
                       capture_output=True, text=True)
if check.returncode != 0:
    sys.exit(check.stdout + check.stderr)


def esc(s):
    return s.replace('\\', '\\\\').replace("'", "\\'").replace('$', '\\$')


out = [
    '// Ungkapan Jepang (sehari-hari, aizuchi, onomatope, kerja & keigo,',
    '// idiom & peribahasa) untuk halaman Materi. DIBUAT OTOMATIS oleh',
    '// tool/gen_ja_phrases.py; jangan edit manual.',
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

(ROOT / 'lib/data/ja_phrases.dart').write_text('\n'.join(out), encoding='utf-8')
print('OK: ' + ' '.join(counts))
