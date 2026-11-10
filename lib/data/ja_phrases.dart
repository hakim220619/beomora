// Ungkapan Jepang (sehari-hari, aizuchi, onomatope, kerja & keigo,
// idiom & peribahasa) untuk halaman Materi. DIBUAT OTOMATIS oleh
// tool/gen_ja_phrases.py; jangan edit manual.
import 'jlpt_vocab.dart';

/// Judul grup untuk [jaPhraseVocab].
const List<Map<String, String>> jaPhraseVocabGroups = [
  {'id': 'Keputusan & berubah pikiran', 'en': 'Decisions & changing your mind'},
  {'id': 'Setuju & tidak setuju', 'en': 'Agreeing & disagreeing'},
  {'id': 'Minta tolong & menawarkan', 'en': 'Asking for & offering help'},
  {
    'id': 'Maaf, terima kasih & menanggapinya',
    'en': 'Apologizing, thanking & responding',
  },
  {'id': 'Perasaan & reaksi', 'en': 'Feelings & reactions'},
  {
    'id': 'Basa-basi & memulai obrolan',
    'en': 'Small talk & starting a conversation',
  },
  {
    'id': 'Berpamitan & mengakhiri obrolan',
    'en': 'Saying goodbye & wrapping up',
  },
  {'id': 'Belanja & restoran', 'en': 'Shopping & restaurants'},
  {'id': 'Arah, transportasi & tempat', 'en': 'Directions, transport & places'},
  {'id': 'Telepon, janji & waktu', 'en': 'Phone calls, appointments & time'},
];

