/// Bank tambahan Reading bahasa Inggris untuk ujian TOEFL iBT 2026,
/// IELTS Academic, dan PTE Academic:
///
/// * [readingEnAcademicMore] — bacaan akademik 220–320 kata, 5 soal
///   (termasuk soal True/False/Not Given gaya IELTS).
/// * [toeflDailyLife] — teks pendek sehari-hari (TOEFL 2026 "Read in
///   Daily Life"): email, pengumuman, menu, jadwal, iklan, unggahan.
/// * [toeflCompleteWords] — TOEFL 2026 "Complete the Words": separuh
///   akhir satu kata dihapus, pengguna melengkapinya.
/// * [pteReadingFillBlanks] — PTE "Reading: Fill in the Blanks".
/// * [pteReorder] — PTE "Reorder Paragraphs" (urutan [OrderItem.pieces]
///   = urutan benar).
///
/// Pilihan PERTAMA pada setiap soal pilihan ganda selalu jawaban benar
/// (`answer: 0`) — layar ujian yang mengacaknya. Soal True/False/Not
/// Given memakai tiga pilihan.
library;

import '../models/exam.dart';
import 'mcq_bank.dart';

McqQuestion _q(String id, String en, List<String> options) =>
    McqQuestion(question: {'id': id, 'en': en}, options: options, answer: 0);

const List<String> _tfngOptions = ['True', 'False', 'Not Given'];

/// Soal IELTS True/False/Not Given; [answer] diletakkan di depan.
McqQuestion _tf(String statement, String answer) {
  assert(_tfngOptions.contains(answer));
  return McqQuestion(
    question: {
      'id':
          'Apakah pernyataan ini sesuai dengan bacaan? Pilih True (benar), '
          'False (salah), atau Not Given (tidak disebutkan): "$statement"',
      'en':
          'Does the statement agree with the information in the passage? '
          'Choose True, False, or Not Given: "$statement"',
    },
    options: [
      answer,
      for (final o in _tfngOptions)
        if (o != answer) o,
    ],
    answer: 0,
  );
}

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

const String _mainId = 'Apa gagasan utama bacaan ini?';
const String _mainEn = 'What is the passage mainly about?';

// ---------------------------------------------------------------------------
// 1. Bacaan akademik
// ---------------------------------------------------------------------------

