/// Bank soal tambahan JLPT N5 bergaya ujian asli: 文脈規定, 言い換え類義,
/// 文法 (形式の判断 / 文の組み立て / 文章の文法), 読解 (短文・中文・情報検索),
/// dan 聴解 (課題理解・ポイント理解・発話表現・即時応答).
///
/// Konten disusun sendiri untuk latihan — bukan soal resmi JLPT. Kosakata
/// dan kanji dijaga di level N5 (kanji di luar daftar N5 ditulis hiragana).
///
/// Konvensi: pilihan PERTAMA pada setiap soal adalah jawaban benar
/// (`answer: 0`); layar ujian/latihan yang mengacak urutan pilihan.
library;

import '../models/exam.dart';
import '../models/listening.dart';
import 'mcq_bank.dart';

McqQuestion _q(String id, String en, List<String> options) =>
    McqQuestion(question: {'id': id, 'en': en}, options: options, answer: 0);

/// 文脈規定: kalimat dengan （　　）.
McqQuestion _v(String s, List<String> options) =>
    _q('Pilih kata yang tepat: $s', 'Choose the right word: $s', options);

/// 言い換え類義: bagian bergaris ditandai ＿…＿.
McqQuestion _r(String s, List<String> options) => _q(
  'Pilih yang artinya paling dekat: $s',
  'Choose the closest meaning: $s',
  options,
);

/// 文法形式の判断.
McqQuestion _g(String s, List<String> options) =>
    _q('Pilih yang tepat: $s', 'Choose the correct word: $s', options);

/// 文の組み立て: pilihan pertama = potongan di posisi ★.
McqQuestion _s(String s, List<String> options) => _q(
  'Kata mana yang masuk di ★? $s',
  'Which word goes in the ★ slot? $s',
  options,
);

/// 文章の文法: seluruh teks + nomor isian yang ditanyakan.
McqQuestion _t(String text, int n, List<String> options) => _q(
  'Bacalah teks berikut. Pilih yang paling tepat untuk （　$n　）.\n$text',
  'Read the text. Choose the best option for （　$n　）.\n$text',
  options,
);

ReadingPassage _p(
  String id,
  String titleId,
  String titleEn,
  String text,
  List<McqQuestion> questions,
) => ReadingPassage(
  id: id,
  title: {'id': titleId, 'en': titleEn},
  text: text,
  questions: questions,
);

ListeningPassage _l(
  String id,
  String titleId,
  String titleEn,
  String transcript,
  String translationId,
  String translationEn,
  List<McqQuestion> questions,
) => ListeningPassage(
  id: id,
  title: {'id': titleId, 'en': titleEn},
  transcript: transcript,
  translation: {'id': translationId, 'en': translationEn},
  questions: questions,
);

// ---------------------------------------------------------------------------
// 文じ・語彙 — 文脈規定
// ---------------------------------------------------------------------------
final List<McqQuestion> vocabContextN5 = [
  _v('わたしは まいあさ いえで しんぶんを （　　）。', ['よみます', 'ききます', 'うたいます', 'はなします']),
  _v('さむいですから、（　　）を きて ください。', ['セーター', 'くつ', 'ぼうし', 'めがね']),
  _v('この へやは くらいですね。でんきを （　　） ください。', ['つけて', 'けして', 'しめて', 'あけて']),
  _v('のどが かわきました。（　　）が のみたいです。', ['みず', 'パン', 'ごはん', 'にく']),
  _v('にちようびは しごとが ありませんから、あさ （　　） おきます。', ['おそく', 'はやく', 'みじかく', 'ひくく']),
  _v('わたしの いえは えきから （　　）です。あるいて 二分です。', ['ちかい', 'とおい', 'ひろい', 'おおきい']),
  _v('あめが ふって いますから、（　　）を もって いきます。', ['かさ', 'かぎ', 'さいふ', 'とけい']),
  _v('この ケーキは とても （　　）です。もう ひとつ 食べたいです。', ['おいしい', 'まずい', 'からい', 'つめたい']),
  _v('わたしの へやは せまいですが、あねの へやは （　　）です。', ['ひろい', 'くらい', 'ちいさい', 'みじかい']),
  _v('きのうは あたまが （　　）から、がっこうを 休みました。', ['いたかった', 'たかかった', 'ながかった', 'あかかった']),
  _v('（　　）で てがみを 出しました。', ['ゆうびんきょく', 'としょかん', 'ぎんこう', 'びょういん']),
  _v('としょかんで 本を 三さつ （　　）。', ['かりました', 'かしました', 'うりました', 'おしえました']),
  _v('すみません、しおを （　　） ください。', ['とって', 'とまって', 'とんで', 'しまって']),
  _v('せんしゅう、ともだちに てがみを （　　）。', ['かきました', 'ききました', 'ならいました', 'うたいました']),
  _v('まどを （　　） ください。かぜが つめたいです。', ['しめて', 'あけて', 'いれて', 'だして']),
  _v('わたしは まいばん 十一時に （　　）。', ['ねます', 'おきます', 'あらいます', 'すわります']),
  _v('（　　）が いたいですから、はいしゃへ 行きます。', ['は', 'あし', 'め', 'みみ']),
  _v('おなかが （　　）。なにか 食べましょう。', ['すきました', 'かわきました', 'つかれました', 'こまりました']),
  _v('この もじは ちいさいですから、（　　）を かけて よみます。', ['めがね', 'ぼうし', 'とけい', 'ネクタイ']),
  _v('じゅぎょうは 九時に はじまって、十時半に （　　）。', ['おわります', 'はじまります', 'でかけます', 'つきます']),
  _v('やおやで やさいを （　　）。', ['かいました', 'のみました', 'ききました', 'きりました']),
  _v('ここは （　　）ですから、しずかに して ください。', ['としょかん', 'こうえん', 'プール', 'えき']),
  _v('あには せが （　　）です。', ['たかい', 'ながい', 'おおい', 'ひろい']),
  _v('まいあさ シャワーを （　　）。', ['あびます', 'はいります', 'あらいます', 'いれます']),
  _v('ふゆは とても （　　）です。ゆきが たくさん ふります。', ['さむい', 'あつい', 'あたたかい', 'すずしい']),
  _v('この みちを まっすぐ 行って、二つめの かどを みぎに （　　） ください。', [
    'まがって',
    'わたって',
    'のぼって',
    'はいって',
  ]),
  _v('えきで でんしゃに （　　）。', ['のります', 'あがります', 'はいります', 'すわります']),
  _v('（　　）が ふって いますから、そとで あそびません。', ['あめ', 'はれ', 'そら', 'くも']),
  _v('わたしは ギターを （　　）のが すきです。', ['ひく', 'ふく', 'うたう', 'かける']),
  _v('きれいな やまの （　　）を とって、ともだちに みせました。', ['しゃしん', 'てがみ', 'はがき', 'きって']),
  _v('あついですね。まどを （　　）か。', ['あけましょう', 'しめましょう', 'けしましょう', 'つけましょう']),
  _v('この かばんは 一万円です。ちょっと （　　）ですね。', ['たかい', 'やすい', 'ひくい', 'おもい']),
  _v('きのう （　　）で えいがを 見ました。', ['えいがかん', 'ぎんこう', 'ゆうびんきょく', 'びょういん']),
  _v('かぜを ひきましたから、（　　）を のみました。', ['くすり', 'おさけ', 'ビール', 'コーヒー']),
  _v('わたしの （　　）は 四人です。ちちと ははと あにと わたしです。', ['かぞく', 'きょうだい', 'りょうしん', 'ともだち']),
  _v('はこの 中に ケーキが （　　） あります。', ['ふたつ', 'ふたり', 'にほん', 'にまい']),
  _v('つくえの 上に えんぴつが （　　） あります。', ['三本', '三まい', '三さつ', '三だい']),
  _v('きのう、デパートで シャツを 二（　　） かいました。', ['まい', 'ほん', 'ひき', 'だい']),
  _v('この みせは よる 十時まで （　　） います。', ['あいて', 'しめて', 'すんで', 'ならんで']),
  _v('えきの 前で ともだちを 三十分 （　　）。', ['まちました', 'あいました', 'よびました', 'おくりました']),
  _v('この へやは とても （　　）です。なにも きこえません。', ['しずか', 'にぎやか', 'きれい', 'ゆうめい']),
  _v('ナイフで りんごを はんぶんに （　　）。', ['きりました', 'きました', 'きえました', 'きこえました']),
  _v('（　　）で アメリカへ 行きました。', ['ひこうき', 'でんしゃ', 'じてんしゃ', 'タクシー']),
  _v('先生、この ことばの いみを （　　） ください。', ['おしえて', 'ならって', 'かして', 'かえして']),
];

