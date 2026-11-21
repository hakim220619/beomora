import 'package:flutter/material.dart';

import 'ja_particles.dart';

/// Partikel & kata fungsi Mandarin yang diwarnai di contoh kalimat
/// (padanan は/を/の di kursus Jepang). Memakai kelas [JaParticle]:
/// `kana` = hanzi, `reading` = pinyin. Pinyin tanpa tanda nada = nada
/// netral — itulah yang membedakan 的 de (partikel) dari 的确 dí, 得 de
/// dari 得 dé/děi, 地 de dari 地 dì, 了 le dari 了解 liǎo.
const Map<String, JaParticle> kZhParticles = {
  '的': JaParticle('的', 'de', Color(0xFFCE82FF), {
    'id': 'milik / penjelas kata benda (seperti の)',
    'en': "possessive / noun modifier (like の, 's)",
  }),
  '了': JaParticle('了', 'le', Color(0xFF58CC02), {
    'id': 'sudah terjadi / perubahan keadaan',
    'en': 'completed action / change of state',
  }),
  '过': JaParticle('过', 'guo', Color(0xFF2EB88A), {
    'id': 'pernah (pengalaman)',
    'en': 'have ever (experience)',
  }),
  '着': JaParticle('着', 'zhe', Color(0xFF00A6A6), {
    'id': 'keadaan yang sedang berlangsung (sambil …)',
    'en': 'ongoing state (-ing)',
  }),
  '吗': JaParticle('吗', 'ma', Color(0xFFE0A100), {
    'id': 'penanda pertanyaan ya/tidak (seperti か)',
    'en': 'yes/no question marker (like か)',
  }),
  '呢': JaParticle('呢', 'ne', Color(0xFF4FA3D9), {
    'id': 'bagaimana dengan …? / pelembut, sedang …',
    'en': 'what about …? / softener, ongoing',
  }),
  '吧': JaParticle('吧', 'ba', Color(0xFFE8618C), {
    'id': 'ajakan / dugaan (… yuk, … kan?)',
    'en': "suggestion / assumption (let's …, … right?)",
  }),
  '啊': JaParticle('啊', 'a', Color(0xFFD96C2C), {
    'id': 'seruan / pelembut kalimat (ah, lho)',
    'en': 'exclamation / softener (ah, oh)',
  }),
  '得': JaParticle('得', 'de', Color(0xFFFF9600), {
    'id': 'penghubung pelengkap cara/tingkat (说得好)',
    'en': 'links a complement of manner/degree (说得好)',
  }),
  '地': JaParticle('地', 'de', Color(0xFFC2783A), {
    'id': 'pembentuk keterangan cara (慢慢地走)',
    'en': 'turns a word into an adverb (慢慢地走)',
  }),
  '把': JaParticle('把', 'bǎ', Color(0xFFFF4B4B), {
    'id': 'memajukan objek sebelum kata kerja (mirip を)',
    'en': 'moves the object before the verb (like を)',
  }),
  '被': JaParticle('被', 'bèi', Color(0xFF9C6ADE), {
    'id': 'penanda pasif (di- … oleh …)',
    'en': 'passive marker (… by …)',
  }),
  '在': JaParticle('在', 'zài', Color(0xFF1CB0F6), {
    'id': 'di (tempat) / sedang (seperti に・で)',
    'en': 'at, in (place) / in the middle of (like に・で)',
  }),
  '比': JaParticle('比', 'bǐ', Color(0xFFB8860B), {
    'id': 'daripada (perbandingan, seperti より)',
    'en': 'than (comparison, like より)',
  }),
  '和': JaParticle('和', 'hé', Color(0xFFC2783A), {
    'id': 'dan / dengan (seperti と)',
    'en': 'and / with (like と)',
  }),
  '也': JaParticle('也', 'yě', Color(0xFF7C8CF8), {
    'id': 'juga (seperti も)',
    'en': 'also, too (like も)',
  }),
  '都': JaParticle('都', 'dōu', Color(0xFF7C8CF8), {
    'id': 'semua / sama-sama',
    'en': 'all / both',
  }),
};

/// Kata yang berakhiran 了/过/着 tapi bukan partikel aspek.
const _notAspect = {'为了', '除了', '极了', '算了', '罢了', '受不了', '不过', '经过'};

final _han = RegExp(r'[㐀-鿿]');
final _punct = RegExp(r"""^[\s,.!?:;"“”‘’()\-–—…]+|[\s,.!?:;"“”‘’()\-–—…]+$""");
const _vowels = 'aeiouüvāáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜ';

bool _isVowel(String c) => _vowels.contains(c.toLowerCase());