final List<ReadingPassage> readingEnAcademicMore = [
  _p(
    'en_rm_1',
    'Tardigrada: Hewan Paling Tangguh',
    'Tardigrades: Nature\'s Survivors',
    "Tardigrades, often called water bears, are microscopic animals rarely longer than one millimetre. They live in an astonishing range of habitats, from deep-sea sediments to the damp moss on city walls, and more than 1,300 species have been described. What has made them famous, however, is not their distribution but their extraordinary capacity to survive conditions that would kill almost any other animal.\n\n"
        "When their surroundings dry out, many tardigrades enter a state called cryptobiosis. The animal pulls in its head and legs, loses nearly all of its body water, and curls into a compact form known as a tun. In this condition its metabolism falls to less than 0.01 percent of normal levels, making it almost undetectable. A tun can remain dormant for years and then revive within hours once water returns.\n\n"
        "Researchers have long tried to explain how tardigrade cells avoid destruction during drying. Part of the answer appears to lie in special proteins that form a glass-like matrix inside the cells, holding delicate molecules in place until rehydration. Some species also produce a protein that appears to shield their DNA from damage caused by radiation.\n\n"
        "These abilities have been tested in remarkable ways. In 2007, dried tardigrades were carried into low Earth orbit and exposed to the vacuum of space; a number of them survived and later produced offspring. Such findings have attracted the interest of medical scientists, who hope that understanding tardigrade proteins might one day help preserve vaccines or other biological materials without refrigeration.",
    [
      _q(_mainId, _mainEn, [
        'The survival abilities of tardigrades and why scientists study them',
        'The classification of microscopic animals into species',
        'The dangers of space travel for living organisms',
        'Why tardigrades are found mainly in deep-sea sediments',
      ]),
      _q(
        'Kata "compact" pada paragraf 2 paling dekat maknanya dengan ...',
        'The word "compact" in paragraph 2 is closest in meaning to ...',
        ['small and tightly packed', 'fragile', 'transparent', 'expanded'],
      ),
      _q(
        'Menurut bacaan, apa yang terjadi saat tardigrada memasuki kriptobiosis?',
        'According to the passage, what happens when a tardigrade enters cryptobiosis?',
        [
          'It loses almost all of its body water',
          'It grows a hard outer shell',
          'Its metabolism speeds up sharply',
          'It moves into deeper water',
        ],
      ),
      _q(
        'Semua pernyataan berikut benar tentang tardigrada, KECUALI ...',
        'All of the following are true of tardigrades EXCEPT ...',
        [
          'They are usually larger than one millimetre',
          'More than 1,300 species have been described',
          'They can revive within hours after water returns',
          'Some have survived exposure to space',
        ],
      ),
      _q(
        'Mengapa penulis menyebut vaksin pada paragraf terakhir?',
        'Why does the author mention vaccines in the final paragraph?',
        [
          'To show a possible practical use of tardigrade research',
          'To explain how tardigrades resist disease',
          'To argue that refrigeration is no longer necessary',
          'To criticise the cost of space experiments',
        ],
      ),
    ],
  ),
  _p(
    'en_rm_2',
    'Mesin Cetak di Eropa',
    'The Printing Press in Europe',
    "Around 1450, the goldsmith Johannes Gutenberg developed a printing system in Mainz, Germany, that combined several existing technologies in a new way. Its central feature was movable metal type: individual letters cast from an alloy of lead, tin, and antimony that could be arranged into pages, inked, pressed onto paper, and then reused. Gutenberg also adapted the screw press, long used for making wine and olive oil, and developed an oil-based ink that adhered well to metal.\n\n"
        "Printing itself was not new. Woodblock printing had been practised in China for centuries, and movable type made of ceramic and later metal had been used in China and Korea well before Gutenberg's time. What distinguished the European system was its suitability for alphabetic scripts, which require only a few dozen characters, and its integration into a commercial market eager for books.\n\n"
        "The results were dramatic. By 1500, printing presses were operating in more than two hundred European towns, and historians estimate that millions of copies had already been produced. Books became cheaper, and texts could be reproduced identically, reducing the errors that crept into hand-copied manuscripts. This standardisation helped scholars compare data and build on one another's work, a development many historians link to the Scientific Revolution.\n\n"
        "Printing also had political and religious consequences. When Martin Luther published his criticisms of the Church in 1517, printed pamphlets spread his ideas across Germany within weeks. Authorities soon realised that the press could be used both to spread and to challenge their power, and systems of licensing and censorship followed.",
    [
      _q(_mainId, _mainEn, [
        'The development of European printing and its effects on society',
        'The life and career of Johannes Gutenberg',
        'Why Chinese printing methods were superior',
        'The history of censorship in Europe',
      ]),
      _q(
        'Menurut bacaan, apa yang membedakan sistem cetak Eropa?',
        'According to the passage, what distinguished the European printing system?',
        [
          'It suited alphabets with relatively few characters',
          'It was the first to use movable type',
          'It used ceramic rather than metal type',
          'It was controlled entirely by the Church',
        ],
      ),
      _q(
        'Kata "adhered" pada paragraf 1 paling dekat maknanya dengan ...',
        'The word "adhered" in paragraph 1 is closest in meaning to ...',
        ['stuck', 'dissolved', 'reacted', 'dried'],
      ),
      _q(
        'Apa yang dapat disimpulkan tentang naskah tulisan tangan sebelum era cetak?',
        'What can be inferred about manuscripts before printing?',
        [
          'Different copies of the same text often contained differences',
          'They were cheaper to produce than printed books',
          'Scholars preferred them for comparing data',
          'They were produced mainly in China and Korea',
        ],
      ),
      _q(
        'Mengapa penulis menyebut Martin Luther?',
        'Why does the author mention Martin Luther?',
        [
          'To illustrate how quickly printing could spread ideas',
          'To show that the Church supported printing',
          'To explain the origin of censorship laws in China',
          'To give an example of an early printer',
        ],
      ),
    ],
  ),
  _p(
    'en_rm_3',
    'Dari Pergeseran Benua ke Tektonik Lempeng',
    'From Continental Drift to Plate Tectonics',
    "In 1912, the German meteorologist Alfred Wegener proposed that the continents had once been joined in a single landmass, which he later called Pangaea, and had slowly drifted apart. He pointed to several lines of evidence. The coastlines of South America and Africa fit together remarkably well, fossils of the same reptiles appear on continents now separated by oceans, and rock formations in Brazil closely match those in West Africa. He also noted traces of ancient glaciers in regions that are now tropical.\n\n"
        "Despite this evidence, most geologists rejected the idea. Their main objection was that Wegener could not explain what force could move entire continents. His suggestion that continents ploughed through the ocean floor, driven by the Earth's rotation and tidal forces, was shown to be physically impossible. Wegener died in 1930 during an expedition in Greenland, with his theory still widely dismissed.\n\n"
        "The situation changed after the Second World War, when new technology allowed scientists to map the ocean floor in detail. They discovered long underwater mountain ranges called mid-ocean ridges, and found that rocks on either side of them recorded reversals of the Earth's magnetic field in symmetrical stripes. The best explanation was that new crust forms at the ridges and spreads outward, a process known as seafloor spreading.\n\n"
        "By the late 1960s, these findings had been combined into the theory of plate tectonics. According to this theory, the Earth's outer shell is divided into rigid plates that move a few centimetres per year, carried by slow movements in the mantle below. Wegener's central insight had been correct, even though his proposed mechanism was not.",
    [
      _q(_mainId, _mainEn, [
        'How the idea of moving continents was rejected and later accepted in a revised form',
        'The life of Alfred Wegener in Greenland',
        'Why fossils of reptiles are found on several continents',
        'How magnetic fields are measured on the ocean floor',
      ]),
      _tf('Wegener was trained mainly as a geologist.', 'False'),
      _tf(
        'Wegener\'s ideas were published in several languages during his lifetime.',
        'Not Given',
      ),
      _tf(
        'Seafloor spreading was identified with the help of post-war technology.',
        'True',
      ),
      _q(
        'Menurut bacaan, mengapa sebagian besar ahli geologi menolak gagasan Wegener?',
        'According to the passage, why did most geologists reject Wegener\'s idea?',
        [
          'He could not explain what force moved the continents',
          'The coastlines of the continents did not match',
          'No fossils supported his theory',
          'He had never visited the regions he described',
        ],
      ),
    ],
  ),
  _p(
    'en_rm_4',
    'Mencari Planet di Luar Tata Surya',
    'Finding Planets Beyond the Solar System',
    "For most of history, the existence of planets beyond our solar system was a matter of speculation. The first confirmed detection of a planet orbiting a Sun-like star came only in 1995, when the Swiss astronomers Michel Mayor and Didier Queloz identified a giant planet around the star 51 Pegasi. Since then, more than five thousand exoplanets have been confirmed, and most of them have been found by indirect methods rather than by direct observation.\n\n"
        "One of the most productive techniques is the transit method. When a planet passes in front of its star, as seen from Earth, it blocks a tiny fraction of the star's light. A sensitive telescope can record this regular dimming. The depth of the dip reveals the planet's size relative to its star, while the time between transits gives the length of its orbit. NASA's Kepler space telescope, launched in 2009, used this method to monitor about 150,000 stars at once and discovered thousands of planets.\n\n"
        "The transit method has limitations. It works only when a planet's orbit is aligned almost edge-on to our line of sight, so most planetary systems cannot be detected this way. Other events, such as a pair of stars eclipsing each other, can also produce similar dips, so candidates must be confirmed with additional observations.\n\n"
        "Nevertheless, transits offer a unique advantage. When starlight passes through a planet's atmosphere during a transit, certain wavelengths are absorbed by gases such as water vapour or carbon dioxide. By analysing this light, astronomers can begin to determine what distant atmospheres are made of, an important step in the search for worlds that might support life.",
    [
      _q(_mainId, _mainEn, [
        'How the transit method is used to detect and study exoplanets',
        'The history of NASA\'s space telescopes',
        'Why life is unlikely to exist on other planets',
        'The discovery of the star 51 Pegasi',
      ]),
      _q(
        'Menurut bacaan, apa yang ditunjukkan oleh selang waktu antartransit?',
        'According to the passage, what does the time between transits reveal?',
        [
          'The length of the planet\'s orbit',
          'The size of the planet',
          'The temperature of the star',
          'The gases in the planet\'s atmosphere',
        ],
      ),
      _q(
        'Kata "productive" pada paragraf 2 paling dekat maknanya dengan ...',
        'The word "productive" in paragraph 2 is closest in meaning to ...',
        ['yielding many results', 'expensive', 'traditional', 'complicated'],
      ),
      _q(
        'Semua hal berikut disebut sebagai keterbatasan metode transit, KECUALI ...',
        'All of the following are mentioned as limitations of the transit method EXCEPT ...',
        [
          'Telescopes cannot detect very small changes in brightness',
          'It requires an orbit that is nearly edge-on to Earth',
          'Pairs of eclipsing stars can produce similar dips',
          'Possible planets must be confirmed by other observations',
        ],
      ),
      _q(
        'Apa yang dapat disimpulkan dari paragraf 3?',
        'What can be inferred from paragraph 3?',
        [
          'Many planets around other stars probably remain undetected',
          'Most exoplanets orbit pairs of stars',
          'The transit method is no longer used by astronomers',
          'Edge-on orbits are the most common type of orbit',
        ],
      ),
    ],
  ),
  _p(
    'en_rm_5',
    'Efek Jeda dalam Belajar',
    'The Spacing Effect',
    "In the 1880s, the German psychologist Hermann Ebbinghaus conducted a series of memory experiments on a single, rather unusual subject: himself. He memorised lists of meaningless syllables such as 'DAX' and 'ZOF' and measured how much he could recall after different intervals. His results produced the famous forgetting curve, which shows that memory declines rapidly in the first hours after learning and then more slowly.\n\n"
        "Ebbinghaus also noticed something that has since become one of the most reliable findings in psychology. Material was retained far better when study sessions were spread out over time than when the same amount of practice was concentrated into a single session. This phenomenon is now called the spacing effect, and it has been replicated in hundreds of studies with learners of all ages, from young children to older adults, and with material ranging from vocabulary to surgical skills.\n\n"
        "Why spacing works is still debated. One explanation is that when information is partly forgotten, retrieving it again requires more effort, and this effort strengthens the memory. Another suggests that studying at different times links the material to a greater variety of contexts, providing more cues for later recall.\n\n"
        "Despite the strength of the evidence, many students continue to rely on cramming the night before an exam. Part of the reason is that massed practice feels effective: information seems familiar after repeated reading, creating an illusion of mastery. Spaced practice, in contrast, often feels harder in the moment. Educational researchers therefore argue that learners need not only better schedules but also a better understanding of how their own memory works.",
    [
      _q(_mainId, _mainEn, [
        'The discovery of the spacing effect and why learners often ignore it',
        'The life and career of Hermann Ebbinghaus',
        'Why surgical skills are difficult to learn',
        'How to design meaningless syllables for experiments',
      ]),
      _tf('Ebbinghaus used meaningless syllables in his experiments.', 'True'),
      _tf(
        'Ebbinghaus tested the memory of a large group of university students.',
        'False',
      ),
      _tf(
        'The spacing effect is stronger for vocabulary than for practical skills.',
        'Not Given',
      ),
      _q(
        'Apa tujuan penulis pada paragraf terakhir?',
        'What is the author\'s purpose in the final paragraph?',
        [
          'To explain why an effective technique is often not used',
          'To recommend cramming before examinations',
          'To describe a new theory of forgetting',
          'To criticise the work of Ebbinghaus',
        ],
      ),
    ],
  ),
  _p(
    'en_rm_6',
    'Tragedi Milik Bersama',
    'Rethinking the Tragedy of the Commons',
    "In 1968, the ecologist Garrett Hardin published an influential essay titled 'The Tragedy of the Commons'. He asked readers to imagine a pasture open to all herders. Each herder gains the full benefit of adding another animal to the pasture, while the cost of overgrazing is shared by everyone. Acting rationally, each herder keeps adding animals until the pasture is destroyed. Hardin concluded that shared resources would inevitably be overused unless they were either privatised or controlled by government.\n\n"
        "For decades, this argument shaped policy on fisheries, forests, and water. However, the political economist Elinor Ostrom challenged its central assumption. Studying communities around the world, from Swiss alpine meadows to irrigation systems in Nepal and fisheries in Turkey, she found many cases in which users had managed common resources sustainably for generations without either privatisation or state control.\n\n"
        "Ostrom identified several conditions shared by successful arrangements. The boundaries of the resource and the group entitled to use it were clearly defined. Users helped make the rules and could monitor one another's behaviour. Penalties for breaking rules were graduated, starting small and increasing for repeated offences, and there were low-cost ways to resolve conflicts.\n\n"
        "Ostrom's work did not prove that commons are never destroyed; overuse remains a real danger, particularly when outsiders can exploit a resource without facing local rules. What she demonstrated was that the outcome is not inevitable. In 2009 she became the first woman to receive the Nobel Memorial Prize in Economic Sciences, an award that recognised the importance of studying how real communities govern themselves.",
    [
      _q(_mainId, _mainEn, [
        'How Ostrom\'s research qualified Hardin\'s view of shared resources',
        'Why privatisation is the best way to protect fisheries',
        'The history of farming in Swiss alpine meadows',
        'How the Nobel Prize in Economics is awarded',
      ]),
      _q(
        'Menurut bacaan, solusi apa yang diajukan Hardin?',
        'According to the passage, what solutions did Hardin propose?',
        [
          'Privatisation or government control',
          'Community rules and mutual monitoring',
          'Graduated penalties for repeated offences',
          'Removing all animals from shared pastures',
        ],
      ),
      _q(
        'Kata "graduated" pada paragraf 3 paling dekat maknanya dengan ...',
        'The word "graduated" in paragraph 3 is closest in meaning to ...',
        [
          'increasing step by step',
          'officially approved',
          'decided by experts',
          'applied equally to all',
        ],
      ),
      _q(
        'Manakah yang TIDAK disebut sebagai syarat pengelolaan yang berhasil?',
        'Which of the following is NOT mentioned as a condition of successful arrangements?',
        [
          'Users were paid by the state to protect the resource',
          'The boundaries of the resource were clearly defined',
          'Users helped to make the rules',
          'Conflicts could be resolved cheaply',
        ],
      ),
      _q(
        'Ostrom kemungkinan besar setuju dengan pernyataan mana?',
        'Ostrom would most likely agree with which statement?',
        [
          'Local rules work less well when outsiders can use the resource freely',
          'Shared resources are always destroyed eventually',
          'Governments should control all forests and fisheries',
          'Herders never act rationally',
        ],
      ),
    ],
  ),
  _p(
    'en_rm_7',
    'Lahirnya Impresionisme',
    'The Birth of Impressionism',
    "In April 1874, a group of artists who had grown tired of rejection by the official Paris Salon organised their own exhibition in the former studio of the photographer Nadar. Among the participants were Claude Monet, Pierre-Auguste Renoir, Edgar Degas, Camille Pissarro, and Berthe Morisot. A critic, Louis Leroy, mocked one of Monet's paintings, Impression, Sunrise, and called the whole group 'Impressionists'. The label, intended as an insult, was soon adopted by the artists themselves.\n\n"
        "The Salon favoured carefully finished paintings of historical, religious, or mythological subjects, with smooth surfaces that concealed the artist's brushwork. The Impressionists rejected these conventions. They painted ordinary modern life, such as cafes, railway stations, and boating parties, and often worked outdoors to capture the changing effects of light and weather. Their brushstrokes were quick and visible, and they placed colours side by side rather than blending them, allowing the viewer's eye to combine them.\n\n"
        "Technical developments supported this approach. Paint sold in portable metal tubes, introduced in the 1840s, made it far easier to work outside the studio. The expanding railway network allowed Parisian painters to reach the countryside and the coast within hours.\n\n"
        "Critics initially found the works unfinished and even careless. Yet within two decades attitudes had shifted, and collectors, particularly in the United States, were buying Impressionist paintings in large numbers. Today the movement is regarded as a turning point in Western art, opening the way for later artists who would move even further away from realistic representation.",
    [
      _q(_mainId, _mainEn, [
        'The origins, methods, and reception of Impressionism',
        'The rules of the official Paris Salon',
        'The life of the critic Louis Leroy',
        'How paint tubes were invented',
      ]),
      _q(
        'Menurut bacaan, lukisan seperti apa yang disukai Salon?',
        'According to the passage, what kind of painting did the Salon favour?',
        [
          'Smoothly finished paintings of historical or mythological subjects',
          'Quick outdoor sketches of modern life',
          'Paintings with clearly visible brushstrokes',
          'Landscapes painted near railway lines',
        ],
      ),
      _q(
        'Kata "conventions" pada paragraf 2 paling dekat maknanya dengan ...',
        'The word "conventions" in paragraph 2 is closest in meaning to ...',
        [
          'accepted practices',
          'large meetings',
          'legal agreements',
          'new inventions',
        ],
      ),
      _q(
        'Mengapa penulis menyebut tabung cat dan jaringan kereta api?',
        'Why does the author mention paint tubes and the railway network?',
        [
          'To explain how new technology made the artists\' methods practical',
          'To show that Impressionists were interested in engineering',
          'To argue that the Salon opposed new technology',
          'To describe the subjects of Monet\'s paintings',
        ],
      ),
      _q(
        'Subjek mana yang TIDAK disebut sebagai ciri lukisan Impresionis?',
        'Which subject is NOT mentioned as typical of Impressionist painting?',
        ['Royal portraits', 'Cafes', 'Railway stations', 'Boating parties'],
      ),
    ],
  ),
  _p(
    'en_rm_8',
    'Pidgin dan Kreol',
    'Pidgins and Creoles',
    "When people who share no common language must communicate regularly, they often develop a simplified contact language known as a pidgin. Pidgins typically arose in settings of trade, colonisation, or plantation labour, where speakers of several languages were brought together. A pidgin has a limited vocabulary, drawn largely from one dominant language, and a reduced grammar. Crucially, it is nobody's first language; it is used only for specific purposes such as bargaining or giving instructions.\n\n"
        "Something remarkable can happen when children grow up in a community where a pidgin is widely used. Acquiring it as their native language, they expand and regularise it, adding consistent ways of marking tense, forming complex sentences, and expressing abstract ideas. The result is a creole: a fully developed language capable of everything any other human language can do. Haitian Creole, which draws much of its vocabulary from French, and Tok Pisin, an official language of Papua New Guinea with a largely English-based vocabulary, are well-known examples.\n\n"
        "Creoles have attracted considerable attention from linguists because they seem to show language being created over a short period. Some researchers have noticed that creoles from different parts of the world share certain grammatical features, even when they developed from unrelated languages. This has led to the controversial suggestion that the similarities reflect innate tendencies of the human mind.\n\n"
        "For a long time, creoles were dismissed as broken versions of European languages. Modern linguistics rejects this view. Although creoles may share vocabulary with a colonial language, their grammar is systematic and often quite different, and millions of people use them in daily life, literature, and education.",
    [
      _q(_mainId, _mainEn, [
        'How pidgins develop into creoles and why linguists study them',
        'The history of the French language in Haiti',
        'Why European languages have simple grammar',
        'How to learn Tok Pisin as a second language',
      ]),
      _tf(
        'A pidgin is usually learned as a first language by its speakers.',
        'False',
      ),
      _tf('Tok Pisin has more speakers than Haitian Creole.', 'Not Given'),
      _tf(
        'Some creoles share grammatical features even though they developed from unrelated languages.',
        'True',
      ),
      _q(
        'Kata "regularise" pada paragraf 2 paling dekat maknanya dengan ...',
        'The word "regularise" in paragraph 2 is closest in meaning to ...',
        [
          'make more consistent',
          'make shorter',
          'use more often',
          'make official',
        ],
      ),
    ],
  ),
  _p(
    'en_rm_9',
    'Hutan Mangrove',
    'Mangrove Forests',
    "Mangroves are trees and shrubs that grow in the intertidal zones of tropical and subtropical coastlines, where they are flooded by seawater twice a day. Few plants can tolerate such conditions. Mangroves cope with salt in several ways: some species block most salt from entering their roots, while others absorb it and then excrete it through special glands on their leaves. Many also produce aerial roots that rise above the mud, allowing them to take in oxygen from the air in waterlogged soils.\n\n"
        "Indonesia has the largest area of mangrove forest of any country, accounting for around a fifth of the world's total. These forests provide services that are easily overlooked. Their dense roots slow incoming waves and trap sediment, protecting coastlines from erosion and reducing damage from storm surges. They also serve as nurseries for many species of fish, crabs, and shrimp, which shelter among the roots when young before moving to open water, supporting local fisheries.\n\n"
        "Mangroves are also remarkably effective at storing carbon. Because their waterlogged soils contain little oxygen, dead plant material decomposes very slowly and accumulates over centuries. Per hectare, mangrove ecosystems can store several times more carbon than many tropical forests on land, most of it in the soil rather than in the trees.\n\n"
        "Despite these benefits, large areas of mangrove have been cleared over recent decades, mainly for aquaculture ponds, agriculture, and coastal development. When mangroves are removed, their stored carbon can be released into the atmosphere. Restoration projects are now under way in many countries, but scientists warn that replanting succeeds only when the original tidal conditions are restored as well.",
    [
      _tf(
        'Indonesia has a larger area of mangrove forest than any other country.',
        'True',
      ),
      _tf(
        'Most of the carbon in mangrove ecosystems is stored in the trees themselves.',
        'False',
      ),
      _tf(
        'Restoring mangroves is cheaper than building concrete sea walls.',
        'Not Given',
      ),
      _q(
        'Menurut bacaan, bagaimana mangrove mendukung perikanan setempat?',
        'According to the passage, how do mangroves support local fisheries?',
        [
          'They shelter young fish and shellfish',
          'They supply food pellets for aquaculture ponds',
          'They keep seawater free of salt',
          'They prevent fish from reaching open water',
        ],
      ),
      _q(
        'Kata "overlooked" pada paragraf 2 paling dekat maknanya dengan ...',
        'The word "overlooked" in paragraph 2 is closest in meaning to ...',
        [
          'not noticed',
          'watched closely',
          'greatly exaggerated',
          'officially protected',
        ],
      ),
    ],
  ),
  _p(
    'en_rm_10',
    'Baterai Litium-Ion',
    'The Lithium-Ion Battery',
    "Few technologies have shaped modern life as quietly as the lithium-ion battery. It powers mobile phones, laptops, and, increasingly, electric vehicles and grid-scale energy storage. Its success rests on a simple principle. During charging, lithium ions move from the positive electrode, or cathode, through a liquid electrolyte to the negative electrode, or anode, where they are stored between layers of graphite. During use, the ions travel back, while electrons flow through the external circuit and power the device.\n\n"
        "Lithium is well suited to this role because it is the lightest metal and gives up electrons readily, allowing a great deal of energy to be stored in a small, light package. Early attempts to use pure lithium metal, however, proved dangerous, as the metal could form needle-like growths that caused short circuits and fires. The breakthrough came when researchers found ways to hold lithium within other materials. John Goodenough's cobalt oxide cathode and Akira Yoshino's carbon-based anode led to the first commercial batteries, sold by Sony in 1991. In 2019, Goodenough, Yoshino, and Stanley Whittingham shared the Nobel Prize in Chemistry for this work.\n\n"
        "Since 2010, the cost of lithium-ion batteries has fallen by around 90 percent, making electric cars increasingly competitive with petrol vehicles. Yet challenges remain. Mining lithium, cobalt, and nickel can harm local environments and communities, and only a small share of used batteries is currently recycled. Researchers are therefore developing alternatives, including sodium-ion batteries, which use a far more abundant element, and solid-state designs that replace the flammable liquid electrolyte.",
    [
      _q(_mainId, _mainEn, [
        'How lithium-ion batteries work, how they developed, and their challenges',
        'Why electric cars are more expensive than petrol vehicles',
        'The life of John Goodenough',
        'How sodium is mined and processed',
      ]),
      _q(
        'Menurut bacaan, di mana ion litium disimpan saat pengisian daya?',
        'According to the passage, where are lithium ions stored during charging?',
        [
          'Between layers of graphite in the anode',
          'Inside the cobalt oxide cathode',
          'In the external circuit',
          'In a separate container of pure lithium metal',
        ],
      ),
      _q(
        'Kata "readily" pada paragraf 2 paling dekat maknanya dengan ...',
        'The word "readily" in paragraph 2 is closest in meaning to ...',
        ['easily', 'slowly', 'rarely', 'dangerously'],
      ),
      _q(
        'Manakah yang TIDAK disebut sebagai tantangan baterai litium-ion?',
        'Which of the following is NOT mentioned as a challenge for lithium-ion batteries?',
        [
          'They lose most of their charge within a few days',
          'Mining their materials can harm local environments',
          'Few used batteries are recycled',
          'Their liquid electrolyte is flammable',
        ],
      ),
      _q(
        'Apa yang dapat disimpulkan tentang baterai natrium-ion?',
        'What can be inferred about sodium-ion batteries?',
        [
          'They may reduce dependence on scarce materials',
          'They were invented before lithium-ion batteries',
          'They are already used in most mobile phones',
          'They contain more cobalt than lithium-ion batteries',
        ],
      ),
    ],
  ),
  _p(
    'en_rm_11',
    'Pemutihan Karang',
    'Coral Bleaching',
    "Coral reefs cover less than one percent of the ocean floor, yet they support roughly a quarter of all known marine species. The reefs are built by tiny animals called coral polyps, which secrete skeletons of calcium carbonate. Most reef-building corals depend on a partnership with microscopic algae that live inside their tissues. The algae carry out photosynthesis and pass up to 90 percent of the resulting sugars to the coral; in return, they receive shelter and nutrients. The algae also give corals much of their colour.\n\n"
        "This partnership is sensitive to temperature. When water becomes just one or two degrees Celsius warmer than the usual summer maximum for several weeks, the algae begin producing harmful compounds, and the coral expels them. Without its algae, the coral's white skeleton becomes visible through its transparent tissue, the phenomenon known as bleaching. Bleached corals are not dead, but they are starving. If temperatures fall quickly enough, the algae can return; if not, the coral may die.\n\n"
        "Mass bleaching events, affecting reefs across entire regions, were virtually unknown before the 1980s. Since then they have become increasingly frequent as ocean temperatures rise. Australia's Great Barrier Reef experienced severe bleaching in 2016 and 2017, and further events followed in later years.\n\n"
        "Scientists are exploring ways to help reefs survive, from breeding heat-tolerant corals to shading reefs during heatwaves. Most researchers stress, however, that such measures can only buy time. The long-term survival of reefs depends on limiting the warming of the oceans.",
    [
      _q(_mainId, _mainEn, [
        'Why corals bleach and what this means for the future of reefs',
        'How coral polyps build calcium carbonate skeletons',
        'The tourist industry of the Great Barrier Reef',
        'The different colours of tropical algae',
      ]),
      _q(
        'Menurut bacaan, apa yang diberikan alga kepada karang?',
        'According to the passage, what do the algae provide to the coral?',
        [
          'Most of the sugars they produce',
          'Protection from predators',
          'Calcium carbonate for skeletons',
          'Cooler water during heatwaves',
        ],
      ),
      _q(
        'Kata "expels" pada paragraf 2 paling dekat maknanya dengan ...',
        'The word "expels" in paragraph 2 is closest in meaning to ...',
        ['forces out', 'feeds', 'protects', 'absorbs'],
      ),
      _q(
        'Mengapa penulis menyebut Great Barrier Reef?',
        'Why does the author mention the Great Barrier Reef?',
        [
          'To give an example of recent mass bleaching',
          'To show that some reefs are immune to bleaching',
          'To compare Australian and Indonesian reefs',
          'To explain where coral polyps first evolved',
        ],
      ),
      _q(
        'Manakah yang TIDAK disebut sebagai cara membantu terumbu karang?',
        'Which of the following is NOT mentioned as a way to help reefs?',
        [
          'Removing predatory fish from reefs',
          'Breeding heat-tolerant corals',
          'Shading reefs during heatwaves',
          'Limiting the warming of the oceans',
        ],
      ),
    ],
  ),
  _p(
    'en_rm_12',
    'Jalur Sutra',
    'The Silk Road',
    "The term 'Silk Road' was coined in 1877 by the German geographer Ferdinand von Richthofen, but the network it describes is far older. From around the second century BCE, when China's Han dynasty began to expand its contacts westward, a web of overland routes linked China with Central Asia, Persia, India, and the Mediterranean world. Few merchants ever travelled the whole distance. Instead, goods passed from trader to trader through a series of oasis cities such as Samarkand and Kashgar, rising in price at each stage.\n\n"
        "Silk was the most famous export from China, prized in Rome so highly that some Roman writers complained about the wealth flowing east to pay for it. But the routes carried far more than silk. Horses, glassware, spices, paper, and precious metals moved in different directions, and the network also carried ideas. Buddhism spread from India into Central Asia and China along these routes, and technologies such as papermaking gradually travelled west.\n\n"
        "Not everything exchanged was beneficial. Historians widely believe that the Black Death, the plague pandemic that devastated Europe in the fourteenth century, spread along trade routes connecting Central Asia with the Black Sea.\n\n"
        "The overland routes declined from the fifteenth century onwards. Political fragmentation made travel less secure, and European sailors established sea routes to Asia that could carry larger cargoes more cheaply. Yet the Silk Road's legacy remains visible in the languages, religions, and art of the regions it once connected.",
    [
      _q(_mainId, _mainEn, [
        'The history of a trade network and the goods and ideas it carried',
        'The life of Ferdinand von Richthofen',
        'How silk is produced in China',
        'The causes of the Black Death in Europe',
      ]),
      _tf(
        'The name Silk Road was used by officials of the Han dynasty.',
        'False',
      ),
      _tf('Samarkand was the largest city on the Silk Road.', 'Not Given'),
      _tf('Papermaking technology moved westward along the routes.', 'True'),
      _q(
        'Menurut bacaan, mengapa jalur darat mengalami kemunduran?',
        'According to the passage, why did the overland routes decline?',
        [
          'Sea routes could carry larger cargoes more cheaply',
          'China stopped producing silk',
          'The Black Death closed every oasis city',
          'Rome banned the import of luxury goods',
        ],
      ),
    ],
  ),
  _p(
    'en_rm_13',
    'Bentang Alam Karst',
    'Karst Landscapes',
    "Some of the world's most dramatic landscapes are formed not by wind or ice but by the slow chemical action of water on rock. These karst landscapes develop where the bedrock is limestone or another soluble rock. As rain falls through the atmosphere and soaks through soil, it absorbs carbon dioxide and forms a weak carbonic acid. Over thousands of years, this acidic water dissolves the limestone along cracks and joints, gradually widening them into channels and, eventually, caves.\n\n"
        "Above ground, karst regions often have few rivers, because water quickly disappears into the rock. Instead, the surface may be dotted with sinkholes, which form when the roof of an underground cavity collapses or when rock dissolves downward from the surface. In tropical regions with heavy rainfall, such as southern China and parts of Southeast Asia, erosion can leave behind steep, isolated limestone towers rising from flat plains.\n\n"
        "Inside caves, the process can work in reverse. When water dripping from a cave ceiling releases carbon dioxide into the cave air, it can no longer hold as much dissolved calcium carbonate, and a tiny amount of mineral is deposited. Drop by drop, this creates stalactites hanging from the ceiling and stalagmites rising from the floor. Because they grow in layers, these formations can preserve records of past climate, much as tree rings do.\n\n"
        "Karst areas also pose practical challenges. Their water supplies are easily polluted, since water flows rapidly through open channels without being filtered by soil, and sudden sinkhole collapses can damage roads and buildings.",
    [
      _q(_mainId, _mainEn, [
        'How karst landscapes form and what features and problems they have',
        'Why limestone is used in construction',
        'How tree rings record past climate',
        'The rivers of southern China',
      ]),
      _q(
        'Menurut bacaan, bagaimana asam karbonat terbentuk?',
        'According to the passage, how does carbonic acid form?',
        [
          'Rainwater absorbs carbon dioxide',
          'Limestone reacts with ice',
          'Cave air releases minerals into water',
          'Wind erodes the surface of rocks',
        ],
      ),
      _q(
        'Kata "soluble" pada paragraf 1 paling dekat maknanya dengan ...',
        'The word "soluble" in paragraph 1 is closest in meaning to ...',
        [
          'able to be dissolved',
          'extremely hard',
          'full of fossils',
          'easily broken by ice',
        ],
      ),
      _q(
        'Manakah yang TIDAK disebut sebagai ciri bentang alam karst?',
        'Which of the following is NOT mentioned as a feature of karst landscapes?',
        ['Active volcanoes', 'Sinkholes', 'Limestone towers', 'Caves'],
      ),
      _q(
        'Mengapa penulis membandingkan stalagmit dengan lingkaran tahun pohon?',
        'Why does the author compare cave formations to tree rings?',
        [
          'To clarify how they can record information over time',
          'To show that caves contain ancient trees',
          'To argue that stalagmites grow faster than trees',
          'To explain why karst regions have few forests',
        ],
      ),
    ],
  ),
  _p(
    'en_rm_14',
    'Asal-usul Bulan',
    'The Origin of the Moon',
    "Where did the Moon come from? For much of the twentieth century, scientists debated three main ideas. The Moon might have split off from a rapidly spinning early Earth, it might have been a wandering body captured by Earth's gravity, or it might have formed alongside Earth from the same cloud of material. Each idea, however, ran into serious difficulties when tested against the evidence.\n\n"
        "The Apollo missions between 1969 and 1972 brought back nearly 400 kilograms of lunar rock, transforming the debate. Analysis showed that the Moon's rocks are strikingly similar to Earth's in the proportions of certain oxygen isotopes, suggesting a shared origin. Yet the Moon has a very small iron core and is depleted in volatile elements, those that evaporate easily, which suggested that it had been heated intensely.\n\n"
        "In the mid-1970s, researchers proposed a new explanation: the giant-impact hypothesis. According to this model, about 4.5 billion years ago a Mars-sized body, often called Theia, collided with the young Earth. The collision vaporised and ejected a vast quantity of material, mostly from the outer, rocky layers of both bodies, which then gathered in orbit and combined to form the Moon. This would explain both the small iron core and the loss of volatile elements.\n\n"
        "The hypothesis is now the most widely accepted, but it is not without problems. Computer simulations suggest that much of the Moon should have come from Theia, so its composition should differ more from Earth's than it actually does. Scientists are therefore testing modified versions of the model, including more violent impacts that would have mixed the materials thoroughly.",
    [
      _q(_mainId, _mainEn, [
        'Competing explanations for the Moon\'s origin and the evidence behind them',
        'The history of the Apollo space programme',
        'Why the Moon has a large iron core',
        'How oxygen isotopes are produced in stars',
      ]),
      _q(
        'Bukti apa yang menunjukkan bahwa Bulan pernah dipanaskan dengan hebat?',
        'Which evidence suggested that the Moon had been heated intensely?',
        [
          'It is depleted in volatile elements',
          'Its oxygen isotopes match Earth\'s',
          'It orbits Earth once a month',
          'It contains water ice at its poles',
        ],
      ),
      _q(
        'Kata "depleted" pada paragraf 2 paling dekat maknanya dengan ...',
        'The word "depleted" in paragraph 2 is closest in meaning to ...',
        ['reduced in amount', 'enriched', 'protected', 'mixed'],
      ),
      _q(
        'Apa tujuan paragraf terakhir?',
        'What is the purpose of the final paragraph?',
        [
          'To show that the accepted theory still has unresolved problems',
          'To reject the giant-impact hypothesis completely',
          'To describe the planet Theia in detail',
          'To explain how the Apollo rocks were collected',
        ],
      ),
      _q(
        'Apa yang dapat disimpulkan tentang perdebatan sebelum misi Apollo?',
        'What can be inferred about the debate before the Apollo missions?',
        [
          'Scientists lacked direct samples to test their ideas',
          'Most scientists already accepted the giant-impact hypothesis',
          'The capture theory had been proved correct',
          'No one had studied the Moon\'s origin',
        ],
      ),
    ],
  ),
  _p(
    'en_rm_15',
    'Efek Jangkar',
    'The Anchoring Effect',
    "Imagine being asked whether the population of a distant city is more or less than five million, and then being asked to estimate the actual figure. Research suggests that your estimate would be noticeably higher than if the first question had mentioned five hundred thousand instead. This tendency to rely too heavily on an initial number, even an irrelevant one, is known as the anchoring effect.\n\n"
        "The effect was described in a classic 1974 study by the psychologists Amos Tversky and Daniel Kahneman. Participants watched a wheel of fortune, which had been secretly fixed to stop at either 10 or 65, and were then asked to estimate the percentage of African nations in the United Nations. Those who saw 10 gave a median estimate of 25 percent; those who saw 65 gave a median estimate of 45 percent. A number they believed to be random had clearly influenced their judgement.\n\n"
        "Anchoring has since been observed in a wide variety of settings. In negotiations, the first offer often shapes the final agreement. Shoppers judge a sale price as a bargain when it is displayed beside a higher original price. Even experienced professionals are not immune: in some experiments, judges' sentencing decisions were affected by numbers suggested to them.\n\n"
        "Why does anchoring occur? One explanation is that people start from the anchor and adjust, but stop adjusting too soon. Another proposes that the anchor makes information consistent with it come to mind more easily. Whatever the mechanism, the effect is difficult to avoid. Simply warning people about anchoring tends to reduce it only slightly.",
    [
      _q(_mainId, _mainEn, [
        'How an initial number can bias people\'s judgements',
        'The career of Amos Tversky and Daniel Kahneman',
        'How the United Nations chooses its members',
        'Techniques for winning negotiations',
      ]),
      _tf(
        'The wheel used in the 1974 study produced genuinely random numbers.',
        'False',
      ),
      _tf(
        'Participants who saw the higher number gave higher estimates.',
        'True',
      ),
      _tf(
        'Professional negotiators are less affected by anchoring than students.',
        'Not Given',
      ),
      _q(
        'Kata "immune" pada paragraf 3 paling dekat maknanya dengan ...',
        'The word "immune" in paragraph 3 is closest in meaning to ...',
        ['unaffected', 'experienced', 'healthy', 'protected by law'],
      ),
    ],
  ),
  _p(
    'en_rm_16',
    'Bank Sentral dan Inflasi',
    'Central Banks and Inflation',
    "Inflation is a general rise in the prices of goods and services over time, which reduces the purchasing power of money. A small amount of inflation is usually considered normal in a growing economy, and many central banks, including Bank Indonesia, publish explicit inflation targets. The challenge lies in preventing inflation from becoming too high or too unpredictable.\n\n"
        "The main tool most central banks use is the policy interest rate, the rate at which they lend to or accept deposits from commercial banks. When inflation rises above the target, a central bank may raise this rate. Commercial banks then tend to charge more for loans, so businesses postpone investment and households borrow less to buy houses or cars. As spending slows, pressure on prices eases. When the economy is weak and inflation is low, the bank can cut rates to encourage borrowing and spending.\n\n"
        "This process works with long delays. Economists estimate that a change in interest rates may take a year or more to have its full effect on inflation. Central bankers must therefore act on forecasts, raising rates before inflation peaks or cutting them before a recession deepens. Mistakes in either direction can be costly: rates kept too low may allow inflation to become entrenched, while rates raised too sharply may cause unnecessary unemployment.\n\n"
        "Expectations also matter. If workers and firms believe prices will keep rising quickly, they may demand higher wages and set higher prices in advance, making inflation self-fulfilling. For this reason, central banks place great value on credibility. When the public trusts that a bank will keep inflation near its target, expectations remain stable and policy becomes easier to conduct.",
    [
      _q(_mainId, _mainEn, [
        'How central banks use interest rates and credibility to control inflation',
        'Why inflation is always harmful to an economy',
        'The history of Bank Indonesia',
        'How commercial banks calculate loan repayments',
      ]),
      _q(
        'Menurut bacaan, apa akibat langsung ketika bank sentral menaikkan suku bunga?',
        'According to the passage, what is a direct result of a central bank raising its rate?',
        [
          'Borrowing from commercial banks becomes more expensive',
          'Prices immediately fall',
          'Workers demand higher wages',
          'The government prints more money',
        ],
      ),
      _q(
        'Kata "entrenched" pada paragraf 3 paling dekat maknanya dengan ...',
        'The word "entrenched" in paragraph 3 is closest in meaning to ...',
        [
          'firmly established',
          'easily reversed',
          'carefully measured',
          'officially banned',
        ],
      ),
      _q(
        'Mengapa bank sentral harus bertindak berdasarkan prakiraan?',
        'Why must central bankers act on forecasts?',
        [
          'Interest rate changes take a long time to affect inflation',
          'Inflation data are never published',
          'Commercial banks refuse to follow current rates',
          'Recessions always follow periods of high inflation',
        ],
      ),
      _q(
        'Apa yang dapat disimpulkan tentang bank sentral yang sering gagal mencapai targetnya?',
        'What can be inferred about a central bank that often misses its target?',
        [
          'It may find inflation harder to control',
          'It will be able to cut rates more freely',
          'Its policy will become easier to conduct',
          'Public expectations will remain stable',
        ],
      ),
    ],
  ),
  _p(
    'en_rm_17',
    'Borobudur',
    'Borobudur',
    "Borobudur, in Central Java, is the largest Buddhist monument in the world. It was built in the eighth and ninth centuries during the rule of the Sailendra dynasty, using an estimated two million blocks of volcanic stone. Unlike a temple with an interior space for worship, Borobudur was constructed over a natural hill and is experienced from the outside. It rises in a series of square terraces topped by circular ones and is crowned by a large central stupa.\n\n"
        "The structure is designed to be read as a journey. Pilgrims walk clockwise around each level before climbing to the next, passing some 2,672 carved relief panels along the way. The lower reliefs depict the world of desire and the consequences of good and bad actions, while higher galleries illustrate the life of the Buddha and stories of his previous lives. On the upper circular terraces, the narrative carvings disappear. Instead, 72 perforated stupas, each containing a seated Buddha, surround the summit, an arrangement that many scholars interpret as representing a state beyond form.\n\n"
        "Historians also value the reliefs as a record of daily life in ancient Java. They show houses, musical instruments, markets, and sailing ships, including an outrigger vessel that has served as the model for a modern reconstruction.\n\n"
        "For centuries the monument lay partly buried under volcanic ash and vegetation. It attracted wider attention in 1814, when Thomas Stamford Raffles, then the British lieutenant-governor of Java, ordered an investigation of the site. A major restoration supported by UNESCO took place between 1975 and 1982, and in 1991 Borobudur was inscribed as a World Heritage Site.",
    [
      _q(_mainId, _mainEn, [
        'The design, meaning, and history of Borobudur',
        'The life of Thomas Stamford Raffles',
        'How volcanic stone is cut and transported',
        'The rulers of the Sailendra dynasty',
      ]),
      _q(
        'Menurut bacaan, apa yang terdapat di teras melingkar bagian atas?',
        'According to the passage, what is found on the upper circular terraces?',
        [
          'Perforated stupas containing seated Buddha statues',
          'Reliefs showing markets and ships',
          'Panels depicting the world of desire',
          'An interior hall for worship',
        ],
      ),
      _q(
        'Kata "perforated" pada paragraf 2 paling dekat maknanya dengan ...',
        'The word "perforated" in paragraph 2 is closest in meaning to ...',
        ['having small holes', 'painted', 'very large', 'broken'],
      ),
      _q(
        'Manakah yang TIDAK disebut sebagai gambar pada relief?',
        'Which of the following is NOT mentioned as appearing in the reliefs?',
        [
          'Battles between rival kingdoms',
          'Musical instruments',
          'Markets',
          'Sailing ships',
        ],
      ),
      _q(
        'Apa yang dapat disimpulkan dari paragraf terakhir?',
        'What can be inferred from the final paragraph?',
        [
          'Borobudur was not fully visible before the nineteenth century',
          'Raffles designed the 1975 restoration',
          'The monument was built by British engineers',
          'UNESCO discovered the site in 1991',
        ],
      ),
    ],
  ),
  _p(
    'en_rm_18',
    'Periode Kritis Belajar Bahasa',
    'The Critical Period for Language',
    "Why do young children seem to acquire languages so effortlessly, while adults often struggle for years? One influential answer is the critical period hypothesis, proposed in its best-known form by the neurologist Eric Lenneberg in 1967. Lenneberg argued that the brain is especially adapted for language learning in childhood and that this capacity declines around puberty, as the brain loses some of its flexibility.\n\n"
        "Some evidence supports a strong version of this idea for first languages. Rare cases of children who were isolated from language until late childhood show that such children struggle to master grammar fully, even after years of teaching. Studies of deaf individuals who were first exposed to sign language at different ages point in a similar direction: those who learned later in life tend to show less native-like command of grammar.\n\n"
        "The picture for second languages is more complicated. Large studies of immigrants have found that people who arrive in a new country as children generally reach higher levels of grammatical accuracy and pronunciation than those who arrive as adults. However, the decline does not appear to happen suddenly at puberty; instead, ability seems to decrease gradually with age. Moreover, some adult learners do achieve near-native proficiency.\n\n"
        "Age is also only one factor among many. Adults usually have less time for study and less exposure to the language than children in school, and they may feel more anxious about making mistakes. On the other hand, adults often learn faster in the early stages, thanks to their greater knowledge and study skills. Many researchers now prefer to speak of a sensitive period rather than a strict critical one.",
    [
      _tf(
        'Lenneberg believed that the capacity for language learning declines around puberty.',
        'True',
      ),
      _tf(
        'Studies of immigrants show that second-language ability drops suddenly at puberty.',
        'False',
      ),
      _tf(
        'Deaf children learn sign language faster than hearing children learn spoken language.',
        'Not Given',
      ),
      _q(
        'Kata "proficiency" pada paragraf 3 paling dekat maknanya dengan ...',
        'The word "proficiency" in paragraph 3 is closest in meaning to ...',
        ['skill', 'confidence', 'accent', 'vocabulary'],
      ),
      _q(
        'Apa tujuan penulis pada paragraf terakhir?',
        'What is the author\'s purpose in the final paragraph?',
        [
          'To show that factors other than age affect language learning',
          'To prove that adults cannot learn new languages',
          'To describe how schools teach grammar',
          'To argue that the critical period ends in early childhood',
        ],
      ),
    ],
  ),
  _p(
    'en_rm_19',
    'Lahan Gambut dan Kebakaran',
    'Peatlands and Fire',
    "Peatlands are wetlands in which waterlogged conditions prevent dead plant material from fully decomposing. Over thousands of years, this material accumulates as peat, a dark, spongy soil that can reach depths of more than ten metres in some tropical regions. Although peatlands cover only about three percent of the world's land surface, they store more carbon than all of the world's forests combined.\n\n"
        "Southeast Asia, and Indonesia in particular, contains a large share of the world's tropical peatlands, much of it on Sumatra, Kalimantan, and Papua. In their natural state, these swamp forests are rarely at risk of serious fire because the peat remains wet throughout the year. Problems begin when drainage canals are dug to prepare land for agriculture or plantations. As the water table falls, the upper layers of peat dry out and become highly flammable.\n\n"
        "Fires in drained peat behave differently from ordinary forest fires. They can smoulder below the surface for weeks, spreading underground and releasing large quantities of smoke and carbon dioxide. Such fires are extremely difficult to extinguish, because water dropped from above may not reach the burning layers. In severe dry seasons, particularly during El Nino years, the resulting haze has affected air quality across the region, causing respiratory illness and disrupting schools and flights.\n\n"
        "In response, efforts have focused on restoring the water table by blocking drainage canals, a process known as rewetting, and on replanting native species. Researchers note that prevention is far more effective than firefighting: once peat has dried out, even a small fire can become a long-lasting disaster.",
    [
      _q(_mainId, _mainEn, [
        'Why drained peatlands burn and how the problem can be addressed',
        'How peat is used as a fuel in Southeast Asia',
        'The causes of El Nino',
        'The history of plantations in Sumatra',
      ]),
      _q(
        'Menurut bacaan, mengapa lahan gambut alami jarang terbakar hebat?',
        'According to the passage, why do natural peatlands rarely suffer serious fires?',
        [
          'The peat stays wet throughout the year',
          'Few people live near them',
          'Their trees are naturally fire-resistant',
          'They receive little sunlight',
        ],
      ),
      _q(
        'Kata "smoulder" pada paragraf 3 paling dekat maknanya dengan ...',
        'The word "smoulder" in paragraph 3 is closest in meaning to ...',
        [
          'burn slowly without flames',
          'explode suddenly',
          'spread through the air',
          'cool down',
        ],
      ),
      _q(
        'Apa yang dapat disimpulkan tentang pesawat pemadam kebakaran?',
        'What can be inferred about firefighting aircraft?',
        [
          'They may be of limited use against peat fires',
          'They are the most effective way to stop peat fires',
          'They cause the haze that disrupts flights',
          'They are used to dig drainage canals',
        ],
      ),
      _q(
        'Dampak kabut asap mana yang TIDAK disebut dalam bacaan?',
        'Which effect of the haze is NOT mentioned in the passage?',
        [
          'Damage to crops',
          'Respiratory illness',
          'Disruption to schools',
          'Disruption to flights',
        ],
      ),
    ],
  ),
  _p(
    'en_rm_20',
    'Cara Kerja GPS',
    'How GPS Works',
    "The Global Positioning System, or GPS, was developed by the United States Department of Defense and became fully operational in 1995. It relies on a constellation of around thirty satellites orbiting about 20,000 kilometres above the Earth. Each satellite carries extremely precise atomic clocks and continuously broadcasts a signal containing the time and its own position.\n\n"
        "A GPS receiver, such as the one in a smartphone, does not send any signal to the satellites. Instead, it listens. By comparing the time a signal was sent with the time it arrived, the receiver calculates how far away each satellite is. Since radio signals travel at the speed of light, even a tiny timing error matters: a mistake of one millionth of a second would place the user about 300 metres off. With distances from at least four satellites, the receiver can determine its position in three dimensions while also correcting errors in its own, much less accurate clock.\n\n"
        "Surprisingly, the system must also take Einstein's theories of relativity into account. Because the satellites move fast, their clocks run slightly slower, but because they experience weaker gravity, they run faster. The combined effect makes satellite clocks gain about 38 microseconds per day relative to clocks on the ground. Without correction, positioning errors would grow by roughly ten kilometres each day.\n\n"
        "Today GPS is one of several satellite navigation systems, alongside Russia's GLONASS, Europe's Galileo, and China's BeiDou. Beyond navigation, their timing signals help synchronise mobile networks, power grids, and financial transactions, making them a largely invisible part of modern infrastructure.",
    [
      _q(_mainId, _mainEn, [
        'The principles that allow satellite navigation to work accurately',
        'The military history of the United States',
        'Why smartphones need atomic clocks',
        'A comparison of GPS and BeiDou prices',
      ]),
      _q(
        'Menurut bacaan, mengapa penerima memerlukan sinyal dari minimal empat satelit?',
        'According to the passage, why does a receiver need signals from at least four satellites?',
        [
          'To find its position and correct its own clock error',
          'To send its location back to the satellites',
          'To compensate for the effects of weather',
          'To connect to mobile networks',
        ],
      ),
      _q(
        'Kata "synchronise" pada paragraf 4 paling dekat maknanya dengan ...',
        'The word "synchronise" in paragraph 4 is closest in meaning to ...',
        ['coordinate in time', 'protect', 'speed up', 'switch off'],
      ),
      _q(
        'Apa yang dapat disimpulkan tentang penggunaan penerima GPS?',
        'What can be inferred about using a GPS receiver?',
        [
          'It does not reveal the user\'s location to the satellites',
          'It requires the user to pay a monthly fee',
          'It works only in the United States',
          'It is accurate only to within ten kilometres',
        ],
      ),
      _q('Apa tujuan paragraf 3?', 'What is the purpose of paragraph 3?', [
        'To show that physical theory has practical engineering consequences',
        'To explain why satellite clocks are inaccurate by design',
        'To argue that Einstein invented GPS',
        'To describe how gravity holds satellites in orbit',
      ]),
    ],
  ),
  _p(
    'en_rm_21',
    'Navigasi Burung Migran',
    'How Migrating Birds Navigate',
    "Every year, billions of birds undertake migrations between breeding and wintering grounds, some covering thousands of kilometres. The bar-tailed godwit holds a remarkable record: tracked individuals have flown nonstop from Alaska to New Zealand, a journey of more than 11,000 kilometres, without feeding or resting. How birds find their way over such distances has fascinated scientists for centuries.\n\n"
        "Research has shown that birds use several compasses. Many species navigate by the sun, compensating for its movement across the sky with their internal clock. Night-migrating songbirds can learn to orient by the stars; experiments in planetariums in the 1960s showed that young birds learn the centre of rotation of the night sky, which identifies north.\n\n"
        "Birds can also sense the Earth's magnetic field. One leading hypothesis proposes that this ability depends on light-sensitive proteins called cryptochromes in the eye, which may allow birds literally to see magnetic field lines as a pattern overlaid on their vision. Separately, some studies suggest that the magnetic field may also provide a kind of map, since its strength and angle vary with location.\n\n"
        "Smell may play a role as well. In experiments with homing pigeons and some seabirds, individuals whose sense of smell had been impaired had greater difficulty returning home over unfamiliar areas.\n\n"
        "Not all of this knowledge is innate. In many species, young birds on their first migration follow an inherited direction and distance, while experienced adults can correct for being blown off course, suggesting that a true navigational map is learned over time.",
    [
      _q(_mainId, _mainEn, [
        'The different senses and skills birds use to navigate',
        'The breeding habits of the bar-tailed godwit',
        'How planetariums are built',
        'Why some birds do not migrate',
      ]),
      _tf(
        'Bar-tailed godwits stop to feed during their flight from Alaska to New Zealand.',
        'False',
      ),
      _tf(
        'Young songbirds can learn to find north from the rotation of the night sky.',
        'True',
      ),
      _tf(
        'Most bird species rely more on their magnetic sense than on the sun.',
        'Not Given',
      ),
      _q(
        'Apa yang dapat disimpulkan dari paragraf terakhir?',
        'What can be inferred from the final paragraph?',
        [
          'Experienced birds navigate more flexibly than first-time migrants',
          'Young birds never complete their first migration',
          'Adult birds lose their inherited sense of direction',
          'Birds learn navigation mainly from humans',
        ],
      ),
    ],
  ),
  _p(
    'en_rm_22',
    'Letusan Krakatau 1883',
    'The 1883 Eruption of Krakatau',
    "On 27 August 1883, the volcanic island of Krakatau, in the Sunda Strait between Java and Sumatra, was destroyed in one of the most violent eruptions in recorded history. After months of smaller activity, a series of enormous explosions tore the island apart. The final blast was heard on the island of Rodrigues in the Indian Ocean, nearly 4,800 kilometres away, and the pressure wave it produced was recorded by barometers around the world several times as it circled the globe.\n\n"
        "The greatest loss of life was caused not by the explosions themselves but by tsunamis. Waves reaching heights of more than 30 metres struck the coasts of Java and Sumatra, destroying around 165 coastal villages. Official figures put the death toll at more than 36,000 people.\n\n"
        "The eruption had effects far beyond the region. Huge quantities of ash and sulphur gases were injected high into the atmosphere, where they spread around the planet. For months, people in Europe and North America saw unusually vivid red sunsets; in New York, fire engines were reportedly called out because the glowing sky was mistaken for a distant fire. The particles also reflected sunlight back into space, slightly lowering average global temperatures over the following year.\n\n"
        "Krakatau was also among the first natural disasters to be reported quickly around the world, thanks to the recently laid network of undersea telegraph cables. In 1927, a new volcano emerged from the sea where the old island had stood. Named Anak Krakatau, or Child of Krakatau, it remains active and is closely monitored; in 2018, a partial collapse of its flank triggered a deadly tsunami.",
    [
      _q(_mainId, _mainEn, [
        'The 1883 eruption of Krakatau and its local and global effects',
        'How barometers measure air pressure',
        'The history of telegraph cables',
        'Why sunsets are red in New York',
      ]),
      _q(
        'Menurut bacaan, apa penyebab utama korban jiwa?',
        'According to the passage, what caused the greatest loss of life?',
        [
          'Tsunamis',
          'The explosions themselves',
          'Falling ash',
          'Lower global temperatures',
        ],
      ),
      _q(
        'Kata "vivid" pada paragraf 3 paling dekat maknanya dengan ...',
        'The word "vivid" in paragraph 3 is closest in meaning to ...',
        ['bright and intense', 'pale', 'short-lived', 'frightening'],
      ),
      _q(
        'Mengapa penulis menyebut mobil pemadam kebakaran di New York?',
        'Why does the author mention fire engines in New York?',
        [
          'To illustrate how striking the atmospheric effects were far away',
          'To show that the eruption caused fires in North America',
          'To explain how news of the eruption reached America',
          'To criticise the emergency services of the time',
        ],
      ),
      _q(
        'Apa yang dapat disimpulkan dari paragraf terakhir?',
        'What can be inferred from the final paragraph?',
        [
          'News of earlier disasters had generally spread more slowly',
          'Anak Krakatau is no longer dangerous',
          'Telegraph cables were damaged by the eruption',
          'The old island of Krakatau reappeared in 1927',
        ],
      ),
    ],
  ),
];