// ---------------------------------------------------------------------------
// 文じ・語彙 — 言い換え類義
// ---------------------------------------------------------------------------
final List<McqQuestion> vocabParaphraseN5 = [
  _r('この へやは ＿くらい＿ です。', [
    'この へやは あかるくないです。',
    'この へやは あかるいです。',
    'この へやは ひろくないです。',
    'この へやは きれいじゃないです。',
  ]),
  _r('わたしは ＿りょうしん＿と すんで います。', [
    'わたしは ちちと ははと すんで います。',
    'わたしは あにと あねと すんで います。',
    'わたしは ともだちと すんで います。',
    'わたしは そふと そぼと すんで います。',
  ]),
  _r('きのうは ＿ひま＿でした。', [
    'きのうは いそがしくなかったです。',
    'きのうは いそがしかったです。',
    'きのうは げんきでした。',
    'きのうは さむくなかったです。',
  ]),
  _r('たなかさんは ＿ゆうめい＿です。', [
    'たなかさんを みんな しって います。',
    'たなかさんを だれも しりません。',
    'たなかさんは とても げんきです。',
    'たなかさんは とても やさしいです。',
  ]),
  _r('この 本は ＿おもしろくない＿です。', [
    'この 本は つまらないです。',
    'この 本は たのしいです。',
    'この 本は むずかしいです。',
    'この 本は やさしいです。',
  ]),
  _r('＿おととい＿ デパートへ 行きました。', [
    'ふつか まえに デパートへ 行きました。',
    'きのう デパートへ 行きました。',
    'みっか まえに デパートへ 行きました。',
    'せんしゅう デパートへ 行きました。',
  ]),
  _r('＿あさって＿ テストが あります。', [
    'あしたの つぎの 日に テストが あります。',
    'きょうの つぎの 日に テストが あります。',
    'きのうの つぎの 日に テストが あります。',
    'きのうの まえの 日に テストが ありました。',
  ]),
  _r('わたしは ＿まいばん＿ シャワーを あびます。', [
    'わたしは よる いつも シャワーを あびます。',
    'わたしは あさ いつも シャワーを あびます。',
    'わたしは よる ときどき シャワーを あびます。',
    'わたしは ひる いつも シャワーを あびます。',
  ]),
  _r('この みせは ＿やすい＿です。', [
    'この みせの ものは たかくないです。',
    'この みせの ものは たかいです。',
    'この みせの ものは ちいさいです。',
    'この みせの ものは おおきくないです。',
  ]),
  _r('やまださんは いま ＿でかけて います＿。', [
    'やまださんは いま うちに いません。',
    'やまださんは いま うちに います。',
    'やまださんは いま ねて います。',
    'やまださんは いま ごはんを 食べて います。',
  ]),
  _r('あには ＿きょうし＿です。', [
    'あには がっこうで おしえて います。',
    'あには がっこうで べんきょうして います。',
    'あには びょういんで はたらいて います。',
    'あには みせで はたらいて います。',
  ]),
  _r('この りょうりは ＿まずい＿です。', [
    'この りょうりは おいしくないです。',
    'この りょうりは おいしいです。',
    'この りょうりは からくないです。',
    'この りょうりは あまいです。',
  ]),
  _r('わたしは ＿りんごが すきじゃ ありません＿。', [
    'わたしは りんごが きらいです。',
    'わたしは りんごが だいすきです。',
    'わたしは りんごを よく 食べます。',
    'わたしは りんごが ほしいです。',
  ]),
  _r('ここは ＿だいどころ＿です。', [
    'ここで りょうりを します。',
    'ここで ねます。',
    'ここで シャワーを あびます。',
    'ここで べんきょうします。',
  ]),
  _r('＿ゆうべ＿ 雨が ふりました。', [
    'きのうの よる 雨が ふりました。',
    'きのうの あさ 雨が ふりました。',
    'けさ 雨が ふりました。',
    'こんばん 雨が ふります。',
  ]),
  _r('きょうは ＿いい てんき＿です。', [
    'きょうは はれて います。',
    'きょうは 雨が ふって います。',
    'きょうは くもって います。',
    'きょうは ゆきが ふって います。',
  ]),
  _r('スミスさんは 日本語が ＿じょうず＿です。', [
    'スミスさんは 日本語が よく できます。',
    'スミスさんは 日本語が あまり できません。',
    'スミスさんは 日本語が すきです。',
    'スミスさんは 日本語が きらいです。',
  ]),
  _r('この えんぴつは ＿みじかい＿です。', [
    'この えんぴつは ながくないです。',
    'この えんぴつは ながいです。',
    'この えんぴつは ほそいです。',
    'この えんぴつは ふるくないです。',
  ]),
  _r('＿おてあらい＿は どこですか。', [
    'トイレは どこですか。',
    'だいどころは どこですか。',
    'いりぐちは どこですか。',
    'でぐちは どこですか。',
  ]),
  _r('ははは ＿いつも＿ 六時に おきます。', [
    'ははは まいにち 六時に おきます。',
    'ははは ときどき 六時に おきます。',
    'ははは きのう 六時に おきました。',
    'ははは あまり 六時に おきません。',
  ]),
  _r('この こうえんは ＿にぎやか＿です。', [
    'この こうえんは 人が たくさん います。',
    'この こうえんは 人が あまり いません。',
    'この こうえんは とても きれいです。',
    'この こうえんは とても ひろいです。',
  ]),
  _r('わたしは ＿二時半＿に 来ました。', [
    'わたしは 二時 三十分に 来ました。',
    'わたしは 三時に 来ました。',
    'わたしは 二時 十五分に 来ました。',
    'わたしは 一時半に 来ました。',
  ]),
  _r('＿きょねん＿ 日本へ 行きました。', [
    '一年 まえに 日本へ 行きました。',
    '二年 まえに 日本へ 行きました。',
    '一か月 まえに 日本へ 行きました。',
    '一週間 まえに 日本へ 行きました。',
  ]),
  _r('これは ＿あたらしい＿ くつです。', [
    'これは ふるくない くつです。',
    'これは ふるい くつです。',
    'これは たかくない くつです。',
    'これは ちいさくない くつです。',
  ]),
  _r('あの レストランは ＿しずかじゃ ありません＿。', [
    'あの レストランは うるさいです。',
    'あの レストランは しずかです。',
    'あの レストランは きれいです。',
    'あの レストランは せまいです。',
  ]),
  _r('わたしの へやは ＿きたない＿です。', [
    'わたしの へやは きれいじゃ ありません。',
    'わたしの へやは きれいです。',
    'わたしの へやは ひろくないです。',
    'わたしの へやは あかるいです。',
  ]),
  _r('わたしは ともだちに 本を ＿かしました＿。', [
    'ともだちは わたしから 本を かりました。',
    'わたしは ともだちから 本を かりました。',
    'ともだちは わたしに 本を かしました。',
    'ともだちは 本を かいました。',
  ]),
];

