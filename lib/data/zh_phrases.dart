// Ungkapan Mandarin (sehari-hari, kerja, chengyu & peribahasa) untuk
// halaman Materi. DIBUAT OTOMATIS oleh tool/gen_zh_phrases.py; jangan
// edit manual. Memakai JVocab: `kana` = hanzi, `romaji` = pinyin.
import 'jlpt_vocab.dart';

/// Judul grup untuk [zhPhraseVocab].
const List<Map<String, String>> zhPhraseVocabGroups = [
  {'id': 'Sapaan & kabar', 'en': 'Greetings & how are you'},
  {'id': 'Perkenalan', 'en': 'Introductions'},
  {'id': 'Terima kasih & maaf', 'en': 'Thanks & apologies'},
  {'id': 'Setuju & tidak setuju', 'en': 'Agreeing & disagreeing'},
  {'id': 'Minta tolong & menawarkan', 'en': 'Asking for & offering help'},
  {'id': 'Perasaan & reaksi', 'en': 'Feelings & reactions'},
  {'id': 'Belanja', 'en': 'Shopping'},
  {'id': 'Restoran', 'en': 'Restaurants'},
  {'id': 'Arah & transportasi', 'en': 'Directions & transport'},
  {'id': 'Telepon, janji & waktu', 'en': 'Phone calls, appointments & time'},
];