// ---------------------------------------------------------------------------
// 2. TOEFL 2026 — Read in Daily Life
// ---------------------------------------------------------------------------

final List<ReadingPassage> toeflDailyLife = [
  _p(
    'en_dl_1',
    'Email: Pemadaman Air',
    'Email: Water Shut-Off',
    "Subject: Water Shut-Off on Thursday\n\n"
        "Dear Residents,\n\n"
        "Please be advised that the water supply to Building B will be turned off this Thursday, 14 March, from 9:00 a.m. to 2:00 p.m. while plumbers replace a damaged pipe in the basement. Building A will not be affected. We recommend storing some water in advance for drinking and cooking. If the repair finishes early, we will restore the supply immediately and notify you by text message. We apologise for the inconvenience.\n\n"
        "Best regards,\nMaya Lestari\nBuilding Manager",
    [
      _q(
        'Apa tujuan utama email ini?',
        'What is the main purpose of the email?',
        [
          'To inform residents about a temporary interruption to the water supply',
          'To ask residents to repair a damaged pipe',
          'To announce new rules for Building A',
          'To apologise for a late rent payment',
        ],
      ),
      _q(
        'Apa yang akan terjadi jika perbaikan selesai lebih cepat?',
        'What will happen if the repair finishes early?',
        [
          'Residents will be informed by text message',
          'Building A will lose its water supply',
          'The plumbers will return on Friday',
          'Residents must collect water from the basement',
        ],
      ),
      _q(
        'Siapa yang sebaiknya menyimpan air sebelum hari Kamis?',
        'Who should store water before Thursday?',
        [
          'Residents of Building B',
          'Residents of Building A',
          'The plumbers',
          'The building manager only',
        ],
      ),
    ],
  ),
  _p(
    'en_dl_2',
    'Pengumuman Perpustakaan',
    'Library Notice',
    "CITY LIBRARY: NEW BORROWING RULES (from 1 July)\n\n"
        "- Members may borrow up to 8 items at a time (previously 6).\n"
        "- Loan period for books: 3 weeks. DVDs and magazines: 1 week.\n"
        "- Items may be renewed twice online, unless another member has reserved them.\n"
        "- Late fees will no longer be charged for children's books.\n"
        "- Lost items must be paid for at the replacement price.\n\n"
        "Questions? Ask at the information desk on the ground floor.",
    [
      _q(
        'Berapa barang yang boleh dipinjam anggota sebelum 1 Juli?',
        'How many items could members borrow at a time before 1 July?',
        ['6', '8', '3', '2'],
      ),
      _q(
        'Kapan sebuah barang TIDAK dapat diperpanjang secara online?',
        'When can an item NOT be renewed online?',
        [
          'When another member has reserved it',
          'When it is a children\'s book',
          'When it is borrowed for three weeks',
          'When the information desk is closed',
        ],
      ),
      _q(
        'Apa yang benar tentang buku anak-anak?',
        'What is true about children\'s books?',
        [
          'Late fees will not be charged for them',
          'They can be borrowed for only one week',
          'They cannot be renewed',
          'They must be returned to the ground floor',
        ],
      ),
    ],
  ),
  _p(
    'en_dl_3',
    'Menu Kafe',
    'Cafe Menu',
    "GREEN LEAF CAFE: LUNCH SPECIALS (11:30-15:00)\n\n"
        "Chicken Rice Bowl ........ IDR 45,000\n"
        "Vegetable Curry (vegan) .. IDR 40,000\n"
        "Grilled Fish Salad ....... IDR 52,000\n\n"
        "Add an iced tea to any special for just IDR 8,000.\n"
        "Students with a valid ID receive 10% off all lunch specials on weekdays.\n\n"
        "Please note: our kitchen uses peanuts and sesame. Ask our staff about allergens.",
    [
      _q(
        'Hidangan mana yang tidak mengandung produk hewani?',
        'Which dish contains no animal products?',
        [
          'Vegetable Curry',
          'Chicken Rice Bowl',
          'Grilled Fish Salad',
          'All of the specials',
        ],
      ),
      _q(
        'Siapa yang bisa mendapat potongan harga?',
        'Who can receive a discount?',
        [
          'Students with a valid ID on weekdays',
          'Anyone who orders an iced tea',
          'Customers who arrive before 11:30',
          'All customers at weekends',
        ],
      ),
      _q(
        'Mengapa menu menyebut kacang tanah dan wijen?',
        'Why does the menu mention peanuts and sesame?',
        [
          'To warn customers who have food allergies',
          'To advertise a new dish',
          'To explain why prices have risen',
          'To show which dishes are vegan',
        ],
      ),
    ],
  ),
  _p(
    'en_dl_4',
    'Perubahan Jadwal Bus',
    'Bus Timetable Change',
    "ROUTE 12 TIMETABLE CHANGE\n\n"
        "Due to road construction on Jalan Merdeka, Route 12 buses will be diverted along Jalan Sudirman from 5 to 30 May. The stops at Merdeka Square and the Central Post Office will be temporarily closed. Passengers should use the temporary stop outside Sudirman Mall instead. During this period, buses will run every 15 minutes instead of every 10 minutes, and journey times may increase by up to 10 minutes. Thank you for your patience.",
    [
      _q('Mengapa rute bus diubah?', 'Why is the bus route changing?', [
        'Because of road construction',
        'Because of a shortage of drivers',
        'Because Sudirman Mall is closing',
        'Because of a public holiday',
      ]),
      _q(
        'Apa yang akan terjadi pada frekuensi layanan?',
        'What will happen to the frequency of the service?',
        [
          'Buses will come less often',
          'Buses will come more often',
          'Buses will stop running in May',
          'Buses will run only at weekends',
        ],
      ),
      _q(
        'Halte mana yang ditutup sementara?',
        'Which stop will be temporarily closed?',
        [
          'Central Post Office',
          'Sudirman Mall',
          'Jalan Sudirman',
          'Route 12 terminal',
        ],
      ),
    ],
  ),
  _p(
    'en_dl_5',
    'Unggahan: Kucing Hilang',
    'Post: Lost Cat',
    "LOST CAT - PLEASE SHARE!\n\n"
        "Our cat, Mochi, slipped out of the house on Saturday evening near Taman Sari Park. She is small and grey with a white patch on her chest, and she wears a red collar with a bell. She is very shy and will probably hide rather than come to strangers, so please don't chase her. Just send us a message with the location if you see her. We are offering a reward for any information that helps us bring her home. Thank you, neighbours!",
    [
      _q(
        'Apa yang sebaiknya dilakukan orang jika melihat Mochi?',
        'What should people do if they see Mochi?',
        [
          'Send the owners a message with the location',
          'Catch her and bring her to the park',
          'Call her name loudly',
          'Remove her collar',
        ],
      ),
      _q(
        'Apa yang disiratkan tentang Mochi?',
        'What is suggested about Mochi?',
        [
          'She is likely to avoid people she does not know',
          'She often visits Taman Sari Park',
          'She has been missing for several weeks',
          'She is friendly with strangers',
        ],
      ),
      _q(
        'Deskripsi mana yang sesuai dengan Mochi?',
        'Which description matches Mochi?',
        [
          'Grey with a white patch on her chest',
          'White with a grey patch on her back',
          'Large and black with a blue collar',
          'Grey with no collar',
        ],
      ),
    ],
  ),
  _p(
    'en_dl_6',
    'Lowongan Kerja Barista',
    'Job Advertisement',
    "PART-TIME BARISTA WANTED\n\n"
        "Kopi Pagi is looking for a friendly barista to join our team at our Jalan Braga branch. Shifts are on weekends (Saturday and Sunday, 7:00-13:00). Previous experience is an advantage but not required, as full training will be provided. Applicants must be at least 18 and able to communicate in basic English, since many of our customers are tourists. Benefits include free drinks during shifts and a staff discount. To apply, send your CV to jobs@kopipagi.example by 20 June. Only shortlisted candidates will be contacted.",
    [
      _q(
        'Manakah yang merupakan syarat wajib bagi pelamar?',
        'Which of the following is a requirement for applicants?',
        [
          'Being at least 18 years old',
          'Having previous barista experience',
          'Being available on weekdays',
          'Living near Jalan Braga',
        ],
      ),
      _q(
        'Mengapa kemampuan bahasa Inggris diperlukan?',
        'Why is English required?',
        [
          'Many customers are tourists',
          'The training is given in English',
          'The owner does not speak Indonesian',
          'The CV must be written in English',
        ],
      ),
      _q(
        'Apa yang dapat disimpulkan tentang pelamar yang tidak dihubungi?',
        'What can be inferred about applicants who are not contacted?',
        [
          'They have not been selected for the next stage',
          'Their CVs were sent to another branch',
          'They will receive a staff discount',
          'They must apply again before 20 June',
        ],
      ),
    ],
  ),
  _p(
    'en_dl_7',
    'Iklan Pusat Kebugaran',
    'Gym Advertisement',
    "FITZONE: NEW YEAR OFFER\n\n"
        "Join before 31 January and pay no joining fee (normally IDR 250,000)! Monthly membership costs IDR 300,000 and includes unlimited access to the gym and all group classes. Personal training sessions are available at extra cost. Bring a friend who signs up, and you will both get your second month at half price. Open daily 6:00-22:00. Minimum contract: 3 months.",
    [
      _q(
        'Apa yang termasuk dalam keanggotaan bulanan?',
        'What is included in the monthly membership?',
        [
          'Group classes',
          'Personal training',
          'A free second month',
          'The joining fee',
        ],
      ),
      _q(
        'Bagaimana anggota bisa mendapat potongan untuk bulan kedua?',
        'How can members get a discount on their second month?',
        [
          'By bringing a friend who joins',
          'By joining after 31 January',
          'By booking personal training',
          'By visiting before 6:00',
        ],
      ),
      _q(
        'Apa yang benar tentang penawaran ini?',
        'What is true about the offer?',
        [
          'Members must stay for at least three months',
          'The gym is closed on Sundays',
          'The joining fee is IDR 300,000',
          'Group classes cost extra',
        ],
      ),
    ],
  ),
  _p(
    'en_dl_8',
    'Pengumuman Bursa Kerja',
    'Career Fair Notice',
    "CAREER FAIR\n"
        "Date: Wednesday, 9 October | Time: 10:00-16:00 | Venue: Main Hall, Building C\n\n"
        "More than 40 companies from banking, technology, and hospitality will be recruiting for internships and graduate positions. Bring several printed copies of your CV and dress formally. A free CV-checking workshop will be held in Room C201 the day before the fair at 14:00. Places are limited to 30 students, so register early on the student portal. Entry to the fair is free for all students and alumni.",
    [
      _q(
        'Kapan lokakarya pemeriksaan CV diadakan?',
        'When will the CV-checking workshop take place?',
        [
          'On Tuesday, 8 October',
          'On Wednesday, 9 October',
          'On Thursday, 10 October',
          'On the morning of the fair',
        ],
      ),
      _q(
        'Mengapa mahasiswa disarankan mendaftar lebih awal?',
        'Why are students advised to register early for the workshop?',
        [
          'The number of places is limited',
          'The workshop fee increases later',
          'Companies will read the list of names',
          'Room C201 closes at 14:00',
        ],
      ),
      _q(
        'Siapa yang dapat masuk ke bursa kerja secara gratis?',
        'Who can enter the fair free of charge?',
        [
          'Current students and alumni',
          'Only students who attended the workshop',
          'Only students in their final year',
          'Employees of the 40 companies',
        ],
      ),
    ],
  ),
  _p(
    'en_dl_9',
    'Pesan Singkat',
    'Text Messages',
    "Rina (08:12): Hi! Running late. My train is delayed by about 20 minutes. Can you save me a seat in the lecture?\n"
        "Dimas (08:14): Sure. By the way, Prof. Hartono emailed yesterday to say the lecture has moved to Room 305, not 210.\n"
        "Rina (08:15): Oh, thanks! I didn't see that email. Could you also take photos of the slides for the first part?\n"
        "Dimas (08:16): No problem. I'll send them to you after class.",
    [
      _q('Mengapa Rina terlambat?', 'Why is Rina late?', [
        'Her train is delayed',
        'She overslept',
        'She went to the wrong room',
        'She was meeting Prof. Hartono',
      ]),
      _q(
        'Informasi apa yang belum diketahui Rina?',
        'What did Rina not know?',
        [
          'The lecture had moved to a different room',
          'The lecture had been cancelled',
          'Dimas would be absent',
          'The slides would be emailed to everyone',
        ],
      ),
      _q(
        'Apa yang akan dilakukan Dimas setelah kuliah?',
        'What will Dimas do after class?',
        [
          'Send Rina photos of the slides',
          'Meet Rina at the train station',
          'Email Prof. Hartono',
          'Give his seat to another student',
        ],
      ),
    ],
  ),
  _p(
    'en_dl_10',
    'Informasi Pengunjung Museum',
    'Museum Visitor Information',
    "NATIONAL HISTORY MUSEUM: VISITOR INFORMATION\n\n"
        "Opening hours: Tuesday-Sunday, 9:00-17:00 (last entry 16:00). Closed on Mondays and public holidays.\n"
        "Admission: adults IDR 20,000; students and seniors IDR 10,000; children under 6 free.\n"
        "Free guided tours in English start at 10:00 and 14:00 from the main lobby.\n"
        "Photography is permitted in most galleries, but flash is not allowed. Large bags must be left in the lockers near the entrance.",
    [
      _q(
        'Pukul berapa pengunjung terakhir boleh masuk?',
        'What is the latest time visitors can enter the museum?',
        ['16:00', '17:00', '14:00', '10:00'],
      ),
      _q(
        'Manakah yang TIDAK diperbolehkan?',
        'Which of the following is NOT allowed?',
        [
          'Using a camera flash',
          'Taking photographs in most galleries',
          'Joining a tour in English',
          'Bringing children under 6',
        ],
      ),
      _q(
        'Berapa yang dibayar seorang mahasiswa?',
        'How much does a student pay for admission?',
        ['IDR 10,000', 'IDR 20,000', 'Nothing', 'IDR 6,000'],
      ),
    ],
  ),
  _p(
    'en_dl_11',
    'Iklan Sewa Apartemen',
    'Apartment Advertisement',
    "FOR RENT: Studio apartment, 5 minutes' walk from the university. Fully furnished with bed, desk, wardrobe, and small kitchen. Rent: IDR 2,500,000 per month, including water and Wi-Fi; electricity is paid separately. Shared laundry room on the ground floor. Quiet building, suitable for students. No pets, no smoking. Minimum stay 6 months; a deposit of one month's rent is required. Viewing by appointment: call or message Mr Budi.",
    [
      _q(
        'Biaya mana yang TIDAK termasuk dalam harga sewa?',
        'Which cost is NOT included in the rent?',
        ['Electricity', 'Water', 'Wi-Fi', 'Furniture'],
      ),
      _q(
        'Apartemen ini paling cocok untuk siapa?',
        'Who would the apartment probably suit best?',
        [
          'A student who wants a quiet place near campus',
          'A family with two dogs',
          'A tourist staying for one week',
          'A smoker who needs a large kitchen',
        ],
      ),
      _q(
        'Apa yang harus dibayar penyewa selain sewa bulan pertama?',
        'What must a new tenant pay in addition to the first month\'s rent?',
        [
          'A deposit',
          'A laundry fee',
          'An agent\'s commission',
          'Six months in advance',
        ],
      ),
    ],
  ),
  _p(
    'en_dl_12',
    'Email: Registrasi Mata Kuliah',
    'Email: Course Registration',
    "Subject: Action required: course registration closes Friday\n\n"
        "Dear Student,\n\n"
        "Our records show that you have not yet registered for next semester's courses. Registration closes this Friday at 23:59. After that, a late fee of IDR 150,000 will apply, and popular courses may be full. To register, log in to the student portal and select Course Planner. If you are planning to take leave next semester, please complete the Leave Request form instead. Contact the Academic Office if you experience technical problems.\n\n"
        "Academic Office",
    [
      _q('Apa tujuan email ini?', 'What is the purpose of the email?', [
        'To remind a student to register before the deadline',
        'To confirm a student\'s course choices',
        'To announce new courses for next semester',
        'To explain a technical problem with the portal',
      ]),
      _q(
        'Apa yang terjadi jika mahasiswa mendaftar setelah hari Jumat?',
        'What happens if a student registers after Friday?',
        [
          'They must pay an additional fee',
          'They cannot register at all',
          'They must take leave next semester',
          'They must visit the Academic Office in person',
        ],
      ),
      _q(
        'Apa yang harus dilakukan mahasiswa yang tidak akan kuliah semester depan?',
        'What should a student who will not study next semester do?',
        [
          'Submit a Leave Request form',
          'Select Course Planner on the portal',
          'Pay the late fee',
          'Ignore the email',
        ],
      ),
    ],
  ),
  _p(
    'en_dl_13',
    'Kebijakan Pengembalian Barang',
    'Store Return Policy',
    "RETURNS AND EXCHANGES\n\n"
        "Items may be returned within 14 days of purchase with the original receipt. Clothing must be unworn and have its tags attached. Refunds will be made to the original payment method. Sale items can be exchanged but not refunded. For hygiene reasons, underwear and earrings cannot be returned. Online orders can be returned in store or by post; return postage is free for members of our loyalty club.",
    [
      _q(
        'Apa yang bisa dilakukan pelanggan dengan barang diskon?',
        'What can a customer do with a sale item?',
        [
          'Exchange it for another item',
          'Get a cash refund',
          'Return it after 30 days',
          'Return it without a receipt',
        ],
      ),
      _q(
        'Barang mana yang sama sekali tidak bisa dikembalikan?',
        'Which item can never be returned?',
        [
          'Earrings',
          'An unworn jacket with tags',
          'An online order',
          'A sale item',
        ],
      ),
      _q(
        'Siapa yang tidak perlu membayar ongkos kirim pengembalian?',
        'Who does not have to pay to post a return?',
        [
          'Members of the loyalty club',
          'Customers who paid by card',
          'Customers who bought sale items',
          'Anyone returning within 14 days',
        ],
      ),
    ],
  ),
  _p(
    'en_dl_14',
    'Unggahan: Kerja Bakti',
    'Post: Neighbourhood Clean-Up',
    "Hi everyone! The residents' association is organising a neighbourhood clean-up this Sunday from 7:00 to 10:00. We'll meet at the playground on Jalan Melati. Gloves, bags, and drinks will be provided, but please bring your own hat and a reusable water bottle to reduce plastic waste. Children are welcome if accompanied by an adult. After the clean-up, there will be a simple breakfast at the community hall. Please reply to this post by Friday so we know how many people to cater for.",
    [
      _q(
        'Mengapa peserta diminta membawa botol minum sendiri?',
        'Why are participants asked to bring their own water bottles?',
        [
          'To reduce plastic waste',
          'Because no drinks will be provided',
          'Because the playground has no shade',
          'To carry rubbish home',
        ],
      ),
      _q(
        'Mengapa warga diminta membalas sebelum hari Jumat?',
        'Why are people asked to reply by Friday?',
        [
          'So the organisers can prepare enough food',
          'So they can be given a hat',
          'So children can be registered with the school',
          'So the playground can be booked',
        ],
      ),
    ],
  ),
];