/// Ungkapan sehari-hari yang paling sering dipakai.
const List<JVocab> jaPhraseVocab = [
  JVocab('どっちでもいい', 'dotchi demo ii', {
    'id': 'terserah, yang mana saja boleh',
    'en': 'either one is fine',
  }, 0),
  JVocab('どちらでもかまいません', 'dochira demo kamaimasen', {
    'id': 'mana pun tidak masalah (sopan)',
    'en': 'either is fine with me (polite)',
  }, 0),
  JVocab('なんでもいい', 'nan demo ii', {
    'id': 'apa saja boleh',
    'en': 'anything is fine',
  }, 0),
  JVocab('まよってる', 'mayotteru', {
    'id': 'lagi bingung memilih',
    'en': 'I\'m torn',
  }, 0),
  JVocab('どれにしよう', 'dore ni shiyou', {
    'id': 'pilih yang mana ya',
    'en': 'which one should I pick?',
  }, 0),
  JVocab('どうしよう', 'dou shiyou', {
    'id': 'gimana nih',
    'en': 'what should I do?',
  }, 0),
  JVocab('どうする', 'dou suru', {
    'id': 'kamu mau gimana?',
    'en': 'what do you want to do?',
  }, 0),
  JVocab('～にします', '~ ni shimasu', {
    'id': 'saya pilih ～',
    'en': 'I\'ll go with ~',
  }, 0),
  JVocab('きめた', 'kimeta', {
    'id': 'sudah kuputuskan',
    'en': 'I\'ve made up my mind',
  }, 0),
  JVocab('まだきめてない', 'mada kimetenai', {
    'id': 'belum memutuskan',
    'en': 'I haven\'t decided yet',
  }, 0),
  JVocab('～ことにした', '~ koto ni shita', {
    'id': 'sudah memutuskan untuk ～',
    'en': 'I\'ve decided to ~',
  }, 0),
  JVocab('きがかわった', 'ki ga kawatta', {
    'id': 'berubah pikiran',
    'en': 'I changed my mind',
  }, 0),
  JVocab('やっぱりやめる', 'yappari yameru', {
    'id': 'nggak jadi deh',
    'en': 'I\'m calling it off after all',
  }, 0),
  JVocab('やめとく', 'yametoku', {
    'id': 'aku lewat dulu deh',
    'en': 'I\'ll pass',
  }, 0),
  JVocab('おまかせします', 'omakase shimasu', {
    'id': 'saya serahkan pada Anda',
    'en': 'I\'ll leave it up to you',
  }, 0),
  JVocab('まかせて', 'makasete', {
    'id': 'serahkan padaku',
    'en': 'leave it to me',
  }, 0),
  JVocab('かんがえておきます', 'kangaete okimasu', {
    'id': 'akan saya pertimbangkan (sering = menolak halus)',
    'en': 'I\'ll think about it (often a soft no)',
  }, 0),
  JVocab('ちょっとかんがえさせて', 'chotto kangaesasete', {
    'id': 'biar kupikir dulu',
    'en': 'let me think it over',
  }, 0),
  JVocab('やってみる', 'yatte miru', {
    'id': 'akan kucoba',
    'en': 'I\'ll give it a shot',
  }, 0),
  JVocab('やるしかない', 'yaru shika nai', {
    'id': 'mau tak mau harus dilakukan',
    'en': 'there\'s no choice but to do it',
  }, 0),
  JVocab('まあいいか', 'maa ii ka', {
    'id': 'ya sudahlah',
    'en': 'oh well, never mind',
  }, 0),
  JVocab('いいね', 'ii ne', {'id': 'bagus tuh', 'en': 'sounds good'}, 1),
  JVocab('いいんじゃない', 'ii n ja nai', {
    'id': 'boleh juga tuh',
    'en': 'seems fine to me',
  }, 1),
  JVocab('いいかんがえだね', 'ii kangae da ne', {
    'id': 'ide bagus',
    'en': 'good idea',
  }, 1),
  JVocab('いいとおもう', 'ii to omou', {
    'id': 'menurutku bagus',
    'en': 'I think it\'s good',
  }, 1),
  JVocab('わたしもそうおもいます', 'watashi mo sou omoimasu', {
    'id': 'saya juga berpikir begitu',
    'en': 'I think so too',
  }, 1),
  JVocab('そのとおり', 'sono toori', {'id': 'persis begitu', 'en': 'exactly'}, 1),
  JVocab('おっしゃるとおりです', 'ossharu toori desu', {
    'id': 'Anda benar sekali (sopan)',
    'en': 'you\'re absolutely right (polite)',
  }, 1),
  JVocab('ですよね', 'desu yo ne', {
    'id': 'iya, kan? (setuju sekali)',
    'en': 'right?! (strong agreement)',
  }, 1),
  JVocab('それな', 'sore na', {
    'id': 'nah, itu dia (slang)',
    'en': 'so true (slang)',
  }, 1),
  JVocab('わかるわかる', 'wakaru wakaru', {
    'id': 'aku ngerti banget rasanya',
    'en': 'I totally get it',
  }, 1),
  JVocab('まちがいない', 'machigai nai', {
    'id': 'pasti, tidak salah lagi',
    'en': 'no doubt about it',
  }, 1),
  JVocab('まあね', 'maa ne', {'id': 'ya, begitulah', 'en': 'well, sort of'}, 1),
  JVocab('べつにいいけど', 'betsu ni ii kedo', {
    'id': 'ya boleh sih (setengah hati)',
    'en': 'fine, I guess',
  }, 1),
  JVocab('そうかなあ', 'sou kanaa', {
    'id': 'masa sih? (ragu)',
    'en': 'I\'m not so sure',
  }, 1),
  JVocab('そうはおもわない', 'sou wa omowanai', {
    'id': 'aku nggak berpikir begitu',
    'en': 'I don\'t think so',
  }, 1),
  JVocab('ちょっとちがうとおもう', 'chotto chigau to omou', {
    'id': 'kurasa agak kurang tepat',
    'en': 'I don\'t think that\'s quite right',
  }, 1),
  JVocab('そうともかぎらない', 'sou tomo kagiranai', {
    'id': 'belum tentu begitu',
    'en': 'not necessarily',
  }, 1),
  JVocab('どうかとおもう', 'dou ka to omou', {
    'id': 'aku agak meragukannya',
    'en': 'I have my doubts about that',
  }, 1),
  JVocab('それはちょっと', 'sore wa chotto', {
    'id': 'itu agak... (menolak halus)',
    'en': 'that\'s a bit... (soft refusal)',
  }, 1),
  JVocab('なっとくできない', 'nattoku dekinai', {
    'id': 'aku nggak bisa terima',
    'en': 'I\'m not convinced',
  }, 1),
  JVocab('そうじゃなくて', 'sou ja nakute', {
    'id': 'bukan, maksudku...',
    'en': 'no, what I mean is...',
  }, 1),
  JVocab('てつだいましょうか', 'tetsudaimashou ka', {
    'id': 'boleh saya bantu?',
    'en': 'shall I help you?',
  }, 2),
  JVocab('なにかてつだうことある', 'nani ka tetsudau koto aru', {
    'id': 'ada yang bisa kubantu?',
    'en': 'anything I can help with?',
  }, 2),
  JVocab('もとうか', 'motou ka', {
    'id': 'mau kubawakan?',
    'en': 'want me to carry it?',
  }, 2),
  JVocab('～てもらえますか', '~ te moraemasu ka', {
    'id': 'bisakah Anda ～ untuk saya?',
    'en': 'could you ~ for me?',
  }, 2),
  JVocab('～てくれる', '~ te kureru', {
    'id': 'mau ～ (buatku)? (santai)',
    'en': 'will you ~ for me? (casual)',
  }, 2),
  JVocab('～ていただけませんか', '~ te itadakemasen ka', {
    'id': 'sudikah Anda ～? (sangat sopan)',
    'en': 'would you kindly ~?',
  }, 2),
  JVocab('～てもいいですか', '~ te mo ii desu ka', {
    'id': 'bolehkah saya ～?',
    'en': 'may I ~?',
  }, 2),
  JVocab('ちょっといいですか', 'chotto ii desu ka', {
    'id': 'boleh minta waktu sebentar?',
    'en': 'do you have a moment?',
  }, 2),
  JVocab('おねがいがあるんだけど', 'onegai ga aru n da kedo', {
    'id': 'aku mau minta tolong nih',
    'en': 'I have a favor to ask',
  }, 2),
  JVocab('てをかして', 'te o kashite', {
    'id': 'bantuin dong',
    'en': 'lend me a hand',
  }, 2),
  JVocab('たすけて', 'tasukete', {'id': 'tolong! (darurat)', 'en': 'help!'}, 2),
  JVocab('たのんだよ', 'tanonda yo', {
    'id': 'kuandalkan kamu ya',
    'en': 'I\'m counting on you',
  }, 2),
  JVocab('よろこんで', 'yorokonde', {
    'id': 'dengan senang hati',
    'en': 'with pleasure',
  }, 2),
  JVocab('いいよ', 'ii yo', {'id': 'boleh kok', 'en': 'sure, no problem'}, 2),
  JVocab('えんりょしないで', 'enryo shinaide', {
    'id': 'jangan sungkan',
    'en': 'don\'t be shy about it',
  }, 2),
  JVocab('えんりょなく', 'enryo naku', {
    'id': 'kalau begitu, saya terima tanpa sungkan',
    'en': 'then I\'ll gladly accept',
  }, 2),
  JVocab('けっこうです', 'kekkou desu', {
    'id': 'tidak usah, terima kasih',
    'en': 'no, thank you',
  }, 2),
  JVocab('ひとりでできる', 'hitori de dekiru', {
    'id': 'aku bisa sendiri',
    'en': 'I can do it myself',
  }, 2),
  JVocab('おきもちだけいただきます', 'okimochi dake itadakimasu', {
    'id': 'niatnya saja sudah cukup, terima kasih',
    'en': 'the thought alone is enough, thank you',
  }, 2),
  JVocab('むりしないで', 'muri shinaide', {
    'id': 'jangan memaksakan diri',
    'en': 'don\'t push yourself',
  }, 2),
  JVocab('もうしわけありません', 'moushiwake arimasen', {
    'id': 'mohon maaf sekali (sopan)',
    'en': 'I\'m terribly sorry',
  }, 3),
  JVocab('ごめんね', 'gomen ne', {
    'id': 'maaf ya (akrab)',
    'en': 'sorry (to a friend)',
  }, 3),
  JVocab('しつれいしました', 'shitsurei shimashita', {
    'id': 'maaf atas kekhilafan saya',
    'en': 'excuse me, my mistake',
  }, 3),
  JVocab('わるかった', 'warukatta', {'id': 'aku yang salah', 'en': 'my bad'}, 3),
  JVocab('わたしのせいです', 'watashi no sei desu', {
    'id': 'ini salah saya',
    'en': 'it\'s my fault',
  }, 3),
  JVocab('ゆるして', 'yurushite', {'id': 'maafin aku', 'en': 'forgive me'}, 3),
  JVocab('めいわくかけてごめん', 'meiwaku kakete gomen', {
    'id': 'maaf sudah merepotkan',
    'en': 'sorry for the trouble',
  }, 3),
  JVocab('おまたせしました', 'omatase shimashita', {
    'id': 'maaf membuat menunggu',
    'en': 'sorry to keep you waiting',
  }, 3),
  JVocab('にどとしません', 'nido to shimasen', {
    'id': 'tidak akan saya ulangi',
    'en': 'it won\'t happen again',
  }, 3),
  JVocab('きにしないで', 'ki ni shinaide', {
    'id': 'jangan dipikirkan',
    'en': 'don\'t worry about it',
  }, 3),
  JVocab('きにしてないよ', 'ki ni shitenai yo', {
    'id': 'aku nggak mempermasalahkannya',
    'en': 'it doesn\'t bother me',
  }, 3),
  JVocab('いえいえ', 'ie ie', {
    'id': 'ah, tidak apa-apa (merendah)',
    'en': 'oh, not at all',
  }, 3),
  JVocab('とんでもないです', 'tondemo nai desu', {
    'id': 'ah, sama sekali bukan apa-apa (sopan)',
    'en': 'don\'t mention it (polite)',
  }, 3),
  JVocab('おたがいさま', 'otagaisama', {
    'id': 'kita kan saling membantu',
    'en': 'we\'re in the same boat',
  }, 3),
  JVocab('たすかりました', 'tasukarimashita', {
    'id': 'sangat membantu, terima kasih',
    'en': 'that really helped',
  }, 3),
  JVocab('おかげさまで', 'okagesama de', {
    'id': 'berkat Anda (saya baik-baik saja)',
    'en': 'thanks to you',
  }, 3),
  JVocab('わざわざありがとう', 'wazawaza arigatou', {
    'id': 'makasih sudah repot-repot',
    'en': 'thanks for going out of your way',
  }, 3),
  JVocab('いつもありがとう', 'itsumo arigatou', {
    'id': 'makasih selalu ya',
    'en': 'thanks as always',
  }, 3),
  JVocab('かんしゃしています', 'kansha shite imasu', {
    'id': 'saya sangat berterima kasih',
    'en': 'I\'m truly grateful',
  }, 3),
  JVocab('おれいに', 'orei ni', {
    'id': 'sebagai tanda terima kasih',
    'en': 'as a thank-you',
  }, 3),
  JVocab('よかったね', 'yokatta ne', {
    'id': 'syukurlah ya (ikut senang)',
    'en': 'I\'m happy for you',
  }, 4),
  JVocab('ほっとした', 'hotto shita', {
    'id': 'lega rasanya',
    'en': 'what a relief',
  }, 4),
  JVocab('あぶなかった', 'abunakatta', {
    'id': 'nyaris saja',
    'en': 'that was close',
  }, 4),
  JVocab('やった', 'yatta', {'id': 'yes, berhasil!', 'en': 'yay, I did it!'}, 4),
  JVocab('さいこう', 'saikou', {'id': 'mantap banget', 'en': 'the best!'}, 4),
  JVocab('おもしろそう', 'omoshirosou', {
    'id': 'kayaknya seru',
    'en': 'sounds fun',
  }, 4),
  JVocab('たのしみにしています', 'tanoshimi ni shite imasu', {
    'id': 'saya menantikannya',
    'en': 'I\'m looking forward to it',
  }, 4),
  JVocab('いいなあ', 'ii naa', {'id': 'enaknya, jadi iri', 'en': 'lucky you'}, 4),
  JVocab('びっくりした', 'bikkuri shita', {
    'id': 'kaget aku',
    'en': 'you startled me',
  }, 4),
  JVocab('まじで', 'maji de', {
    'id': 'serius? (slang)',
    'en': 'seriously? (slang)',
  }, 4),
  JVocab('うそでしょう', 'uso deshou', {
    'id': 'bohong, kan?!',
    'en': 'you\'re kidding!',
  }, 4),
  JVocab('まさか', 'masaka', {
    'id': 'masa sih, tak mungkin!',
    'en': 'no way, it can\'t be!',
  }, 4),
  JVocab('しんじられない', 'shinjirarenai', {
    'id': 'sulit dipercaya',
    'en': 'unbelievable',
  }, 4),
  JVocab('やばい', 'yabai', {
    'id': 'gawat / gila keren (slang)',
    'en': 'oh no / awesome (slang)',
  }, 4),
  JVocab('ざんねんだったね', 'zannen datta ne', {
    'id': 'sayang sekali ya',
    'en': 'that\'s too bad',
  }, 4),
  JVocab('こまった', 'komatta', {'id': 'wah, repot nih', 'en': 'I\'m in a fix'}, 4),
  JVocab('しょうがない', 'shou ga nai', {
    'id': 'ya mau gimana lagi',
    'en': 'it can\'t be helped',
  }, 4),
  JVocab('めんどくさい', 'mendokusai', {
    'id': 'males, ribet',
    'en': 'what a pain',
  }, 4),
  JVocab('もうむり', 'mou muri', {
    'id': 'udah nggak kuat',
    'en': 'I can\'t take it anymore',
  }, 4),
  JVocab('むかつく', 'mukatsuku', {
    'id': 'nyebelin banget',
    'en': 'that\'s so annoying',
  }, 4),
  JVocab('さいあく', 'saiaku', {
    'id': 'payah banget, paling buruk',
    'en': 'the worst',
  }, 4),
  JVocab('おひさしぶりです', 'ohisashiburi desu', {
    'id': 'lama tidak bertemu (sopan)',
    'en': 'it\'s been a long time (polite)',
  }, 5),
  JVocab('げんきだった', 'genki datta', {
    'id': 'apa kabar selama ini?',
    'en': 'how have you been?',
  }, 5),
  JVocab('さいきんどう', 'saikin dou', {
    'id': 'gimana kabarmu belakangan ini?',
    'en': 'how are things lately?',
  }, 5),
  JVocab('おかわりありませんか', 'okawari arimasen ka', {
    'id': 'apakah Anda baik-baik saja selama ini? (sopan)',
    'en': 'have you been well? (polite)',
  }, 5),
  JVocab('あいかわらずだね', 'aikawarazu da ne', {
    'id': 'kamu masih sama seperti dulu ya',
    'en': 'you haven\'t changed a bit',
  }, 5),
  JVocab('どうしてた', 'doushiteta', {
    'id': 'ngapain aja selama ini?',
    'en': 'what have you been up to?',
  }, 5),
  JVocab('いいてんきですね', 'ii tenki desu ne', {
    'id': 'cuacanya cerah ya',
    'en': 'nice weather, isn\'t it?',
  }, 5),
  JVocab('あついですね', 'atsui desu ne', {
    'id': 'panas ya hari ini',
    'en': 'it\'s hot today, isn\'t it?',
  }, 5),
  JVocab('さむくなりましたね', 'samuku narimashita ne', {
    'id': 'sudah mulai dingin ya',
    'en': 'it\'s gotten cold, hasn\'t it?',
  }, 5),
  JVocab('よくふりますね', 'yoku furimasu ne', {
    'id': 'hujannya awet ya',
    'en': 'it keeps raining, doesn\'t it?',
  }, 5),
  JVocab('おしごとはなんですか', 'oshigoto wa nan desu ka', {
    'id': 'pekerjaannya apa?',
    'en': 'what do you do for a living?',
  }, 5),
  JVocab('どちらからですか', 'dochira kara desu ka', {
    'id': 'asalnya dari mana?',
    'en': 'where are you from?',
  }, 5),
  JVocab('しゅみはなんですか', 'shumi wa nan desu ka', {
    'id': 'hobinya apa?',
    'en': 'what are your hobbies?',
  }, 5),
  JVocab('にほんはながいんですか', 'nihon wa nagain desu ka', {
    'id': 'sudah lama tinggal di Jepang?',
    'en': 'have you been in Japan long?',
  }, 5),
  JVocab('しゅうまつなにしてた', 'shuumatsu nani shiteta', {
    'id': 'akhir pekan kemarin ngapain?',
    'en': 'what did you do over the weekend?',
  }, 5),
  JVocab('さいきんいそがしい', 'saikin isogashii', {
    'id': 'lagi sibuk akhir-akhir ini?',
    'en': 'busy these days?',
  }, 5),
  JVocab('ぐうぜんだね', 'guuzen da ne', {
    'id': 'kebetulan banget ya ketemu',
    'en': 'what a coincidence',
  }, 5),
  JVocab('ここよくくるの', 'koko yoku kuru no', {
    'id': 'sering ke sini?',
    'en': 'do you come here often?',
  }, 5),
  JVocab('まだまだです', 'mada mada desu', {
    'id': 'masih jauh dari bagus (merendah saat dipuji)',
    'en': 'I still have a long way to go',
  }, 5),
  JVocab('なんてよべばいい', 'nante yobeba ii', {
    'id': 'enaknya kupanggil apa?',
    'en': 'what should I call you?',
  }, 5),
  JVocab('またね', 'mata ne', {'id': 'sampai jumpa (santai)', 'en': 'see you'}, 6),
  JVocab('じゃあね', 'jaa ne', {'id': 'dah, duluan ya', 'en': 'bye then'}, 6),
  JVocab('またあした', 'mata ashita', {
    'id': 'sampai besok',
    'en': 'see you tomorrow',
  }, 6),
  JVocab('またこんど', 'mata kondo', {
    'id': 'lain kali ya',
    'en': 'some other time',
  }, 6),
  JVocab('またあとで', 'mata ato de', {
    'id': 'sampai nanti (hari ini juga)',
    'en': 'see you later today',
  }, 6),
  JVocab('そろそろいかないと', 'sorosoro ikanai to', {
    'id': 'aku harus pergi nih',
    'en': 'I should get going',
  }, 6),
  JVocab('そろそろかえります', 'sorosoro kaerimasu', {
    'id': 'saya pulang dulu ya',
    'en': 'I\'ll head home now',
  }, 6),
  JVocab('きをつけてね', 'ki o tsukete ne', {
    'id': 'hati-hati di jalan ya',
    'en': 'take care on your way',
  }, 6),
  JVocab('またれんらくする', 'mata renraku suru', {
    'id': 'nanti kukabari lagi',
    'en': 'I\'ll get in touch again',
  }, 6),
  JVocab('れんらくしてね', 'renraku shite ne', {
    'id': 'kabari aku ya',
    'en': 'keep in touch',
  }, 6),
  JVocab('ついたられんらくして', 'tsuitara renraku shite', {
    'id': 'kabari kalau sudah sampai',
    'en': 'text me when you get there',
  }, 6),
  JVocab('たのしかった', 'tanoshikatta', {
    'id': 'tadi seru banget',
    'en': 'that was fun',
  }, 6),
  JVocab('またあそぼう', 'mata asobou', {
    'id': 'main bareng lagi yuk',
    'en': 'let\'s hang out again',
  }, 6),
  JVocab('またあおうね', 'mata aou ne', {
    'id': 'kita ketemu lagi ya',
    'en': 'let\'s meet again',
  }, 6),
  JVocab('げんきでね', 'genki de ne', {
    'id': 'jaga diri baik-baik ya (perpisahan lama)',
    'en': 'take care of yourself',
  }, 6),
  JVocab('よいしゅうまつを', 'yoi shuumatsu o', {
    'id': 'selamat berakhir pekan',
    'en': 'have a nice weekend',
  }, 6),
  JVocab('みなさんによろしく', 'minasan ni yoroshiku', {
    'id': 'salam untuk semuanya',
    'en': 'say hi to everyone',
  }, 6),
  JVocab('おじゃましました', 'ojama shimashita', {
    'id': 'pamit dari rumah orang (maaf sudah merepotkan)',
    'en': 'thank you for having me',
  }, 6),
  JVocab('おだいじに', 'odaiji ni', {
    'id': 'semoga lekas sembuh',
    'en': 'get well soon',
  }, 6),
  JVocab('えきまでおくるよ', 'eki made okuru yo', {
    'id': 'kuantar sampai stasiun',
    'en': 'I\'ll walk you to the station',
  }, 6),
  JVocab('これください', 'kore kudasai', {
    'id': 'saya ambil yang ini',
    'en': 'I\'ll take this one',
  }, 7),
  JVocab('いくらですか', 'ikura desu ka', {
    'id': 'harganya berapa?',
    'en': 'how much is it?',
  }, 7),
  JVocab('みてるだけです', 'miteru dake desu', {
    'id': 'cuma lihat-lihat',
    'en': 'I\'m just looking',
  }, 7),
  JVocab('～はありますか', '~ wa arimasu ka', {
    'id': 'apakah ada ～? (di toko)',
    'en': 'do you have ~?',
  }, 7),
  JVocab('ほかのいろはありますか', 'hoka no iro wa arimasu ka', {
    'id': 'ada warna lain?',
    'en': 'do you have it in another color?',
  }, 7),
  JVocab('しちゃくしてもいいですか', 'shichaku shite mo ii desu ka', {
    'id': 'boleh saya coba bajunya?',
    'en': 'can I try this on?',
  }, 7),
  JVocab('サイズがあいません', 'saizu ga aimasen', {
    'id': 'ukurannya tidak pas',
    'en': 'it doesn\'t fit',
  }, 7),
  JVocab('カードでおねがいします', 'kaado de onegai shimasu', {
    'id': 'bayar pakai kartu',
    'en': 'by card, please',
  }, 7),
  JVocab('ふくろはいりません', 'fukuro wa irimasen', {
    'id': 'tidak perlu kantong',
    'en': 'I don\'t need a bag',
  }, 7),
  JVocab('レシートください', 'reshiito kudasai', {
    'id': 'minta struknya',
    'en': 'receipt, please',
  }, 7),
  JVocab('なんめいさまですか', 'nanmeisama desu ka', {
    'id': 'untuk berapa orang? (ucapan pelayan)',
    'en': 'how many in your party? (staff)',
  }, 7),
  JVocab('ふたりです', 'futari desu', {'id': 'berdua', 'en': 'two people'}, 7),
  JVocab('てんないでたべます', 'tennai de tabemasu', {
    'id': 'makan di sini',
    'en': 'for here, please',
  }, 7),
  JVocab('もちかえりでおねがいします', 'mochikaeri de onegai shimasu', {
    'id': 'dibungkus, dibawa pulang',
    'en': 'to go, please',
  }, 7),
  JVocab('おすすめはなんですか', 'osusume wa nan desu ka', {
    'id': 'menu rekomendasinya apa?',
    'en': 'what do you recommend?',
  }, 7),
  JVocab('ちゅうもんおねがいします', 'chuumon onegai shimasu', {
    'id': 'saya mau pesan',
    'en': 'I\'d like to order',
  }, 7),
  JVocab('おなじものをください', 'onaji mono o kudasai', {
    'id': 'saya pesan yang sama',
    'en': 'I\'ll have the same',
  }, 7),
  JVocab('～ぬきでおねがいします', '~ nuki de onegai shimasu', {
    'id': 'tanpa ～ ya',
    'en': 'without ~, please',
  }, 7),
  JVocab('おみずください', 'omizu kudasai', {
    'id': 'minta air putih',
    'en': 'water, please',
  }, 7),
  JVocab('おかいけいおねがいします', 'okaikei onegai shimasu', {
    'id': 'minta bonnya',
    'en': 'the check, please',
  }, 7),
  JVocab('べつべつでおねがいします', 'betsubetsu de onegai shimasu', {
    'id': 'bayarnya masing-masing',
    'en': 'separate checks, please',
  }, 7),
  JVocab('～はどこですか', '~ wa doko desu ka', {
    'id': '～ di mana?',
    'en': 'where is ~?',
  }, 8),
  JVocab('ここはどこですか', 'koko wa doko desu ka', {
    'id': 'ini di mana?',
    'en': 'where am I?',
  }, 8),
  JVocab('～はちかくにありますか', '~ wa chikaku ni arimasu ka', {
    'id': 'ada ～ di dekat sini?',
    'en': 'is there a ~ nearby?',
  }, 8),
  JVocab('ここからとおいですか', 'koko kara tooi desu ka', {
    'id': 'jauh dari sini?',
    'en': 'is it far from here?',
  }, 8),
  JVocab('あるいてなんぷんですか', 'aruite nanpun desu ka', {
    'id': 'berapa menit jalan kaki?',
    'en': 'how many minutes on foot?',
  }, 8),
  JVocab('どのくらいかかりますか', 'dono kurai kakarimasu ka', {
    'id': 'makan waktu berapa lama?',
    'en': 'how long does it take?',
  }, 8),
  JVocab('みちにまよいました', 'michi ni mayoimashita', {
    'id': 'saya tersesat',
    'en': 'I\'m lost',
  }, 8),
  JVocab('このみちであってますか', 'kono michi de attemasu ka', {
    'id': 'jalan ini sudah benar?',
    'en': 'am I going the right way?',
  }, 8),
  JVocab('まっすぐいってください', 'massugu itte kudasai', {
    'id': 'jalan lurus saja',
    'en': 'go straight ahead',
  }, 8),
  JVocab('みぎにまがってください', 'migi ni magatte kudasai', {
    'id': 'belok kanan',
    'en': 'turn right',
  }, 8),
  JVocab('なにかめじるしはありますか', 'nanika mejirushi wa arimasu ka', {
    'id': 'ada patokannya?',
    'en': 'is there a landmark?',
  }, 8),
  JVocab('～までおねがいします', '~ made onegai shimasu', {
    'id': 'tolong antar ke ～ (taksi)',
    'en': 'to ~, please (taxi)',
  }, 8),
  JVocab('ここでとめてください', 'koko de tomete kudasai', {
    'id': 'tolong berhenti di sini',
    'en': 'please stop here',
  }, 8),
  JVocab('～にとまりますか', '~ ni tomarimasu ka', {
    'id': '(kereta ini) berhenti di ～?',
    'en': 'does it stop at ~?',
  }, 8),
  JVocab('～いきはなんばんせんですか', '~ iki wa nanbansen desu ka', {
    'id': 'jalur berapa untuk arah ～?',
    'en': 'which platform for ~?',
  }, 8),
  JVocab('どこでのりかえますか', 'doko de norikaemasu ka', {
    'id': 'ganti kereta di mana?',
    'en': 'where do I transfer?',
  }, 8),
  JVocab('きっぷはどこでかえますか', 'kippu wa doko de kaemasu ka', {
    'id': 'tiketnya beli di mana?',
    'en': 'where can I buy a ticket?',
  }, 8),
  JVocab('つぎはなにえきですか', 'tsugi wa nani eki desu ka', {
    'id': 'stasiun berikutnya apa?',
    'en': 'what\'s the next station?',
  }, 8),
  JVocab('つぎでおります', 'tsugi de orimasu', {
    'id': 'saya turun di pemberhentian berikutnya',
    'en': 'I\'m getting off at the next stop',
  }, 8),
  JVocab('しゅうでんはなんじですか', 'shuuden wa nanji desu ka', {
    'id': 'kereta terakhir jam berapa?',
    'en': 'what time is the last train?',
  }, 8),
  JVocab('のりまちがえました', 'norimachigaemashita', {
    'id': 'saya salah naik kendaraan',
    'en': 'I got on the wrong one',
  }, 8),
  JVocab('いまだいじょうぶ', 'ima daijoubu', {
    'id': 'lagi bisa ngobrol sekarang?',
    'en': 'is now a good time?',
  }, 9),
  JVocab('じかんある', 'jikan aru', {'id': 'ada waktu?', 'en': 'are you free?'}, 9),
  JVocab('つごうはどうですか', 'tsugou wa dou desu ka', {
    'id': 'jadwalmu bagaimana?',
    'en': 'how\'s your schedule?',
  }, 9),
  JVocab('いつがいい', 'itsu ga ii', {
    'id': 'kapan enaknya?',
    'en': 'when works for you?',
  }, 9),
  JVocab('なんじにする', 'nanji ni suru', {
    'id': 'mau jam berapa?',
    'en': 'what time shall we make it?',
  }, 9),
  JVocab('どこでまちあわせる', 'doko de machiawaseru', {
    'id': 'ketemuan di mana?',
    'en': 'where should we meet up?',
  }, 9),
  JVocab('～はあいていますか', '~ wa aite imasu ka', {
    'id': 'apakah ～ kamu kosong?',
    'en': 'are you free on ~?',
  }, 9),
  JVocab('よていがあって', 'yotei ga atte', {
    'id': 'ada acara lain (menolak halus)',
    'en': 'I have other plans',
  }, 9),
  JVocab('よていをかえてもいいですか', 'yotei o kaete mo ii desu ka', {
    'id': 'boleh ganti jadwal?',
    'en': 'can we reschedule?',
  }, 9),
  JVocab('ドタキャン', 'dotakyan', {
    'id': 'batal mendadak',
    'en': 'last-minute cancellation',
  }, 9),
  JVocab('おくれます', 'okuremasu', {
    'id': 'saya akan terlambat',
    'en': 'I\'m going to be late',
  }, 9),
  JVocab('いまむかってる', 'ima mukatteru', {
    'id': 'lagi di jalan ke sana',
    'en': 'I\'m on my way',
  }, 9),
  JVocab('もうすぐつく', 'mou sugu tsuku', {
    'id': 'sebentar lagi sampai',
    'en': 'almost there',
  }, 9),
  JVocab('ついたよ', 'tsuita yo', {'id': 'aku sudah sampai', 'en': 'I\'m here'}, 9),
  JVocab('まにあわない', 'ma ni awanai', {
    'id': 'nggak bakal keburu',
    'en': 'I won\'t make it in time',
  }, 9),
  JVocab('かけなおします', 'kakenaoshimasu', {
    'id': 'nanti saya telepon balik',
    'en': 'I\'ll call you back',
  }, 9),
  JVocab('でんぱがわるい', 'denpa ga warui', {
    'id': 'sinyalnya jelek',
    'en': 'bad reception',
  }, 9),
  JVocab('でんわがとおいです', 'denwa ga tooi desu', {
    'id': 'suaranya kurang jelas (telepon)',
    'en': 'I can\'t hear you well',
  }, 9),
  JVocab('メッセージおくるね', 'messeeji okuru ne', {
    'id': 'nanti kukirim pesan',
    'en': 'I\'ll text you',
  }, 9),
  JVocab('よやくをおねがいしたいんですが', 'yoyaku o onegai shitain desu ga', {
    'id': 'saya mau reservasi',
    'en': 'I\'d like to make a reservation',
  }, 9),
  JVocab('じかんどおりに', 'jikan doori ni', {
    'id': 'tepat waktu',
    'en': 'on time',
  }, 9),
];

