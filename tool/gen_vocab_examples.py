"""Bangkitkan lib/data/vocab_examples.dart — contoh kalimat & catatan
penggunaan per kata untuk kosakata JLPT (N5/N4/N3), ungkapan Jepang
(ja_phrases.dart) dan kosakata/ungkapan Inggris (en_exam_vocab.dart).

Sumber data: tool/vocab_examples/ja_*.py & en_*.py, masing-masing berisi
EXAMPLES = [(kata, kalimat, bacaan, terjemahan_id, terjemahan_en,
pakai_id, pakai_en), ...]. Kunci `kata` harus ada di jlpt_vocab.dart /
en_exam_vocab.dart. Jalankan: python3 tool/gen_vocab_examples.py
"""

import re
import runpy
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SRC = ROOT / 'tool' / 'vocab_examples'
if len(sys.argv) > 1:  # folder data lain (uji coba)
    SRC = Path(sys.argv[1])

_STR = r"'((?:[^'\\]|\\.)*)'"


def dart_keys(path, cls):
    text = (ROOT / path).read_text(encoding='utf-8')
    return [
        m.group(1).replace("\\'", "'")
        for m in re.finditer(cls + r'\(\s*' + _STR + r',', text)
    ]


def load(prefix):
    rows = []
    for f in sorted(SRC.glob(prefix + '_*.py')):
        ex = runpy.run_path(str(f))['EXAMPLES']
        for e in ex:
            if len(e) != 7 or not all(isinstance(x, str) for x in e):
                sys.exit(f'{f.name}: entri rusak {e!r}')
        rows += ex
    return rows


KANJI = re.compile(r'[一-鿿]')
VERB_END = 'うくぐすつぬぶむる'


def check(lang, rows, valid):
    errors, warns = [], []
    seen = set()
    for key, sent, reading, t_id, t_en, u_id, u_en in rows:
        if key in seen:
            errors.append(f'dobel: {key}')
        seen.add(key)
        if key not in valid:
            errors.append(f'kata tak dikenal: {key}')
        if not sent.strip() or not t_id.strip() or not u_id.strip() or not u_en.strip():
            errors.append(f'kolom kosong: {key}')
        if lang == 'ja':
            if KANJI.search(sent):
                errors.append(f'kanji di kalimat: {key} → {sent}')
            if not reading.strip() or not t_en.strip():
                errors.append(f'bacaan/terjemahan en kosong: {key}')
            if KANJI.search(key):
                continue  # kalimat ditulis kana, kunci berkanji tak dicek
            stem = key[:-1] if len(key) >= 2 and key[-1] in VERB_END else key
            for tail in ('する', 'な'):  # べんきょうする, しずかな
                if key.endswith(tail) and len(key) > len(tail) + 1:
                    stem = key[: -len(tail)]
            # Kata sifat い (たかい→たかく/たかかった) cukup dicek stem-nya.
            if stem.endswith('い') and len(stem) >= 3:
                stem = stem[:-1]
            if stem not in sent.replace(' ', ''):
                warns.append(f'{key} tak muncul di: {sent}')
        elif lang == 'ko':
            # Kalimat Hangul + romanisasi + terjemahan id & en wajib;
            # kecocokan kata dicek tool/check_ko_vocab.py.
            if not reading.strip() or not t_en.strip():
                errors.append(f'romanisasi/terjemahan en kosong: {key}')
        elif lang == 'de':
            # Kalimat Jerman + terjemahan id & en wajib (tanpa bacaan);
            # kecocokan kata dicek tool/check_de_vocab.py.
            if not t_en.strip():
                errors.append(f'terjemahan en kosong: {key}')
        else:
            head = key.lower().split()[0][:4]
            if head not in sent.lower():
                warns.append(f'{key} tak muncul di: {sent}')
    missing = [k for k in valid if k not in seen]
    return errors, warns, missing


def esc(s):
    return s.replace('\\', '\\\\').replace("'", "\\'").replace('$', '\\$')


