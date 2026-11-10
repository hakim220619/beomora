#!/usr/bin/env python3
"""Validasi file sumber ungkapan Jerman (tool/de_phrases_*.py) beserta
contoh kalimatnya (tool/vocab_examples/de_*.py).

Format sumber:
    GROUPS = [
        ("Judul ID", "Title EN", [
            (hangul, romanisasi, arti_id, arti_en),
            ...
        ]),
    ]

kunci = ungkapan Jerman seperti ditulis normal (boleh berspasi, boleh
~ untuk pola, mis. "Ich habe es mir anders überlegt"). cara baca =
panduan baca gaya Indonesia (huruf kecil ASCII, seperti kosakata Jerman
di app). Kolom bacaan pada contoh kalimat HARUS "" (kosong).

Pakai:  python3 tool/check_de_phrases.py [file ...]
Mengecek: format, ungkapan unik (di semua de_phrases_*.py) dan tidak dobel
dengan kosakata Jerman yang sudah ada (Goethe A1/A2 & topik tematik), arti
id/en unik per daftar, dan tiap entri punya tepat satu contoh kalimat
(kalimat Jerman + terjemahan id/en, bacaan kosong).
"""
import re
import runpy
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent

LISTS = {
    'dePhraseVocab': ['de_phrases_daily1.py', 'de_phrases_daily2.py'],
    'deWorkVocab': ['de_phrases_work.py'],
    'deParticleVocab': ['de_phrases_particles.py'],
    'deIdiomVocab': ['de_phrases_idiom.py'],
}

_STR = r"'((?:[^'\\]|\\.)*)'"


def load_groups(path):
    rows = []
    for g in runpy.run_path(str(path))['GROUPS']:
        assert len(g) == 3 and isinstance(g[2], list), f'{path.name}: grup rusak {g[:2]}'
        tid, ten, items = g
        assert tid.strip() and ten.strip(), f'{path.name}: judul grup kosong'
        for r in items:
            rows.append((tid, ten, r))
    return rows


def existing_words():
    words = set()
    p = ROOT / 'lib/data/goethe_vocab.dart'
    if p.exists():
        words |= {m.group(1) for m in re.finditer(r'JVocab\(\s*' + _STR, p.read_text(encoding='utf-8'))}
    guides = (ROOT / 'lib/data/study_guides.dart').read_text(encoding='utf-8')
    a = guides.index('final List<GuideTopic> _german')
    b = guides.find('final List<GuideTopic>', a + 10)
    b = len(guides) if b < 0 else b
    words |= set(re.findall(r"GuideExample\(\s*'([^']*)'", guides[a:b]))
    return words


def examples():
    ex = {}
    for f in sorted((HERE / 'vocab_examples').glob('de_*.py')):
        for e in runpy.run_path(str(f))['EXAMPLES']:
            ex.setdefault(e[0], []).append((f.name, e))
    return ex


def norm(s):
    return re.sub(r'[\s.,!?…～〜~]', '', s).lower()


def main(paths):
    errors, warns = [], []
    old = existing_words()
    ex = examples()
    seen = {}
    counts = {}
    for lst, files in LISTS.items():
        ids, ens = {}, {}
        counts[lst] = 0
        for fname in files:
            p = HERE / fname
            if not p.exists():
                continue
            for _, _, r in load_groups(p):
                counts[lst] += 1
                if len(r) != 4 or not all(isinstance(x, str) and x.strip() for x in r):
                    errors.append(f'{fname}: entri tidak lengkap {r!r}')
                    continue
                k, romaji, mid, men = r
                if not re.search(r'[A-Za-zÄÖÜäöüß]', k):
                    errors.append(f'{fname}: kunci "{k}" harus teks Jerman')
                if re.search(r'[^a-z\s\-\'~.,?!]', romaji):
                    errors.append(f'{fname}: romaji aneh "{romaji}" ({k})')
                if k in seen:
                    errors.append(f'{fname}: "{k}" dobel (juga di {seen[k]})')
                seen[k] = fname
                if k in old:
                    errors.append(f'{fname}: "{k}" sudah ada di kosakata Jerman lama')
                if mid in ids:
                    errors.append(f'{lst}: arti id "{mid}" kembar ({ids[mid]} / {k})')
                if men in ens:
                    errors.append(f'{lst}: arti en "{men}" kembar ({ens[men]} / {k})')
                ids[mid], ens[men] = k, k
                exs = ex.get(k, [])
                if len(exs) != 1:
                    errors.append(f'{fname}: "{k}" punya {len(exs)} contoh kalimat (harus 1)')
                    continue
                f2, e = exs[0]
                if len(e) != 7 or not all(isinstance(x, str) for x in e) or not all(
                        e[i].strip() for i in (1, 3, 4, 5, 6)):
                    errors.append(f'{f2}: entri contoh rusak/kosong untuk "{k}"')
                    continue
                if re.search(r'[^a-z\s\-\'.,?!]', e[2]):
                    errors.append(f'{f2}: bacaan (romaji) aneh untuk "{k}": {e[2]}')
                stem = norm(k)
                if len(stem) >= 3:
                    stem = stem[:-1]  # boleh berubah bentuk di akhir
                if stem and stem not in norm(e[1]):
                    warns.append(f'"{k}" tak terlihat di kalimat: {e[1]}')
    wanted = {Path(p).name for p in paths} if paths else None
    for w in warns:
        print('[peringatan]', w)
    errs = [e for e in errors if wanted is None or any(n in e for n in wanted) or 'Vocab' in e]
    for e in errs:
        print('[GALAT]', e)
    print('jumlah:', counts)
    sys.exit(1 if errs else 0)


if __name__ == '__main__':
    main(sys.argv[1:])