// ---------------------------------------------------------------------------
// 3. TOEFL 2026 — Complete the Words
// ---------------------------------------------------------------------------

const Map<String, String> _cwPrompt = {
  'id': 'Lengkapi huruf yang hilang pada kata tersebut.',
  'en': 'Complete the missing letters of the word.',
};

/// [template] memuat satu kata bertanda `#kata#`; separuh awal kata
/// ditampilkan dan sisanya diganti garis bawah (satu per huruf).
WritingItem _cw(String template, [List<String> alternatives = const []]) {
  final m = RegExp(r'#(\w+)#').firstMatch(template)!;
  final word = m.group(1)!;
  final shown = word.length ~/ 2;
  final masked = '${word.substring(0, shown)}${'_' * (word.length - shown)}';
  return WritingItem(
    prompt: _cwPrompt,
    text: template.replaceRange(m.start, m.end, masked),
    answers: [word, ...alternatives],
  );
}

final List<WritingItem> toeflCompleteWords = [
  _cw('Photosynthesis #converts# light energy into chemical energy.'),
  _cw('The human heart is #divided# into four separate chambers.'),
  _cw(
    'Earthquakes #occur# most frequently along the boundaries of tectonic plates.',
  ),
  _cw('The #population# of the city doubled between 1990 and 2020.'),
  _cw('Plants absorb water and #nutrients# from the soil through their roots.'),
  _cw('The experiment was #repeated# several times to confirm the results.'),
  _cw(
    'Volcanic #eruptions# can release large amounts of ash into the atmosphere.',
  ),
  _cw(
    'The researchers #collected# data from more than two thousand participants.',
  ),
  _cw(
    'Climate change is #expected# to increase the frequency of extreme weather.',
  ),
  _cw(
    'Many ancient #civilizations# developed along the banks of major rivers.',
    ['civilisations'],
  ),
  _cw(
    'The theory was #initially# rejected but later accepted by most scientists.',
  ),
  _cw('Bacteria #reproduce# by dividing into two identical cells.'),
  _cw(
    'Pure water #freezes# at zero degrees Celsius at normal atmospheric pressure.',
  ),
  _cw('The museum\'s #collection# includes more than ten thousand paintings.'),
  _cw('Economic #growth# slowed sharply during the global financial crisis.'),
  _cw('Regular exercise #reduces# the risk of heart disease.'),
  _cw('The Moon #orbits# the Earth approximately once every 27 days.'),
  _cw('The new policy had a significant #impact# on small businesses.'),
  _cw('Sound #travels# faster through water than through air.'),
  _cw(
    'The #average# temperature of the planet has risen over the past century.',
  ),
  _cw('Scientists #discovered# the double-helix structure of DNA in 1953.'),
  _cw(
    'The author #argues# that higher education should be free for all citizens.',
  ),
  _cw('The bridge was #designed# to withstand strong earthquakes.'),
  _cw('Fossil fuels are a major #source# of greenhouse gas emissions.'),
  _cw('The river #flows# into the sea near the capital city.'),
  _cw('About seventy percent of the Earth\'s surface is #covered# by oceans.'),
  _cw('The company #increased# its profits by twenty percent last year.'),
  _cw('The study #suggests# that sleep plays a key role in forming memories.'),
  _cw('Honeybees play an #important# role in pollinating food crops.'),
  _cw('The #temperature# of seawater generally decreases with depth.'),
  _cw('The government #introduced# new laws to protect endangered species.'),
  _cw('Light from the Sun #takes# about eight minutes to reach the Earth.'),
  _cw(
    'Young children #acquire# their first language without formal instruction.',
  ),
  _cw('The ancient city was #abandoned# after a long series of droughts.'),
  _cw(
    'Electric cars produce no #exhaust# emissions while they are being driven.',
  ),
  _cw('Rainforests are home to a wide #variety# of plant and animal species.'),
  _cw(
    'The results of the survey were #published# in a leading scientific journal.',
  ),
  _cw(
    'Copper is widely used in wiring because it #conducts# electricity well.',
  ),
  _cw('The #majority# of participants preferred the second option.'),
  _cw('Insects #account# for more than half of all known animal species.'),
  _cw('The professor asked students to #summarize# the article in 200 words.', [
    'summarise',
  ]),
  _cw(
    'Languages #change# gradually as new words are borrowed and old ones disappear.',
  ),
  _cw('A balanced diet should #include# fruit, vegetables, and whole grains.'),
  _cw(
    'Glaciers carved deep valleys as they #moved# slowly across the landscape.',
  ),
];

