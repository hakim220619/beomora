# -*- coding: utf-8 -*-
"""Kosakata HSK 2 — kata sifat & warna. Format: lihat zh_vocab2_01.py."""

DATA = '''
# Sifat & penilaian HSK 2 | HSK 2 qualities & judgement
长|cháng|panjang|long
短|duǎn|pendek (ukuran)|short (length)
近|jìn|dekat|near
低|dī|rendah|low
轻|qīng|ringan|light (weight)
亮|liàng|terang|bright
脏|zāng|kotor|dirty
满|mǎn|penuh|full
便宜|piányi|murah|cheap
漂亮|piàoliang|cantik|pretty
可爱|kě'ài|imut; lucu|cute
难看|nánkàn|jelek (dilihat)|ugly
难听|nántīng|tidak enak didengar|unpleasant to hear
安静|ānjìng|tenang; sunyi|quiet
安全|ānquán|aman; keamanan|safe; safety
平安|píng'ān|selamat sentosa|safe and sound
方便|fāngbiàn|praktis; nyaman dipakai|convenient
合适|héshì|cocok; pas|suitable
公平|gōngpíng|adil|fair
平等|píngděng|setara|equal
自由|zìyóu|bebas; kebebasan|free; freedom
正常|zhèngcháng|normal|normal
正确|zhèngquè|benar (tepat)|correct
准确|zhǔnquè|akurat|accurate
清楚|qīngchu|jelas|clear
流利|liúlì|lancar (berbahasa)|fluent
顺利|shùnlì|lancar (tanpa hambatan)|smooth
流行|liúxíng|populer; sedang tren|popular; in fashion
常见|chángjiàn|sering dijumpai|commonly seen
常用|chángyòng|sering dipakai|in common use
普通|pǔtōng|biasa; umum|ordinary
平常|píngcháng|lazim; biasanya|usual; usually
一般|yìbān|umumnya; biasa saja|generally; so-so
主要|zhǔyào|utama|main
真正|zhēnzhèng|sejati|genuine
实际|shíjì|nyata; praktis|actual; practical
直接|zhíjiē|langsung|direct
相同|xiāngtóng|identik|identical
同样|tóngyàng|sama halnya|equally; likewise
不同|bùtóng|berbeda|different
# Perasaan & keadaan HSK 2 | HSK 2 feelings & states
急|jí|terburu-buru; cemas|in a hurry; anxious
开心|kāixīn|senang hati|cheerful
快乐|kuàilè|gembira|joyful
满意|mǎnyì|puas|satisfied
难过|nánguò|sedih|sad
可怕|kěpà|menakutkan|scary
年轻|niánqīng|muda|young
热情|rèqíng|ramah; antusias|warm; enthusiastic
友好|yǒuhǎo|bersahabat|friendly
努力|nǔlì|berusaha keras|to strive
凉快|liángkuai|sejuk|nice and cool
凉|liáng|dingin (sejuk)|cool; cold (to touch)
有意思|yǒu yìsi|menarik hati; seru|interesting
# Warna HSK 2 | HSK 2 colors
颜色|yánsè|warna|color
黑|hēi|hitam|black
红|hóng|merah|red
黄|huáng|kuning|yellow
蓝|lán|biru|blue
绿|lǜ|hijau|green
白色|báisè|warna putih|white (color)
黑色|hēisè|warna hitam|black (color)
红色|hóngsè|warna merah|red (color)
黄色|huángsè|warna kuning|yellow (color)
蓝色|lánsè|warna biru|blue (color)
绿色|lǜsè|warna hijau|green (color)
'''


def _parse(text):
    groups = []
    for line in text.strip().splitlines():
        if line.startswith('#'):
            tid, ten = (s.strip() for s in line[1:].split('|'))
            groups.append((tid, ten, []))
        elif line.strip():
            groups[-1][2].append(tuple(s.strip() for s in line.split('|')))
    return groups


GROUPS = _parse(DATA)
