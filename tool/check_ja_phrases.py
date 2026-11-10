#!/usr/bin/env python3
"""Validasi file sumber ungkapan Jepang (tool/ja_phrases_*.py) beserta
contoh kalimatnya (tool/vocab_examples/ja_*.py).

Format sumber:
    GROUPS = [
        ("Judul ID", "Title EN", [
            (kana, romaji, arti_id, arti_en),
            ...
        ]),
    ]

`kana` = kunci entri, ditulis kana TANPA spasi (boleh ～ untuk pola,
mis. "～てもいいですか"); tanpa kanji. Romaji gaya Hepburn yang sama
dengan jlpt_vocab.dart (vokal panjang ou/uu, は partikel = wa).

Pakai:  python3 tool/check_ja_phrases.py [file ...]
Mengecek: format, kana unik (di semua ja_phrases_*.py) dan tidak dobel
dengan kosakata Jepang yang sudah ada (JLPT N5–N1 & topik tematik),
arti id/en unik per daftar, tidak ada kanji, dan tiap entri punya tepat
satu contoh kalimat (kalimat kana berspasi + romaji + terjemahan id/en).
"""
import re
import runpy
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent

LISTS = {
    'jaPhraseVocab': ['ja_phrases_daily1.py', 'ja_phrases_daily2.py'],
    'jaAizuchiVocab': ['ja_phrases_aizuchi.py'],
    'jaOnomatopeVocab': ['ja_phrases_onomatope.py'],
    'jaWorkVocab': ['ja_phrases_work.py'],
    'jaIdiomVocab': ['ja_phrases_idiom.py'],
}

KANJI = re.compile(r'[一-鿿々]')
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
    for f in ('lib/data/jlpt_vocab.dart', 'lib/data/jlpt_vocab_adv.dart'):
        text = (ROOT / f).read_text(encoding='utf-8')
        words |= {m.group(1) for m in re.finditer(r'JVocab\(\s*' + _STR, text)}
    guides = (ROOT / 'lib/data/study_guides.dart').read_text(encoding='utf-8')
    a = guides.index('final List<GuideTopic> _japanese')
    b = guides.index('final List<GuideTopic>', a + 10)
    words |= {w.replace(' ', '') for w in re.findall(r"GuideExample\(\s*'([^']*)'", guides[a:b])}
    return words


def examples():
    ex = {}
    for f in sorted((HERE / 'vocab_examples').glob('ja_*.py')):
        for e in runpy.run_path(str(f))['EXAMPLES']:
            ex.setdefault(e[0], []).append((f.name, e))
    return ex


def norm(s):
    return re.sub(r'[\s、。！？!?「」…・～〜]', '', s)


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
                if ' ' in k or '　' in k:
                    errors.append(f'{fname}: kunci "{k}" tidak boleh berspasi')
                if KANJI.search(k):
                    errors.append(f'{fname}: kunci "{k}" mengandung kanji')
                if re.search(r'[^a-z\s\-\'~.,?!]', romaji):
                    errors.append(f'{fname}: romaji aneh "{romaji}" ({k})')
                if k in seen:
                    errors.append(f'{fname}: "{k}" dobel (juga di {seen[k]})')
                seen[k] = fname
                if k in old:
                    errors.append(f'{fname}: "{k}" sudah ada di kosakata Jepang lama')
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
                if len(e) != 7 or not all(isinstance(x, str) and x.strip() for x in e):
                    errors.append(f'{f2}: entri contoh rusak/kosong untuk "{k}"')
                    continue
                if KANJI.search(e[1]):
                    errors.append(f'{f2}: kanji di kalimat "{k}": {e[1]}')
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
