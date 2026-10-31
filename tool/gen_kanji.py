#!/usr/bin/env python3
"""Generator data kanji JLPT -> lib/data/kanji_bank.dart

Sumber: tool/kanji_n5.py dan tool/kanji_n4.py, masing-masing berisi
SECTIONS = [(judul_id, judul_en, catatan_id|None, catatan_en|None, [K(...), ...]), ...]
K(kanji, romaji_utama, on, kun, arti_id, arti_en, [W(...), ...])
  - romaji_utama: satu bacaan paling umum (tampil di grid & dibacakan TTS);
  - on: daftar on'yomi (katakana), kun: daftar kun'yomi (hiragana,
    okurigana dalam kurung, mis. "た(べる)") — salah satunya boleh kosong;
W(kata, kana, romaji, arti_id, arti_en) — contoh kata yang memuat kanji itu.

Validasi: kanji unik lintas level; arti (id & en) unik per level supaya
Tebak Kanji tidak punya dua jawaban benar; contoh kata memuat kanjinya
dan unik; on katakana, kun hiragana.
Jalankan: python3 tool/gen_kanji.py
"""
import pathlib, re, sys
from collections import namedtuple

HERE = pathlib.Path(__file__).resolve().parent
ROOT = HERE.parent
sys.path.insert(0, str(HERE))
K = namedtuple('K', 'kanji romaji on kun mid men words')
W = namedtuple('W', 'word kana romaji mid men')
import builtins  # noqa: E402
builtins.K, builtins.W = K, W  # dipakai file data tanpa import
from kanji_n5 import SECTIONS as N5  # noqa: E402
from kanji_n4 import SECTIONS as N4  # noqa: E402

KATA = re.compile(r'^[゠-ヿ]+$')
HIRA = re.compile(r'^[぀-ゟ()（）ー]+$')

errors = []
seen_kanji = {}
seen_word = {}
for level, sections in [('N5', N5), ('N4', N4)]:
    mids, mens = {}, {}
    for sec in sections:
        if len(sec) != 5:
            errors.append(f'{level}: bagian tidak lengkap {sec[:2]}')
            continue
        for k in sec[4]:
            k = K(*k)
            tag = f'{level} {k.kanji}'
            if len(k.kanji) != 1:
                errors.append(f'{tag}: harus satu kanji')
            if k.kanji in seen_kanji:
                errors.append(f'{tag}: sudah ada di {seen_kanji[k.kanji]}')
            seen_kanji[k.kanji] = level
            if not (k.romaji and k.mid and k.men):
                errors.append(f'{tag}: romaji/arti kosong')
            if not (k.on or k.kun):
                errors.append(f'{tag}: tanpa bacaan')
            for r in k.on:
                if not KATA.match(r):
                    errors.append(f'{tag}: on bukan katakana "{r}"')
            for r in k.kun:
                if not HIRA.match(r):
                    errors.append(f'{tag}: kun bukan hiragana "{r}"')
            if k.mid in mids:
                errors.append(f'{tag}: arti id "{k.mid}" kembar dengan {mids[k.mid]}')
            if k.men in mens:
                errors.append(f'{tag}: arti en "{k.men}" kembar dengan {mens[k.men]}')
            mids[k.mid] = k.kanji
            mens[k.men] = k.kanji
            if not k.words:
                errors.append(f'{tag}: tanpa contoh kata')
            for w in k.words:
                w = W(*w)
                if k.kanji not in w.word:
                    errors.append(f'{tag}: contoh "{w.word}" tidak memuat kanjinya')
                if not all([w.word, w.kana, w.romaji, w.mid, w.men]):
                    errors.append(f'{tag}: contoh "{w.word}" tidak lengkap')
                if w.word in seen_word:
                    errors.append(f'{tag}: contoh "{w.word}" sudah dipakai {seen_word[w.word]}')
                seen_word[w.word] = tag
if errors:
    sys.exit('\n'.join(errors))


def s(x):
    return "'" + x.replace('\\', '\\\\').replace("'", "\\'") + "'"


def lst(xs):
    return '[' + ', '.join(s(x) for x in xs) + ']'


out = [
    '// Data kanji JLPT (N5/N4): bacaan on/kun, arti, contoh kata — sumber',
    '// Materi Kanji, Tebak Kanji, dan Tulis Huruf. DIBUAT OTOMATIS oleh',
    '// tool/gen_kanji.py; jangan edit manual.',
    'class KanjiWord {',
    '  final String word;',
    '  final String kana;',
    '  final String romaji;',
    "  final Map<String, String> meaning; // {'id':.., 'en':..}",
    '  const KanjiWord(this.word, this.kana, this.romaji, this.meaning);',
    '}',
    '',
    'class KanjiEntry {',
    '  final String kanji;',
    '',
    '  /// Satu bacaan paling umum (romaji) — tampil di grid & dibacakan.',
    '  final String romaji;',
    "  final List<String> on; // on'yomi (katakana)",
    "  final List<String> kun; // kun'yomi (hiragana, okurigana dalam kurung)",
    '  final Map<String, String> meaning;',
    '  final List<KanjiWord> words;',
    '  const KanjiEntry(',
    '    this.kanji,',
    '    this.romaji,',
    '    this.on,',
    '    this.kun,',
    '    this.meaning,',
    '    this.words,',
    '  );',
    '}',
    '',
    'class KanjiSection {',
    '  final Map<String, String> title;',
    '  final Map<String, String>? note;',
    '  final List<KanjiEntry> entries;',
    '  const KanjiSection(this.title, this.note, this.entries);',
    '}',
    '',
]
counts = []
for level, sections in [('N5', N5), ('N4', N4)]:
    n = 0
    out.append(f'const List<KanjiSection> kanji{level}Sections = [')
    for tid, ten, nid, nen, entries in sections:
        note = 'null' if nid is None else f"{{'id': {s(nid)}, 'en': {s(nen)}}}"
        out.append(f"  KanjiSection({{'id': {s(tid)}, 'en': {s(ten)}}}, {note}, [")
        for k in entries:
            k = K(*k)
            n += 1
            out.append(f"    KanjiEntry({s(k.kanji)}, {s(k.romaji)}, {lst(k.on)}, {lst(k.kun)}, {{'id': {s(k.mid)}, 'en': {s(k.men)}}}, [")
            for w in k.words:
                w = W(*w)
                out.append(f"      KanjiWord({s(w.word)}, {s(w.kana)}, {s(w.romaji)}, {{'id': {s(w.mid)}, 'en': {s(w.men)}}}),")
            out.append('    ]),')
        out.append('  ]),')
    out.append('];')
    out.append('')
    counts.append(f'{level}={n}')
(ROOT / 'lib/data/kanji_bank.dart').write_text('\n'.join(out))
print('OK: ' + ' '.join(counts))