def emit(name, rows):
    out = [f'const Map<String, VocabUsage> {name} = {{']
    for key, sent, reading, t_id, t_en, u_id, u_en in rows:
        args = ', '.join(
            f"'{esc(x)}'" for x in (sent, reading, t_id, t_en, u_id, u_en)
        )
        out.append(f"  '{esc(key)}': VocabUsage({args}),")
    out.append('};')
    return out


def main():
    ja = load('ja')
    en = load('en')
    ja_valid = dart_keys('lib/data/jlpt_vocab.dart', 'JVocab')
    if (ROOT / 'lib/data/ja_phrases.dart').exists():
        ja_valid += dart_keys('lib/data/ja_phrases.dart', 'JVocab')
    en_valid = dart_keys('lib/data/en_exam_vocab.dart', 'EVocab')
    ko = load('ko')
    ko_valid = (
        dart_keys('lib/data/topik_vocab.dart', 'JVocab')
        if (ROOT / 'lib/data/topik_vocab.dart').exists()
        else []
    )
    if (ROOT / 'lib/data/ko_phrases.dart').exists():
        ko_valid += dart_keys('lib/data/ko_phrases.dart', 'JVocab')
    de = load('de')
    de_valid = (
        dart_keys('lib/data/goethe_vocab.dart', 'JVocab')
        if (ROOT / 'lib/data/goethe_vocab.dart').exists()
        else []
    )
    if (ROOT / 'lib/data/de_phrases.dart').exists():
        de_valid += dart_keys('lib/data/de_phrases.dart', 'JVocab')
    failed = False
    for lang, rows, valid in (
        ('ja', ja, ja_valid),
        ('en', en, en_valid),
        ('ko', ko, ko_valid),
        ('de', de, de_valid),
    ):
        errors, warns, missing = check(lang, rows, valid)
        for w in warns:
            print(f'[peringatan {lang}] {w}')
        for e in errors:
            print(f'[GALAT {lang}] {e}')
        if missing:
            print(f'[info {lang}] {len(missing)} kata belum punya contoh')
        failed |= bool(errors)
    if failed:
        sys.exit(1)

    out = [
        '// Contoh kalimat & catatan penggunaan per kata (lembar detail',
        '// kosakata di tab Materi). DIBUAT OTOMATIS oleh',
        '// tool/gen_vocab_examples.py; jangan edit manual.',
        'class VocabUsage {',
        '  final String sentence;',
        '  final String reading; // romaji/romanisasi (Jepang/Korea); kosong untuk Inggris',
        '  final String translationId;',
        '  final String translationEn; // kosong bila kalimatnya sudah Inggris',
        '  final String usageId;',
        '  final String usageEn;',
        '  const VocabUsage(',
        '    this.sentence,',
        '    this.reading,',
        '    this.translationId,',
        '    this.translationEn,',
        '    this.usageId,',
        '    this.usageEn,',
        '  );',
        '',
        "  String translation(String uiLang) =>",
        "      uiLang == 'en' ? translationEn : translationId;",
        "  String usage(String uiLang) => uiLang == 'en' ? usageEn : usageId;",
        '}',
        '',
        '/// Contoh untuk [target] di kursus [courseId], atau null.',
        'VocabUsage? vocabUsageFor(String courseId, String target) =>',
        '    switch (courseId) {',
        "      'ja' => vocabUsageJa[target],",
        "      'en' => vocabUsageEn[target],",
        "      'ko' => vocabUsageKo[target],",
        "      'de' => vocabUsageDe[target],",
        '      _ => null,',
        '    };',
        '',
        *emit('vocabUsageJa', ja),
        '',
        *emit('vocabUsageEn', en),
        '',
        *emit('vocabUsageKo', ko),
        '',
        *emit('vocabUsageDe', de),
        '',
    ]
    (ROOT / 'lib/data/vocab_examples.dart').write_text(
        '\n'.join(out), encoding='utf-8'
    )
    print(
        f'OK: ja={len(ja)}/{len(ja_valid)} en={len(en)}/{len(en_valid)} '
        f'ko={len(ko)}/{len(ko_valid)} de={len(de)}/{len(de_valid)}'
    )


main()