/// Judul grup untuk [jaAizuchiVocab].
const List<Map<String, String>> jaAizuchiVocabGroups = [
  {'id': 'Tanda mendengarkan', 'en': 'Showing you\'re listening'},
  {'id': 'Kaget & tertarik', 'en': 'Surprise & interest'},
  {'id': 'Setuju, paham & empati', 'en': 'Agreeing, understanding & empathy'},
  {'id': 'Pengisi & jeda berpikir', 'en': 'Fillers & thinking pauses'},
];

/// Aizuchi (tanggapan saat mendengarkan) & pengisi obrolan.
const List<JVocab> jaAizuchiVocab = [
  JVocab('うん', 'un', {
    'id': 'iya/he\'eh (tanda menyimak, santai)',
    'en': 'yeah/uh-huh (casual listening cue)',
  }, 0),
  JVocab('うんうん', 'un un', {
    'id': 'iya iya (sambil mengangguk)',
    'en': 'uh-huh, uh-huh (nodding along)',
  }, 0),
  JVocab('はいはい', 'hai hai', {
    'id': 'iya iya (bisa terdengar malas)',
    'en': 'yes, yes (can sound dismissive)',
  }, 0),
  JVocab('へえ', 'hee', {
    'id': 'oh ya? wah (tertarik)',
    'en': 'oh really? huh (interested)',
  }, 0),
  JVocab('ふうん', 'fuun', {
    'id': 'hmm, oh gitu (datar)',
    'en': 'hmm, I see (flat, little interest)',
  }, 0),
  JVocab('そっか', 'sokka', {
    'id': 'oh gitu ya (santai)',
    'en': 'oh, I see (casual)',
  }, 0),
  JVocab('そうか', 'sou ka', {
    'id': 'oh begitu, ya (merenung)',
    'en': 'I see... (to oneself, reflective)',
  }, 0),
  JVocab('そうなんだ', 'sou nanda', {
    'id': 'oh, begitu ya (baru tahu, santai)',
    'en': 'oh, is that so (new info, casual)',
  }, 0),
  JVocab('そうなんですか', 'sou nan desu ka', {
    'id': 'oh, begitu ya? (baru tahu, sopan)',
    'en': 'oh, is that so? (new info, polite)',
  }, 0),
  JVocab('そうなんですね', 'sou nan desu ne', {
    'id': 'oh begitu ya (menerima info, sopan)',
    'en': 'I see, so that\'s how it is (polite)',
  }, 0),
  JVocab('そうなの', 'sou na no', {
    'id': 'oh ya? masa? (lembut, santai)',
    'en': 'oh, really? (soft, casual)',
  }, 0),
  JVocab('それでそれで', 'sore de sore de', {
    'id': 'terus? terus? (minta lanjut cerita)',
    'en': 'and then? and then? (urging the story on)',
  }, 0),
  JVocab('そうでしたか', 'sou deshita ka', {
    'id': 'oh, begitu rupanya (sopan, sudah terjadi)',
    'en': 'oh, so that\'s what happened (polite)',
  }, 0),
  JVocab('そうなんですよ', 'sou nan desu yo', {
    'id': 'iya, memang begitu (menegaskan)',
    'en': 'yes, that\'s right, you see (confirming)',
  }, 0),
  JVocab('ふむふむ', 'fumu fumu', {
    'id': 'hmm hmm (menyimak serius)',
    'en': 'mm-hmm (listening intently)',
  }, 0),
  JVocab('えっ', 'e\'', {'id': 'eh?! (kaget)', 'en': 'huh?! (surprised)'}, 1),
  JVocab('ほんとうですか', 'hontou desu ka', {
    'id': 'benarkah? (sopan)',
    'en': 'really? is that true? (polite)',
  }, 1),
  JVocab('ほんとに', 'honto ni', {
    'id': 'serius? beneran? (santai)',
    'en': 'seriously? for real? (casual)',
  }, 1),
  JVocab('すごいですね', 'sugoi desu ne', {
    'id': 'hebat ya (memuji, sopan)',
    'en': 'that\'s amazing (polite praise)',
  }, 1),
  JVocab('さすが', 'sasuga', {
    'id': 'memang hebat, pantas saja',
    'en': 'just as expected of you',
  }, 1),
  JVocab('わあ', 'waa', {
    'id': 'wah! (kagum/senang)',
    'en': 'wow! (delighted)',
  }, 1),
  JVocab('うわ', 'uwa', {
    'id': 'uwah! ih! (kaget/jijik)',
    'en': 'whoa! ugh! (shocked or grossed out)',
  }, 1),
  JVocab('おお', 'oo', {'id': 'oh! (terkesan)', 'en': 'oh! (impressed)'}, 1),
  JVocab('あっ', 'a\'', {
    'id': 'ah! (tersadar/teringat)',
    'en': 'oh! (realizing something)',
  }, 1),
  JVocab('おもしろいですね', 'omoshiroi desu ne', {
    'id': 'menarik ya (sopan)',
    'en': 'how interesting (polite)',
  }, 1),
  JVocab('だよね', 'da yo ne', {
    'id': 'iya kan (santai)',
    'en': 'right? I know (casual)',
  }, 2),
  JVocab('そうですよね', 'sou desu yo ne', {
    'id': 'benar juga ya (sopan, ikut merasa)',
    'en': 'that\'s true, isn\'t it (polite, sympathetic)',
  }, 2),
  JVocab('なるほどね', 'naruhodo ne', {
    'id': 'oh gitu, masuk akal',
    'en': 'ah, that makes sense',
  }, 2),
  JVocab('そうそう', 'sou sou', {
    'id': 'iya iya, itu dia!',
    'en': 'yes, yes, that\'s it!',
  }, 2),
  JVocab('そうだね', 'sou da ne', {
    'id': 'iya ya (santai)',
    'en': 'yeah, true (casual)',
  }, 2),
  JVocab('わかります', 'wakarimasu', {
    'id': 'saya paham perasaannya',
    'en': 'I know what you mean',
  }, 2),
  JVocab('たしかにそうですね', 'tashika ni sou desu ne', {
    'id': 'memang benar juga ya',
    'en': 'that\'s certainly true',
  }, 2),
  JVocab('ですね', 'desu ne', {
    'id': 'iya ya (setuju singkat, sopan)',
    'en': 'yes, indeed (short polite agreement)',
  }, 2),
  JVocab('そうかもしれませんね', 'sou kamo shiremasen ne', {
    'id': 'mungkin juga ya (setuju setengah)',
    'en': 'you may be right (half agreeing)',
  }, 2),
  JVocab('たいへんでしたね', 'taihen deshita ne', {
    'id': 'wah, repot sekali ya (empati)',
    'en': 'that must have been tough',
  }, 2),
  JVocab('えっと', 'etto', {
    'id': 'emm, anu (sambil berpikir)',
    'en': 'um, let me see',
  }, 3),
  JVocab('うーん', 'uun', {
    'id': 'hmm (ragu/menimbang)',
    'en': 'hmm (hesitating)',
  }, 3),
  JVocab('そうですねえ', 'sou desu nee', {
    'id': 'hmm, gimana ya (mengulur waktu, sopan)',
    'en': 'well, let me think (polite)',
  }, 3),
  JVocab('そうだなあ', 'sou da naa', {
    'id': 'hmm, apa ya (santai)',
    'en': 'hmm, let\'s see (casual)',
  }, 3),
  JVocab('まあ', 'maa', {
    'id': 'yah, ya begitulah',
    'en': 'well, more or less',
  }, 3),
  JVocab('なんか', 'nanka', {
    'id': 'kayak, gimana gitu',
    'en': 'like, kind of',
  }, 3),
  JVocab('なんていうか', 'nante iu ka', {
    'id': 'gimana ya bilangnya',
    'en': 'how should I put it',
  }, 3),
  JVocab('ていうか', 'te iu ka', {
    'id': 'eh, maksudku / lagian',
    'en': 'I mean / actually',
  }, 3),
  JVocab('あのね', 'ano ne', {
    'id': 'eh, gini lho (santai)',
    'en': 'hey, listen (casual)',
  }, 3),
  JVocab('あのですね', 'ano desu ne', {
    'id': 'begini, Pak/Bu (sopan)',
    'en': 'well, you see (polite)',
  }, 3),
  JVocab('なんだっけ', 'nan dakke', {
    'id': 'apa ya namanya (lupa)',
    'en': 'what was it again',
  }, 3),
  JVocab('なんだろう', 'nan darou', {
    'id': 'apa ya (sambil berpikir)',
    'en': 'what is it, I wonder',
  }, 3),
  JVocab('ほら', 'hora', {'id': 'itu lho, tuh kan', 'en': 'you know / see?'}, 3),
  JVocab('ちなみに', 'chinami ni', {
    'id': 'omong-omong, sebagai info',
    'en': 'by the way, for reference',
  }, 3),
];