/// Ungkapan sehari-hari yang paling sering dipakai.
const List<JVocab> zhPhraseVocab = [
  JVocab('你好吗', 'nǐ hǎo ma', {'id': 'apa kabar?', 'en': 'how are you?'}, 0),
  JVocab('我很好', 'wǒ hěn hǎo', {
    'id': 'saya baik-baik saja',
    'en': 'I\'m fine',
  }, 0),
  JVocab('最近怎么样', 'zuìjìn zěnmeyàng', {
    'id': 'gimana kabarmu akhir-akhir ini?',
    'en': 'how have you been lately?',
  }, 0),
  JVocab('还可以', 'hái kěyǐ', {'id': 'lumayan', 'en': 'not bad'}, 0),
  JVocab('好久不见', 'hǎojiǔ bú jiàn', {
    'id': 'lama tidak bertemu',
    'en': 'long time no see',
  }, 0),
  JVocab('吃饭了吗', 'chīfàn le ma', {
    'id': 'sudah makan? (sapaan akrab)',
    'en': 'have you eaten? (friendly greeting)',
  }, 0),
  JVocab('大家好', 'dàjiā hǎo', {
    'id': 'halo semuanya',
    'en': 'hello everyone',
  }, 0),
  JVocab('晚安', 'wǎn\'ān', {'id': 'selamat tidur', 'en': 'good night'}, 0),
  JVocab('明天见', 'míngtiān jiàn', {
    'id': 'sampai besok',
    'en': 'see you tomorrow',
  }, 0),
  JVocab('回头见', 'huítóu jiàn', {
    'id': 'sampai nanti',
    'en': 'see you later',
  }, 0),
  JVocab('一路平安', 'yílù píng\'ān', {
    'id': 'selamat jalan, hati-hati di jalan',
    'en': 'have a safe trip',
  }, 0),
  JVocab('请问您贵姓', 'qǐngwèn nín guìxìng', {
    'id': 'boleh tahu marga Anda?',
    'en': 'may I ask your surname?',
  }, 1),
  JVocab('我姓王', 'wǒ xìng Wáng', {
    'id': 'marga saya Wang',
    'en': 'my surname is Wang',
  }, 1),
  JVocab('你是哪国人', 'nǐ shì nǎ guó rén', {
    'id': 'kamu dari negara mana?',
    'en': 'which country are you from?',
  }, 1),
  JVocab('你住在哪儿', 'nǐ zhù zài nǎr', {
    'id': 'kamu tinggal di mana?',
    'en': 'where do you live?',
  }, 1),
  JVocab('你今年多大', 'nǐ jīnnián duō dà', {
    'id': 'tahun ini umurmu berapa?',
    'en': 'how old are you this year?',
  }, 1),
  JVocab('你做什么工作', 'nǐ zuò shénme gōngzuò', {
    'id': 'kamu kerja apa?',
    'en': 'what do you do for work?',
  }, 1),
  JVocab('我来介绍一下', 'wǒ lái jièshào yíxià', {
    'id': 'saya perkenalkan',
    'en': 'let me introduce',
  }, 1),
  JVocab('这是我的朋友', 'zhè shì wǒ de péngyou', {
    'id': 'ini teman saya',
    'en': 'this is my friend',
  }, 1),
  JVocab('很高兴认识你', 'hěn gāoxìng rènshi nǐ', {
    'id': 'senang bertemu denganmu',
    'en': 'glad to meet you',
  }, 1),
  JVocab('请多关照', 'qǐng duō guānzhào', {
    'id': 'mohon bimbingannya',
    'en': 'please take care of me',
  }, 1),
  JVocab('非常感谢', 'fēicháng gǎnxiè', {
    'id': 'terima kasih banyak',
    'en': 'thank you very much',
  }, 2),
  JVocab('谢谢你的帮助', 'xièxie nǐ de bāngzhù', {
    'id': 'terima kasih atas bantuanmu',
    'en': 'thanks for your help',
  }, 2),
  JVocab('不用谢', 'búyòng xiè', {
    'id': 'tidak usah berterima kasih',
    'en': 'no need to thank me',
  }, 2),
  JVocab('别客气', 'bié kèqi', {
    'id': 'jangan sungkan',
    'en': 'don\'t mention it',
  }, 2),
  JVocab('太麻烦你了', 'tài máfan nǐ le', {
    'id': 'maaf sudah merepotkan',
    'en': 'sorry to trouble you',
  }, 2),
  JVocab('不好意思', 'bù hǎoyìsi', {
    'id': 'permisi; maaf (ringan)',
    'en': 'excuse me; sorry (mild)',
  }, 2),
  JVocab('真抱歉', 'zhēn bàoqiàn', {
    'id': 'sungguh minta maaf',
    'en': 'I\'m truly sorry',
  }, 2),
  JVocab('没问题', 'méi wèntí', {
    'id': 'tidak ada masalah',
    'en': 'no problem',
  }, 2),
  JVocab('好的', 'hǎo de', {'id': 'oke, baik', 'en': 'okay'}, 3),
  JVocab('没错', 'méi cuò', {'id': 'betul sekali', 'en': 'exactly right'}, 3),
  JVocab('我同意', 'wǒ tóngyì', {'id': 'saya setuju', 'en': 'I agree'}, 3),
  JVocab('我不同意', 'wǒ bù tóngyì', {
    'id': 'saya tidak setuju',
    'en': 'I disagree',
  }, 3),
  JVocab('有道理', 'yǒu dàolǐ', {'id': 'masuk akal', 'en': 'that makes sense'}, 3),
  JVocab('可能吧', 'kěnéng ba', {'id': 'mungkin saja', 'en': 'maybe so'}, 3),
  JVocab('我觉得不是', 'wǒ juéde bú shì', {
    'id': 'menurut saya bukan',
    'en': 'I don\'t think so',
  }, 3),
  JVocab('当然可以', 'dāngrán kěyǐ', {
    'id': 'tentu boleh',
    'en': 'of course you can',
  }, 3),
  JVocab('算了吧', 'suàn le ba', {'id': 'sudahlah', 'en': 'forget it'}, 3),
  JVocab('随便', 'suíbiàn', {'id': 'terserah', 'en': 'whatever; up to you'}, 3),
  JVocab('请帮我一下', 'qǐng bāng wǒ yíxià', {
    'id': 'tolong bantu saya sebentar',
    'en': 'please give me a hand',
  }, 4),
  JVocab('可以帮我吗', 'kěyǐ bāng wǒ ma', {
    'id': 'bisa bantu saya?',
    'en': 'can you help me?',
  }, 4),
  JVocab('请等一下', 'qǐng děng yíxià', {
    'id': 'tolong tunggu sebentar',
    'en': 'please wait a moment',
  }, 4),
  JVocab('请问', 'qǐngwèn', {
    'id': 'permisi, mau tanya',
    'en': 'excuse me, may I ask',
  }, 4),
  JVocab('请进', 'qǐng jìn', {'id': 'silakan masuk', 'en': 'please come in'}, 4),
  JVocab('请坐', 'qǐng zuò', {'id': 'silakan duduk', 'en': 'please sit down'}, 4),
  JVocab('我来吧', 'wǒ lái ba', {'id': 'biar saya saja', 'en': 'let me do it'}, 4),
  JVocab('需要帮忙吗', 'xūyào bāngmáng ma', {
    'id': 'perlu bantuan?',
    'en': 'do you need help?',
  }, 4),
  JVocab('小心', 'xiǎoxīn', {'id': 'hati-hati', 'en': 'be careful'}, 4),
  JVocab('太好了', 'tài hǎo le', {'id': 'bagus sekali!', 'en': 'great!'}, 5),
  JVocab('真的吗', 'zhēn de ma', {'id': 'benarkah?', 'en': 'really?'}, 5),
  JVocab('加油', 'jiāyóu', {'id': 'semangat!', 'en': 'go for it!'}, 5),
  JVocab('没想到', 'méi xiǎngdào', {
    'id': 'tidak disangka',
    'en': 'I didn\'t expect that',
  }, 5),
  JVocab('好可惜', 'hǎo kěxī', {'id': 'sayang sekali', 'en': 'what a pity'}, 5),
  JVocab('我很担心', 'wǒ hěn dānxīn', {
    'id': 'saya khawatir',
    'en': 'I\'m worried',
  }, 5),
  JVocab('别担心', 'bié dānxīn', {
    'id': 'jangan khawatir',
    'en': 'don\'t worry',
  }, 5),
  JVocab('真厉害', 'zhēn lìhai', {'id': 'hebat sekali', 'en': 'impressive!'}, 5),
  JVocab('真好玩儿', 'zhēn hǎowánr', {'id': 'seru sekali', 'en': 'so much fun'}, 5),
  JVocab('天哪', 'tiān na', {'id': 'astaga', 'en': 'oh my god'}, 5),
  JVocab('一共多少钱', 'yígòng duōshao qián', {
    'id': 'totalnya berapa?',
    'en': 'how much in total?',
  }, 6),
  JVocab('太贵了', 'tài guì le', {
    'id': 'terlalu mahal',
    'en': 'too expensive',
  }, 6),
  JVocab('便宜一点儿吧', 'piányi yìdiǎnr ba', {
    'id': 'kurangi sedikit dong',
    'en': 'make it a bit cheaper',
  }, 6),
  JVocab('可以试试吗', 'kěyǐ shìshi ma', {
    'id': 'boleh dicoba?',
    'en': 'can I try it on?',
  }, 6),
  JVocab('有大一点儿的吗', 'yǒu dà yìdiǎnr de ma', {
    'id': 'ada yang lebih besar?',
    'en': 'do you have a bigger one?',
  }, 6),
  JVocab('我要这个', 'wǒ yào zhège', {
    'id': 'saya mau yang ini',
    'en': 'I\'ll take this one',
  }, 6),
  JVocab('我只是看看', 'wǒ zhǐshì kànkan', {
    'id': 'saya cuma lihat-lihat',
    'en': 'I\'m just looking',
  }, 6),
  JVocab('可以用微信付吗', 'kěyǐ yòng Wēixìn fù ma', {
    'id': 'bisa bayar pakai WeChat?',
    'en': 'can I pay with WeChat?',
  }, 6),
  JVocab('打折吗', 'dǎzhé ma', {
    'id': 'ada diskon?',
    'en': 'is there a discount?',
  }, 6),
  JVocab('我们要点菜', 'wǒmen yào diǎn cài', {
    'id': 'kami mau pesan makanan',
    'en': 'we\'d like to order',
  }, 7),
  JVocab('请给我菜单', 'qǐng gěi wǒ càidān', {
    'id': 'tolong minta menunya',
    'en': 'the menu, please',
  }, 7),
  JVocab('有清真菜吗', 'yǒu qīngzhēn cài ma', {
    'id': 'ada makanan halal?',
    'en': 'is there halal food?',
  }, 7),
  JVocab('我不吃猪肉', 'wǒ bù chī zhūròu', {
    'id': 'saya tidak makan daging babi',
    'en': 'I don\'t eat pork',
  }, 7),
  JVocab('我不吃辣', 'wǒ bù chī là', {
    'id': 'saya tidak makan pedas',
    'en': 'I don\'t eat spicy food',
  }, 7),
  JVocab('来一杯茶', 'lái yì bēi chá', {
    'id': 'minta teh satu gelas',
    'en': 'a cup of tea, please',
  }, 7),
  JVocab('买单', 'mǎidān', {'id': 'minta bon', 'en': 'the bill, please'}, 7),
  JVocab('打包', 'dǎbāo', {'id': 'dibungkus', 'en': 'to pack to go'}, 7),
  JVocab('我吃饱了', 'wǒ chī bǎo le', {
    'id': 'saya sudah kenyang',
    'en': 'I\'m full',
  }, 7),
  JVocab('我吃素', 'wǒ chī sù', {
    'id': 'saya vegetarian',
    'en': 'I\'m vegetarian',
  }, 7),
  JVocab('地铁站在哪儿', 'dìtiězhàn zài nǎr', {
    'id': 'stasiun subway di mana?',
    'en': 'where is the subway station?',
  }, 8),
  JVocab('怎么走', 'zěnme zǒu', {
    'id': 'lewat mana?',
    'en': 'how do I get there?',
  }, 8),
  JVocab('离这儿远吗', 'lí zhèr yuǎn ma', {
    'id': 'jauh dari sini?',
    'en': 'is it far from here?',
  }, 8),
  JVocab('一直往前走', 'yìzhí wǎng qián zǒu', {
    'id': 'jalan lurus terus',
    'en': 'go straight ahead',
  }, 8),
  JVocab('往左拐', 'wǎng zuǒ guǎi', {'id': 'belok kiri', 'en': 'turn left'}, 8),
  JVocab('往右拐', 'wǎng yòu guǎi', {'id': 'belok kanan', 'en': 'turn right'}, 8),
  JVocab('我迷路了', 'wǒ mílù le', {'id': 'saya tersesat', 'en': 'I\'m lost'}, 8),
  JVocab('我要去机场', 'wǒ yào qù jīchǎng', {
    'id': 'saya mau ke bandara',
    'en': 'I want to go to the airport',
  }, 8),
  JVocab('在这儿停车', 'zài zhèr tíngchē', {
    'id': 'berhenti di sini',
    'en': 'stop here',
  }, 8),
  JVocab('到了吗', 'dào le ma', {
    'id': 'sudah sampai?',
    'en': 'are we there yet?',
  }, 8),
  JVocab('现在几点', 'xiànzài jǐ diǎn', {
    'id': 'sekarang jam berapa?',
    'en': 'what time is it now?',
  }, 9),
  JVocab('你什么时候有空', 'nǐ shénme shíhou yǒu kòng', {
    'id': 'kapan kamu ada waktu?',
    'en': 'when are you free?',
  }, 9),
  JVocab('我们几点见', 'wǒmen jǐ diǎn jiàn', {
    'id': 'kita ketemu jam berapa?',
    'en': 'what time shall we meet?',
  }, 9),
  JVocab('不见不散', 'bú jiàn bú sàn', {
    'id': 'pokoknya ketemu ya, saling tunggu',
    'en': 'be there, we\'ll wait for each other',
  }, 9),
  JVocab('我在路上', 'wǒ zài lùshang', {
    'id': 'saya sedang di jalan',
    'en': 'I\'m on my way',
  }, 9),
  JVocab('我马上到', 'wǒ mǎshàng dào', {
    'id': 'saya segera sampai',
    'en': 'I\'ll be right there',
  }, 9),
  JVocab('对不起我来晚了', 'duìbuqǐ wǒ lái wǎn le', {
    'id': 'maaf saya terlambat',
    'en': 'sorry I\'m late',
  }, 9),
  JVocab('请他回电话', 'qǐng tā huí diànhuà', {
    'id': 'tolong minta dia telepon balik',
    'en': 'please ask him to call back',
  }, 9),
  JVocab('你打错了', 'nǐ dǎ cuò le', {
    'id': 'salah sambung',
    'en': 'you have the wrong number',
  }, 9),
  JVocab('加个微信吧', 'jiā ge Wēixìn ba', {
    'id': 'tambah WeChat yuk',
    'en': 'let\'s add each other on WeChat',
  }, 9),
];

