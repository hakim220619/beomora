# -*- coding: utf-8 -*-
"""Kosakata HSK 2 — sekolah, media & hiburan. Format: lihat zh_vocab2_01.py."""

DATA = '''
# Sekolah & belajar HSK 2 | HSK 2 school & study
教室|jiàoshì|ruang kelas|classroom
课堂|kètáng|kelas (saat pelajaran)|classroom (lesson)
校园|xiàoyuán|kampus; lingkungan sekolah|campus
高中|gāozhōng|SMA|senior high school
中小学|zhōng-xiǎoxué|SD dan sekolah menengah|primary and secondary schools
年级|niánjí|kelas (tingkat tahun)|grade (school year)
黑板|hēibǎn|papan tulis|blackboard
笔|bǐ|pena; alat tulis|pen
纸|zhǐ|kertas|paper
笔记|bǐjì|catatan|notes
笔记本|bǐjìběn|buku catatan; laptop|notebook; laptop
作业|zuòyè|PR (pekerjaan rumah)|homework
问题|wèntí|pertanyaan; masalah|question; problem
题|tí|soal|exam question
难题|nántí|soal sulit; masalah pelik|difficult problem
成绩|chéngjì|nilai; prestasi|grades; results
分数|fēnshù|skor; pecahan|score; fraction
作文|zuòwén|karangan|composition (essay)
复习|fùxí|mengulang pelajaran|to review
练习|liànxí|berlatih; latihan|to practice; exercise
练|liàn|melatih|to train
听讲|tīng jiǎng|mendengarkan pelajaran|to listen to a lecture
开学|kāi xué|mulai tahun ajaran|school starts
报名|bào míng|mendaftar|to sign up
实习|shíxí|magang|to intern
教学|jiàoxué|pengajaran|teaching
教育|jiàoyù|pendidikan; mendidik|education; to educate
科|kē|bidang studi; bagian|branch of study; department
科学|kēxué|ilmu pengetahuan; sains|science
中级|zhōngjí|tingkat menengah|intermediate level
高级|gāojí|tingkat tinggi; mewah|advanced; high-grade
# Bahasa & kata | Language & words
词|cí|kata|word
词语|cíyǔ|kata dan frasa|words and phrases
生词|shēngcí|kosakata baru|new word
句子|jùzi|kalimat|sentence
词典|cídiǎn|kamus|dictionary
字典|zìdiǎn|kamus aksara|character dictionary
读音|dúyīn|lafal|pronunciation
音节|yīnjié|suku kata|syllable
语言|yǔyán|bahasa|language
普通话|pǔtōnghuà|bahasa Mandarin baku|Standard Mandarin
英语|Yīngyǔ|bahasa Inggris|English (language)
英文|Yīngwén|tulisan/bahasa Inggris|English (written)
意思|yìsi|arti; maksud|meaning
例子|lìzi|contoh|example
# Media & informasi | Media & information
报纸|bàozhǐ|koran|newspaper
日报|rìbào|harian (koran)|daily newspaper
晚报|wǎnbào|koran sore|evening paper
新闻|xīnwén|berita|news
信息|xìnxī|informasi|information
信|xìn|surat; percaya|letter; to believe
短信|duǎnxìn|SMS; pesan singkat|text message
信号|xìnhào|sinyal|signal
网|wǎng|jaring; jaringan|net; network
网站|wǎngzhàn|situs web|website
广告|guǎnggào|iklan|advertisement
小说|xiǎoshuō|novel|novel
故事|gùshi|cerita|story
笑话|xiàohua|lelucon; menertawakan|joke; to laugh at
名单|míngdān|daftar nama|name list
名称|míngchēng|nama (benda/lembaga)|name (of a thing)
# Olahraga & hiburan | Sports & entertainment
运动|yùndòng|olahraga; bergerak|sports; to exercise
体育|tǐyù|olahraga (pelajaran)|physical education
篮球|lánqiú|bola basket|basketball
排球|páiqiú|bola voli|volleyball
网球|wǎngqiú|tenis|tennis
球场|qiúchǎng|lapangan bola|sports field
球队|qiúduì|tim (olahraga)|sports team
队|duì|tim; barisan|team; line
体育场|tǐyùchǎng|stadion|stadium
体育馆|tǐyùguǎn|gedung olahraga|gymnasium
爬山|pá shān|mendaki gunung|to climb a mountain
音乐|yīnyuè|musik|music
音乐会|yīnyuèhuì|konser|concert
节目|jiémù|acara; program|program (show)
晚会|wǎnhuì|pesta malam|evening party
影片|yǐngpiàn|film (resmi)|film (formal)
活动|huódòng|kegiatan|activity
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
