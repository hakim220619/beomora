import 'mcq_bank.dart';

/// Bank soal tata bahasa (文法) JLPT per level untuk bagian "Tata Bahasa"
/// pada mode Ujian.
///
/// Setiap soal berupa kalimat Jepang dengan bagian kosong （　　）; peserta
/// memilih kata/pola yang tepat. Ada juga soal bertipe 文の組み立て
/// (menyusun kalimat) — peserta memilih potongan yang masuk di posisi ★.
/// Teks soal tersedia per bahasa UI (id/en); pilihan jawaban selalu dalam
/// bahasa Jepang. Pilihan PERTAMA pada [_g] selalu jawaban benar — layar
/// ujian yang mengacak urutannya.
McqQuestion _g(String id, String en, List<String> options) =>
    McqQuestion(question: {'id': id, 'en': en}, options: options, answer: 0);

// ---------------------------------------------------------------------------
// N5
// ---------------------------------------------------------------------------
final List<McqQuestion> grammarN5 = [
  _g(
    'Pilih yang tepat: わたしは まいあさ コーヒー（　　）のみます。',
    'Choose the correct word: わたしは まいあさ コーヒー（　　）のみます。',
    ['を', 'に', 'で', 'が'],
  ),
  _g(
    'Pilih yang tepat: がっこう（　　）ともだちと べんきょうします。',
    'Choose the correct word: がっこう（　　）ともだちと べんきょうします。',
    ['で', 'を', 'へ', 'と'],
  ),
  _g(
    'Pilih yang tepat: にちようび（　　）とうきょうへ いきます。',
    'Choose the correct word: にちようび（　　）とうきょうへ いきます。',
    ['に', 'で', 'を', 'へ'],
  ),
  _g(
    'Pilih yang tepat: これは わたし（　　）かさです。',
    'Choose the correct word: これは わたし（　　）かさです。',
    ['の', 'が', 'を', 'に'],
  ),
  _g(
    'Pilih yang tepat: きのう えいがを（　　）。',
    'Choose the correct word: きのう えいがを（　　）。',
    ['みました', 'みます', 'みません', 'みて'],
  ),
  _g(
    'Pilih yang tepat: ちょっと まって（　　）。',
    'Choose the correct word: ちょっと まって（　　）。',
    ['ください', 'ます', 'ました', 'でした'],
  ),
  _g(
    'Pilih yang tepat: あさ（　　）、はを みがきます。',
    'Choose the correct word: あさ（　　）、はを みがきます。',
    ['おきて', 'おきます', 'おきた', 'おきる'],
  ),
  _g(
    'Pilih yang tepat: のどが かわきました。みずが（　　）です。',
    'Choose the correct word: のどが かわきました。みずが（　　）です。',
    ['のみたい', 'のみます', 'のんで', 'のみたく'],
  ),
  _g(
    'Pilih yang tepat: きのうは とても（　　）。',
    'Choose the correct word: きのうは とても（　　）。',
    ['さむかったです', 'さむいでした', 'さむくでした', 'さむかったでした'],
  ),
  _g(
    'Pilih yang tepat: この まちは（　　）です。',
    'Choose the correct word: この まちは（　　）です。',
    ['しずか', 'しずかな', 'しずかい', 'しずかの'],
  ),
  _g(
    'Pilih yang tepat: この へやは（　　）ありません。',
    'Choose the correct word: この へやは（　　）ありません。',
    ['きれいでは', 'きれいく', 'きれいじゃない', 'きれいい'],
  ),
  _g(
    'Pilih yang tepat: りんごを（　　）かいました。',
    'Choose the correct word: りんごを（　　）かいました。',
    ['みっつ', 'さんまい', 'さんにん', 'さんぼん'],
  ),
  _g(
    'Pilih yang tepat: きょうしつに がくせいが（　　）います。',
    'Choose the correct word: きょうしつに がくせいが（　　）います。',
    ['ごにん', 'ごこ', 'ごまい', 'ごひき'],
  ),
  _g(
    'Pilih yang tepat: 「すみません、（　　）ほんは いくらですか。」'
        '「これですか。500えんです。」',
    'Choose the correct word: 「すみません、（　　）ほんは いくらですか。」'
        '「これですか。500えんです。」',
    ['その', 'あの', 'これ', 'それ'],
  ),
  _g(
    'Pilih yang tepat: こうえんに いぬが（　　）。',
    'Choose the correct word: こうえんに いぬが（　　）。',
    ['います', 'あります', 'です', 'します'],
  ),
  _g(
    'Pilih yang tepat: つくえの うえに ペンが（　　）。',
    'Choose the correct word: つくえの うえに ペンが（　　）。',
    ['あります', 'います', 'です', 'いります'],
  ),
  _g(
    'Pilih yang tepat: 「つかれましたね。ちょっと（　　）。」'
        '「ええ、そうしましょう。」',
    'Choose the correct word: 「つかれましたね。ちょっと（　　）。」'
        '「ええ、そうしましょう。」',
    ['やすみましょう', 'やすみます', 'やすみました', 'やすみません'],
  ),
  _g(
    'Pilih yang tepat: わたしは ともだち（　　）えいがを みました。',
    'Choose the correct word: わたしは ともだち（　　）えいがを みました。',
    ['と', 'を', 'が', 'の'],
  ),
  _g(
    'Pilih yang tepat: ぎんこうは 9じ（　　）3じまでです。',
    'Choose the correct word: ぎんこうは 9じ（　　）3じまでです。',
    ['から', 'まで', 'に', 'で'],
  ),
  _g(
    'Pilih yang tepat: わたしは がくせいです。かれ（　　）がくせいです。',
    'Choose the correct word: わたしは がくせいです。かれ（　　）がくせいです。',
    ['も', 'は', 'が', 'を'],
  ),
  _g(
    'Pilih yang tepat: らいねん にほん（　　）いきたいです。',
    'Choose the correct word: らいねん にほん（　　）いきたいです。',
    ['へ', 'を', 'が', 'で'],
  ),
  // 文の組み立て
  _g(
    'Kata mana yang masuk di ★? あそこ ＿＿ ＿＿ ★ ＿＿ せんせいです。',
    'Which word goes in the ★ slot? あそこ ＿＿ ＿＿ ★ ＿＿ せんせいです。',
    ['ひとは', 'に', 'いる', 'わたしの'],
  ),
  _g(
    'Kata mana yang masuk di ★? これは ＿＿ ＿＿ ★ ＿＿ です。',
    'Which word goes in the ★ slot? これは ＿＿ ＿＿ ★ ＿＿ です。',
    ['かった', 'きょねん', 'にほんで', 'かばん'],
  ),
  _g(
    'Kata mana yang masuk di ★? たなかさんは ＿＿ ＿＿ ★ ＿＿ います。',
    'Which word goes in the ★ slot? たなかさんは ＿＿ ＿＿ ★ ＿＿ います。',
    ['ふくを', 'あの', 'あかい', 'きて'],
  ),
  _g(
    'Kata mana yang masuk di ★? ＿＿ ＿＿ ★ ＿＿ ください。',
    'Which word goes in the ★ slot? ＿＿ ＿＿ ★ ＿＿ ください。',
    ['よみかたを', 'この', 'かんじの', 'おしえて'],
  ),
];