/// Judul grup untuk [zhWorkVocab].
const List<Map<String, String>> zhWorkVocabGroups = [
  {'id': 'Kantor & rapat', 'en': 'Office & meetings'},
  {'id': 'Pelanggan & bisnis', 'en': 'Customers & business'},
  {'id': 'Pabrik & keselamatan', 'en': 'Factory & safety'},
];

/// Ungkapan kantor, pelanggan & pabrik.
const List<JVocab> zhWorkVocab = [
  JVocab('我先走了', 'wǒ xiān zǒu le', {
    'id': 'saya pulang duluan',
    'en': 'I\'m heading off first',
  }, 0),
  JVocab('辛苦了', 'xīnkǔ le', {
    'id': 'terima kasih atas kerja kerasnya',
    'en': 'thanks for your hard work',
  }, 0),
  JVocab('今天要加班', 'jīntiān yào jiābān', {
    'id': 'hari ini harus lembur',
    'en': 'I have to work overtime today',
  }, 0),
  JVocab('我想请一天假', 'wǒ xiǎng qǐng yì tiān jià', {
    'id': 'saya mau izin sehari',
    'en': 'I\'d like a day off',
  }, 0),
  JVocab('开会了', 'kāihuì le', {
    'id': 'rapat dimulai',
    'en': 'the meeting is starting',
  }, 0),
  JVocab('我明白了', 'wǒ míngbai le', {
    'id': 'saya mengerti',
    'en': 'I see; got it',
  }, 0),
  JVocab('我马上去做', 'wǒ mǎshàng qù zuò', {
    'id': 'saya kerjakan sekarang',
    'en': 'I\'ll do it right away',
  }, 0),
  JVocab('请发邮件给我', 'qǐng fā yóujiàn gěi wǒ', {
    'id': 'tolong kirim email ke saya',
    'en': 'please email me',
  }, 0),
  JVocab('这个我不太清楚', 'zhège wǒ bú tài qīngchu', {
    'id': 'soal ini saya kurang tahu',
    'en': 'I\'m not too sure about this',
  }, 0),
  JVocab('我再确认一下', 'wǒ zài quèrèn yíxià', {
    'id': 'saya cek ulang dulu',
    'en': 'let me double-check',
  }, 0),
  JVocab('有什么问题吗', 'yǒu shénme wèntí ma', {
    'id': 'ada pertanyaan?',
    'en': 'any questions?',
  }, 0),
  JVocab('欢迎光临', 'huānyíng guānglín', {
    'id': 'selamat datang (di toko)',
    'en': 'welcome (to our shop)',
  }, 1),
  JVocab('请稍等', 'qǐng shāo děng', {
    'id': 'mohon tunggu sebentar',
    'en': 'one moment, please',
  }, 1),
  JVocab('您需要什么', 'nín xūyào shénme', {
    'id': 'Anda perlu apa?',
    'en': 'what do you need?',
  }, 1),
  JVocab('这是我的名片', 'zhè shì wǒ de míngpiàn', {
    'id': 'ini kartu nama saya',
    'en': 'here is my business card',
  }, 1),
  JVocab('合作愉快', 'hézuò yúkuài', {
    'id': 'semoga kerja samanya lancar',
    'en': 'here\'s to a pleasant cooperation',
  }, 1),
  JVocab('期待您的回复', 'qīdài nín de huífù', {
    'id': 'menantikan balasan Anda',
    'en': 'looking forward to your reply',
  }, 1),
  JVocab('我们可以谈谈价格吗', 'wǒmen kěyǐ tántan jiàgé ma', {
    'id': 'bisa kita bicarakan harganya?',
    'en': 'can we discuss the price?',
  }, 1),
  JVocab('什么时候交货', 'shénme shíhou jiāohuò', {
    'id': 'kapan barangnya dikirim?',
    'en': 'when is the delivery?',
  }, 1),
  JVocab('欢迎下次再来', 'huānyíng xià cì zài lái', {
    'id': 'silakan datang lagi',
    'en': 'please come again',
  }, 1),
  JVocab('祝生意兴隆', 'zhù shēngyi xīnglóng', {
    'id': 'semoga usahanya laris',
    'en': 'wishing your business prosperity',
  }, 1),
  JVocab('注意安全', 'zhùyì ānquán', {
    'id': 'utamakan keselamatan',
    'en': 'mind your safety',
  }, 2),
  JVocab('戴好安全帽', 'dài hǎo ānquánmào', {
    'id': 'pakai helm pengaman dengan benar',
    'en': 'put your safety helmet on',
  }, 2),
  JVocab('机器坏了', 'jīqì huài le', {
    'id': 'mesinnya rusak',
    'en': 'the machine is broken',
  }, 2),
  JVocab('这个怎么用', 'zhège zěnme yòng', {
    'id': 'ini cara pakainya bagaimana?',
    'en': 'how do I use this?',
  }, 2),
  JVocab('请教我一下', 'qǐng jiāo wǒ yíxià', {
    'id': 'tolong ajari saya',
    'en': 'please show me how',
  }, 2),
  JVocab('我受伤了', 'wǒ shòushāng le', {
    'id': 'saya terluka',
    'en': 'I\'m injured',
  }, 2),
  JVocab('今天几点下班', 'jīntiān jǐ diǎn xiàbān', {
    'id': 'hari ini pulang jam berapa?',
    'en': 'what time do we finish today?',
  }, 2),
  JVocab('我做完了', 'wǒ zuò wán le', {
    'id': 'saya sudah selesai',
    'en': 'I\'ve finished',
  }, 2),
  JVocab('休息一下吧', 'xiūxi yíxià ba', {
    'id': 'istirahat sebentar yuk',
    'en': 'let\'s take a short break',
  }, 2),
  JVocab('请再检查一遍', 'qǐng zài jiǎnchá yí biàn', {
    'id': 'tolong periksa sekali lagi',
    'en': 'please check it once more',
  }, 2),
];

