# -*- coding: utf-8 -*-
"""Tambahkan unit 5-16 ke kursus jalur Belajar (assets/content/{en,id,de,ko}.json).

Sumber: course_units_master.py (Inggris + Indonesia), course_units_de.py
dan course_units_ko.py (terjemahan, kunci = kata Inggris). Idempoten:
unit dengan id yang sama diganti, unit lain (1-4) tidak disentuh.

Pakai:  python3 tool/gen_course_units.py [en id de ko]
"""
import importlib
import json
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, HERE)

from course_units_master import UNITS  # noqa: E402

CONTENT = os.path.join(ROOT, 'assets', 'content')


def _key(tok):
    return re.sub(r'[^\w]', '', tok.lower())


def _word_en(w):
    en, idm, gloss, emoji, pron = w[:5]
    return {'target': en, 'meaning': {'id': idm, 'en': gloss}, 'emoji': emoji, 'romaji': pron}


def _sent_en(s):
    en, idm, gloss, pron = s
    return {'target': en, 'tokens': en.split(' '), 'meaning': {'id': idm, 'en': gloss}, 'romaji': pron}


def _word_id(w):
    en, idm, gloss, emoji = w[:4]
    label = ('to ' + en) if len(w) > 5 and w[5] == 'v' else en
    return {'target': idm, 'meaning': {'id': label, 'en': label}, 'emoji': emoji}


def _sent_id(s):
    en, idm = s[:2]
    return {'target': idm, 'tokens': idm.split(' '), 'meaning': {'id': en, 'en': en}}


def _word_tr(tr):
    def f(w):
        en, idm, gloss, emoji = w[:4]
        target, pron = tr.WORDS[en]
        return {'target': target, 'meaning': {'id': idm, 'en': gloss}, 'emoji': emoji, 'romaji': pron}
    return f


def _sent_tr(tr):
    def f(s):
        en, idm, gloss = s[:3]
        target, pron = tr.SENTENCES[en]
        return {'target': target, 'tokens': target.split(' '), 'meaning': {'id': idm, 'en': gloss}, 'romaji': pron}
    return f


def build_units(lang, word_fn, sent_fn):
    out = []
    for uid, icon, color, title_id, title_en, lessons in UNITS:
        unit = {
            'id': f'{lang}_{uid}',
            'title': {'id': title_id, 'en': title_en},
            'color': color,
            'icon': icon,
            'lessons': [],
        }
        for i, (lt_id, lt_en, words, sents) in enumerate(lessons, 1):
            unit['lessons'].append({
                'id': f'{lang}_{uid}_l{i}',
                'title': {'id': lt_id, 'en': lt_en},
                'words': [word_fn(w) for w in words],
                'sentences': [sent_fn(s) for s in sents],
            })
        out.append(unit)
    return out


def validate(course):
    errors = []
    seen = set()
    for u in course['units']:
        if len(u['lessons']) != 3:
            errors.append(f"{u['id']}: harus 3 pelajaran")
        for l in u['lessons']:
            if len(l['words']) < 4:
                errors.append(f"{l['id']}: kurang dari 4 kata")
            for w in l['words']:
                k = w['target'].lower()
                if k in seen:
                    errors.append(f"{l['id']}: kata dobel '{w['target']}'")
                seen.add(k)
            for s in l['sentences']:
                keys = [_key(t) for t in s['tokens']]
                if ' '.join(s['tokens']) != s['target']:
                    errors.append(f"{l['id']}: token tidak cocok '{s['target']}'")
                if len(set(keys)) != len(keys) or '' in keys:
                    errors.append(f"{l['id']}: token ganda '{s['target']}'")
    return errors


def process(lang):
    if lang == 'en':
        word_fn, sent_fn = _word_en, _sent_en
    elif lang == 'id':
        word_fn, sent_fn = _word_id, _sent_id
    else:
        try:
            tr = importlib.import_module(f'course_units_{lang}')
        except ImportError:
            print(f'[{lang}] course_units_{lang}.py belum ada — dilewati')
            return False
        word_fn, sent_fn = _word_tr(tr), _sent_tr(tr)

    path = os.path.join(CONTENT, f'{lang}.json')
    raw = open(path, encoding='utf-8').read()
    course = json.loads(raw)
    new_units = build_units(lang, word_fn, sent_fn)
    new_ids = {u['id'] for u in new_units}
    course['units'] = [u for u in course['units'] if u['id'] not in new_ids] + new_units

    errors = validate(course)
    if errors:
        print(f'[{lang}] GAGAL validasi:')
        for e in errors:
            print('  -', e)
        return False

    out = json.dumps(course, indent=2, ensure_ascii=False)
    if raw.endswith('\n'):
        out += '\n'
    open(path, 'w', encoding='utf-8').write(out)
    n_words = sum(len(l['words']) for u in course['units'] for l in u['lessons'])
    print(f"[{lang}] OK: {len(course['units'])} unit, "
          f"{sum(len(u['lessons']) for u in course['units'])} pelajaran, {n_words} kata")
    return True


if __name__ == '__main__':
    langs = sys.argv[1:] or ['en', 'id', 'de', 'ko']
    ok = all([process(l) for l in langs])
    sys.exit(0 if ok else 1)