// ---------------------------------------------------------------------------
// 4. PTE — Reading: Fill in the Blanks
// ---------------------------------------------------------------------------

McqQuestion _fb(String text, List<String> options) => McqQuestion(
  question: {
    'id': 'Pilih kata yang paling tepat untuk rumpang: $text',
    'en': 'Choose the best word for the gap: $text',
  },
  options: options,
  answer: 0,
);

final List<McqQuestion> pteReadingFillBlanks = [
  _fb(
    'Over the past century, average life expectancy has risen dramatically in most countries. This improvement is largely ____ to better sanitation, vaccination programmes, and access to clean drinking water, rather than to advances in hospital treatment alone. Public health measures, though often less visible than medical breakthroughs, have saved millions of lives.',
    ['attributable', 'responsible', 'resulting', 'causing'],
  ),
  _fb(
    'Many universities now require students to complete an internship before graduating. Supporters argue that work placements give students practical experience and help them ____ connections with potential employers. Critics, however, point out that unpaid internships may disadvantage students from low-income families who cannot afford to work without pay.',
    ['establish', 'reach', 'occupy', 'perform'],
  ),
  _fb(
    'The Amazon rainforest plays a crucial role in regulating the global climate. Through photosynthesis, its trees absorb vast quantities of carbon dioxide, while the moisture they release ____ rainfall patterns across much of South America. Scientists warn that continued deforestation could push parts of the forest past a tipping point.',
    ['influences', 'depends', 'consists', 'results'],
  ),
  _fb(
    'Although the first antibiotics were hailed as miracle drugs, their widespread use has led to a serious problem. Bacteria that survive treatment can pass on genes that make them resistant, and over time resistant strains become more ____. Health authorities therefore urge doctors to prescribe antibiotics only when they are genuinely necessary.',
    ['common', 'commonly', 'commonness', 'commoner'],
  ),
  _fb(
    'The Industrial Revolution, which began in Britain in the late eighteenth century, transformed the way goods were produced. Machines powered by water and later by steam ____ many tasks previously done by hand, and workers increasingly moved from rural villages to rapidly growing industrial towns in search of employment.',
    ['took over', 'took off', 'took after', 'took in'],
  ),
  _fb(
    'Sleep is essential for learning. During deep sleep, the brain appears to replay and strengthen memories formed during the day. In one study, participants who slept after learning a list of words recalled significantly more of them than those who stayed awake, ____ both groups had studied for exactly the same length of time.',
    ['even though', 'despite', 'because of', 'so that'],
  ),
  _fb(
    'Urban planners increasingly recognise the value of green spaces. Parks and tree-lined streets not only improve air quality and reduce temperatures but also have measurable ____ on residents\' mental health, lowering stress and encouraging physical activity. Consequently, many cities now set targets for the proportion of land devoted to parks.',
    ['effects', 'affects', 'affections', 'effective'],
  ),
  _fb(
    'The invention of the telescope in the early seventeenth century revolutionised astronomy. When Galileo turned his instrument towards the sky in 1609 and 1610, he observed mountains on the Moon and four moons orbiting Jupiter. These observations provided strong evidence ____ the view that every celestial body revolved around the Earth.',
    ['against', 'with', 'about', 'among'],
  ),
  _fb(
    'Bilingual children sometimes mix words from both of their languages in a single sentence. Parents occasionally worry that this indicates confusion, but linguists generally regard it as a normal and even sophisticated ____ of language development. This code-switching follows grammatical rules and tends to decrease as vocabulary in each language grows.',
    ['feature', 'reason', 'damage', 'method'],
  ),
  _fb(
    'Inflation can be particularly harmful to people living on fixed incomes, such as pensioners. When prices rise faster than their income, their purchasing power ____, and they may struggle to afford basic necessities like food and housing. For this reason, some governments link pension payments to the consumer price index.',
    ['declines', 'declining', 'decline', 'to decline'],
  ),
  _fb(
    'Coral reefs are sometimes called the rainforests of the sea because of their extraordinary biodiversity. Although they occupy only a tiny fraction of the ocean floor, they provide food and ____ for an estimated quarter of all marine species, making their protection a high priority for conservationists around the world.',
    ['shelter', 'climate', 'currency', 'distance'],
  ),
  _fb(
    'The printing press made books far cheaper to produce than hand-copied manuscripts. As a ____, literacy rates in many parts of Europe rose steadily over the following centuries, and ideas could circulate among a much wider audience than ever before. Scholars could also compare identical copies of the same text.',
    ['result', 'reason', 'cause', 'effect'],
  ),
  _fb(
    'Researchers studying migration have found that economic factors are not the only reason people leave their home countries. Conflict, environmental change, and the desire to ____ family members who have already moved abroad are also significant motivations. Understanding these factors helps governments design more effective migration policies.',
    ['join', 'combine', 'attach', 'enrol'],
  ),
  _fb(
    'Desalination plants remove salt from seawater to produce drinking water. Although the technology is well established, it ____ large amounts of energy, which makes it expensive and can increase greenhouse gas emissions if the power comes from fossil fuels. Engineers are therefore developing more efficient membranes.',
    ['consumes', 'contains', 'includes', 'possesses'],
  ),
  _fb(
    'Many early human societies were nomadic, moving from place to place in search of food. The development of agriculture around 10,000 years ago allowed people to settle in one ____, which eventually led to the growth of permanent villages, towns, and complex civilisations with specialised occupations.',
    ['location', 'condition', 'situation', 'direction'],
  ),
  _fb(
    'The human brain contains roughly 86 billion neurons, each of which can form thousands of connections with other neurons. ____ this enormous complexity, scientists have made remarkable progress in mapping how different regions of the brain contribute to functions such as vision, language, and memory.',
    ['Despite', 'Although', 'However', 'Because'],
  ),
  _fb(
    'Volcanic soils are often extremely fertile because they are rich in minerals such as potassium and phosphorus. This explains why densely populated farming communities are frequently found on the slopes of active volcanoes, ____ the obvious risks of living so close to them.',
    ['in spite of', 'because of', 'instead of', 'in case of'],
  ),
  _fb(
    'Online learning expanded rapidly during the COVID-19 pandemic. While it offered flexibility, studies found that many students struggled with ____ and found it difficult to stay motivated without face-to-face contact with teachers and classmates. Many institutions have since adopted blended approaches.',
    ['isolation', 'isolate', 'isolated', 'isolates'],
  ),
  _fb(
    'Photosynthesis takes place mainly in the leaves of plants, inside small structures called chloroplasts. These contain a green pigment called chlorophyll, which ____ light energy, particularly from the red and blue parts of the spectrum. Green light is largely reflected, which is why most leaves appear green.',
    ['absorbs', 'absorb', 'absorbing', 'to absorb'],
  ),
  _fb(
    'Economists distinguish between goods that are rivalrous and those that are not. If one person eats an apple, no one else can eat it; however, one person\'s use of a public radio broadcast does not ____ anyone else\'s ability to listen to it. Such non-rival goods are often provided by governments.',
    ['reduce', 'lower down', 'decrease of', 'diminish to'],
  ),
  _fb(
    'The Great Wall of China was not built as a single structure. It ____ of many walls constructed by different dynasties over roughly two thousand years, some of which were later connected and reinforced, particularly during the Ming dynasty, when much of the surviving brick wall was built.',
    ['consists', 'comprises', 'contains', 'includes'],
  ),
  _fb(
    'Ice cores drilled from Antarctica provide a remarkable record of the Earth\'s past climate. Tiny bubbles of air trapped in the ice preserve samples of the ancient atmosphere, allowing scientists to measure carbon dioxide levels ____ back more than 800,000 years and compare them with today\'s levels.',
    ['stretching', 'stretched', 'to stretch', 'stretches'],
  ),
  _fb(
    'Social media platforms use algorithms to decide which posts each user sees. Because these systems are designed to maximise engagement, they tend to ____ content that provokes strong emotional reactions, which critics argue can contribute to the spread of misinformation and to political polarisation.',
    ['prioritise', 'prioritising', 'priority', 'prior'],
  ),
  _fb(
    'The discovery of penicillin in 1928 is often described as an accident. Alexander Fleming noticed that a mould had contaminated one of his bacterial cultures and that the bacteria surrounding it had been killed. However, it was more than a decade ____ penicillin could be produced in quantities large enough to treat patients.',
    ['before', 'after', 'since', 'when'],
  ),
  _fb(
    'Tropical cyclones form over warm ocean waters, typically where the surface temperature exceeds about 26 degrees Celsius. As warm, moist air rises, it cools and releases heat, which ____ the storm and allows it to grow stronger. When a cyclone moves over land, it loses this energy source and weakens.',
    ['fuels', 'burns', 'consumes', 'extinguishes'],
  ),
  _fb(
    'Many languages around the world are endangered. Linguists estimate that nearly half of the roughly 7,000 languages spoken today may disappear by the end of this century, as younger generations ____ to more widely used national or global languages in education, work, and daily life.',
    ['switch', 'turn off', 'convert into', 'exchange'],
  ),
  _fb(
    'Remote sensing satellites allow scientists to monitor changes in forest cover across entire continents. By comparing images taken at different times, researchers can identify areas where trees have been cleared and ____ the rate of deforestation with considerable accuracy, even in remote regions.',
    ['estimate', 'reckon on', 'imagine', 'assume'],
  ),
  _fb(
    'The placebo effect occurs when patients experience real improvements after receiving a treatment that contains no active ingredient. Its strength suggests that patients\' ____ can significantly influence how they perceive symptoms such as pain. For this reason, new drugs are normally compared with placebos in clinical trials.',
    ['expectations', 'expect', 'expected', 'expecting'],
  ),
  _fb(
    'Recycling aluminium requires only about five percent of the energy needed to produce new aluminium from raw ore. Because the metal can be recycled repeatedly without losing quality, it is one of the most ____ materials in terms of resource efficiency, and recycling rates for drinks cans are high in many countries.',
    ['sustainable', 'sustained', 'sustaining', 'sustain'],
  ),
  _fb(
    'Archaeologists use a variety of methods to date ancient objects. Radiocarbon dating, for example, measures the decay of carbon-14, a radioactive isotope found in all living organisms. For this reason, it can only be ____ to materials that were once alive, such as wood, bone, or cloth.',
    ['applied', 'used', 'made', 'put'],
  ),
  _fb(
    'Wind power has become one of the cheapest sources of new electricity in many countries. Its main drawback is that output ____ with weather conditions, so electricity grids that rely heavily on wind must also invest in energy storage, flexible demand, or backup generation.',
    ['varies', 'various', 'variety', 'variable'],
  ),
  _fb(
    'Some psychologists argue that intelligence cannot be ____ by a single number. Howard Gardner, for instance, proposed that people possess several distinct intelligences, including linguistic, musical, and interpersonal abilities, which conventional IQ tests largely ignore. His theory remains popular among teachers, although many researchers question it.',
    ['captured', 'arrested', 'seized', 'trapped'],
  ),
  _fb(
    'Before the invention of refrigeration, people relied on a range of techniques to ____ food, including drying, salting, smoking, and fermenting. Many of these methods remain popular today, not because they are necessary but because of the distinctive flavours they produce.',
    ['preserve', 'reserve', 'deserve', 'observe'],
  ),
];

