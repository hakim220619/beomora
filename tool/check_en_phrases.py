#!/usr/bin/env python3
"""Validasi file sumber ungkapan Inggris (tool/en_phrases_*.py) beserta
contoh kalimatnya (tool/vocab_examples/en_*.py).

Format sumber:
    GROUPS = [
        ("Judul ID", "Title EN", [
            (ungkapan, cara_baca_gaya_indonesia, arti_id, arti_en),
            ...
        ]),
    ]

Pakai:  python3 tool/check_en_phrases.py tool/en_phrases_expr1.py [...]
Mengecek: format, ungkapan unik (di file yang dicek, di sesama
en_phrases_*.py, dan tidak dobel dengan kosakata Inggris yang sudah
ada), arti id/en unik per DAFTAR (expr1+expr2 = satu daftar), dan tiap
ungkapan punya tepat satu contoh kalimat di tool/vocab_examples/.
"""
import re
import runpy
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent

# Daftar tampil: file sumber yang digabung jadi satu daftar.
LISTS = {
    'phraseVocab': ['en_phrases_expr1.py', 'en_phrases_expr2.py'],
    'phrasalVocab': ['en_phrases_phrasal.py'],
    'idiomVocab': ['en_phrases_idiom.py'],
}


def load_groups(path):
    groups = runpy.run_path(str(path))['GROUPS']
    rows = []
    for g in groups:
        assert len(g) == 3 and isinstance(g[2], list), f'{path.name}: grup rusak {g[:2]}'
        tid, ten, items = g
        assert tid.strip() and ten.strip(), f'{path.name}: judul grup kosong'
        for r in items:
            rows.append((tid, ten, r))
    return groups, rows


def existing_words():
    words = set()
    for f in ('en_vocab_academic.py', 'en_vocab_ielts.py', 'en_vocab_toeic.py'):
        for r in runpy.run_path(str(HERE / f))['WORDS']:
            words.add(r[0].lower())
    guides = (ROOT / 'lib/data/study_guides.dart').read_text(encoding='utf-8')
    a = guides.index('final List<GuideTopic> _english')
    b = guides.index('final List<GuideTopic>', a + 10)
    words |= {w.lower() for w in re.findall(r"GuideExample\(\s*'([^']*)'", guides[a:b])}
    return words


def examples():
    ex = {}
    for f in sorted((HERE / 'vocab_examples').glob('en_*.py')):
        for e in runpy.run_path(str(f))['EXAMPLES']:
            ex.setdefault(e[0], []).append((f.name, e))
    return ex


def main(paths):
    errors, warns = [], []
    old = existing_words()
    ex = examples()
    seen = {}
    for lst, files in LISTS.items():
        ids, ens = {}, {}
        for fname in files:
            p = HERE / fname
            if not p.exists():
                continue
            _, rows = load_groups(p)
            for tid, _, r in rows:
                if len(r) != 4 or not all(isinstance(x, str) and x.strip() for x in r):
                    errors.append(f'{fname}: entri tidak lengkap {r!r}')
                    continue
                w, pron, mid, men = r
                k = w.lower()
                if k in seen:
                    errors.append(f'{fname}: "{w}" dobel (juga di {seen[k]})')
                seen[k] = fname
                if k in old:
                    errors.append(f'{fname}: "{w}" sudah ada di kosakata Inggris lama')
                if mid in ids:
                    errors.append(f'{lst}: arti id "{mid}" kembar ({ids[mid]} / {w})')
                if men in ens:
                    errors.append(f'{lst}: arti en "{men}" kembar ({ens[men]} / {w})')
                ids[mid], ens[men] = w, w
                if any(c in w for c in '\n\\'):
                    errors.append(f'{fname}: karakter aneh di "{w}"')
                exs = ex.get(w, [])
                if len(exs) != 1:
                    errors.append(f'{fname}: "{w}" punya {len(exs)} contoh kalimat (harus 1)')
                else:
                    e = exs[0][1]
                    if len(e) != 7 or not all(isinstance(x, str) for x in e):
                        errors.append(f'{exs[0][0]}: entri contoh rusak untuk "{w}"')
                    elif not e[1].strip() or not e[3].strip() or not e[5].strip() or not e[6].strip():
                        errors.append(f'{exs[0][0]}: kolom contoh kosong untuk "{w}"')
                    elif e[2] or e[4]:
                        errors.append(f'{exs[0][0]}: bacaan & terjemahan_en harus "" untuk "{w}"')
                    else:
                        head = re.sub(r"[^a-z']", '', w.lower().split()[0])[:4]
                        if head and head not in e[1].lower():
                            warns.append(f'"{w}" tak terlihat di kalimat: {e[1]}')
    wanted = {Path(p).name for p in paths} if paths else None
    for w in warns:
        print('[peringatan]', w)
    errs = [e for e in errors if wanted is None or any(n in e for n in wanted) or 'Vocab' in e]
    for e in errs:
        print('[GALAT]', e)
    counts = {}
    for lst, files in LISTS.items():
        n = 0
        for fname in files:
            if (HERE / fname).exists():
                n += len(load_groups(HERE / fname)[1])
        counts[lst] = n
    print('jumlah:', counts)
    sys.exit(1 if errs else 0)


if __name__ == '__main__':
    main(sys.argv[1:])