// ---------------------------------------------------------------------------
// 文法 — 文章の文法 (teks)
// ---------------------------------------------------------------------------
const String _text1 =
    'わたしの 一日\n'
    'わたしは まいあさ 七時に おきます。あさごはんを 食べて（　1　） 学校へ 行きます。'
    '学校は うち（　2　） ちかいですから、あるいて 行きます。'
    '学校が おわった（　3　）、としょかんで べんきょうします。'
    'そして、よる 十一時に （　4　）。';

const String _text2 =
    'にちようび\n'
    'きのうは 日よう日でした。（　1　） いい 天気でしたから、母と こうえんへ 行きました。'
    'こうえんには 花が たくさん （　2　）。とても きれいでした。'
    'ひるごはんは こうえんの ちかくの 店で そばを 食べましたが、あまり （　3　）。'
    'それから デパートで くつを かいました。たのしい 一日（　4　）。';

const String _text3 =
    'リンさんへ\n'
    'らいしゅうの 土よう日、わたしの うちで パーティーを します。'
    'リンさんも （　1　）。パーティーは 六時からです。'
    'あとで、駅から うちまでの ちずを メールで （　2　）。'
    'うちは 駅の （　3　） ある 白い たてものです。'
    'のみものも 食べものも たくさん あります（　4　）、なにも かわないで ください。\n'
    'さくら';

// ---------------------------------------------------------------------------
// 文法 — 形式の判断 / 文の組み立て / 文章の文法
// ---------------------------------------------------------------------------
final List<McqQuestion> grammarN5More = [
  // 文法形式の判断
  _g('わたしは ねこ（　　） すきです。', ['が', 'を', 'に', 'で']),
  _g('つくえの 上（　　） 本が あります。', ['に', 'で', 'を', 'へ']),
  _g('うち（　　） 駅まで あるいて 十分です。', ['から', 'まで', 'に', 'を']),
  _g('バス（　　） 学校へ 行きます。', ['で', 'に', 'を', 'と']),
  _g('ともだち（　　） こうえんで あそびました。', ['と', 'を', 'が', 'へ']),
  _g('たなかさんは 学生です。わたし（　　） 学生です。', ['も', 'を', 'の', 'に']),
  _g('ひこうきは しんかんせん（　　） はやいです。', ['より', 'から', 'まで', 'ほど']),
  _g('これは だれ（　　） かさですか。', ['の', 'が', 'を', 'に']),
  _g('きのうは どこ（　　） 行きませんでした。', ['へも', 'へを', 'がも', 'をも']),
  _g('へやに だれ（　　） いません。', ['も', 'が', 'を', 'で']),
  _g('ばんごはんを 食べた（　　）、はを みがきます。', ['あとで', 'まえに', 'ながら', 'まで']),
  _g('ねる（　　）、はを みがきます。', ['まえに', 'あとで', 'のまえに', 'ながら']),
  _g('子どもの（　　）、よく この こうえんで あそびました。', ['とき', 'まえ', 'あと', 'から']),
  _g('あたまが いたい（　　）、今日は 学校を 休みます。', ['から', 'まで', 'けど', 'のに']),
  _g('この りんごは あまくて、（　　）です。', ['おいしい', 'おいしく', 'おいしくて', 'おいしさ']),
  _g('きのうは あまり （　　）。', ['さむくなかったです', 'さむいです', 'さむかったです', 'さむくないです']),
  _g('この へやは （　　）、ひろいです。', ['しずかで', 'しずかに', 'しずかな', 'しずかだ']),
  _g('もじを もっと （　　） かいて ください。', ['おおきく', 'おおきい', 'おおきくて', 'おおきな']),
  _g('わたしは あたらしい くつが （　　）です。', ['ほしい', 'ほしく', 'ほしくて', 'ほしさ']),
  _g('なつやすみに うみで （　　）たいです。', ['およぎ', 'およぐ', 'およいで', 'およいだ']),
  _g('いま、外は 雨が （　　）。', ['ふって います', 'ふって ください', 'ふりましょう', 'ふりたいです']),
  _g('すみません、この かんじの よみかたを （　　） ください。', ['おしえて', 'おしえ', 'おしえる', 'おしえた']),
  _g('Ａ「いっしょに ひるごはんを （　　）か。」Ｂ「ええ、食べましょう。」', ['食べません', '食べました', '食べたい', '食べて']),
  _g('つかれましたね。ちょっと （　　）。', ['やすみましょう', 'やすみたかったです', 'やすんで いません', 'やすみませんでした']),
  _g('わたしは ともだち（　　） 花を もらいました。', ['に', 'を', 'で', 'へ']),
  _g('わたしは たんじょうびに 父から とけいを （　　）。', ['もらいました', 'あげました', 'かしました', 'おしえました']),
  _g('きょうしつに 学生が （　　） います。', ['五人', '五本', '五まい', '五だい']),
  _g('にわに いぬが 二（　　） います。', ['ひき', 'にん', 'さつ', 'まい']),
  _g('ノートを 三（　　） かいました。', ['さつ', 'ほん', 'ひき', 'はい']),
  _g('コーヒーを 二（　　） のみました。', ['はい', 'まい', 'だい', 'さつ']),
  _g('わたしは いま とうきょうに （　　） います。', ['すんで', 'すみ', 'すむ', 'すんだ']),
  _g('あそこで しんぶんを （　　） 人は たなかさんです。', ['よんで いる', 'よんで', 'よみます', 'よみ']),
  _g('きのうの テストは （　　）でした。', ['かんたん', 'かんたんな', 'かんたんで', 'かんたんに']),
  _g('この へやは あまり （　　） ありません。', ['ひろく', 'ひろい', 'ひろいで', 'ひろくて']),
  _g('駅まで なに（　　） 行きますか。', ['で', 'を', 'が', 'と']),
  _g('Ａ「きのう だれ（　　） あいましたか。」Ｂ「山田さんです。」', ['に', 'を', 'で', 'へ']),
  _g('びょういんの 中です。たばこを （　　） ください。', ['すわないで', 'すわなくて', 'すわない', 'すわず']),
  _g('Ａ「たくさん ありますね。にもつを （　　）か。」Ｂ「ありがとうございます。」', [
    'もちましょう',
    'もちませんでした',
    'もって いました',
    'もちたかった',
  ]),

  // 文の組み立て
  _s('つくえの ＿＿ ＿＿ ★ ＿＿ あります。', ['ペン', '上に', 'あかい', 'が']),
  _s('わたしは ＿＿ ＿＿ ★ ＿＿ ほしいです。', ['かばん', 'あおくて', 'おおきい', 'が']),
  _s('これは ＿＿ ＿＿ ★ ＿＿ です。', ['つくった', 'ははが', 'きのう', 'ケーキ']),
  _s('わたしの ＿＿ ＿＿ ★ ＿＿ です。', ['かく', 'しゅみは', 'えを', 'こと']),
  _s('＿＿ ＿＿ ＿＿ ★ ください。', ['かいて', 'えんぴつ', 'で', 'なまえを']),
  _s('たなかさんは ＿＿ ＿＿ ★ ＿＿ います。', ['テレビを', 'めがねを', 'かけて', '見て']),
  _s('＿＿ ＿＿ ★ ＿＿ ほうが すきです。', ['より', 'わたしは', 'コーヒー', 'こうちゃの']),
  _s('＿＿ ＿＿ ★ ＿＿ 行きませんか。', ['さんぽ', 'いっしょに', 'こうえんへ', 'に']),
  _s('あの ＿＿ ＿＿ ★ ＿＿ わたしの あにです。', ['人', 'せの', 'たかい', 'は']),
  _s('きのうは ＿＿ ＿＿ ★ ＿＿ ねました。', ['から', 'あたまが', 'いたかった', 'はやく']),
  _s('わたしは まいばん ＿＿ ＿＿ ★ ＿＿ のみます。', ['あつい', 'ねる', 'まえに', 'ミルクを']),
  _s('ここは ＿＿ ＿＿ ★ ＿＿ ところです。', ['ひるごはんを', 'わたしが', 'いつも', '食べる']),
  _s('わたしは ＿＿ ＿＿ ★ ＿＿ なりたいです。', ['先生', '日本語を', 'おしえる', 'に']),
  _s('すみません、＿＿ ＿＿ ★ ＿＿ ください。', ['ペンを', 'その', 'あかい', 'とって']),
  _s('この ＿＿ ＿＿ ★ ＿＿ ですか。', ['だれ', 'かさ', 'は', 'の']),

  // 文章の文法
  _t(_text1, 1, ['から', 'まで', 'ので', 'ながら']),
  _t(_text1, 2, ['から', 'を', 'で', 'へ']),
  _t(_text1, 3, ['あとで', 'まえに', 'ながら', 'までに']),
  _t(_text1, 4, ['ねます', 'ねました', 'ねて', 'ねたい']),
  _t(_text2, 1, ['とても', 'あまり', 'ぜんぜん', 'もっと']),
  _t(_text2, 2, ['さいて いました', 'さきます', 'さいて ください', 'さきましょう']),
  _t(_text2, 3, ['おいしくなかったです', 'おいしかったです', 'おいしいです', 'おいしくないです']),
  _t(_text2, 4, ['でした', 'です', 'でしょう', 'じゃ ありません']),
  _t(_text3, 1, ['来ませんか', '来ましたか', '来て いますか', '来たかったですか']),
  _t(_text3, 2, ['おくります', 'おくって いました', 'おくりたかったです', 'おくりませんでした']),
  _t(_text3, 3, ['ちかくに', 'ちかくを', 'ちかくへ', 'ちかくで']),
  _t(_text3, 4, ['から', 'けど', 'が', 'と']),
];