/// Jumlah suku kata satu kata pinyin (dihitung dari kelompok vokal;
/// ' dan - memisah suku). Erhua (yíhuìr, nàr) memberi bendera `erhua`:
/// ada 儿 tambahan yang tidak dihitung sebagai suku.
(int, bool) _syllables(String word) {
  var count = 0;
  var prevVowel = false;
  for (final ch in word.split('')) {
    final v = _isVowel(ch);
    if (v && !prevVowel) count++;
    prevVowel = v;
  }
  final w = word.toLowerCase();
  var erhua = false;
  if (w.length >= 2 && w.endsWith('r')) {
    // Suku "er" utuh (èr, nǚ'ér) bukan erhua; selain itu -r = 儿
    // (wánr, yìdiǎnr, yíhuìr).
    final start = w.length - 2;
    final ownSyllable =
        'eēéěè'.contains(w[start]) &&
        (start == 0 || "'-".contains(w[start - 1]));
    erhua = !ownSyllable;
  }
  return (count, erhua);
}

/// Pecah [hanzi] tanpa spasi menjadi kata-kata yang sejajar dengan
/// kata pinyin di [words]; tanda baca menempel pada kata sebelumnya.
/// null bila tidak bisa disejajarkan (mis. ada angka Arab).
List<String>? _segment(String hanzi, List<String> words) {
  final chars = hanzi.split('');
  var i = 0;
  final out = <String>[];
  for (final w in words) {
    final bare = w.replaceAll(_punct, '');
    if (bare.isEmpty) return null;
    final (n, erhua) = _syllables(bare);
    final buf = StringBuffer();
    while (i < chars.length && !_han.hasMatch(chars[i])) {
      buf.write(chars[i++]); // tanda baca pembuka (“)
    }
    for (var k = 0; k < n; k++) {
      if (i >= chars.length || !_han.hasMatch(chars[i])) return null;
      buf.write(chars[i++]);
    }
    if (erhua && i < chars.length && chars[i] == '儿') buf.write(chars[i++]);
    while (i < chars.length &&
        !_han.hasMatch(chars[i]) &&
        !'“‘('.contains(chars[i])) {
      buf.write(chars[i++]); // tanda baca penutup (，。？)
    }
    out.add(buf.toString().trim());
  }
  if (i < chars.length) {
    if (chars.skip(i).any(_han.hasMatch)) return null;
    out[out.length - 1] += chars.skip(i).join();
  }
  return out;
}

/// Kalimat Mandarin yang sudah dipecah per kata + partikel per kata.
/// [text] & [reading] dipisah spasi dan sejajar dengan [marks]; tampilkan
/// [text] dengan [joiner] di antara kata ('' untuk kalimat biasa tanpa
/// spasi, ' ' bila sumbernya memang berspasi).
typedef ZhMarked = ({
  String text,
  String reading,
  String joiner,
  List<JaParticle?> marks,
});

/// Partikel di kalimat [hanzi] dengan pinyin [pinyin], atau null bila
/// tidak ada partikel / kalimat tidak bisa disejajarkan dengan pinyin.
ZhMarked? zhParticlesOf(String hanzi, String? pinyin) {
  if (pinyin == null || pinyin.trim().isEmpty) return null;
  final words = pinyin.trim().split(RegExp(r'\s+'));
  final spaced = hanzi.contains(' ');
  final tokens = spaced
      ? hanzi.trim().split(RegExp(r'\s+'))
      : _segment(hanzi, words);
  if (tokens == null || tokens.length != words.length) return null;

  final hz = <String>[], py = <String>[];
  final marks = <JaParticle?>[];
  for (var i = 0; i < tokens.length; i++) {
    final h = tokens[i], p = words[i];
    final bareH = h.replaceAll(_punct, '').replaceAll(RegExp(r'[^㐀-鿿]'), '');
    final bareP = p.replaceAll(_punct, '').toLowerCase();
    final single = kZhParticles[bareH];
    if (single != null && bareP == single.reading) {
      hz.add(h);
      py.add(p);
      marks.add(single);
      continue;
    }
    // Kata kerja + 了/过/着 yang ditulis menyatu (qùguo, kànzhe).
    if (bareH.length >= 2 && !_notAspect.contains(bareH)) {
      final last = kZhParticles[bareH[bareH.length - 1]];
      if (last != null &&
          const {'了', '过', '着'}.contains(last.kana) &&
          bareP.endsWith(last.reading) &&
          bareP.length > last.reading.length) {
        final cut = h.indexOf(last.kana, h.indexOf(bareH));
        final pCut = p.toLowerCase().lastIndexOf(last.reading);
        if (cut > 0 && pCut > 0) {
          hz
            ..add(h.substring(0, cut))
            ..add(h.substring(cut));
          py
            ..add(p.substring(0, pCut))
            ..add(p.substring(pCut));
          marks
            ..add(null)
            ..add(last);
          continue;
        }
      }
    }
    hz.add(h);
    py.add(p);
    marks.add(null);
  }
  if (marks.every((m) => m == null)) return null;
  return (
    text: hz.join(' '),
    reading: py.join(' '),
    joiner: spaced ? ' ' : '',
    marks: marks,
  );
}
