#!/usr/bin/env python3
"""Generator kosakata ujian bahasa Inggris -> lib/data/en_exam_vocab.dart

Sumber data (format sama: (kata, cara baca gaya Indonesia, arti_id, arti_en)):
- en_vocab_academic.py — Academic Word List (Coxhead, 570 kelompok kata)
  + kosakata akademik tambahan: dipakai bersama TOEFL · IELTS · PTE;
- en_vocab_ielts.py   — tema esai & speaking IELTS;
- en_vocab_toeic.py   — kantor & bisnis (TOEIC).

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
LISTS = [
    ('academicVocab', 'Akademik (TOEFL · IELTS · PTE): Academic Word List + tambahan', ACADEMIC),
    ('ieltsVocab', 'IELTS: tema esai & speaking, deskripsi grafik, kata penghubung', IELTS),
    ('toeicVocab', 'TOEIC: kantor & bisnis', TOEIC),
]

guides = (ROOT / 'lib/data/study_guides.dart').read_text()
a = guides.index('final List<GuideTopic> _english')
b = guides.index('final List<GuideTopic>', a + 10)
themed = {w.lower() for w in re.findall(r"GuideExample\(\s*'([^']*)'", guides[a:b])}

errors = []
seen = {}
for name, _, rows in LISTS:
    ids, ens = {}, {}
    for row in rows:
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
    '  const EVocab(this.word, this.pron, this.meaning);',
    '}',
    '',
]
for name, doc, rows in LISTS:
    out.append(f'/// {doc}.')
    out.append(f'const List<EVocab> {name} = [')
    for word, pron, mid, men in rows:
        out.append(f"  EVocab('{esc(word)}', '{esc(pron)}', {{'id': '{esc(mid)}', 'en': '{esc(men)}'}}),")
    out.append('];')
    out.append('')
(ROOT / 'lib/data/en_exam_vocab.dart').write_text('\n'.join(out))
print('OK: ' + ' '.join(f'{n}={len(r)}' for n, _, r in LISTS))
