#!/usr/bin/env python3
"""Generator kosakata inti Jerman -> lib/data/goethe_vocab.dart

Sumber: tool/de_vocab_01.py … de_vocab_08.py (format GROUPS, lihat
tool/check_de_vocab.py). Acuan: daftar kosakata Goethe-Institut A1/A2
(Goethe-Zertifikat A1/A2; dipakai untuk visa kerja/Ausbildung). Kata
benda selalu dengan artikel. Contoh kalimat: tool/vocab_examples/de_*.py
(dibangkitkan tool/gen_vocab_examples.py).

Jalankan: python3 tool/gen_de_vocab.py
"""
import runpy
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent
FILES = [f'de_vocab_{i:02d}.py' for i in range(1, 9)]

# Kategori besar per file sumber — pilihan di Tebak Kata & paket
# Pilihan Ganda (55 tema terlalu banyak untuk dipilih satu per satu).
CATEGORIES = [
    ('Angka & waktu', 'Numbers & time'),
    ('Orang, tubuh & perasaan', 'People, body & feelings'),
    ('Makanan, rumah & pakaian', 'Food, home & clothing'),
    ('Kota, transportasi & belanja', 'Town, transport & shopping'),
    ('Sekolah, kerja & birokrasi', 'School, work & paperwork'),
    ('Kata kerja', 'Verbs'),
    ('Kata sifat', 'Adjectives'),
    ('Kata ganti, preposisi & keterangan', 'Pronouns, prepositions & adverbs'),
]
assert len(CATEGORIES) == len(FILES)

check = subprocess.run([sys.executable, str(HERE / 'check_de_vocab.py')],
                       capture_output=True, text=True)
if check.returncode != 0:
    sys.exit(check.stdout + check.stderr)


def esc(s):
    return s.replace('\\', '\\\\').replace("'", "\\'").replace('$', '\\$')


titles, rows, group_cat = [], [], []
for ci, f in enumerate(FILES):
    for tid, ten, items in runpy.run_path(str(HERE / f))['GROUPS']:
        titles.append((tid, ten))
        group_cat.append(ci)
        rows += [(r, len(titles) - 1) for r in items]

out = [
    '// Kosakata inti bahasa Jerman (Goethe A1/A2), per tema. DIBUAT',
    '// OTOMATIS oleh tool/gen_de_vocab.py; jangan edit manual. Memakai',
    '// kelas JVocab: `kana` = kata (benda berartikel), `romaji` = cara baca.',
    "import 'jlpt_vocab.dart';",
    '',
    '/// Judul tema untuk [goetheVocab].',
    'const List<Map<String, String>> goetheVocabGroups = [',
]
for tid, ten in titles:
    out.append(f"  {{'id': '{esc(tid)}', 'en': '{esc(ten)}'}},")
out += ['];', '', '/// Kategori besar (untuk Tebak Kata & Pilihan Ganda).',
        'const List<Map<String, String>> goetheVocabCategories = [']
for cid, cen in CATEGORIES:
    out.append(f"  {{'id': '{esc(cid)}', 'en': '{esc(cen)}'}},")
out += ['];', '', '/// Indeks kategori untuk tiap tema di [goetheVocabGroups].',
        'const List<int> goetheGroupCategory = [',
        '  ' + ', '.join(str(c) for c in group_cat) + ',',
        '];', '', '/// Kosakata inti Goethe A1/A2, urut per tema.',
        'const List<JVocab> goetheVocab = [']
for (word, rom, mid, men), g in rows:
    out.append(f"  JVocab('{esc(word)}', '{esc(rom)}', "
               f"{{'id': '{esc(mid)}', 'en': '{esc(men)}'}}, {g}),")
out += ['];', '']
(ROOT / 'lib/data/goethe_vocab.dart').write_text('\n'.join(out), encoding='utf-8')
print(f'OK: goetheVocab={len(rows)} tema={len(titles)}')