// ---------------------------------------------------------------------------
// 5. PTE — Reorder Paragraphs
// ---------------------------------------------------------------------------

const Map<String, String> _roPrompt = {
  'id': 'Susun kalimat menjadi paragraf yang runtut.',
  'en': 'Put the sentences in the correct order.',
};

OrderItem _ro(List<String> pieces) =>
    OrderItem(prompt: _roPrompt, pieces: pieces, joiner: '');

final List<OrderItem> pteReorder = [
  _ro([
    'The honeybee communicates the location of food through a remarkable behaviour known as the waggle dance.',
    'When a forager returns to the hive, it moves in a figure-of-eight pattern while vibrating its abdomen.',
    'The angle of this movement relative to the vertical indicates the direction of the food in relation to the sun.',
    'Meanwhile, the duration of the waggling tells the other bees how far away the source is.',
    'Using this information, its nestmates can fly directly to flowers they have never visited.',
  ]),
  _ro([
    'In 1799, French soldiers in Egypt discovered a stone slab carved with the same text in three scripts.',
    'Two of these were Egyptian scripts, hieroglyphic and demotic, while the third was ancient Greek.',
    'Because scholars could read the Greek, the stone offered a key to the long-forgotten hieroglyphs.',
    'Even so, it took more than twenty years of study before Jean-Francois Champollion announced his breakthrough in 1822.',
  ]),
  _ro([
    'The water cycle begins when the sun heats water in oceans, lakes, and rivers.',
    'As a result, some of this water evaporates and rises into the atmosphere as vapour.',
    'Higher up, the vapour cools and condenses into tiny droplets that form clouds.',
    'When these droplets combine and become too heavy, they fall back to the ground as precipitation.',
    'Finally, the water flows into rivers or soaks into the ground, and the cycle starts again.',
  ]),
  _ro([
    'A team of researchers wanted to know whether background music affects concentration.',
    'To find out, they asked 120 students to complete a reading test in one of three conditions.',
    'One group worked in silence, a second listened to instrumental music, and a third heard songs with lyrics.',
    'The results showed that the students who heard lyrics performed noticeably worse than the others.',
    'The researchers concluded that it is language in music, rather than music itself, that disrupts reading.',
  ]),
  _ro([
    'Tea was first consumed in China, where it was initially valued as a medicine.',
    'By the time of the Tang dynasty, however, it had become a popular everyday drink.',
    'Many centuries later, Dutch traders brought it to Europe in the early seventeenth century.',
    'At first it was so expensive that only wealthy households could afford it.',
    'As imports grew and prices fell, tea gradually became the national drink of Britain.',
  ]),
  _ro([
    'Last year, a small Indonesian start-up developed an app that helps farmers predict crop prices.',
    'Initially, the company offered the service free of charge to attract users.',
    'Within six months, more than 50,000 farmers had downloaded it.',
    'This rapid growth caught the attention of several investors.',
    'With their funding, the start-up now plans to expand into neighbouring countries.',
  ]),
  _ro([
    'In the late eighteenth century, smallpox was one of the deadliest diseases in Europe.',
    'The English doctor Edward Jenner noticed that milkmaids who had caught cowpox seemed to be protected from it.',
    'In 1796, he tested this idea by infecting a young boy with material from a cowpox sore.',
    'When the boy was later exposed to smallpox, he did not become ill.',
    'Jenner\'s method, which became known as vaccination, eventually led to the global eradication of smallpox in 1980.',
  ]),
  _ro([
    'Remote work has become far more common since 2020.',
    'Supporters point out that it saves employees hours of commuting each week.',
    'It also allows companies to hire talented staff regardless of where they live.',
    'On the other hand, some managers worry that it weakens teamwork and makes training new staff harder.',
    'For these reasons, many organisations are now adopting a hybrid model that combines both approaches.',
  ]),
  _ro([
    'Earthquakes occur when stress builds up along a fault in the Earth\'s crust.',
    'The rocks on either side of the fault are locked together by friction.',
    'Over time, the slow movement of tectonic plates causes strain to accumulate in these rocks.',
    'Eventually, the stress overcomes the friction, and the rocks slip suddenly.',
    'This sudden movement releases energy in the form of seismic waves.',
  ]),
  _ro([
    'The Library of Alexandria was founded in Egypt in the third century BCE.',
    'Its aim was to collect a copy of every important book in the known world.',
    'To achieve this, ships arriving in the city were reportedly searched for scrolls, which were then copied for the library.',
    'Despite its fame, the library declined gradually over several centuries rather than being destroyed in a single fire.',
  ]),
  _ro([
    'Recycling plastic bottles involves several stages.',
    'First, the bottles are collected and sorted by type of plastic.',
    'Next, they are washed to remove labels, glue, and any remaining liquid.',
    'The clean plastic is then shredded into small flakes and melted down.',
    'Finally, the melted material is formed into pellets that manufacturers can use to make new products.',
  ]),
  _ro([
    'In 1831, the young naturalist Charles Darwin joined a survey voyage aboard HMS Beagle.',
    'During the five-year journey, he collected thousands of specimens of plants, animals, and fossils.',
    'Among the most famous were birds from the Galapagos Islands, whose beaks differed from island to island.',
    'These observations later helped him develop his theory of evolution by natural selection.',
    'He finally published the theory in 1859 in On the Origin of Species.',
  ]),
  _ro([
    'Many people struggle to fall asleep at night.',
    'One common cause is exposure to bright screens shortly before bedtime.',
    'The blue light these devices emit suppresses melatonin, a hormone that signals the body to sleep.',
    'Experts therefore recommend switching off phones and computers at least an hour before going to bed.',
  ]),
  _ro([
    'In 1950, less than a third of the world\'s population lived in cities.',
    'Since then, the proportion has risen steadily as people have moved from rural areas in search of work.',
    'By 2007, for the first time in history, urban residents outnumbered rural ones.',
    'The United Nations projects that this figure will reach about two-thirds by 2050.',
    'Such rapid growth creates major challenges for housing, transport, and public services.',
  ]),
  _ro([
    'Vaccines work by training the immune system to recognise a particular pathogen.',
    'They contain a harmless version or part of the pathogen, such as an inactivated virus or a single protein.',
    'When this is introduced into the body, the immune system responds by producing antibodies.',
    'It also creates memory cells that can remain in the body for years.',
    'If the real pathogen appears later, these cells allow the body to respond quickly before serious illness develops.',
  ]),
  _ro([
    'The idea of a canal across Central America was discussed for centuries before construction began.',
    'A French company made the first serious attempt in the 1880s.',
    'However, the project was abandoned after thousands of workers died from malaria and yellow fever.',
    'The United States took over the work in 1904 and introduced strict measures to control mosquitoes.',
    'The Panama Canal finally opened in 1914, greatly shortening voyages between the Atlantic and Pacific.',
  ]),
  _ro([
    'A recent survey asked 2,000 university students how they prepare for examinations.',
    'The majority said that they mainly reread their notes and textbooks.',
    'Far fewer reported testing themselves with practice questions.',
    'This is surprising, since research shows that self-testing is one of the most effective study strategies.',
    'The authors therefore suggest that universities should teach students how to study more effectively.',
  ]),
  _ro([
    'Groundwater is stored in underground layers of rock and sediment called aquifers.',
    'In many dry regions, it provides most of the water used for drinking and farming.',
    'However, when it is pumped out faster than rain can replace it, the water table falls.',
    'In some coastal cities, this has caused the land above to sink, increasing the risk of flooding.',
  ]),
  _ro([
    'Marie Sklodowska was born in Warsaw in 1867, at a time when women could not attend university there.',
    'In 1891, she moved to Paris to study physics and mathematics at the Sorbonne.',
    'There she met Pierre Curie, whom she married in 1895.',
    'Together they discovered two new elements, polonium and radium.',
    'In 1911, she became the first person to win a second Nobel Prize.',
  ]),
  _ro([
    'Writing a good research essay starts with choosing a focused question.',
    'Once the question is clear, the writer should search for relevant and reliable sources.',
    'While reading these sources, it is useful to take notes and record full references.',
    'These notes can then be organised into an outline before the first draft is written.',
    'After drafting, the essay should be revised carefully for both content and language.',
  ]),
  _ro([
    'Cacao trees are native to the tropical forests of Central and South America.',
    'The ancient Maya and Aztecs used their seeds to prepare a bitter, spicy drink.',
    'Spanish explorers brought this drink back to Europe in the sixteenth century, where sugar was added to it.',
    'Solid chocolate bars, however, did not appear until the nineteenth century, after new processing methods were invented.',
  ]),
  _ro([
    'Solar panels convert sunlight directly into electricity using semiconductor materials.',
    'For many years, their high cost limited them to specialised uses such as powering satellites.',
    'Since 2010, however, mass production has caused prices to fall dramatically.',
    'As a result, solar power is now one of the cheapest forms of new electricity in many parts of the world.',
  ]),
];