// ---------------------------------------------------------------------------
// N4
// ---------------------------------------------------------------------------
final List<McqQuestion> grammarN4 = [
  _g(
    'Pilih yang tepat: いま 雨が（　　）います。',
    'Choose the correct word: いま 雨が（　　）います。',
    ['ふって', 'ふり', 'ふった', 'ふる'],
  ),
  _g(
    'Pilih yang tepat: かべに ポスターが（　　）あります。',
    'Choose the correct word: かべに ポスターが（　　）あります。',
    ['はって', 'はり', 'はった', 'はいて'],
  ),
  _g(
    'Pilih yang tepat: 旅行の前に ホテルを（　　）おきます。',
    'Choose the correct word: 旅行の前に ホテルを（　　）おきます。',
    ['予約して', '予約し', '予約した', '予約する'],
  ),
  _g(
    'Pilih yang tepat: わたしは 漢字が 少し（　　）。',
    'Choose the correct word: わたしは 漢字が 少し（　　）。',
    ['読めます', '読みます', '読まれます', '読みられます'],
  ),
  _g(
    'Pilih yang tepat: 来年は もっと 勉強（　　）と 思います。',
    'Choose the correct word: 来年は もっと 勉強（　　）と 思います。',
    ['しよう', 'する', 'したい', 'しろう'],
  ),
  _g(
    'Pilih yang tepat: 駅に（　　）、電話してください。',
    'Choose the correct word: 駅に（　　）、電話してください。',
    ['ついたら', 'つくと', 'つけば', 'ついたと'],
  ),
  _g(
    'Pilih yang tepat: 時間が（　　）ば、手伝います。',
    'Choose the correct word: 時間が（　　）ば、手伝います。',
    ['あれ', 'ある', 'あり', 'あっ'],
  ),
  _g(
    'Pilih yang tepat: このボタンを（　　）と、切符が 出ます。',
    'Choose the correct word: このボタンを（　　）と、切符が 出ます。',
    ['押す', '押して', '押した', '押し'],
  ),
  _g(
    'Pilih yang tepat: 音楽を（　　）ながら、勉強します。',
    'Choose the correct word: 音楽を（　　）ながら、勉強します。',
    ['聞き', '聞く', '聞いて', '聞いた'],
  ),
  _g(
    'Pilih yang tepat: このケーキは（　　）そうですね。',
    'Choose the correct word: このケーキは（　　）そうですね。',
    ['おいし', 'おいしい', 'おいしく', 'おいしいだ'],
  ),
  _g(
    'Pilih yang tepat: 明日は 雨が（　　）かもしれません。',
    'Choose the correct word: 明日は 雨が（　　）かもしれません。',
    ['ふる', 'ふり', 'ふって', 'ふります'],
  ),
  _g(
    'Pilih yang tepat: 明日 早く（　　）なければ なりません。',
    'Choose the correct word: 明日 早く（　　）なければ なりません。',
    ['起き', '起きる', '起きて', '起きた'],
  ),
  _g(
    'Pilih yang tepat: わたしの誕生日に 友だちが プレゼントを（　　）。',
    'Choose the correct word: わたしの誕生日に 友だちが プレゼントを（　　）。',
    ['くれました', 'あげました', 'もらいました', 'やりました'],
  ),
  _g(
    'Pilih yang tepat: 宿題を 忘れて、先生に（　　）。',
    'Choose the correct word: 宿題を 忘れて、先生に（　　）。',
    ['しかられました', 'しかりました', 'しかっています', 'しからせました'],
  ),
  _g(
    'Pilih yang tepat: 先生は 学生に 作文を（　　）。',
    'Choose the correct word: 先生は 学生に 作文を（　　）。',
    ['書かせました', '書かれました', '書きました', '書けました'],
  ),
  _g(
    'Pilih yang tepat: 一生けんめい（　　）のに、試験に 落ちました。',
    'Choose the correct word: 一生けんめい（　　）のに、試験に 落ちました。',
    ['勉強した', '勉強して', '勉強し', '勉強で'],
  ),
  _g(
    'Pilih yang tepat: 頭が（　　）ので、早く 帰ります。',
    'Choose the correct word: 頭が（　　）ので、早く 帰ります。',
    ['痛い', '痛くて', '痛いだ', '痛く'],
  ),
  _g(
    'Pilih yang tepat: 弟は 遊んで（　　）で、勉強しません。',
    'Choose the correct word: 弟は 遊んで（　　）で、勉強しません。',
    ['ばかり', 'だけ', 'しか', 'ほど'],
  ),
  _g(
    'Pilih yang tepat: 「昨日 何を（　　）？」「映画を 見た。」',
    'Choose the correct word: 「昨日 何を（　　）？」「映画を 見た。」',
    ['した', 'します', 'しました', 'して'],
  ),
  _g(
    'Pilih yang tepat: 先生が 本を（　　）になりました。',
    'Choose the correct word: 先生が 本を（　　）になりました。',
    ['お読み', '読み', 'お読む', '読んで'],
  ),
  _g(
    'Pilih yang tepat: ここで 写真を（　　）も いいですか。',
    'Choose the correct word: ここで 写真を（　　）も いいですか。',
    ['とって', 'とり', 'とる', 'とった'],
  ),
  // 文の組み立て
  _g(
    'Kata mana yang masuk di ★? 母に ＿＿ ＿＿ ★ ＿＿ もらいました。',
    'Which word goes in the ★ slot? 母に ＿＿ ＿＿ ★ ＿＿ もらいました。',
    ['作り方を', 'おいしい', 'カレーの', '教えて'],
  ),
  _g(
    'Kata mana yang masuk di ★? 雨が ＿＿ ＿＿ ★ ＿＿ ましょう。',
    'Which word goes in the ★ slot? 雨が ＿＿ ＿＿ ★ ＿＿ ましょう。',
    ['傘を', '降り', 'そうだから', '持って行き'],
  ),
  _g(
    'Kata mana yang masuk di ★? '
        'きのう ＿＿ ＿＿ ★ ＿＿ とても おもしろかったです。',
    'Which word goes in the ★ slot? '
        'きのう ＿＿ ＿＿ ★ ＿＿ とても おもしろかったです。',
    ['くれた', '友だちが', '貸して', '本は'],
  ),
  _g(
    'Kata mana yang masuk di ★? ＿＿ ＿＿ ★ ＿＿ なりました。',
    'Which word goes in the ★ slot? ＿＿ ＿＿ ★ ＿＿ なりました。',
    ['泳げる', '毎日', '練習して', 'ように'],
  ),
];

