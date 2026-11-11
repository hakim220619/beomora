import 'package:flutter/material.dart';

/// Partikel bahasa Jepang yang diwarnai di contoh kalimat kosakata,
/// beserta bacaan dan fungsinya (bahasa UI).
class JaParticle {
  final String kana;
  final String reading;
  final Color color;
  final Map<String, String> desc;
  const JaParticle(this.kana, this.reading, this.color, this.desc);
}

/// Warna tetap per partikel supaya mata terbiasa.
const Map<String, JaParticle> kJaParticles = {
  'は': JaParticle('は', 'wa', Color(0xFF1CB0F6), {
    'id': 'penanda topik (ditulis "ha", dibaca "wa")',
    'en': 'topic marker (written "ha", read "wa")',
  }),
  'が': JaParticle('が', 'ga', Color(0xFFFF9600), {
    'id': 'penanda subjek / pelaku',
    'en': 'subject marker',
  }),
  'を': JaParticle('を', 'o', Color(0xFFFF4B4B), {
    'id': 'penanda objek (yang dikenai pekerjaan)',
    'en': 'object marker',
  }),
  'に': JaParticle('に', 'ni', Color(0xFF58CC02), {
    'id': 'ke / di / pada (tujuan, tempat ada, waktu)',
    'en': 'to / at / in (destination, location, time)',
  }),
  'の': JaParticle('の', 'no', Color(0xFFCE82FF), {
    'id': 'milik / -nya, penghubung kata benda',
    'en': "possessive ('s), links nouns",
  }),
  'で': JaParticle('で', 'de', Color(0xFF00A6A6), {
    'id': 'di (tempat kegiatan) / dengan (alat, cara)',
    'en': 'at (place of action) / by, with (means)',
  }),
  'へ': JaParticle('へ', 'e', Color(0xFFE45C9C), {
    'id': 'ke arah (ditulis "he", dibaca "e")',
    'en': 'toward (written "he", read "e")',
  }),
  'と': JaParticle('と', 'to', Color(0xFFC2783A), {
    'id': 'dan / bersama / kutipan',
    'en': 'and / with / quotation',
  }),
  'も': JaParticle('も', 'mo', Color(0xFF7C8CF8), {
    'id': 'juga',
    'en': 'also, too',
  }),
  'から': JaParticle('から', 'kara', Color(0xFF2EB88A), {
    'id': 'dari / karena',
    'en': 'from / because',
  }),
  'まで': JaParticle('まで', 'made', Color(0xFFB8860B), {
    'id': 'sampai',
    'en': 'until / up to',
  }),
  'より': JaParticle('より', 'yori', Color(0xFF9C6ADE), {
    'id': 'daripada (perbandingan)',
    'en': 'than (comparison)',
  }),
  'や': JaParticle('や', 'ya', Color(0xFFD96C2C), {
    'id': 'dan (daftar contoh, tidak lengkap)',
    'en': 'and (non-exhaustive list)',
  }),
  'か': JaParticle('か', 'ka', Color(0xFFE0A100), {
    'id': 'penanda pertanyaan / atau',
    'en': 'question marker / or',
  }),
  'ね': JaParticle('ね', 'ne', Color(0xFF4FA3D9), {
    'id': 'ya kan? (minta persetujuan)',
    'en': 'right? (seeking agreement)',
  }),
  'よ': JaParticle('よ', 'yo', Color(0xFFE8618C), {
    'id': 'lho / loh (penegasan)',
    'en': 'you know (emphasis)',
  }),
};

/// Satuan hitung: に di antara partikel dan satuan ini adalah angka 2
/// (mis. りんご が に こ), bukan partikel.
const _counters = {
  'こ',
  'にん',
  'ひき',
  'まい',
  'さつ',
  'だい',
  'ほん',
  'ぼん',
  'じ',
  'がつ',
  'かい',
  'ばん',
  'ふん',
  'さい',
  'ねん',
  'じかん',
  'にち',
  'つ',
  'はい',
  'えん',
  'ど',
  'ばい',
  'けん',
  'そく',
  'とう',
  'わ',
  'びょう',
  'かげつ',
};

/// Partikel yang lazim tepat sebelum jumlah (りんご が に こ). に setelah
/// partikel lain (mis. の うえ に ほん) tetap partikel.
const _beforeNumber = {'が', 'を', 'は', 'も'};

/// Tanda baca di ujung token (mis. "が、", "か。").
final _trailing = RegExp(r'[、。！？!?,.]+$');

String _bare(String token) => token.replaceAll(_trailing, '');

/// Partikel per token kalimat [text] (dipisah spasi); null = bukan
/// partikel. [reading] (romaji per token) dipakai membedakan kata yang
/// bentuknya sama: は "gigi" dibaca "ha", bukan partikel "wa".
List<JaParticle?> particlesOf(String text, String? reading) {
  final tokens = text.split(' ');
  final rom = reading?.split(' ');
  final aligned = rom != null && rom.length == tokens.length;
  final romWords = {
    for (final r in rom ?? const <String>[]) _bare(r).toLowerCase(),
  };
  return [
    for (var i = 0; i < tokens.length; i++)
      () {
        final p = kJaParticles[_bare(tokens[i])];
        if (p == null) return null;
        if (aligned) {
          if (_bare(rom[i]).toLowerCase() != p.reading) return null;
        } else if (p.kana == 'は' && romWords.contains('ha')) {
          return null; // tak sejajar & ada "ha": mungkin "gigi"
        }
        if (p.kana == 'に' &&
            i > 0 &&
            i + 1 < tokens.length &&
            _beforeNumber.contains(_bare(tokens[i - 1])) &&
            _counters.contains(_bare(tokens[i + 1]))) {
          return null; // angka 2 + satuan
        }
        return p;
      }(),
  ];
}

/// Partikel per token romaji — hanya kalau sejajar dengan [text].
List<JaParticle?>? readingParticlesOf(String text, String? reading) {
  if (reading == null) return null;
  final kana = particlesOf(text, reading);
  return reading.split(' ').length == kana.length ? kana : null;
}
