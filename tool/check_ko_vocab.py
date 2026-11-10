#!/usr/bin/env python3
"""Validasi kosakata inti Korea (tool/ko_vocab_*.py) beserta contoh
kalimatnya (tool/vocab_examples/ko_*.py).

Format sumber:
    GROUPS = [
        ("Judul ID", "Title EN", [
            (hangul, romanisasi, arti_id, arti_en),
            ...
        ]),
    ]

hangul = kata dalam bentuk kamus (kata kerja/sifat berakhiran 다).
romanisasi = Romanisasi Revisi (resmi) menurut PENGUCAPAN, huruf kecil,
sama seperti topik kosakata Korea di study_guides.dart (흙 → heuk).

Pakai:  python3 tool/check_ko_vocab.py [file ...]
Mengecek: format, kata unik di semua ko_vocab_*.py, arti id/en unik di
seluruh daftar (kuis tidak ambigu), romanisasi ASCII, dan tiap kata punya
tepat satu contoh (kalimat Hangul + romanisasi + terjemahan id/en +
catatan id/en).
"""
import re
import runpy
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
FILES = [f'ko_vocab_{i:02d}.py' for i in range(1, 9)]
HANGUL = re.compile(r'[가-힣]')


def load_groups(path):
    rows = []
    for g in runpy.run_path(str(path))['GROUPS']:
        assert len(g) == 3 and isinstance(g[2], list), f'{path.name}: grup rusak {g[:2]}'
        tid, ten, items = g
        assert tid.strip() and ten.strip(), f'{path.name}: judul grup kosong'
        rows += [(tid, ten, r) for r in items]
    return rows


def examples():
    ex = {}
    for f in sorted((HERE / 'vocab_examples').glob('ko_*.py')):
        for e in runpy.run_path(str(f))['EXAMPLES']:
            ex.setdefault(e[0], []).append((f.name, e))
    return ex


def stem(word):
    s = word[:-1] if word.endswith('다') and len(word) >= 2 else word
    if s.endswith('하') and len(s) >= 2:
        s = s[:-1]
    return s[:-1] if len(s) >= 2 else s


def main(paths):
    errors, warns = [], []
    ex = examples()
    seen, ids, ens = {}, {}, {}
    total = 0
    for fname in FILES:
        p = HERE / fname
        if not p.exists():
            continue
        for _, _, r in load_groups(p):
            total += 1
            if len(r) != 4 or not all(isinstance(x, str) and x.strip() for x in r):
                errors.append(f'{fname}: entri tidak lengkap {r!r}')
                continue
            k, rom, mid, men = r
            if not HANGUL.search(k) or re.search(r'[A-Za-z]', k):
                errors.append(f'{fname}: kunci "{k}" harus Hangul')
            if re.search(r"[^a-z\s\-']", rom):
                errors.append(f'{fname}: romanisasi aneh "{rom}" ({k})')
            if k in seen:
                errors.append(f'{fname}: "{k}" dobel (juga di {seen[k]})')
            seen[k] = fname
            if mid in ids:
                errors.append(f'{fname}: arti id "{mid}" kembar ({ids[mid]} / {k})')
            if men in ens:
                errors.append(f'{fname}: arti en "{men}" kembar ({ens[men]} / {k})')
            ids[mid], ens[men] = k, k
            exs = ex.get(k, [])
            if len(exs) != 1:
                errors.append(f'{fname}: "{k}" punya {len(exs)} contoh kalimat (harus 1)')
                continue
            f2, e = exs[0]
            if len(e) != 7 or not all(isinstance(x, str) and x.strip() for x in e):
                errors.append(f'{f2}: entri contoh rusak/kosong untuk "{k}"')
                continue
            if re.search(r"[^a-z\s\-'.,?!]", e[2]):
                errors.append(f'{f2}: romanisasi kalimat aneh untuk "{k}": {e[2]}')
            if stem(k) not in e[1].replace(' ', ''):
                warns.append(f'"{k}" tak terlihat di kalimat: {e[1]}')
    wanted = {Path(p).name for p in paths} if paths else None
    for w in warns:
        print('[peringatan]', w)
    errs = [e for e in errors if wanted is None or any(n in e for n in wanted)]
    for e in errs:
        print('[GALAT]', e)
    print('jumlah:', total)
    sys.exit(1 if errs else 0)


if __name__ == '__main__':
    main(sys.argv[1:])