/// Judul grup untuk [jaOnomatopeVocab].
const List<Map<String, String>> jaOnomatopeVocabGroups = [
  {'id': 'Perasaan', 'en': 'Feelings'},
  {'id': 'Keadaan & kondisi', 'en': 'States & conditions'},
  {'id': 'Cara bergerak & berbicara', 'en': 'Ways of moving & speaking'},
  {'id': 'Makanan & tekstur', 'en': 'Food & texture'},
  {'id': 'Cuaca & suara alam', 'en': 'Weather & nature sounds'},
  {'id': 'Badan & kesehatan', 'en': 'Body & health'},
  {'id': 'Suara benda & hewan', 'en': 'Object & animal sounds'},
];

/// Onomatope (giongo/gitaigo) yang umum.
const List<JVocab> jaOnomatopeVocab = [
  JVocab('わくわく', 'wakuwaku', {
    'id': 'berdebar senang, tak sabar menanti',
    'en': 'excited (with anticipation)',
  }, 0),
  JVocab('どきどき', 'dokidoki', {
    'id': 'jantung berdebar (gugup/deg-degan)',
    'en': 'heart pounding (nervous)',
  }, 0),
  JVocab('いらいら', 'iraira', {
    'id': 'kesal, jengkel tidak sabar',
    'en': 'irritated, annoyed',
  }, 0),
  JVocab('がっかり', 'gakkari', {'id': 'kecewa', 'en': 'disappointed'}, 0),
  JVocab('びっくり', 'bikkuri', {
    'id': 'kaget, terkejut',
    'en': 'surprised, startled',
  }, 0),
  JVocab('ほっと', 'hotto', {'id': 'lega', 'en': 'relieved'}, 0),
  JVocab('うきうき', 'ukiuki', {
    'id': 'riang gembira, hati berbunga-bunga',
    'en': 'cheerful, in high spirits',
  }, 0),
  JVocab('はらはら', 'harahara', {
    'id': 'cemas tegang (melihat sesuatu berisiko)',
    'en': 'on edge, anxious (watching something risky)',
  }, 0),
  JVocab('もやもや', 'moyamoya', {
    'id': 'perasaan mengganjal, galau tak jelas',
    'en': 'a nagging, unsettled feeling',
  }, 0),
  JVocab('そわそわ', 'sowasowa', {
    'id': 'gelisah, tak bisa tenang',
    'en': 'restless, fidgety',
  }, 0),
  JVocab('おどおど', 'odoodo', {
    'id': 'takut-takut, canggung karena gugup',
    'en': 'timid, nervous (in behavior)',
  }, 0),
  JVocab('くよくよ', 'kuyokuyo', {
    'id': 'terus memikirkan hal yang sudah lewat',
    'en': 'dwelling on things, brooding',
  }, 0),
  JVocab('しょんぼり', 'shonbori', {
    'id': 'murung, lesu karena sedih',
    'en': 'dejected, downcast',
  }, 0),
  JVocab('うんざり', 'unzari', {
    'id': 'muak, bosan sekali',
    'en': 'fed up, sick of it',
  }, 0),
  JVocab('すっきり', 'sukkiri', {
    'id': 'plong, lega dan segar',
    'en': 'refreshed, feeling clear',
  }, 0),
  JVocab('ぎりぎり', 'girigiri', {
    'id': 'mepet, nyaris tidak sempat',
    'en': 'just barely, at the last moment',
  }, 1),
  JVocab('ばらばら', 'barabara', {
    'id': 'tercerai-berai, tidak kompak',
    'en': 'scattered, in pieces, not together',
  }, 1),
  JVocab('ぼろぼろ', 'boroboro', {
    'id': 'compang-camping, rusak parah',
    'en': 'worn out, tattered',
  }, 1),
  JVocab('ぐちゃぐちゃ', 'guchagucha', {
    'id': 'hancur acak-acakan',
    'en': 'squashed into a mess',
  }, 1),
  JVocab('ごちゃごちゃ', 'gochagocha', {
    'id': 'berantakan, campur aduk penuh barang',
    'en': 'cluttered, jumbled',
  }, 1),
  JVocab('ぴかぴか', 'pikapika', {
    'id': 'berkilau bersih, mengilap',
    'en': 'sparkling clean, shiny',
  }, 1),
  JVocab('ぎっしり', 'gisshiri', {
    'id': 'penuh terisi rapat',
    'en': 'packed tightly, crammed full',
  }, 1),
  JVocab('がらがら', 'garagara', {
    'id': 'kosong melompong, sepi',
    'en': 'nearly empty (of a place)',
  }, 1),
  JVocab('ぎゅうぎゅう', 'gyuugyuu', {
    'id': 'berdesakan, penuh sesak orang',
    'en': 'jam-packed (with people)',
  }, 1),
  JVocab('ばっちり', 'bacchiri', {
    'id': 'beres sempurna, mantap',
    'en': 'perfectly, spot on',
  }, 1),
  JVocab('たっぷり', 'tappuri', {
    'id': 'banyak, berlimpah',
    'en': 'plenty, generously',
  }, 1),
  JVocab('さっぱり', 'sappari', {
    'id': 'sama sekali tidak (paham/tahu)',
    'en': 'not at all (with a negative)',
  }, 1),
  JVocab('ぼさぼさ', 'bosabosa', {
    'id': 'kusut tak tersisir (rambut)',
    'en': 'messy, unkempt (hair)',
  }, 1),
  JVocab('べたべた', 'betabeta', {'id': 'lengket', 'en': 'sticky'}, 1),
  JVocab('つるつる', 'tsurutsuru', {
    'id': 'licin, mulus',
    'en': 'slippery, smooth',
  }, 1),
  JVocab('ぶらぶら', 'burabura', {
    'id': 'jalan-jalan santai tanpa tujuan',
    'en': 'strolling around aimlessly',
  }, 2),
  JVocab('うろうろ', 'urouro', {
    'id': 'mondar-mandir kebingungan',
    'en': 'wandering around, loitering',
  }, 2),
  JVocab('ごろごろ', 'gorogoro', {
    'id': 'bermalas-malasan sambil berbaring',
    'en': 'lazing around (lying down)',
  }, 2),
  JVocab('だらだら', 'daradara', {
    'id': 'bermalas-malasan, berlarut-larut',
    'en': 'sluggishly, dragging on',
  }, 2),
  JVocab('のろのろ', 'noronoro', {
    'id': 'lambat sekali, merayap',
    'en': 'at a crawl, sluggishly slow',
  }, 2),
  JVocab('さっさと', 'sassato', {
    'id': 'cepat-cepat, tanpa berlama-lama',
    'en': 'quickly, without dawdling',
  }, 2),
  JVocab('てきぱき', 'tekipaki', {
    'id': 'cekatan, sigap',
    'en': 'briskly, efficiently',
  }, 2),
  JVocab('ぐずぐず', 'guzuguzu', {
    'id': 'lelet, menunda-nunda',
    'en': 'dawdling, dillydallying',
  }, 2),
  JVocab('こそこそ', 'kosokoso', {
    'id': 'diam-diam, sembunyi-sembunyi',
    'en': 'sneakily, secretly',
  }, 2),
  JVocab('じろじろ', 'jirojiro', {
    'id': 'menatap terus-menerus (tidak sopan)',
    'en': 'staring (rudely)',
  }, 2),
  JVocab('きょろきょろ', 'kyorokyoro', {
    'id': 'celingak-celinguk',
    'en': 'looking around restlessly',
  }, 2),
  JVocab('ぺらぺら', 'perapera', {
    'id': 'lancar (berbahasa asing)',
    'en': 'fluent (in a language)',
  }, 2),
  JVocab('ひそひそ', 'hisohiso', {'id': 'berbisik-bisik', 'en': 'whispering'}, 2),
  JVocab('ぶつぶつ', 'butsubutsu', {
    'id': 'bergumam sendiri',
    'en': 'muttering to oneself',
  }, 2),
  JVocab('はきはき', 'hakihaki', {
    'id': 'berbicara jelas dan tegas',
    'en': 'speaking clearly and crisply',
  }, 2),
  JVocab('にやにや', 'niyaniya', {
    'id': 'senyum-senyum sendiri, menyeringai',
    'en': 'grinning, smirking',
  }, 2),
  JVocab('ふわふわ', 'fuwafuwa', {
    'id': 'lembut mengembang',
    'en': 'fluffy, soft and airy',
  }, 3),
  JVocab('さくさく', 'sakusaku', {
    'id': 'renyah ringan',
    'en': 'light and crispy',
  }, 3),
  JVocab('もちもち', 'mochimochi', {
    'id': 'kenyal lembut',
    'en': 'chewy, springy (like mochi)',
  }, 3),
  JVocab('ねばねば', 'nebaneba', {
    'id': 'lengket berlendir (berserat)',
    'en': 'slimy and stringy',
  }, 3),
  JVocab('ぷりぷり', 'puripuri', {
    'id': 'kenyal padat (udang dsb.)',
    'en': 'plump and firm (e.g. shrimp)',
  }, 3),
  JVocab('とろとろ', 'torotoro', {
    'id': 'lumer, meleleh lembut',
    'en': 'melty, runny',
  }, 3),
  JVocab('ぱりぱり', 'paripari', {
    'id': 'garing tipis (berbunyi saat digigit)',
    'en': 'crisp and crackly',
  }, 3),
  JVocab('しゃきしゃき', 'shakishaki', {
    'id': 'segar renyah (sayuran)',
    'en': 'crunchy and fresh (vegetables)',
  }, 3),
  JVocab('ほくほく', 'hokuhoku', {
    'id': 'hangat empuk pulen (kentang, labu)',
    'en': 'hot and fluffy (potato, pumpkin)',
  }, 3),
  JVocab('ぷるぷる', 'purupuru', {
    'id': 'kenyal bergoyang (seperti puding)',
    'en': 'jiggly, wobbly',
  }, 3),
  JVocab('ぱさぱさ', 'pasapasa', {
    'id': 'kering seret',
    'en': 'dry and crumbly',
  }, 3),
  JVocab('こってり', 'kotteri', {
    'id': 'berat dan berminyak (rasa kental)',
    'en': 'rich and heavy (flavor)',
  }, 3),
  JVocab('あっさり', 'assari', {
    'id': 'ringan, tidak berminyak (rasa)',
    'en': 'light, mild (flavor)',
  }, 3),
  JVocab('ぴりぴり', 'piripiri', {
    'id': 'pedas menyengat di lidah',
    'en': 'tingling spicy',
  }, 3),
  JVocab('あつあつ', 'atsuatsu', {
    'id': 'panas mengepul (baru matang)',
    'en': 'piping hot',
  }, 3),
  JVocab('ざあざあ', 'zaazaa', {
    'id': 'hujan deras mengguyur',
    'en': 'pouring (heavy rain)',
  }, 4),
  JVocab('しとしと', 'shitoshito', {
    'id': 'hujan rintik pelan dan tenang',
    'en': 'drizzling quietly',
  }, 4),
  JVocab('ぽつぽつ', 'potsupotsu', {
    'id': 'mulai turun tetes-tetes hujan',
    'en': 'starting to spit (raindrops)',
  }, 4),
  JVocab('ぱらぱら', 'parapara', {
    'id': 'turun sedikit-sedikit (hujan/salju)',
    'en': 'sprinkling lightly',
  }, 4),
  JVocab('ぽかぽか', 'pokapoka', {
    'id': 'hangat nyaman (sinar matahari)',
    'en': 'pleasantly warm',
  }, 4),
  JVocab('きらきら', 'kirakira', {
    'id': 'berkelip, gemerlap',
    'en': 'twinkling, sparkling',
  }, 4),
  JVocab('ぎらぎら', 'giragira', {
    'id': 'terik menyilaukan',
    'en': 'glaring, blazing',
  }, 4),
  JVocab('じめじめ', 'jimejime', {
    'id': 'lembap pengap',
    'en': 'damp and muggy',
  }, 4),
  JVocab('むしむし', 'mushimushi', {
    'id': 'gerah panas lembap',
    'en': 'hot and humid',
  }, 4),
  JVocab('からっと', 'karatto', {
    'id': 'cerah kering (udara segar)',
    'en': 'dry and clear (weather)',
  }, 4),
  JVocab('ひんやり', 'hinyari', {
    'id': 'sejuk dingin menyegarkan',
    'en': 'pleasantly cool, chilly',
  }, 4),
  JVocab('びしょびしょ', 'bishobisho', {'id': 'basah kuyup', 'en': 'soaking wet'}, 4),
  JVocab('ぴゅうぴゅう', 'pyuupyuu', {
    'id': 'angin bertiup kencang menderu',
    'en': 'whistling (strong wind)',
  }, 4),
  JVocab('そよそよ', 'soyosoyo', {
    'id': 'angin semilir lembut',
    'en': 'gently breezing',
  }, 4),
  JVocab('ぴかっと', 'pikatto', {
    'id': 'berkilat sekejap (petir)',
    'en': 'a sudden flash',
  }, 4),
  JVocab('ずきずき', 'zukizuki', {
    'id': 'nyeri berdenyut',
    'en': 'throbbing pain',
  }, 5),
  JVocab('がんがん', 'gangan', {
    'id': 'pusing berat seperti dipukul-pukul',
    'en': 'pounding (headache)',
  }, 5),
  JVocab('ちくちく', 'chikuchiku', {
    'id': 'perih seperti tertusuk-tusuk',
    'en': 'prickly, stinging',
  }, 5),
  JVocab('ひりひり', 'hirihiri', {
    'id': 'perih panas (kulit terbakar)',
    'en': 'smarting, burning sting',
  }, 5),
  JVocab('ふらふら', 'furafura', {
    'id': 'sempoyongan, limbung',
    'en': 'unsteady, staggering',
  }, 5),
  JVocab('くらくら', 'kurakura', {
    'id': 'pusing berkunang-kunang',
    'en': 'dizzy, light-headed',
  }, 5),
  JVocab('むかむか', 'mukamuka', {'id': 'mual', 'en': 'queasy, nauseous'}, 5),
  JVocab('ぞくぞく', 'zokuzoku', {
    'id': 'meriang menggigil',
    'en': 'having chills',
  }, 5),
  JVocab('ぶるぶる', 'buruburu', {
    'id': 'gemetar (dingin/takut)',
    'en': 'shivering, trembling',
  }, 5),
  JVocab('くたくた', 'kutakuta', {
    'id': 'letih lunglai',
    'en': 'tired and limp',
  }, 5),
  JVocab('へとへと', 'hetoheto', {
    'id': 'capek sampai tak bertenaga',
    'en': 'completely exhausted, drained',
  }, 5),
  JVocab('ぐったり', 'guttari', {
    'id': 'terkulai lemas tak berdaya',
    'en': 'limp and listless',
  }, 5),
  JVocab('ぺこぺこ', 'pekopeko', {
    'id': 'lapar sekali',
    'en': 'starving, very hungry',
  }, 5),
  JVocab('からから', 'karakara', {
    'id': 'haus sekali, tenggorokan kering',
    'en': 'parched, bone-dry (throat)',
  }, 5),
  JVocab('ぱんぱん', 'panpan', {
    'id': 'kencang penuh (bengkak/kekenyangan)',
    'en': 'swollen tight, stuffed full',
  }, 5),
  JVocab('ごほごほ', 'gohogoho', {
    'id': 'batuk-batuk berat',
    'en': 'hacking cough (sound)',
  }, 5),
  JVocab('わんわん', 'wanwan', {
    'id': 'guk-guk (gonggongan anjing)',
    'en': 'woof woof (dog barking)',
  }, 6),
  JVocab('にゃあにゃあ', 'nyaanyaa', {'id': 'meong (kucing)', 'en': 'meow (cat)'}, 6),
  JVocab('ちゅんちゅん', 'chunchun', {
    'id': 'cuit-cuit (burung pipit)',
    'en': 'tweet tweet (sparrows)',
  }, 6),
  JVocab('もぐもぐ', 'mogumogu', {
    'id': 'mengunyah nyam-nyam',
    'en': 'munching, chewing',
  }, 6),
  JVocab('ごくごく', 'gokugoku', {
    'id': 'meneguk glek-glek',
    'en': 'gulping down',
  }, 6),
  JVocab('ぐうぐう', 'guuguu', {
    'id': 'tidur pulas mendengkur',
    'en': 'snoring, sound asleep',
  }, 6),
  JVocab('げらげら', 'geragera', {
    'id': 'tertawa terbahak-bahak',
    'en': 'roaring with laughter',
  }, 6),
  JVocab('くすくす', 'kusukusu', {
    'id': 'tertawa cekikikan pelan',
    'en': 'giggling, chuckling quietly',
  }, 6),
  JVocab('しくしく', 'shikushiku', {
    'id': 'menangis terisak pelan',
    'en': 'sobbing quietly',
  }, 6),
  JVocab('とんとん', 'tonton', {
    'id': 'tok-tok (ketukan ringan)',
    'en': 'knock knock, light tapping',
  }, 6),
  JVocab('ばたん', 'batan', {
    'id': 'brak (pintu dibanting/benda jatuh)',
    'en': 'bang, slam (door)',
  }, 6),
  JVocab('がちゃん', 'gachan', {
    'id': 'prang (benda pecah)',
    'en': 'crash (something breaking)',
  }, 6),
  JVocab('がたがた', 'gatagata', {
    'id': 'berderak, bergoyang berisik',
    'en': 'rattling, clattering',
  }, 6),
  JVocab('ぱちぱち', 'pachipachi', {
    'id': 'tepuk tangan, bunyi letupan kecil',
    'en': 'clapping, crackling',
  }, 6),
  JVocab('ぶうぶう', 'buubuu', {
    'id': 'menggerutu protes, ngedumel',
    'en': 'complaining, griping',
  }, 6),
];

