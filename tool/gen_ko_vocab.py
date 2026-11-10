#!/usr/bin/env python3
"""Generator kosakata inti Korea -> lib/data/topik_vocab.dart

Sumber: tool/ko_vocab_01.py … ko_vocab_08.py (format GROUPS, lihat
tool/check_ko_vocab.py). Acuan: kosakata dasar (tingkat A) daftar
kosakata pelajar Institut Nasional Bahasa Korea (한국어 학습용 어휘 목록)
+ tema TOPIK I / EPS-TOPIK. Contoh kalimat: tool/vocab_examples/ko_*.py
(dibangkitkan tool/gen_vocab_examples.py).

Jalankan: python3 tool/gen_ko_vocab.py
"""
import runpy
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent
FILES = [f'ko_vocab_{i:02d}.py' for i in range(1, 9)]

# Kategori besar per file sumber — pilihan di Tebak Kata & paket
# Pilihan Ganda (54 tema terlalu banyak untuk dipilih satu per satu).
CATEGORIES = [
    ('Angka & waktu', 'Numbers & time'),
    ('Orang, tubuh & perasaan', 'People, body & feelings'),
    ('Makanan, rumah & pakaian', 'Food, home & clothing'),
    ('Kota, transportasi & belanja', 'Town, transport & shopping'),
    ('Sekolah, kerja & alam', 'School, work & nature'),
    ('Kata kerja', 'Verbs'),
    ('Kata sifat', 'Adjectives'),
    ('Kata ganti, tanya & keterangan', 'Pronouns, questions & adverbs'),
]
assert len(CATEGORIES) == len(FILES)

check = subprocess.run([sys.executable, str(HERE / 'check_ko_vocab.py')],
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
    '// Kosakata inti bahasa Korea (TOPIK I / EPS-TOPIK), per tema. DIBUAT',
    '// OTOMATIS oleh tool/gen_ko_vocab.py; jangan edit manual. Memakai',
    '// kelas JVocab: `kana` = Hangul, `romaji` = romanisasi.',
    "import 'jlpt_vocab.dart';",
    '',
    '/// Judul tema untuk [topikVocab].',
    'const List<Map<String, String>> topikVocabGroups = [',
]
for tid, ten in titles:
    out.append(f"  {{'id': '{esc(tid)}', 'en': '{esc(ten)}'}},")
out += ['];', '', '/// Kategori besar (untuk Tebak Kata & Pilihan Ganda).',
        'const List<Map<String, String>> topikVocabCategories = [']
for cid, cen in CATEGORIES:
    out.append(f"  {{'id': '{esc(cid)}', 'en': '{esc(cen)}'}},")
out += ['];', '', '/// Indeks kategori untuk tiap tema di [topikVocabGroups].',
        'const List<int> topikGroupCategory = [',
        '  ' + ', '.join(str(c) for c in group_cat) + ',',
        '];', '', '/// Kosakata inti TOPIK I, urut per tema.',
        'const List<JVocab> topikVocab = [']
for (word, rom, mid, men), g in rows:
    out.append(f"  JVocab('{esc(word)}', '{esc(rom)}', "
               f"{{'id': '{esc(mid)}', 'en': '{esc(men)}'}}, {g}),")
out += ['];', '']
(ROOT / 'lib/data/topik_vocab.dart').write_text('\n'.join(out), encoding='utf-8')
print(f'OK: topikVocab={len(rows)} tema={len(titles)}')
