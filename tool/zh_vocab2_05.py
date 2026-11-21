# -*- coding: utf-8 -*-
"""Kosakata HSK 2 — tempat, arah, transportasi & alam. Format: lihat zh_vocab2_01.py."""

DATA = '''
# Tempat HSK 2 | HSK 2 places
银行|yínháng|bank|bank
公园|gōngyuán|taman|park
花园|huāyuán|kebun bunga|garden
动物园|dòngwùyuán|kebun binatang|zoo
广场|guǎngchǎng|alun-alun|square; plaza
办公室|bàngōngshì|kantor (ruangan)|office
公司|gōngsī|perusahaan|company
单位|dānwèi|instansi; satuan|work unit; unit
院|yuàn|halaman; lembaga|courtyard; institution
市|shì|kota|city
街|jiē|jalan (perkotaan)|street
道|dào|jalan; satuan untuk soal/pintu|road; measure word for questions
道路|dàolù|jalan (umum)|road; path
公路|gōnglù|jalan raya antarkota|highway
路边|lùbiān|pinggir jalan|roadside
停车场|tíngchēchǎng|tempat parkir|parking lot
地铁站|dìtiězhàn|stasiun MRT|subway station
海边|hǎibiān|tepi pantai|seaside
入口|rùkǒu|pintu masuk|entrance
出口|chūkǒu|pintu keluar; ekspor|exit; export
大门|dàmén|gerbang utama|main gate
外地|wàidì|daerah lain|other parts of the country
全国|quánguó|seluruh negeri|nationwide
国际|guójì|internasional|international
# Arah & posisi HSK 2 | HSK 2 directions & positions
北方|běifāng|wilayah utara|the north
南方|nánfāng|wilayah selatan|the south
东方|dōngfāng|timur; dunia Timur|the East
西方|xīfāng|barat; dunia Barat|the West
东北|dōngběi|timur laut|northeast
东南|dōngnán|tenggara|southeast
西北|xīběi|barat laut|northwest
西南|xīnán|barat daya|southwest
对面|duìmiàn|seberang; berhadapan|opposite; across
面前|miànqián|di hadapan|in front of (sb)
身边|shēnbiān|di samping (seseorang)|by one's side
里头|lǐtou|bagian dalam|inside
边|biān|sisi; tepi|side; edge
面|miàn|permukaan; sisi; mi|surface; side; noodles
以上|yǐshàng|di atas; lebih dari|above; more than
以下|yǐxià|di bawah; kurang dari|below; less than
以外|yǐwài|selain; di luar|apart from; outside of
到处|dàochù|di mana-mana|everywhere
方向|fāngxiàng|arah|direction
往|wǎng|ke arah|towards
向|xiàng|menghadap; kepada|to face; to (sb)
# Transportasi & perjalanan | Transport & travel
出租车|chūzūchē|taksi|taxi
公共汽车|gōnggòng qìchē|bus|bus
公交车|gōngjiāochē|bus kota|city bus
自行车|zìxíngchē|sepeda|bicycle
地铁|dìtiě|kereta bawah tanah (MRT)|subway
船|chuán|kapal; perahu|boat; ship
车辆|chēliàng|kendaraan (resmi)|vehicles (formal)
交通|jiāotōng|lalu lintas|traffic
骑|qí|menunggang|to ride (astride)
骑车|qí chē|naik sepeda/motor|to ride a bike
停|tíng|berhenti; parkir|to stop; to park
停车|tíng chē|memarkir mobil|to park a car
起飞|qǐfēi|lepas landas|to take off
出发|chūfā|berangkat|to set off
旅行|lǚxíng|bepergian|to travel
旅游|lǚyóu|berwisata|to go sightseeing
出国|chū guó|pergi ke luar negeri|to go abroad
回国|huí guó|pulang ke negeri asal|to return to one's country
出门|chū mén|keluar rumah|to leave home
问路|wèn lù|bertanya arah jalan|to ask the way
# Alam & cuaca HSK 2 | HSK 2 nature & weather
雪|xuě|salju|snow
下雪|xià xuě|turun salju|to snow
太阳|tàiyáng|matahari|sun
月亮|yuèliang|bulan (di langit)|moon
星星|xīngxing|bintang (di langit)|star
云|yún|awan|cloud
多云|duōyún|berawan|cloudy
晴|qíng|cerah|clear (weather)
晴天|qíngtiān|hari cerah|sunny day
阴|yīn|mendung|overcast
阴天|yīntiān|hari mendung|cloudy day
气温|qìwēn|suhu udara|air temperature
温度|wēndù|suhu|temperature
空气|kōngqì|udara|air
气|qì|gas; napas; membuat kesal|gas; breath; to annoy
吹|chuī|meniup; bertiup|to blow
天上|tiānshang|di langit|in the sky
地球|dìqiú|bumi|the Earth
大自然|dàzìrán|alam semesta; alam|nature
海|hǎi|laut|sea
大海|dàhǎi|samudra|ocean
河|hé|sungai|river
湖|hú|danau|lake
草|cǎo|rumput|grass
草地|cǎodì|padang rumput|lawn; meadow
动物|dòngwù|hewan|animal
狗|gǒu|anjing|dog
猫|māo|kucing|cat
鸟|niǎo|burung|bird
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