// ---------------------------------------------------------------------------
// 読解 — 内容理解 (短文・中文) & 情報検索
// ---------------------------------------------------------------------------
final List<ReadingPassage> readingJaN5More = [
  // ---- 短文 ----
  _p(
    'ja_r5m_1',
    'Memo dari ibu',
    'A memo from Mom',
    'ゆみへ\n'
        '母は 今日 びょういんへ 行きます。五時ごろ かえります。'
        'れいぞうこに ケーキが ありますから、学校から かえって、食べて ください。'
        'それから、三時に 父の 友だちが 来ます。'
        'つくえの 上の 青い 本を あげて ください。\n'
        '母より',
    [
      _q(
        'Apa yang harus Yumi berikan kepada teman ayah?',
        "What should Yumi give to her father's friend?",
        ['つくえの 上の 青い 本', 'つくえの 上の 赤い 本', 'れいぞうこの ケーキ', '母の てがみ'],
      ),
      _q('Jam berapa ibu pulang?', 'What time will Mom come home?', [
        '五時ごろ',
        '三時ごろ',
        '四時ごろ',
        '六時ごろ',
      ]),
      _q(
        'Apa yang boleh Yumi lakukan setelah pulang sekolah?',
        'What can Yumi do after coming home from school?',
        ['ケーキを 食べる', 'びょういんへ 行く', '父の 友だちの うちへ 行く', '母に でんわする'],
      ),
    ],
  ),
  _p(
    'ja_r5m_2',
    'Email dari Maria',
    'An email from Maria',
    'キムさん\n'
        'あしたの えいがの ことです。二時の えいがは もう せきが ありません。'
        'だから、四時半の えいがを 見ませんか。'
        'わたしは 四時に 駅の 西口で まって います。'
        'えいがの あとで、いっしょに ばんごはんを 食べましょう。\n'
        'マリア',
    [
      _q(
        'Film jam berapa yang akan mereka tonton?',
        'Which showing will they watch?',
        ['四時半の えいが', '二時の えいが', '四時の えいが', '三時の えいが'],
      ),
      _q('Di mana Maria akan menunggu?', 'Where will Maria wait?', [
        '駅の 西口',
        '駅の 東口',
        'えいがかんの 前',
        'レストランの 前',
      ]),
      _q(
        'Kenapa mereka tidak menonton film jam dua?',
        "Why won't they watch the two o'clock film?",
        ['せきが ないから', 'じかんが ないから', 'おもしろくないから', 'たかいから'],
      ),
    ],
  ),
  _p(
    'ja_r5m_3',
    'Buku harian hari Sabtu',
    'A Saturday diary',
    '十月 五日（土）\n'
        '今日は あさから 雨でした。だから、どこへも 行きませんでした。'
        '午前中は へやで 本を 読みました。'
        '午後、友だちの さくらさんが 来ました。二人で ケーキを つくりました。'
        'ケーキは すこし かたかったですが、おいしかったです。',
    [
      _q(
        'Apa yang dilakukan penulis pada pagi hari?',
        'What did the writer do in the morning?',
        ['本を 読んだ', 'ケーキを つくった', '出かけた', '友だちの うちへ 行った'],
      ),
      _q(
        'Kenapa penulis tidak pergi ke mana-mana?',
        "Why didn't the writer go anywhere?",
        ['雨だったから', 'さむかったから', 'しごとが あったから', 'びょうきだったから'],
      ),
      _q('Bagaimana kuenya?', 'How was the cake?', [
        'すこし かたかったが、おいしかった',
        'かたくて、おいしくなかった',
        'とても あまかった',
        'あまり おいしくなかった',
      ]),
    ],
  ),
  _p(
    'ja_r5m_4',
    'Pesan dari guru',
    "A message from the teacher",
    'みなさんへ\n'
        'あしたの じゅぎょうは 九時からでは ありません。十時からです。'
        'きょうしつも かわります。二かいの 3ばん きょうしつでは なくて、'
        '三がいの 5ばん きょうしつです。'
        'じしょを わすれないで ください。\n'
        '山田',
    [
      _q(
        'Besok pelajaran mulai jam berapa?',
        'What time does class start tomorrow?',
        ['十時', '九時', '三時', '五時'],
      ),
      _q('Di ruang mana pelajaran besok?', "Where is tomorrow's class?", [
        '三がいの 5ばん きょうしつ',
        '二かいの 3ばん きょうしつ',
        '三がいの 3ばん きょうしつ',
        '二かいの 5ばん きょうしつ',
      ]),
      _q('Apa yang harus dibawa?', 'What must the students bring?', [
        'じしょ',
        'ノート',
        'えんぴつ',
        'しゃしん',
      ]),
    ],
  ),
  _p(
    'ja_r5m_5',
    'Izin tidak masuk',
    'Calling in sick',
    '先生\n'
        'たなかです。きのうの よるから ねつが あって、あたまも いたいです。'
        'ですから、今日は 学校を 休みます。午後、びょういんへ 行きます。'
        'しゅくだいは あした 出します。すみません。',
    [
      _q('Kenapa Tanaka tidak masuk sekolah?', 'Why is Tanaka absent?', [
        'ねつが あるから',
        'ねぼうしたから',
        '電車が おくれたから',
        'しゅくだいを わすれたから',
      ]),
      _q(
        'Kapan Tanaka akan menyerahkan PR?',
        'When will Tanaka hand in the homework?',
        ['あした', '今日', '今日の 午後', 'らいしゅう'],
      ),
      _q(
        'Apa yang akan Tanaka lakukan siang ini?',
        'What will Tanaka do this afternoon?',
        ['びょういんへ 行く', '学校へ 行く', 'しゅくだいを 出す', '先生に でんわする'],
      ),
    ],
  ),
  _p(
    'ja_r5m_6',
    'Kartu pos dari perjalanan',
    'A postcard from a trip',
    'お母さん、おげんきですか。\n'
        'わたしは いま 北の ほうの まちに います。ここは とても さむいです。'
        'きのうは ゆきが ふりました。今日は 山へ 行きました。'
        '山の 上から 見た まちは とても きれいでした。'
        'あさって かえります。おみやげに おかしを かいました。\n'
        'はなこ',
    [
      _q('Bagaimana cuaca kemarin?', 'What was the weather like yesterday?', [
        'ゆきが ふった',
        '雨が ふった',
        'はれて いた',
        'かぜが つよかった',
      ]),
      _q('Kapan Hanako pulang?', 'When will Hanako come home?', [
        'あさって',
        'あした',
        '今日',
        'らいしゅう',
      ]),
      _q('Hari ini Hanako pergi ke mana?', 'Where did Hanako go today?', [
        '山',
        'うみ',
        '川',
        'デパート',
      ]),
    ],
  ),

  // ---- 中文 ----
  _p(
    'ja_r5m_7',
    'Kotaku',
    'My town',
    'わたしは 大学生です。いま とうきょうの ちかくの 小さい まちに すんで います。'
        'まちの まん中に 駅が あります。駅の 前には スーパーや 本やが あって、'
        'いつも 人が おおいです。'
        'わたしの アパートは 駅から あるいて 十五分ですから、すこし とおいです。'
        'でも、アパートの ちかくには 大きい こうえんが あります。'
        'わたしは まいあさ その こうえんを 三十分ぐらい はしります。'
        'こうえんの 中には 川が あって、なつは 子どもたちが 川で あそびます。'
        'わたしは この まちが とても すきです。'
        'でも、一つ こまる ことが あります。駅の 前の 店は よる 十時に ぜんぶ しまります。'
        'だから、よる おそく 何か ほしい ときは、こまります。',
    [
      _q(
        'Bagaimana letak apartemen penulis?',
        "Where is the writer's apartment?",
        ['駅から すこし とおい', '駅の すぐ 前に ある', 'こうえんの 中に ある', 'とうきょうの まん中に ある'],
      ),
      _q(
        'Apa yang penulis lakukan setiap pagi?',
        'What does the writer do every morning?',
        ['こうえんを はしる', '川で あそぶ', '駅の 前の 店で はたらく', '本やへ 行く'],
      ),
      _q(
        'Apa yang membuat penulis kesulitan?',
        'What is a problem for the writer?',
        [
          'よる おそく 店が あいて いない こと',
          'アパートが せまい こと',
          '人が おおくて うるさい こと',
          'こうえんが ない こと',
        ],
      ),
    ],
  ),
  _p(
    'ja_r5m_8',
    'Belajar bahasa Jepang',
    'Studying Japanese',
    'わたしは インドネシア人の アリです。一年 まえに 日本へ 来ました。'
        '日本へ 来る まえに、インドネシアで 半年 日本語を べんきょうしました。'
        'でも、日本に 来た とき、日本人の 話が ぜんぜん わかりませんでした。'
        'みんな とても はやく 話したからです。'
        'それで、毎日 日本語学校で べんきょうして、よるは うちで 日本の テレビを 見ました。'
        'いまは 日本人の 友だちと たくさん 話します。'
        '話すのは すこし じょうずに なりましたが、かんじは まだ むずかしいです。'
        'らいねんは 日本の 大学で べんきょうしたいです。',
    [
      _q(
        'Apa yang sulit bagi Ali saat baru tiba di Jepang?',
        'What was hard for Ali when he first came to Japan?',
        ['日本人の 話が わからなかった', '日本の 食べものが きらいだった', '友だちが いなかった', 'テレビが なかった'],
      ),
      _q('Kenapa begitu?', 'Why was that?', [
        '日本人が はやく 話したから',
        '日本人が 小さい こえで 話したから',
        '日本語を べんきょうしなかったから',
        'インドネシア語で 話したから',
      ]),
      _q(
        'Apa yang masih sulit bagi Ali sekarang?',
        'What is still difficult for Ali now?',
        ['かんじ', '話すこと', '聞くこと', '日本の 食べもの'],
      ),
    ],
  ),
  _p(
    'ja_r5m_9',
    'Ulang tahun ayah',
    "Dad's birthday",
    '先週の 土よう日は 父の たんじょうびでした。'
        '母と あにと わたしは 三人で 父への プレゼントを かんがえました。'
        'あには 「ネクタイが いい。」と 言いました。'
        'でも、父は しごとで 毎日 ネクタイを しますから、もう たくさん もって います。'
        '母は 「りょうりの 本は どう？」と 言いました。'
        '父は さいきん りょうりを はじめたからです。わたしも それが いいと おもいました。'
        '金よう日に 三人で 駅の ちかくの 本やへ 行って、りょうりの 本を かいました。'
        '父は 「ありがとう。」と 言いました。'
        'そして、その よる、父は その 本を 見て、カレーを つくりました。',
    [
      _q(
        'Kenapa mereka tidak memilih dasi?',
        "Why didn't they choose a necktie?",
        [
          '父は ネクタイを たくさん もって いるから',
          '父は ネクタイが きらいだから',
          'ネクタイは たかいから',
          '母が ネクタイを かったから',
        ],
      ),
      _q('Apa yang mereka beli?', 'What did they buy?', [
        'りょうりの 本',
        'ネクタイ',
        'カレー',
        'しんぶん',
      ]),
      _q('Apa yang dilakukan ayah malam itu?', 'What did Dad do that night?', [
        'カレーを つくった',
        'レストランへ 行った',
        'ネクタイを した',
        '本やへ 行った',
      ]),
    ],
  ),

  // ---- 情報検索 ----
  _p(
    'ja_r5m_10',
    'Jam buka perpustakaan',
    'Library opening hours',
    'みどりまち としょかん\n'
        '\n'
        'あいて いる 時間\n'
        '月よう日～金よう日　午前九時～午後七時\n'
        '土よう日・日よう日　午前十時～午後五時\n'
        '休み：毎月 さいごの 水よう日\n'
        '\n'
        '本を かりる 人へ\n'
        '・本は 一人 五さつまでです。\n'
        '・かりた 本は 二週間 あとに かえして ください。',
    [
      _q(
        'Hari Sabtu, perpustakaan buka sampai jam berapa?',
        'Until what time is the library open on Saturday?',
        ['午後五時', '午後七時', '午前十時', '午前九時'],
      ),
      _q(
        'Berapa buku paling banyak yang boleh dipinjam satu orang?',
        'How many books can one person borrow at most?',
        ['五さつ', '二さつ', '七さつ', '十さつ'],
      ),
      _q(
        'Kalau meminjam buku hari ini, kapan harus dikembalikan?',
        'If you borrow a book today, when must you return it?',
        ['二週間 あと', '一週間 あと', '五日 あと', '一か月 あと'],
      ),
    ],
  ),
  _p(
    'ja_r5m_11',
    'Menu kafe',
    'Café menu',
    'きっさ さくら　メニュー\n'
        '\n'
        'コーヒー　　　　三百円\n'
        'こうちゃ　　　　三百円\n'
        'ジュース　　　　二百五十円\n'
        'ケーキ　　　　　四百円\n'
        'サンドイッチ　　五百円\n'
        '\n'
        '★ 午前十一時までは、コーヒーと サンドイッチで 七百円です。',
    [
      _q(
        'Jam 10 pagi kamu memesan kopi dan sandwich. Berapa harganya?',
        'At 10 a.m. you order coffee and a sandwich. How much is it?',
        ['七百円', '八百円', '五百円', '三百円'],
      ),
      _q(
        'Jam 2 siang kamu memesan jus dan kue. Berapa harganya?',
        'At 2 p.m. you order juice and cake. How much is it?',
        ['六百五十円', '七百円', '五百円', '六百円'],
      ),
      _q('Apa yang paling murah?', 'What is the cheapest item?', [
        'ジュース',
        'コーヒー',
        'こうちゃ',
        'ケーキ',
      ]),
    ],
  ),
  _p(
    'ja_r5m_12',
    'Jadwal bus',
    'Bus timetable',
    'さくら駅 → みなみ山　バスの 時間\n'
        '\n'
        '月よう日～金よう日：七時十分　八時十分　九時四十分　十二時　三時半\n'
        '土よう日・日よう日：八時　十時　一時　四時\n'
        '\n'
        '・さくら駅から みなみ山まで 四十分 かかります。\n'
        '・みなみ山から 駅への さいごの バスは 午後六時です。',
    [
      _q(
        'Hari Sabtu kamu tiba di stasiun jam 9. Bus berikutnya jam berapa?',
        'On Saturday you arrive at the station at 9. When is the next bus?',
        ['十時', '八時', '九時四十分', '一時'],
      ),
      _q(
        'Kalau naik bus jam 8.10 hari Senin, jam berapa tiba di Minamiyama?',
        'If you take the 8:10 bus on Monday, when do you reach Minamiyama?',
        ['八時五十分', '八時四十分', '九時十分', '八時半'],
      ),
      _q(
        'Bus terakhir dari Minamiyama ke stasiun jam berapa?',
        'When is the last bus from Minamiyama to the station?',
        ['午後六時', '午後四時', '午後三時半', '午後五時'],
      ),
    ],
  ),
  _p(
    'ja_r5m_13',
    'Poster festival musim panas',
    'Summer festival poster',
    'みなみまち なつまつり\n'
        '\n'
        '日：八月 十日（土）と 十一日（日）\n'
        '時間：午後四時～九時\n'
        'ところ：みなみ小学校\n'
        '\n'
        '・八時から 花火が あります。\n'
        '・雨の ときは、八月 十七日（土）に します。\n'
        '・ゆかたで 来た 人には、ジュースを 一本 あげます。',
    [
      _q('Jam berapa ada kembang api?', 'What time are the fireworks?', [
        '午後八時',
        '午後四時',
        '午後九時',
        '午後六時',
      ]),
      _q(
        'Kalau hujan, festival diadakan kapan?',
        'If it rains, when will the festival be held?',
        ['八月 十七日', '八月 十二日', '八月 十八日', '九月 十日'],
      ),
      _q(
        'Apa yang didapat orang yang datang memakai yukata?',
        'What do people who come in a yukata get?',
        ['ジュース', '花火', 'はがき', 'おかし'],
      ),
    ],
  ),
];