// ---------------------------------------------------------------------------
// N3
// ---------------------------------------------------------------------------
final List<McqQuestion> grammarN3 = [
  _g(
    'Pilih yang tepat: 健康のために、毎日野菜を（　　）ようにしています。',
    'Choose the correct word: 健康のために、毎日野菜を（　　）ようにしています。',
    ['食べる', '食べて', '食べた', '食べ'],
  ),
  _g(
    'Pilih yang tepat: 来月から日本語学校に（　　）ことにしました。',
    'Choose the correct word: 来月から日本語学校に（　　）ことにしました。',
    ['通う', '通って', '通い', '通おう'],
  ),
  _g(
    'Pilih yang tepat: 彼は英語（　　）、中国語も話せます。',
    'Choose the correct word: 彼は英語（　　）、中国語も話せます。',
    ['ばかりでなく', 'ばかりに', 'だけで', 'ばかりで'],
  ),
  _g(
    'Pilih yang tepat: 高いものが必ずいい（　　）。',
    'Choose the correct word: 高いものが必ずいい（　　）。',
    ['わけではない', 'はずではない', 'ことではない', 'ものではない'],
  ),
  _g(
    'Pilih yang tepat: この問題は子ども（　　）難しすぎる。',
    'Choose the correct word: この問題は子ども（　　）難しすぎる。',
    ['にとって', 'によって', 'について', 'として'],
  ),
  _g(
    'Pilih yang tepat: 国（　　）文化や習慣が違います。',
    'Choose the correct word: 国（　　）文化や習慣が違います。',
    ['によって', 'にとって', 'について', 'に対して'],
  ),
  _g(
    'Pilih yang tepat: 日本の歴史（　　）レポートを書きました。',
    'Choose the correct word: 日本の歴史（　　）レポートを書きました。',
    ['について', 'によって', 'にとって', 'にかけて'],
  ),
  _g(
    'Pilih yang tepat: 事故の（　　）、電車が遅れています。',
    'Choose the correct word: 事故の（　　）、電車が遅れています。',
    ['ため', 'ように', 'せいに', 'おかげ'],
  ),
  _g(
    'Pilih yang tepat: 忘れない（　　）、メモしておきます。',
    'Choose the correct word: 忘れない（　　）、メモしておきます。',
    ['ように', 'ために', 'ことに', 'ほどに'],
  ),
  _g(
    'Pilih yang tepat: 出発してもう2時間になるから、'
        '彼はもう家に着いている（　　）です。',
    'Choose the correct word: 出発してもう2時間になるから、'
        '彼はもう家に着いている（　　）です。',
    ['はず', 'べき', 'つもり', 'まま'],
  ),
  _g('Pilih yang tepat: 約束は守る（　　）だ。', 'Choose the correct word: 約束は守る（　　）だ。', [
    'べき',
    'はず',
    'まま',
    'ばかり',
  ]),
  _g(
    'Pilih yang tepat: 隣の家の人は、来月引っ越す（　　）。',
    'Choose the correct word: 隣の家の人は、来月引っ越す（　　）。',
    ['らしい', 'みたいな', 'っぽい', 'がち'],
  ),
  _g(
    'Pilih yang tepat: あの人はまるで人形（　　）にきれいだ。',
    'Choose the correct word: あの人はまるで人形（　　）にきれいだ。',
    ['みたい', 'らしい', 'よう', 'そう'],
  ),
  _g(
    'Pilih yang tepat: この水は少し黄色（　　）ですね。',
    'Choose the correct word: この水は少し黄色（　　）ですね。',
    ['っぽい', 'らしい', 'がち', 'げ'],
  ),
  _g(
    'Pilih yang tepat: 最近、疲れていて学校を休み（　　）だ。',
    'Choose the correct word: 最近、疲れていて学校を休み（　　）だ。',
    ['がち', 'っぽい', 'ぎみ', 'げ'],
  ),
  _g(
    'Pilih yang tepat: 彼は忙しい（　　）、毎日ジョギングを続けている。',
    'Choose the correct word: 彼は忙しい（　　）、毎日ジョギングを続けている。',
    ['ながらも', 'ながらに', 'つつも', 'にも'],
  ),
  _g(
    'Pilih yang tepat: 田舎に帰る（　　）、昔の友達に会います。',
    'Choose the correct word: 田舎に帰る（　　）、昔の友達に会います。',
    ['たびに', 'うちに', 'ところに', 'ばかりに'],
  ),
  _g(
    'Pilih yang tepat: 熱い（　　）、召し上がってください。',
    'Choose the correct word: 熱い（　　）、召し上がってください。',
    ['うちに', 'までに', 'たびに', 'ところに'],
  ),
  _g(
    'Pilih yang tepat: 今、ちょうど昼ご飯を（　　）ところです。',
    'Choose the correct word: 今、ちょうど昼ご飯を（　　）ところです。',
    ['食べている', '食べ', '食べよう', '食べます'],
  ),
  _g(
    'Pilih yang tepat: 弟はゲームを（　　）ばかりいる。',
    'Choose the correct word: 弟はゲームを（　　）ばかりいる。',
    ['して', 'し', 'する', 'した'],
  ),
  _g(
    'Pilih yang tepat: 朝ご飯を（　　）に学校へ行った。',
    'Choose the correct word: 朝ご飯を（　　）に学校へ行った。',
    ['食べず', '食べなく', '食べない', '食べぬ'],
  ),
  _g(
    'Pilih yang tepat: 子どものころ、母に嫌いな野菜を（　　）。',
    'Choose the correct word: 子どものころ、母に嫌いな野菜を（　　）。',
    ['食べさせられた', '食べられた', '食べさせた', '食べれられた'],
  ),
  _g(
    'Pilih yang tepat: 先生は今、研究室に（　　）。',
    'Choose the correct word: 先生は今、研究室に（　　）。',
    ['いらっしゃいます', 'おります', 'まいります', 'いたします'],
  ),
  _g(
    'Pilih yang tepat: 部長が（　　）とおりに、資料を直しました。',
    'Choose the correct word: 部長が（　　）とおりに、資料を直しました。',
    ['おっしゃった', '申した', '申し上げた', '伺った'],
  ),
  _g(
    'Pilih yang tepat: 明日、御社に（　　）よろしいでしょうか。',
    'Choose the correct word: 明日、御社に（　　）よろしいでしょうか。',
    ['伺っても', 'いらっしゃっても', 'おいでになっても', '来ても'],
  ),
  // 文の組み立て
  _g(
    'Kata mana yang masuk di ★? この本は ＿＿ ＿＿ ★ ＿＿ 役に立つ。',
    'Which word goes in the ★ slot? この本は ＿＿ ＿＿ ★ ＿＿ 役に立つ。',
    ['人に', '日本語を', '学ぶ', 'とって'],
  ),
  _g(
    'Kata mana yang masuk di ★? 忘れ ＿＿ ＿＿ ★ ＿＿ おいた。',
    'Which word goes in the ★ slot? 忘れ ＿＿ ＿＿ ★ ＿＿ おいた。',
    ['手帳に', 'ない', 'ように', '書いて'],
  ),
  _g(
    'Kata mana yang masuk di ★? 兄は ＿＿ ＿＿ ★ ＿＿ しています。',
    'Which word goes in the ★ slot? 兄は ＿＿ ＿＿ ★ ＿＿ しています。',
    ['起きる', '毎朝', '早く', 'ように'],
  ),
];

