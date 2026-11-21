# -*- coding: utf-8 -*-
"""Kosakata HSK 2 — orang, pekerjaan & tubuh. Format: lihat zh_vocab2_01.py."""

DATA = '''
# Kata ganti & sebutan | Pronouns & references
它|tā|ia (benda/hewan)|it
它们|tāmen|mereka (benda/hewan)|they (things/animals)
大家|dàjiā|semua orang|everyone
自己|zìjǐ|diri sendiri|oneself
咱|zán|kita (singkat)|we (short form)
咱们|zánmen|kita (termasuk lawan bicara)|we (inclusive)
人们|rénmen|orang-orang|people
有人|yǒu rén|ada orang; seseorang|someone
# Orang & hubungan | People & relationships
爱人|àiren|pasangan (suami/istri)|spouse
太太|tàitai|nyonya; istri|Mrs.; wife
同事|tóngshì|rekan kerja|colleague
老朋友|lǎo péngyou|teman lama|old friend
姓|xìng|bermarga; marga|to be surnamed; surname
姓名|xìngmíng|nama lengkap|full name
名|míng|nama; peringkat|name; place (in ranking)
大人|dàren|orang dewasa|adult
青年|qīngnián|pemuda|young person
青少年|qīngshàonián|remaja|teenager
少年|shàonián|anak muda (belasan tahun)|youngster
中年|zhōngnián|usia paruh baya|middle age
老年|lǎonián|usia lanjut|old age
好人|hǎorén|orang baik|good person
坏人|huàirén|orang jahat|bad person
主人|zhǔrén|tuan rumah; pemilik|host; owner
客人|kèrén|tamu|guest
顾客|gùkè|pelanggan|customer
旅客|lǚkè|penumpang; pelancong|passenger; traveler
游客|yóukè|wisatawan|tourist
行人|xíngrén|pejalan kaki|pedestrian
家庭|jiātíng|rumah tangga; keluarga|household
全家|quán jiā|seluruh keluarga|the whole family
家长|jiāzhǎng|orang tua murid; kepala keluarga|parent (of a pupil)
# Pekerjaan & jabatan | Jobs & positions
经理|jīnglǐ|manajer|manager
司机|sījī|sopir|driver
商人|shāngrén|pedagang; pebisnis|businessman
教师|jiàoshī|guru (resmi)|teacher (formal)
画家|huàjiā|pelukis|painter
作家|zuòjiā|penulis; pengarang|writer
科学家|kēxuéjiā|ilmuwan|scientist
明星|míngxīng|bintang (selebriti)|celebrity
校长|xiàozhǎng|kepala sekolah; rektor|principal
院长|yuànzhǎng|direktur (rumah sakit/institut)|head of an institute
市长|shìzhǎng|wali kota|mayor
班长|bānzhǎng|ketua kelas|class monitor
队长|duìzhǎng|kapten tim|team captain
组长|zǔzhǎng|ketua kelompok|group leader
留学生|liúxuéshēng|mahasiswa asing|international student
考生|kǎoshēng|peserta ujian|exam candidate
# Tubuh & kesehatan HSK 2 | HSK 2 body & health
头|tóu|kepala|head
头发|tóufa|rambut|hair
脸|liǎn|wajah|face
眼睛|yǎnjing|mata|eye
眼|yǎn|mata (singkat)|eye (short form)
嘴|zuǐ|mulut|mouth (lips)
腿|tuǐ|tungkai; paha|leg
脚|jiǎo|kaki (telapak)|foot
个子|gèzi|tinggi badan; postur|height; build
全身|quánshēn|sekujur tubuh|the whole body
健康|jiànkāng|sehat; kesehatan|healthy; health
疼|téng|sakit (nyeri)|sore; to ache
舒服|shūfu|nyaman; enak badan|comfortable; feeling well
难受|nánshòu|tidak enak badan; susah hati|unwell; miserable
药|yào|obat|medicine
药片|yàopiàn|tablet obat|pill
药水|yàoshuǐ|obat cair|liquid medicine
药店|yàodiàn|apotek|pharmacy
检查|jiǎnchá|memeriksa|to examine
住院|zhù yuàn|dirawat inap|to be hospitalized
出院|chū yuàn|keluar dari rumah sakit|to leave hospital
中医|zhōngyī|pengobatan Tiongkok|traditional Chinese medicine
西医|xīyī|kedokteran Barat|Western medicine
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
