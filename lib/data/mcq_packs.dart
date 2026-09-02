import 'exam_bank.dart';
import 'jlpt_vocab.dart';
import 'mcq_bank.dart';

/// Satu paket soal pilihan ganda bertema (mis. JLPT N5, TOEFL). Judul
/// dwibahasa; layar kuis mengacak soal & pilihan dan — untuk pengguna
/// non-premium — membatasi jumlah soal (lihat [kFreeMcqLimit]).
class McqPack {
  final String id;
  final String emoji;
  final Map<String, String> title;
  final Map<String, String> subtitle;
  final List<McqQuestion> questions;

  const McqPack({
    required this.id,
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.questions,
  });
}

/// Batas soal per sesi untuk pengguna non-premium. Premium tak dibatasi.
const int kFreeMcqLimit = 10;

/// Ubah daftar kosakata JLPT menjadi soal "kata mana yang berarti X".
/// Pilihan = kata target (kana + romaji); distraktor diambil dari kata
/// lain di level yang sama sehingga tetap menantang. Butuh ≥ 4 kata.
List<McqQuestion> vocabToMcq(List<JVocab> vocab) {
  String disp(JVocab v) => '${v.kana} (${v.romaji})';
  final out = <McqQuestion>[];
  for (var i = 0; i < vocab.length; i++) {
    final w = vocab[i];
    final options = <String>[disp(w)];
    var j = 1;
    while (options.length < 4 && j < vocab.length) {
      final cand = disp(vocab[(i + j) % vocab.length]);
      if (!options.contains(cand)) options.add(cand);
      j++;
    }
    if (options.length < 4) continue; // pengaman (level terlalu kecil)
    out.add(McqQuestion(
      question: {
        'id': "Kata mana yang berarti '${w.meaning['id']}'?",
        'en': "Which word means '${w.meaning['en']}'?",
      },
      options: options,
      answer: 0,
    ));
  }
  return out;
}

/// Paket-paket soal untuk satu kursus. Kursus tanpa paket → kosong.
List<McqPack> mcqPacksFor(String courseId) {
  switch (courseId) {
    case 'ja':
      return [
        McqPack(
          id: 'ja_general',
          emoji: '🎌',
          title: const {'id': 'Umum', 'en': 'General'},
          subtitle: const {
            'id': 'kosakata, angka, sapaan & tata bahasa dasar',
            'en': 'vocabulary, numbers, greetings & basic grammar',
          },
          questions: mcqBankFor('ja'),
        ),
        McqPack(
          id: 'ja_n5',
          emoji: '🌸',
          title: const {'id': 'JLPT N5', 'en': 'JLPT N5'},
          subtitle: const {
            'id': 'kosakata dasar tingkat N5',
            'en': 'basic N5-level vocabulary',
          },
          questions: vocabToMcq(jlptN5),
        ),
        McqPack(
          id: 'ja_n4',
          emoji: '🍁',
          title: const {'id': 'JLPT N4', 'en': 'JLPT N4'},
          subtitle: const {
            'id': 'kosakata tingkat N4',
            'en': 'N4-level vocabulary',
          },
          questions: vocabToMcq(jlptN4),
        ),
        McqPack(
          id: 'ja_n3',
          emoji: '🗻',
          title: const {'id': 'JLPT N3', 'en': 'JLPT N3'},
          subtitle: const {
            'id': 'kosakata tingkat N3',
            'en': 'N3-level vocabulary',
          },
          questions: vocabToMcq(jlptN3),
        ),
      ];
    case 'en':
      return [
        McqPack(
          id: 'en_general',
          emoji: '🔤',
          title: const {'id': 'Umum', 'en': 'General'},
          subtitle: const {
            'id': 'kosakata & tata bahasa dasar',
            'en': 'basic vocabulary & grammar',
          },
          questions: mcqBankFor('en'),
        ),
        McqPack(
          id: 'en_toefl',
          emoji: '🎓',
          title: const {'id': 'TOEFL', 'en': 'TOEFL'},
          subtitle: const {
            'id': 'kosakata akademik & tata bahasa',
            'en': 'academic vocabulary & grammar',
          },
          questions: examToefl,
        ),
        McqPack(
          id: 'en_ielts',
          emoji: '📘',
          title: const {'id': 'IELTS', 'en': 'IELTS'},
          subtitle: const {
            'id': 'kolokasi & kosakata band tinggi',
            'en': 'collocations & high-band vocabulary',
          },
          questions: examIelts,
        ),
        McqPack(
          id: 'en_pte',
          emoji: '💻',
          title: const {'id': 'PTE', 'en': 'PTE'},
          subtitle: const {
            'id': 'isian kata & ejaan',
            'en': 'word choice & spelling',
          },
          questions: examPte,
        ),
      ];
    default:
      return const [];
  }
}
