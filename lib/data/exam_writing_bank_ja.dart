// Soal tulis untuk mode Ujian Jepang. Pengguna mengetik bacaan hiragana
// dari kata berkanji (漢字読み) atau menulis kata dalam kana dari artinya.
// Bagian ini BUKAN bagian JLPT resmi; ditampilkan sebagai bagian tambahan.
// Tiap level berisi 14 soal: 10 soal bacaan kanji + 4 soal tulis kata.
import '../models/exam.dart';

/// Soal bacaan kanji: [text] kata berkanji, [answers] bacaan hiragana,
/// [hint] arti dalam bahasa Indonesia.
WritingItem _read(String text, List<String> answers, String hint) {
  return WritingItem(
    prompt: const {
      'id': 'Tulis cara bacanya dalam hiragana.',
      'en': 'Write the reading in hiragana.',
    },
    text: text,
    answers: answers,
    hint: hint,
  );
}

/// Soal tulis kata dari arti: [answers] kata kana (dan bentuk kanji bila
/// umum), [romaji] sebagai petunjuk.
WritingItem _word(
  String meaningId,
  String meaningEn,
  List<String> answers,
  String romaji,
) {
  return WritingItem(
    prompt: {
      'id': 'Tulis kata Jepang (hiragana/katakana) yang berarti: $meaningId',
      'en': 'Write the Japanese word (hiragana/katakana) meaning: $meaningEn',
    },
    text: '？',
    answers: answers,
    hint: romaji,
  );
}

final List<WritingItem> writingJaN5 = [
  _read('学校', ['がっこう'], 'sekolah'),
  _read('先生', ['せんせい'], 'guru'),
  _read('電車', ['でんしゃ'], 'kereta listrik'),
  _read('毎日', ['まいにち'], 'setiap hari'),
  _read('天気', ['てんき'], 'cuaca'),
  _read('友達', ['ともだち'], 'teman'),
  _read('時間', ['じかん'], 'waktu; jam'),
  _read('新聞', ['しんぶん'], 'koran'),
  _read('会社', ['かいしゃ'], 'perusahaan'),
  _read('来年', ['らいねん'], 'tahun depan'),
  _word('kucing', 'cat', ['ねこ', '猫'], 'neko'),
  _word('buku', 'book', ['ほん', '本'], 'hon'),
  _word('air', 'water', ['みず', '水'], 'mizu'),
  _word('sepatu', 'shoes', ['くつ', '靴'], 'kutsu'),
];

final List<WritingItem> writingJaN4 = [
  _read('世界', ['せかい'], 'dunia'),
  _read('経験', ['けいけん'], 'pengalaman'),
  _read('説明', ['せつめい'], 'penjelasan'),
  _read('準備', ['じゅんび'], 'persiapan'),
  _read('運転', ['うんてん'], 'mengemudi'),
  _read('生活', ['せいかつ'], 'kehidupan'),
  _read('案内', ['あんない'], 'pemanduan; petunjuk'),
  _read('都合', ['つごう'], 'keadaan; kecocokan waktu'),
  _read('安全', ['あんぜん'], 'aman; keselamatan'),
  _read('教育', ['きょういく'], 'pendidikan'),
  _word('janji', 'promise', ['やくそく', '約束'], 'yakusoku'),
  _word('kamus', 'dictionary', ['じしょ', '辞書'], 'jisho'),
  _word('hadiah', 'present (gift)', ['プレゼント'], 'purezento'),
  _word('alasan', 'reason', ['りゆう', '理由'], 'riyuu'),
];

final List<WritingItem> writingJaN3 = [
  _read('想像', ['そうぞう'], 'imajinasi'),
  _read('環境', ['かんきょう'], 'lingkungan'),
  _read('状況', ['じょうきょう'], 'situasi'),
  _read('解決', ['かいけつ'], 'penyelesaian'),
  _read('努力', ['どりょく'], 'usaha keras'),
  _read('表現', ['ひょうげん'], 'ekspresi; ungkapan'),
  _read('判断', ['はんだん'], 'penilaian; keputusan'),
  _read('増加', ['ぞうか'], 'peningkatan'),
  _read('確認', ['かくにん'], 'konfirmasi'),
  _read('迷惑', ['めいわく'], 'gangguan; merepotkan'),
  _word('ekonomi', 'economy', ['けいざい', '経済'], 'keizai'),
  _word('kesan', 'impression', ['いんしょう', '印象'], 'inshou'),
  _word('informasi', 'information', ['じょうほう', '情報'], 'jouhou'),
  _word('budaya', 'culture', ['ぶんか', '文化'], 'bunka'),
];

final List<WritingItem> writingJaN2 = [
  _read('把握', ['はあく'], 'memahami; menguasai'),
  _read('影響', ['えいきょう'], 'pengaruh'),
  _read('検討', ['けんとう'], 'pertimbangan; kajian'),
  _read('削減', ['さくげん'], 'pengurangan'),
  _read('妥当', ['だとう'], 'wajar; layak'),
  _read('促す', ['うながす'], 'mendorong; mendesak'),
  _read('著しい', ['いちじるしい'], 'mencolok; nyata'),
  _read('曖昧', ['あいまい'], 'ambigu'),
  _read('矛盾', ['むじゅん'], 'kontradiksi'),
  _read('普及', ['ふきゅう'], 'penyebaran luas'),
  _word('kecenderungan', 'tendency', ['けいこう', '傾向'], 'keikou'),
  _word('hati-hati; cermat', 'cautious', ['しんちょう', '慎重'], 'shinchou'),
  _word('kontribusi', 'contribution', ['こうけん', '貢献'], 'kouken'),
  _word('permintaan (ekonomi)', 'demand', ['じゅよう', '需要'], 'juyou'),
];

final List<WritingItem> writingJaN1 = [
  _read('顕著', ['けんちょ'], 'mencolok; menonjol'),
  _read('是正', ['ぜせい'], 'koreksi; perbaikan'),
  _read('潔い', ['いさぎよい'], 'sportif; tanpa ragu'),
  _read('貫く', ['つらぬく'], 'menembus; berpegang teguh'),
  _read('妥協', ['だきょう'], 'kompromi'),
  _read('逸脱', ['いつだつ'], 'penyimpangan'),
  _read('培う', ['つちかう'], 'memupuk; menumbuhkan'),
  _read('慈しむ', ['いつくしむ'], 'menyayangi'),
  _read('憤り', ['いきどおり'], 'kemarahan; kegeraman'),
  _read('悠々', ['ゆうゆう'], 'santai; tenang'),
  _word('ancaman', 'threat', ['きょうい', '脅威'], 'kyoui'),
  _word('suap', 'bribe', ['わいろ', '賄賂'], 'wairo'),
  _word('cepat; sigap', 'swift', ['じんそく', '迅速'], 'jinsoku'),
  _word('keseimbangan', 'equilibrium', ['きんこう', '均衡'], 'kinkou'),
];