/// Judul grup untuk [zhIdiomVocab].
const List<Map<String, String>> zhIdiomVocabGroups = [
  {'id': 'Chengyu populer (成语)', 'en': 'Popular chengyu (成语)'},
  {'id': 'Peribahasa & kata bijak (俗语)', 'en': 'Proverbs & sayings (俗语)'},
];

/// Chengyu (成语) & peribahasa (俗语) populer.
const List<JVocab> zhIdiomVocab = [
  JVocab('马马虎虎', 'mǎmǎhūhū', {
    'id': 'biasa saja; asal-asalan',
    'en': 'so-so; careless',
  }, 0),
  JVocab('一举两得', 'yìjǔ liǎngdé', {
    'id': 'sekali dayung dua pulau terlampaui',
    'en': 'kill two birds with one stone',
  }, 0),
  JVocab('入乡随俗', 'rùxiāng suísú', {
    'id': 'di mana bumi dipijak, di situ langit dijunjung',
    'en': 'when in Rome, do as the Romans do',
  }, 0),
  JVocab('一路顺风', 'yílù shùnfēng', {
    'id': 'semoga perjalanan lancar',
    'en': 'bon voyage',
  }, 0),
  JVocab('半途而废', 'bàntú ér fèi', {
    'id': 'berhenti di tengah jalan',
    'en': 'to give up halfway',
  }, 0),
  JVocab('画蛇添足', 'huà shé tiān zú', {
    'id': 'menambah hal tak perlu sampai merusak',
    'en': 'to ruin something by overdoing it',
  }, 0),
  JVocab('对牛弹琴', 'duì niú tán qín', {
    'id': 'bicara pada yang tak paham (sia-sia)',
    'en': 'to cast pearls before swine',
  }, 0),
  JVocab('守株待兔', 'shǒu zhū dài tù', {
    'id': 'menunggu keberuntungan tanpa usaha',
    'en': 'to wait idly for a windfall',
  }, 0),
  JVocab('自言自语', 'zì yán zì yǔ', {
    'id': 'bicara sendiri',
    'en': 'to talk to oneself',
  }, 0),
  JVocab('一心一意', 'yìxīn yíyì', {
    'id': 'sepenuh hati',
    'en': 'wholeheartedly',
  }, 0),
  JVocab('人山人海', 'rén shān rén hǎi', {
    'id': 'lautan manusia',
    'en': 'huge crowds',
  }, 0),
  JVocab('千方百计', 'qiānfāng bǎijì', {
    'id': 'dengan segala cara',
    'en': 'by every possible means',
  }, 0),
  JVocab('十全十美', 'shíquán shíměi', {
    'id': 'sempurna tanpa cela',
    'en': 'perfect in every way',
  }, 0),
  JVocab('三心二意', 'sānxīn èryì', {
    'id': 'setengah hati; plin-plan',
    'en': 'half-hearted',
  }, 0),
  JVocab('七上八下', 'qīshàng bāxià', {
    'id': 'hati tidak tenang, deg-degan',
    'en': 'on tenterhooks',
  }, 0),
  JVocab('一模一样', 'yìmú yíyàng', {
    'id': 'persis sama',
    'en': 'exactly alike',
  }, 0),
  JVocab('乱七八糟', 'luànqībāzāo', {'id': 'berantakan', 'en': 'in a mess'}, 0),
  JVocab('井底之蛙', 'jǐng dǐ zhī wā', {
    'id': 'katak dalam tempurung',
    'en': 'a frog in a well',
  }, 0),
  JVocab('亡羊补牢', 'wáng yáng bǔ láo', {
    'id': 'memperbaiki setelah rugi, masih belum terlambat',
    'en': 'mend the pen after losing a sheep',
  }, 0),
  JVocab('塞翁失马', 'sài wēng shī mǎ', {
    'id': 'musibah bisa jadi berkah',
    'en': 'a blessing in disguise',
  }, 0),
  JVocab('熟能生巧', 'shú néng shēng qiǎo', {
    'id': 'alah bisa karena biasa',
    'en': 'practice makes perfect',
  }, 0),
  JVocab('半信半疑', 'bàn xìn bàn yí', {
    'id': 'setengah percaya',
    'en': 'half-believing',
  }, 0),
  JVocab('目瞪口呆', 'mù dèng kǒu dāi', {
    'id': 'tercengang',
    'en': 'dumbstruck',
  }, 0),
  JVocab('津津有味', 'jīnjīn yǒu wèi', {
    'id': 'dengan lahap; asyik',
    'en': 'with great relish',
  }, 0),
  JVocab('活到老学到老', 'huó dào lǎo xué dào lǎo', {
    'id': 'belajar sepanjang hayat',
    'en': 'never too old to learn',
  }, 1),
  JVocab('百闻不如一见', 'bǎi wén bùrú yí jiàn', {
    'id': 'sekali melihat lebih baik dari seratus kali mendengar',
    'en': 'seeing is believing',
  }, 1),
  JVocab('有志者事竟成', 'yǒu zhì zhě shì jìng chéng', {
    'id': 'di mana ada kemauan, di situ ada jalan',
    'en': 'where there\'s a will, there\'s a way',
  }, 1),
  JVocab('三人行必有我师', 'sān rén xíng bì yǒu wǒ shī', {
    'id': 'setiap orang bisa jadi guru kita',
    'en': 'everyone has something to teach us',
  }, 1),
  JVocab('千里之行始于足下', 'qiān lǐ zhī xíng shǐ yú zú xià', {
    'id': 'perjalanan jauh dimulai dari satu langkah',
    'en': 'a journey of a thousand miles begins with one step',
  }, 1),
  JVocab('不到长城非好汉', 'bú dào Chángchéng fēi hǎohàn', {
    'id': 'belum ke Tembok Besar belum jadi jagoan',
    'en': 'you\'re not a hero until you\'ve reached the Great Wall',
  }, 1),
  JVocab('好事多磨', 'hǎoshì duō mó', {
    'id': 'hal baik butuh perjuangan',
    'en': 'good things come with trouble',
  }, 1),
  JVocab('一分钱一分货', 'yì fēn qián yì fēn huò', {
    'id': 'ada harga ada rupa',
    'en': 'you get what you pay for',
  }, 1),
  JVocab('天下没有不散的筵席', 'tiānxià méiyǒu bú sàn de yánxí', {
    'id': 'setiap pertemuan pasti ada perpisahan',
    'en': 'all good things must come to an end',
  }, 1),
  JVocab('说曹操曹操到', 'shuō Cáo Cāo Cáo Cāo dào', {
    'id': 'panjang umur! (orangnya datang saat dibicarakan)',
    'en': 'speak of the devil',
  }, 1),
  JVocab('笨鸟先飞', 'bèn niǎo xiān fēi', {
    'id': 'yang lambat harus mulai lebih awal',
    'en': 'the slow bird should start early',
  }, 1),
  JVocab('在家靠父母出门靠朋友', 'zài jiā kào fùmǔ chūmén kào péngyou', {
    'id': 'di rumah andalkan orang tua, di rantau andalkan teman',
    'en': 'at home rely on parents, away rely on friends',
  }, 1),
];