// ---------------------------------------------------------------------------
// N2
// ---------------------------------------------------------------------------
final List<McqQuestion> grammarN2 = [
  _g(
    'Pilih yang tepat: この件（　　）は、後日改めてご説明いたします。',
    'Choose the correct word: この件（　　）は、後日改めてご説明いたします。',
    ['に関して', 'にとって', 'において', 'にかけて'],
  ),
  _g(
    'Pilih yang tepat: 悪天候（　　）、多くの人が集まった。',
    'Choose the correct word: 悪天候（　　）、多くの人が集まった。',
    ['にもかかわらず', 'にかまわず', 'ものの', 'をかまわず'],
  ),
  _g(
    'Pilih yang tepat: 免許は持っている（　　）、ほとんど運転したことがない。',
    'Choose the correct word: 免許は持っている（　　）、'
        'ほとんど運転したことがない。',
    ['ものの', 'ものだから', 'ものなら', 'ものか'],
  ),
  _g(
    'Pilih yang tepat: 「納豆は食べられますか。」'
        '「食べられない（　　）が、あまり好きではありません。」',
    'Choose the correct word: 「納豆は食べられますか。」'
        '「食べられない（　　）が、あまり好きではありません。」',
    ['ことはない', 'わけがない', 'はずがない', 'ものではない'],
  ),
  _g(
    'Pilih yang tepat: 上司の命令なので、従わ（　　）。',
    'Choose the correct word: 上司の命令なので、従わ（　　）。',
    ['ざるを得ない', 'ざるを得る', 'ないを得ない', 'ずを得ない'],
  ),
  _g(
    'Pilih yang tepat: その件については、私からはお答え（　　）。',
    'Choose the correct word: その件については、私からはお答え（　　）。',
    ['いたしかねます', 'いたしかねません', 'できかねません', 'しかねません'],
  ),
  _g(
    'Pilih yang tepat: 連絡先が分からないので、知らせ（　　）。',
    'Choose the correct word: 連絡先が分からないので、知らせ（　　）。',
    ['ようがない', 'ようもある', 'ようがある', 'わけがない'],
  ),
  _g(
    'Pilih yang tepat: 大事な会議があるので、休む（　　）。',
    'Choose the correct word: 大事な会議があるので、休む（　　）。',
    ['わけにはいかない', 'わけにはならない', 'わけがある', 'わけでもある'],
  ),
  _g(
    'Pilih yang tepat: この店は週末（　　）、平日も混んでいる。',
    'Choose the correct word: この店は週末（　　）、平日も混んでいる。',
    ['に限らず', 'に限って', 'に限り', 'を限らず'],
  ),
  _g(
    'Pilih yang tepat: 留学（　　）、日本文化に興味を持つようになった。',
    'Choose the correct word: 留学（　　）、日本文化に興味を持つようになった。',
    ['をきっかけに', 'にきっかけで', 'をきっかけで', 'のきっかけに'],
  ),
  _g(
    'Pilih yang tepat: 体に悪いと知り（　　）、たばこをやめられない。',
    'Choose the correct word: 体に悪いと知り（　　）、たばこをやめられない。',
    ['つつ', 'つつある', 'つつに', 'ついで'],
  ),
  _g(
    'Pilih yang tepat: 契約書をよく読んだ（　　）、サインしてください。',
    'Choose the correct word: 契約書をよく読んだ（　　）、サインしてください。',
    ['上で', '上に', '上は', '上を'],
  ),
  _g(
    'Pilih yang tepat: 詳細が決まり（　　）、ご連絡いたします。',
    'Choose the correct word: 詳細が決まり（　　）、ご連絡いたします。',
    ['次第', '次第で', '次第に', '次第だ'],
  ),
  _g(
    'Pilih yang tepat: 春（　　）、朝晩はまだ寒い。',
    'Choose the correct word: 春（　　）、朝晩はまだ寒い。',
    ['とはいえ', 'といえば', 'というと', 'とはいって'],
  ),
  _g(
    'Pilih yang tepat: この地域は雪が多い（　　）、「雪国」と呼ばれている。',
    'Choose the correct word: この地域は雪が多い（　　）、'
        '「雪国」と呼ばれている。',
    ['ことから', 'ことに', 'ことには', 'ことだから'],
  ),
  _g(
    'Pilih yang tepat: 収入（　　）、税金の額が決まる。',
    'Choose the correct word: 収入（　　）、税金の額が決まる。',
    ['に応じて', 'に応えて', 'に沿って', 'にかけて'],
  ),
  _g(
    'Pilih yang tepat: 一度嘘をついた（　　）、みんなに信用されなくなった。',
    'Choose the correct word: 一度嘘をついた（　　）、'
        'みんなに信用されなくなった。',
    ['ばかりに', 'ばかりで', 'ばかりか', 'ばかりの'],
  ),
  _g(
    'Pilih yang tepat: 彼は優勝を期待されていた（　　）、'
        '負けたときの落胆は大きかった。',
    'Choose the correct word: 彼は優勝を期待されていた（　　）、'
        '負けたときの落胆は大きかった。',
    ['だけに', 'だけで', 'だけは', 'だけあって'],
  ),
  _g(
    'Pilih yang tepat: 道が混んでいた（　　）、遅れてしまいました。',
    'Choose the correct word: 道が混んでいた（　　）、遅れてしまいました。',
    ['ものだから', 'ものの', 'ものなら', 'ものを'],
  ),
  _g(
    'Pilih yang tepat: 彼は何も知らない（　　）、平気な顔をしていた。',
    'Choose the correct word: 彼は何も知らない（　　）、平気な顔をしていた。',
    ['かのように', 'のように', 'かように', 'かのような'],
  ),
  _g(
    'Pilih yang tepat: 経済の発展（　　）、環境問題も深刻になってきた。',
    'Choose the correct word: 経済の発展（　　）、環境問題も深刻になってきた。',
    ['に伴って', 'を伴って', 'に伴われて', 'に沿って'],
  ),
  _g(
    'Pilih yang tepat: 友人（　　）、今の会社を紹介してもらった。',
    'Choose the correct word: 友人（　　）、今の会社を紹介してもらった。',
    ['を通じて', 'に通じて', 'を通って', 'に通して'],
  ),
  _g(
    'Pilih yang tepat: 予想（　　）、試合は簡単に終わった。',
    'Choose the correct word: 予想（　　）、試合は簡単に終わった。',
    ['に反して', 'を反して', 'に反しに', 'に対して'],
  ),
  _g(
    'Pilih yang tepat: 彼があんなことをするとは、信じ（　　）。',
    'Choose the correct word: 彼があんなことをするとは、信じ（　　）。',
    ['がたい', 'がたく', 'たがい', 'がたさ'],
  ),
  _g(
    'Pilih yang tepat: 彼とは卒業式で会った（　　）、一度も連絡を取っていない。',
    'Choose the correct word: 彼とは卒業式で会った（　　）、'
        '一度も連絡を取っていない。',
    ['きり', 'ぎり', 'ばかり', 'っきりに'],
  ),
  _g(
    'Pilih yang tepat: 上司の許可を（　　）からでないと、決められません。',
    'Choose the correct word: 上司の許可を（　　）からでないと、決められません。',
    ['もらって', 'もらい', 'もらった', 'もらう'],
  ),
  // 文の組み立て
  _g(
    'Kata mana yang masuk di ★? この製品は ＿＿ ＿＿ ★ ＿＿ 人気がある。',
    'Which word goes in the ★ slot? この製品は ＿＿ ＿＿ ★ ＿＿ 人気がある。',
    ['幅広い', '若者', 'に限らず', '年代に'],
  ),
  _g(
    'Kata mana yang masuk di ★? 彼は ＿＿ ＿＿ ★ ＿＿ 出て行った。',
    'Which word goes in the ★ slot? 彼は ＿＿ ＿＿ ★ ＿＿ 出て行った。',
    ['なかった', 'まるで', '何事も', 'かのように'],
  ),
  _g(
    'Kata mana yang masuk di ★? 新しい ＿＿ ＿＿ ★ ＿＿ ご連絡いたします。',
    'Which word goes in the ★ slot? 新しい ＿＿ ＿＿ ★ ＿＿ ご連絡いたします。',
    ['次第', 'スケジュールが', '決まり', 'すぐに'],
  ),
  _g(
    'Kata mana yang masuk di ★? 資料を ＿＿ ＿＿ ★ ＿＿ ください。',
    'Which word goes in the ★ slot? 資料を ＿＿ ＿＿ ★ ＿＿ ください。',
    ['上で', '十分に', '検討した', 'ご判断'],
  ),
];

