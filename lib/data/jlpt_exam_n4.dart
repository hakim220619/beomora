/// Bank soal tambahan ujian JLPT N4: kosakata (文脈規定・言い換え類義・
/// 用法), tata bahasa (文法形式の判断・文の組み立て・文章の文法),
/// bacaan (短文・中文・情報検索), dan dengar (課題理解・ポイント理解・
/// 発話表現・即時応答).
///
/// Konten disusun sendiri untuk latihan — bukan soal resmi penyelenggara.
/// Konvensi: pilihan PERTAMA setiap soal adalah jawaban benar
/// (`answer: 0`); layar ujian/latihan yang mengacak urutannya.
library;

import '../models/exam.dart';
import '../models/listening.dart';
import 'mcq_bank.dart';

McqQuestion _q(String id, String en, List<String> options) =>
    McqQuestion(question: {'id': id, 'en': en}, options: options, answer: 0);

/// 文脈規定: kalimat dengan （　　）.
McqQuestion _ctx(String s, List<String> options) =>
    _q('Pilih kata yang tepat: $s', 'Choose the right word: $s', options);

/// 言い換え類義: ungkapan target ditandai ＿…＿.
McqQuestion _para(String s, List<String> options) => _q(
  'Pilih yang artinya paling dekat: $s',
  'Choose the closest meaning: $s',
  options,
);

/// 用法: pilih kalimat yang memakai kata dengan benar.
McqQuestion _use(String word, List<String> options) => _q(
  'Pilih kalimat yang memakai kata 「$word」 dengan benar.',
  'Choose the sentence that uses 「$word」 correctly.',
  options,
);

/// 文法形式の判断.
McqQuestion _gf(String s, List<String> options) =>
    _q('Pilih yang tepat: $s', 'Choose the correct word: $s', options);

/// 文の組み立て: pilihan pertama = potongan di posisi ★.
McqQuestion _star(String s, List<String> options) => _q(
  'Kata mana yang masuk di ★? $s',
  'Which word goes in the ★ slot? $s',
  options,
);

/// 文章の文法: teks dengan beberapa kekosongan bernomor; tanya satu.
McqQuestion _bun(String text, String n, List<String> options) => _q(
  'Pilih yang tepat untuk （$n）: $text',
  'Choose the best option for （$n）: $text',
  options,
);

