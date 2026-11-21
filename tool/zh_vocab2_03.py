# -*- coding: utf-8 -*-
"""Kosakata HSK 2 — makanan, rumah & benda. Format: lihat zh_vocab2_01.py."""

DATA = '''
# Makanan & minuman HSK 2 | HSK 2 food & drinks
米|mǐ|beras|uncooked rice
饺子|jiǎozi|pangsit (jiaozi)|dumplings
鱼|yú|ikan|fish
鸡|jī|ayam|chicken
蛋|dàn|telur (singkat)|egg (short form)
酒|jiǔ|minuman beralkohol|alcohol; liquor
油|yóu|minyak|oil
食物|shíwù|makanan (bahan)|food (foodstuff)
快餐|kuàicān|makanan cepat saji|fast food
方便面|fāngbiànmiàn|mi instan|instant noodles
早餐|zǎocān|sarapan (resmi)|breakfast (formal)
午餐|wǔcān|makan siang (resmi)|lunch (formal)
晚餐|wǎncān|makan malam (resmi)|dinner (formal)
中餐|zhōngcān|masakan Tiongkok|Chinese food
西餐|xīcān|masakan Barat|Western food
外卖|wàimài|pesan antar makanan|food delivery
味道|wèidao|rasa|taste; flavor
饱|bǎo|kenyang|full (after eating)
熟|shú|matang; akrab|ripe; cooked; familiar
做饭|zuò fàn|memasak nasi; masak|to cook a meal
干杯|gān bēi|bersulang!|cheers!
请客|qǐng kè|mentraktir|to treat (sb to a meal)
# Di restoran & toko | At restaurants & shops
菜单|càidān|menu|menu
碗|wǎn|mangkuk|bowl
筷子|kuàizi|sumpit|chopsticks
瓶子|píngzi|botol|bottle
饭馆|fànguǎn|rumah makan|restaurant
酒店|jiǔdiàn|hotel|hotel
店|diàn|kedai|store (small shop)
超市|chāoshì|supermarket|supermarket
卡|kǎ|kartu; macet (tersendat)|card; stuck
银行卡|yínhángkǎ|kartu ATM|bank card
信用卡|xìnyòngkǎ|kartu kredit|credit card
礼物|lǐwù|hadiah|gift
# Rumah & benda HSK 2 | HSK 2 home & things
椅子|yǐzi|kursi|chair
鞋|xié|sepatu|shoe
球鞋|qiúxié|sepatu olahraga|sneakers
大衣|dàyī|mantel|overcoat
照片|zhàopiàn|foto|photo
灯|dēng|lampu|lamp; light
墙|qiáng|dinding|wall
院子|yuànzi|halaman rumah|yard; courtyard
住房|zhùfáng|tempat tinggal; perumahan|housing
洗衣机|xǐyījī|mesin cuci|washing machine
相机|xiàngjī|kamera|camera
手表|shǒubiǎo|jam tangan|wristwatch
表|biǎo|jam (tangan); tabel; formulir|watch; table; form
护照|hùzhào|paspor|passport
图片|túpiàn|gambar; foto|picture; image
画|huà|menggambar; lukisan|to draw; painting
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
