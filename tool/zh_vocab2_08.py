# -*- coding: utf-8 -*-
"""Kosakata HSK 2 — hal, gagasan & kehidupan. Format: lihat zh_vocab2_01.py."""

DATA = '''
# Cara, alasan & hasil | Methods, reasons & results
办法|bànfǎ|jalan keluar; cara|way (to solve)
方法|fāngfǎ|metode|method
做法|zuòfǎ|cara mengerjakan|way of doing
方面|fāngmiàn|segi; aspek|aspect
道理|dàoli|alasan masuk akal|reason; sense
原因|yuányīn|penyebab|cause
目的|mùdì|tujuan|purpose
结果|jiéguǒ|hasil; ternyata|result; in the end
条件|tiáojiàn|syarat; kondisi|condition
特点|tèdiǎn|ciri khas|characteristic
作用|zuòyòng|fungsi; peran|function; role
重点|zhòngdiǎn|poin penting|key point
中心|zhōngxīn|pusat|center
部分|bùfen|bagian|part
机会|jīhuì|kesempatan|opportunity
好处|hǎochu|manfaat|benefit
坏处|huàichu|kerugian; sisi buruk|harm; downside
好事|hǎoshì|hal baik|good thing
事情|shìqing|perkara; urusan|thing; business
样子|yàngzi|rupa; tampaknya|appearance; look
大小|dàxiǎo|ukuran|size
水平|shuǐpíng|tingkat (kemampuan)|level (of ability)
# Pendapat & sikap | Opinions & attitudes
看法|kànfǎ|pandangan|view
观点|guāndiǎn|sudut pandang|viewpoint
角度|jiǎodù|sudut (pandang/geometri)|angle
想法|xiǎngfǎ|ide; pikiran|idea; thinking
意见|yìjiàn|pendapat; keberatan|opinion; objection
态度|tàidu|sikap|attitude
习惯|xíguàn|kebiasaan; terbiasa|habit; to be used to
行为|xíngwéi|perilaku|behavior
行动|xíngdòng|tindakan; bertindak|action; to act
信心|xìnxīn|rasa percaya diri|confidence
理想|lǐxiǎng|cita-cita; ideal|ideal; dream
心情|xīnqíng|suasana hati|mood
心里|xīnli|dalam hati|in one's heart
心中|xīnzhōng|di dalam benak|in one's mind
# Kehidupan & masyarakat | Life & society
生活|shēnghuó|kehidupan; hidup|life; to live
爱情|àiqíng|cinta (asmara)|romantic love
收入|shōurù|pendapatan|income
人口|rénkǒu|penduduk|population
人数|rénshù|jumlah orang|number of people
声音|shēngyīn|suara|voice; sound
响|xiǎng|berbunyi; nyaring|to ring; loud
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