ReadingPassage _rp(
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

ListeningPassage _lp(
  String id,
  String titleId,
  String titleEn,
  String transcript,
  Map<String, String> translation,
  List<McqQuestion> questions,
) => ListeningPassage(
  id: id,
  title: {'id': titleId, 'en': titleEn},
  transcript: transcript,
  translation: translation,
  questions: questions,
);

// ---------------------------------------------------------------------------
// 語彙 — 文脈規定
// ---------------------------------------------------------------------------
final List<McqQuestion> vocabContextN4 = [
  _ctx('交番で 駅への 道を（　　）。', ['聞きました', '答えました', '話しました', '呼びました']),
  _ctx('試験に（　　）ように、毎日 勉強して います。', ['合格する', '案内する', '経験する', '計画する']),
  _ctx('毎朝 六時に 目覚まし時計が（　　）。', ['鳴ります', '吹きます', '光ります', '降ります']),
  _ctx('この 道は 車が 多くて（　　）から、気を つけて ください。', ['あぶない', 'ふかい', 'にがい', 'ねむい']),
  _ctx('先生に 作文の まちがいを（　　）もらいました。', ['直して', '落として', '拾って', '決めて']),
  _ctx('風邪を ひいたので、病院で（　　）を もらいました。', ['薬', '席', '品物', '番組']),
  _ctx('日本の 家に 入る ときは、玄関で くつを（　　）。', ['ぬぎます', 'きります', 'しめます', 'あけます']),
  _ctx('この 部屋は 暗いので、電気を（　　）ください。', ['つけて', 'けして', 'しめて', 'わたして']),
  _ctx('となりの 人が 夜 遅くまで（　　）ので、よく 眠れませんでした。', ['さわいだ', 'ねむった', 'すわった', 'つかれた']),
  _ctx('来週 京都へ 行く（　　）です。', ['予定', '都合', '意見', '経験']),
  _ctx('洗濯物が 雨に（　　）しまいました。', ['ぬれて', 'こわれて', 'われて', 'やけて']),
  _ctx('この スープは 塩が 多くて、とても（　　）。', ['からいです', 'あまいです', 'うすいです', 'やわらかいです']),
  _ctx('駅で 財布を（　　）しまいました。', ['落として', '拾って', '届けて', '貸して']),
  _ctx('朝の 電車は 人が 多くて、とても（　　）います。', ['こんで', 'すいて', 'ならんで', 'あいて']),
  _ctx('会議に（　　）しないように、早く 家を 出ました。', ['遅刻', '失敗', '注意', '準備']),
  _ctx('わからない ことばは 辞書で（　　）ください。', ['調べて', '考えて', '習って', '答えて']),
  _ctx('部屋が きたないので、（　　）しなければ なりません。', ['そうじ', '料理', '散歩', '運動']),
  _ctx('熱が あるので、今日は 会社を（　　）。', ['休みます', '止めます', '寝ます', '遊びます']),
  _ctx('赤ちゃんが 寝て いるので、（　　）して ください。', ['静かに', '大切に', '丁寧に', '熱心に']),
  _ctx('この 町は 十年前と くらべて ずいぶん（　　）。', ['変わりました', '決まりました', '集まりました', '届きました']),
  _ctx('いすの 上に（　　）、たなの 上の 箱を 取りました。', ['のって', 'ねて', 'おりて', 'わたって']),
  _ctx('この 本は とても（　　）ので、一日で 読んで しまいました。', [
    'おもしろかった',
    'ふるかった',
    'おもかった',
    'くらかった',
  ]),
  _ctx('店員に この シャツを 着て みても いいか（　　）。', ['たずねました', 'こたえました', 'しらべました', 'はらいました']),
  _ctx('大きな 音が して、窓ガラスが（　　）。', ['割れました', '折れました', '切れました', '破れました']),
  _ctx('道を 歩いて いたら、高校の ときの 友だちに（　　）。', ['会いました', '着きました', '入りました', '乗りました']),
  _ctx('新しい 仕事には もう（　　）か。', ['慣れました', '決めました', '治りました', '似ました']),
  _ctx('兄と 私は 顔が よく（　　）います。', ['似て', '慣れて', '比べて', '合わせて']),
  _ctx('試合に 負けて、とても（　　）です。', ['残念', '安心', '便利', '丈夫']),
  _ctx('この かばんは（　　）ので、旅行に 便利です。', ['軽い', '重い', '古い', '汚い']),
  _ctx('東京の（　　）は 一千万人 以上です。', ['人口', '人気', '人形', '大人']),
  _ctx('春に なったら、公園で（　　）を しましょう。', ['花見', '出張', '留守', '下宿']),
  _ctx('大学を（　　）したら、銀行で 働きたいです。', ['卒業', '入学', '留学', '欠席']),
  _ctx('急いで いるので、（　　）来て ください。', ['すぐ', 'ゆっくり', 'なかなか', 'けっして']),
  _ctx('彼の 話は 速くて、（　　）わかりませんでした。', ['ぜんぜん', 'かならず', 'きっと', 'ぜひ']),
  _ctx('（　　）一度 日本へ 行って みたいです。', ['いつか', 'いつも', 'さっき', 'この間']),
  _ctx('使った ものは もとの 場所に（　　）ください。', ['戻して', '出して', '捨てて', '開けて']),
  _ctx('エレベーターが（　　）ので、階段を 使って ください。', [
    '故障して いる',
    '開いて いる',
    '動いて いる',
    '空いて いる',
  ]),
  _ctx('今朝は 寝坊したので、朝ご飯を 食べる（　　）が ありませんでした。', ['時間', '用事', '意味', '理由']),
  _ctx('京都で 有名な お寺を（　　）しました。', ['見物', '注射', '退院', '返事']),
  _ctx('母が 病気なので、私が 弟の（　　）を して います。', ['世話', '研究', '用意', '説明']),
  _ctx('この シャツは 大きすぎるので、小さいのと（　　）もらえますか。', ['取り替えて', '乗り換えて', '着替えて', '引っ越して']),
  _ctx('夜 遅く 人の 家に 電話を するのは（　　）ですよ。', ['失礼', '丁寧', '親切', '上手']),
  _ctx('今年の 夏は 去年より（　　）が 高いです。', ['気温', '気分', '天気', '空気']),
  _ctx('雨が 降りそうなので、（　　）を 持って 行きます。', ['かさ', 'さいふ', 'めがね', 'てぶくろ']),
];

// ---------------------------------------------------------------------------
// 語彙 — 言い換え類義
// ---------------------------------------------------------------------------
final List<McqQuestion> vocabParaphraseN4 = [
  _para('田中さんは 今 ＿るす＿です。', [
    '田中さんは 今 家に いません',
    '田中さんは 今 家に います',
    '田中さんは 今 寝て います',
    '田中さんは 今 忙しいです',
  ]),
  _para('昨日は ＿ひまでした＿。', [
    '昨日は 時間が ありました',
    '昨日は 忙しかったです',
    '昨日は 疲れました',
    '昨日は 元気でした',
  ]),
  _para('母は 料理が ＿得意です＿。', [
    '母は 料理が 上手です',
    '母は 料理が 下手です',
    '母は 料理が 嫌いです',
    '母は 料理を 習って います',
  ]),
  _para('兄は ＿たばこを やめました＿。', [
    '兄は 今は たばこを 吸いません',
    '兄は 今も たばこを たくさん 吸います',
    '兄は たばこを 買いました',
    '兄は 初めて たばこを 吸いました',
  ]),
  _para('この 店は ＿いつも すいて います＿。', [
    'この 店は いつも 客が 少ないです',
    'この 店は いつも 客が 多いです',
    'この 店は いつも 値段が 高いです',
    'この 店は いつも 閉まって います',
  ]),
  _para('きのう 先生に ＿しかられました＿。', [
    'きのう 先生に 怒られました',
    'きのう 先生に ほめられました',
    'きのう 先生に 呼ばれました',
    'きのう 先生に 道を 聞かれました',
  ]),
  _para('弟は ＿うそを つきました＿。', [
    '弟は 本当では ない ことを 言いました',
    '弟は 本当の ことを 言いました',
    '弟は 何も 言いませんでした',
    '弟は 大きい 声で 話しました',
  ]),
  _para('父は 今 ＿出張中です＿。', [
    '父は 仕事で ほかの 町へ 行って います',
    '父は 家で 休んで います',
    '父は 病気で 入院して います',
    '父は 家族と 旅行して います',
  ]),
  _para('この 映画は ＿つまらなかったです＿。', [
    'この 映画は おもしろく なかったです',
    'この 映画は とても おもしろかったです',
    'この 映画は 長かったです',
    'この 映画は こわかったです',
  ]),
  _para('弟は ＿試験に 落ちました＿。', [
    '弟は 試験に 合格しませんでした',
    '弟は 試験に 合格しました',
    '弟は 試験を 受けませんでした',
    '弟は 試験の 勉強を しました',
  ]),
  _para('＿さっき＿ 山田さんから 電話が ありました。', ['少し 前に', '昨日の 夜', '明日の 朝', '一週間 前に']),
  _para('この 問題は ＿やさしいです＿。', [
    'この 問題は 簡単です',
    'この 問題は 難しいです',
    'この 問題は 大切です',
    'この 問題は 古いです',
  ]),
  _para('今朝 ＿寝坊しました＿。', [
    '今朝 遅く 起きました',
    '今朝 早く 起きました',
    '今朝 遅く 寝ました',
    '今朝 朝ご飯を 食べませんでした',
  ]),
  _para('これは ＿たいせつな＿ 写真です。', [
    'これは だいじな 写真です',
    'これは 古い 写真です',
    'これは 新しい 写真です',
    'これは きれいな 写真です',
  ]),
  _para('田中さんは ＿まじめに＿ 働いて います。', ['一生けんめい', 'ゆっくり', '楽しそうに', '少しだけ']),
  _para('店の 前に ＿人が ならんで います＿。', [
    '店の 前に 人が 列を 作って います',
    '店の 前に 人が すわって います',
    '店の 前で 人が 走って います',
    '店の 前には だれも いません',
  ]),
  _para('明日の 会議は ＿中止に なりました＿。', [
    '明日の 会議は ありません',
    '明日の 会議は 早く 始まります',
    '明日の 会議は 長く なりました',
    '明日の 会議は 場所が 変わりました',
  ]),
  _para('来週 ＿引っ越します＿。', [
    '来週 住む ところが 変わります',
    '来週 旅行に 行きます',
    '来週 会社を やめます',
    '来週 家に 友だちを 呼びます',
  ]),
  _para('＿この 部屋は 禁煙です＿。', [
    'この 部屋で たばこを 吸っては いけません',
    'この 部屋で たばこを 吸っても いいです',
    'この 部屋で 食べては いけません',
    'この 部屋には 入っては いけません',
  ]),
  _para('母に ＿お礼を 言いました＿。', [
    '母に 「ありがとう」と 言いました',
    '母に 「ごめんなさい」と 言いました',
    '母に 「おやすみなさい」と 言いました',
    '母に 「いただきます」と 言いました',
  ]),
  _para('友だちに ＿謝りました＿。', [
    '友だちに 「ごめんなさい」と 言いました',
    '友だちに 「ありがとう」と 言いました',
    '友だちに 「おめでとう」と 言いました',
    '友だちに 「さようなら」と 言いました',
  ]),
  _para('姉は 今 食事の ＿したく＿を して います。', ['準備', '片付け', '注文', '説明']),
  _para('部屋を ＿片付けました＿。', [
    '部屋を きれいに しました',
    '部屋を 汚く しました',
    '部屋を 借りました',
    '部屋を 見つけました',
  ]),
  _para('姉は ＿銀行に 勤めて います＿。', [
    '姉は 銀行で 働いて います',
    '姉は 銀行に お金を 預けて います',
    '姉は 今 銀行へ 行って います',
    '姉は 銀行を 探して います',
  ]),
  _para('父は ＿たいてい＿ 七時に 帰ります。', ['だいたい いつも', 'たまに', '一度だけ', 'これから']),
  _para('林さんは ＿うれしそうでした＿。', [
    '林さんは 喜んで いるようでした',
    '林さんは 怒って いるようでした',
    '林さんは 疲れて いるようでした',
    '林さんは 困って いるようでした',
  ]),
  _para('この 机は ＿じょうぶです＿。', [
    'この 机は こわれにくいです',
    'この 机は こわれやすいです',
    'この 机は 軽いです',
    'この 机は 安いです',
  ]),
  _para('明日 また ＿うかがいます＿。', [
    '明日 また 行きます',
    '明日 また 電話します',
    '明日 また 帰ります',
    '明日 また 待ちます',
  ]),
];

// ---------------------------------------------------------------------------
// 語彙 — 用法
// ---------------------------------------------------------------------------
final List<McqQuestion> vocabUsageN4 = [
  _use('けしき', [
    '山の 上から 見た けしきは とても きれいでした。',
    'けしきが 痛くて、病院へ 行きました。',
    '毎朝 けしきを 飲んで から 出かけます。',
    '友だちに けしきを 貸して あげました。',
  ]),
  _use('届ける', [
    '落とした 財布を 交番に 届けました。',
    '毎朝 七時に 届けて、顔を 洗います。',
    '雨が 届けて、かさを さしました。',
    'この 料理は 塩が 届けて います。',
  ]),
  _use('めずらしい', [
    'この 町で 雪が 降るのは めずらしいです。',
    '毎日 食べる ご飯は めずらしいです。',
    '朝 起きて、めずらしい 顔を 洗いました。',
    'めずらしく なったので、セーターを 着ました。',
  ]),
  _use('片付ける', [
    '食事の あとで、テーブルの 上を 片付けました。',
    '風が 強くて、木が 片付けました。',
    '熱が 片付けたので、学校を 休みました。',
    '友だちに 手紙を 片付けました。',
  ]),
  _use('間に合う', [
    '急いだので、電車に 間に合いました。',
    'この シャツは 私に よく 間に合います。',
    '駅の 前で 友だちと 間に合いました。',
    '毎朝 新聞を 間に合って います。',
  ]),
  _use('似合う', [
    'その 赤い セーター、よく 似合って いますね。',
    '兄と 弟は 顔が 似合って います。',
    '授業に 似合うように、早く 家を 出ました。',
    '先生の 説明が よく 似合いました。',
  ]),
  _use('熱心', [
    '弟は 毎晩 熱心に 勉強して います。',
    '今日は 熱心なので、エアコンを つけました。',
    'この スープは 熱心だから 気を つけて。',
    '熱心が あるので、薬を 飲みました。',
  ]),
  _use('故障', [
    'エレベーターが 故障して いるので、階段を 使います。',
    '風邪で 故障したので、会社を 休みました。',
    '友だちと けんかして 故障しました。',
    '料理を 故障して、みんなで 食べました。',
  ]),
  _use('予約', [
    'レストランを 七時に 予約しました。',
    '明日は 雨が 降ると 予約して います。',
    '友だちに 本を 予約して あげました。',
    '毎日 日記を 予約して います。',
  ]),
  _use('失礼', [
    '人の 話の とちゅうで 帰るのは 失礼です。',
    '試験に 失礼して、また 来年 受けます。',
    '料理が 失礼で、おいしかったです。',
    '雨が 失礼して、かさを 持って 行きました。',
  ]),
  _use('準備', [
    '旅行の 準備は もう 終わりましたか。',
    '毎朝 犬と 公園を 準備します。',
    '風邪が 準備して、熱が 出ました。',
    'この 部屋は 準備で とても 広いです。',
  ]),
  _use('経験', [
    '外国で 働いた 経験が あります。',
    '明日の 経験は 晴れでしょう。',
    '経験を 開けて、部屋に 入りました。',
    '駅まで 経験で 十分 かかります。',
  ]),
  _use('増える', [
    '日本に 来る 外国人が 増えて います。',
    '電気を 増えて、部屋を 明るく しました。',
    '店で 新しい くつを 増えました。',
    '毎朝 七時に 増えて、学校へ 行きます。',
  ]),
  _use('生活', [
    '日本での 生活にも だいぶ 慣れました。',
    '生活が 痛いので、病院へ 行きます。',
    '毎朝 生活を 飲んで います。',
    'この 生活は 赤くて きれいです。',
  ]),
  _use('ていねい', [
    '先生は ていねいに 説明して くれました。',
    'この 料理は ていねいで、からいです。',
    'ていねいが 降って、寒く なりました。',
    '電車が ていねいに 遅れました。',
  ]),
  _use('盗む', [
    '電車の 中で 財布を 盗まれました。',
    '熱が 盗んだので、薬を 飲みました。',
    '毎晩 歯を 盗んで から 寝ます。',
    '雨が 盗んで、道が ぬれて います。',
  ]),
  _use('遠慮', [
    'どうぞ 遠慮しないで、たくさん 食べて ください。',
    '遠慮が 高いので、上着を 脱ぎました。',
    '駅まで 遠慮なので、タクシーで 行きます。',
    'この 本は 遠慮で おもしろいです。',
  ]),
  _use('集める', [
    '弟は 外国の 切手を 集めて います。',
    '朝 早く 学生が 公園に 集めました。',
    '時計を 集めて、時間を 見ました。',
    '熱が 集めて、学校を 休みました。',
  ]),
  _use('都合', [
    '明日は 都合が 悪いので、あさって 会いませんか。',
    'この 料理は 都合が からいです。',
    '都合を 着て、出かけました。',
    '雨の 都合が 降って います。',
  ]),
  _use('冷える', [
    '夜に なると 急に 冷えて きました。',
    '冷蔵庫で ビールを 冷えて おきました。',
    '母は 冷えた 人で、みんなに 好かれて います。',
    '熱い お茶を 冷えて 飲みました。',
  ]),
  _use('落とす', [
    '駅で 切符を 落として しまいました。',
    '木から りんごが 落としました。',
    '雨が 落として、かさを さしました。',
    '試験に 落として、もう 一度 受けます。',
  ]),
  _use('案内', [
    '駅から 会場まで 私が 案内します。',
    '風邪の 案内で 熱が 出ました。',
    'この ケーキは 案内が あまいです。',
    '毎朝 案内を 食べて います。',
  ]),
];

// ---------------------------------------------------------------------------
// 文法 — tambahan N4
// ---------------------------------------------------------------------------

const String _bunA =
    '先週の 日曜日、友だちと 初めて 富士山に 登りました。'
    '朝 早く 出発した（１）、頂上に 着いた ときは もう 午後でした。'
    'とても 疲れましたが、上から 見た 景色は 本当に きれいでした。'
    '（２）、帰りに 雨が 降り出して、服が ぬれて しまいました。'
    '次は 天気予報を よく 見て（３）と 思います。';

const String _bunB =
    '山田先生 来週の 授業の ことで ご連絡します。'
    '実は、母が 病気で 入院した（１）、来週 一度 国へ 帰らなければ なりません。'
    'それで、月曜日と 火曜日の 授業を 休ませて（２）でしょうか。'
    '休んだ 授業の 宿題は、戻ってから 必ず 出します。'
    'どうぞ よろしく（３）。 リン';

const String _bunC =
    '私の 町は 東京から 電車で 一時間 ぐらいの ところに あります。'
    '大きな 町では ありませんが、近くに 山や 川が あって、自然が 多いです。'
    '夏に なる（１）、川で 泳いだり 魚を 釣ったり する 人が たくさん 来ます。'
    '最近は 新しい 店も 増えて、前より 便利に（２）。'
    'でも、私は 昔の 静かな 町も 好きでした。'
    'これからも この 町に（３）と 思って います。';

const String _bunD =
    '日本に 来た ばかりの ころ、私は 日本語が ほとんど 話せませんでした。'
    'スーパーで 買い物を する（１）も、店員さんの 言う ことが わからなくて、困りました。'
    'そこで、毎日 テレビの ニュースを 見る ことに しました。'
    '初めは 速くて 全然 わかりませんでしたが、三か月 ぐらい たつと、'
    '少しずつ 聞き取れる（２）。'
    '今では 日本人の 友だちと 楽しく 話せます。'
    '（３）、あきらめないで 続ける ことが 大切だと 思います。';

final List<McqQuestion> grammarN4More = [
  // 文法形式の判断
  _gf('日本に 来て から、すしを 食べた（　　）が ありますか。', ['こと', 'ところ', 'はず', 'ため']),
  _gf('週末は 本を 読んだり、映画を（　　）します。', ['見たり', '見て', '見るし', '見ながら']),
  _gf('テレビを 見（　　）、ご飯を 食べては いけません。', ['ながら', 'たり', 'ので', 'のに']),
  _gf('大切な 書類を 電車に 忘れて（　　）。', ['しまいました', 'おきました', 'みました', 'あげました']),
  _gf('会議の 前に、資料を コピーして（　　）ください。', ['おいて', 'おく', 'おき', 'おいた']),
  _gf('この 着物を 着て（　　）も いいですか。', ['みて', 'みる', 'みた', 'み']),
  _gf('毎日 野菜を 食べる（　　）に して います。', ['よう', 'ため', 'そう', 'はず']),
  _gf('日本語が 少し 話せる（　　）に なりました。', ['よう', 'の', 'ため', 'はず']),
  _gf('空が 暗く なって きました。雨が（　　）そうです。', ['降り', '降ら', '降れ', '降ろ']),
  _gf('天気予報に よると、明日は 雨が（　　）そうです。', ['降る', '降ら', '降れ', '降ろ']),
  _gf('山田さんは 来月 結婚（　　）らしいです。', ['する', 'し', 'して', 'だ']),
  _gf('もう 少し 安（　　）ば、買います。', ['けれ', 'く', 'い', 'かれ']),
  _gf('駅に 着いた（　　）、電話して ください。', ['ら', 'と', 'ば', 'て']),
  _gf('京都へ 行く（　　）、金閣寺を 見た ほうが いいですよ。', ['なら', 'と', 'ば', 'たら']),
  _gf('春に（　　）と、桜が 咲きます。', ['なる', 'なって', 'なり', 'なった']),
  _gf('弟は まだ 小さいので、一人で 服が（　　）。', ['着られません', '着ません', '着させません', '着られます']),
  _gf('電車の 中で だれかに 足を（　　）。', ['踏まれました', '踏みました', '踏ませました', '踏めました']),
  _gf('この お寺は 三百年前に（　　）。', ['建てられました', '建てて います', '建てさせました', '建てられます']),
  _gf('母は 弟に 部屋を 掃除（　　）。', ['させました', 'しました', 'できました', 'しましょう']),
  _gf('ここに 車を 止めては（　　）。', ['いけません', 'いいです', 'ください', 'あります']),
  _gf('この 部屋の パソコンは 自由に 使って（　　）いいですよ。', ['も', 'は', 'が', 'を']),
  _gf('明日は 試験が あるので、早く 寝（　　）。', [
    'なければ なりません',
    'なくても いいです',
    'ては いけません',
    'ないで しまいます',
  ]),
  _gf('薬を 飲んだ（　　）、熱が 下がりません。', ['のに', 'ので', 'から', 'し']),
  _gf('雨が 降って いる（　　）、今日は 出かけません。', ['ので', 'のに', 'たら', 'まで']),
  _gf('この 店は 安いし、おいしい（　　）、いつも こんで います。', ['し', 'ても', 'ながら', 'まで']),
  _gf('この ペンは 軽くて とても 書き（　　）です。', ['やすい', 'すぎ', 'ながら', 'たり']),
  _gf('昨日 お酒を 飲み（　　）、頭が 痛いです。', ['すぎて', 'やすくて', 'にくくて', 'ながら']),
  _gf('先生、この 本を（　　）か。', [
    'お借りしても いいです',
    '借りさせて いいです',
    'お借りに なっても いいです',
    '借りられても いいです',
  ]),
  _gf('社長は もう（　　）。', ['お帰りに なりました', 'お帰りしました', 'お帰りいたしました', '帰りに なりました']),
  _gf('重そうですね。私が 荷物を（　　）。', ['お持ちします', 'お持ちに なります', '持ちに なります', 'お持ちされます']),
  _gf('姉が 私に 本を 貸して（　　）。', ['くれました', 'あげました', 'もらいました', 'さしあげました']),
  _gf('私は 友だちに 宿題を 手伝って（　　）。', ['もらいました', 'くれました', 'あげられました', 'くださいました']),
  _gf('私は 妹に 絵本を 読んで（　　）。', ['あげました', 'くれました', 'くださいました', 'ください']),
  _gf('暑いので、窓が（　　）あります。', ['開けて', '開いて', '開け', '開く']),
  _gf('日本の 歌が 歌える ように（　　）たいです。', ['なり', 'なる', 'なって', 'なれ']),
  _gf('この 漢字は 形が 難しくて、覚え（　　）です。', ['にくい', 'やすい', 'すぎ', 'ながら']),
  // 文の組み立て
  _star('私は ＿＿ ＿＿ ★ ＿＿ あります。', ['登った', '富士山に', '一度', 'ことが']),
  _star('週末は ＿＿ ＿＿ ★ ＿＿ 散歩したり します。', ['読んだり', '家で', '本を', '公園を']),
  _star('車を ＿＿ ＿＿ ★ ＿＿ いけません。', ['電話を', '運転し', 'ながら', 'しては']),
  _star('この 本は ＿＿ ＿＿ ★ ＿＿ です。', ['読み', '字が', '大きくて', 'やすい']),
  _star('もし ＿＿ ＿＿ ★ ＿＿ 行きません。', ['降ったら', '明日', '雨が', '海へは']),
  _star('弟に ＿＿ ＿＿ ★ ＿＿ しまいました。', ['ケーキを', '買った', 'ばかりの', '食べられて']),
  _star('友だちが ＿＿ ＿＿ ★ ＿＿ くれました。', ['きた', '日本で', '買って', 'お土産を']),
  _star('大学に ＿＿ ＿＿ ★ ＿＿ 勉強して います。', ['ように', '合格', 'できる', '毎日']),
  _star('母が ＿＿ ＿＿ ★ ＿＿ おいしかったです。', ['料理は', '作って', 'くれた', 'とても']),
  _star('部屋の ＿＿ ＿＿ ★ ＿＿ しまいました。', ['まま', '電気を', 'つけた', '出かけて']),
  _star('田中さんは ＿＿ ＿＿ ★ ＿＿ らしいです。', ['やめて', '来月', '会社を', '国へ 帰る']),
  _star('試験の 前に ＿＿ ＿＿ ★ ＿＿ ほうが いいですよ。', ['読んで', 'もう 一度', '教科書を', 'おいた']),
  _star('雨が ＿＿ ＿＿ ★ ＿＿ 出かけました。', ['のに', '降って', 'いた', '傘を 持たずに']),
  // 文章の文法
  _bun(_bunA, '１', ['のに', 'ので', 'から', 'ために']),
  _bun(_bunA, '２', ['でも', 'それで', 'だから', 'たとえば']),
  _bun(_bunA, '３', ['から 行こう', 'から 行った', 'まで 行こう', 'ので 行った']),
  _bun(_bunB, '１', ['ため', 'のに', 'ても', 'まで']),
  _bun(_bunB, '２', ['いただけない', 'いただかない', 'さしあげない', 'おかない']),
  _bun(_bunB, '３', ['お願いいたします', 'お願いいただきます', 'お願いに なります', 'お願いされます']),
  _bun(_bunC, '１', ['と', 'ても', 'たら', 'ば']),
  _bun(_bunC, '２', ['なりました', 'しました', 'させました', 'られました']),
  _bun(_bunC, '３', ['住み続けたい', '住み続けた', '住み始めた', '住んで しまった']),
  _bun(_bunD, '１', ['とき', 'まえ', 'あと', 'ながら']),
  _bun(_bunD, '２', ['ように なりました', 'ように しました', 'そうに なりました', 'ことに しました']),
  _bun(_bunD, '３', ['だから', 'しかし', 'それとも', 'ところが']),
];

// ---------------------------------------------------------------------------
// 読解 — tambahan N4
// ---------------------------------------------------------------------------
final List<ReadingPassage> readingJaN4More = [
  // 短文
  _rp(
    'ja_r4m_1',
    'Memo untuk Maria',
    'A memo for Maria',
    'マリアさんへ　昼ごろ、山田さんから電話がありました。'
        '明日の会議は十時からではなく、十一時からに変わったそうです。'
        '会議の前に、先週の資料をもう一度読んでおいてほしいと言っていました。'
        'それから、会議が終わったら、いっしょに昼ご飯を食べましょうと言っていました。　鈴木',
    [
      _q(
        'Rapat besok mulai jam berapa?',
        'What time does tomorrow’s meeting start?',
        ['十一時から', '十時から', '十二時から', '一時から'],
      ),
      _q(
        'Apa yang harus Maria lakukan sebelum rapat?',
        'What does Maria need to do before the meeting?',
        ['先週の資料を読む', '山田さんに電話する', '昼ご飯を買う', '資料をコピーする'],
      ),
    ],
  ),
  _rp(
    'ja_r4m_2',
    'Pengumuman perpustakaan',
    'Library notice',
    '図書館からのお知らせ　来月一日から十日まで、図書館の中の工事をします。'
        'この間、二階の部屋は使えません。'
        '本を借りたり返したりすることは、一階でできます。'
        'また、工事の間は、夜八時ではなく六時に閉まります。'
        'ご迷惑をおかけしますが、よろしくお願いします。',
    [
      _q(
        'Selama renovasi, apa yang TIDAK bisa dilakukan?',
        'During the construction, what can NOT be done?',
        ['二階の部屋で勉強する', '一階で本を借りる', '一階で本を返す', '五時に図書館に入る'],
      ),
      _q(
        'Selama renovasi, perpustakaan tutup jam berapa?',
        'During the construction, what time does the library close?',
        ['六時', '八時', '十時', '五時'],
      ),
    ],
  ),
  _rp(
    'ja_r4m_3',
    'Kedai ramen baru',
    'The new ramen shop',
    'きのう、駅の近くの新しいラーメン屋に行きました。'
        '店の前に長い列ができていたので、三十分ぐらい待ちました。'
        'ラーメンは少しからかったですが、とてもおいしかったです。'
        '値段も安かったので、今度は家族を連れて行こうと思います。'
        'でも、次は人が少ない時間に行きたいです。',
    [
      _q(
        'Mengapa penulis menunggu sekitar 30 menit?',
        'Why did the writer wait about 30 minutes?',
        [
          '店の前に人がたくさん並んでいたから',
          '店がまだ開いていなかったから',
          'ラーメンを作るのに時間がかかったから',
          '友だちが遅れて来たから',
        ],
      ),
      _q(
        'Apa yang ingin penulis lakukan lain kali?',
        'What does the writer want to do next time?',
        ['人が少ない時間に家族と行く', '一人で同じ時間に行く', 'もっとからいラーメンを食べる', 'ほかのラーメン屋に行く'],
      ),
    ],
  ),
  _rp(
    'ja_r4m_4',
    'Email soal barbeku',
    'An email about the barbecue',
    'リーさん、来週の土曜日のバーベキューのことですが、天気予報によると雨が降るそうです。'
        'それで、場所を川のそばの公園から、私のアパートに変えることにしました。'
        '時間は同じで、十二時からです。'
        '肉と野菜は私が買っておくので、リーさんは飲み物を持ってきてもらえますか。　田中',
    [
      _q('Mengapa tempatnya diganti?', 'Why was the place changed?', [
        '雨が降るらしいから',
        '公園が遠いから',
        '公園に人が多いから',
        '田中さんが忙しいから',
      ]),
      _q('Apa yang dibawa Lee?', 'What will Lee bring?', [
        '飲み物',
        '肉',
        '野菜',
        '何も持って行かない',
      ]),
    ],
  ),
  _rp(
    'ja_r4m_5',
    'Telepon di kereta',
    'Phones on the train',
    '日本では、電車の中で電話で話す人はあまりいません。'
        'ほかの人の迷惑になるからです。'
        '電話がかかってきたら、次の駅で降りてからかけ直す人も多いです。'
        'でも、メールを読んだり送ったりすることは問題ありません。'
        '私の国では電車の中で電話をする人が多いので、初めはびっくりしました。',
    [
      _q(
        'Apa yang jarang dilakukan orang di kereta di Jepang?',
        'What do people rarely do on trains in Japan?',
        ['電話で話す', 'メールを読む', 'メールを送る', '次の駅で降りる'],
      ),
      _q('Mengapa penulis terkejut?', 'Why was the writer surprised?', [
        '自分の国とちがうから',
        '電車がこんでいたから',
        '電話がかかってきたから',
        'メールが送れなかったから',
      ]),
    ],
  ),
  // 中文
  _rp(
    'ja_r4m_6',
    'Kerja sambilanku',
    'My part-time job',
    '私は去年の四月に日本へ来て、今は大学で経済を勉強しています。'
        '半年前から、駅の前のコンビニでアルバイトをしています。'
        '週に三回、夕方の五時から十時までです。'
        '初めは、お客さんの話す日本語が速くて、よくわかりませんでした。'
        'お弁当を温めるかどうか聞くのを忘れて、お客さんに怒られたこともあります。'
        'そのとき、店長が「失敗してもいいから、わからないときはすぐ聞いてください」と言ってくれました。'
        'それから、わからないことがあったら、はずかしがらないで聞くようにしています。'
        'アルバイトを始めてから、日本語が上手になっただけではなく、日本の生活にも慣れました。'
        '近所の人も私の顔を覚えてくれて、店であいさつをしてくれます。'
        '大変なこともありますが、この仕事を選んでよかったと思っています。'
        '来年は大学の勉強が忙しくなるので、アルバイトの日を少し減らすつもりです。',
    [
      _q(
        'Mengapa penulis pernah dimarahi pelanggan?',
        'Why was the writer once scolded by a customer?',
        ['お弁当を温めるか聞かなかったから', 'お弁当を落としたから', '店に遅れて来たから', '日本語で話さなかったから'],
      ),
      _q(
        'Apa yang dikatakan manajer toko kepada penulis?',
        'What did the store manager tell the writer?',
        ['わからないときはすぐ聞いてほしい', '失敗してはいけない', 'もっと日本語を勉強してほしい', 'アルバイトの日を減らしてほしい'],
      ),
      _q(
        'Apa rencana penulis tahun depan?',
        'What does the writer plan to do next year?',
        ['アルバイトの日を少なくする', 'アルバイトをやめる', 'ほかの店で働く', 'アルバイトの日を増やす'],
      ),
    ],
  ),
  _rp(
    'ja_r4m_7',
    'Masakan nenek',
    'Grandmother’s cooking',
    '私の祖母は今年八十歳になりますが、今でも毎日自分で料理を作っています。'
        '祖母の料理はどれもおいしいですが、特に野菜のにものが有名で、近所の人もときどき習いに来ます。'
        '子どものころ、私は野菜が嫌いで、祖母のにものもほとんど食べませんでした。'
        'でも、高校生のとき、一人で祖母の家に一週間とまったことがあります。'
        'そのとき、祖母にたのまれて、いっしょに料理を作りました。'
        '自分で切った野菜を入れたにものを食べてみると、思ったよりずっとおいしくて、おどろきました。'
        'それから、少しずつ野菜が食べられるようになりました。'
        '今、私は東京で一人で住んでいますが、ときどき祖母に電話をして、料理の作り方を教えてもらっています。'
        'まだ祖母の味にはなりませんが、次に会うときは、私が作ったにものを祖母に食べてもらいたいと思っています。',
    [
      _q(
        'Waktu kecil, mengapa penulis tidak makan nimono?',
        'As a child, why didn’t the writer eat the nimono?',
        ['野菜が嫌いだったから', '味がうすかったから', '祖母の家が遠かったから', '料理を作るのが下手だったから'],
      ),
      _q(
        'Apa yang membuat penulis mulai bisa makan sayur?',
        'What led the writer to start eating vegetables?',
        [
          '祖母といっしょににものを作ったこと',
          '近所の人に料理を習ったこと',
          '東京で一人で住み始めたこと',
          '祖母から電話をもらったこと',
        ],
      ),
      _q(
        'Apa yang ingin penulis lakukan saat bertemu nenek lagi?',
        'What does the writer want to do when meeting grandmother next?',
        ['自分で作ったにものを食べてもらう', '祖母の家に一週間とまる', '祖母に東京を案内する', '近所の人に料理を教える'],
      ),
    ],
  ),
  _rp(
    'ja_r4m_8',
    'Sepeda di kota Jepang',
    'Bicycles in Japanese towns',
    '日本の町では、自転車に乗っている人をよく見ます。'
        '駅まで自転車で行く人や、子どもを乗せて買い物に行くお母さんも多いです。'
        '自転車は便利で、お金もかからないし、体にもいいです。'
        'しかし、問題もあります。その一つは、駅の前に自転車を止める人が多すぎることです。'
        '決められた場所ではないところに止めると、歩く人のじゃまになります。'
        'そのため、多くの町では、ちゅうりんじょうという自転車を止める場所を作りました。'
        '一日百円ぐらいで使えるところが多いです。'
        '決められた場所以外に止めた自転車は、町の人が別の場所に運んでしまいます。'
        '取りに行くときは、二千円ぐらい払わなければなりません。'
        'また、夜自転車に乗るときは、ライトをつけなければいけません。'
        '傘をさしながら乗ったり、二人で並んで走ったりすることも禁止されています。'
        '自転車は便利ですが、ルールを守って安全に乗りましょう。',
    [
      _q(
        'Salah satu masalah sepeda yang ditulis adalah apa?',
        'What is one bicycle problem mentioned?',
        ['駅の前に止める人が多すぎること', '自転車の値段が高すぎること', '自転車に乗る人が少ないこと', 'ちゅうりんじょうが遠いこと'],
      ),
      _q(
        'Apa yang terjadi pada sepeda yang diparkir di luar tempat resmi?',
        'What happens to bicycles parked outside designated places?',
        ['別の場所に運ばれる', 'すぐに捨てられる', '店で売られる', '持ち主の家に届けられる'],
      ),
      _q(
        'Apa yang wajib dilakukan saat naik sepeda malam hari?',
        'What must you do when riding a bicycle at night?',
        ['ライトをつける', '傘をさす', '二人で並んで走る', '百円を払う'],
      ),
    ],
  ),
  _rp(
    'ja_r4m_9',
    'Surat untuk keluarga angkat',
    'A letter to the host family',
    '佐藤さんの家族のみなさんへ　先月は本当にお世話になりました。'
        '日本にいた三週間は、毎日が楽しくて、あっという間でした。'
        '一番の思い出は、お父さんが車で連れて行ってくれた海です。'
        '私の国には海がないので、海で泳いだのは初めてでした。'
        'お母さんが作ってくれたお弁当を、みんなで海のそばで食べたのも楽しかったです。'
        'また、ゆかちゃんには、毎晩日本語の宿題を手伝ってもらいました。'
        'おかげで、日本語で話すのが前より好きになりました。'
        '国に帰ってから、家族に日本の写真を見せて、たくさん話をしました。'
        '母は日本料理に興味を持って、今、いっしょに料理の本を見ながら、すき焼きを作る練習をしています。'
        '来年の夏、また日本へ行くつもりです。'
        'そのときは、今度は私がみなさんに国の料理を作ってあげたいです。'
        'お体に気をつけてください。　アンナ',
    [
      _q(
        'Mengapa laut di Jepang istimewa bagi Anna?',
        'Why was the sea in Japan special for Anna?',
        ['初めて海で泳いだから', '海で魚をつったから', '海の近くに住んでいたから', '一人で行ったから'],
      ),
      _q('Apa yang dilakukan Yuka untuk Anna?', 'What did Yuka do for Anna?', [
        '日本語の宿題を手伝った',
        'お弁当を作った',
        '車で海に連れて行った',
        'すき焼きの作り方を教えた',
      ]),
      _q(
        'Apa yang ingin Anna lakukan tahun depan?',
        'What does Anna want to do next year?',
        ['佐藤さんの家族に国の料理を作る', '母といっしょに日本に住む', 'すき焼きの店で働く', '日本の大学に入る'],
      ),
    ],
  ),
  // 情報検索
  _rp(
    'ja_r4m_10',
    'Jadwal kelas memasak',
    'Cooking class schedule',
    'さくら料理教室　７月のクラス\n'
        '\n'
        'Ａ　日本の家庭料理　　　　月曜日　10:00～12:00　2,000円\n'
        'Ｂ　かんたんパン作り　　　水曜日　18:30～20:30　2,500円\n'
        'Ｃ　親子でケーキ作り　　　土曜日　10:00～12:00　大人1人＋子ども1人 3,000円\n'
        'Ｄ　外国の料理　　　　　　土曜日　14:00～16:00　2,500円\n'
        '（料金は一回のねだんです）\n'
        '\n'
        '・申し込みは、クラスの三日前までに電話でお願いします。\n'
        '・エプロンを持ってきてください。\n'
        '・初めての方は、料金が500円安くなります。',
    [
      _q(
        'Maria bekerja di kantor, hari kerja sampai jam 7 malam. Ia senggang Sabtu sore dan ingin ikut sendirian. Kelas mana yang bisa ia ikuti?',
        'Maria is an office worker who works until 7 p.m. on weekdays. She is free on Saturday afternoons and wants to go alone. Which class can she take?',
        ['Ｄ', 'Ａ', 'Ｂ', 'Ｃ'],
      ),
      _q(
        'Berapa yang dibayar orang yang pertama kali ikut kelas B?',
        'How much does a first-timer pay for class B?',
        ['2,000円', '2,500円', '3,000円', '1,500円'],
      ),
      _q(
        'Mana yang benar tentang pendaftaran?',
        'Which is correct about signing up?',
        ['クラスの三日前までに電話する', '当日、教室で申し込む', 'メールで申し込む', '一週間前までに教室へ行く'],
      ),
    ],
  ),
  _rp(
    'ja_r4m_11',
    'Cara membuang sampah',
    'How to put out garbage',
    'みどり町　ごみの出し方\n'
        '\n'
        '・もえるごみ（生ごみ、紙など）　………　月曜日・木曜日\n'
        '・もえないごみ（ガラス、なべなど）　…　第２・第４水曜日\n'
        '・プラスチック　………………………　金曜日\n'
        '・びん・かん　…………………………　第１・第３水曜日\n'
        '\n'
        '※ごみは、出す日の朝八時までに出してください。\n'
        '※前の日の夜に出してはいけません。\n'
        '※大きいごみ（いす、机など）は、市役所に電話してください。お金がかかります。',
    [
      _q(
        'Hari ini Rabu pertama bulan ini. Sampah apa yang bisa dibuang?',
        'Today is the first Wednesday of the month. What can be put out?',
        ['びん・かん', 'もえないごみ', 'プラスチック', '生ごみ'],
      ),
      _q(
        'Kalau ingin membuang kursi lama, apa yang harus dilakukan?',
        'What should you do to throw away an old chair?',
        ['市役所に電話する', '月曜日の朝に出す', '水曜日の夜に出す', '金曜日に出す'],
      ),
      _q(
        'Sampah harus dibuang paling lambat kapan?',
        'By when must garbage be put out?',
        ['出す日の朝八時まで', '前の日の夜まで', '出す日の昼まで', '出す日の夜八時まで'],
      ),
    ],
  ),
  _rp(
    'ja_r4m_12',
    'Tarif pusat olahraga',
    'Sports center fees',
    '市民スポーツセンター　利用料金\n'
        '\n'
        '　　　　　　　　　　　　大人　　　　中学生以下\n'
        'プール（2時間）　　　　600円　　　 300円\n'
        'トレーニング室（1回）　400円　　　（使えません）\n'
        'テニスコート（1時間）　1面 1,200円\n'
        '\n'
        '・65歳以上の方は、大人料金の半分です。\n'
        '・毎週月曜日は休みです。\n'
        '・テニスコートは、一週間前から電話で予約できます。',
    [
      _q(
        'Ayah (40 tahun) dan adik (SMP) memakai kolam renang 2 jam. Totalnya berapa?',
        'A father (40) and his son (junior high) use the pool for 2 hours. How much in total?',
        ['900円', '600円', '1,200円', '1,000円'],
      ),
      _q(
        'Berapa yang dibayar nenek (70 tahun) untuk kolam renang?',
        'How much does a grandmother (70) pay for the pool?',
        ['300円', '600円', '150円', '400円'],
      ),
      _q(
        'Apa yang tidak boleh dilakukan adik yang masih SD?',
        'What can a younger sister in elementary school NOT do?',
        ['トレーニング室を使う', 'プールで泳ぐ', 'テニスをする', '土曜日に行く'],
      ),
    ],
  ),
];

// ---------------------------------------------------------------------------
// 聴解 — tambahan N4
// ---------------------------------------------------------------------------
final List<ListeningPassage> listeningJaN4More = [
  // 課題理解
  _lp(
    'ja_4m_1',
    'Karya Wisata ke Museum',
    'Field Trip to the Museum',
    'みなさん、来週の 月曜日は 校外学習で 博物館へ 行きます。朝 九時に、学校では なく、駅の 前に 集まって ください。お弁当は いりません。博物館の 中の レストランで 食べます。でも、飲み物は 自分で 持って きて ください。それから、博物館の 中では 写真を とっては いけませんので、カメラは 持って こなくても いいです。',
    {
      'id':
          'Semuanya, Senin depan kita karya wisata ke museum. Pukul sembilan pagi, berkumpullah bukan di sekolah tetapi di depan stasiun. Bekal tidak perlu. Kita makan di restoran di dalam museum. Tapi minuman bawalah sendiri. Lalu, di dalam museum tidak boleh memotret, jadi kamera tidak perlu dibawa.',
      'en':
          'Everyone, next Monday we are going to the museum on a field trip. At nine in the morning, gather in front of the station, not at school. You don’t need a packed lunch; we will eat at the restaurant inside the museum. But please bring your own drinks. Also, taking photos is not allowed inside the museum, so you don’t need to bring a camera.',
    },
    [
      _q(
        'Hari Senin pagi, siswa berkumpul di mana?',
        'Where do the students gather on Monday morning?',
        ['駅の 前', '学校', '博物館', 'レストラン'],
      ),
      _q('Apa yang harus dibawa siswa?', 'What must the students bring?', [
        '飲み物',
        'お弁当',
        'カメラ',
        '教科書',
      ]),
      _q(
        'Apa yang dilarang di dalam museum?',
        'What is not allowed inside the museum?',
        ['写真を とること', 'レストランで 食べること', '飲み物を 持って 行くこと', '九時に 集まること'],
      ),
    ],
  ),
  _lp(
    'ja_4m_2',
    'Permintaan di Kantor',
    'A Request at the Office',
    'リンさん、すみませんが、ちょっと お願いが あります。午後の 会議で 使う 資料を 二十部 コピーして もらえますか。あ、でも その 前に、会議室の エアコンが 壊れて いないか 見て きて ください。昨日 調子が 悪かったんです。もし 壊れて いたら、隣の 小さい 会議室を 使いますから、私に 教えて ください。コピーは その あとで いいです。',
    {
      'id':
          'Lin, maaf, ada yang mau saya minta. Bisa fotokopi materi untuk rapat siang ini dua puluh rangkap? Oh, tapi sebelum itu, tolong cek apakah AC ruang rapat rusak. Kemarin kondisinya buruk. Kalau rusak, kita pakai ruang rapat kecil di sebelah, jadi beri tahu saya. Fotokopinya boleh sesudah itu.',
      'en':
          'Lin, sorry, I have a favor to ask. Could you make twenty copies of the materials for the afternoon meeting? Oh, but before that, please go check whether the meeting room’s air conditioner is broken. It wasn’t working well yesterday. If it is broken, we’ll use the small meeting room next door, so let me know. The copies can be done after that.',
    },
    [
      _q('Apa yang Lin lakukan pertama kali?', 'What will Lin do first?', [
        '会議室の エアコンを 見る',
        '資料を コピーする',
        '隣の 会議室を 予約する',
        'エアコンを 直す',
      ]),
      _q('Berapa rangkap fotokopinya?', 'How many copies are needed?', [
        '二十部',
        '十部',
        '十二部',
        '三十部',
      ]),
      _q(
        'Kalau AC rusak, apa yang akan dilakukan?',
        'If the air conditioner is broken, what will they do?',
        ['隣の 小さい 会議室を 使う', '会議を やめる', '修理の 人を 呼ぶ', '会議を 明日に する'],
      ),
    ],
  ),
  // ポイント理解
  _lp(
    'ja_4m_3',
    'Berhenti Jogging',
    'Stopping Jogging',
    'わたしは 毎朝 ジョギングを して いましたが、先月から やめて しまいました。足が 痛く なったからでは ありません。仕事が 忙しく なって、朝 早く 起きられなく なったからです。それで、今は 会社から 帰る とき、一つ 前の 駅で 降りて、家まで 歩く ように して います。',
    {
      'id':
          'Dulu saya jogging setiap pagi, tapi sejak bulan lalu saya berhenti. Bukan karena kaki saya sakit. Karena pekerjaan jadi sibuk dan saya tidak bisa bangun pagi-pagi lagi. Jadi sekarang, saat pulang kantor, saya turun satu stasiun lebih awal dan berjalan sampai rumah.',
      'en':
          'I used to jog every morning, but I stopped last month. It wasn’t because my legs started hurting. It was because work got busy and I could no longer get up early. So now, on the way home from work, I get off one station early and walk home.',
    },
    [
      _q('Mengapa ia berhenti jogging?', 'Why did the speaker stop jogging?', [
        '朝 早く 起きられなく なったから',
        '足が 痛く なったから',
        '会社が 遠く なったから',
        '雨の 日が 多かったから',
      ]),
      _q('Apa yang ia lakukan sekarang?', 'What does the speaker do now?', [
        '一つ 前の 駅で 降りて 歩く',
        '夜に ジョギングを する',
        '会社まで 自転車で 行く',
        '朝 早く 会社まで 歩く',
      ]),
    ],
  ),
  _lp(
    'ja_4m_4',
    'Pengumuman Supermarket',
    'Supermarket Announcement',
    'いらっしゃいませ。本日は さくらスーパーに ご来店 いただき、ありがとうございます。ただいまから 午後 五時まで、二階の 果物売り場で りんごが 一袋 三百円です。また、一階の パン売り場では、パンを 二つ 買うと、もう 一つ ただで さしあげます。どうぞ ご利用ください。',
    {
      'id':
          'Selamat datang. Terima kasih telah berbelanja di Sakura Supermarket hari ini. Mulai sekarang sampai pukul lima sore, di bagian buah lantai dua apel dijual tiga ratus yen per kantong. Selain itu, di bagian roti lantai satu, kalau membeli dua roti, Anda mendapat satu lagi gratis. Silakan dimanfaatkan.',
      'en':
          'Welcome. Thank you for visiting Sakura Supermarket today. From now until 5 p.m., apples are 300 yen a bag at the fruit section on the second floor. Also, at the bread section on the first floor, if you buy two pieces of bread, you get one more free. Please take advantage of it.',
    },
    [
      _q(
        'Apel dijual di lantai berapa?',
        'On which floor are the apples sold?',
        ['二階', '一階', '三階', '地下'],
      ),
      _q(
        'Apa yang terjadi kalau membeli dua roti?',
        'What happens if you buy two pieces of bread?',
        ['もう 一つ もらえる', '半分の 値段に なる', '三百円に なる', 'りんごが もらえる'],
      ),
      _q(
        'Diskon apel sampai jam berapa?',
        'Until what time is the apple sale?',
        ['五時', '三時', '七時', '六時'],
      ),
    ],
  ),
  _lp(
    'ja_4m_5',
    'Pesan Telepon soal Film',
    'Phone Message about a Movie',
    'もしもし、田中です。明日の 映画の ことなんだけど、六時からのは もう 席が なかったから、八時からのを 予約したよ。だから、映画館の 前で 七時半に 会おう。でも、その 前に 晩ご飯を 食べたかったら、六時半に 駅で 会おうか。返事、待ってるね。',
    {
      'id':
          'Halo, ini Tanaka. Soal film besok, yang jam enam sudah tidak ada kursi, jadi aku pesan yang jam delapan. Jadi, ketemu jam setengah delapan di depan bioskop ya. Tapi kalau mau makan malam dulu, kita ketemu jam setengah tujuh di stasiun? Kutunggu balasanmu.',
      'en':
          'Hello, it’s Tanaka. About tomorrow’s movie: there were no seats left for the six o’clock showing, so I booked the eight o’clock one. So let’s meet in front of the cinema at seven-thirty. But if you want to have dinner first, shall we meet at the station at six-thirty? Waiting for your reply.',
    },
    [
      _q('Filmnya mulai jam berapa?', 'What time does the movie start?', [
        '八時',
        '六時',
        '七時半',
        '六時半',
      ]),
      _q('Mengapa jamnya berubah?', 'Why did the time change?', [
        '六時の 映画の 席が なかったから',
        '田中さんが 忙しいから',
        '晩ご飯を 食べたいから',
        '映画館が 遠いから',
      ]),
      _q(
        'Kalau makan malam bersama dulu, bertemu kapan dan di mana?',
        'If they eat dinner together first, when and where do they meet?',
        ['六時半に 駅で', '七時半に 映画館の 前で', '六時に 駅で', '八時に 映画館の 前で'],
      ),
    ],
  ),
  // 発話表現
  _lp(
    'ja_4m_6',
    'Berkunjung ke Rumah Teman',
    'Visiting a Friend’s House',
    '友だちの 家に 遊びに 行きました。玄関で 靴を 脱いで、家に 入ります。友だちの お母さんが お菓子を 出して くれました。夕方に なって、帰る 時間に なりました。',
    {
      'id':
          'Saya pergi main ke rumah teman. Saya melepas sepatu di pintu masuk dan masuk ke rumah. Ibu teman menyajikan kue. Sore tiba, dan sudah waktunya pulang.',
      'en':
          'I went to visit a friend’s house. I take off my shoes at the entrance and go inside. My friend’s mother served some sweets. Evening came, and it was time to go home.',
    },
    [
      _q(
        'Saat masuk ke rumah teman, apa yang kamu ucapkan?',
        'When entering your friend’s house, what do you say?',
        ['おじゃまします', 'ただいま', 'おかえりなさい', 'いってきます'],
      ),
      _q(
        'Sebelum makan kue yang disajikan, apa yang kamu ucapkan?',
        'Before eating the sweets you were served, what do you say?',
        ['いただきます', 'ごちそうさまでした', 'おじゃましました', 'おかげさまで'],
      ),
      _q(
        'Saat pulang dari rumah teman, apa yang kamu ucapkan?',
        'When leaving your friend’s house, what do you say?',
        ['おじゃましました', 'いってらっしゃい', 'おかえりなさい', 'いらっしゃいませ'],
      ),
    ],
  ),
  _lp(
    'ja_4m_7',
    'Di Toko Pakaian',
    'At the Clothing Store',
    'デパートの 洋服売り場に います。気に 入った シャツが ありますが、サイズが 少し 小さいようです。',
    {
      'id':
          'Saya berada di bagian pakaian sebuah department store. Ada kemeja yang saya suka, tetapi ukurannya tampak sedikit kecil.',
      'en':
          'I am in the clothing section of a department store. There is a shirt I like, but the size seems a little small.',
    },
    [
      _q(
        'Kamu ingin mencoba kemeja itu. Apa yang kamu katakan kepada pegawai?',
        'You want to try the shirt on. What do you say to the clerk?',
        [
          'これ、着て みても いいですか',
          'これ、着て あげましょうか',
          'これ、着た ことが ありますか',
          'これ、着て くださいませんか',
        ],
      ),
      _q(
        'Kamu ingin ukuran yang lebih besar. Apa yang kamu katakan?',
        'You want a bigger size. What do you say?',
        [
          'もう 少し 大きいのは ありますか',
          'もう 少し 小さく して ください',
          'これより 安いのは いかがですか',
          '大きいのを お持ちしましょうか',
        ],
      ),
      _q(
        'Kamu memutuskan untuk membeli. Apa yang kamu katakan?',
        'You decide to buy it. What do you say?',
        ['これを ください', 'これは いかがですか', 'これで よろしいですか', 'どうぞ 召し上がって ください'],
      ),
    ],
  ),
  _lp(
    'ja_4m_8',
    'Sakit di Kantor',
    'Feeling Sick at Work',
    '会社で 働いて います。今日は 朝から 熱が あって、とても 調子が 悪いです。まだ 三時ですが、早く 帰りたいです。',
    {
      'id':
          'Saya sedang bekerja di kantor. Sejak pagi saya demam dan kondisi saya sangat buruk. Baru jam tiga, tapi saya ingin pulang lebih awal.',
      'en':
          'I am working at the office. I have had a fever since the morning and feel very unwell. It’s only three o’clock, but I want to go home early.',
    },
    [
      _q(
        'Kamu minta izin pulang cepat kepada atasan. Apa yang kamu katakan?',
        'You ask your boss for permission to leave early. What do you say?',
        [
          'すみませんが、今日は 早く 帰らせて いただけませんか',
          'すみませんが、今日は 早く 帰って いただけませんか',
          '今日は 早く 帰っても かまいませんよ',
          '早く 帰らせて あげましょうか',
        ],
      ),
      _q(
        'Kamu pulang lebih dulu dari rekan kerja. Apa yang kamu katakan?',
        'You are leaving before your coworkers. What do you say?',
        ['お先に 失礼します', 'いってらっしゃい', 'おかえりなさい', 'いらっしゃいませ'],
      ),
    ],
  ),
  // 即時応答
  _lp(
    'ja_4m_9',
    'Kursi Kosong',
    'An Empty Seat',
    'すみません、この 席、空いて いますか。',
    {'id': 'Permisi, kursi ini kosong?', 'en': 'Excuse me, is this seat free?'},
    [
      _q('Jawaban yang paling tepat?', 'What is the best reply?', [
        'ええ、どうぞ',
        'はい、空きました',
        'いいえ、どういたしまして',
        'ええ、座りましょう',
      ]),
      _q(
        'Apa yang ingin dilakukan pembicara?',
        'What does the speaker want to do?',
        ['その 席に 座りたい', '席を 予約したい', '席を 片付けたい', '席を 探して あげたい'],
      ),
    ],
  ),
  _lp(
    'ja_4m_10',
    'Ajakan ke Pesta',
    'About the Party',
    '田中さん、明日の パーティー、来られそう？',
    {
      'id': 'Tanaka, kira-kira bisa datang ke pesta besok?',
      'en': 'Tanaka, do you think you can make it to tomorrow’s party?',
    },
    [
      _q('Jawaban yang paling tepat?', 'What is the best reply?', [
        'うん、行けると 思う',
        'うん、来られたよ',
        'うん、行った ことが あるよ',
        'うん、来ても いいよ',
      ]),
      _q('Apa yang ditanyakan?', 'What is being asked?', [
        '明日 パーティーに 来られるか どうか',
        'パーティーの 場所',
        'パーティーで 何を 食べるか',
        'だれが パーティーに 来るか',
      ]),
    ],
  ),
  _lp(
    'ja_4m_11',
    'Pulang Duluan',
    'Leaving First',
    'お疲れさまでした。お先に 失礼します。',
    {
      'id': 'Terima kasih atas kerja kerasnya. Saya pamit duluan.',
      'en': 'Thanks for your hard work. I’ll be leaving now.',
    },
    [
      _q('Jawaban yang paling tepat?', 'What is the best reply?', [
        'お疲れさまでした',
        'いらっしゃいませ',
        'おじゃまします',
        'いただきます',
      ]),
      _q('Apa yang dilakukan pembicara?', 'What is the speaker doing?', [
        '先に 帰る',
        '会社に 来た',
        '食事を 始める',
        '人の 家に 入る',
      ]),
    ],
  ),
  _lp(
    'ja_4m_12',
    'Barang Bawaan Berat',
    'Heavy Luggage',
    'その 荷物、重そうですね。一つ 持ちましょうか。',
    {
      'id': 'Barang itu kelihatannya berat ya. Mau saya bawakan satu?',
      'en': 'That luggage looks heavy. Shall I carry one for you?',
    },
    [
      _q('Jawaban yang paling tepat?', 'What is the best reply?', [
        'ありがとうございます。じゃ、お願いします',
        'いいえ、持ちましょう',
        'どういたしまして',
        'はい、持って くれました',
      ]),
      _q('Apa yang ditawarkan pembicara?', 'What does the speaker offer?', [
        '荷物を 持つ こと',
        '荷物を 送る こと',
        '荷物を 買う こと',
        '荷物を 開ける こと',
      ]),
    ],
  ),
  _lp(
    'ja_4m_13',
    'Bertanya kepada Guru',
    'Asking the Teacher',
    '先生、この 漢字の 読み方を 教えて いただけませんか。',
    {
      'id': 'Pak/Bu Guru, bolehkah Anda memberi tahu cara baca kanji ini?',
      'en': 'Teacher, could you tell me how to read this kanji?',
    },
    [
      _q(
        'Jawaban guru yang paling tepat?',
        'What is the teacher’s best reply?',
        [
          'ええ、いいですよ。これは「けいけん」と 読みます',
          'はい、教えて いただきました',
          'ええ、教えて もらいましょう',
          'いいえ、読まれません',
        ],
      ),
      _q('Apa yang diinginkan pembicara?', 'What does the speaker want?', [
        '漢字の 読み方を 知りたい',
        '漢字を 書いて ほしい',
        '宿題を 出したい',
        '辞書を 借りたい',
      ]),
    ],
  ),
  _lp(
    'ja_4m_14',
    'Jendela',
    'The Window',
    'ちょっと 寒いですね。窓を 閉めても いいですか。',
    {
      'id': 'Agak dingin ya. Boleh saya tutup jendelanya?',
      'en': 'It’s a bit cold, isn’t it? May I close the window?',
    },
    [
      _q('Jawaban yang paling tepat?', 'What is the best reply?', [
        'ええ、どうぞ',
        'ええ、閉まって いますね',
        'いいえ、閉まりません',
        'はい、寒かったです',
      ]),
      _q(
        'Apa yang ingin dilakukan pembicara?',
        'What does the speaker want to do?',
        ['窓を 閉めたい', '窓を 開けたい', 'エアコンを つけたい', '外に 出たい'],
      ),
    ],
  ),
];