/// Judul grup untuk [jaWorkVocab].
const List<Map<String, String>> jaWorkVocabGroups = [
  {'id': 'Salam di tempat kerja', 'en': 'Workplace greetings'},
  {
    'id': 'Laporan, konsultasi & instruksi',
    'en': 'Reporting, consulting & instructions',
  },
  {'id': 'Minta maaf & izin', 'en': 'Apologies & permission (formal)'},
  {'id': 'Telepon & tamu', 'en': 'Phone & visitors'},
  {'id': 'Keselamatan & kerja lapangan', 'en': 'Safety & on-site work'},
];

/// Ungkapan kerja & keigo.
const List<JVocab> jaWorkVocab = [
  JVocab('おつかれさまです', 'otsukaresama desu', {
    'id': 'salam antarrekan kerja (terima kasih atas kerja kerasnya)',
    'en': 'workplace greeting (thanks for your hard work)',
  }, 0),
  JVocab('おつかれさまでした', 'otsukaresama deshita', {
    'id': 'salam saat selesai kerja/pulang',
    'en': 'good work today (end of shift)',
  }, 0),
  JVocab('おさきにしつれいします', 'osaki ni shitsurei shimasu', {
    'id': 'pamit pulang lebih dulu',
    'en': 'excuse me for leaving before you',
  }, 0),
  JVocab('ごくろうさまです', 'gokurousama desu', {
    'id': 'terima kasih atas jerih payahnya (atasan ke bawahan)',
    'en': 'thanks for your trouble (to subordinates)',
  }, 0),
  JVocab('よろしくおねがいいたします', 'yoroshiku onegai itashimasu', {
    'id': 'mohon kerja samanya (sangat sopan)',
    'en': 'I humbly ask for your kind cooperation',
  }, 0),
  JVocab('きょうからおせわになります', 'kyou kara osewa ni narimasu', {
    'id': 'mulai hari ini mohon bimbingannya',
    'en': 'I\'ll be in your care starting today',
  }, 0),
  JVocab('おせわになりました', 'osewa ni narimashita', {
    'id': 'terima kasih atas bimbingan selama ini (saat pamit)',
    'en': 'thank you for everything (when leaving)',
  }, 0),
  JVocab('いってまいります', 'itte mairimasu', {
    'id': 'saya berangkat dulu (sopan)',
    'en': 'I\'ll be going now (humble)',
  }, 0),
  JVocab('ただいまもどりました', 'tadaima modorimashita', {
    'id': 'saya sudah kembali (ke kantor/tempat kerja)',
    'en': 'I\'m back (at the workplace)',
  }, 0),
  JVocab('ごぶさたしております', 'gobusata shite orimasu', {
    'id': 'maaf lama tidak berkabar',
    'en': 'it\'s been a long time since I was in touch',
  }, 0),
  JVocab('いつもありがとうございます', 'itsumo arigatou gozaimasu', {
    'id': 'terima kasih seperti biasanya',
    'en': 'thank you as always',
  }, 0),
  JVocab('ごしどうありがとうございました', 'goshidou arigatou gozaimashita', {
    'id': 'terima kasih atas bimbingan dan arahannya',
    'en': 'thank you for your guidance',
  }, 0),
  JVocab('おだいじになさってください', 'odaiji ni nasatte kudasai', {
    'id': 'semoga lekas sembuh (sopan)',
    'en': 'please take good care of yourself (get well)',
  }, 0),
  JVocab('きょうもいちにちよろしくおねがいします', 'kyou mo ichinichi yoroshiku onegai shimasu', {
    'id': 'mohon kerja samanya untuk hari ini juga',
    'en': 'let\'s work well together again today',
  }, 0),
  JVocab('おやすみをいただきありがとうございました', 'oyasumi o itadaki arigatou gozaimashita', {
    'id': 'terima kasih sudah diizinkan libur',
    'en': 'thank you for letting me take time off',
  }, 0),
  JVocab('かしこまりました', 'kashikomarimashita', {
    'id': 'baik, saya mengerti (sangat sopan)',
    'en': 'certainly, understood (very polite)',
  }, 1),
  JVocab('しょうちしました', 'shouchi shimashita', {
    'id': 'baik, sudah saya pahami (sopan)',
    'en': 'understood, noted (polite)',
  }, 1),
  JVocab('りょうかいです', 'ryoukai desu', {
    'id': 'oke, siap (ke rekan)',
    'en': 'roger, got it',
  }, 1),
  JVocab('うけたまわりました', 'uketamawarimashita', {
    'id': 'permintaan Anda sudah saya terima',
    'en': 'your request has been received (humble)',
  }, 1),
  JVocab('いまおじかんよろしいでしょうか', 'ima ojikan yoroshii deshou ka', {
    'id': 'apakah Anda ada waktu sekarang?',
    'en': 'do you have a moment now?',
  }, 1),
  JVocab('～てもよろしいでしょうか', '~te mo yoroshii deshou ka', {
    'id': 'bolehkah saya ~? (sangat sopan)',
    'en': 'may I ~? (very polite)',
  }, 1),
  JVocab('ごそうだんしたいことがあるのですが', 'gosoudan shitai koto ga aru no desu ga', {
    'id': 'ada yang ingin saya konsultasikan',
    'en': 'there\'s something I\'d like to consult you about',
  }, 1),
  JVocab('ごほうこくがあります', 'gohoukoku ga arimasu', {
    'id': 'ada yang ingin saya laporkan',
    'en': 'I have something to report',
  }, 1),
  JVocab('もういちどおねがいします', 'mou ichido onegai shimasu', {
    'id': 'tolong ulangi sekali lagi',
    'en': 'once more, please',
  }, 1),
  JVocab('もうすこしゆっくりおねがいします', 'mou sukoshi yukkuri onegai shimasu', {
    'id': 'tolong bicara lebih pelan sedikit',
    'en': 'a little slower, please',
  }, 1),
  JVocab('おしえていただけますか', 'oshiete itadakemasu ka', {
    'id': 'bisakah Anda mengajari saya?',
    'en': 'could you please show me?',
  }, 1),
  JVocab('これでよろしいでしょうか', 'kore de yoroshii deshou ka', {
    'id': 'apakah begini sudah benar?',
    'en': 'is this all right?',
  }, 1),
  JVocab('なにかおてつだいすることはありますか', 'nanika otetsudai suru koto wa arimasu ka', {
    'id': 'ada yang bisa saya bantu?',
    'en': 'is there anything I can help with?',
  }, 1),
  JVocab('つぎはなにをすればいいですか', 'tsugi wa nani o sureba ii desu ka', {
    'id': 'selanjutnya saya harus mengerjakan apa?',
    'en': 'what should I do next?',
  }, 1),
  JVocab('かくにんいたします', 'kakunin itashimasu', {
    'id': 'akan saya periksa dulu (sopan)',
    'en': 'I\'ll check on that',
  }, 1),
  JVocab('わかりかねます', 'wakarikanemasu', {
    'id': 'maaf, saya kurang tahu soal itu (sopan)',
    'en': 'I\'m afraid I can\'t say',
  }, 1),
  JVocab('もうしわけございません', 'moushiwake gozaimasen', {
    'id': 'mohon maaf sebesar-besarnya',
    'en': 'I\'m terribly sorry',
  }, 2),
  JVocab('もうしわけありませんでした', 'moushiwake arimasen deshita', {
    'id': 'mohon maaf atas yang sudah terjadi',
    'en': 'I\'m sorry for what happened',
  }, 2),
  JVocab('しつれいいたします', 'shitsurei itashimasu', {
    'id': 'permisi (sangat sopan)',
    'en': 'excuse me (very polite)',
  }, 2),
  JVocab('たいへんしつれいしました', 'taihen shitsurei shimashita', {
    'id': 'mohon maaf atas ketidaksopanan saya',
    'en': 'I apologize for my rudeness',
  }, 2),
  JVocab('ごめいわくをおかけしました', 'gomeiwaku o okake shimashita', {
    'id': 'maaf telah merepotkan',
    'en': 'sorry for the trouble I caused',
  }, 2),
  JVocab('いごきをつけます', 'igo ki o tsukemasu', {
    'id': 'ke depannya saya akan lebih hati-hati',
    'en': 'I\'ll be more careful from now on',
  }, 2),
  JVocab('おそれいりますが', 'osoreirimasu ga', {
    'id': 'mohon maaf, tapi... (pembuka permintaan)',
    'en': 'I\'m sorry to bother you, but...',
  }, 2),
  JVocab('しつれいですが', 'shitsurei desu ga', {
    'id': 'maaf, kalau boleh tahu...',
    'en': 'excuse me, but may I ask...',
  }, 2),
  JVocab('おてすうをおかけしますが', 'otesuu o okake shimasu ga', {
    'id': 'maaf merepotkan, tapi...',
    'en': 'sorry to trouble you, but...',
  }, 2),
  JVocab('すこしおくれます', 'sukoshi okuremasu', {
    'id': 'saya akan sedikit terlambat',
    'en': 'I\'ll be a little late',
  }, 2),
  JVocab('おくれてもうしわけありません', 'okurete moushiwake arimasen', {
    'id': 'maaf saya terlambat',
    'en': 'I\'m sorry for being late',
  }, 2),
  JVocab('ミスをしてしまいました', 'misu o shite shimaimashita', {
    'id': 'saya telah membuat kesalahan',
    'en': 'I made a mistake',
  }, 2),
  JVocab('やすませていただけませんか', 'yasumasete itadakemasen ka', {
    'id': 'bolehkah saya izin libur?',
    'en': 'could I take the day off?',
  }, 2),
  JVocab('さきにかえらせていただけませんか', 'saki ni kaerasete itadakemasen ka', {
    'id': 'bolehkah saya pulang lebih awal?',
    'en': 'could I leave early?',
  }, 2),
  JVocab('トイレにいってきてもいいですか', 'toire ni itte kite mo ii desu ka', {
    'id': 'bolehkah saya ke toilet sebentar?',
    'en': 'may I go to the restroom?',
  }, 2),
  JVocab('おせわになっております', 'osewa ni natte orimasu', {
    'id': 'terima kasih atas kerja samanya selama ini (pembuka)',
    'en': 'thank you for your continued support (opener)',
  }, 3),
  JVocab('おでんわありがとうございます', 'odenwa arigatou gozaimasu', {
    'id': 'terima kasih telah menelepon',
    'en': 'thank you for calling',
  }, 3),
  JVocab('～ともうします', '~ to moushimasu', {
    'id': 'nama saya ~ (merendah)',
    'en': 'my name is ~ (humble)',
  }, 3),
  JVocab('どちらさまでしょうか', 'dochirasama deshou ka', {
    'id': 'dengan siapa saya berbicara?',
    'en': 'may I ask who\'s calling?',
  }, 3),
  JVocab('しょうしょうおまちください', 'shoushou omachi kudasai', {
    'id': 'mohon tunggu sebentar',
    'en': 'please wait a moment',
  }, 3),
  JVocab('おまたせいたしました', 'omatase itashimashita', {
    'id': 'maaf membuat Anda menunggu',
    'en': 'sorry to have kept you waiting',
  }, 3),
  JVocab('おでんわかわりました', 'odenwa kawarimashita', {
    'id': 'saya yang menerima alihan telepon',
    'en': 'this is the person you asked for (taking over the call)',
  }, 3),
  JVocab('ただいませきをはずしております', 'tadaima seki o hazushite orimasu', {
    'id': 'sedang tidak di tempat',
    'en': 'is away from the desk right now',
  }, 3),
  JVocab('おりかえしおでんわいたします', 'orikaeshi odenwa itashimasu', {
    'id': 'nanti saya telepon balik',
    'en': 'I\'ll call you back',
  }, 3),
  JVocab('おでんわがとおいようです', 'odenwa ga tooi you desu', {
    'id': 'suara telepon kurang jelas',
    'en': 'I can\'t hear you very well',
  }, 3),
  JVocab('でんごんをおねがいできますか', 'dengon o onegai dekimasu ka', {
    'id': 'boleh saya titip pesan?',
    'en': 'could I leave a message?',
  }, 3),
  JVocab('ようこそおこしくださいました', 'youkoso okoshi kudasaimashita', {
    'id': 'selamat datang, terima kasih sudah datang',
    'en': 'welcome, thank you for coming',
  }, 3),
  JVocab('こちらへどうぞ', 'kochira e douzo', {
    'id': 'silakan lewat sini',
    'en': 'this way, please',
  }, 3),
  JVocab('おかけください', 'okake kudasai', {
    'id': 'silakan duduk',
    'en': 'please have a seat',
  }, 3),
  JVocab('おまちしておりました', 'omachi shite orimashita', {
    'id': 'kami sudah menanti kedatangan Anda',
    'en': 'we\'ve been expecting you',
  }, 3),
  JVocab('またおこしくださいませ', 'mata okoshi kudasaimase', {
    'id': 'silakan datang kembali',
    'en': 'please come again',
  }, 3),
  JVocab('きをつけてください', 'ki o tsukete kudasai', {
    'id': 'hati-hati ya',
    'en': 'please be careful',
  }, 4),
  JVocab('ちゅういしてください', 'chuui shite kudasai', {
    'id': 'harap waspada',
    'en': 'please pay attention',
  }, 4),
  JVocab('あしもとにきをつけてください', 'ashimoto ni ki o tsukete kudasai', {
    'id': 'awas langkah kaki',
    'en': 'watch your step',
  }, 4),
  JVocab('とまってください', 'tomatte kudasai', {
    'id': 'tolong berhenti',
    'en': 'please stop',
  }, 4),
  JVocab('さわらないでください', 'sawaranaide kudasai', {
    'id': 'jangan disentuh',
    'en': 'please don\'t touch',
  }, 4),
  JVocab('けがはありませんか', 'kega wa arimasen ka', {
    'id': 'ada yang terluka?',
    'en': 'are you hurt?',
  }, 4),
  JVocab('てをかしてください', 'te o kashite kudasai', {
    'id': 'tolong bantu saya (tenaga)',
    'en': 'please give me a hand',
  }, 4),
  JVocab('かくにんよし', 'kakunin yoshi', {
    'id': 'sudah dicek, aman!',
    'en': 'checked and clear!',
  }, 4),
  JVocab('ゆびさしかくにん', 'yubisashi kakunin', {
    'id': 'cek sambil menunjuk dan menyebut',
    'en': 'point-and-call check',
  }, 4),
  JVocab('ひやりハット', 'hiyari hatto', {
    'id': 'kejadian nyaris celaka',
    'en': 'near miss',
  }, 4),
  JVocab('いじょうありません', 'ijou arimasen', {
    'id': 'tidak ada kelainan',
    'en': 'no abnormalities',
  }, 4),
  JVocab('せいりせいとん', 'seiri seiton', {
    'id': 'rapi dan tertata (5S)',
    'en': 'sort and set in order (5S)',
  }, 4),
  JVocab('おわりました', 'owarimashita', {
    'id': 'sudah selesai (melapor)',
    'en': 'I\'ve finished',
  }, 4),
  JVocab('すいぶんをとってください', 'suibun o totte kudasai', {
    'id': 'jangan lupa minum air',
    'en': 'please stay hydrated',
  }, 4),
  JVocab('きゅうけいにはいります', 'kyuukei ni hairimasu', {
    'id': 'saya mulai istirahat',
    'en': 'I\'m going on break',
  }, 4),
  JVocab('あとかたづけをおねがいします', 'atokatazuke o onegai shimasu', {
    'id': 'tolong bereskan setelah selesai',
    'en': 'please clean up afterwards',
  }, 4),
];

