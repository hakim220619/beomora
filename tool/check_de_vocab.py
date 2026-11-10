#!/usr/bin/env python3
"""Validasi kosakata inti Jerman (tool/de_vocab_*.py) beserta contoh
kalimatnya (tool/vocab_examples/de_*.py).

Format sumber:
    GROUPS = [
        ("Judul ID", "Title EN", [
            (kata, cara_baca, arti_id, arti_en),
            ...
        ]),
    ]

kata: kata benda SELALU dengan artikel (der/die/das) — "der Tisch";
kata kerja infinitif ("gehen", "aufstehen", "sich freuen"); lainnya
bentuk dasar. cara_baca: panduan baca gaya Indonesia (huruf kecil ASCII,
suku kata dipisah tanda hubung), seperti kosakata Inggris di app.

Pakai:  python3 tool/check_de_vocab.py [file ...]
Mengecek: format, kata unik di semua de_vocab_*.py, arti id/en unik di
seluruh daftar, kata benda berartikel + catatannya menyebut bentuk jamak
("Jamak:" atau "tanpa jamak"), dan tiap kata punya tepat satu contoh.
"""
import re
import runpy
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
FILES = [f'de_vocab_{i:02d}.py' for i in range(1, 9)]
ARTICLE = re.compile(r'^(der|die|das) [A-ZÄÖÜ]')


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
    for f in sorted((HERE / 'vocab_examples').glob('de_*.py')):
        for e in runpy.run_path(str(f))['EXAMPLES']:
            ex.setdefault(e[0], []).append((f.name, e))
    return ex


def head(word):
    """Bagian yang harus muncul di kalimat: kata tanpa artikel/sich,
    dipotong agar tahan konjugasi/deklinasi (gehen → geh, Tisch → Tisc)."""
    w = re.sub(r'^(der|die|das|sich) ', '', word).split()[0]
    w = re.sub(r'[^A-Za-zÄÖÜäöüß]', '', w)
    return w[: max(3, len(w) - 2)].lower() if len(w) > 4 else w.lower()


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
            k, pron, mid, men = r
            if re.search(r"[^a-z\s\-']", pron):
                errors.append(f'{fname}: cara baca aneh "{pron}" ({k})')
            if k in seen:
                errors.append(f'{fname}: "{k}" dobel (juga di {seen[k]})')
            seen[k] = fname
            if mid in ids:
                errors.append(f'{fname}: arti id "{mid}" kembar ({ids[mid]} / {k})')
            if men in ens:
                errors.append(f'{fname}: arti en "{men}" kembar ({ens[men]} / {k})')
            ids[mid], ens[men] = k, k
            is_noun = bool(re.match(r'^[A-ZÄÖÜ]', k.split()[-1])) and ' ' in k \
                and not k.startswith('sich ')
            if is_noun and not ARTICLE.match(k):
                errors.append(f'{fname}: kata benda "{k}" harus diawali der/die/das')
            exs = ex.get(k, [])
            if len(exs) != 1:
                errors.append(f'{fname}: "{k}" punya {len(exs)} contoh kalimat (harus 1)')
                continue
            f2, e = exs[0]
            if len(e) != 7 or not all(isinstance(x, str) for x in e) or not all(
                    e[i].strip() for i in (1, 3, 4, 5, 6)):
                errors.append(f'{f2}: entri contoh rusak/kosong untuk "{k}"')
                continue
            if e[2]:
                errors.append(f'{f2}: bacaan harus "" untuk "{k}"')
            if ARTICLE.match(k) and not re.search(r'jamak', e[5], re.I):
                errors.append(f'{f2}: catatan "{k}" harus menyebut bentuk jamak (Jamak: … / tanpa jamak)')
            if head(k) not in e[1].lower():
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
