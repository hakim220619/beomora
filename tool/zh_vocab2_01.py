# -*- coding: utf-8 -*-
"""Kosakata HSK 2 — angka, satuan & waktu.
Format DATA: baris `# Judul ID | Title EN` membuka tema, lalu satu kata
per baris `hanzi|pinyin|arti_id|arti_en`. Lihat tool/gen_zh_vocab.py."""

DATA = '''
# Angka & ukuran | Numbers & measurements
千|qiān|ribu|thousand
万|wàn|sepuluh ribu|ten thousand
亿|yì|seratus juta|hundred million
公斤|gōngjīn|kilogram|kilogram
千克|qiānkè|kilogram (resmi)|kilogram (formal)
斤|jīn|kati (setengah kilo)|jin (half a kilo)
克|kè|gram|gram
公里|gōnglǐ|kilometer|kilometer
度|dù|derajat|degree
零下|líng xià|di bawah nol|below zero
数字|shùzì|angka; digit|numeral; digit
级|jí|tingkat; kelas|level; grade
# Kata satuan HSK 2 | HSK 2 measure words
角|jiǎo|jiao (1/10 yuan); sudut|jiao (1/10 yuan); corner
件|jiàn|satuan pakaian/urusan|measure word for clothes/matters
层|céng|lantai (tingkat); lapisan|floor (storey); layer
段|duàn|satuan bagian/potongan|measure word for sections
封|fēng|satuan surat|measure word for letters
份|fèn|satuan porsi/dokumen|measure word for portions/copies
句|jù|satuan kalimat|measure word for sentences
节|jié|satuan jam pelajaran; hari raya|measure word for lessons; festival
辆|liàng|satuan kendaraan|measure word for vehicles
篇|piān|satuan tulisan/artikel|measure word for articles
片|piàn|keping; lembar|slice; piece (flat)
瓶|píng|satuan botol|measure word for bottles
套|tào|satuan set/stel|set; suite
条|tiáo|satuan benda panjang|measure word for long things
位|wèi|satuan orang (sopan)|polite measure word for people
座|zuò|satuan gedung/gunung|measure word for buildings/mountains
遍|biàn|kali (dari awal sampai akhir)|time (from start to finish)
场|chǎng|satuan pertandingan/pertunjukan|measure word for games/shows
刻|kè|seperempat jam|quarter of an hour
# Waktu HSK 2 | HSK 2 time words
分钟|fēnzhōng|menit (lamanya)|minute (duration)
周|zhōu|pekan; keliling|week (formal); circuit
周末|zhōumò|akhir pekan|weekend
上周|shàng zhōu|minggu lalu|last week
下周|xià zhōu|minggu depan|next week
前年|qiánnián|dua tahun lalu|the year before last
全年|quán nián|sepanjang tahun|the whole year
周年|zhōunián|ulang tahun (peringatan)|anniversary
月份|yuèfèn|bulan (dalam kalender)|month (of the year)
日子|rìzi|hari-hari; kehidupan|days; life
学期|xuéqī|semester|semester
假期|jiàqī|masa liburan|vacation period
早晨|zǎochen|pagi hari|early morning
半夜|bànyè|tengah malam|midnight
夜|yè|malam (singkat)|night (short form)
夜里|yèli|pada malam hari|at night
春天|chūntiān|musim semi|spring
夏天|xiàtiān|musim panas|summer
秋天|qiūtiān|musim gugur|autumn
冬天|dōngtiān|musim dingin|winter
春节|Chūn Jié|Tahun Baru Imlek|Spring Festival
节日|jiérì|hari raya; festival|festival; holiday
过年|guò nián|merayakan tahun baru|to celebrate the New Year
# Saat & urutan waktu | Moments & sequence in time
以前|yǐqián|dulu; sebelum|before; in the past
以后|yǐhòu|nanti; setelah|after; later
刚才|gāngcái|tadi|just now
刚|gāng|baru saja|just (a moment ago)
刚刚|gānggāng|barusan|only just
当时|dāngshí|pada waktu itu|at that time
那时|nà shí|saat itu|back then
这时|zhè shí|saat ini juga (dalam cerita)|at this moment
那会儿|nàhuìr|waktu itu (lisan)|at that time (spoken)
后来|hòulái|kemudian|afterwards
今后|jīnhòu|mulai sekarang|from now on
不久|bùjiǔ|tak lama kemudian|before long
小时候|xiǎo shíhou|waktu kecil|in one's childhood
从小|cóngxiǎo|sejak kecil|since childhood
一生|yìshēng|seumur hidup|all one's life
随时|suíshí|kapan saja|at any time
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
