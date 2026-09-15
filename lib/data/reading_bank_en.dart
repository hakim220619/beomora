/// Bank bacaan akademik bahasa Inggris untuk bagian Reading ujian
/// (gaya TOEFL iBT / IELTS / PTE Academic). Tiap bacaan 170–230 kata
/// dengan 5 soal: gagasan utama, detail, kosakata dalam konteks,
/// inferensi, dan "yang TIDAK disebut / yang disiratkan penulis".
///
/// Teks soal per bahasa UI (id/en); pilihan jawaban dalam bahasa
/// Inggris. Pilihan PERTAMA pada [_q] selalu jawaban benar — layar
/// ujian yang mengacaknya.
library;

import '../models/exam.dart';
import 'mcq_bank.dart';

McqQuestion _q(String id, String en, List<String> options) =>
    McqQuestion(question: {'id': id, 'en': en}, options: options, answer: 0);

final List<ReadingPassage> readingEnAcademic = [
  ReadingPassage(
    id: 'en_r1',
    title: {'id': 'Pulau Panas Perkotaan', 'en': 'Urban Heat Islands'},
    text:
        'Cities are frequently several degrees warmer than the rural areas '
        'that surround them, a phenomenon known as the urban heat island '
        'effect. The primary cause is the replacement of vegetation and '
        'soil with dark, dense materials such as asphalt and concrete. '
        'These surfaces absorb solar radiation during the day and release '
        'it slowly at night, so temperatures remain elevated long after '
        'sunset. Tall buildings compound the problem by trapping warm air '
        'in narrow streets and blocking the wind that might otherwise '
        'disperse it. Waste heat from vehicles, air conditioners, and '
        'factories adds a further, though smaller, contribution.\n\n'
        'The consequences extend beyond discomfort. Higher temperatures '
        'increase electricity demand for cooling, which in turn raises '
        'emissions from power plants. Heat also speeds up the chemical '
        'reactions that form ground-level ozone, worsening air quality. '
        'During heat waves, the effect can be lethal, particularly for '
        'elderly residents and people without access to air conditioning.\n\n'
        'Planners have responded with a range of mitigation strategies. '
        'Reflective "cool roofs" bounce sunlight back into the atmosphere, '
        'while green roofs and street trees provide shade and cool the air '
        'through evaporation. Some cities have begun coating roads with '
        'light-colored paint. Although none of these measures eliminates '
        'the effect entirely, studies suggest that combining them can lower '
        'peak urban temperatures by two to three degrees Celsius.',
    questions: [
      _q('Apa gagasan utama bacaan ini?', 'What is the passage mainly about?', [
        'The causes, effects, and mitigation of urban heat islands',
        'The history of asphalt and concrete in city construction',
        'How heat waves affect electricity prices',
        'Why rural areas are cooler than they used to be',
      ]),
      _q(
        'Menurut bacaan, mengapa kota tetap panas setelah matahari terbenam?',
        'According to the passage, why do cities stay warm after sunset?',
        [
          'Dark surfaces release absorbed heat slowly',
          'Air conditioners run mostly at night',
          'Wind speeds increase after dark',
          'Street trees stop cooling the air at night',
        ],
      ),
      _q(
        "Kata 'disperse' dalam bacaan paling dekat maknanya dengan",
        "The word 'disperse' in the passage is closest in meaning to",
        ['scatter', 'heat', 'collect', 'measure'],
      ),
      _q(
        'Apa yang dapat disimpulkan tentang orang tanpa AC saat gelombang '
            'panas?',
        'What can be inferred about people without air conditioning during a '
            'heat wave?',
        [
          'They face a higher risk of harm from the heat',
          'They produce more waste heat than others',
          'They usually live in rural areas',
          'They benefit most from cool roofs',
        ],
      ),
      _q(
        'Manakah yang TIDAK disebut sebagai strategi mitigasi?',
        'Which of the following is NOT mentioned as a mitigation strategy?',
        [
          'Restricting the use of private vehicles',
          'Reflective roofing materials',
          'Planting trees along streets',
          'Light-colored coatings on roads',
        ],
      ),
    ],
  ),
  ReadingPassage(
    id: 'en_r2',
    title: {'id': 'Mesin Cetak', 'en': 'The Printing Press'},
    text:
        'Before the middle of the fifteenth century, books in Europe were '
        'copied by hand, a slow and costly process that kept written '
        'knowledge in the possession of monasteries, universities, and the '
        'wealthy. Around 1450, Johannes Gutenberg, a goldsmith from Mainz, '
        'combined several existing technologies, including movable metal '
        'type, oil-based ink, and a modified wine press, into a system that '
        'could produce hundreds of identical pages in a day. His innovation '
        'was not any single component but the way the components worked '
        'together.\n\n'
        'The effects were rapid and far-reaching. Within fifty years, '
        'printing shops operated in more than two hundred European cities, '
        'and an estimated twenty million volumes had been produced. As the '
        'price of books fell, literacy spread beyond the clergy and the '
        'elite. Scholars in different countries could now consult identical '
        'texts, which made it easier to compare findings and identify '
        'errors. This standardization is often credited with accelerating '
        'the scientific revolution.\n\n'
        'The press also had unsettling consequences. Religious authorities '
        'found it difficult to control the circulation of pamphlets, and '
        'the Protestant Reformation spread largely through inexpensive '
        'printed tracts. Governments responded with censorship laws and '
        'licensing systems, with limited success. Historians still debate '
        'how much credit Gutenberg deserves personally, since printing had '
        'existed in China and Korea centuries earlier, but few dispute that '
        'his press transformed European society.',
    questions: [
      _q(
        'Apa tujuan utama bacaan ini?',
        'What is the main purpose of the passage?',
        [
          'To explain how the printing press changed European society',
          'To argue that Gutenberg alone invented printing',
          'To compare European and Asian printing methods',
          'To describe how books were copied by hand',
        ],
      ),
      _q(
        'Menurut bacaan, apa kontribusi utama Gutenberg?',
        "According to the passage, what was Gutenberg's key contribution?",
        [
          'Combining existing technologies into one system',
          'Inventing oil-based ink',
          'Building the first wine press',
          'Founding two hundred printing shops',
        ],
      ),
      _q(
        "Kata 'unsettling' dalam bacaan paling dekat maknanya dengan",
        "The word 'unsettling' in the passage is closest in meaning to",
        ['disturbing', 'profitable', 'temporary', 'predictable'],
      ),
      _q(
        'Apa yang dapat disimpulkan tentang undang-undang sensor setelah '
            'mesin cetak muncul?',
        'What can be inferred about censorship laws after the press appeared?',
        [
          'They did not fully stop the spread of printed material',
          'They were welcomed by printing shops',
          'They ended the Protestant Reformation',
          'They were first introduced in China',
        ],
      ),
      _q(
        'Manakah yang TIDAK disebut sebagai dampak percetakan?',
        'Which of the following is NOT mentioned as an effect of printing?',
        [
          'A decline in the number of universities',
          'Lower book prices',
          'The spread of literacy',
          'Easier comparison of scholarly texts',
        ],
      ),
    ],
  ),
  ReadingPassage(
    id: 'en_r3',
    title: {'id': 'Pemutihan Karang', 'en': 'Coral Bleaching'},
    text:
        'Coral reefs occupy less than one percent of the ocean floor, yet '
        'they support roughly a quarter of all marine species. Their vivid '
        'colors come not from the coral animals themselves but from '
        'microscopic algae that live within their tissues. In exchange for '
        'shelter, the algae supply the coral with up to ninety percent of '
        'its energy through photosynthesis. This partnership, however, is '
        'extremely sensitive to temperature.\n\n'
        'When sea water becomes unusually warm, even by one or two degrees, '
        'the relationship breaks down. Stressed corals expel their algae, '
        'exposing the white calcium carbonate skeleton beneath and giving '
        'the reef a bleached appearance. Bleached coral is not dead; if '
        'conditions return to normal within a few weeks, the algae can '
        'recolonize the tissue. But prolonged heat leaves the coral '
        'starving, and death follows. Mass bleaching events, once rare, '
        'have been recorded on the Great Barrier Reef in 1998, 2002, 2016, '
        '2017, 2020, and 2022.\n\n'
        'Scientists are exploring several responses. Some are identifying '
        'heat-tolerant coral strains and breeding them in nurseries for '
        'transplantation. Others are testing whether shading reefs or '
        'spraying sea water into the air to form reflective clouds can '
        'lower local temperatures. Most researchers agree, however, that '
        'such measures merely buy time. Without a reduction in global '
        'emissions, they warn, reefs as we know them are unlikely to '
        'survive the century.',
    questions: [
      _q('Apa gagasan utama bacaan ini?', 'What is the passage mainly about?', [
        'The causes and effects of coral bleaching and possible responses',
        'How coral reefs formed over millions of years',
        'The economic value of the Great Barrier Reef',
        'Methods for breeding algae in laboratories',
      ]),
      _q(
        'Menurut bacaan, apa yang memberi warna pada karang yang sehat?',
        'According to the passage, what gives healthy coral its color?',
        [
          "Algae living inside the coral's tissue",
          'The calcium carbonate skeleton',
          'Minerals absorbed from sea water',
          'Pigments produced by the coral animal',
        ],
      ),
      _q(
        "Kata 'expel' dalam bacaan paling dekat maknanya dengan",
        "The word 'expel' in the passage is closest in meaning to",
        ['force out', 'feed', 'attract', 'protect'],
      ),
      _q(
        'Apa yang disiratkan bacaan tentang peristiwa pemutihan massal?',
        'What does the passage suggest about mass bleaching events?',
        [
          'They have become more frequent in recent decades',
          'They occur only on the Great Barrier Reef',
          'They always result in the death of the reef',
          'They were first observed in 2016',
        ],
      ),
      _q(
        'Manakah yang TIDAK disebut sebagai respons terhadap pemutihan?',
        'Which of the following is NOT mentioned as a possible response to '
            'bleaching?',
        [
          'Banning fishing near damaged reefs',
          'Breeding heat-tolerant corals',
          'Shading reefs from sunlight',
          'Creating reflective clouds with sea spray',
        ],
      ),
    ],
  ),
  ReadingPassage(
    id: 'en_r4',
    title: {'id': 'Tidur dan Ingatan', 'en': 'Sleep and Memory'},
    text:
        'For much of the twentieth century, sleep was regarded as a passive '
        'state in which the brain simply rested. Research over the past '
        'three decades has overturned this view. It is now clear that the '
        'sleeping brain is highly active and that one of its central tasks '
        'is the consolidation of memory, the process by which fragile new '
        'memories are stabilized and integrated with existing knowledge.\n\n'
        'Sleep is not uniform. It cycles between two broad stages: slow- '
        'wave sleep, characterized by large, synchronized electrical waves, '
        'and rapid eye movement (REM) sleep, during which the brain is '
        'nearly as active as when awake. Experiments suggest the two stages '
        'perform different functions. Slow-wave sleep appears to strengthen '
        'declarative memories, such as facts and events, by replaying '
        'patterns of neural activity that occurred during learning. REM '
        'sleep, by contrast, seems more important for procedural skills and '
        'for emotional processing.\n\n'
        'The practical implications are considerable. Students who study '
        'and then sleep typically recall more the next day than those who '
        'stay awake for the same period. Conversely, a single night of '
        'sleep deprivation can reduce the ability to form new memories by '
        'as much as forty percent. Although researchers still debate the '
        'precise mechanisms, the evidence strongly suggests that cutting '
        'sleep to gain study time is a poor bargain.',
    questions: [
      _q(
        'Apa gagasan utama bacaan ini?',
        'What is the main idea of the passage?',
        [
          'Sleep plays an active role in strengthening memory',
          'REM sleep is more important than slow-wave sleep',
          'Students should study late at night',
          'The brain rests completely during sleep',
        ],
      ),
      _q(
        'Menurut bacaan, tidur gelombang lambat dikaitkan dengan',
        'According to the passage, slow-wave sleep is associated with',
        [
          'large, synchronized electrical waves',
          'brain activity similar to waking',
          'emotional processing',
          'learning procedural skills',
        ],
      ),
      _q(
        "Kata 'fragile' dalam bacaan paling dekat maknanya dengan",
        "The word 'fragile' in the passage is closest in meaning to",
        [
          'easily damaged',
          'recently repeated',
          'extremely detailed',
          'highly emotional',
        ],
      ),
      _q(
        'Apa yang dapat disimpulkan tentang pandangan lama mengenai tidur?',
        'What can be inferred about the earlier view of sleep?',
        [
          'It underestimated how active the brain is during sleep',
          'It was based on studies of REM sleep',
          'It correctly described memory consolidation',
          'It was widely rejected before 1900',
        ],
      ),
      _q(
        'Apa yang disiratkan penulis tentang begadang untuk belajar?',
        'What does the author imply about staying up late to study?',
        [
          'It is likely to be counterproductive',
          'It works better for procedural skills',
          'It is effective before important exams',
          'It improves emotional processing',
        ],
      ),
    ],
  ),
  ReadingPassage(
    id: 'en_r5',
    title: {
      'id': 'Sejarah Perdagangan Teh',
      'en': 'The History of the Tea Trade',
    },
    text:
        'Tea was cultivated in China for more than a thousand years before '
        'it reached Europe. Portuguese traders encountered it in the '
        'sixteenth century, but it was the Dutch who first shipped it '
        'commercially, around 1610. In England, tea remained an expensive '
        'curiosity until the 1660s, when it gained fashionable status at '
        'court. Demand grew steadily, and by the late eighteenth century '
        'the British East India Company was importing millions of pounds '
        'annually, most of it paid for in silver.\n\n'
        'This trade imbalance troubled the British government. China had '
        'little interest in European goods, and silver flowed steadily '
        "eastward. The Company's response was to export opium from its "
        'territories in India to China, in defiance of Chinese law. The '
        'resulting conflict, the First Opium War of 1839 to 1842, ended '
        'with China forced to open additional ports to foreign trade.\n\n'
        "Meanwhile, the British sought to break China's monopoly on "
        'production. In 1848, the botanist Robert Fortune traveled through '
        'China in disguise, collecting thousands of seedlings and '
        'recruiting experienced workers. These were transported to '
        'plantations in northern India, where the climate proved suitable. '
        'Within a few decades, India and Ceylon had become major producers, '
        'and tea had shifted from a luxury to an everyday drink for '
        'millions of ordinary people.',
    questions: [
      _q('Apa gagasan utama bacaan ini?', 'What is the passage mainly about?', [
        'How tea moved from a Chinese product to a global commodity',
        'Why the Dutch dominated the tea trade',
        'The health benefits of drinking tea',
        'How tea is grown and processed in India',
      ]),
      _q(
        'Menurut bacaan, bagaimana Inggris membayar sebagian besar tehnya '
            'pada abad ke-18?',
        'According to the passage, how did Britain pay for most of its tea in '
            'the eighteenth century?',
        [
          'With silver',
          'With opium',
          'With manufactured goods',
          'With Indian cotton',
        ],
      ),
      _q(
        "Kata 'defiance' dalam bacaan paling dekat maknanya dengan",
        "The word 'defiance' in the passage is closest in meaning to",
        [
          'open disobedience',
          'careful observance',
          'quiet approval',
          'partial payment',
        ],
      ),
      _q(
        'Apa yang dapat disimpulkan tentang perjalanan Robert Fortune?',
        "What can be inferred about Robert Fortune's journey?",
        [
          'The Chinese would not have permitted it openly',
          'It was sponsored by the Chinese government',
          'It failed to bring any plants to India',
          'It took place before the Opium War',
        ],
      ),
      _q(
        'Manakah yang TIDAK disebutkan dalam bacaan?',
        'Which of the following is NOT mentioned in the passage?',
        [
          'The price of tea in modern India',
          'The role of the Dutch in early tea shipping',
          'The outcome of the First Opium War',
          'Plantations in Ceylon',
        ],
      ),
    ],
  ),
  ReadingPassage(
    id: 'en_r6',
    title: {'id': 'Bioluminesensi', 'en': 'Bioluminescence'},
    text:
        'Bioluminescence, the production of light by living organisms, is '
        'far more common than most people realize. It has evolved '
        'independently at least forty times and occurs in bacteria, fungi, '
        'insects, and a remarkable range of marine animals. In the deep '
        'ocean, where sunlight never penetrates, an estimated three '
        'quarters of all creatures can produce light of their own.\n\n'
        'The chemistry is broadly similar across species. A molecule called '
        'luciferin reacts with oxygen in the presence of an enzyme, '
        'luciferase, releasing energy in the form of light rather than '
        'heat. Because almost no energy is lost as heat, the process is '
        'sometimes described as "cold light." The specific molecules vary '
        'from group to group, which is one reason scientists believe the '
        'ability arose separately so many times.\n\n'
        'Organisms use light for very different purposes. Fireflies flash '
        'in species-specific patterns to attract mates. The anglerfish '
        'dangles a glowing lure in front of its mouth to draw prey within '
        'reach. Some squid release clouds of luminous fluid to confuse '
        'predators, and certain shrimp emit light from their undersides to '
        'match the faint glow filtering down from above, making themselves '
        'invisible to hunters below. Researchers have also put the '
        'phenomenon to work: genes borrowed from jellyfish now allow '
        'biologists to track the activity of cells in living tissue.',
    questions: [
      _q('Apa gagasan utama bacaan ini?', 'What is the passage mainly about?', [
        'The chemistry, diversity, and uses of bioluminescence',
        'Why the deep ocean receives no sunlight',
        'How fireflies choose their mates',
        'The discovery of luciferase by biologists',
      ]),
      _q(
        "Menurut bacaan, mengapa bioluminesensi disebut 'cold light'?",
        "According to the passage, why is bioluminescence called 'cold light'?",
        [
          'Very little energy is released as heat',
          'It occurs only in cold ocean water',
          'It requires low temperatures to function',
          'It is produced by cold-blooded animals',
        ],
      ),
      _q(
        "Kata 'penetrates' dalam bacaan paling dekat maknanya dengan",
        "The word 'penetrates' in the passage is closest in meaning to",
        ['reaches', 'warms', 'reflects', 'fades'],
      ),
      _q(
        'Mengapa ilmuwan yakin bioluminesensi berevolusi secara terpisah '
            'berkali-kali?',
        'Why do scientists believe bioluminescence evolved independently many '
            'times?',
        [
          'Different groups use different light-producing molecules',
          'It is found only in marine animals',
          'All species use exactly the same enzyme',
          'It appears in fossils from a single period',
        ],
      ),
      _q(
        'Kegunaan cahaya manakah yang TIDAK disebutkan dalam bacaan?',
        'Which use of light is NOT mentioned in the passage?',
        [
          'Warning others of approaching danger',
          'Attracting mates',
          'Luring prey',
          'Hiding from predators',
        ],
      ),
    ],
  ),
  ReadingPassage(
    id: 'en_r7',
    title: {
      'id': 'Produktivitas Kerja Jarak Jauh',
      'en': 'Remote Work Productivity',
    },
    text:
        'The rapid shift to remote work in 2020 turned a long-running '
        'debate into a large-scale natural experiment. Before the pandemic, '
        'evidence on whether employees are more productive at home was '
        'limited and mixed. A frequently cited 2015 study of a Chinese '
        'travel agency found that call-center staff who worked from home '
        'handled thirteen percent more calls, largely because they took '
        'fewer breaks and sick days and worked in quieter conditions.\n\n'
        'Subsequent research has painted a more complicated picture. '
        'Studies of knowledge workers, such as programmers, analysts, and '
        'designers, found that individual output often held steady or rose, '
        'but that collaboration suffered. Employees spent more time in '
        'meetings, communication became more fragmented, and the informal '
        'exchanges that spark new ideas declined. One analysis of engineers '
        'found that those working remotely received less feedback from '
        'colleagues and that junior staff, in particular, learned more '
        'slowly.\n\n'
        'Researchers now tend to emphasize that "productivity" is not a '
        'single quantity. Tasks requiring sustained concentration may '
        'benefit from the quiet of home, while tasks requiring coordination '
        'or mentoring may not. Many organizations have therefore settled on '
        'hybrid arrangements, with two or three days in the office each '
        'week. Whether this compromise captures the advantages of both '
        'settings, or dilutes them, remains an open question that '
        'economists are still working to answer.',
    questions: [
      _q(
        'Apa gagasan utama bacaan ini?',
        'What is the main idea of the passage?',
        [
          'Research on remote work shows mixed effects on productivity',
          'Remote work is clearly more productive than office work',
          'Chinese call centers pioneered remote work',
          'Hybrid work has settled the productivity debate',
        ],
      ),
      _q(
        'Menurut bacaan, mengapa staf call center menangani lebih banyak '
            'panggilan di rumah?',
        'According to the passage, why did the call-center staff handle more '
            'calls at home?',
        [
          'They took fewer breaks and worked in quieter conditions',
          'They received more feedback from managers',
          'They attended more meetings',
          'They worked longer shifts',
        ],
      ),
      _q(
        "Kata 'fragmented' dalam bacaan paling dekat maknanya dengan",
        "The word 'fragmented' in the passage is closest in meaning to",
        [
          'broken into pieces',
          'carefully planned',
          'more frequent',
          'highly formal',
        ],
      ),
      _q(
        'Apa yang dapat disimpulkan tentang insinyur junior yang bekerja '
            'jarak jauh?',
        'What can be inferred about junior engineers working remotely?',
        [
          'They may miss informal learning from colleagues',
          'They handled more calls than senior staff',
          'They preferred hybrid arrangements',
          'They produced less individual output',
        ],
      ),
      _q(
        'Apa yang disiratkan penulis tentang pengaturan kerja hibrida?',
        'What does the author imply about hybrid work arrangements?',
        [
          'Their effectiveness has not yet been established',
          'They have been proven to double productivity',
          'They were common before 2020',
          'They eliminate the need for meetings',
        ],
      ),
    ],
  ),
  ReadingPassage(
    id: 'en_r8',
    title: {'id': 'Komunikasi Lebah Madu', 'en': 'Honeybee Communication'},
    text:
        'In 1973 the Austrian zoologist Karl von Frisch shared a Nobel '
        'Prize for decoding one of the most remarkable communication '
        'systems in the animal kingdom: the honeybee "waggle dance." When a '
        'forager returns to the hive after finding a rich source of nectar, '
        'she performs a figure-eight pattern on the vertical surface of the '
        'comb. During the straight central portion of the figure, she '
        'waggles her body rapidly from side to side.\n\n'
        'Von Frisch demonstrated that this dance encodes precise '
        'information. The angle of the straight run relative to vertical '
        'corresponds to the direction of the food source relative to the '
        'sun. A run pointing straight up means "fly toward the sun"; a run '
        'angled thirty degrees to the right means "fly thirty degrees to '
        'the right of the sun." The duration of the waggle indicates '
        'distance: roughly one second of waggling for every kilometer to be '
        'traveled. Bees watching in the darkness of the hive follow the '
        'dancer closely and then depart to search the indicated area.\n\n'
        'Later studies have refined this picture. Dancers adjust for the '
        "sun's movement across the sky even when they have been inside the "
        'hive for hours. The vigor of the dance signals the quality of the '
        'source, and other bees may interrupt a dancer with a brief "stop '
        'signal" if they have encountered danger at the site.',
    questions: [
      _q('Apa gagasan utama bacaan ini?', 'What is the passage mainly about?', [
        'How honeybees communicate the location of food through dance',
        'The life and career of Karl von Frisch',
        'How bees produce honey from nectar',
        'Why bees are attracted to sunlight',
      ]),
      _q(
        'Menurut bacaan, apa yang ditunjukkan oleh durasi goyangan?',
        'According to the passage, what does the duration of the waggle '
            'indicate?',
        [
          'The distance to the food source',
          'The direction of the food source',
          'The time of day',
          'The number of flowers found',
        ],
      ),
      _q(
        "Kata 'vigor' dalam bacaan paling dekat maknanya dengan",
        "The word 'vigor' in the passage is closest in meaning to",
        ['energy', 'length', 'silence', 'angle'],
      ),
      _q(
        'Apa yang dapat disimpulkan tentang lebah yang sudah berjam-jam di '
            'dalam sarang?',
        'What can be inferred about bees that have been in the hive for '
            'several hours?',
        [
          'They can still indicate direction accurately',
          'They forget the location of the food',
          'They are unable to dance',
          'They rely on stop signals to navigate',
        ],
      ),
      _q(
        'Manakah yang TIDAK disebutkan dalam bacaan?',
        'Which of the following is NOT mentioned in the passage?',
        [
          'The distance bees can travel in one day',
          'The shape of the dance pattern',
          'How direction is encoded',
          'Signals that interrupt a dancer',
        ],
      ),
    ],
  ),
  ReadingPassage(
    id: 'en_r9',
    title: {'id': 'Mekanisme Antikythera', 'en': 'The Antikythera Mechanism'},
    text:
        'In 1901, divers salvaging a Roman-era shipwreck off the Greek '
        'island of Antikythera recovered a lump of corroded bronze that at '
        'first attracted little attention. Only when it cracked open, '
        'revealing a set of finely cut gear wheels, did scholars realize '
        'they had found something extraordinary. The Antikythera mechanism, '
        'as it came to be known, is now recognized as the oldest known '
        'analog computer, dating from roughly the second century BCE.\n\n'
        "For decades, the device's purpose was disputed. Some researchers "
        'suggested it was a navigational instrument or even an elaborate '
        'toy. The breakthrough came in the early 2000s, when high- '
        'resolution X-ray imaging allowed scientists to see inside the '
        'fragments without damaging them. The scans revealed more than '
        'thirty interlocking gears and thousands of tiny inscribed '
        "characters, effectively a user's manual. It became clear that the "
        'mechanism modeled the movements of the sun, moon, and probably the '
        'five planets known to the ancient Greeks. Turning a hand crank '
        'advanced the dials, predicting eclipses and tracking the four-year '
        'cycle of the Olympic Games.\n\n'
        'The technical sophistication is startling. One gear train '
        "reproduces the moon's variable speed across the sky using an "
        'ingenious pin-and-slot arrangement. Nothing of comparable '
        'complexity appears in the historical record for more than a '
        'thousand years afterward, raising the question of how such '
        'knowledge was lost.',
    questions: [
      _q('Apa gagasan utama bacaan ini?', 'What is the passage mainly about?', [
        'The discovery and decoding of an ancient astronomical device',
        'Techniques used by Roman shipbuilders',
        'The history of the Olympic Games',
        'How X-ray imaging was invented',
      ]),
      _q(
        'Menurut bacaan, apa yang memungkinkan ilmuwan memahami alat itu pada '
            '2000-an?',
        'According to the passage, what allowed scientists to understand the '
            'device in the 2000s?',
        [
          'X-ray imaging that showed its interior',
          'Cracking the fragments open by hand',
          'A written manual found on the ship',
          'Rebuilding it from new bronze',
        ],
      ),
      _q(
        "Kata 'ingenious' dalam bacaan paling dekat maknanya dengan",
        "The word 'ingenious' in the passage is closest in meaning to",
        [
          'cleverly designed',
          'extremely old',
          'poorly preserved',
          'widely copied',
        ],
      ),
      _q(
        'Apa yang disiratkan bacaan tentang teknologi setelah mekanisme itu '
            'dibuat?',
        'What does the passage suggest about technology after the mechanism '
            'was made?',
        [
          'Similar complexity did not reappear for over a millennium',
          'It advanced rapidly in the Roman period',
          'Toys became more sophisticated',
          'Bronze gears became common on ships',
        ],
      ),
      _q(
        'Fungsi mekanisme manakah yang TIDAK disebutkan?',
        'Which function of the mechanism is NOT mentioned?',
        [
          'Measuring the depth of the sea',
          'Predicting eclipses',
          'Tracking the Olympic cycle',
          "Modeling the moon's movement",
        ],
      ),
    ],
  ),
  ReadingPassage(
    id: 'en_r10',
    title: {'id': 'Mikroplastik', 'en': 'Microplastics'},
    text:
        'Microplastics are plastic particles smaller than five millimeters. '
        'Some are manufactured at that size, such as the beads once common '
        'in cosmetics, but most are fragments of larger items, including '
        'bottles, bags, fishing nets, and synthetic clothing, broken down '
        'by sunlight, waves, and abrasion. Because plastic does not '
        'biodegrade in any meaningful timeframe, these fragments simply '
        'become smaller and more numerous.\n\n'
        'Their distribution is now global. Microplastics have been found in '
        'Arctic sea ice, on the floor of the deepest ocean trenches, and in '
        'rainwater falling on remote mountain ranges. They are ingested by '
        'plankton, shellfish, fish, and seabirds, and they pass up the food '
        'chain. Studies have detected them in human blood, lungs, and '
        'placental tissue. Synthetic textiles are a major source: a single '
        'load of laundry can release hundreds of thousands of fibers into '
        'wastewater, many of which escape treatment plants.\n\n'
        'The health consequences remain uncertain. Laboratory experiments '
        'show that particles can cause inflammation in animal tissue and '
        'that they carry chemical additives and absorbed pollutants. '
        'Whether current exposure levels harm humans, however, has not been '
        'established, in part because reliable methods for measuring the '
        'smallest particles are still being developed. Policymakers face a '
        'familiar dilemma: waiting for conclusive evidence risks allowing a '
        'problem to grow, while acting early may impose costs that later '
        'prove unnecessary.',
    questions: [
      _q('Apa gagasan utama bacaan ini?', 'What is the passage mainly about?', [
        'The sources, spread, and uncertain effects of microplastics',
        'Why cosmetics companies stopped using plastic beads',
        'How wastewater treatment plants operate',
        'The chemistry of biodegradable plastics',
      ]),
      _q(
        'Menurut bacaan, dari mana sebagian besar mikroplastik berasal?',
        'According to the passage, where do most microplastics come from?',
        [
          'Larger plastic items breaking into fragments',
          'Beads manufactured for cosmetics',
          'Arctic sea ice',
          'Chemical additives in food',
        ],
      ),
      _q(
        "Kata 'ingested' dalam bacaan paling dekat maknanya dengan",
        "The word 'ingested' in the passage is closest in meaning to",
        ['swallowed', 'produced', 'avoided', 'observed'],
      ),
      _q(
        'Apa yang dapat disimpulkan tentang instalasi pengolahan air limbah?',
        'What can be inferred about wastewater treatment plants?',
        [
          'They do not remove all plastic fibers',
          'They are the main source of microplastics',
          'They release chemical additives into rivers',
          'They have eliminated fibers from laundry',
        ],
      ),
      _q(
        'Apa yang disiratkan penulis tentang para pembuat kebijakan?',
        'What does the author imply about policymakers?',
        [
          'They must decide without complete evidence',
          'They have already solved the problem',
          'They should wait for conclusive proof',
          'They are mainly concerned with costs',
        ],
      ),
    ],
  ),
];