// ---------------------------------------------------------------------------
// N1
// ---------------------------------------------------------------------------
final List<McqQuestion> grammarN1 = [
  _g(
    'Pilih yang tepat: 経験不足（　　）、判断を誤った。',
    'Choose the correct word: 経験不足（　　）、判断を誤った。',
    ['ゆえに', 'ゆえの', 'ゆえは', 'ゆえで'],
  ),
  _g(
    'Pilih yang tepat: この味は本場（　　）のものだ。',
    'Choose the correct word: この味は本場（　　）のものだ。',
    ['ならでは', 'ならずは', 'なくては', 'ならば'],
  ),
  _g(
    'Pilih yang tepat: 本日（　　）、当店は閉店いたします。',
    'Choose the correct word: 本日（　　）、当店は閉店いたします。',
    ['をもって', 'にもって', 'がもって', 'でもって'],
  ),
  _g(
    'Pilih yang tepat: 真実を明らかにせ（　　）、彼は調査を続けた。',
    'Choose the correct word: 真実を明らかにせ（　　）、彼は調査を続けた。',
    ['んがため', 'ずがため', 'んために', 'ないがため'],
  ),
  _g(
    'Pilih yang tepat: 教師（　　）者は、常に学び続けなければならない。',
    'Choose the correct word: 教師（　　）者は、常に学び続けなければならない。',
    ['たる', 'なる', 'たり', 'たれ'],
  ),
  _g(
    'Pilih yang tepat: 早く言ってくれれば手伝えた（　　）、なぜ黙っていたのか。',
    'Choose the correct word: 早く言ってくれれば手伝えた（　　）、'
        'なぜ黙っていたのか。',
    ['ものを', 'ものの', 'ものか', 'ものだ'],
  ),
  _g(
    'Pilih yang tepat: 条件次第では、引き受け（　　）。',
    'Choose the correct word: 条件次第では、引き受け（　　）。',
    ['ないものでもない', 'ないものではある', 'ないものである', 'ないものでもある'],
  ),
  _g(
    'Pilih yang tepat: 「芝生に入る（　　）」という看板が立っている。',
    'Choose the correct word: 「芝生に入る（　　）」という看板が立っている。',
    ['べからず', 'べからざる', 'べきず', 'べくない'],
  ),
  _g(
    'Pilih yang tepat: 彼の無責任な発言は聞く（　　）。',
    'Choose the correct word: 彼の無責任な発言は聞く（　　）。',
    ['にたえない', 'にたえられない', 'にたえず', 'にたまらない'],
  ),
  _g(
    'Pilih yang tepat: 被災地の状況に、涙（　　）。',
    'Choose the correct word: 被災地の状況に、涙（　　）。',
    ['を禁じ得ない', 'を禁じない', 'が禁じ得ない', 'に禁じ得ない'],
  ),
  _g(
    'Pilih yang tepat: 親友の頼み（　　）、断るわけにはいかない。',
    'Choose the correct word: 親友の頼み（　　）、断るわけにはいかない。',
    ['とあれば', 'とあると', 'とあり', 'とあった'],
  ),
  _g(
    'Pilih yang tepat: 専門家（　　）、この問題を完全に解決するのは難しい。',
    'Choose the correct word: 専門家（　　）、'
        'この問題を完全に解決するのは難しい。',
    ['といえども', 'といえば', 'といって', 'といえる'],
  ),
  _g(
    'Pilih yang tepat: 理由が何（　　）、遅刻は遅刻だ。',
    'Choose the correct word: 理由が何（　　）、遅刻は遅刻だ。',
    ['であれ', 'であって', 'であり', 'であると'],
  ),
  _g(
    'Pilih yang tepat: 大切な花瓶を壊してしまった。謝ら（　　）。',
    'Choose the correct word: 大切な花瓶を壊してしまった。謝ら（　　）。',
    ['ずにはすまない', 'ずにはすませない', 'ずにはすんだ', 'ずにはすめない'],
  ),
  _g(
    'Pilih yang tepat: そんな簡単なことは、言う（　　）。',
    'Choose the correct word: そんな簡単なことは、言う（　　）。',
    ['までもない', 'までもある', 'までない', 'までもなる'],
  ),
  _g(
    'Pilih yang tepat: 子どもの将来を思え（　　）、あえて厳しく接している。',
    'Choose the correct word: 子どもの将来を思え（　　）、'
        'あえて厳しく接している。',
    ['ばこそ', 'ばかり', 'てこそ', 'ばこと'],
  ),
  _g(
    'Pilih yang tepat: 兄が社交的なの（　　）、弟は無口だ。',
    'Choose the correct word: 兄が社交的なの（　　）、弟は無口だ。',
    ['にひきかえ', 'にかわって', 'にかけて', 'にひかえ'],
  ),
  _g(
    'Pilih yang tepat: 一流ホテル（　　）、サービスも格段に違う。',
    'Choose the correct word: 一流ホテル（　　）、サービスも格段に違う。',
    ['ともなると', 'ともなって', 'ともあると', 'とあると'],
  ),
  _g(
    'Pilih yang tepat: 彼女は周囲の反対（　　）、留学を決めた。',
    'Choose the correct word: 彼女は周囲の反対（　　）、留学を決めた。',
    ['をものともせず', 'をものとして', 'をものにせず', 'にものともせず'],
  ),
  _g(
    'Pilih yang tepat: 彼は何でも悲観的に考える（　　）。',
    'Choose the correct word: 彼は何でも悲観的に考える（　　）。',
    ['きらいがある', 'きらいだ', 'きらいがない', 'きらいにある'],
  ),
  _g(
    'Pilih yang tepat: 事態がここ（　　）、ようやく政府は対策を発表した。',
    'Choose the correct word: 事態がここ（　　）、'
        'ようやく政府は対策を発表した。',
    ['に至って', 'を至って', 'に至らず', 'で至って'],
  ),
  _g(
    'Pilih yang tepat: 好天（　　）、会場は多くの人でにぎわった。',
    'Choose the correct word: 好天（　　）、会場は多くの人でにぎわった。',
    ['と相まって', 'に相まって', 'を相まって', 'で相まって'],
  ),
  _g(
    'Pilih yang tepat: 先日のお礼（　　）、ご挨拶に伺いました。',
    'Choose the correct word: 先日のお礼（　　）、ご挨拶に伺いました。',
    ['かたがた', 'かたわら', 'ついで', 'ながら'],
  ),
  _g(
    'Pilih yang tepat: 彼女は涙（　　）、事故の様子を語った。',
    'Choose the correct word: 彼女は涙（　　）、事故の様子を語った。',
    ['ながらに', 'ながらも', 'ながらで', 'ながらの'],
  ),
  _g(
    'Pilih yang tepat: 理由の（　　）、欠席は認められません。',
    'Choose the correct word: 理由の（　　）、欠席は認められません。',
    ['いかんによらず', 'いかんによって', 'いかんで', 'いかんに'],
  ),
  _g(
    'Pilih yang tepat: 皆様のご健康を願っ（　　）。',
    'Choose the correct word: 皆様のご健康を願っ（　　）。',
    ['てやみません', 'てたまりません', 'てなりません', 'てすみません'],
  ),
  // 文の組み立て
  _g(
    'Kata mana yang masuk di ★? 彼は ＿＿ ＿＿ ★ ＿＿ 成功を収めた。',
    'Which word goes in the ★ slot? 彼は ＿＿ ＿＿ ★ ＿＿ 成功を収めた。',
    ['ものともせず', '幾多の', '困難を', '見事な'],
  ),
  _g(
    'Kata mana yang masuk di ★? 彼の ＿＿ ＿＿ ★ ＿＿ 涙を禁じ得なかった。',
    'Which word goes in the ★ slot? 彼の ＿＿ ＿＿ ★ ＿＿ 涙を禁じ得なかった。',
    ['気持ちに', '家族を', '思う', '誰もが'],
  ),
  _g(
    'Kata mana yang masuk di ★? 一度 ＿＿ ＿＿ ★ ＿＿ 最後までやり抜くべきだ。',
    'Which word goes in the ★ slot? '
        '一度 ＿＿ ＿＿ ★ ＿＿ 最後までやり抜くべきだ。',
    ['どんなに', '引き受けた', '以上は', '困難であっても'],
  ),
  _g(
    'Kata mana yang masuk di ★? これは ＿＿ ＿＿ ★ ＿＿ 味だ。',
    'Which word goes in the ★ slot? これは ＿＿ ＿＿ ★ ＿＿ 味だ。',
    ['ならでは', '長年の', '経験', 'の'],
  ),
];