// ---------------------------------------------------------------------------
// 聴解 — 課題理解 / ポイント理解 / 発話表現 / 即時応答
// ---------------------------------------------------------------------------
final List<ListeningPassage> listeningJaN5More = [
  // ---- 課題理解 ----
  _l(
    'ja_5m_1',
    'Persiapan ke gunung',
    'Getting ready for the mountain',
    '先生が 学生に 話して います。学生は あした 何を もって 行きますか。'
        'みなさん、あしたは 山へ 行きます。おべんとうと 水を もって きて ください。'
        '山は さむいですから、セーターも わすれないで ください。'
        'カメラは いりません。先生が しゃしんを とります。',
    'Guru berbicara kepada murid. Apa yang dibawa murid besok? '
        'Semuanya, besok kita pergi ke gunung. Tolong bawa bekal dan air. '
        'Di gunung dingin, jadi jangan lupa sweter juga. '
        'Kamera tidak perlu. Guru yang akan memotret.',
    'A teacher is talking to students. What will the students bring tomorrow? '
        'Everyone, tomorrow we are going to the mountain. Please bring a lunch box and water. '
        'It is cold on the mountain, so do not forget a sweater. '
        'You do not need a camera. I will take the photos.',
    [
      _q('Apa yang TIDAK perlu dibawa?', 'What does NOT need to be brought?', [
        'カメラ',
        'おべんとう',
        '水',
        'セーター',
      ]),
      _q('Kenapa perlu membawa sweter?', 'Why is a sweater needed?', [
        '山は さむいから',
        '雨が ふるから',
        'よる おそく かえるから',
        'かぜを ひいて いるから',
      ]),
      _q('Besok mereka pergi ke mana?', 'Where are they going tomorrow?', [
        '山',
        'うみ',
        '川',
        'こうえん',
      ]),
    ],
  ),
  _l(
    'ja_5m_2',
    'Titipan belanja',
    'A shopping errand',
    'お母さんと 男の子が 話して います。男の子は 何を かいますか。'
        'たろう、スーパーへ 行って、たまごを 一パック かって きて。'
        'あ、それから ぎゅうにゅうも 二本 おねがい。'
        'パンは？ パンは まだ あるから、いいわ。',
    'Ibu dan anak laki-laki berbicara. Apa yang dibeli anak itu? '
        'Taro, pergi ke supermarket dan belikan satu pak telur. '
        'Oh, lalu susu juga dua botol ya. '
        'Rotinya? Roti masih ada, jadi tidak usah.',
    'A mother and a boy are talking. What will the boy buy? '
        'Taro, go to the supermarket and buy a pack of eggs. '
        'Oh, and two bottles of milk too, please. '
        'What about bread? We still have bread, so that is fine.',
    [
      _q('Apa yang dibeli anak itu?', 'What will the boy buy?', [
        'たまごと ぎゅうにゅう',
        'たまごと パン',
        'パンと ぎゅうにゅう',
        'たまごと ぎゅうにゅうと パン',
      ]),
      _q('Berapa botol susu?', 'How many bottles of milk?', [
        '二本',
        '一本',
        '三本',
        '四本',
      ]),
      _q(
        'Kenapa roti tidak perlu dibeli?',
        "Why doesn't he need to buy bread?",
        ['まだ あるから', 'たかいから', 'おいしくないから', 'スーパーに ないから'],
      ),
    ],
  ),
  _l(
    'ja_5m_3',
    'Janji nonton film',
    'Plans for a movie',
    '男の 人と 女の 人が 話して います。二人は 何時に どこで あいますか。'
        'あしたの えいが、何時に あいましょうか。'
        'えいがは 二時からですね。じゃあ、一時半に えいがかんの 前は どうですか。'
        'あ、その 前に いっしょに ひるごはんを 食べませんか。十二時に 駅で あいましょう。'
        'いいですね。そう しましょう。',
    'Seorang pria dan wanita berbicara. Jam berapa dan di mana mereka bertemu? '
        'Film besok, kita bertemu jam berapa? '
        'Filmnya mulai jam dua, ya. Kalau begitu, jam setengah dua di depan bioskop bagaimana? '
        'Oh, sebelum itu bagaimana kalau makan siang bersama? Kita bertemu jam dua belas di stasiun. '
        'Boleh. Ayo begitu saja.',
    'A man and a woman are talking. When and where will they meet? '
        'What time shall we meet for the movie tomorrow? '
        'The movie starts at two, right? Then how about 1:30 in front of the cinema? '
        'Oh, before that, why don\'t we have lunch together? Let\'s meet at the station at twelve. '
        'Sounds good. Let\'s do that.',
    [
      _q('Jam berapa mereka bertemu?', 'What time will they meet?', [
        '十二時',
        '一時半',
        '二時',
        '一時',
      ]),
      _q('Di mana mereka bertemu?', 'Where will they meet?', [
        '駅',
        'えいがかんの 前',
        'レストラン',
        '学校の 前',
      ]),
      _q(
        'Apa yang mereka lakukan sebelum menonton film?',
        'What will they do before the movie?',
        ['ひるごはんを 食べる', 'かいものを する', 'おちゃを のむ', 'さんぽを する'],
      ),
    ],
  ),

  // ---- ポイント理解 ----
  _l(
    'ja_5m_4',
    'Akhir pekan',
    'The weekend',
    '男の 人と 女の 人が 話して います。女の 人は 日よう日に 何を しましたか。'
        '山田さん、しゅうまつは 何を しましたか。'
        '土よう日は 友だちと テニスを しました。'
        '日よう日は 雨でしたから、どこへも 行きませんでした。うちで 本を 読みました。'
        'そうですか。わたしは 日よう日、えいがを 見に 行きましたよ。',
    'Seorang pria dan wanita berbicara. Apa yang dilakukan wanita itu hari Minggu? '
        'Yamada-san, akhir pekan ngapain? '
        'Hari Sabtu saya main tenis dengan teman. '
        'Hari Minggu hujan, jadi saya tidak pergi ke mana-mana. Saya membaca buku di rumah. '
        'Oh begitu. Saya hari Minggu pergi menonton film.',
    'A man and a woman are talking. What did the woman do on Sunday? '
        'Yamada-san, what did you do on the weekend? '
        'On Saturday I played tennis with a friend. '
        'On Sunday it rained, so I did not go anywhere. I read a book at home. '
        'I see. I went to see a movie on Sunday.',
    [
      _q(
        'Apa yang dilakukan wanita itu hari Minggu?',
        'What did the woman do on Sunday?',
        ['うちで 本を 読んだ', 'テニスを した', 'えいがを 見に 行った', 'かいものを した'],
      ),
      _q(
        'Dengan siapa wanita itu bermain tenis?',
        'Who did the woman play tennis with?',
        ['友だち', 'あに', '母', '先生'],
      ),
      _q('Bagaimana cuaca hari Minggu?', 'What was the weather on Sunday?', [
        '雨',
        'はれ',
        'ゆき',
        'くもり',
      ]),
    ],
  ),
  _l(
    'ja_5m_5',
    'Membeli kemeja',
    'Buying shirts',
    '店の 人と 女の 人が 話して います。女の 人は ぜんぶで いくら はらいますか。'
        'すみません、この 青い シャツは いくらですか。'
        'それは 二千円です。こちらの 白い シャツは 千五百円です。'
        'じゃあ、白いのを 二まい ください。'
        'はい、ぜんぶで 三千円です。',
    'Penjual dan seorang wanita berbicara. Berapa total yang dibayar wanita itu? '
        'Permisi, kemeja biru ini berapa? '
        'Itu dua ribu yen. Kemeja putih yang ini seribu lima ratus yen. '
        'Kalau begitu, yang putih dua helai. '
        'Baik, semuanya tiga ribu yen.',
    'A shop clerk and a woman are talking. How much does the woman pay in total? '
        'Excuse me, how much is this blue shirt? '
        'That one is 2,000 yen. This white shirt is 1,500 yen. '
        'Then I\'ll take two of the white ones. '
        'Okay, that is 3,000 yen in total.',
    [
      _q('Kemeja apa yang dibeli?', 'Which shirt did she buy?', [
        '白い シャツ',
        '青い シャツ',
        '赤い シャツ',
        'きいろい シャツ',
      ]),
      _q('Berapa helai yang dibeli?', 'How many did she buy?', [
        '二まい',
        '一まい',
        '三まい',
        '四まい',
      ]),
      _q('Berapa totalnya?', 'What is the total?', [
        '三千円',
        '二千円',
        '千五百円',
        '四千円',
      ]),
    ],
  ),
  _l(
    'ja_5m_6',
    'Terlambat ke sekolah',
    'Late for school',
    '男の 学生と 女の 学生が 話して います。男の 学生は どうして おそく なりましたか。'
        'おはようございます。今日は おそかったですね。'
        'ええ、電車が 二十分 おくれました。'
        'たいへんでしたね。'
        'はい。駅から 学校まで はしりましたから、とても つかれました。',
    'Murid laki-laki dan murid perempuan berbicara. Kenapa murid laki-laki terlambat? '
        'Selamat pagi. Hari ini kamu terlambat, ya. '
        'Iya, keretanya terlambat dua puluh menit. '
        'Repot sekali, ya. '
        'Iya. Saya berlari dari stasiun ke sekolah, jadi capek sekali.',
    'A male student and a female student are talking. Why was the male student late? '
        'Good morning. You were late today. '
        'Yes, the train was twenty minutes late. '
        'That must have been tough. '
        'Yes. I ran from the station to school, so I am very tired.',
    [
      _q('Kenapa dia terlambat?', 'Why was he late?', [
        '電車が おくれたから',
        'ねぼうしたから',
        'バスが 来なかったから',
        'あたまが いたかったから',
      ]),
      _q(
        'Berapa menit keretanya terlambat?',
        'How many minutes late was the train?',
        ['二十分', '十分', '三十分', '十五分'],
      ),
      _q(
        'Bagaimana dia pergi dari stasiun ke sekolah?',
        'How did he get from the station to school?',
        ['はしった', 'あるいた', 'バスに のった', 'タクシーに のった'],
      ),
    ],
  ),
  _l(
    'ja_5m_7',
    'Kacamata hilang',
    'Lost glasses',
    '女の 人と 男の 人が 話して います。めがねは どこに ありましたか。'
        'あれ、わたしの めがね、しりませんか。'
        'テーブルの 上に ありませんか。'
        'ありません。テレビの 上も 見ました。'
        'あ、いすの 下に ありますよ。',
    'Seorang wanita dan pria berbicara. Di mana kacamatanya? '
        'Lho, kamu tahu kacamata saya? '
        'Tidak ada di atas meja? '
        'Tidak ada. Di atas TV juga sudah saya lihat. '
        'Ah, ada di bawah kursi.',
    'A woman and a man are talking. Where were the glasses? '
        'Huh, do you know where my glasses are? '
        'Aren\'t they on the table? '
        'No. I looked on top of the TV too. '
        'Oh, they are under the chair.',
    [
      _q('Di mana kacamatanya?', 'Where were the glasses?', [
        'いすの 下',
        'テーブルの 上',
        'テレビの 上',
        'かばんの 中',
      ]),
      _q(
        'Selain di atas meja, di mana wanita itu sudah mencari?',
        'Besides the table, where had the woman already looked?',
        ['テレビの 上', 'いすの 下', 'ベッドの 下', 'かばんの 中'],
      ),
    ],
  ),

  // ---- 発話表現 ----
  _l(
    'ja_5m_8',
    'Apa yang kamu katakan? (1)',
    'What do you say? (1)',
    '一ばん。友だちの えんぴつを かりたいです。何と 言いますか。'
        '二ばん。あさ、学校で 先生に あいました。何と 言いますか。'
        '三ばん。ごはんを 食べる 前です。何と 言いますか。',
    'Nomor satu. Kamu ingin meminjam pensil teman. Apa yang kamu katakan? '
        'Nomor dua. Pagi hari kamu bertemu guru di sekolah. Apa yang kamu katakan? '
        'Nomor tiga. Sebelum makan. Apa yang kamu katakan?',
    'Number one. You want to borrow a friend\'s pencil. What do you say? '
        'Number two. In the morning you meet your teacher at school. What do you say? '
        'Number three. You are about to eat. What do you say?',
    [
      _q(
        'Kamu ingin meminjam pensil teman. Apa yang kamu katakan?',
        "You want to borrow a friend's pencil. What do you say?",
        [
          'えんぴつを かして ください。',
          'えんぴつを かりて ください。',
          'えんぴつを あげましょうか。',
          'えんぴつを かいましたか。',
        ],
      ),
      _q(
        'Pagi hari kamu bertemu guru di sekolah. Apa yang kamu katakan?',
        'In the morning you meet your teacher at school. What do you say?',
        ['おはようございます。', 'こんばんは。', 'おやすみなさい。', 'さようなら。'],
      ),
      _q(
        'Kamu akan mulai makan. Apa yang kamu katakan?',
        'You are about to start eating. What do you say?',
        ['いただきます。', 'ごちそうさまでした。', 'いってきます。', 'ただいま。'],
      ),
    ],
  ),
  _l(
    'ja_5m_9',
    'Apa yang kamu katakan? (2)',
    'What do you say? (2)',
    '一ばん。友だちの うちから かえります。何と 言いますか。'
        '二ばん。レストランで 水が ほしいです。店の 人に 何と 言いますか。'
        '三ばん。友だちが かぜを ひきました。何と 言いますか。',
    'Nomor satu. Kamu pulang dari rumah teman. Apa yang kamu katakan? '
        'Nomor dua. Di restoran kamu ingin air. Apa yang kamu katakan kepada pelayan? '
        'Nomor tiga. Temanmu masuk angin. Apa yang kamu katakan?',
    'Number one. You are leaving a friend\'s house. What do you say? '
        'Number two. At a restaurant you want some water. What do you say to the staff? '
        'Number three. Your friend has caught a cold. What do you say?',
    [
      _q(
        'Kamu pamit pulang dari rumah teman. Apa yang kamu katakan?',
        "You are leaving a friend's house. What do you say?",
        ['おじゃましました。', 'おじゃまします。', 'いらっしゃいませ。', 'いってらっしゃい。'],
      ),
      _q(
        'Di restoran kamu ingin air. Apa yang kamu katakan kepada pelayan?',
        'At a restaurant you want water. What do you say to the staff?',
        ['すみません、水を ください。', '水は いかがですか。', '水を のみましょう。', '水が すきです。'],
      ),
      _q(
        'Temanmu sedang masuk angin. Apa yang kamu katakan?',
        'Your friend has a cold. What do you say?',
        ['おだいじに。', 'おめでとうございます。', 'おかえりなさい。', 'いただきます。'],
      ),
    ],
  ),
  _l(
    'ja_5m_10',
    'Apa yang kamu katakan? (3)',
    'What do you say? (3)',
    '一ばん。駅が どこか わかりません。みちを 聞きたいです。何と 言いますか。'
        '二ばん。先生が おもい にもつを もって います。何と 言いますか。'
        '三ばん。友だちと いっしょに テニスを したいです。何と 言いますか。',
    'Nomor satu. Kamu tidak tahu di mana stasiun. Kamu ingin bertanya jalan. Apa yang kamu katakan? '
        'Nomor dua. Gurumu membawa barang berat. Apa yang kamu katakan? '
        'Nomor tiga. Kamu ingin bermain tenis bersama teman. Apa yang kamu katakan?',
    'Number one. You do not know where the station is and want to ask the way. What do you say? '
        'Number two. Your teacher is carrying heavy bags. What do you say? '
        'Number three. You want to play tennis with a friend. What do you say?',
    [
      _q(
        'Kamu ingin bertanya di mana stasiun. Apa yang kamu katakan?',
        'You want to ask where the station is. What do you say?',
        ['すみません、駅は どこですか。', '駅へ 行きましょう。', '駅は あそこです。', '駅まで おくりましょうか。'],
      ),
      _q(
        'Gurumu membawa barang berat dan kamu ingin membantu. Apa yang kamu katakan?',
        'Your teacher is carrying something heavy and you want to help. What do you say?',
        ['先生、もちましょうか。', '先生、もって ください。', '先生、もちませんでしたか。', '先生、おもいですか。'],
      ),
      _q(
        'Kamu ingin mengajak teman bermain tenis. Apa yang kamu katakan?',
        'You want to invite a friend to play tennis. What do you say?',
        [
          'いっしょに テニスを しませんか。',
          'いっしょに テニスを しましたか。',
          'テニスが へたですね。',
          'テニスは どこですか。',
        ],
      ),
    ],
  ),

  // ---- 即時応答 ----
  _l(
    'ja_5m_11',
    'Jawab dengan cepat (1)',
    'Quick response (1)',
    'あしたは 何時に 来ますか。',
    'Besok kamu datang jam berapa?',
    'What time are you coming tomorrow?',
    [
      _q('Apa jawaban yang paling tepat?', 'What is the best reply?', [
        '九時に 来ます。',
        'はい、来ました。',
        'あしたです。',
        '九時でした。',
      ]),
      _q('Apa yang ditanyakan?', 'What is being asked?', [
        '来る 時間',
        '来る 日',
        '来る 人',
        '来る ところ',
      ]),
    ],
  ),
  _l(
    'ja_5m_12',
    'Jawab dengan cepat (2)',
    'Quick response (2)',
    'この かさ、だれのですか。',
    'Payung ini punya siapa?',
    'Whose umbrella is this?',
    [
      _q('Apa jawaban yang paling tepat?', 'What is the best reply?', [
        'わたしのです。',
        'はい、かさです。',
        '一本です。',
        'あそこに あります。',
      ]),
      _q(
        'Payung itu bukan milikmu. Jawaban mana yang tepat?',
        'The umbrella is not yours. Which reply is right?',
        ['わたしのじゃ ありません。', 'わたしのです。', 'はい、そうです。', 'かさが ありません。'],
      ),
    ],
  ),
  _l(
    'ja_5m_13',
    'Jawab dengan cepat (3)',
    'Quick response (3)',
    'すみません、この 本、かりても いいですか。',
    'Permisi, bolehkah saya meminjam buku ini?',
    'Excuse me, may I borrow this book?',
    [
      _q(
        'Kamu boleh meminjamkannya. Apa jawaban yang paling tepat?',
        'You can lend it. What is the best reply?',
        ['ええ、どうぞ。', 'はい、かりました。', 'いいえ、かしませんでした。', 'どういたしまして。'],
      ),
      _q(
        'Kamu sedang membaca buku itu sehingga tidak bisa meminjamkannya. Jawaban mana yang tepat?',
        'You are reading that book now, so you cannot lend it. Which reply is right?',
        ['すみません、いま 読んで います。', 'ええ、どうぞ。', 'はい、かりました。', 'いいえ、かりません。'],
      ),
    ],
  ),
  _l(
    'ja_5m_14',
    'Jawab dengan cepat (4)',
    'Quick response (4)',
    'いっしょに おちゃを のみませんか。',
    'Mau minum teh bersama?',
    'Would you like to have some tea together?',
    [
      _q(
        'Kamu mau ikut. Apa jawaban yang paling tepat?',
        'You want to join. What is the best reply?',
        ['ええ、のみましょう。', 'いいえ、のみました。', 'はい、おちゃです。', 'ええ、のみませんでした。'],
      ),
      _q(
        'Kamu ingin menolak dengan sopan. Jawaban mana yang paling tepat?',
        'You want to decline politely. Which reply is best?',
        ['すみません、今日は ちょっと…。', 'はい、のみましょう。', 'おちゃを ください。', 'どうぞ、のんで ください。'],
      ),
    ],
  ),
];
