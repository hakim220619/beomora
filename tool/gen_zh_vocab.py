#!/usr/bin/env python3
"""Generator kosakata HSK 1–2 Mandarin -> lib/data/hsk_vocab.dart

Sumber HSK 1: tool/zh_vocab_01.py … zh_vocab_07.py, masing-masing berisi
    GROUPS = [
        ("Judul ID", "Title EN", [
            (hanzi, pinyin, arti_id, arti_en),
            ...
        ]),
    ]

hanzi  = aksara sederhana (简体字), tanpa spasi/tanda baca.
pinyin = bertanda nada (nǐ hǎo), nada netral tanpa tanda (ma, de);
         一/不 ditulis dengan perubahan nadanya (yìqǐ, bú kèqi).

Sumber HSK 2: tool/zh_vocab2_01.py … zh_vocab2_09.py (format DATA
teks, diurai jadi GROUPS yang sama).

Acuan: daftar kata tingkat 1 & 2 HSK 3.0 (semua kata resmi masuk,
kecuali beberapa varian 儿/gabungan yang sudah terwakili), dikelompokkan per
tema. Daftar disusun ulang, bukan salinan resmi 1:1.

Pemeriksaan: hanzi unik, arti id & en unik di seluruh daftar (Tebak
Kata tidak punya dua jawaban benar), target hanya aksara Han, pinyin
hanya huruf Latin (+ tanda nada, ü, ', -, spasi).

Jalankan: python3 tool/gen_zh_vocab.py
"""
import re
import runpy
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent

# (level, file sumber, kategori besar per file — pilihan di Tebak Kata).
LEVELS = [
    (1, [f'zh_vocab_{i:02d}.py' for i in range(1, 8)], [
        ('Angka & waktu', 'Numbers & time'),
        ('Orang, keluarga & tubuh', 'People, family & body'),
        ('Makanan, rumah & sekolah', 'Food, home & school'),
        ('Tempat, arah & alam', 'Places, directions & nature'),
        ('Kata kerja', 'Verbs'),
        ('Kata sifat', 'Adjectives'),
        ('Kata tanya, keterangan & ungkapan', 'Questions, adverbs & expressions'),
    ]),
    (2, [f'zh_vocab2_{i:02d}.py' for i in range(1, 10)], [
        ('Angka, satuan & waktu', 'Numbers, measures & time'),
        ('Orang, pekerjaan & tubuh', 'People, jobs & body'),
        ('Makanan, rumah & benda', 'Food, home & things'),
        ('Sekolah, media & hiburan', 'School, media & fun'),
        ('Tempat, arah, transportasi & alam', 'Places, transport & nature'),
        ('Kata kerja', 'Verbs'),
        ('Kata sifat & warna', 'Adjectives & colors'),
        ('Hal, gagasan & kehidupan', 'Ideas & life'),
        ('Keterangan & kata sambung', 'Adverbs & conjunctions'),
    ]),
]
for _, files, cats in LEVELS:
    assert len(files) == len(cats)

HAN = re.compile(r'^[一-鿿]+$')
PINYIN = re.compile(r"^[a-zA-Zāáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜü' -]+$")


def esc(s):
    return s.replace('\\', '\\\\').replace("'", "\\'").replace('$', '\\$')


titles, rows, group_cat, categories = [], [], [], []
level_first_group = {}
for level, files, cats in LEVELS:
    level_first_group[level] = len(titles)
    for f, (cid, cen) in zip(files, cats):
        categories.append((f'HSK {level} · {cid}', f'HSK {level} · {cen}'))
        for tid, ten, items in runpy.run_path(str(HERE / f))['GROUPS']:
            titles.append((tid, ten))
            group_cat.append(len(categories) - 1)
            rows += [(r, len(titles) - 1, f) for r in items]

errors = []
seen = {'hanzi': {}, 'id': {}, 'en': {}}
for (word, py, mid, men), _, f in rows:
    if not HAN.match(word):
        errors.append(f'{f}: target bukan aksara Han murni: {word!r}')
    if not PINYIN.match(py):
        errors.append(f'{f}: pinyin tidak valid: {word} {py!r}')
    if not mid.strip() or not men.strip():
        errors.append(f'{f}: arti kosong: {word}')
    for kind, key in (('hanzi', word), ('id', mid), ('en', men.lower())):
        if key in seen[kind]:
            errors.append(f'{f}: {kind} dobel {key!r} ({seen[kind][key]} & {word})')
        seen[kind][key] = word
if errors:
    sys.exit('\n'.join(errors))

out = [
    '// Kosakata HSK 1–2 bahasa Mandarin, per tema. DIBUAT OTOMATIS oleh',
    '// tool/gen_zh_vocab.py; jangan edit manual. Memakai kelas JVocab:',
    '// `kana` = hanzi (aksara sederhana), `romaji` = pinyin bernada.',
    "import 'jlpt_vocab.dart';",
    '',
    '/// Judul tema untuk [hskVocab].',
    'const List<Map<String, String>> hskVocabGroups = [',
]
for tid, ten in titles:
    out.append(f"  {{'id': '{esc(tid)}', 'en': '{esc(ten)}'}},")
out += ['];', '', '/// Kategori besar (untuk Tebak Kata).',
        'const List<Map<String, String>> hskVocabCategories = [']
for cid, cen in categories:
    out.append(f"  {{'id': '{esc(cid)}', 'en': '{esc(cen)}'}},")
out += ['];', '', '/// Indeks kategori untuk tiap tema di [hskVocabGroups].',
        'const List<int> hskGroupCategory = [',
        '  ' + ', '.join(str(c) for c in group_cat) + ',',
        '];', '',
        '/// Indeks tema pertama HSK 2 di [hskVocabGroups]; tema sebelumnya HSK 1.',
        f'const int hsk2FirstGroup = {level_first_group[2]};', '',
        '/// Kosakata HSK 1 lalu HSK 2, urut per tema.',
        'const List<JVocab> hskVocab = [']
for (word, py, mid, men), g, _ in rows:
    out.append(f"  JVocab('{esc(word)}', '{esc(py)}', "
               f"{{'id': '{esc(mid)}', 'en': '{esc(men)}'}}, {g}),")
out += ['];', '']
(ROOT / 'lib/data/hsk_vocab.dart').write_text('\n'.join(out), encoding='utf-8')
n1 = sum(1 for _, g, _ in rows if g < level_first_group[2])
print(f'OK: hskVocab={len(rows)} (HSK1={n1}, HSK2={len(rows) - n1}) tema={len(titles)}')
