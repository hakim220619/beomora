#!/usr/bin/env python3
"""Generator kosakata ujian bahasa Inggris -> lib/data/en_exam_vocab.dart

Sumber data (format sama: (kata, cara baca gaya Indonesia, arti_id, arti_en)):
- en_vocab_academic.py — Academic Word List (Coxhead, 570 kelompok kata)
  + kosakata akademik tambahan: dipakai bersama TOEFL · IELTS · PTE;
- en_vocab_ielts.py   — tema esai & speaking IELTS;
- en_vocab_toeic.py   — kantor & bisnis (TOEIC).
- en_phrases_expr1.py + en_phrases_expr2.py — ungkapan percakapan;
  en_phrases_phrasal.py — phrasal verb; en_phrases_idiom.py — idiom.
  Format GROUPS = [(judul_id, judul_en, [baris...]), ...]; tiap kata
  membawa indeks grupnya (judul bagian di halaman Materi).

Validasi: kata unik di semua daftar & (kecuali AWL) tidak dobel dengan
topik kosakata Inggris di study_guides.dart; arti (id & en) unik per daftar supaya kuis
tidak punya dua jawaban benar.
Jalankan: python3 tool/gen_en_exam_vocab.py
"""
import os, pathlib, re, sys

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
from en_vocab_academic import WORDS as ACADEMIC  # noqa: E402
from en_vocab_ielts import WORDS as IELTS  # noqa: E402
from en_vocab_toeic import WORDS as TOEIC  # noqa: E402

ROOT = HERE.parent


def grouped(*files):
    """Gabungkan GROUPS dari beberapa file → (baris+indeks grup, judul)."""
    import runpy
    rows, titles = [], []
    for f in files:
        for tid, ten, items in runpy.run_path(str(HERE / f))['GROUPS']:
            titles.append((tid, ten))
            rows += [tuple(r) + (len(titles) - 1,) for r in items]
    return rows, titles


PHRASES, PHRASES_G = grouped('en_phrases_expr1.py', 'en_phrases_expr2.py')
PHRASAL, PHRASAL_G = grouped('en_phrases_phrasal.py')
IDIOMS, IDIOMS_G = grouped('en_phrases_idiom.py')

# (nama, dok, baris, judul grup | None)
LISTS = [
    ('academicVocab', 'Akademik (TOEFL · IELTS · PTE): Academic Word List + tambahan', ACADEMIC, None),
    ('ieltsVocab', 'IELTS: tema esai & speaking, deskripsi grafik, kata penghubung', IELTS, None),
    ('toeicVocab', 'TOEIC: kantor & bisnis', TOEIC, None),
    ('phraseVocab', 'Ungkapan percakapan sehari-hari yang paling sering dipakai', PHRASES, PHRASES_G),
    ('phrasalVocab', 'Phrasal verb yang paling sering dipakai', PHRASAL, PHRASAL_G),
    ('idiomVocab', 'Idiom yang umum dipakai', IDIOMS, IDIOMS_G),
]

guides = (ROOT / 'lib/data/study_guides.dart').read_text()
a = guides.index('final List<GuideTopic> _english')
b = guides.index('final List<GuideTopic>', a + 10)
themed = {w.lower() for w in re.findall(r"GuideExample\(\s*'([^']*)'", guides[a:b])}

errors = []
seen = {}
for name, _, rows, gtitles in LISTS:
    ids, ens = {}, {}
    for row in rows:
        if gtitles is not None:
            row = row[:-1]
        if len(row) != 4 or not all(isinstance(x, str) and x.strip() for x in row):
            errors.append(f'{name}: entri tidak lengkap {row!r}')
            continue
        word, pron, mid, men = row
        key = word.lower()
        if key in seen:
            errors.append(f'{name}: "{word}" sudah ada di {seen[key]}')
        seen[key] = name
        # Academic Word List sengaja lengkap (570 kata) walau beberapa
        # katanya juga ada di topik tematik (mis. energy, data).
        if key in themed and name != 'academicVocab':
            errors.append(f'{name}: "{word}" sudah ada di topik kosakata tematik')
        if mid in ids:
            errors.append(f'{name}: arti id "{mid}" kembar ({ids[mid]} / {word})')
        if men in ens:
            errors.append(f'{name}: arti en "{men}" kembar ({ens[men]} / {word})')
        ids[mid] = word
        ens[men] = word
if errors:
    sys.exit('\n'.join(errors))


def esc(s):
    return s.replace('\\', '\\\\').replace("'", "\\'")


out = [
    '// Kosakata ujian bahasa Inggris — tampil di depan daftar Kosakata',
    '// kursus Inggris, seperti JLPT di kursus Jepang. DIBUAT OTOMATIS oleh',
    '// tool/gen_en_exam_vocab.py; jangan edit manual.',
    '// `pron` = panduan baca gaya Indonesia, sama seperti topik kosakata',
    '// Inggris lain di study_guides.dart.',
    'class EVocab {',
    '  final String word;',
    '  final String pron;',
    "  final Map<String, String> meaning; // {'id':.., 'en':..}",
    '  /// Indeks grup di `<daftar>Groups` (judul bagian di halaman Materi);',
    '  /// 0 untuk daftar tanpa grup.',
    '  final int group;',
    '  const EVocab(this.word, this.pron, this.meaning, [this.group = 0]);',
    '}',
    '',
]
for name, doc, rows, gtitles in LISTS:
    if gtitles is not None:
        out.append(f'/// Judul grup untuk [{name}].')
        out.append(f'const List<Map<String, String>> {name}Groups = [')
        for tid, ten in gtitles:
            out.append(f"  {{'id': '{esc(tid)}', 'en': '{esc(ten)}'}},")
        out.append('];')
        out.append('')
    out.append(f'/// {doc}.')
    out.append(f'const List<EVocab> {name} = [')
    for row in rows:
        word, pron, mid, men = row[:4]
        tail = f', {row[4]}' if gtitles is not None else ''
        out.append(f"  EVocab('{esc(word)}', '{esc(pron)}', {{'id': '{esc(mid)}', 'en': '{esc(men)}'}}{tail}),")
    out.append('];')
    out.append('')
(ROOT / 'lib/data/en_exam_vocab.dart').write_text('\n'.join(out))
print('OK: ' + ' '.join(f'{n}={len(r)}' for n, _, r, _ in LISTS))