/// Judul grup untuk [jaIdiomVocab].
const List<Map<String, String>> jaIdiomVocabGroups = [
  {'id': 'Idiom \'き\' (気)', 'en': 'Idioms with ki (気)'},
  {
    'id': 'Idiom anggota tubuh: kepala & wajah',
    'en': 'Body-part idioms: head & face',
  },
  {
    'id': 'Idiom anggota tubuh: tangan, kaki & badan',
    'en': 'Body-part idioms: hands, feet & body',
  },
  {'id': 'Idiom lain', 'en': 'Other idioms'},
  {'id': 'Peribahasa populer', 'en': 'Popular proverbs'},
];

/// Idiom (慣用句) & peribahasa (ことわざ) populer.
const List<JVocab> jaIdiomVocab = [
  JVocab('きになる', 'ki ni naru', {
    'id': 'terpikir terus, penasaran',
    'en': 'to be on one\'s mind, curious',
  }, 0),
  JVocab('きをつける', 'ki o tsukeru', {
    'id': 'berhati-hati',
    'en': 'to be careful',
  }, 0),
  JVocab('きがつく', 'ki ga tsuku', {
    'id': 'menyadari, tersadar',
    'en': 'to notice, to realize',
  }, 0),
  JVocab('きにいる', 'ki ni iru', {
    'id': 'menyukai, berkenan di hati',
    'en': 'to take a liking to',
  }, 0),
  JVocab('きがする', 'ki ga suru', {
    'id': 'punya firasat, merasa bahwa',
    'en': 'to have a feeling that',
  }, 0),
  JVocab('きにする', 'ki ni suru', {
    'id': 'mempermasalahkan, merisaukan',
    'en': 'to mind, to worry about',
  }, 0),
  JVocab('きをつかう', 'ki o tsukau', {
    'id': 'menjaga perasaan orang, sungkan',
    'en': 'to be considerate of others',
  }, 0),
  JVocab('きがきく', 'ki ga kiku', {
    'id': 'tanggap, peka terhadap kebutuhan orang',
    'en': 'to be attentive and thoughtful',
  }, 0),
  JVocab('きがあう', 'ki ga au', {
    'id': 'cocok, klop (sifatnya)',
    'en': 'to get along well, to click',
  }, 0),
  JVocab('きがながい', 'ki ga nagai', {
    'id': 'sabar, tidak terburu-buru',
    'en': 'patient, easygoing',
  }, 0),
  JVocab('きがみじかい', 'ki ga mijikai', {
    'id': 'pemarah, tidak sabaran',
    'en': 'short-tempered, impatient',
  }, 0),
  JVocab('きがおもい', 'ki ga omoi', {
    'id': 'berat hati',
    'en': 'to feel heavy-hearted, reluctant',
  }, 0),
  JVocab('きがすむ', 'ki ga sumu', {
    'id': 'puas, lega (sudah melakukan)',
    'en': 'to be satisfied, to get it out of one\'s system',
  }, 0),
  JVocab('きがぬける', 'ki ga nukeru', {
    'id': 'kendur semangat, lengah',
    'en': 'to lose one\'s focus, to slacken',
  }, 0),
  JVocab('きがちる', 'ki ga chiru', {
    'id': 'buyar konsentrasi',
    'en': 'to get distracted',
  }, 0),
  JVocab('きがらくになる', 'ki ga raku ni naru', {
    'id': 'merasa lega, beban hilang',
    'en': 'to feel relieved, to feel at ease',
  }, 0),
  JVocab('きをおとす', 'ki o otosu', {
    'id': 'patah semangat, kecewa',
    'en': 'to be discouraged, to lose heart',
  }, 0),
  JVocab('きがひける', 'ki ga hikeru', {
    'id': 'merasa tidak enak, segan',
    'en': 'to feel hesitant, to feel awkward',
  }, 0),
  JVocab('きがきでない', 'ki ga ki de nai', {
    'id': 'cemas, gelisah tidak tenang',
    'en': 'on pins and needles, anxious',
  }, 0),
  JVocab('きにくわない', 'ki ni kuwanai', {
    'id': 'tidak berkenan, tidak suka',
    'en': 'to rub the wrong way, to dislike',
  }, 0),
  JVocab('あたまにくる', 'atama ni kuru', {
    'id': 'naik darah, jengkel sekali',
    'en': 'to get mad, to lose it',
  }, 1),
  JVocab('あたまがかたい', 'atama ga katai', {
    'id': 'kaku pikirannya, kolot',
    'en': 'stubborn, inflexible in thinking',
  }, 1),
  JVocab('あたまをひやす', 'atama o hiyasu', {
    'id': 'mendinginkan kepala, menenangkan diri',
    'en': 'to cool one\'s head, to calm down',
  }, 1),
  JVocab('かおがひろい', 'kao ga hiroi', {
    'id': 'kenalannya banyak, gaul luas',
    'en': 'to know a lot of people, well-connected',
  }, 1),
  JVocab('かおをだす', 'kao o dasu', {
    'id': 'mampir, menampakkan diri sebentar',
    'en': 'to show up, to drop by',
  }, 1),
  JVocab('かおにでる', 'kao ni deru', {
    'id': 'terlihat di wajah',
    'en': 'to show on one\'s face',
  }, 1),
  JVocab('めがない', 'me ga nai', {
    'id': 'tergila-gila, tidak bisa menolak',
    'en': 'to have a weakness for',
  }, 1),
  JVocab('めがたかい', 'me ga takai', {
    'id': 'jeli, seleranya tinggi',
    'en': 'to have a discerning eye',
  }, 1),
  JVocab('めをとおす', 'me o toosu', {
    'id': 'membaca sekilas, memeriksa',
    'en': 'to look over, to skim through',
  }, 1),
  JVocab('めがまわる', 'me ga mawaru', {
    'id': 'sibuk sampai pusing',
    'en': 'to be dizzyingly busy',
  }, 1),
  JVocab('ひどいめにあう', 'hidoi me ni au', {
    'id': 'mengalami nasib buruk',
    'en': 'to have a terrible experience',
  }, 1),
  JVocab('めをつぶる', 'me o tsuburu', {
    'id': 'pura-pura tidak melihat, memaklumi',
    'en': 'to turn a blind eye',
  }, 1),
  JVocab('みみがいたい', 'mimi ga itai', {
    'id': 'tersindir, kena di hati',
    'en': 'to hit a sore spot',
  }, 1),
  JVocab('みみにする', 'mimi ni suru', {
    'id': 'kebetulan mendengar',
    'en': 'to happen to hear',
  }, 1),
  JVocab('みみをうたがう', 'mimi o utagau', {
    'id': 'tidak percaya pendengaran sendiri',
    'en': 'can\'t believe one\'s ears',
  }, 1),
  JVocab('はながたかい', 'hana ga takai', {
    'id': 'bangga (atas seseorang/sesuatu)',
    'en': 'to be proud',
  }, 1),
  JVocab('くちがかるい', 'kuchi ga karui', {
    'id': 'ember, tidak bisa jaga rahasia',
    'en': 'to have a loose tongue',
  }, 1),
  JVocab('くちがかたい', 'kuchi ga katai', {
    'id': 'pandai menjaga rahasia',
    'en': 'tight-lipped, can keep a secret',
  }, 1),
  JVocab('くちにあう', 'kuchi ni au', {
    'id': 'cocok dengan selera (makanan)',
    'en': 'to suit one\'s taste',
  }, 1),
  JVocab('したをまく', 'shita o maku', {
    'id': 'berdecak kagum',
    'en': 'to be amazed, to be impressed',
  }, 1),
  JVocab('てがかかる', 'te ga kakaru', {
    'id': 'merepotkan, butuh banyak perhatian',
    'en': 'to need a lot of care, to be a handful',
  }, 2),
  JVocab('てがはなせない', 'te ga hanasenai', {
    'id': 'sedang sibuk, tidak bisa ditinggal',
    'en': 'to be tied up, can\'t step away',
  }, 2),
  JVocab('てをかす', 'te o kasu', {
    'id': 'membantu, ulurkan tangan',
    'en': 'to lend a hand',
  }, 2),
  JVocab('てがたりない', 'te ga tarinai', {
    'id': 'kekurangan tenaga',
    'en': 'to be short-handed',
  }, 2),
  JVocab('てをぬく', 'te o nuku', {
    'id': 'bekerja asal-asalan',
    'en': 'to cut corners',
  }, 2),
  JVocab('てがでない', 'te ga denai', {
    'id': 'di luar jangkauan, tak terbeli',
    'en': 'to be out of reach, can\'t afford',
  }, 2),
  JVocab('てをうつ', 'te o utsu', {
    'id': 'mengambil tindakan',
    'en': 'to take measures',
  }, 2),
  JVocab('あしをひっぱる', 'ashi o hipparu', {
    'id': 'menghambat, jadi beban',
    'en': 'to hold someone back',
  }, 2),
  JVocab('あしがでる', 'ashi ga deru', {
    'id': 'melebihi anggaran',
    'en': 'to go over budget',
  }, 2),
  JVocab('あしをあらう', 'ashi o arau', {
    'id': 'berhenti dari dunia hitam, tobat',
    'en': 'to wash one\'s hands of something, to go straight',
  }, 2),
  JVocab('あしがぼうになる', 'ashi ga bou ni naru', {
    'id': 'kaki pegal sekali',
    'en': 'legs worn out from walking',
  }, 2),
  JVocab('はらがたつ', 'hara ga tatsu', {
    'id': 'merasa kesal',
    'en': 'to be annoyed, to feel angry',
  }, 2),
  JVocab('こしがひくい', 'koshi ga hikui', {
    'id': 'rendah hati, santun',
    'en': 'humble, modest',
  }, 2),
  JVocab('むねがいっぱい', 'mune ga ippai', {
    'id': 'terharu, hati penuh',
    'en': 'to be deeply moved',
  }, 2),
  JVocab('むねをはる', 'mune o haru', {
    'id': 'membusungkan dada, percaya diri',
    'en': 'to stand tall, to be confident',
  }, 2),
  JVocab('かたをもつ', 'kata o motsu', {
    'id': 'memihak, membela',
    'en': 'to take someone\'s side',
  }, 2),
  JVocab('うでがいい', 'ude ga ii', {
    'id': 'terampil, jago',
    'en': 'skilled, good at one\'s craft',
  }, 2),
  JVocab('ほねがおれる', 'hone ga oreru', {
    'id': 'susah payah, makan tenaga',
    'en': 'to be strenuous, to take great effort',
  }, 2),
  JVocab('こしをぬかす', 'koshi o nukasu', {
    'id': 'kaget setengah mati',
    'en': 'to be scared stiff, to be stunned',
  }, 2),
  JVocab('みにつける', 'mi ni tsukeru', {
    'id': 'menguasai (keterampilan)',
    'en': 'to master, to acquire a skill',
  }, 2),
  JVocab('ねこのてもかりたい', 'neko no te mo karitai', {
    'id': 'sibuk sekali, butuh bantuan siapa saja',
    'en': 'so busy you\'d take any help',
  }, 3),
  JVocab('ねこじた', 'nekojita', {
    'id': 'lidah tidak tahan panas',
    'en': 'unable to handle hot food',
  }, 3),
  JVocab('むしがいい', 'mushi ga ii', {
    'id': 'maunya enak sendiri',
    'en': 'selfish, asking too much',
  }, 3),
  JVocab('むしのいどころがわるい', 'mushi no idokoro ga warui', {
    'id': 'sedang bad mood',
    'en': 'in a bad mood',
  }, 3),
  JVocab('さばをよむ', 'saba o yomu', {
    'id': 'memalsukan angka (umur dll.)',
    'en': 'to fudge numbers, to lie about one\'s age',
  }, 3),
  JVocab('ごまをする', 'goma o suru', {
    'id': 'menjilat, cari muka',
    'en': 'to butter up, to suck up',
  }, 3),
  JVocab('あぶらをうる', 'abura o uru', {
    'id': 'keluyuran, membuang waktu kerja',
    'en': 'to loaf around, to slack off',
  }, 3),
  JVocab('みちくさをくう', 'michikusa o kuu', {
    'id': 'mampir-mampir di jalan',
    'en': 'to dawdle on the way',
  }, 3),
  JVocab('いたにつく', 'ita ni tsuku', {
    'id': 'sudah luwes, cocok dengan perannya',
    'en': 'to settle into a role',
  }, 3),
  JVocab('うりふたつ', 'urifutatsu', {
    'id': 'mirip sekali, bak pinang dibelah dua',
    'en': 'spitting image',
  }, 3),
  JVocab('ねみみにみず', 'nemimi ni mizu', {
    'id': 'kabar mengejutkan tiba-tiba',
    'en': 'a bolt from the blue',
  }, 3),
  JVocab('はなしにならない', 'hanashi ni naranai', {
    'id': 'tidak layak dibahas, konyol',
    'en': 'out of the question, ridiculous',
  }, 3),
  JVocab('らちがあかない', 'rachi ga akanai', {
    'id': 'tidak ada kemajuan, buntu',
    'en': 'to get nowhere',
  }, 3),
  JVocab('おおめにみる', 'oome ni miru', {
    'id': 'memaafkan, memberi kelonggaran',
    'en': 'to let something slide',
  }, 3),
  JVocab('ちょうしにのる', 'choushi ni noru', {
    'id': 'besar kepala, kebablasan',
    'en': 'to get carried away',
  }, 3),
  JVocab('みずにながす', 'mizu ni nagasu', {
    'id': 'melupakan masalah lama',
    'en': 'to let bygones be bygones',
  }, 3),
  JVocab('きりがない', 'kiri ga nai', {
    'id': 'tidak ada habisnya',
    'en': 'endless, there\'s no end to it',
  }, 3),
  JVocab('さるもきからおちる', 'saru mo ki kara ochiru', {
    'id': 'orang pandai pun bisa salah',
    'en': 'even monkeys fall from trees',
  }, 4),
  JVocab('ちりもつもればやまとなる', 'chiri mo tsumoreba yama to naru', {
    'id': 'sedikit demi sedikit lama-lama menjadi bukit',
    'en': 'many a little makes a mickle',
  }, 4),
  JVocab('ななころびやおき', 'nana korobi ya oki', {
    'id': 'jatuh tujuh kali bangkit delapan kali',
    'en': 'fall seven times, stand up eight',
  }, 4),
  JVocab('いそがばまわれ', 'isogaba maware', {
    'id': 'biar lambat asal selamat',
    'en': 'more haste, less speed',
  }, 4),
  JVocab('はなよりだんご', 'hana yori dango', {
    'id': 'lebih pilih yang praktis daripada yang indah',
    'en': 'substance over style',
  }, 4),
  JVocab('ねこにこばん', 'neko ni koban', {
    'id': 'barang berharga di tangan yang tak paham (koin emas untuk kucing)',
    'en': 'gold coins to a cat',
  }, 4),
  JVocab('ぶたにしんじゅ', 'buta ni shinju', {
    'id': 'mutiara untuk babi',
    'en': 'pearls before swine',
  }, 4),
  JVocab('いしのうえにもさんねん', 'ishi no ue ni mo sannen', {
    'id': 'kesabaran akan berbuah',
    'en': 'perseverance pays off',
  }, 4),
  JVocab('かべにみみあり', 'kabe ni mimi ari', {
    'id': 'dinding pun bertelinga',
    'en': 'walls have ears',
  }, 4),
  JVocab('しっぱいはせいこうのもと', 'shippai wa seikou no moto', {
    'id': 'kegagalan adalah awal keberhasilan',
    'en': 'failure is the stepping stone to success',
  }, 4),
  JVocab('ならうよりなれろ', 'narau yori narero', {
    'id': 'alah bisa karena biasa',
    'en': 'practice makes perfect',
  }, 4),
  JVocab('とらぬたぬきのかわざんよう', 'toranu tanuki no kawazan\'you', {
    'id': 'menghitung untung sebelum dapat',
    'en': 'don\'t count your chickens before they hatch',
  }, 4),
  JVocab('あめふってじかたまる', 'ame futte ji katamaru', {
    'id': 'setelah masalah, hubungan jadi lebih kuat',
    'en': 'after rain the ground hardens',
  }, 4),
  JVocab('さんにんよればもんじゅのちえ', 'sannin yoreba monju no chie', {
    'id': 'banyak kepala lebih baik dari satu',
    'en': 'two heads are better than one',
  }, 4),
  JVocab('ひゃくぶんはいっけんにしかず', 'hyakubun wa ikken ni shikazu', {
    'id': 'melihat sekali lebih baik dari mendengar seratus kali',
    'en': 'seeing is believing',
  }, 4),
  JVocab('えびでたいをつる', 'ebi de tai o tsuru', {
    'id': 'modal kecil untung besar',
    'en': 'to throw a sprat to catch a mackerel',
  }, 4),
  JVocab('のれんにうでおし', 'noren ni udeoshi', {
    'id': 'usaha sia-sia, tidak ada tanggapan',
    'en': 'like talking to a brick wall',
  }, 4),
  JVocab('うそもほうべん', 'uso mo houben', {
    'id': 'bohong kadang perlu',
    'en': 'a white lie is sometimes necessary',
  }, 4),
  JVocab('ときはかねなり', 'toki wa kane nari', {
    'id': 'waktu adalah uang',
    'en': 'time is money',
  }, 4),
  JVocab('すきこそもののじょうずなれ', 'suki koso mono no jouzu nare', {
    'id': 'yang disukai pasti cepat mahir',
    'en': 'you get good at what you love',
  }, 4),
  JVocab('かえるのこはかえる', 'kaeru no ko wa kaeru', {
    'id': 'buah jatuh tak jauh dari pohonnya',
    'en': 'like father, like son',
  }, 4),
  JVocab('おににかなぼう', 'oni ni kanabou', {
    'id': 'kuat jadi makin tak terkalahkan',
    'en': 'making the strong even stronger',
  }, 4),
  JVocab('でるくいはうたれる', 'deru kui wa utareru', {
    'id': 'yang menonjol akan ditekan',
    'en': 'the nail that sticks out gets hammered down',
  }, 4),
];
