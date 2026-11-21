#!/usr/bin/env python3
"""Generator ungkapan Mandarin -> lib/data/zh_phrases.dart

Sumber (format GROUPS):
- zh_phrases_daily.py — ungkapan sehari-hari;
- zh_phrases_work.py  — ungkapan kantor, pelanggan & pabrik;
- zh_phrases_idiom.py — chengyu (成语) & peribahasa (俗语).

    GROUPS = [
        ("Judul ID", "Title EN", [
            (hanzi, pinyin, arti_id, arti_en),
            ...
        ]),
    ]

hanzi tanpa spasi/tanda baca; pinyin bertanda nada, dipisah per kata.
Pemeriksaan: hanzi unik di semua daftar DAN tidak mengulang kata HSK
(tool/zh_vocab_*.py & zh_vocab2_*.py), arti id & en unik per daftar, pinyin valid.

Jalankan: python3 tool/gen_zh_phrases.py
"""
import re
import runpy
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent

LISTS = [
    ('zhPhraseVocab', 'Ungkapan sehari-hari yang paling sering dipakai',
     ['zh_phrases_daily.py']),
    ('zhWorkVocab', 'Ungkapan kantor, pelanggan & pabrik',
     ['zh_phrases_work.py']),
    ('zhIdiomVocab', 'Chengyu (成语) & peribahasa (俗语) populer',
     ['zh_phrases_idiom.py']),
]

HAN = re.compile(r'^[一-鿿]+$')
PINYIN = re.compile(r"^[a-zA-Zāáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜü' -]+$")

hsk = set()
for f in sorted(HERE.glob('zh_vocab*_*.py')):  # HSK 1 & HSK 2
    for _, _, items in runpy.run_path(str(f))['GROUPS']:
        hsk |= {w for w, *_ in items}


def esc(s):
    return s.replace('\\', '\\\\').replace("'", "\\'").replace('$', '\\$')


errors, seen = [], {}
out = [
    '// Ungkapan Mandarin (sehari-hari, kerja, chengyu & peribahasa) untuk',
    '// halaman Materi. DIBUAT OTOMATIS oleh tool/gen_zh_phrases.py; jangan',
    '// edit manual. Memakai JVocab: `kana` = hanzi, `romaji` = pinyin.',
    "import 'jlpt_vocab.dart';",
]
total = 0
for name, doc, files in LISTS:
    groups = []
    for f in files:
        groups += runpy.run_path(str(HERE / f))['GROUPS']
    means = {'id': set(), 'en': set()}
    rows = []
    for gi, (tid, ten, items) in enumerate(groups):
        for word, py, mid, men in items:
            if not HAN.match(word):
                errors.append(f'{name}: bukan aksara Han murni: {word!r}')
            if not PINYIN.match(py):
                errors.append(f'{name}: pinyin tidak valid: {word} {py!r}')
            if word in seen:
                errors.append(f'{name}: dobel dengan {seen[word]}: {word}')
            if word in hsk:
                errors.append(f'{name}: sudah ada di kosakata HSK: {word}')
            seen[word] = name
            for lang, m in (('id', mid), ('en', men.lower())):
                if not m.strip():
                    errors.append(f'{name}: arti {lang} kosong: {word}')
                if m in means[lang]:
                    errors.append(f'{name}: arti {lang} dobel {m!r} ({word})')
                means[lang].add(m)
            rows.append((word, py, mid, men, gi))
    total += len(rows)
    out += ['', f'/// Judul grup untuk [{name}].',
            f'const List<Map<String, String>> {name}Groups = [']
    for tid, ten, _ in groups:
        out.append(f"  {{'id': '{esc(tid)}', 'en': '{esc(ten)}'}},")
    out += ['];', '', f'/// {doc}.', f'const List<JVocab> {name} = [']
    for word, py, mid, men, gi in rows:
        out.append(f"  JVocab('{esc(word)}', '{esc(py)}', "
                   f"{{'id': '{esc(mid)}', 'en': '{esc(men)}'}}, {gi}),")
    out.append('];')

if errors:
    sys.exit('\n'.join(errors))
(ROOT / 'lib/data/zh_phrases.dart').write_text('\n'.join(out) + '\n', encoding='utf-8')
print(f'OK: {total} ungkapan di {len(LISTS)} daftar')
