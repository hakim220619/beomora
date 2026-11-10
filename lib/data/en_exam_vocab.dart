// Kosakata ujian bahasa Inggris — tampil di depan daftar Kosakata
// kursus Inggris, seperti JLPT di kursus Jepang. DIBUAT OTOMATIS oleh
// tool/gen_en_exam_vocab.py; jangan edit manual.
// `pron` = panduan baca gaya Indonesia, sama seperti topik kosakata
// Inggris lain di study_guides.dart.
class EVocab {
  final String word;
  final String pron;
  final Map<String, String> meaning; // {'id':.., 'en':..}
  /// Indeks grup di `<daftar>Groups` (judul bagian di halaman Materi);
  /// 0 untuk daftar tanpa grup.
  final int group;
  const EVocab(this.word, this.pron, this.meaning, [this.group = 0]);
}

/// Akademik (TOEFL · IELTS · PTE): Academic Word List + tambahan.
const List<EVocab> academicVocab = [
  EVocab('analyze', 'e-ne-laiz', {'id': 'menganalisis', 'en': 'to examine'}),
  EVocab('approach', 'e-prouc', {
    'id': 'pendekatan; mendekati',
    'en': 'way of dealing with something',
  }),
  EVocab('area', 'e-ri-ya', {'id': 'area; wilayah', 'en': 'zone; field'}),
  EVocab('assess', 'e-ses', {'id': 'menilai', 'en': 'to evaluate'}),
  EVocab('assume', 'e-syum', {
    'id': 'menganggap; berasumsi',
    'en': 'to suppose',
  }),
  EVocab('authority', 'o-tho-ri-ti', {
    'id': 'otoritas; wewenang',
    'en': 'power to control',
  }),
  EVocab('available', 'e-vei-le-bel', {'id': 'tersedia', 'en': 'ready to use'}),
  EVocab('benefit', 'be-ne-fit', {'id': 'manfaat', 'en': 'advantage'}),
  EVocab('concept', 'kon-sept', {'id': 'konsep', 'en': 'idea'}),
  EVocab('consist', 'ken-sist', {
    'id': 'terdiri (dari)',
    'en': 'to be made up of',
  }),
  EVocab('constitute', 'kon-sti-tyut', {
    'id': 'membentuk; merupakan',
    'en': 'to make up',
  }),
  EVocab('context', 'kon-tekst', {
    'id': 'konteks',
    'en': 'surrounding situation',
  }),
  EVocab('contract', 'kon-trekt', {
    'id': 'kontrak; perjanjian',
    'en': 'legal agreement',
  }),
  EVocab('create', 'kri-eit', {
    'id': 'menciptakan',
    'en': 'to make something new',
  }),
  EVocab('data', 'dei-ta', {'id': 'data', 'en': 'facts and figures'}),
  EVocab('define', 'di-fain', {
    'id': 'mendefinisikan',
    'en': 'to state the meaning',
  }),
  EVocab('derive', 'di-raiv', {
    'id': 'berasal; memperoleh dari',
    'en': 'to obtain from',
  }),
  EVocab('distribute', 'dis-tri-byut', {
    'id': 'membagikan; mendistribusikan',
    'en': 'to hand out',
  }),
  EVocab('economy', 'i-ko-no-mi', {
    'id': 'ekonomi',
    'en': 'system of money and trade',
  }),
  EVocab('environment', 'en-vai-ren-ment', {
    'id': 'lingkungan',
    'en': 'surroundings',
  }),
  EVocab('establish', 'is-te-blisy', {
    'id': 'mendirikan; menetapkan',
    'en': 'to set up',
  }),
  EVocab('estimate', 'es-ti-meit', {
    'id': 'memperkirakan',
    'en': 'to roughly calculate',
  }),
  EVocab('evident', 'e-vi-dent', {'id': 'jelas terlihat', 'en': 'clear'}),
  EVocab('export', 'eks-port', {'id': 'ekspor', 'en': 'to sell abroad'}),
  EVocab('factor', 'fek-ter', {'id': 'faktor', 'en': 'contributing cause'}),
  EVocab('finance', 'fai-nens', {'id': 'keuangan', 'en': 'money management'}),
  EVocab('formula', 'for-myu-la', {'id': 'rumus', 'en': 'mathematical rule'}),
  EVocab('function', 'fang-syen', {
    'id': 'fungsi',
    'en': 'purpose; working role',
  }),
  EVocab('identify', 'ai-den-ti-fai', {
    'id': 'mengenali; mengidentifikasi',
    'en': 'to recognize',
  }),
  EVocab('income', 'in-kam', {'id': 'pendapatan', 'en': 'money earned'}),
  EVocab('indicate', 'in-di-keit', {
    'id': 'menunjukkan; menandakan',
    'en': 'to point out',
  }),
  EVocab('individual', 'in-di-vi-jyu-el', {
    'id': 'individu; perorangan',
    'en': 'single person',
  }),
  EVocab('interpret', 'in-ter-pret', {
    'id': 'menafsirkan',
    'en': 'to explain the meaning',
  }),
  EVocab('involve', 'in-volv', {
    'id': 'melibatkan',
    'en': 'to include as a part',
  }),
  EVocab('issue', 'i-syu', {'id': 'masalah; isu', 'en': 'matter of concern'}),
  EVocab('labor', 'lei-ber', {
    'id': 'tenaga kerja; kerja keras',
    'en': 'work; workforce',
  }),
  EVocab('legal', 'li-gel', {'id': 'sah menurut hukum', 'en': 'lawful'}),
  EVocab('legislate', 'le-jis-leit', {
    'id': 'membuat undang-undang',
    'en': 'to make laws',
  }),
  EVocab('major', 'mei-jer', {
    'id': 'besar; utama (penting)',
    'en': 'large and important',
  }),
  EVocab('method', 'me-thed', {'id': 'metode; cara', 'en': 'way of doing'}),
  EVocab('occur', 'e-ker', {'id': 'terjadi', 'en': 'to happen'}),
  EVocab('percent', 'per-sent', {'id': 'persen', 'en': 'per hundred'}),
  EVocab('period', 'pi-ri-yed', {'id': 'periode; masa', 'en': 'span of time'}),
  EVocab('policy', 'po-li-si', {
    'id': 'kebijakan',
    'en': 'official plan of action',
  }),
  EVocab('principle', 'prin-si-pel', {'id': 'prinsip', 'en': 'basic rule'}),
  EVocab('proceed', 'pro-sid', {'id': 'melanjutkan', 'en': 'to go on'}),
  EVocab('process', 'pro-ses', {'id': 'proses', 'en': 'series of steps'}),
  EVocab('require', 'ri-kwai-yer', {
    'id': 'membutuhkan; mewajibkan',
    'en': 'to need',
  }),
  EVocab('research', 'ri-serc', {'id': 'penelitian', 'en': 'systematic study'}),
  EVocab('respond', 'ris-pond', {'id': 'menanggapi', 'en': 'to reply'}),
  EVocab('role', 'roul', {'id': 'peran', 'en': 'part played'}),
  EVocab('section', 'sek-syen', {'id': 'bagian', 'en': 'part; division'}),
  EVocab('sector', 'sek-ter', {
    'id': 'sektor; bidang',
    'en': 'area of the economy',
  }),
  EVocab('significant', 'sig-ni-fi-kent', {
    'id': 'penting; berarti',
    'en': 'important',
  }),
  EVocab('similar', 'si-mi-ler', {'id': 'mirip', 'en': 'alike'}),
  EVocab('source', 'sors', {'id': 'sumber', 'en': 'origin'}),
  EVocab('specific', 'spe-si-fik', {
    'id': 'spesifik; khusus',
    'en': 'particular',
  }),
  EVocab('structure', 'strak-cer', {
    'id': 'struktur; susunan',
    'en': 'arrangement of parts',
  }),
  EVocab('theory', 'thi-ri', {'id': 'teori', 'en': 'set of explanatory ideas'}),
  EVocab('vary', 've-ri', {
    'id': 'bervariasi; berbeda-beda',
    'en': 'to differ',
  }),
  EVocab('achieve', 'e-civ', {'id': 'mencapai', 'en': 'to accomplish'}),
  EVocab('acquire', 'e-kwai-yer', {
    'id': 'memperoleh (keahlian/milik)',
    'en': 'to gain',
  }),
  EVocab('administrate', 'ed-mi-nis-treit', {
    'id': 'mengelola (administrasi)',
    'en': 'to manage officially',
  }),
  EVocab('affect', 'e-fekt', {'id': 'memengaruhi', 'en': 'to influence'}),
  EVocab('appropriate', 'e-prou-pri-yet', {
    'id': 'pantas; sesuai',
    'en': 'suitable',
  }),
  EVocab('aspect', 'es-pekt', {'id': 'aspek; segi', 'en': 'side of an issue'}),
  EVocab('assist', 'e-sist', {'id': 'membantu', 'en': 'to help'}),
  EVocab('category', 'ke-te-go-ri', {
    'id': 'kategori; golongan',
    'en': 'class; group',
  }),
  EVocab('chapter', 'cep-ter', {'id': 'bab', 'en': 'book division'}),
  EVocab('commission', 'ke-mi-syen', {
    'id': 'komisi',
    'en': 'official group or fee',
  }),
  EVocab('community', 'ke-myu-ni-ti', {
    'id': 'komunitas; masyarakat',
    'en': 'group of people living together',
  }),
  EVocab('complex', 'kom-pleks', {'id': 'rumit', 'en': 'complicated'}),
  EVocab('compute', 'kem-pyut', {'id': 'menghitung', 'en': 'to calculate'}),
  EVocab('conclude', 'ken-klud', {
    'id': 'menyimpulkan',
    'en': 'to decide finally',
  }),
  EVocab('conduct', 'ken-dakt', {
    'id': 'melakukan; melaksanakan',
    'en': 'to carry out',
  }),
  EVocab('consequent', 'kon-si-kwent', {
    'id': 'yang menyusul sebagai akibat',
    'en': 'following as a result',
  }),
  EVocab('construct', 'ken-strakt', {
    'id': 'membangun; menyusun',
    'en': 'to build',
  }),
  EVocab('consume', 'ken-syum', {'id': 'mengonsumsi', 'en': 'to use up'}),
  EVocab('credit', 'kre-dit', {
    'id': 'kredit; pengakuan',
    'en': 'praise or loan',
  }),
  EVocab('culture', 'kal-cer', {'id': 'budaya', 'en': 'way of life'}),
  EVocab('design', 'di-zain', {
    'id': 'desain; rancangan',
    'en': 'plan or drawing',
  }),
  EVocab('distinct', 'dis-tingkt', {
    'id': 'berbeda jelas',
    'en': 'clearly different',
  }),
  EVocab('element', 'e-le-ment', {'id': 'unsur', 'en': 'basic part'}),
  EVocab('equate', 'i-kweit', {'id': 'menyamakan', 'en': 'to consider equal'}),
  EVocab('evaluate', 'i-ve-lyu-eit', {'id': 'mengevaluasi', 'en': 'to judge'}),
  EVocab('feature', 'fi-cer', {
    'id': 'fitur; ciri penting',
    'en': 'notable part',
  }),
  EVocab('final', 'fai-nel', {'id': 'terakhir', 'en': 'last'}),
  EVocab('focus', 'fou-kes', {
    'id': 'fokus; memusatkan',
    'en': 'center of attention',
  }),
  EVocab('impact', 'im-pekt', {'id': 'dampak', 'en': 'strong effect'}),
  EVocab('injure', 'in-jer', {'id': 'melukai', 'en': 'to hurt'}),
  EVocab('institute', 'ins-ti-tyut', {
    'id': 'lembaga; institut',
    'en': 'organization for research or study',
  }),
  EVocab('invest', 'in-vest', {
    'id': 'berinvestasi; menanamkan modal',
    'en': 'to put money into',
  }),
  EVocab('item', 'ai-tem', {'id': 'barang; butir', 'en': 'single thing'}),
  EVocab('journal', 'jer-nel', {'id': 'jurnal', 'en': 'academic magazine'}),
  EVocab('maintain', 'mein-tein', {
    'id': 'memelihara; merawat',
    'en': 'to keep in good condition',
  }),
  EVocab('normal', 'nor-mel', {'id': 'normal; wajar', 'en': 'usual'}),
  EVocab('obtain', 'ob-tein', {'id': 'memperoleh', 'en': 'to get'}),
  EVocab('participate', 'par-ti-si-peit', {
    'id': 'ikut serta',
    'en': 'to take part',
  }),
  EVocab('perceive', 'per-siv', {
    'id': 'memandang; merasakan',
    'en': 'to notice or regard',
  }),
  EVocab('positive', 'po-zi-tiv', {
    'id': 'positif',
    'en': 'good or affirmative',
  }),
  EVocab('potential', 'po-ten-syel', {
    'id': 'potensi; berpotensi',
    'en': 'possible capacity',
  }),
  EVocab('previous', 'pri-vi-yes', {
    'id': 'yang lalu; terdahulu',
    'en': 'coming before',
  }),
  EVocab('primary', 'prai-me-ri', {'id': 'utama', 'en': 'main'}),
  EVocab('purchase', 'per-ces', {'id': 'membeli', 'en': 'to buy'}),
  EVocab('range', 'reinj', {
    'id': 'kisaran; rentang',
    'en': 'extent between limits',
  }),
  EVocab('region', 'ri-jen', {'id': 'daerah', 'en': 'part of a country'}),
  EVocab('regulate', 're-gyu-leit', {
    'id': 'mengatur',
    'en': 'to control by rules',
  }),
  EVocab('relevant', 're-le-vent', {
    'id': 'relevan; berkaitan',
    'en': 'connected to the matter',
  }),
  EVocab('reside', 'ri-zaid', {'id': 'bertempat tinggal', 'en': 'to dwell'}),
  EVocab('resource', 'ri-sors', {
    'id': 'sumber daya',
    'en': 'supply that can be used',
  }),
  EVocab('restrict', 'ris-trikt', {'id': 'membatasi', 'en': 'to limit'}),
  EVocab('secure', 'si-kyur', {'id': 'aman; mengamankan', 'en': 'safe'}),
  EVocab('seek', 'sik', {'id': 'mencari', 'en': 'to look for'}),
  EVocab('select', 'si-lekt', {'id': 'memilih', 'en': 'to choose'}),
  EVocab('site', 'sait', {'id': 'lokasi; situs', 'en': 'place'}),
  EVocab('strategy', 'stre-te-ji', {
    'id': 'strategi',
    'en': 'plan to reach a goal',
  }),
  EVocab('survey', 'ser-vei', {
    'id': 'survei; meninjau',
    'en': 'questionnaire study',
  }),
  EVocab('text', 'tekst', {'id': 'teks', 'en': 'written words'}),
  EVocab('tradition', 'tre-di-syen', {
    'id': 'tradisi',
    'en': 'long-held custom',
  }),
  EVocab('transfer', 'trens-fer', {
    'id': 'memindahkan; transfer',
    'en': 'to move from one place to another',
  }),
  EVocab('alternative', 'ol-ter-ne-tiv', {
    'id': 'alternatif; pilihan lain',
    'en': 'other option',
  }),
  EVocab('circumstance', 'ser-kem-stens', {
    'id': 'keadaan',
    'en': 'condition; situation',
  }),
  EVocab('comment', 'ko-ment', {'id': 'komentar', 'en': 'remark'}),
  EVocab('compensate', 'kom-pen-seit', {
    'id': 'mengganti rugi; mengimbangi',
    'en': 'to make up for',
  }),
  EVocab('component', 'kem-pou-nent', {
    'id': 'komponen',
    'en': 'part of a whole',
  }),
  EVocab('consent', 'ken-sent', {
    'id': 'persetujuan; izin',
    'en': 'permission',
  }),
  EVocab('considerable', 'ken-si-de-re-bel', {
    'id': 'cukup besar',
    'en': 'fairly large',
  }),
  EVocab('constant', 'kon-stent', {
    'id': 'tetap; terus-menerus',
    'en': 'unchanging',
  }),
  EVocab('constrain', 'ken-strein', {
    'id': 'membatasi (ruang gerak)',
    'en': 'to limit by pressure',
  }),
  EVocab('contribute', 'ken-tri-byut', {
    'id': 'berkontribusi; menyumbang',
    'en': 'to give',
  }),
  EVocab('convene', 'ken-vin', {
    'id': 'mengadakan (rapat)',
    'en': 'to call together',
  }),
  EVocab('coordinate', 'kou-or-di-neit', {
    'id': 'mengoordinasikan',
    'en': 'to organize together',
  }),
  EVocab('core', 'kor', {'id': 'inti', 'en': 'central part'}),
  EVocab('corporate', 'kor-po-ret', {
    'id': 'korporat; milik perusahaan',
    'en': 'of a company',
  }),
  EVocab('correspond', 'ko-res-pond', {
    'id': 'sesuai; berkorespondensi',
    'en': 'to match',
  }),
  EVocab('criteria', 'krai-ti-ri-ya', {
    'id': 'kriteria; tolok ukur',
    'en': 'standards for judging',
  }),
  EVocab('deduce', 'di-dyus', {
    'id': 'menyimpulkan (dari bukti)',
    'en': 'to infer',
  }),
  EVocab('demonstrate', 'de-men-streit', {
    'id': 'menunjukkan; memperagakan',
    'en': 'to show',
  }),
  EVocab('document', 'do-kyu-ment', {'id': 'dokumen', 'en': 'official paper'}),
  EVocab('dominate', 'do-mi-neit', {
    'id': 'mendominasi; menguasai',
    'en': 'to control',
  }),
  EVocab('emphasis', 'em-fe-sis', {
    'id': 'penekanan',
    'en': 'special importance',
  }),
  EVocab('ensure', 'en-syur', {'id': 'memastikan', 'en': 'to make certain'}),
  EVocab('exclude', 'iks-klud', {'id': 'mengecualikan', 'en': 'to leave out'}),
  EVocab('framework', 'freim-werk', {
    'id': 'kerangka kerja',
    'en': 'basic structure',
  }),
  EVocab('fund', 'fand', {'id': 'dana', 'en': 'money for a purpose'}),
  EVocab('illustrate', 'i-les-treit', {
    'id': 'menggambarkan',
    'en': 'to explain with examples',
  }),
  EVocab('immigrate', 'i-mi-greit', {
    'id': 'berimigrasi (masuk ke negara lain)',
    'en': 'to come to live in a new country',
  }),
  EVocab('imply', 'im-plai', {
    'id': 'menyiratkan',
    'en': 'to suggest indirectly',
  }),
  EVocab('initial', 'i-ni-syel', {'id': 'awal', 'en': 'first'}),
  EVocab('instance', 'ins-tens', {'id': 'contoh; kasus', 'en': 'example'}),
  EVocab('interact', 'in-ter-ekt', {
    'id': 'berinteraksi',
    'en': 'to act on each other',
  }),
  EVocab('justify', 'jas-ti-fai', {
    'id': 'membenarkan; memberi alasan',
    'en': 'to give reasons for',
  }),
  EVocab('layer', 'lei-yer', {'id': 'lapisan', 'en': 'level; sheet'}),
  EVocab('link', 'lingk', {'id': 'tautan; menghubungkan', 'en': 'connection'}),
  EVocab('locate', 'lou-keit', {
    'id': 'menemukan letak',
    'en': 'to find the position of',
  }),
  EVocab('maximize', 'mek-si-maiz', {
    'id': 'memaksimalkan',
    'en': 'to make as large as possible',
  }),
  EVocab('minor', 'mai-ner', {
    'id': 'kecil; kurang penting',
    'en': 'less important',
  }),
  EVocab('negate', 'ni-geit', {'id': 'meniadakan', 'en': 'to cancel out'}),
  EVocab('outcome', 'aut-kam', {'id': 'hasil akhir', 'en': 'end result'}),
  EVocab('partner', 'part-ner', {'id': 'mitra; pasangan', 'en': 'associate'}),
  EVocab('philosophy', 'fi-lo-so-fi', {
    'id': 'filsafat',
    'en': 'study of ideas and truth',
  }),
  EVocab('physical', 'fi-zi-kel', {'id': 'fisik', 'en': 'bodily; material'}),
  EVocab('proportion', 'pro-por-syen', {
    'id': 'proporsi; perbandingan',
    'en': 'part relative to the whole',
  }),
  EVocab('publish', 'pab-lisy', {
    'id': 'menerbitkan',
    'en': 'to make public in print',
  }),
  EVocab('react', 'ri-ekt', {'id': 'bereaksi', 'en': 'to act in return'}),
  EVocab('register', 're-jis-ter', {'id': 'mendaftar', 'en': 'to sign up'}),
  EVocab('rely', 'ri-lai', {
    'id': 'bergantung; mengandalkan',
    'en': 'to depend on',
  }),
  EVocab('remove', 'ri-muv', {
    'id': 'menyingkirkan; menghapus',
    'en': 'to take away',
  }),
  EVocab('scheme', 'skim', {'id': 'skema; rencana', 'en': 'organized plan'}),
  EVocab('sequence', 'si-kwens', {'id': 'urutan', 'en': 'order of things'}),
  EVocab('sex', 'seks', {'id': 'jenis kelamin', 'en': 'biological category'}),
  EVocab('shift', 'syift', {
    'id': 'pergeseran; menggeser',
    'en': 'change of position',
  }),
  EVocab('specify', 'spe-si-fai', {'id': 'merinci', 'en': 'to state exactly'}),
  EVocab('sufficient', 'se-fi-syent', {'id': 'cukup', 'en': 'enough'}),
  EVocab('task', 'tesk', {'id': 'tugas', 'en': 'piece of work'}),
  EVocab('technical', 'tek-ni-kel', {
    'id': 'teknis',
    'en': 'relating to machines or methods',
  }),
  EVocab('technique', 'tek-nik', {
    'id': 'teknik; cara khusus',
    'en': 'special skill or method',
  }),
  EVocab('technology', 'tek-no-lo-ji', {
    'id': 'teknologi',
    'en': 'applied science',
  }),
  EVocab('valid', 've-lid', {'id': 'sah; valid', 'en': 'well-founded'}),
  EVocab('volume', 'vo-lyum', {'id': 'volume; isi', 'en': 'amount of space'}),
  EVocab('access', 'ek-ses', {'id': 'akses', 'en': 'way in'}),
  EVocab('adequate', 'e-de-kwet', {'id': 'memadai', 'en': 'satisfactory'}),
  EVocab('annual', 'e-nyu-el', {'id': 'tahunan', 'en': 'yearly'}),
  EVocab('apparent', 'e-pe-rent', {'id': 'tampak jelas', 'en': 'obvious'}),
  EVocab('approximate', 'e-prok-si-met', {
    'id': 'mendekati (perkiraan)',
    'en': 'close but not exact',
  }),
  EVocab('attitude', 'e-ti-tyud', {'id': 'sikap', 'en': 'way of thinking'}),
  EVocab('attribute', 'e-tri-byut', {
    'id': 'menghubungkan (sebab)',
    'en': 'to credit to',
  }),
  EVocab('civil', 'si-vil', {'id': 'sipil', 'en': 'of citizens'}),
  EVocab('code', 'koud', {
    'id': 'kode; aturan',
    'en': 'system of rules or symbols',
  }),
  EVocab('commit', 'ke-mit', {
    'id': 'melakukan (kesalahan); berkomitmen',
    'en': 'to carry out; to pledge',
  }),
  EVocab('communicate', 'ke-myu-ni-keit', {
    'id': 'berkomunikasi',
    'en': 'to share information',
  }),
  EVocab('concentrate', 'kon-sen-treit', {
    'id': 'berkonsentrasi',
    'en': 'to focus attention',
  }),
  EVocab('confer', 'ken-fer', {
    'id': 'berunding; memberikan (gelar)',
    'en': 'to discuss; to award',
  }),
  EVocab('contrast', 'kon-trest', {
    'id': 'kontras; perbedaan mencolok',
    'en': 'striking difference',
  }),
  EVocab('cycle', 'sai-kel', {'id': 'siklus', 'en': 'repeating series'}),
  EVocab('debate', 'di-beit', {'id': 'debat', 'en': 'formal argument'}),
  EVocab('despite', 'dis-pait', {'id': 'meskipun', 'en': 'in spite of'}),
  EVocab('dimension', 'di-men-syen', {
    'id': 'dimensi; ukuran',
    'en': 'measurement; aspect',
  }),
  EVocab('domestic', 'do-mes-tik', {
    'id': 'dalam negeri; rumah tangga',
    'en': 'of the home or country',
  }),
  EVocab('emerge', 'i-merj', {'id': 'muncul', 'en': 'to appear'}),
  EVocab('error', 'e-rer', {'id': 'kesalahan', 'en': 'mistake'}),
  EVocab('ethnic', 'eth-nik', {
    'id': 'etnis; suku',
    'en': 'relating to race or culture',
  }),
  EVocab('goal', 'goul', {'id': 'tujuan', 'en': 'aim'}),
  EVocab('grant', 'grent', {
    'id': 'hibah; mengabulkan',
    'en': 'to give formally',
  }),
  EVocab('hence', 'hens', {'id': 'oleh karena itu', 'en': 'for this reason'}),
  EVocab('hypothesis', 'hai-po-the-sis', {
    'id': 'hipotesis',
    'en': 'testable assumption',
  }),
  EVocab('implement', 'im-ple-ment', {
    'id': 'menerapkan',
    'en': 'to put into action',
  }),
  EVocab('implicate', 'im-pli-keit', {
    'id': 'menyangkutpautkan (dalam kesalahan)',
    'en': 'to show involvement in wrongdoing',
  }),
  EVocab('impose', 'im-pouz', {
    'id': 'memberlakukan; memaksakan',
    'en': 'to force on',
  }),
  EVocab('integrate', 'in-te-greit', {
    'id': 'memadukan; mengintegrasikan',
    'en': 'to combine into a whole',
  }),
  EVocab('internal', 'in-ter-nel', {
    'id': 'internal; bagian dalam',
    'en': 'inside',
  }),
  EVocab('investigate', 'in-ves-ti-geit', {
    'id': 'menyelidiki',
    'en': 'to examine closely',
  }),
  EVocab('job', 'job', {'id': 'pekerjaan', 'en': 'paid work'}),
  EVocab('label', 'lei-bel', {'id': 'label', 'en': 'tag'}),
  EVocab('mechanism', 'me-ke-ni-zem', {
    'id': 'mekanisme',
    'en': 'working system',
  }),
  EVocab('obvious', 'ob-vi-yes', {
    'id': 'sangat jelas; gamblang',
    'en': 'easy to see',
  }),
  EVocab('occupy', 'o-kyu-pai', {'id': 'menempati', 'en': 'to fill a space'}),
  EVocab('option', 'op-syen', {'id': 'pilihan', 'en': 'choice'}),
  EVocab('output', 'aut-put', {
    'id': 'keluaran; hasil produksi',
    'en': 'amount produced',
  }),
  EVocab('overall', 'ou-ver-ol', {
    'id': 'secara keseluruhan',
    'en': 'in general',
  }),
  EVocab('parallel', 'pe-re-lel', {'id': 'sejajar', 'en': 'side by side'}),
  EVocab('parameter', 'pe-re-me-ter', {
    'id': 'parameter; batasan',
    'en': 'measurable limit',
  }),
  EVocab('phase', 'feiz', {'id': 'tahap', 'en': 'stage'}),
  EVocab('predict', 'pri-dikt', {
    'id': 'memprediksi; meramalkan',
    'en': 'to forecast',
  }),
  EVocab('principal', 'prin-si-pel', {
    'id': 'pokok; kepala sekolah',
    'en': 'chief; head of school',
  }),
  EVocab('prior', 'prai-or', {'id': 'sebelumnya', 'en': 'earlier'}),
  EVocab('professional', 'pro-fe-syo-nel', {
    'id': 'profesional',
    'en': 'expert in a job',
  }),
  EVocab('project', 'pro-jekt', {
    'id': 'proyek',
    'en': 'planned piece of work',
  }),
  EVocab('promote', 'pro-mout', {
    'id': 'mempromosikan; memajukan',
    'en': 'to advance',
  }),
  EVocab('regime', 're-zyim', {'id': 'rezim', 'en': 'government system'}),
  EVocab('resolve', 'ri-zolv', {
    'id': 'menyelesaikan (masalah)',
    'en': 'to solve',
  }),
  EVocab('retain', 'ri-tein', {
    'id': 'menahan; tetap menyimpan',
    'en': 'to keep',
  }),
  EVocab('series', 'si-riz', {'id': 'seri; rangkaian', 'en': 'set in order'}),
  EVocab('statistic', 'ste-tis-tik', {
    'id': 'statistik',
    'en': 'numerical fact',
  }),
  EVocab('status', 'stei-tes', {'id': 'status; kedudukan', 'en': 'position'}),
  EVocab('stress', 'stres', {'id': 'tekanan; stres', 'en': 'mental strain'}),
  EVocab('subsequent', 'sab-si-kwent', {'id': 'berikutnya', 'en': 'following'}),
  EVocab('sum', 'sam', {'id': 'jumlah', 'en': 'amount added up'}),
  EVocab('summary', 'sa-me-ri', {'id': 'ringkasan', 'en': 'short version'}),
  EVocab('undertake', 'an-der-teik', {
    'id': 'mengerjakan; menjalankan',
    'en': 'to take on',
  }),
  EVocab('academy', 'e-ke-de-mi', {
    'id': 'akademi',
    'en': 'school for special study',
  }),
  EVocab('adjust', 'e-jast', {
    'id': 'menyetel; menyesuaikan',
    'en': 'to fine-tune',
  }),
  EVocab('alter', 'ol-ter', {'id': 'mengubah', 'en': 'to change'}),
  EVocab('amend', 'e-mend', {
    'id': 'mengamandemen; mengubah (aturan)',
    'en': 'to make changes to a law',
  }),
  EVocab('aware', 'e-wer', {'id': 'sadar', 'en': 'conscious'}),
  EVocab('capacity', 'ke-pe-si-ti', {
    'id': 'kapasitas; daya tampung',
    'en': 'ability to hold',
  }),
  EVocab('challenge', 'ce-lenj', {'id': 'tantangan', 'en': 'difficult task'}),
  EVocab('clause', 'kloz', {
    'id': 'klausa; pasal',
    'en': 'part of a sentence or contract',
  }),
  EVocab('compound', 'kom-paund', {'id': 'senyawa; gabungan', 'en': 'mixture'}),
  EVocab('conflict', 'kon-flikt', {
    'id': 'konflik',
    'en': 'serious disagreement',
  }),
  EVocab('consult', 'ken-salt', {
    'id': 'berkonsultasi',
    'en': 'to seek advice',
  }),
  EVocab('contact', 'kon-tekt', {
    'id': 'kontak; menghubungi',
    'en': 'communication',
  }),
  EVocab('decline', 'di-klain', {'id': 'menurun', 'en': 'to decrease'}),
  EVocab('discrete', 'dis-krit', {
    'id': 'terpisah; tersendiri',
    'en': 'individually distinct',
  }),
  EVocab('draft', 'dreft', {
    'id': 'draf; rancangan awal',
    'en': 'first version',
  }),
  EVocab('enable', 'i-nei-bel', {
    'id': 'memungkinkan',
    'en': 'to make possible',
  }),
  EVocab('energy', 'e-ner-ji', {'id': 'energi', 'en': 'power'}),
  EVocab('enforce', 'en-fors', {
    'id': 'menegakkan (hukum)',
    'en': 'to make people obey',
  }),
  EVocab('entity', 'en-ti-ti', {
    'id': 'entitas; satuan',
    'en': 'thing with its own existence',
  }),
  EVocab('equivalent', 'i-kwi-ve-lent', {
    'id': 'setara',
    'en': 'equal in value',
  }),
  EVocab('evolve', 'i-volv', {
    'id': 'berkembang (bertahap)',
    'en': 'to develop gradually',
  }),
  EVocab('expand', 'iks-pend', {'id': 'memperluas', 'en': 'to grow larger'}),
  EVocab('expose', 'iks-pouz', {
    'id': 'membuka; memaparkan',
    'en': 'to uncover',
  }),
  EVocab('external', 'iks-ter-nel', {'id': 'eksternal; luar', 'en': 'outside'}),
  EVocab('facilitate', 'fe-si-li-teit', {
    'id': 'memudahkan',
    'en': 'to make easier',
  }),
  EVocab('fundamental', 'fan-de-men-tel', {'id': 'mendasar', 'en': 'basic'}),
  EVocab('generate', 'je-ne-reit', {
    'id': 'menghasilkan; membangkitkan',
    'en': 'to create',
  }),
  EVocab('generation', 'je-ne-rei-syen', {
    'id': 'generasi; angkatan',
    'en': 'people born around the same time',
  }),
  EVocab('image', 'i-mij', {'id': 'gambar; citra', 'en': 'picture'}),
  EVocab('liberal', 'li-be-rel', {
    'id': 'liberal; bebas',
    'en': 'open to new ideas',
  }),
  EVocab('license', 'lai-sens', {
    'id': 'izin resmi; lisensi',
    'en': 'official permit',
  }),
  EVocab('logic', 'lo-jik', {'id': 'logika', 'en': 'reasoning'}),
  EVocab('margin', 'mar-jin', {
    'id': 'batas pinggir; selisih',
    'en': 'edge; difference',
  }),
  EVocab('medical', 'me-di-kel', {'id': 'medis', 'en': 'related to medicine'}),
  EVocab('mental', 'men-tel', {'id': 'mental; kejiwaan', 'en': 'of the mind'}),
  EVocab('modify', 'mo-di-fai', {
    'id': 'memodifikasi',
    'en': 'to change slightly',
  }),
  EVocab('monitor', 'mo-ni-ter', {'id': 'memantau', 'en': 'to watch over'}),
  EVocab('network', 'net-werk', {'id': 'jaringan', 'en': 'connected system'}),
  EVocab('notion', 'nou-syen', {'id': 'gagasan; anggapan', 'en': 'belief'}),
  EVocab('objective', 'ob-jek-tiv', {
    'id': 'objektif; tidak memihak',
    'en': 'unbiased',
  }),
  EVocab('orient', 'o-ri-yent', {
    'id': 'mengarahkan',
    'en': 'to direct toward',
  }),
  EVocab('perspective', 'per-spek-tiv', {
    'id': 'sudut pandang',
    'en': 'point of view',
  }),
  EVocab('precise', 'pri-sais', {'id': 'tepat; persis', 'en': 'exact'}),
  EVocab('prime', 'praim', {
    'id': 'paling utama; prima',
    'en': 'first in importance',
  }),
  EVocab('psychology', 'sai-ko-lo-ji', {
    'id': 'psikologi',
    'en': 'study of the mind',
  }),
  EVocab('pursue', 'per-syu', {'id': 'mengejar', 'en': 'to chase'}),
  EVocab('ratio', 'rei-syi-yo', {
    'id': 'rasio',
    'en': 'relation between amounts',
  }),
  EVocab('reject', 'ri-jekt', {'id': 'menolak', 'en': 'to refuse'}),
  EVocab('revenue', 're-ve-nyu', {
    'id': 'pemasukan usaha',
    'en': 'income of an organization',
  }),
  EVocab('stable', 'stei-bel', {'id': 'stabil', 'en': 'steady'}),
  EVocab('style', 'stail', {'id': 'gaya', 'en': 'manner'}),
  EVocab('substitute', 'sab-sti-tyut', {
    'id': 'pengganti; mengganti',
    'en': 'replacement',
  }),
  EVocab('sustain', 'se-stein', {'id': 'mempertahankan', 'en': 'to maintain'}),
  EVocab('symbol', 'sim-bel', {'id': 'simbol; lambang', 'en': 'sign'}),
  EVocab('target', 'tar-get', {'id': 'target; sasaran', 'en': 'goal to reach'}),
  EVocab('transit', 'tren-zit', {
    'id': 'angkutan; persinggahan',
    'en': 'movement through a place',
  }),
  EVocab('trend', 'trend', {
    'id': 'tren; kecenderungan',
    'en': 'general direction',
  }),
  EVocab('version', 'ver-zyen', {'id': 'versi', 'en': 'form of something'}),
  EVocab('welfare', 'wel-fer', {'id': 'kesejahteraan', 'en': 'well-being'}),
  EVocab('whereas', 'wer-ez', {
    'id': 'sedangkan',
    'en': 'while on the other hand',
  }),
  EVocab('abstract', 'eb-strekt', {
    'id': 'abstrak; ringkasan (makalah)',
    'en': 'not concrete',
  }),
  EVocab('accurate', 'e-kyu-ret', {'id': 'akurat; tepat', 'en': 'correct'}),
  EVocab('acknowledge', 'ek-no-lij', {'id': 'mengakui', 'en': 'to admit'}),
  EVocab('aggregate', 'e-gri-get', {
    'id': 'agregat; gabungan total',
    'en': 'combined total',
  }),
  EVocab('allocate', 'e-lo-keit', {
    'id': 'mengalokasikan',
    'en': 'to set aside for a purpose',
  }),
  EVocab('assign', 'e-sain', {'id': 'menugaskan', 'en': 'to give a task'}),
  EVocab('attach', 'e-tec', {
    'id': 'melampirkan; menempelkan',
    'en': 'to fasten',
  }),
  EVocab('author', 'o-ther', {'id': 'penulis', 'en': 'writer'}),
  EVocab('bond', 'bond', {'id': 'ikatan; obligasi', 'en': 'tie'}),
  EVocab('brief', 'brif', {'id': 'singkat', 'en': 'short'}),
  EVocab('capable', 'kei-pe-bel', {'id': 'mampu', 'en': 'able'}),
  EVocab('cite', 'sait', {'id': 'mengutip', 'en': 'to quote'}),
  EVocab('cooperate', 'kou-o-pe-reit', {
    'id': 'bekerja sama',
    'en': 'to work together',
  }),
  EVocab('discriminate', 'dis-kri-mi-neit', {
    'id': 'membeda-bedakan (tidak adil)',
    'en': 'to treat unfairly',
  }),
  EVocab('display', 'dis-plei', {
    'id': 'memajang; menampilkan',
    'en': 'to put on view',
  }),
  EVocab('diverse', 'dai-vers', {'id': 'beragam', 'en': 'varied'}),
  EVocab('domain', 'do-mein', {
    'id': 'ranah; bidang',
    'en': 'field of activity',
  }),
  EVocab('edit', 'e-dit', {'id': 'menyunting', 'en': 'to correct text'}),
  EVocab('enhance', 'en-hens', {
    'id': 'meningkatkan (mutu)',
    'en': 'to improve',
  }),
  EVocab('estate', 'is-teit', {'id': 'tanah milik; harta', 'en': 'property'}),
  EVocab('exceed', 'ik-sid', {'id': 'melebihi', 'en': 'to go beyond'}),
  EVocab('expert', 'eks-pert', {'id': 'ahli', 'en': 'specialist'}),
  EVocab('explicit', 'iks-pli-sit', {
    'id': 'tersurat; eksplisit',
    'en': 'stated clearly',
  }),
  EVocab('federal', 'fe-de-rel', {
    'id': 'federal',
    'en': 'of a national government',
  }),
  EVocab('fee', 'fi', {
    'id': 'biaya; ongkos jasa',
    'en': 'payment for a service',
  }),
  EVocab('flexible', 'flek-si-bel', {
    'id': 'lentur; fleksibel',
    'en': 'able to bend',
  }),
  EVocab('furthermore', 'fer-dher-mor', {
    'id': 'selain itu',
    'en': 'in addition',
  }),
  EVocab('gender', 'jen-der', {
    'id': 'gender (peran sosial)',
    'en': 'social sex role',
  }),
  EVocab('ignorance', 'ig-no-rens', {
    'id': 'ketidaktahuan',
    'en': 'lack of knowledge',
  }),
  EVocab('incentive', 'in-sen-tiv', {
    'id': 'insentif; dorongan',
    'en': 'encouraging reward',
  }),
  EVocab('incidence', 'in-si-dens', {
    'id': 'tingkat kejadian',
    'en': 'rate of occurrence',
  }),
  EVocab('incorporate', 'in-kor-po-reit', {
    'id': 'memasukkan; menggabungkan',
    'en': 'to include',
  }),
  EVocab('index', 'in-deks', {'id': 'indeks', 'en': 'list or measure'}),
  EVocab('inhibit', 'in-hi-bit', {
    'id': 'menghambat',
    'en': 'to slow down; block',
  }),
  EVocab('initiate', 'i-ni-syi-eit', {'id': 'memulai', 'en': 'to begin'}),
  EVocab('input', 'in-put', {'id': 'masukan', 'en': 'what is put in'}),
  EVocab('instruct', 'ins-trakt', {
    'id': 'menginstruksikan; mengajar',
    'en': 'to direct; to teach',
  }),
  EVocab('intelligence', 'in-te-li-jens', {
    'id': 'kecerdasan',
    'en': 'ability to learn',
  }),
  EVocab('interval', 'in-ter-vel', {'id': 'selang; jeda', 'en': 'gap in time'}),
  EVocab('lecture', 'lek-cer', {
    'id': 'kuliah; ceramah',
    'en': 'talk to students',
  }),
  EVocab('migrate', 'mai-greit', {
    'id': 'bermigrasi; berpindah',
    'en': 'to move to another place',
  }),
  EVocab('minimum', 'mi-ni-mem', {
    'id': 'minimum; paling sedikit',
    'en': 'lowest amount',
  }),
  EVocab('ministry', 'mi-nis-tri', {
    'id': 'kementerian',
    'en': 'government department',
  }),
  EVocab('motive', 'mou-tiv', {
    'id': 'motif; alasan',
    'en': 'reason for acting',
  }),
  EVocab('neutral', 'nyu-trel', {'id': 'netral', 'en': 'not taking sides'}),
  EVocab('nevertheless', 'ne-ver-dhe-les', {
    'id': 'namun demikian',
    'en': 'however',
  }),
  EVocab('overseas', 'ou-ver-siz', {'id': 'luar negeri', 'en': 'abroad'}),
  EVocab('precede', 'pri-sid', {'id': 'mendahului', 'en': 'to come before'}),
  EVocab('presume', 'pri-zyum', {
    'id': 'menduga; mengira',
    'en': 'to take for granted',
  }),
  EVocab('rational', 're-syo-nel', {'id': 'rasional', 'en': 'reasonable'}),
  EVocab('recover', 'ri-ka-ver', {'id': 'pulih', 'en': 'to get better'}),
  EVocab('reveal', 'ri-vil', {'id': 'mengungkapkan', 'en': 'to make known'}),
  EVocab('scope', 'skoup', {'id': 'cakupan', 'en': 'extent of coverage'}),
  EVocab('subsidy', 'sab-si-di', {
    'id': 'subsidi',
    'en': 'government financial support',
  }),
  EVocab('tape', 'teip', {'id': 'pita; selotip', 'en': 'adhesive strip'}),
  EVocab('trace', 'treis', {'id': 'melacak; jejak', 'en': 'to track'}),
  EVocab('transform', 'trens-form', {
    'id': 'mengubah bentuk',
    'en': 'to change completely',
  }),
  EVocab('transport', 'trens-port', {
    'id': 'mengangkut; transportasi',
    'en': 'to carry',
  }),
  EVocab('underlie', 'an-der-lai', {
    'id': 'mendasari',
    'en': 'to be the basis of',
  }),
  EVocab('utilize', 'yu-ti-laiz', {
    'id': 'menggunakan; mendayagunakan',
    'en': 'to make use of',
  }),
  EVocab('adapt', 'e-dept', {'id': 'menyesuaikan diri', 'en': 'to adjust'}),
  EVocab('adult', 'e-dalt', {'id': 'orang dewasa', 'en': 'grown-up'}),
  EVocab('advocate', 'ed-vo-keit', {
    'id': 'mendukung; membela',
    'en': 'to support publicly',
  }),
  EVocab('aid', 'eid', {'id': 'bantuan', 'en': 'assistance'}),
  EVocab('channel', 'ce-nel', {'id': 'saluran', 'en': 'passageway'}),
  EVocab('chemical', 'ke-mi-kel', {
    'id': 'bahan kimia',
    'en': 'substance from chemistry',
  }),
  EVocab('classic', 'kle-sik', {
    'id': 'klasik',
    'en': 'traditional and excellent',
  }),
  EVocab('comprehensive', 'kom-pri-hen-siv', {
    'id': 'menyeluruh',
    'en': 'complete',
  }),
  EVocab('comprise', 'kem-praiz', {
    'id': 'meliputi; terdiri atas',
    'en': 'to be composed of',
  }),
  EVocab('confirm', 'ken-ferm', {'id': 'mengonfirmasi', 'en': 'to verify'}),
  EVocab('contrary', 'kon-tre-ri', {'id': 'berlawanan', 'en': 'opposite'}),
  EVocab('convert', 'ken-vert', {
    'id': 'mengonversi; menukar',
    'en': 'to turn into',
  }),
  EVocab('couple', 'ka-pel', {'id': 'sepasang', 'en': 'pair'}),
  EVocab('decade', 'de-keid', {'id': 'dekade', 'en': 'ten years'}),
  EVocab('definite', 'de-fi-nit', {'id': 'pasti', 'en': 'certain'}),
  EVocab('deny', 'di-nai', {
    'id': 'menyangkal',
    'en': 'to say something is not true',
  }),
  EVocab('differentiate', 'di-fe-ren-syi-eit', {
    'id': 'membedakan',
    'en': 'to tell apart',
  }),
  EVocab('dispose', 'dis-pouz', {'id': 'membuang', 'en': 'to throw away'}),
  EVocab('dynamic', 'dai-ne-mik', {
    'id': 'dinamis',
    'en': 'active and changing',
  }),
  EVocab('eliminate', 'i-li-mi-neit', {
    'id': 'menghilangkan',
    'en': 'to get rid of',
  }),
  EVocab('empirical', 'em-pi-ri-kel', {
    'id': 'empiris',
    'en': 'based on observation',
  }),
  EVocab('equip', 'i-kwip', {
    'id': 'melengkapi (dengan alat)',
    'en': 'to supply with tools',
  }),
  EVocab('extract', 'iks-trekt', {
    'id': 'mengekstrak; mengeluarkan',
    'en': 'to take out',
  }),
  EVocab('file', 'fail', {'id': 'berkas', 'en': 'set of records'}),
  EVocab('finite', 'fai-nait', {'id': 'terbatas', 'en': 'limited'}),
  EVocab('foundation', 'faun-dei-syen', {
    'id': 'fondasi; yayasan',
    'en': 'base',
  }),
  EVocab('globe', 'gloub', {'id': 'bola dunia', 'en': 'the world'}),
  EVocab('grade', 'greid', {'id': 'nilai; tingkat', 'en': 'mark; level'}),
  EVocab('guarantee', 'ge-ren-ti', {
    'id': 'jaminan; menjamin',
    'en': 'promise',
  }),
  EVocab('hierarchy', 'hai-ye-rar-ki', {
    'id': 'hierarki; jenjang',
    'en': 'ranking system',
  }),
  EVocab('identical', 'ai-den-ti-kel', {
    'id': 'identik; sama persis',
    'en': 'exactly alike',
  }),
  EVocab('ideology', 'ai-di-yo-lo-ji', {
    'id': 'ideologi',
    'en': 'system of beliefs',
  }),
  EVocab('infer', 'in-fer', {
    'id': 'menarik kesimpulan',
    'en': 'to conclude from evidence',
  }),
  EVocab('innovate', 'i-no-veit', {
    'id': 'berinovasi',
    'en': 'to introduce new things',
  }),
  EVocab('insert', 'in-sert', {'id': 'menyisipkan', 'en': 'to put in'}),
  EVocab('intervene', 'in-ter-vin', {
    'id': 'campur tangan',
    'en': 'to step in',
  }),
  EVocab('isolate', 'ai-so-leit', {
    'id': 'memisahkan; mengisolasi',
    'en': 'to separate',
  }),
  EVocab('media', 'mi-di-ya', {
    'id': 'media',
    'en': 'means of mass communication',
  }),
  EVocab('mode', 'moud', {'id': 'mode; ragam', 'en': 'manner; form'}),
  EVocab('paradigm', 'pe-re-daim', {'id': 'paradigma', 'en': 'model; pattern'}),
  EVocab('phenomenon', 'fe-no-me-non', {
    'id': 'fenomena; gejala',
    'en': 'observable event',
  }),
  EVocab('priority', 'prai-yo-ri-ti', {
    'id': 'prioritas',
    'en': 'most important thing',
  }),
  EVocab('prohibit', 'pro-hi-bit', {'id': 'melarang', 'en': 'to forbid'}),
  EVocab('publication', 'pab-li-kei-syen', {
    'id': 'publikasi; terbitan',
    'en': 'published work',
  }),
  EVocab('quote', 'kwout', {'id': 'kutipan', 'en': 'repeated words'}),
  EVocab('release', 'ri-lis', {
    'id': 'melepaskan; merilis',
    'en': 'to set free',
  }),
  EVocab('reverse', 'ri-vers', {'id': 'membalik', 'en': 'to turn back'}),
  EVocab('simulate', 'si-myu-leit', {
    'id': 'meniru; menyimulasikan',
    'en': 'to imitate',
  }),
  EVocab('sole', 'soul', {'id': 'satu-satunya', 'en': 'only'}),
  EVocab('somewhat', 'sam-wot', {'id': 'agak', 'en': 'rather'}),
  EVocab('submit', 'seb-mit', {'id': 'menyerahkan', 'en': 'to hand in'}),
  EVocab('successor', 'sek-se-ser', {'id': 'penerus', 'en': 'one who follows'}),
  EVocab('survive', 'ser-vaiv', {
    'id': 'bertahan hidup',
    'en': 'to stay alive',
  }),
  EVocab('thesis', 'thi-sis', {'id': 'tesis', 'en': 'long academic paper'}),
  EVocab('topic', 'to-pik', {'id': 'topik', 'en': 'subject'}),
  EVocab('transmit', 'trens-mit', {
    'id': 'mengirimkan; menularkan',
    'en': 'to send',
  }),
  EVocab('ultimate', 'al-ti-met', {
    'id': 'paling akhir; puncak',
    'en': 'final; greatest',
  }),
  EVocab('unique', 'yu-nik', {'id': 'unik', 'en': 'one of a kind'}),
  EVocab('visible', 'vi-zi-bel', {'id': 'terlihat', 'en': 'can be seen'}),
  EVocab('voluntary', 'vo-len-te-ri', {
    'id': 'sukarela',
    'en': 'done willingly',
  }),
  EVocab('abandon', 'e-ben-den', {
    'id': 'meninggalkan',
    'en': 'to leave behind',
  }),
  EVocab('accompany', 'e-kam-pe-ni', {'id': 'menemani', 'en': 'to go with'}),
  EVocab('accumulate', 'e-kyu-myu-leit', {
    'id': 'mengumpulkan; menumpuk',
    'en': 'to gather up',
  }),
  EVocab('ambiguous', 'em-bi-gyu-es', {
    'id': 'ambigu; bermakna ganda',
    'en': 'unclear',
  }),
  EVocab('append', 'e-pend', {
    'id': 'menambahkan (di akhir)',
    'en': 'to add at the end',
  }),
  EVocab('appreciate', 'e-pri-syi-eit', {'id': 'menghargai', 'en': 'to value'}),
  EVocab('arbitrary', 'ar-bi-tre-ri', {
    'id': 'sembarangan; sewenang-wenang',
    'en': 'without reason',
  }),
  EVocab('automate', 'o-to-meit', {
    'id': 'mengotomatiskan',
    'en': 'to make automatic',
  }),
  EVocab('bias', 'bai-es', {'id': 'prasangka; bias', 'en': 'prejudice'}),
  EVocab('chart', 'cart', {'id': 'bagan; grafik', 'en': 'diagram'}),
  EVocab('clarify', 'kle-ri-fai', {
    'id': 'menjelaskan; mengklarifikasi',
    'en': 'to make clear',
  }),
  EVocab('commodity', 'ke-mo-di-ti', {'id': 'komoditas', 'en': 'traded goods'}),
  EVocab('complement', 'kom-ple-ment', {
    'id': 'melengkapi',
    'en': 'to go well with',
  }),
  EVocab('conform', 'ken-form', {
    'id': 'mematuhi; menyesuaikan diri dengan aturan',
    'en': 'to follow rules',
  }),
  EVocab('contemporary', 'ken-tem-po-re-ri', {
    'id': 'kontemporer; masa kini',
    'en': 'modern',
  }),
  EVocab('contradict', 'kon-tre-dikt', {
    'id': 'bertentangan; membantah',
    'en': 'to deny',
  }),
  EVocab('crucial', 'kru-syel', {'id': 'sangat penting', 'en': 'vital'}),
  EVocab('currency', 'ka-ren-si', {
    'id': 'mata uang',
    'en': 'money system of a country',
  }),
  EVocab('denote', 'di-nout', {'id': 'melambangkan', 'en': 'to stand for'}),
  EVocab('detect', 'di-tekt', {
    'id': 'mendeteksi',
    'en': 'to notice; discover',
  }),
  EVocab('deviate', 'di-vi-eit', {
    'id': 'menyimpang',
    'en': 'to depart from normal',
  }),
  EVocab('displace', 'dis-pleis', {
    'id': 'menggusur; memindahkan',
    'en': 'to force out of place',
  }),
  EVocab('drama', 'dra-ma', {'id': 'drama', 'en': 'play; theater'}),
  EVocab('eventual', 'i-ven-cyu-el', {
    'id': 'pada akhirnya terjadi',
    'en': 'happening at last',
  }),
  EVocab('exhibit', 'ig-zi-bit', {
    'id': 'memamerkan',
    'en': 'to show publicly',
  }),
  EVocab('exploit', 'iks-ploit', {
    'id': 'memanfaatkan; mengeksploitasi',
    'en': 'to take advantage of',
  }),
  EVocab('fluctuate', 'flak-cyu-eit', {
    'id': 'naik-turun',
    'en': 'to vary irregularly',
  }),
  EVocab('guideline', 'gaid-lain', {
    'id': 'pedoman',
    'en': 'rule for guidance',
  }),
  EVocab('highlight', 'hai-lait', {
    'id': 'menyoroti',
    'en': 'to draw attention to',
  }),
  EVocab('implicit', 'im-pli-sit', {'id': 'tersirat', 'en': 'implied'}),
  EVocab('induce', 'in-dyus', {
    'id': 'membujuk; menyebabkan',
    'en': 'to bring about',
  }),
  EVocab('inevitable', 'i-ne-vi-te-bel', {
    'id': 'tak terhindarkan',
    'en': 'unavoidable',
  }),
  EVocab('infrastructure', 'in-fre-strak-cer', {
    'id': 'infrastruktur',
    'en': 'basic facilities',
  }),
  EVocab('inspect', 'ins-pekt', {'id': 'memeriksa', 'en': 'to check'}),
  EVocab('intense', 'in-tens', {'id': 'intens; hebat', 'en': 'very strong'}),
  EVocab('manipulate', 'me-ni-pyu-leit', {
    'id': 'memanipulasi',
    'en': 'to control unfairly',
  }),
  EVocab('minimize', 'mi-ni-maiz', {
    'id': 'meminimalkan',
    'en': 'to make as small as possible',
  }),
  EVocab('nuclear', 'nyu-kli-yer', {'id': 'nuklir', 'en': 'atomic'}),
  EVocab('offset', 'of-set', {
    'id': 'menutupi (kerugian); menyeimbangkan',
    'en': 'to counterbalance',
  }),
  EVocab('paragraph', 'pe-re-graf', {
    'id': 'paragraf',
    'en': 'section of text',
  }),
  EVocab('plus', 'plas', {'id': 'ditambah', 'en': 'added to'}),
  EVocab('practitioner', 'prek-ti-syo-ner', {
    'id': 'praktisi',
    'en': 'person who practices a profession',
  }),
  EVocab('predominant', 'pri-do-mi-nent', {
    'id': 'paling menonjol',
    'en': 'most common',
  }),
  EVocab('prospect', 'pros-pekt', {
    'id': 'prospek; peluang',
    'en': 'future possibility',
  }),
  EVocab('radical', 're-di-kel', {'id': 'radikal; ekstrem', 'en': 'extreme'}),
  EVocab('random', 'ren-dem', {'id': 'acak', 'en': 'by chance'}),
  EVocab('reinforce', 'ri-in-fors', {
    'id': 'memperkuat',
    'en': 'to strengthen',
  }),
  EVocab('restore', 'ris-tor', {'id': 'memulihkan', 'en': 'to bring back'}),
  EVocab('revise', 'ri-vaiz', {'id': 'merevisi', 'en': 'to update a draft'}),
  EVocab('schedule', 'ske-jul', {'id': 'jadwal', 'en': 'timetable'}),
  EVocab('tension', 'ten-syen', {'id': 'ketegangan', 'en': 'strain'}),
  EVocab('terminate', 'ter-mi-neit', {'id': 'mengakhiri', 'en': 'to end'}),
  EVocab('theme', 'thim', {'id': 'tema', 'en': 'main subject'}),
  EVocab('thereby', 'dher-bai', {
    'id': 'dengan demikian',
    'en': 'by that means',
  }),
  EVocab('uniform', 'yu-ni-form', {
    'id': 'seragam',
    'en': 'the same throughout',
  }),
  EVocab('vehicle', 'vi-ye-kel', {'id': 'kendaraan', 'en': 'car or bus'}),
  EVocab('via', 'vai-ya', {'id': 'melalui', 'en': 'by way of'}),
  EVocab('virtual', 'ver-cyu-el', {
    'id': 'maya; virtual',
    'en': 'online; nearly real',
  }),
  EVocab('visual', 'vi-zyu-el', {
    'id': 'visual; berkaitan dengan penglihatan',
    'en': 'related to sight',
  }),
  EVocab('widespread', 'waid-spred', {
    'id': 'tersebar luas',
    'en': 'common everywhere',
  }),
  EVocab('accommodate', 'e-ko-mo-deit', {
    'id': 'menampung',
    'en': 'to provide room for',
  }),
  EVocab('analogy', 'e-ne-lo-ji', {
    'id': 'analogi; perumpamaan',
    'en': 'comparison',
  }),
  EVocab('anticipate', 'en-ti-si-peit', {
    'id': 'mengantisipasi; memperkirakan',
    'en': 'to expect',
  }),
  EVocab('assure', 'e-syur', {
    'id': 'memberi kepastian',
    'en': 'to promise confidently',
  }),
  EVocab('attain', 'e-tein', {'id': 'meraih', 'en': 'to reach'}),
  EVocab('behalf', 'bi-hef', {'id': 'atas nama', 'en': 'in the name of'}),
  EVocab('bulk', 'balk', {
    'id': 'sebagian besar; jumlah besar',
    'en': 'large quantity',
  }),
  EVocab('cease', 'sis', {'id': 'berhenti', 'en': 'to stop'}),
  EVocab('coherent', 'kou-hi-rent', {
    'id': 'runtut; masuk akal',
    'en': 'logical',
  }),
  EVocab('coincide', 'kou-in-said', {
    'id': 'terjadi bersamaan',
    'en': 'to happen together',
  }),
  EVocab('commence', 'ke-mens', {'id': 'memulai (resmi)', 'en': 'to start'}),
  EVocab('compatible', 'kem-pe-ti-bel', {
    'id': 'cocok; kompatibel',
    'en': 'able to work together',
  }),
  EVocab('concurrent', 'ken-ka-rent', {
    'id': 'serentak',
    'en': 'at the same time',
  }),
  EVocab('confine', 'ken-fain', {'id': 'mengurung', 'en': 'to shut in'}),
  EVocab('controversy', 'kon-tro-ver-si', {
    'id': 'kontroversi',
    'en': 'public disagreement',
  }),
  EVocab('converse', 'ken-vers', {'id': 'bercakap-cakap', 'en': 'to chat'}),
  EVocab('device', 'di-vais', {'id': 'perangkat; alat', 'en': 'tool; gadget'}),
  EVocab('devote', 'di-vout', {'id': 'mencurahkan', 'en': 'to dedicate'}),
  EVocab('diminish', 'di-mi-nisy', {'id': 'berkurang', 'en': 'to lessen'}),
  EVocab('distort', 'dis-tort', {
    'id': 'memutarbalikkan; mendistorsi',
    'en': 'to twist',
  }),
  EVocab('duration', 'dyu-rei-syen', {
    'id': 'durasi; lamanya',
    'en': 'length of time',
  }),
  EVocab('erode', 'i-roud', {'id': 'mengikis', 'en': 'to wear away'}),
  EVocab('ethic', 'e-thik', {'id': 'etika', 'en': 'moral principle'}),
  EVocab('format', 'for-met', {'id': 'format; bentuk', 'en': 'layout'}),
  EVocab('found', 'faund', {
    'id': 'mendirikan (lembaga)',
    'en': 'to set up an institution',
  }),
  EVocab('inherent', 'in-hi-rent', {'id': 'melekat', 'en': 'built-in'}),
  EVocab('insight', 'in-sait', {'id': 'wawasan', 'en': 'deep understanding'}),
  EVocab('integral', 'in-te-grel', {
    'id': 'tak terpisahkan',
    'en': 'essential part',
  }),
  EVocab('intermediate', 'in-ter-mi-di-yet', {
    'id': 'menengah',
    'en': 'in the middle',
  }),
  EVocab('manual', 'me-nyu-el', {
    'id': 'manual; buku petunjuk',
    'en': 'by hand; handbook',
  }),
  EVocab('mature', 'me-cyur', {'id': 'matang', 'en': 'fully developed'}),
  EVocab('mediate', 'mi-di-yeit', {
    'id': 'menengahi',
    'en': 'to act as a go-between',
  }),
  EVocab('medium', 'mi-di-yem', {
    'id': 'perantara; sedang',
    'en': 'means; middle size',
  }),
  EVocab('military', 'mi-li-te-ri', {'id': 'militer', 'en': 'armed forces'}),
  EVocab('minimal', 'mi-ni-mel', {'id': 'sangat sedikit', 'en': 'very small'}),
  EVocab('mutual', 'myu-cyu-el', {
    'id': 'saling; bersama',
    'en': 'shared by both',
  }),
  EVocab('norm', 'norm', {'id': 'norma', 'en': 'accepted standard'}),
  EVocab('overlap', 'ou-ver-lep', {
    'id': 'tumpang tindih',
    'en': 'to cover partly',
  }),
  EVocab('passive', 'pe-siv', {'id': 'pasif', 'en': 'not active'}),
  EVocab('portion', 'por-syen', {'id': 'porsi', 'en': 'serving; piece'}),
  EVocab('preliminary', 'pri-li-mi-ne-ri', {
    'id': 'pendahuluan',
    'en': 'introductory',
  }),
  EVocab('protocol', 'prou-to-kol', {
    'id': 'protokol',
    'en': 'official procedure',
  }),
  EVocab('qualitative', 'kwo-li-te-tiv', {
    'id': 'kualitatif',
    'en': 'about quality',
  }),
  EVocab('refine', 'ri-fain', {
    'id': 'menyempurnakan',
    'en': 'to improve in detail',
  }),
  EVocab('relax', 'ri-leks', {'id': 'bersantai', 'en': 'to rest'}),
  EVocab('restrain', 'ris-trein', {
    'id': 'menahan; mengendalikan',
    'en': 'to hold back',
  }),
  EVocab('revolution', 're-vo-lu-syen', {
    'id': 'revolusi',
    'en': 'great change',
  }),
  EVocab('rigid', 'ri-jid', {'id': 'kaku', 'en': 'stiff'}),
  EVocab('route', 'rut', {'id': 'rute', 'en': 'way from one place to another'}),
  EVocab('scenario', 'si-ne-ri-yo', {
    'id': 'skenario',
    'en': 'possible sequence of events',
  }),
  EVocab('sphere', 'sfir', {
    'id': 'bola; lingkup',
    'en': 'round shape; area of activity',
  }),
  EVocab('subordinate', 'se-bor-di-net', {
    'id': 'bawahan',
    'en': 'lower in rank',
  }),
  EVocab('supplement', 'sap-le-ment', {
    'id': 'suplemen; tambahan',
    'en': 'extra addition',
  }),
  EVocab('suspend', 'ses-pend', {
    'id': 'menangguhkan',
    'en': 'to stop for a time',
  }),
  EVocab('team', 'tim', {'id': 'tim', 'en': 'group working together'}),
  EVocab('temporary', 'tem-po-re-ri', {
    'id': 'sementara',
    'en': 'not permanent',
  }),
  EVocab('trigger', 'tri-ger', {'id': 'memicu', 'en': 'to set off'}),
  EVocab('unify', 'yu-ni-fai', {'id': 'menyatukan', 'en': 'to unite'}),
  EVocab('violate', 'vai-yo-leit', {
    'id': 'melanggar',
    'en': 'to break a rule',
  }),
  EVocab('vision', 'vi-zyen', {
    'id': 'visi; penglihatan',
    'en': 'sight; plan for the future',
  }),
  EVocab('adjacent', 'e-jei-sent', {'id': 'bersebelahan', 'en': 'next to'}),
  EVocab('albeit', 'ol-bi-it', {'id': 'walaupun', 'en': 'although'}),
  EVocab('assemble', 'e-sem-bel', {
    'id': 'merakit; berkumpul',
    'en': 'to put parts together',
  }),
  EVocab('collapse', 'ke-leps', {'id': 'runtuh', 'en': 'to fall down'}),
  EVocab('colleague', 'ko-lig', {'id': 'rekan kerja', 'en': 'coworker'}),
  EVocab('compile', 'kem-pail', {
    'id': 'menghimpun',
    'en': 'to collect together',
  }),
  EVocab('conceive', 'ken-siv', {
    'id': 'membayangkan; menggagas',
    'en': 'to think up',
  }),
  EVocab('convince', 'ken-vins', {'id': 'meyakinkan', 'en': 'to persuade'}),
  EVocab('depress', 'di-pres', {
    'id': 'menekan; membuat sedih',
    'en': 'to make sad',
  }),
  EVocab('encounter', 'en-kaun-ter', {
    'id': 'menjumpai',
    'en': 'to meet unexpectedly',
  }),
  EVocab('enormous', 'i-nor-mes', {'id': 'sangat besar', 'en': 'huge'}),
  EVocab('forthcoming', 'forth-ka-ming', {
    'id': 'yang akan datang',
    'en': 'coming soon',
  }),
  EVocab('incline', 'in-klain', {'id': 'cenderung', 'en': 'to tend'}),
  EVocab('integrity', 'in-te-gri-ti', {
    'id': 'integritas; kejujuran',
    'en': 'honesty',
  }),
  EVocab('intrinsic', 'in-trin-sik', {
    'id': 'hakiki',
    'en': 'essential by nature',
  }),
  EVocab('invoke', 'in-vouk', {
    'id': 'memohon; merujuk (hukum)',
    'en': 'to call upon',
  }),
  EVocab('levy', 'le-vi', {'id': 'pungutan', 'en': 'tax charge'}),
  EVocab('likewise', 'laik-waiz', {'id': 'demikian pula', 'en': 'similarly'}),
  EVocab('nonetheless', 'nan-dhe-les', {
    'id': 'meskipun begitu',
    'en': 'even so',
  }),
  EVocab('notwithstanding', 'not-widh-sten-ding', {
    'id': 'terlepas dari',
    'en': 'regardless of',
  }),
  EVocab('odd', 'od', {'id': 'aneh; ganjil', 'en': 'strange'}),
  EVocab('ongoing', 'on-gou-ing', {
    'id': 'sedang berlangsung',
    'en': 'continuing',
  }),
  EVocab('panel', 'pe-nel', {
    'id': 'panel; tim ahli',
    'en': 'group of experts',
  }),
  EVocab('persist', 'per-sist', {
    'id': 'bertahan; terus berlanjut',
    'en': 'to continue firmly',
  }),
  EVocab('pose', 'pouz', {
    'id': 'mengajukan; berpose',
    'en': 'to present (a question)',
  }),
  EVocab('reluctance', 'ri-lak-tens', {
    'id': 'keengganan',
    'en': 'unwillingness',
  }),
  EVocab('so-called', 'sou-kold', {
    'id': 'yang disebut-sebut',
    'en': 'commonly named',
  }),
  EVocab('straightforward', 'streit-for-werd', {
    'id': 'lugas; mudah',
    'en': 'simple and direct',
  }),
  EVocab('undergo', 'an-der-gou', {'id': 'mengalami', 'en': 'to experience'}),
  EVocab('whereby', 'wer-bai', {'id': 'yang dengannya', 'en': 'by which'}),
  EVocab('abundant', 'e-ban-dent', {'id': 'melimpah', 'en': 'plentiful'}),
  EVocab('ancient', 'ein-syent', {'id': 'kuno', 'en': 'very old'}),
  EVocab('approximately', 'e-prok-si-met-li', {
    'id': 'kira-kira',
    'en': 'about',
  }),
  EVocab('characteristic', 'ke-rek-te-ris-tik', {
    'id': 'ciri khas',
    'en': 'feature',
  }),
  EVocab('consequence', 'kon-si-kwens', {'id': 'akibat', 'en': 'result'}),
  EVocab('controversial', 'kon-tro-ver-syel', {
    'id': 'kontroversial',
    'en': 'disputed',
  }),
  EVocab('dominant', 'do-mi-nent', {
    'id': 'dominan; paling berpengaruh',
    'en': 'most powerful',
  }),
  EVocab('dramatic', 'dre-me-tik', {'id': 'drastis', 'en': 'sudden and large'}),
  EVocab('efficient', 'i-fi-syent', {
    'id': 'efisien',
    'en': 'productive without waste',
  }),
  EVocab('emphasize', 'em-fe-saiz', {'id': 'menekankan', 'en': 'to stress'}),
  EVocab('extinct', 'iks-tingkt', {'id': 'punah', 'en': 'no longer existing'}),
  EVocab('inhabit', 'in-he-bit', {'id': 'mendiami', 'en': 'to live in'}),
  EVocab('innovation', 'i-no-vei-syen', {
    'id': 'inovasi',
    'en': 'new idea or method',
  }),
  EVocab('numerous', 'nyu-me-res', {'id': 'banyak sekali', 'en': 'many'}),
  EVocab('preserve', 'pri-zerv', {'id': 'melestarikan', 'en': 'to protect'}),
  EVocab('rapid', 're-pid', {'id': 'cepat', 'en': 'fast'}),
  EVocab('reluctant', 'ri-lak-tent', {'id': 'enggan', 'en': 'unwilling'}),
  EVocab('remarkable', 'ri-mar-ke-bel', {
    'id': 'luar biasa',
    'en': 'extraordinary',
  }),
  EVocab('resemble', 'ri-zem-bel', {'id': 'menyerupai', 'en': 'to look like'}),
  EVocab('scarce', 'skers', {'id': 'langka', 'en': 'rare'}),
  EVocab('sophisticated', 'so-fis-ti-kei-ted', {
    'id': 'canggih',
    'en': 'advanced',
  }),
  EVocab('vast', 'vest', {'id': 'sangat luas', 'en': 'very large'}),
];

/// IELTS: tema esai & speaking, deskripsi grafik, kata penghubung.
const List<EVocab> ieltsVocab = [
  EVocab('carbon footprint', 'kar-ben fut-print', {
    'id': 'jejak karbon',
    'en': 'total carbon produced',
  }),
  EVocab('emission', 'i-mi-syen', {
    'id': 'emisi; gas buang',
    'en': 'gas released',
  }),
  EVocab('renewable', 'ri-nyu-e-bel', {
    'id': 'terbarukan',
    'en': 'naturally replaced',
  }),
  EVocab('deforestation', 'di-fo-res-tei-syen', {
    'id': 'penggundulan hutan',
    'en': 'clearing of forests',
  }),
  EVocab('biodiversity', 'bai-ou-dai-ver-si-ti', {
    'id': 'keanekaragaman hayati',
    'en': 'variety of life',
  }),
  EVocab('conservation', 'kon-ser-vei-syen', {
    'id': 'pelestarian',
    'en': 'protection of nature',
  }),
  EVocab('endangered', 'en-dein-jerd', {
    'id': 'terancam punah',
    'en': 'at risk of extinction',
  }),
  EVocab('habitat', 'he-bi-tet', {
    'id': 'habitat; tempat hidup',
    'en': 'natural home',
  }),
  EVocab('recycle', 'ri-sai-kel', {
    'id': 'mendaur ulang',
    'en': 'to reuse material',
  }),
  EVocab('fossil fuel', 'fo-sil fyu-el', {
    'id': 'bahan bakar fosil',
    'en': 'coal, oil or gas',
  }),
  EVocab('greenhouse gas', 'grin-haus ges', {
    'id': 'gas rumah kaca',
    'en': 'gas that traps heat',
  }),
  EVocab('extinction', 'iks-ting-syen', {
    'id': 'kepunahan',
    'en': 'dying out of a species',
  }),
  EVocab('ecosystem', 'i-kou-sis-tem', {
    'id': 'ekosistem',
    'en': 'community of living things',
  }),
  EVocab('wildlife', 'waild-laif', {'id': 'satwa liar', 'en': 'wild animals'}),
  EVocab('poaching', 'pou-cing', {
    'id': 'perburuan liar',
    'en': 'illegal hunting',
  }),
  EVocab('rainforest', 'rein-fo-rest', {
    'id': 'hutan hujan tropis',
    'en': 'dense tropical forest',
  }),
  EVocab('landfill', 'lend-fil', {
    'id': 'tempat pembuangan sampah',
    'en': 'rubbish dump',
  }),
  EVocab('litter', 'li-ter', {
    'id': 'sampah berserakan',
    'en': 'rubbish left in public',
  }),
  EVocab('smog', 'smog', {'id': 'kabut asap', 'en': 'polluted haze'}),
  EVocab('exhaust fumes', 'ig-zost fyumz', {
    'id': 'asap knalpot',
    'en': 'gas from engines',
  }),
  EVocab('pesticide', 'pes-ti-said', {
    'id': 'pestisida',
    'en': 'chemical that kills insects',
  }),
  EVocab('contamination', 'ken-te-mi-nei-syen', {
    'id': 'pencemaran; kontaminasi',
    'en': 'making something dirty or poisonous',
  }),
  EVocab('scarcity', 'sker-si-ti', {'id': 'kelangkaan', 'en': 'shortage'}),
  EVocab('natural disaster', 'ne-ce-rel di-zes-ter', {
    'id': 'bencana alam',
    'en': 'catastrophe caused by nature',
  }),
  EVocab('sea level', 'si le-vel', {
    'id': 'permukaan laut',
    'en': 'height of the ocean surface',
  }),
  EVocab('ozone layer', 'ou-zoun lei-er', {
    'id': 'lapisan ozon',
    'en': 'protective gas shield',
  }),
  EVocab('wind farm', 'wind farm', {
    'id': 'ladang angin',
    'en': 'group of wind turbines',
  }),
  EVocab('solar panel', 'sou-ler pe-nel', {
    'id': 'panel surya',
    'en': 'board that turns sunlight into power',
  }),
  EVocab('single-use plastic', 'sing-gel yus ples-tik', {
    'id': 'plastik sekali pakai',
    'en': 'disposable plastic',
  }),
  EVocab('eco-friendly', 'i-kou frend-li', {
    'id': 'ramah lingkungan',
    'en': 'not harmful to nature',
  }),
  EVocab('curriculum', 'ke-ri-kyu-lem', {
    'id': 'kurikulum',
    'en': 'course of study',
  }),
  EVocab('tuition', 'tyu-i-syen', {'id': 'biaya kuliah', 'en': 'school fees'}),
  EVocab('literacy', 'li-te-re-si', {
    'id': 'kemampuan baca-tulis',
    'en': 'ability to read and write',
  }),
  EVocab('graduate', 'gre-jyu-et', {
    'id': 'lulusan',
    'en': 'person with a degree',
  }),
  EVocab('scholarship', 'sko-ler-syip', {
    'id': 'beasiswa',
    'en': 'grant for study',
  }),
  EVocab('compulsory', 'kom-pal-so-ri', {'id': 'wajib', 'en': 'required'}),
  EVocab('discipline', 'di-si-plin', {'id': 'disiplin', 'en': 'self-control'}),
  EVocab('tertiary education', 'ter-syi-e-ri e-dyu-kei-syen', {
    'id': 'pendidikan tinggi',
    'en': 'university study',
  }),
  EVocab('distance learning', 'dis-tens ler-ning', {
    'id': 'pembelajaran jarak jauh',
    'en': 'studying remotely',
  }),
  EVocab('syllabus', 'si-le-bes', {
    'id': 'silabus',
    'en': 'outline of a course',
  }),
  EVocab('tutor', 'tyu-ter', {
    'id': 'guru les; tutor',
    'en': 'private teacher',
  }),
  EVocab('dropout', 'drop-aut', {
    'id': 'putus sekolah',
    'en': 'student who quits school',
  }),
  EVocab('rote learning', 'rout ler-ning', {
    'id': 'belajar hafalan',
    'en': 'memorizing by repetition',
  }),
  EVocab('extracurricular', 'eks-tre-ke-ri-kyu-ler', {
    'id': 'ekstrakurikuler',
    'en': 'outside normal lessons',
  }),
  EVocab('vocational', 'vou-kei-syo-nel', {
    'id': 'kejuruan',
    'en': 'related to job skills',
  }),
  EVocab('boarding school', 'bor-ding skul', {
    'id': 'sekolah berasrama',
    'en': 'school where pupils live',
  }),
  EVocab('kindergarten', 'kin-der-gar-ten', {
    'id': 'taman kanak-kanak',
    'en': 'school for young children',
  }),
  EVocab('undergraduate', 'an-der-gre-jyu-et', {
    'id': 'mahasiswa S1',
    'en': 'student working on a first degree',
  }),
  EVocab('plagiarism', 'plei-je-ri-zem', {
    'id': 'plagiarisme; penjiplakan',
    'en': 'copying another\'s work',
  }),
  EVocab('critical thinking', 'kri-ti-kel thing-king', {
    'id': 'berpikir kritis',
    'en': 'careful reasoning',
  }),
  EVocab('homeschooling', 'houm-sku-ling', {
    'id': 'sekolah di rumah',
    'en': 'educating children at home',
  }),
  EVocab('gap year', 'gep yir', {
    'id': 'tahun jeda sebelum kuliah',
    'en': 'year off before university',
  }),
  EVocab('peer pressure', 'pir pre-syer', {
    'id': 'tekanan teman sebaya',
    'en': 'influence from friends',
  }),
  EVocab('truancy', 'tru-en-si', {
    'id': 'bolos sekolah',
    'en': 'skipping school',
  }),
  EVocab('illiterate', 'i-li-te-ret', {
    'id': 'buta huruf',
    'en': 'unable to read',
  }),
  EVocab('obesity', 'ou-bi-si-ti', {
    'id': 'obesitas',
    'en': 'being very overweight',
  }),
  EVocab('nutrition', 'nyu-tri-syen', {'id': 'gizi', 'en': 'nourishment'}),
  EVocab('epidemic', 'e-pi-de-mik', {
    'id': 'wabah',
    'en': 'widespread disease',
  }),
  EVocab('sedentary', 'se-den-te-ri', {'id': 'kurang gerak', 'en': 'inactive'}),
  EVocab('well-being', 'wel-bi-ing', {
    'id': 'kesejahteraan',
    'en': 'health and happiness',
  }),
  EVocab('diagnose', 'dai-eg-nous', {
    'id': 'mendiagnosis',
    'en': 'to identify an illness',
  }),
  EVocab('prevention', 'pri-ven-syen', {
    'id': 'pencegahan',
    'en': 'stopping something before it happens',
  }),
  EVocab('mental health', 'men-tel helth', {
    'id': 'kesehatan mental',
    'en': 'psychological health',
  }),
  EVocab('life expectancy', 'laif iks-pek-ten-si', {
    'id': 'angka harapan hidup',
    'en': 'average lifespan',
  }),
  EVocab('junk food', 'jangk fud', {
    'id': 'makanan tidak sehat',
    'en': 'unhealthy snacks',
  }),
  EVocab('balanced diet', 'be-lenst dai-et', {
    'id': 'pola makan seimbang',
    'en': 'healthy mix of foods',
  }),
  EVocab('addiction', 'e-dik-syen', {
    'id': 'kecanduan',
    'en': 'inability to stop a habit',
  }),
  EVocab('fitness', 'fit-nes', {'id': 'kebugaran', 'en': 'physical condition'}),
  EVocab('insomnia', 'in-som-ni-e', {
    'id': 'susah tidur',
    'en': 'inability to sleep',
  }),
  EVocab('anxiety', 'eng-zai-e-ti', {'id': 'kecemasan', 'en': 'worry'}),
  EVocab('chronic', 'kro-nik', {'id': 'kronis; menahun', 'en': 'long-lasting'}),
  EVocab('vaccination', 'vek-si-nei-syen', {
    'id': 'vaksinasi',
    'en': 'giving shots against disease',
  }),
  EVocab('healthcare', 'helth-ker', {
    'id': 'layanan kesehatan',
    'en': 'medical services',
  }),
  EVocab('symptom', 'simp-tem', {'id': 'gejala', 'en': 'sign of illness'}),
  EVocab('side effect', 'said i-fekt', {
    'id': 'efek samping',
    'en': 'unwanted result of a drug',
  }),
  EVocab('malnutrition', 'mel-nyu-tri-syen', {
    'id': 'gizi buruk',
    'en': 'poor diet causing illness',
  }),
  EVocab('hygiene', 'hai-jin', {'id': 'kebersihan', 'en': 'cleanliness'}),
  EVocab('overweight', 'ou-ver-weit', {
    'id': 'kelebihan berat badan',
    'en': 'too heavy',
  }),
  EVocab('workout', 'werk-aut', {
    'id': 'latihan fisik',
    'en': 'exercise session',
  }),
  EVocab('check-up', 'cek ap', {
    'id': 'pemeriksaan kesehatan',
    'en': 'medical examination',
  }),
  EVocab('burnout', 'bern-aut', {
    'id': 'kelelahan kerja',
    'en': 'exhaustion from overwork',
  }),
  EVocab('privacy', 'prai-ve-si', {'id': 'privasi', 'en': 'being private'}),
  EVocab('surveillance', 'ser-vei-lens', {
    'id': 'pengawasan',
    'en': 'close watching',
  }),
  EVocab('cyberbullying', 'sai-ber-bu-li-ing', {
    'id': 'perundungan daring',
    'en': 'online harassment',
  }),
  EVocab('artificial', 'ar-ti-fi-syel', {'id': 'buatan', 'en': 'man-made'}),
  EVocab('advertising', 'ed-ver-tai-zing', {
    'id': 'periklanan',
    'en': 'promoting products',
  }),
  EVocab('censorship', 'sen-ser-syip', {
    'id': 'penyensoran',
    'en': 'banning content',
  }),
  EVocab('gadget', 'ge-jet', {'id': 'gawai', 'en': 'small electronic tool'}),
  EVocab('screen time', 'skrin taim', {
    'id': 'waktu di depan layar',
    'en': 'hours spent on devices',
  }),
  EVocab('breakthrough', 'breik-thru', {
    'id': 'terobosan',
    'en': 'important discovery',
  }),
  EVocab('cutting-edge', 'ka-ting ej', {
    'id': 'paling mutakhir',
    'en': 'most advanced',
  }),
  EVocab('obsolete', 'ob-se-lit', {'id': 'usang', 'en': 'out of date'}),
  EVocab('e-commerce', 'i ko-mers', {
    'id': 'perdagangan elektronik',
    'en': 'buying and selling online',
  }),
  EVocab('hacker', 'he-ker', {
    'id': 'peretas',
    'en': 'person who breaks into computers',
  }),
  EVocab('misinformation', 'mis-in-for-mei-syen', {
    'id': 'informasi keliru',
    'en': 'false facts',
  }),
  EVocab('fake news', 'feik nyuz', {
    'id': 'berita palsu',
    'en': 'invented stories',
  }),
  EVocab('influencer', 'in-flu-en-ser', {
    'id': 'pemengaruh; influencer',
    'en': 'popular online personality',
  }),
  EVocab('cybercrime', 'sai-ber-kraim', {
    'id': 'kejahatan siber',
    'en': 'crime on the internet',
  }),
  EVocab('piracy', 'pai-re-si', {'id': 'pembajakan', 'en': 'illegal copying'}),
  EVocab('broadcast', 'brod-kest', {
    'id': 'menyiarkan',
    'en': 'to transmit on TV or radio',
  }),
  EVocab('reporter', 'ri-por-ter', {'id': 'wartawan', 'en': 'journalist'}),
  EVocab('headline', 'hed-lain', {
    'id': 'judul berita',
    'en': 'title of a news story',
  }),
  EVocab('tabloid', 'teb-loid', {
    'id': 'koran gosip',
    'en': 'popular newspaper',
  }),
  EVocab('user-friendly', 'yu-zer frend-li', {
    'id': 'mudah dipakai',
    'en': 'easy to use',
  }),
  EVocab('addictive', 'e-dik-tiv', {
    'id': 'bikin ketagihan',
    'en': 'hard to stop using',
  }),
  EVocab('remote working', 'ri-mout wer-king', {
    'id': 'kerja jarak jauh',
    'en': 'working from home',
  }),
  EVocab('crime', 'kraim', {'id': 'kejahatan', 'en': 'illegal act'}),
  EVocab('punishment', 'pa-nisy-ment', {'id': 'hukuman', 'en': 'penalty'}),
  EVocab('government', 'ga-vern-ment', {
    'id': 'pemerintah',
    'en': 'ruling body',
  }),
  EVocab('offender', 'o-fen-der', {
    'id': 'pelaku pelanggaran',
    'en': 'lawbreaker',
  }),
  EVocab('juvenile delinquency', 'ju-ve-nail di-ling-kwen-si', {
    'id': 'kenakalan remaja',
    'en': 'youth crime',
  }),
  EVocab('rehabilitation', 'ri-he-bi-li-tei-syen', {
    'id': 'rehabilitasi',
    'en': 'helping someone return to normal life',
  }),
  EVocab('imprisonment', 'im-pri-zen-ment', {
    'id': 'pemenjaraan',
    'en': 'being locked up',
  }),
  EVocab('death penalty', 'deth pe-nel-ti', {
    'id': 'hukuman mati',
    'en': 'execution as punishment',
  }),
  EVocab('deterrent', 'di-te-rent', {
    'id': 'efek jera; penangkal',
    'en': 'something that discourages',
  }),
  EVocab('theft', 'theft', {'id': 'pencurian', 'en': 'stealing'}),
  EVocab('burglary', 'ber-gle-ri', {
    'id': 'pembobolan rumah',
    'en': 'breaking into a building to steal',
  }),
  EVocab('vandalism', 'ven-de-li-zem', {
    'id': 'vandalisme; perusakan',
    'en': 'damaging property on purpose',
  }),
  EVocab('fraud', 'frod', {'id': 'penipuan', 'en': 'deception for money'}),
  EVocab('smuggling', 'smag-ling', {
    'id': 'penyelundupan',
    'en': 'moving goods illegally',
  }),
  EVocab('victim', 'vik-tim', {'id': 'korban', 'en': 'person who is harmed'}),
  EVocab('witness', 'wit-nes', {
    'id': 'saksi',
    'en': 'person who saw an event',
  }),
  EVocab('lenient', 'li-ni-ent', {'id': 'lunak; ringan', 'en': 'not strict'}),
  EVocab('harsh', 'harsy', {'id': 'keras; kejam', 'en': 'severe'}),
  EVocab('trial', 'trai-el', {'id': 'persidangan', 'en': 'court hearing'}),
  EVocab('guilty', 'gil-ti', {
    'id': 'bersalah',
    'en': 'responsible for a crime',
  }),
  EVocab('innocent', 'i-ne-sent', {'id': 'tidak bersalah', 'en': 'not guilty'}),
  EVocab('corruption', 'ke-rap-syen', {
    'id': 'korupsi',
    'en': 'dishonest use of power',
  }),
  EVocab('bribery', 'brai-be-ri', {
    'id': 'penyuapan',
    'en': 'giving money for favours',
  }),
  EVocab('reoffend', 'ri-o-fend', {
    'id': 'mengulangi kejahatan',
    'en': 'to commit a crime again',
  }),
  EVocab('unemployment', 'an-em-ploi-ment', {
    'id': 'pengangguran',
    'en': 'being jobless',
  }),
  EVocab('career', 'ke-rir', {'id': 'karier', 'en': 'profession'}),
  EVocab('workforce', 'werk-fors', {'id': 'tenaga kerja', 'en': 'all workers'}),
  EVocab('pension', 'pen-syen', {
    'id': 'uang pensiun',
    'en': 'retirement income',
  }),
  EVocab('job satisfaction', 'job se-tis-fek-syen', {
    'id': 'kepuasan kerja',
    'en': 'enjoyment of one\'s work',
  }),
  EVocab('work-life balance', 'werk laif be-lens', {
    'id': 'keseimbangan kerja dan hidup',
    'en': 'time for both job and private life',
  }),
  EVocab('employer', 'em-ploi-er', {
    'id': 'pemberi kerja',
    'en': 'person who hires staff',
  }),
  EVocab('self-employed', 'self em-ploid', {
    'id': 'wiraswasta',
    'en': 'working for oneself',
  }),
  EVocab('freelance', 'fri-lens', {
    'id': 'pekerja lepas',
    'en': 'working for several clients',
  }),
  EVocab('entrepreneur', 'on-tre-pre-ner', {
    'id': 'pengusaha',
    'en': 'person who starts a business',
  }),
  EVocab('cost of living', 'kost ov li-ving', {
    'id': 'biaya hidup',
    'en': 'money needed for daily needs',
  }),
  EVocab('living standards', 'li-ving sten-derdz', {
    'id': 'taraf hidup',
    'en': 'level of comfort people have',
  }),
  EVocab('wealth', 'welth', {'id': 'kekayaan', 'en': 'riches'}),
  EVocab('affluent', 'ef-lu-ent', {'id': 'makmur; kaya', 'en': 'wealthy'}),
  EVocab('prosperity', 'pros-pe-ri-ti', {
    'id': 'kemakmuran',
    'en': 'economic success',
  }),
  EVocab('recession', 'ri-se-syen', {
    'id': 'resesi',
    'en': 'economic slowdown',
  }),
  EVocab('taxpayer', 'teks-pei-er', {
    'id': 'wajib pajak',
    'en': 'person who pays tax',
  }),
  EVocab('brain drain', 'brein drein', {
    'id': 'eksodus tenaga ahli',
    'en': 'loss of skilled people abroad',
  }),
  EVocab('blue-collar', 'blu ko-ler', {
    'id': 'pekerja kasar',
    'en': 'doing physical work',
  }),
  EVocab('white-collar', 'wait ko-ler', {
    'id': 'pekerja kantoran',
    'en': 'doing office work',
  }),
  EVocab('workaholic', 'wer-ke-ho-lik', {
    'id': 'gila kerja',
    'en': 'person who works too much',
  }),
  EVocab('materialism', 'me-ti-ri-e-li-zem', {
    'id': 'materialisme',
    'en': 'love of possessions',
  }),
  EVocab('redundancy', 'ri-dan-den-si', {
    'id': 'pemutusan hubungan kerja',
    'en': 'job loss because work is no longer needed',
  }),
  EVocab('urban', 'er-ben', {'id': 'perkotaan', 'en': 'of the city'}),
  EVocab('rural', 'ru-rel', {'id': 'pedesaan', 'en': 'of the countryside'}),
  EVocab('population', 'po-pyu-lei-syen', {
    'id': 'populasi; penduduk',
    'en': 'people living in an area',
  }),
  EVocab('urbanization', 'er-be-nai-zei-syen', {
    'id': 'urbanisasi',
    'en': 'growth of cities',
  }),
  EVocab('skyscraper', 'skai-skrei-per', {
    'id': 'gedung pencakar langit',
    'en': 'very tall building',
  }),
  EVocab('high-rise', 'hai raiz', {
    'id': 'bertingkat tinggi',
    'en': 'having many floors',
  }),
  EVocab('suburb', 'sa-berb', {
    'id': 'pinggiran kota',
    'en': 'residential area outside the centre',
  }),
  EVocab('outskirts', 'aut-skerts', {
    'id': 'daerah pinggiran',
    'en': 'edge of a town',
  }),
  EVocab('slum', 'slam', {'id': 'permukiman kumuh', 'en': 'poor crowded area'}),
  EVocab('homelessness', 'houm-les-nes', {
    'id': 'tunawisma',
    'en': 'having nowhere to live',
  }),
  EVocab('affordable housing', 'e-for-de-bel hau-zing', {
    'id': 'rumah terjangkau',
    'en': 'cheap homes',
  }),
  EVocab('overcrowding', 'ou-ver-krau-ding', {
    'id': 'kepadatan berlebih',
    'en': 'too many people in one place',
  }),
  EVocab('urban sprawl', 'er-ben sprol', {
    'id': 'perluasan kota tak terkendali',
    'en': 'uncontrolled spread of a city',
  }),
  EVocab('green space', 'grin speis', {
    'id': 'ruang terbuka hijau',
    'en': 'park area',
  }),
  EVocab('amenities', 'e-me-ni-tiz', {
    'id': 'fasilitas umum',
    'en': 'useful local services',
  }),
  EVocab('neighbourhood', 'nei-ber-hud', {
    'id': 'lingkungan tempat tinggal',
    'en': 'local area',
  }),
  EVocab('landlord', 'lend-lord', {
    'id': 'pemilik kontrakan',
    'en': 'person who rents out property',
  }),
  EVocab('rent', 'rent', {'id': 'sewa', 'en': 'money paid for a home'}),
  EVocab('noise pollution', 'noiz po-lu-syen', {
    'id': 'polusi suara',
    'en': 'harmful levels of sound',
  }),
  EVocab('countryside', 'kan-tri-said', {
    'id': 'daerah pedesaan',
    'en': 'land outside towns',
  }),
  EVocab('congestion', 'ken-jes-cyen', {
    'id': 'kemacetan',
    'en': 'traffic jam',
  }),
  EVocab('commute', 'ke-myut', {
    'id': 'pulang-pergi kerja',
    'en': 'to travel to work',
  }),
  EVocab('pedestrian', 'pe-des-tri-en', {'id': 'pejalan kaki', 'en': 'walker'}),
  EVocab('rush hour', 'rasy au-er', {
    'id': 'jam sibuk',
    'en': 'busiest travel time',
  }),
  EVocab('carpool', 'kar-pul', {
    'id': 'nebeng bersama',
    'en': 'shared car journey',
  }),
  EVocab('toll road', 'toul roud', {
    'id': 'jalan tol',
    'en': 'road you pay to use',
  }),
  EVocab('bike lane', 'baik lein', {
    'id': 'jalur sepeda',
    'en': 'road strip for bicycles',
  }),
  EVocab('speed limit', 'spid li-mit', {
    'id': 'batas kecepatan',
    'en': 'maximum legal speed',
  }),
  EVocab('subway', 'sab-wei', {
    'id': 'kereta bawah tanah',
    'en': 'underground railway',
  }),
  EVocab('high-speed rail', 'hai spid reil', {
    'id': 'kereta cepat',
    'en': 'very fast train line',
  }),
  EVocab('fare', 'fer', {'id': 'ongkos; tarif', 'en': 'price of a journey'}),
  EVocab('electric car', 'i-lek-trik kar', {
    'id': 'mobil listrik',
    'en': 'battery-powered car',
  }),
  EVocab('drunk driving', 'drangk drai-ving', {
    'id': 'mengemudi dalam keadaan mabuk',
    'en': 'driving after drinking alcohol',
  }),
  EVocab('motorist', 'mou-te-rist', {
    'id': 'pengendara mobil',
    'en': 'car driver',
  }),
  EVocab('road safety', 'roud seif-ti', {
    'id': 'keselamatan jalan',
    'en': 'avoiding traffic accidents',
  }),
  EVocab('tourism', 'tu-ri-zem', {'id': 'pariwisata', 'en': 'travel industry'}),
  EVocab('leisure', 'le-zyer', {'id': 'waktu luang', 'en': 'free time'}),
  EVocab('landmark', 'lend-mark', {
    'id': 'bangunan ikonik; tengara',
    'en': 'famous place',
  }),
  EVocab('sightseeing', 'sait-si-ing', {
    'id': 'jalan-jalan melihat tempat wisata',
    'en': 'visiting famous sights',
  }),
  EVocab('souvenir', 'su-ve-nir', {
    'id': 'oleh-oleh',
    'en': 'keepsake from a trip',
  }),
  EVocab('destination', 'des-ti-nei-syen', {
    'id': 'tujuan wisata',
    'en': 'place you travel to',
  }),
  EVocab('backpacker', 'bek-pe-ker', {
    'id': 'pelancong ransel',
    'en': 'low-budget traveller',
  }),
  EVocab('package holiday', 'pe-kij ho-li-dei', {
    'id': 'paket liburan',
    'en': 'all-inclusive trip',
  }),
  EVocab('mass tourism', 'mes tu-ri-zem', {
    'id': 'pariwisata massal',
    'en': 'huge numbers of tourists',
  }),
  EVocab('ecotourism', 'i-kou-tu-ri-zem', {
    'id': 'ekowisata',
    'en': 'nature-friendly travel',
  }),
  EVocab('tourist trap', 'tu-rist trep', {
    'id': 'tempat wisata mahal',
    'en': 'overpriced place for visitors',
  }),
  EVocab('off the beaten track', 'of dhe bi-ten trek', {
    'id': 'jauh dari keramaian wisata',
    'en': 'remote and little-known',
  }),
  EVocab('jet lag', 'jet leg', {
    'id': 'mabuk perbedaan waktu',
    'en': 'tiredness after a long flight',
  }),
  EVocab('hospitality', 'hos-pi-te-li-ti', {
    'id': 'keramahan; perhotelan',
    'en': 'welcoming of guests',
  }),
  EVocab('resort', 'ri-zort', {
    'id': 'tempat peristirahatan',
    'en': 'holiday complex',
  }),
  EVocab('excursion', 'iks-ker-syen', {'id': 'tamasya', 'en': 'short trip'}),
  EVocab('cruise', 'kruz', {
    'id': 'pelayaran wisata',
    'en': 'holiday on a ship',
  }),
  EVocab('breathtaking', 'breth-tei-king', {
    'id': 'menakjubkan',
    'en': 'stunningly beautiful',
  }),
  EVocab('exotic', 'ig-zo-tik', {'id': 'eksotis', 'en': 'strange and foreign'}),
  EVocab('poverty', 'po-ver-ti', {'id': 'kemiskinan', 'en': 'being poor'}),
  EVocab('inequality', 'i-ni-kwo-li-ti', {
    'id': 'ketimpangan',
    'en': 'unfair difference',
  }),
  EVocab('charity', 'che-ri-ti', {
    'id': 'amal; badan amal',
    'en': 'giving to the needy',
  }),
  EVocab('responsibility', 'ri-spon-si-bi-li-ti', {
    'id': 'tanggung jawab',
    'en': 'duty',
  }),
  EVocab('independence', 'in-di-pen-dens', {
    'id': 'kemandirian',
    'en': 'freedom',
  }),
  EVocab('stereotype', 'ste-ri-o-taip', {
    'id': 'stereotip',
    'en': 'fixed idea about a group',
  }),
  EVocab('upbringing', 'ap-bring-ing', {
    'id': 'pola asuh',
    'en': 'way a child is raised',
  }),
  EVocab('nuclear family', 'nyu-kli-er fe-mi-li', {
    'id': 'keluarga inti',
    'en': 'parents and children only',
  }),
  EVocab('extended family', 'iks-ten-ded fe-mi-li', {
    'id': 'keluarga besar',
    'en': 'relatives beyond parents and children',
  }),
  EVocab('sibling', 'sib-ling', {
    'id': 'saudara kandung',
    'en': 'brother or sister',
  }),
  EVocab('single parent', 'sing-gel pe-rent', {
    'id': 'orang tua tunggal',
    'en': 'mother or father raising a child alone',
  }),
  EVocab('breadwinner', 'bred-wi-ner', {
    'id': 'pencari nafkah',
    'en': 'main earner',
  }),
  EVocab('household chores', 'haus-hould corz', {
    'id': 'pekerjaan rumah tangga',
    'en': 'cleaning and cooking at home',
  }),
  EVocab('the elderly', 'dhi el-der-li', {'id': 'lansia', 'en': 'old people'}),
  EVocab('nursing home', 'ner-sing houm', {
    'id': 'panti jompo',
    'en': 'care home for old people',
  }),
  EVocab('role model', 'roul mo-del', {
    'id': 'panutan',
    'en': 'person to look up to',
  }),
  EVocab('childcare', 'caild-ker', {
    'id': 'pengasuhan anak',
    'en': 'looking after children',
  }),
  EVocab('adolescence', 'e-de-le-sens', {
    'id': 'masa remaja',
    'en': 'teenage years',
  }),
  EVocab('parenting', 'pe-ren-ting', {
    'id': 'cara mendidik anak',
    'en': 'raising children',
  }),
  EVocab('spoilt', 'spoilt', {'id': 'manja', 'en': 'given too much'}),
  EVocab('obedient', 'e-bi-di-ent', {'id': 'patuh', 'en': 'doing as told'}),
  EVocab('divorce', 'di-vors', {'id': 'perceraian', 'en': 'end of a marriage'}),
  EVocab('heritage', 'he-ri-tij', {
    'id': 'warisan budaya',
    'en': 'inherited culture',
  }),
  EVocab('art gallery', 'art ge-le-ri', {
    'id': 'galeri seni',
    'en': 'place showing paintings',
  }),
  EVocab('masterpiece', 'mas-ter-pis', {
    'id': 'mahakarya',
    'en': 'greatest work',
  }),
  EVocab('sculpture', 'skalp-cer', {
    'id': 'patung; seni pahat',
    'en': 'carved artwork',
  }),
  EVocab('handicraft', 'hen-di-kreft', {
    'id': 'kerajinan tangan',
    'en': 'item made by hand',
  }),
  EVocab('folk music', 'fouk myu-zik', {
    'id': 'musik rakyat',
    'en': 'traditional songs',
  }),
  EVocab('festival', 'fes-ti-vel', {
    'id': 'festival; perayaan',
    'en': 'celebration',
  }),
  EVocab('costume', 'kos-tyum', {
    'id': 'kostum; pakaian adat',
    'en': 'special clothing',
  }),
  EVocab('custom', 'kas-tem', {
    'id': 'adat istiadat',
    'en': 'usual practice of a people',
  }),
  EVocab('cuisine', 'kwi-zin', {
    'id': 'masakan khas',
    'en': 'style of cooking',
  }),
  EVocab('monument', 'mo-nyu-ment', {
    'id': 'monumen',
    'en': 'structure honouring a person or event',
  }),
  EVocab('architecture', 'ar-ki-tek-cer', {
    'id': 'arsitektur',
    'en': 'design of buildings',
  }),
  EVocab('indigenous', 'in-di-je-nes', {
    'id': 'pribumi; asli',
    'en': 'native to a place',
  }),
  EVocab('dialect', 'dai-e-lekt', {
    'id': 'logat; dialek',
    'en': 'regional form of a language',
  }),
  EVocab('mother tongue', 'ma-dher tang', {
    'id': 'bahasa ibu',
    'en': 'first language',
  }),
  EVocab('bilingual', 'bai-ling-gwel', {
    'id': 'dwibahasa',
    'en': 'speaking two languages',
  }),
  EVocab('theatre', 'thi-e-ter', {
    'id': 'teater; gedung pertunjukan',
    'en': 'place for plays',
  }),
  EVocab('playwright', 'plei-rait', {
    'id': 'penulis naskah drama',
    'en': 'writer of plays',
  }),
  EVocab('novelist', 'no-ve-list', {'id': 'novelis', 'en': 'writer of novels'}),
  EVocab('orchestra', 'or-kes-tre', {
    'id': 'orkestra',
    'en': 'large group of musicians',
  }),
  EVocab('athlete', 'eth-lit', {'id': 'atlet', 'en': 'sportsperson'}),
  EVocab('spectator', 'spek-tei-ter', {
    'id': 'penonton',
    'en': 'person watching an event',
  }),
  EVocab('amateur', 'e-me-ter', {'id': 'amatir', 'en': 'unpaid player'}),
  EVocab('tournament', 'tur-ne-ment', {
    'id': 'turnamen',
    'en': 'series of matches',
  }),
  EVocab('championship', 'cem-pi-en-syip', {
    'id': 'kejuaraan',
    'en': 'contest to find the best',
  }),
  EVocab('referee', 're-fe-ri', {'id': 'wasit', 'en': 'match official'}),
  EVocab('doping', 'dou-ping', {
    'id': 'doping; obat perangsang',
    'en': 'illegal drug use in sport',
  }),
  EVocab('sportsmanship', 'sports-men-syip', {
    'id': 'sportivitas',
    'en': 'fair play',
  }),
  EVocab('stamina', 'ste-mi-ne', {
    'id': 'stamina; daya tahan',
    'en': 'physical endurance',
  }),
  EVocab('extreme sports', 'iks-trim sports', {
    'id': 'olahraga ekstrem',
    'en': 'dangerous activities like skydiving',
  }),
  EVocab('coach', 'kouc', {'id': 'pelatih', 'en': 'sports trainer'}),
  EVocab('trophy', 'trou-fi', {'id': 'piala', 'en': 'prize cup'}),
  EVocab('team spirit', 'tim spi-rit', {
    'id': 'semangat tim',
    'en': 'feeling of unity in a group',
  }),
  EVocab('fast food', 'fest fud', {
    'id': 'makanan cepat saji',
    'en': 'quick restaurant meals',
  }),
  EVocab('takeaway', 'tei-ke-wei', {
    'id': 'makanan bungkus',
    'en': 'food to eat elsewhere',
  }),
  EVocab('home-cooked', 'houm kukt', {
    'id': 'masakan rumahan',
    'en': 'prepared at home',
  }),
  EVocab('vegetarian', 've-je-te-ri-en', {
    'id': 'vegetarian',
    'en': 'person who eats no meat',
  }),
  EVocab('vegan', 'vi-gen', {
    'id': 'vegan',
    'en': 'person who eats no animal products',
  }),
  EVocab('preservative', 'pri-zer-ve-tiv', {
    'id': 'pengawet',
    'en': 'chemical that keeps food fresh',
  }),
  EVocab('calorie', 'ke-le-ri', {'id': 'kalori', 'en': 'unit of food energy'}),
  EVocab('staple food', 'stei-pel fud', {
    'id': 'makanan pokok',
    'en': 'main basic food',
  }),
  EVocab('genetically modified', 'je-ne-ti-kli mo-di-faid', {
    'id': 'rekayasa genetik',
    'en': 'with altered genes',
  }),
  EVocab('famine', 'fe-min', {
    'id': 'bencana kelaparan',
    'en': 'extreme food shortage',
  }),
  EVocab('organic', 'or-ge-nik', {
    'id': 'organik',
    'en': 'grown without chemicals',
  }),
  EVocab('nutritious', 'nyu-tri-syes', {
    'id': 'bergizi',
    'en': 'healthy to eat',
  }),
  EVocab('eating habits', 'i-ting he-bits', {
    'id': 'kebiasaan makan',
    'en': 'usual diet patterns',
  }),
  EVocab('street food', 'strit fud', {
    'id': 'jajanan kaki lima',
    'en': 'snacks sold outdoors',
  }),
  EVocab('multinational', 'mal-ti-ne-syo-nel', {
    'id': 'multinasional',
    'en': 'operating in many countries',
  }),
  EVocab('free trade', 'fri treid', {
    'id': 'perdagangan bebas',
    'en': 'commerce without tariffs',
  }),
  EVocab('westernization', 'wes-ter-nai-zei-syen', {
    'id': 'pembaratan',
    'en': 'adopting Western ways',
  }),
  EVocab('developing country', 'di-ve-le-ping kan-tri', {
    'id': 'negara berkembang',
    'en': 'poorer nation',
  }),
  EVocab('developed country', 'di-ve-lopt kan-tri', {
    'id': 'negara maju',
    'en': 'rich industrial nation',
  }),
  EVocab('foreign aid', 'fo-ren eid', {
    'id': 'bantuan luar negeri',
    'en': 'help given to other nations',
  }),
  EVocab('expatriate', 'eks-pe-tri-et', {
    'id': 'ekspatriat',
    'en': 'person living abroad',
  }),
  EVocab('sweatshop', 'swet-syop', {
    'id': 'pabrik upah rendah',
    'en': 'factory with poor conditions',
  }),
  EVocab('fair trade', 'fer treid', {
    'id': 'perdagangan adil',
    'en': 'paying producers fairly',
  }),
  EVocab('worldwide', 'werld-waid', {
    'id': 'di seluruh dunia',
    'en': 'across the globe',
  }),
  EVocab('peak', 'pik', {'id': 'puncak', 'en': 'highest point'}),
  EVocab('plummet', 'pla-met', {'id': 'anjlok', 'en': 'to fall sharply'}),
  EVocab('steady', 'ste-di', {'id': 'stabil; mantap', 'en': 'unchanging'}),
  EVocab('gradual', 'gre-jyu-el', {'id': 'bertahap', 'en': 'slow and steady'}),
  EVocab('surge', 'serj', {'id': 'melonjak', 'en': 'to rise suddenly'}),
  EVocab('soar', 'sor', {'id': 'meroket', 'en': 'to climb very high'}),
  EVocab('dip', 'dip', {'id': 'turun sedikit', 'en': 'small fall'}),
  EVocab('level off', 'le-vel of', {
    'id': 'mendatar; tidak berubah lagi',
    'en': 'to stop rising or falling',
  }),
  EVocab('plateau', 'ple-tou', {'id': 'masa stagnan', 'en': 'flat period'}),
  EVocab('slump', 'slamp', {'id': 'merosot tajam', 'en': 'sudden heavy drop'}),
  EVocab('bottom out', 'bo-tem aut', {
    'id': 'mencapai titik terendah',
    'en': 'to reach the lowest point',
  }),
  EVocab('rebound', 'ri-baund', {
    'id': 'naik kembali',
    'en': 'to recover after a fall',
  }),
  EVocab('halve', 'hav', {'id': 'berkurang separuh', 'en': 'to reduce by 50%'}),
  EVocab('double', 'da-bel', {
    'id': 'naik dua kali lipat',
    'en': 'to become twice as big',
  }),
  EVocab('outnumber', 'aut-nam-ber', {
    'id': 'melebihi jumlah',
    'en': 'to be more than',
  }),
  EVocab('overtake', 'ou-ver-teik', {'id': 'menyalip', 'en': 'to go past'}),
  EVocab('sharp', 'syarp', {
    'id': 'tajam (perubahan)',
    'en': 'sudden and large',
  }),
  EVocab('slight', 'slait', {'id': 'sedikit; tipis', 'en': 'small'}),
  EVocab('steep', 'stip', {'id': 'curam', 'en': 'rising or falling quickly'}),
  EVocab('marginal', 'mar-ji-nel', {
    'id': 'sangat kecil',
    'en': 'tiny in amount',
  }),
  EVocab('substantial', 'seb-sten-syel', {
    'id': 'cukup besar',
    'en': 'large in amount',
  }),
  EVocab('erratic', 'i-re-tik', {
    'id': 'naik turun tak menentu',
    'en': 'irregular',
  }),
  EVocab('steadily', 'ste-di-li', {
    'id': 'secara stabil',
    'en': 'at an even rate',
  }),
  EVocab('respectively', 'ri-spek-tiv-li', {
    'id': 'secara berurutan',
    'en': 'in the order given',
  }),
  EVocab('the lowest point', 'dhe lou-est point', {
    'id': 'titik terendah',
    'en': 'minimum level',
  }),
  EVocab('roughly', 'raf-li', {'id': 'kurang lebih', 'en': 'about'}),
  EVocab('nearly', 'nir-li', {'id': 'hampir', 'en': 'almost'}),
  EVocab('a quarter', 'e kwor-ter', {'id': 'seperempat', 'en': 'one in four'}),
  EVocab('moreover', 'mor-ou-ver', {'id': 'lagi pula', 'en': 'in addition'}),
  EVocab('however', 'hau-e-ver', {'id': 'namun', 'en': 'but'}),
  EVocab('therefore', 'dher-for', {'id': 'oleh karena itu', 'en': 'so'}),
  EVocab('argue', 'ar-gyu', {'id': 'berpendapat; berdebat', 'en': 'to claim'}),
  EVocab('drawback', 'dro-bek', {'id': 'kekurangan', 'en': 'disadvantage'}),
  EVocab('on the whole', 'on dhe houl', {
    'id': 'pada umumnya',
    'en': 'generally',
  }),
  EVocab('to some extent', 'tu sam iks-tent', {
    'id': 'sampai batas tertentu',
    'en': 'partly',
  }),
  EVocab('it could be argued that', 'it kud bi ar-gyud dhet', {
    'id': 'bisa dikatakan bahwa',
    'en': 'one might claim that',
  }),
  EVocab('by and large', 'bai end larj', {
    'id': 'secara garis besar',
    'en': 'mostly',
  }),
  EVocab('all things considered', 'ol things ken-si-derd', {
    'id': 'setelah menimbang semuanya',
    'en': 'taking everything into account',
  }),
  EVocab('admittedly', 'ed-mi-ted-li', {
    'id': 'harus diakui',
    'en': 'it must be accepted',
  }),
  EVocab('arguably', 'ar-gyu-e-bli', {
    'id': 'bisa dibilang',
    'en': 'possibly true',
  }),
  EVocab('undoubtedly', 'an-dau-ted-li', {
    'id': 'tidak diragukan lagi',
    'en': 'certainly',
  }),
  EVocab('thus', 'dhas', {'id': 'dengan demikian', 'en': 'as a result'}),
  EVocab('meanwhile', 'min-wail', {
    'id': 'sementara itu',
    'en': 'at the same time',
  }),
  EVocab('besides', 'bi-saidz', {
    'id': 'selain itu juga',
    'en': 'as well as that',
  }),
  EVocab('on the other hand', 'on dhi a-dher hend', {
    'id': 'di sisi lain',
    'en': 'from another angle',
  }),
  EVocab('in the long run', 'in dhe long ran', {
    'id': 'dalam jangka panjang',
    'en': 'eventually',
  }),
  EVocab('in the short term', 'in dhe syort term', {
    'id': 'dalam jangka pendek',
    'en': 'for now',
  }),
  EVocab('owing to', 'ou-ing tu', {
    'id': 'karena; disebabkan oleh',
    'en': 'because of',
  }),
  EVocab('in terms of', 'in termz ov', {'id': 'dari segi', 'en': 'regarding'}),
  EVocab('in other words', 'in a-dher werdz', {
    'id': 'dengan kata lain',
    'en': 'to put it differently',
  }),
  EVocab('to sum up', 'tu sam ap', {'id': 'singkatnya', 'en': 'to summarize'}),
  EVocab('first and foremost', 'ferst end for-moust', {
    'id': 'pertama dan terutama',
    'en': 'most importantly',
  }),
  EVocab('it is widely believed that', 'it iz waid-li bi-livd dhet', {
    'id': 'banyak orang percaya bahwa',
    'en': 'many people think that',
  }),
  EVocab('there is no doubt that', 'dher iz nou daut dhet', {
    'id': 'tak diragukan bahwa',
    'en': 'it is certain that',
  }),
  EVocab('it goes without saying', 'it gouz wi-dhaut sei-ing', {
    'id': 'sudah jelas',
    'en': 'obviously',
  }),
  EVocab('in my view', 'in mai vyu', {'id': 'menurut saya', 'en': 'I believe'}),
  EVocab('to a large degree', 'tu e larj di-gri', {
    'id': 'sebagian besar',
    'en': 'largely',
  }),
  EVocab('not to mention', 'not tu men-syen', {
    'id': 'belum lagi',
    'en': 'and also',
  }),
  EVocab('even though', 'i-ven dhou', {'id': 'meskipun', 'en': 'although'}),
  EVocab('as long as', 'ez long ez', {'id': 'asalkan', 'en': 'provided that'}),
  EVocab('apart from', 'e-part from', {
    'id': 'selain; kecuali',
    'en': 'except for',
  }),
];

/// TOEIC: kantor & bisnis.
const List<EVocab> toeicVocab = [
  EVocab('headquarters', 'hed-kwor-ters', {
    'id': 'kantor pusat',
    'en': 'main office',
  }),
  EVocab('branch', 'brenc', {'id': 'cabang', 'en': 'local office'}),
  EVocab('department', 'di-part-ment', {
    'id': 'departemen; bagian',
    'en': 'division',
  }),
  EVocab('reception', 'ri-sep-syen', {
    'id': 'meja resepsionis',
    'en': 'front desk',
  }),
  EVocab('extension', 'iks-ten-syen', {
    'id': 'nomor ekstensi telepon',
    'en': 'internal phone number',
  }),
  EVocab('voicemail', 'vois-meil', {
    'id': 'pesan suara',
    'en': 'recorded message',
  }),
  EVocab('directory', 'di-rek-to-ri', {
    'id': 'direktori',
    'en': 'list of names',
  }),
  EVocab('memo', 'me-mou', {'id': 'memo', 'en': 'short note'}),
  EVocab('cubicle', 'kyu-bi-kel', {
    'id': 'bilik kerja',
    'en': 'small office booth',
  }),
  EVocab('stationery', 'stei-syen-ne-ri', {
    'id': 'alat tulis kantor',
    'en': 'office writing supplies',
  }),
  EVocab('filing cabinet', 'fai-ling ke-bi-net', {
    'id': 'lemari arsip',
    'en': 'cabinet for papers',
  }),
  EVocab('bulletin board', 'bu-le-tin bord', {
    'id': 'papan pengumuman',
    'en': 'noticeboard',
  }),
  EVocab('whiteboard', 'wait-bord', {
    'id': 'papan tulis putih',
    'en': 'marker board',
  }),
  EVocab('envelope', 'en-ve-loup', {
    'id': 'amplop',
    'en': 'paper cover for a letter',
  }),
  EVocab('letterhead', 'le-ter-hed', {
    'id': 'kop surat',
    'en': 'printed heading on paper',
  }),
  EVocab('fax machine', 'feks me-syin', {
    'id': 'mesin faks',
    'en': 'machine sending copies by phone line',
  }),
  EVocab('shredder', 'syre-der', {
    'id': 'mesin penghancur kertas',
    'en': 'paper-cutting machine',
  }),
  EVocab('paperwork', 'pei-per-werk', {
    'id': 'urusan administrasi',
    'en': 'office forms and records',
  }),
  EVocab('clerical', 'kle-ri-kel', {
    'id': 'berkaitan dengan tata usaha',
    'en': 'related to office work',
  }),
  EVocab('secretary', 'se-kre-te-ri', {
    'id': 'sekretaris',
    'en': 'administrative assistant',
  }),
  EVocab('workstation', 'werk-stei-syen', {
    'id': 'meja kerja',
    'en': 'desk with a computer',
  }),
  EVocab('break room', 'breik rum', {
    'id': 'ruang istirahat',
    'en': 'staff lounge',
  }),
  EVocab('boardroom', 'bord-rum', {
    'id': 'ruang rapat direksi',
    'en': 'room for directors\' meetings',
  }),
  EVocab('lobby', 'lo-bi', {'id': 'lobi', 'en': 'entrance hall'}),
  EVocab('elevator', 'e-le-vei-ter', {'id': 'lift', 'en': 'lift'}),
  EVocab('stairway', 'ster-wei', {'id': 'tangga', 'en': 'staircase'}),
  EVocab('corridor', 'ko-ri-dor', {'id': 'koridor; lorong', 'en': 'hallway'}),
  EVocab('parking lot', 'par-king lot', {
    'id': 'tempat parkir',
    'en': 'car park',
  }),
  EVocab('premises', 'pre-mi-sis', {
    'id': 'lingkungan gedung',
    'en': 'land and buildings of a business',
  }),
  EVocab('floor plan', 'flor plen', {
    'id': 'denah lantai',
    'en': 'layout drawing',
  }),
  EVocab('binder', 'bain-der', {'id': 'map ring', 'en': 'ring folder'}),
  EVocab('notepad', 'nout-ped', {
    'id': 'buku catatan kecil',
    'en': 'small writing pad',
  }),
  EVocab('sticky note', 'sti-ki nout', {
    'id': 'kertas tempel',
    'en': 'adhesive memo slip',
  }),
  EVocab('toner', 'tou-ner', {'id': 'toner printer', 'en': 'printer powder'}),
  EVocab('cartridge', 'kar-trij', {
    'id': 'kartrid tinta',
    'en': 'ink container',
  }),
  EVocab('jammed', 'jemd', {'id': 'macet (mesin)', 'en': 'stuck'}),
  EVocab('out of order', 'aut ov or-der', {
    'id': 'rusak (tidak berfungsi)',
    'en': 'not working',
  }),
  EVocab('janitor', 'je-ni-ter', {
    'id': 'petugas kebersihan',
    'en': 'building cleaner',
  }),
  EVocab('mailroom', 'meil-rum', {
    'id': 'ruang surat',
    'en': 'room for incoming post',
  }),
  EVocab('stamp', 'stemp', {'id': 'perangko', 'en': 'postage label'}),
  EVocab('proofread', 'pruf-rid', {
    'id': 'mengoreksi naskah',
    'en': 'check text for errors',
  }),
  EVocab('archive', 'ar-kaiv', {'id': 'arsip', 'en': 'stored records'}),
  EVocab('air conditioning', 'eir ken-di-syo-ning', {
    'id': 'pendingin ruangan',
    'en': 'AC',
  }),
  EVocab('cafeteria', 'ke-fe-ti-ri-a', {'id': 'kantin', 'en': 'staff canteen'}),
  EVocab('vending machine', 'ven-ding me-syin', {
    'id': 'mesin penjual otomatis',
    'en': 'coin-operated seller',
  }),
  EVocab('handbook', 'hend-buk', {'id': 'buku pegangan', 'en': 'guide book'}),
  EVocab('announcement', 'e-nauns-ment', {
    'id': 'pengumuman',
    'en': 'public statement',
  }),
  EVocab('newsletter', 'nyuz-le-ter', {
    'id': 'buletin berkala',
    'en': 'regular news bulletin',
  }),
  EVocab('confidential', 'kon-fi-den-syel', {'id': 'rahasia', 'en': 'private'}),
  EVocab('urgent', 'er-jent', {'id': 'mendesak', 'en': 'needing quick action'}),
  EVocab('approve', 'e-pruv', {'id': 'menyetujui', 'en': 'accept officially'}),
  EVocab('permit', 'per-mit', {
    'id': 'izin (dokumen)',
    'en': 'official authorization paper',
  }),
  EVocab('workflow', 'werk-flou', {
    'id': 'alur kerja',
    'en': 'sequence of tasks',
  }),
  EVocab('bottleneck', 'bo-tel-nek', {
    'id': 'hambatan',
    'en': 'point of congestion',
  }),
  EVocab('backlog', 'bek-log', {
    'id': 'tumpukan pekerjaan tertunda',
    'en': 'unfinished work pile',
  }),
  EVocab('progress', 'pro-gres', {'id': 'kemajuan', 'en': 'advance'}),
  EVocab('milestone', 'mail-stoun', {
    'id': 'tonggak pencapaian',
    'en': 'important stage',
  }),
  EVocab('business hours', 'biz-nis au-ers', {
    'id': 'jam kerja kantor',
    'en': 'opening times',
  }),
  EVocab('weekday', 'wik-dei', {'id': 'hari kerja', 'en': 'Monday to Friday'}),
  EVocab('workload', 'werk-loud', {
    'id': 'beban kerja',
    'en': 'amount of work',
  }),
  EVocab('coworker', 'kou-wer-ker', {
    'id': 'rekan sekantor',
    'en': 'person you work with',
  }),
  EVocab('fill out', 'fil aut', {
    'id': 'mengisi (formulir)',
    'en': 'complete a form',
  }),
  EVocab('hand in', 'hend in', {
    'id': 'menyerahkan',
    'en': 'give to someone in charge',
  }),
  EVocab('board of directors', 'bord ov di-rek-ters', {
    'id': 'dewan direksi',
    'en': 'company\'s governing group',
  }),
  EVocab('chairperson', 'cer-per-sen', {
    'id': 'ketua',
    'en': 'person leading a meeting',
  }),
  EVocab('executive', 'ig-ze-kyu-tiv', {
    'id': 'eksekutif',
    'en': 'senior manager',
  }),
  EVocab('supervisor', 'su-per-vai-zer', {
    'id': 'penyelia; atasan',
    'en': 'person in charge',
  }),
  EVocab('personnel', 'per-so-nel', {'id': 'personalia; staf', 'en': 'staff'}),
  EVocab('shareholder', 'syer-houl-der', {
    'id': 'pemegang saham',
    'en': 'stock owner',
  }),
  EVocab('stakeholder', 'steik-houl-der', {
    'id': 'pemangku kepentingan',
    'en': 'interested party',
  }),
  EVocab('subsidiary', 'sab-si-di-e-ri', {
    'id': 'anak perusahaan',
    'en': 'company owned by another',
  }),
  EVocab('merger', 'mer-jer', {
    'id': 'penggabungan perusahaan',
    'en': 'joining of companies',
  }),
  EVocab('firm', 'ferm', {'id': 'firma', 'en': 'business company'}),
  EVocab('enterprise', 'en-ter-praiz', {
    'id': 'perusahaan',
    'en': 'business organization',
  }),
  EVocab('joint venture', 'joint ven-cer', {
    'id': 'usaha patungan',
    'en': 'shared business project',
  }),
  EVocab('downsize', 'daun-saiz', {
    'id': 'mengurangi jumlah karyawan',
    'en': 'reduce company size',
  }),
  EVocab('streamline', 'strim-lain', {
    'id': 'merampingkan proses',
    'en': 'make more efficient',
  }),
  EVocab('in charge of', 'in carj ov', {
    'id': 'bertanggung jawab atas',
    'en': 'responsible for',
  }),
  EVocab('report to', 'ri-port tu', {
    'id': 'melapor kepada',
    'en': 'be supervised by',
  }),
  EVocab('take over', 'teik ou-ver', {
    'id': 'mengambil alih',
    'en': 'assume control',
  }),
  EVocab('oversee', 'ou-ver-si', {'id': 'mengawasi', 'en': 'supervise'}),
  EVocab('delegate', 'de-le-geit', {
    'id': 'mendelegasikan',
    'en': 'give tasks to others',
  }),
  EVocab('understaffed', 'an-der-steft', {
    'id': 'kekurangan staf',
    'en': 'short of workers',
  }),
  EVocab('minutes', 'mi-nits', {'id': 'notulen rapat', 'en': 'meeting notes'}),
  EVocab('appointment', 'e-point-ment', {
    'id': 'janji temu',
    'en': 'arranged meeting',
  }),
  EVocab('postpone', 'poust-poun', {'id': 'menunda', 'en': 'to delay'}),
  EVocab('attendee', 'e-ten-di', {'id': 'peserta', 'en': 'participant'}),
  EVocab('seminar', 'se-mi-nar', {'id': 'seminar', 'en': 'discussion meeting'}),
  EVocab('webinar', 'we-bi-nar', {
    'id': 'seminar daring',
    'en': 'online seminar',
  }),
  EVocab('adjourn', 'e-jern', {
    'id': 'menutup rapat sementara',
    'en': 'close a meeting until later',
  }),
  EVocab('brainstorm', 'brein-storm', {
    'id': 'curah pendapat',
    'en': 'generate ideas together',
  }),
  EVocab('consensus', 'ken-sen-ses', {
    'id': 'kesepakatan bersama',
    'en': 'general agreement',
  }),
  EVocab('vote', 'vout', {'id': 'memberi suara', 'en': 'choose formally'}),
  EVocab('motion', 'mou-syen', {
    'id': 'usul (dalam rapat)',
    'en': 'formal suggestion in a meeting',
  }),
  EVocab('handout', 'hend-aut', {
    'id': 'bahan bagikan',
    'en': 'printed sheet given out',
  }),
  EVocab('keynote speech', 'ki-nout spic', {
    'id': 'pidato utama',
    'en': 'main talk',
  }),
  EVocab('speaker', 'spi-ker', {
    'id': 'pembicara',
    'en': 'person giving a talk',
  }),
  EVocab('take notes', 'teik nouts', {
    'id': 'mencatat',
    'en': 'write things down',
  }),
  EVocab('follow up', 'fo-lou ap', {
    'id': 'menindaklanjuti',
    'en': 'check on later',
  }),
  EVocab('touch base', 'tac beis', {
    'id': 'berkabar singkat',
    'en': 'make brief contact',
  }),
  EVocab('get back to', 'get bek tu', {
    'id': 'menghubungi kembali',
    'en': 'reply later',
  }),
  EVocab('run late', 'ran leit', {
    'id': 'terlambat dari jadwal',
    'en': 'be behind time',
  }),
  EVocab('ahead of time', 'e-hed ov taim', {'id': 'lebih awal', 'en': 'early'}),
  EVocab('in advance', 'in ed-vens', {
    'id': 'di muka; sebelumnya',
    'en': 'beforehand',
  }),
  EVocab('convenient', 'ken-vi-ni-ent', {
    'id': 'cocok (waktunya)',
    'en': 'suitable',
  }),
  EVocab('in person', 'in per-sen', {
    'id': 'secara langsung',
    'en': 'face to face',
  }),
  EVocab('tentative', 'ten-te-tiv', {
    'id': 'sementara (belum pasti)',
    'en': 'not yet fixed',
  }),
  EVocab('rehearsal', 'ri-her-sel', {'id': 'gladi', 'en': 'practice run'}),
  EVocab('go over', 'gou ou-ver', {'id': 'memeriksa ulang', 'en': 'review'}),
  EVocab('point out', 'point aut', {'id': 'menunjukkan', 'en': 'indicate'}),
  EVocab('come up with', 'kam ap wid', {
    'id': 'mencetuskan (ide)',
    'en': 'think of',
  }),
  EVocab('go ahead', 'gou e-hed', {'id': 'silakan lanjut', 'en': 'proceed'}),
  EVocab('take place', 'teik pleis', {'id': 'berlangsung', 'en': 'happen'}),
  EVocab('look forward to', 'luk for-werd tu', {
    'id': 'menantikan',
    'en': 'await eagerly',
  }),
  EVocab('feasible', 'fi-zi-bel', {
    'id': 'layak dikerjakan',
    'en': 'possible to do',
  }),
  EVocab('proposal', 'pro-pou-zel', {
    'id': 'proposal; usulan',
    'en': 'plan offered',
  }),
  EVocab('applicant', 'ep-li-kent', {'id': 'pelamar', 'en': 'job seeker'}),
  EVocab('résumé', 're-zyu-mei', {'id': 'riwayat hidup', 'en': 'CV'}),
  EVocab('recruit', 'ri-krut', {'id': 'merekrut', 'en': 'to find new staff'}),
  EVocab('hire', 'hai-er', {'id': 'mempekerjakan', 'en': 'to employ'}),
  EVocab('resign', 'ri-zain', {'id': 'mengundurkan diri', 'en': 'to quit'}),
  EVocab('probation', 'pro-bei-syen', {
    'id': 'masa percobaan',
    'en': 'trial period at work',
  }),
  EVocab('performance', 'per-for-mens', {
    'id': 'kinerja',
    'en': 'work quality',
  }),
  EVocab('payroll', 'pei-roul', {
    'id': 'daftar gaji',
    'en': 'list of salaries',
  }),
  EVocab('vacancy', 'vei-ken-si', {'id': 'lowongan', 'en': 'open position'}),
  EVocab('candidate', 'ken-di-deit', {
    'id': 'kandidat',
    'en': 'person being considered',
  }),
  EVocab('qualification', 'kwo-li-fi-kei-syen', {
    'id': 'kualifikasi',
    'en': 'required skill or degree',
  }),
  EVocab('credentials', 'kre-den-syels', {
    'id': 'bukti kualifikasi',
    'en': 'proofs of competence',
  }),
  EVocab('reference letter', 're-fe-rens le-ter', {
    'id': 'surat rekomendasi',
    'en': 'letter vouching for someone',
  }),
  EVocab('cover letter', 'ka-ver le-ter', {
    'id': 'surat lamaran',
    'en': 'letter sent with a CV',
  }),
  EVocab('experienced', 'iks-pi-ri-enst', {
    'id': 'berpengalaman',
    'en': 'skilled through practice',
  }),
  EVocab('full-time', 'ful-taim', {
    'id': 'penuh waktu',
    'en': 'working all normal hours',
  }),
  EVocab('part-time', 'part-taim', {
    'id': 'paruh waktu',
    'en': 'working fewer hours',
  }),
  EVocab('permanent', 'per-me-nent', {
    'id': 'tetap (status kerja)',
    'en': 'lasting',
  }),
  EVocab('employment', 'im-ploi-ment', {
    'id': 'status bekerja',
    'en': 'having paid work',
  }),
  EVocab('workplace', 'werk-pleis', {
    'id': 'tempat kerja',
    'en': 'place of work',
  }),
  EVocab('onboarding', 'on-bor-ding', {
    'id': 'proses penerimaan karyawan baru',
    'en': 'integration of new hires',
  }),
  EVocab('trainee', 'trei-ni', {
    'id': 'peserta pelatihan',
    'en': 'person being trained',
  }),
  EVocab('mentor', 'men-tor', {
    'id': 'mentor; pembimbing',
    'en': 'experienced guide',
  }),
  EVocab('appraisal', 'e-prei-zel', {
    'id': 'penilaian kinerja',
    'en': 'formal evaluation of staff',
  }),
  EVocab('raise', 'reiz', {'id': 'kenaikan gaji', 'en': 'pay increase'}),
  EVocab('bonus', 'bou-nes', {'id': 'bonus', 'en': 'extra pay'}),
  EVocab('pay slip', 'pei slip', {'id': 'slip gaji', 'en': 'salary statement'}),
  EVocab('payday', 'pei-dei', {
    'id': 'hari gajian',
    'en': 'day wages are paid',
  }),
  EVocab('dismiss', 'dis-mis', {'id': 'memberhentikan', 'en': 'to fire'}),
  EVocab('lay off', 'lei of', {'id': 'mem-PHK', 'en': 'cut jobs'}),
  EVocab('retire', 'ri-tai-er', {
    'id': 'pensiun',
    'en': 'stop working due to age',
  }),
  EVocab('shortlist', 'syort-list', {
    'id': 'daftar pendek kandidat',
    'en': 'final selection list',
  }),
  EVocab('turn down', 'tern daun', {'id': 'menolak', 'en': 'refuse'}),
  EVocab('step down', 'step daun', {
    'id': 'mundur dari jabatan',
    'en': 'leave a senior post',
  }),
  EVocab('morale', 'mo-ral', {'id': 'semangat kerja', 'en': 'team spirit'}),
  EVocab('dedicated', 'de-di-kei-tid', {
    'id': 'berdedikasi',
    'en': 'committed',
  }),
  EVocab('diligent', 'di-li-jent', {'id': 'rajin', 'en': 'hard-working'}),
  EVocab('punctual', 'pank-cu-el', {'id': 'tepat waktu', 'en': 'on time'}),
  EVocab('competent', 'kom-pe-tent', {'id': 'cakap', 'en': 'capable'}),
  EVocab('leadership', 'li-der-syip', {
    'id': 'kepemimpinan',
    'en': 'ability to lead',
  }),
  EVocab('collaborate', 'ke-le-be-reit', {
    'id': 'bekerja sama',
    'en': 'work jointly',
  }),
  EVocab('remote work', 'ri-mout werk', {
    'id': 'kerja jarak jauh',
    'en': 'working from home',
  }),
  EVocab('day off', 'dei of', {
    'id': 'hari libur kerja',
    'en': 'non-working day',
  }),
  EVocab('sick leave', 'sik liv', {
    'id': 'cuti sakit',
    'en': 'absence due to illness',
  }),
  EVocab('maternity leave', 'me-ter-ni-ti liv', {
    'id': 'cuti melahirkan',
    'en': 'leave for new mothers',
  }),
  EVocab('vacation', 'vei-kei-syen', {'id': 'liburan', 'en': 'holiday'}),
  EVocab('time sheet', 'taim syit', {
    'id': 'lembar jam kerja',
    'en': 'record of hours worked',
  }),
  EVocab('dress code', 'dres koud', {
    'id': 'aturan berpakaian',
    'en': 'clothing rules',
  }),
  EVocab('badge', 'bej', {'id': 'tanda pengenal', 'en': 'ID worn at work'}),
  EVocab('out of the office', 'aut ov dhi o-fis', {
    'id': 'sedang tidak di kantor',
    'en': 'away from work',
  }),
  EVocab('fill in for', 'fil in for', {
    'id': 'menggantikan sementara',
    'en': 'cover for a colleague',
  }),
  EVocab('severance pay', 'se-ve-rens pei', {
    'id': 'pesangon',
    'en': 'payment when dismissed',
  }),
  EVocab('grievance', 'gri-vens', {
    'id': 'pengaduan karyawan',
    'en': 'formal staff complaint',
  }),
  EVocab('duties', 'dyu-tis', {'id': 'tugas-tugas', 'en': 'responsibilities'}),
  EVocab('perks', 'perks', {
    'id': 'fasilitas tambahan karyawan',
    'en': 'extra benefits of a job',
  }),
  EVocab('reward', 'ri-word', {'id': 'imbalan', 'en': 'prize for effort'}),
  EVocab('on duty', 'on dyu-ti', {
    'id': 'sedang bertugas',
    'en': 'working now',
  }),
  EVocab('proficient', 'pro-fi-syent', {'id': 'mahir', 'en': 'highly skilled'}),
  EVocab('certificate', 'ser-ti-fi-ket', {
    'id': 'sertifikat',
    'en': 'official proof of a qualification',
  }),
  EVocab('invoice', 'in-vois', {
    'id': 'faktur; tagihan',
    'en': 'bill for goods',
  }),
  EVocab('turnover', 'tern-ou-ver', {'id': 'omzet', 'en': 'total sales'}),
  EVocab('quarterly', 'kwor-ter-li', {
    'id': 'per kuartal',
    'en': 'every three months',
  }),
  EVocab('fiscal', 'fis-kel', {'id': 'fiskal; keuangan', 'en': 'financial'}),
  EVocab('audit', 'o-dit', {
    'id': 'audit; pemeriksaan keuangan',
    'en': 'official check of accounts',
  }),
  EVocab('deduct', 'di-dakt', {'id': 'memotong (biaya)', 'en': 'to subtract'}),
  EVocab('expenditure', 'iks-pen-di-cer', {
    'id': 'pengeluaran',
    'en': 'spending',
  }),
  EVocab('reimburse', 'ri-im-bers', {
    'id': 'mengganti biaya',
    'en': 'to pay back',
  }),
  EVocab('accountant', 'e-kaun-tent', {
    'id': 'akuntan',
    'en': 'person who keeps financial records',
  }),
  EVocab('accounts payable', 'e-kaunts pei-e-bel', {
    'id': 'utang usaha',
    'en': 'money owed to suppliers',
  }),
  EVocab('accounts receivable', 'e-kaunts ri-si-ve-bel', {
    'id': 'piutang usaha',
    'en': 'money owed by customers',
  }),
  EVocab('balance sheet', 'be-lens syit', {
    'id': 'neraca',
    'en': 'statement of assets and debts',
  }),
  EVocab('asset', 'e-set', {'id': 'aset', 'en': 'valuable property'}),
  EVocab('liability', 'lai-e-bi-li-ti', {
    'id': 'kewajiban (utang)',
    'en': 'legal debt',
  }),
  EVocab('bookkeeping', 'buk-ki-ping', {
    'id': 'pembukuan',
    'en': 'recording accounts',
  }),
  EVocab('spreadsheet', 'spred-syit', {
    'id': 'lembar kerja',
    'en': 'table of figures on a computer',
  }),
  EVocab('tax return', 'teks ri-tern', {
    'id': 'SPT pajak',
    'en': 'annual tax form',
  }),
  EVocab('overdue', 'ou-ver-dyu', {
    'id': 'lewat jatuh tempo',
    'en': 'late (payment)',
  }),
  EVocab('outstanding', 'aut-sten-ding', {
    'id': 'belum dibayar',
    'en': 'unpaid',
  }),
  EVocab('due date', 'dyu deit', {
    'id': 'tanggal jatuh tempo',
    'en': 'payment deadline',
  }),
  EVocab('installment', 'in-stol-ment', {
    'id': 'cicilan',
    'en': 'part payment',
  }),
  EVocab('down payment', 'daun pei-ment', {
    'id': 'DP; uang muka pembelian',
    'en': 'first partial payment',
  }),
  EVocab('petty cash', 'pe-ti kesy', {
    'id': 'kas kecil',
    'en': 'small cash fund',
  }),
  EVocab('cash flow', 'kesy flou', {
    'id': 'arus kas',
    'en': 'money moving in and out',
  }),
  EVocab('break even', 'breik i-ven', {
    'id': 'balik modal',
    'en': 'neither gain nor lose money',
  }),
  EVocab('bankrupt', 'benk-rapt', {
    'id': 'bangkrut',
    'en': 'unable to pay debts',
  }),
  EVocab('profitable', 'pro-fi-te-bel', {
    'id': 'menguntungkan',
    'en': 'making money',
  }),
  EVocab('deficit', 'de-fi-sit', {'id': 'defisit', 'en': 'shortfall'}),
  EVocab('surplus', 'ser-ples', {
    'id': 'surplus; kelebihan',
    'en': 'excess amount',
  }),
  EVocab('earnings', 'er-nings', {'id': 'pendapatan', 'en': 'money earned'}),
  EVocab('net profit', 'net pro-fit', {
    'id': 'laba bersih',
    'en': 'profit after costs',
  }),
  EVocab('overhead', 'ou-ver-hed', {
    'id': 'biaya operasional tetap',
    'en': 'running costs',
  }),
  EVocab('stock market', 'stok mar-ket', {
    'id': 'pasar saham',
    'en': 'place shares are traded',
  }),
  EVocab('share', 'syer', {'id': 'saham', 'en': 'unit of company ownership'}),
  EVocab('broker', 'brou-ker', {'id': 'makelar', 'en': 'middleman agent'}),
  EVocab('write off', 'rait of', {
    'id': 'menghapusbukukan',
    'en': 'cancel a debt',
  }),
  EVocab('billing', 'bi-ling', {'id': 'penagihan', 'en': 'charging customers'}),
  EVocab('year-end', 'yir-end', {
    'id': 'akhir tahun buku',
    'en': 'close of the financial year',
  }),
  EVocab('cost-effective', 'kost-i-fek-tiv', {
    'id': 'hemat biaya',
    'en': 'good value for money',
  }),
  EVocab('payment', 'pei-ment', {'id': 'pembayaran', 'en': 'money paid'}),
  EVocab('surcharge', 'ser-carj', {
    'id': 'biaya tambahan',
    'en': 'extra charge',
  }),
  EVocab('rebate', 'ri-beit', {
    'id': 'potongan harga kembali',
    'en': 'partial refund',
  }),
  EVocab('overcharge', 'ou-ver-carj', {
    'id': 'menagih berlebih',
    'en': 'charge too much',
  }),
  EVocab('affordable', 'e-for-de-bel', {
    'id': 'terjangkau',
    'en': 'reasonably priced',
  }),
  EVocab('cut back', 'kat bek', {'id': 'mengurangi', 'en': 'reduce'}),
  EVocab('set aside', 'set e-said', {
    'id': 'menyisihkan',
    'en': 'save for later',
  }),
  EVocab('expense account', 'iks-pens e-kaunt', {
    'id': 'rekening biaya dinas',
    'en': 'company money for work costs',
  }),
  EVocab('deposit', 'di-po-zit', {
    'id': 'uang muka; deposit',
    'en': 'advance payment',
  }),
  EVocab('teller', 'te-ler', {'id': 'teller bank', 'en': 'bank cashier'}),
  EVocab('ATM', 'ei-ti-em', {'id': 'anjungan tunai', 'en': 'cash machine'}),
  EVocab('checking account', 'ce-king e-kaunt', {
    'id': 'rekening giro',
    'en': 'everyday bank account',
  }),
  EVocab('savings account', 'sei-vings e-kaunt', {
    'id': 'rekening tabungan',
    'en': 'interest-bearing account',
  }),
  EVocab('withdrawal', 'wid-dro-el', {
    'id': 'penarikan uang',
    'en': 'taking money out',
  }),
  EVocab('mortgage', 'mor-gij', {'id': 'KPR', 'en': 'home loan'}),
  EVocab('interest rate', 'in-tres reit', {
    'id': 'suku bunga',
    'en': 'cost of borrowing',
  }),
  EVocab('exchange rate', 'iks-ceinj reit', {
    'id': 'kurs',
    'en': 'currency price',
  }),
  EVocab('balance', 'be-lens', {'id': 'saldo', 'en': 'amount in an account'}),
  EVocab('debit card', 'de-bit kard', {
    'id': 'kartu debit',
    'en': 'card taking money directly from an account',
  }),
  EVocab('collateral', 'ke-le-te-rel', {
    'id': 'agunan',
    'en': 'security for a loan',
  }),
  EVocab('borrow', 'bo-rou', {'id': 'meminjam', 'en': 'take as a loan'}),
  EVocab('lend', 'lend', {'id': 'meminjamkan', 'en': 'give as a loan'}),
  EVocab('online banking', 'on-lain ben-king', {
    'id': 'perbankan daring',
    'en': 'internet banking',
  }),
  EVocab('transaction', 'trens-ek-syen', {
    'id': 'transaksi',
    'en': 'business deal',
  }),
  EVocab('bank statement', 'benk steit-ment', {
    'id': 'rekening koran',
    'en': 'account summary from the bank',
  }),
  EVocab('launch', 'lonc', {'id': 'meluncurkan', 'en': 'to start'}),
  EVocab('campaign', 'kem-pein', {'id': 'kampanye', 'en': 'organized effort'}),
  EVocab('competitor', 'kom-pe-ti-tor', {'id': 'pesaing', 'en': 'rival'}),
  EVocab('forecast', 'for-kest', {'id': 'prakiraan', 'en': 'prediction'}),
  EVocab('growth', 'grouth', {'id': 'pertumbuhan', 'en': 'increase'}),
  EVocab('brochure', 'brou-syur', {'id': 'brosur', 'en': 'leaflet'}),
  EVocab('voucher', 'vau-cer', {'id': 'voucher; kupon', 'en': 'coupon'}),
  EVocab('advertisement', 'ed-ver-tis-ment', {'id': 'iklan', 'en': 'ad'}),
  EVocab('commercial', 'ke-mer-syel', {'id': 'iklan TV', 'en': 'TV advert'}),
  EVocab('billboard', 'bil-bord', {
    'id': 'papan reklame',
    'en': 'large outdoor sign',
  }),
  EVocab('endorse', 'en-dors', {
    'id': 'mendukung (produk)',
    'en': 'publicly support',
  }),
  EVocab('sponsor', 'spon-ser', {'id': 'sponsor', 'en': 'financial backer'}),
  EVocab('clientele', 'kli-en-tel', {
    'id': 'para pelanggan',
    'en': 'customer base',
  }),
  EVocab('loyalty program', 'loi-el-ti prou-grem', {
    'id': 'program loyalitas',
    'en': 'reward scheme for regular buyers',
  }),
  EVocab('word of mouth', 'werd ov mauth', {
    'id': 'dari mulut ke mulut',
    'en': 'spoken recommendation',
  }),
  EVocab('market share', 'mar-ket syer', {
    'id': 'pangsa pasar',
    'en': 'percentage of sales held',
  }),
  EVocab('sales rep', 'seilz rep', {'id': 'wiraniaga', 'en': 'salesperson'}),
  EVocab('pitch', 'pic', {'id': 'presentasi penjualan', 'en': 'sales talk'}),
  EVocab('persuade', 'per-sweid', {'id': 'membujuk', 'en': 'convince'}),
  EVocab('bargain', 'bar-gin', {'id': 'barang murah', 'en': 'good deal'}),
  EVocab('markup', 'mark-ap', {
    'id': 'kenaikan harga jual',
    'en': 'added price',
  }),
  EVocab('clearance sale', 'kli-rens seil', {
    'id': 'obral cuci gudang',
    'en': 'sale to clear stock',
  }),
  EVocab('on sale', 'on seil', {
    'id': 'sedang diskon',
    'en': 'reduced in price',
  }),
  EVocab('free of charge', 'fri ov carj', {'id': 'gratis', 'en': 'at no cost'}),
  EVocab('complimentary', 'kom-pli-men-te-ri', {
    'id': 'cuma-cuma (layanan)',
    'en': 'given free as a courtesy',
  }),
  EVocab('free trial', 'fri trai-el', {
    'id': 'uji coba gratis',
    'en': 'no-cost test period',
  }),
  EVocab('feedback', 'fid-bek', {
    'id': 'umpan balik',
    'en': 'comments on work',
  }),
  EVocab('questionnaire', 'kwes-tyo-ner', {
    'id': 'kuesioner',
    'en': 'list of questions',
  }),
  EVocab('best seller', 'best se-ler', {
    'id': 'barang terlaris',
    'en': 'top-selling item',
  }),
  EVocab('in demand', 'in di-mend', {
    'id': 'banyak dicari',
    'en': 'wanted by many',
  }),
  EVocab('merchandise', 'mer-cen-dais', {
    'id': 'barang dagangan',
    'en': 'goods for sale',
  }),
  EVocab('showroom', 'syou-rum', {'id': 'ruang pamer', 'en': 'display hall'}),
  EVocab('trade show', 'treid syou', {
    'id': 'pameran dagang',
    'en': 'industry exhibition',
  }),
  EVocab('booth', 'buth', {'id': 'stan (pameran)', 'en': 'stall at a fair'}),
  EVocab('catalog', 'ke-te-log', {'id': 'katalog', 'en': 'list of products'}),
  EVocab('price list', 'prais list', {
    'id': 'daftar harga',
    'en': 'table of prices',
  }),
  EVocab('price tag', 'prais teg', {'id': 'label harga', 'en': 'price label'}),
  EVocab('retailer', 'ri-tei-ler', {
    'id': 'pengecer',
    'en': 'shop selling to the public',
  }),
  EVocab('franchise', 'fren-cais', {
    'id': 'waralaba',
    'en': 'licensed business',
  }),
  EVocab('commerce', 'ko-mers', {
    'id': 'perniagaan',
    'en': 'buying and selling',
  }),
  EVocab('checkout', 'cek-aut', {'id': 'tempat bayar', 'en': 'payment point'}),
  EVocab('cashier', 'ke-syir', {'id': 'kasir', 'en': 'till operator'}),
  EVocab('stocktaking', 'stok-tei-king', {
    'id': 'stok opname',
    'en': 'counting goods on hand',
  }),
  EVocab('vendor', 'ven-dor', {'id': 'penjual; vendor', 'en': 'seller'}),
  EVocab('inventory', 'in-ven-to-ri', {
    'id': 'persediaan barang',
    'en': 'stock',
  }),
  EVocab('procurement', 'pro-kyur-ment', {
    'id': 'pengadaan',
    'en': 'buying supplies',
  }),
  EVocab('negotiate', 'ne-gou-syi-eit', {
    'id': 'bernegosiasi',
    'en': 'to discuss terms',
  }),
  EVocab('order form', 'or-der form', {
    'id': 'formulir pesanan',
    'en': 'sheet for ordering',
  }),
  EVocab('place an order', 'pleis en or-der', {
    'id': 'memesan barang',
    'en': 'make an order',
  }),
  EVocab('backorder', 'bek-or-der', {
    'id': 'pesanan tertunda (stok habis)',
    'en': 'order waiting for stock',
  }),
  EVocab('out of stock', 'aut ov stok', {
    'id': 'stok habis',
    'en': 'unavailable',
  }),
  EVocab('in stock', 'in stok', {'id': 'ada di gudang', 'en': 'on hand'}),
  EVocab('restock', 'ri-stok', {
    'id': 'mengisi ulang stok',
    'en': 'replenish goods',
  }),
  EVocab('run out of', 'ran aut ov', {
    'id': 'kehabisan',
    'en': 'use up completely',
  }),
  EVocab('bid', 'bid', {'id': 'penawaran (lelang)', 'en': 'offer of price'}),
  EVocab('terms and conditions', 'termz en ken-di-syens', {
    'id': 'syarat dan ketentuan',
    'en': 'rules of an agreement',
  }),
  EVocab('fine print', 'fain print', {
    'id': 'ketentuan kecil',
    'en': 'small-text details',
  }),
  EVocab('binding', 'bain-ding', {
    'id': 'mengikat (secara hukum)',
    'en': 'legally enforceable',
  }),
  EVocab('agreement', 'e-gri-ment', {'id': 'perjanjian', 'en': 'deal'}),
  EVocab('sign up', 'sain ap', {'id': 'mendaftar', 'en': 'register'}),
  EVocab('unit price', 'yu-nit prais', {
    'id': 'harga satuan',
    'en': 'cost per item',
  }),
  EVocab('prepaid', 'pri-peid', {'id': 'prabayar', 'en': 'paid in advance'}),
  EVocab('cash on delivery', 'kesy on di-li-ve-ri', {
    'id': 'bayar di tempat (COD)',
    'en': 'pay when received',
  }),
  EVocab('compromise', 'kom-pro-maiz', {
    'id': 'kompromi',
    'en': 'middle-ground agreement',
  }),
  EVocab('subscription', 'seb-skrip-syen', {
    'id': 'langganan',
    'en': 'regular payment for a service',
  }),
  EVocab('renewal', 'ri-nyu-el', {
    'id': 'perpanjangan',
    'en': 'extension of time',
  }),
  EVocab('expire', 'iks-pai-er', {
    'id': 'kedaluwarsa; habis masa berlaku',
    'en': 'to end',
  }),
  EVocab('compliance', 'kom-plai-ens', {
    'id': 'kepatuhan',
    'en': 'following rules',
  }),
  EVocab('eligible', 'e-li-ji-bel', {
    'id': 'memenuhi syarat',
    'en': 'qualified',
  }),
  EVocab('lawyer', 'lo-yer', {'id': 'pengacara', 'en': 'attorney'}),
  EVocab('lawsuit', 'lo-sut', {'id': 'gugatan hukum', 'en': 'legal case'}),
  EVocab('dispute', 'dis-pyut', {'id': 'perselisihan', 'en': 'disagreement'}),
  EVocab('penalty', 'pe-nel-ti', {'id': 'denda', 'en': 'punishment fee'}),
  EVocab('trademark', 'treid-mark', {
    'id': 'merek dagang',
    'en': 'registered brand name',
  }),
  EVocab('deliver', 'di-li-ver', {'id': 'mengirimkan', 'en': 'to send'}),
  EVocab('courier', 'ku-ri-er', {'id': 'kurir', 'en': 'delivery person'}),
  EVocab('fragile', 'fre-jail', {'id': 'mudah pecah', 'en': 'easily broken'}),
  EVocab('logistics', 'lo-jis-tiks', {
    'id': 'logistik',
    'en': 'managing transport of goods',
  }),
  EVocab('consignment', 'ken-sain-ment', {
    'id': 'kiriman barang',
    'en': 'batch of goods sent',
  }),
  EVocab('turnaround time', 'tern-e-raund taim', {
    'id': 'waktu penyelesaian',
    'en': 'time to complete a task',
  }),
  EVocab('shipping', 'syi-ping', {'id': 'pengiriman', 'en': 'sending goods'}),
  EVocab('freight', 'freit', {'id': 'muatan barang', 'en': 'cargo'}),
  EVocab('cargo', 'kar-gou', {'id': 'kargo', 'en': 'goods carried'}),
  EVocab('tracking number', 'tre-king nam-ber', {
    'id': 'nomor resi',
    'en': 'parcel code',
  }),
  EVocab('parcel', 'par-sel', {'id': 'paket', 'en': 'package'}),
  EVocab('dispatch', 'dis-pec', {'id': 'mengirim (barang)', 'en': 'send off'}),
  EVocab('recipient', 'ri-si-pi-ent', {'id': 'penerima', 'en': 'receiver'}),
  EVocab('sender', 'sen-der', {'id': 'pengirim', 'en': 'person who sends'}),
  EVocab('customs', 'kas-tems', {'id': 'bea cukai', 'en': 'border tax office'}),
  EVocab('duty-free', 'dyu-ti-fri', {
    'id': 'bebas bea',
    'en': 'without import tax',
  }),
  EVocab('tariff', 'te-rif', {'id': 'tarif bea', 'en': 'tax on imports'}),
  EVocab('container', 'ken-tei-ner', {
    'id': 'peti kemas',
    'en': 'shipping box',
  }),
  EVocab('pallet', 'pe-let', {
    'id': 'palet',
    'en': 'wooden platform for goods',
  }),
  EVocab('forklift', 'fork-lift', {'id': 'forklift', 'en': 'lifting truck'}),
  EVocab('loading dock', 'lou-ding dok', {
    'id': 'dermaga bongkar muat',
    'en': 'bay for trucks',
  }),
  EVocab('unload', 'an-loud', {
    'id': 'membongkar muatan',
    'en': 'remove cargo',
  }),
  EVocab('delayed', 'di-leid', {'id': 'tertunda', 'en': 'held up'}),
  EVocab('expedite', 'eks-pe-dait', {'id': 'mempercepat', 'en': 'speed up'}),
  EVocab('express delivery', 'iks-pres di-li-ve-ri', {
    'id': 'pengiriman kilat',
    'en': 'fast shipping',
  }),
  EVocab('overnight', 'ou-ver-nait', {
    'id': 'semalam (tiba besok)',
    'en': 'by next day',
  }),
  EVocab('postage', 'pous-tij', {'id': 'ongkos pos', 'en': 'mail cost'}),
  EVocab('fleet', 'flit', {'id': 'armada', 'en': 'group of vehicles'}),
  EVocab('carrier', 'ke-ri-er', {
    'id': 'perusahaan angkutan',
    'en': 'transport company',
  }),
  EVocab('bill of lading', 'bil ov lei-ding', {
    'id': 'konosemen',
    'en': 'shipping receipt',
  }),
  EVocab('packing slip', 'pe-king slip', {
    'id': 'daftar isi kiriman',
    'en': 'contents list in a box',
  }),
  EVocab('bubble wrap', 'ba-bel rep', {
    'id': 'plastik gelembung',
    'en': 'protective plastic',
  }),
  EVocab('seal', 'sil', {'id': 'segel', 'en': 'closure'}),
  EVocab('storage', 'sto-rij', {'id': 'penyimpanan', 'en': 'keeping items'}),
  EVocab('supply chain', 'se-plai cein', {
    'id': 'rantai pasok',
    'en': 'production-to-buyer network',
  }),
  EVocab('stockroom', 'stok-rum', {
    'id': 'gudang kecil toko',
    'en': 'room for stock',
  }),
  EVocab('door-to-door', 'dor-tu-dor', {
    'id': 'dari pintu ke pintu',
    'en': 'directly to the address',
  }),
  EVocab('pick up', 'pik ap', {'id': 'mengambil; menjemput', 'en': 'collect'}),
  EVocab('drop off', 'drop of', {
    'id': 'mengantar; menurunkan',
    'en': 'leave at a place',
  }),
  EVocab('lost and found', 'lost en faund', {
    'id': 'barang hilang dan temuan',
    'en': 'place for missing items',
  }),
  EVocab('install', 'in-stol', {'id': 'memasang', 'en': 'to set up'}),
  EVocab('operate', 'o-pe-reit', {
    'id': 'mengoperasikan',
    'en': 'to run a machine',
  }),
  EVocab('productivity', 'pro-dak-ti-vi-ti', {
    'id': 'produktivitas',
    'en': 'output rate',
  }),
  EVocab('defective', 'di-fek-tiv', {'id': 'cacat (produk)', 'en': 'faulty'}),
  EVocab('plant', 'plent', {'id': 'pabrik besar', 'en': 'industrial site'}),
  EVocab('manufacture', 'me-nyu-fek-cer', {
    'id': 'membuat (di pabrik)',
    'en': 'produce industrially',
  }),
  EVocab('quality control', 'kwo-li-ti ken-troul', {
    'id': 'kendali mutu',
    'en': 'product checking',
  }),
  EVocab('breakdown', 'breik-daun', {
    'id': 'kerusakan mesin',
    'en': 'failure of a machine',
  }),
  EVocab('downtime', 'daun-taim', {
    'id': 'waktu henti',
    'en': 'non-operating time',
  }),
  EVocab('batch', 'bec', {
    'id': 'kelompok produksi',
    'en': 'group made together',
  }),
  EVocab('machinery', 'me-syi-ne-ri', {
    'id': 'mesin-mesin',
    'en': 'machines collectively',
  }),
  EVocab('spare parts', 'sper parts', {
    'id': 'suku cadang',
    'en': 'replacement components',
  }),
  EVocab('protective gear', 'pro-tek-tiv gir', {
    'id': 'alat pelindung diri',
    'en': 'safety clothing',
  }),
  EVocab('hazard', 'he-zerd', {'id': 'bahaya', 'en': 'danger'}),
  EVocab('precaution', 'pri-ko-syen', {
    'id': 'tindakan pencegahan',
    'en': 'safety measure',
  }),
  EVocab('recall', 'ri-kol', {
    'id': 'penarikan produk',
    'en': 'return of faulty goods',
  }),
  EVocab('durable', 'dyu-re-bel', {'id': 'awet', 'en': 'long-lasting'}),
  EVocab('carry out', 'ke-ri aut', {'id': 'melaksanakan', 'en': 'perform'}),
  EVocab('put together', 'put tu-ge-dher', {
    'id': 'merakit; menyusun',
    'en': 'build from parts',
  }),
  EVocab('shut down', 'syat daun', {'id': 'mematikan; menutup', 'en': 'close'}),
  EVocab('reservation', 're-ser-vei-syen', {
    'id': 'reservasi; pemesanan',
    'en': 'booking',
  }),
  EVocab('itinerary', 'ai-ti-ne-re-ri', {
    'id': 'rencana perjalanan',
    'en': 'travel plan',
  }),
  EVocab('boarding pass', 'bor-ding pes', {
    'id': 'pas naik pesawat',
    'en': 'flight entry ticket',
  }),
  EVocab('departure', 'di-par-cer', {'id': 'keberangkatan', 'en': 'leaving'}),
  EVocab('arrival', 'e-rai-vel', {'id': 'kedatangan', 'en': 'coming'}),
  EVocab('layover', 'lei-ou-ver', {
    'id': 'singgah antarpenerbangan',
    'en': 'stop between flights',
  }),
  EVocab('connecting flight', 'ke-nek-ting flait', {
    'id': 'penerbangan lanjutan',
    'en': 'second flight',
  }),
  EVocab('aisle seat', 'ail sit', {
    'id': 'kursi lorong',
    'en': 'seat by the passage',
  }),
  EVocab('carry-on', 'ke-ri-on', {'id': 'bagasi kabin', 'en': 'hand luggage'}),
  EVocab('baggage claim', 'be-gij kleim', {
    'id': 'pengambilan bagasi',
    'en': 'luggage pickup area',
  }),
  EVocab('luggage', 'la-gij', {'id': 'koper; barang bawaan', 'en': 'bags'}),
  EVocab('check-in', 'cek-in', {
    'id': 'lapor masuk',
    'en': 'registration on arrival',
  }),
  EVocab('round trip', 'raund trip', {
    'id': 'pulang pergi',
    'en': 'return journey',
  }),
  EVocab('one-way', 'wan-wei', {'id': 'sekali jalan', 'en': 'single journey'}),
  EVocab('passport', 'pes-port', {
    'id': 'paspor',
    'en': 'travel identity book',
  }),
  EVocab('flight attendant', 'flait e-ten-dent', {
    'id': 'pramugari',
    'en': 'cabin crew member',
  }),
  EVocab('booked up', 'bukt ap', {
    'id': 'penuh dipesan',
    'en': 'fully reserved',
  }),
  EVocab('room service', 'rum ser-vis', {
    'id': 'layanan kamar',
    'en': 'meals delivered to rooms',
  }),
  EVocab('concierge', 'kon-si-erzy', {
    'id': 'concierge (pramutamu)',
    'en': 'hotel helper',
  }),
  EVocab('key card', 'ki kard', {
    'id': 'kartu kunci',
    'en': 'electronic room key',
  }),
  EVocab('wake-up call', 'weik-ap kol', {
    'id': 'panggilan bangun',
    'en': 'morning phone alarm',
  }),
  EVocab('housekeeping', 'haus-ki-ping', {
    'id': 'tata graha',
    'en': 'room cleaning staff',
  }),
  EVocab('shuttle bus', 'sya-tel bas', {
    'id': 'bus antar-jemput',
    'en': 'regular transfer bus',
  }),
  EVocab('car rental', 'kar ren-tel', {
    'id': 'sewa mobil',
    'en': 'hire of a car',
  }),
  EVocab('travel agency', 'tre-vel ei-jen-si', {
    'id': 'biro perjalanan',
    'en': 'tour booking firm',
  }),
  EVocab('per diem', 'per di-em', {
    'id': 'uang harian dinas',
    'en': 'daily travel allowance',
  }),
  EVocab('business class', 'biz-nis kles', {
    'id': 'kelas bisnis',
    'en': 'premium seat class',
  }),
  EVocab('upgrade', 'ap-greid', {
    'id': 'naik kelas',
    'en': 'move to a better level',
  }),
  EVocab('no-show', 'nou-syou', {
    'id': 'tamu tidak datang',
    'en': 'booked guest who fails to come',
  }),
  EVocab('traffic jam', 'tre-fik jem', {
    'id': 'macet lalu lintas',
    'en': 'road blockage',
  }),
  EVocab('stop by', 'stop bai', {'id': 'mampir', 'en': 'visit briefly'}),
  EVocab('venue', 've-nyu', {'id': 'tempat acara', 'en': 'event location'}),
  EVocab('caterer', 'kei-te-rer', {
    'id': 'penyedia katering',
    'en': 'food supplier for events',
  }),
  EVocab('banquet', 'benk-wit', {'id': 'jamuan makan', 'en': 'formal dinner'}),
  EVocab('buffet', 'be-fei', {'id': 'prasmanan', 'en': 'self-service meal'}),
  EVocab('appetizer', 'e-pe-tai-zer', {
    'id': 'hidangan pembuka',
    'en': 'starter',
  }),
  EVocab('main course', 'mein kors', {
    'id': 'hidangan utama',
    'en': 'main dish',
  }),
  EVocab('dessert', 'di-zert', {
    'id': 'hidangan penutup',
    'en': 'sweet course',
  }),
  EVocab('beverage', 'be-ve-rij', {'id': 'minuman', 'en': 'drink'}),
  EVocab('menu', 'me-nyu', {'id': 'menu', 'en': 'list of dishes'}),
  EVocab('tip', 'tip', {'id': 'uang tip', 'en': 'gratuity'}),
  EVocab('waiter', 'wei-ter', {
    'id': 'pelayan restoran',
    'en': 'restaurant staff serving food',
  }),
  EVocab('dine in', 'dain in', {
    'id': 'makan di tempat',
    'en': 'eat at the restaurant',
  }),
  EVocab('takeout', 'teik-aut', {
    'id': 'dibungkus (bawa pulang)',
    'en': 'food to go',
  }),
  EVocab('gathering', 'ge-dhe-ring', {
    'id': 'kumpul-kumpul',
    'en': 'social meeting',
  }),
  EVocab('award ceremony', 'e-word se-re-mo-ni', {
    'id': 'upacara penghargaan',
    'en': 'prize event',
  }),
  EVocab('anniversary', 'e-ni-ver-se-ri', {
    'id': 'hari jadi',
    'en': 'yearly celebration date',
  }),
  EVocab('farewell party', 'fer-wel par-ti', {
    'id': 'pesta perpisahan',
    'en': 'goodbye event',
  }),
  EVocab('RSVP', 'ar-es-vi-pi', {
    'id': 'mohon konfirmasi kehadiran',
    'en': 'reply to an invitation',
  }),
  EVocab('invitation', 'in-vi-tei-syen', {
    'id': 'undangan',
    'en': 'request to attend',
  }),
  EVocab('guest list', 'gest list', {
    'id': 'daftar tamu',
    'en': 'invited people',
  }),
  EVocab('host', 'houst', {
    'id': 'tuan rumah',
    'en': 'person welcoming guests',
  }),
  EVocab('organizer', 'or-ge-nai-zer', {
    'id': 'penyelenggara',
    'en': 'event planner',
  }),
  EVocab('auditorium', 'o-di-to-ri-um', {
    'id': 'auditorium',
    'en': 'hall for audiences',
  }),
  EVocab('banner', 'be-ner', {'id': 'spanduk', 'en': 'large printed sign'}),
  EVocab('refreshments', 'ri-fresy-ments', {
    'id': 'hidangan ringan',
    'en': 'snacks and drinks',
  }),
  EVocab('toast', 'toust', {'id': 'bersulang', 'en': 'raise glasses'}),
  EVocab('attendance', 'e-ten-dens', {'id': 'kehadiran', 'en': 'presence'}),
  EVocab('admission', 'ed-mi-syen', {'id': 'tiket masuk', 'en': 'entry'}),
  EVocab('sold out', 'sould aut', {
    'id': 'habis terjual',
    'en': 'no tickets left',
  }),
  EVocab('raffle', 're-fel', {'id': 'undian', 'en': 'prize draw'}),
  EVocab('usher', 'a-syer', {
    'id': 'pengantar tamu ke kursi',
    'en': 'seat guide',
  }),
  EVocab('audience', 'o-di-ens', {'id': 'penonton', 'en': 'listeners'}),
  EVocab('queue', 'kyu', {'id': 'antrean', 'en': 'line of people'}),
  EVocab('line up', 'lain ap', {'id': 'mengantre', 'en': 'form a queue'}),
  EVocab('inquiry', 'in-kwai-ri', {
    'id': 'pertanyaan; permintaan info',
    'en': 'question',
  }),
  EVocab('complaint', 'kem-pleint', {
    'id': 'keluhan',
    'en': 'expression of dissatisfaction',
  }),
  EVocab('refund', 'ri-fand', {
    'id': 'pengembalian uang',
    'en': 'money returned',
  }),
  EVocab('warranty', 'wo-ren-ti', {'id': 'garansi', 'en': 'guarantee'}),
  EVocab('replacement', 'ri-pleis-ment', {
    'id': 'pengganti',
    'en': 'substitute',
  }),
  EVocab('cancel', 'ken-sel', {'id': 'membatalkan', 'en': 'to call off'}),
  EVocab('hotline', 'hot-lain', {
    'id': 'layanan telepon',
    'en': 'support phone line',
  }),
  EVocab('representative', 're-pre-zen-te-tiv', {
    'id': 'perwakilan',
    'en': 'agent',
  }),
  EVocab('on hold', 'on hould', {
    'id': 'menunggu di telepon',
    'en': 'waiting on the line',
  }),
  EVocab('hang up', 'heng ap', {'id': 'menutup telepon', 'en': 'end a call'}),
  EVocab('call back', 'kol bek', {
    'id': 'menelepon balik',
    'en': 'return a call',
  }),
  EVocab('apologize', 'e-po-lo-jaiz', {
    'id': 'meminta maaf',
    'en': 'say sorry',
  }),
  EVocab('inconvenience', 'in-ken-vi-ni-ens', {
    'id': 'ketidaknyamanan',
    'en': 'trouble',
  }),
  EVocab('satisfaction', 'se-tis-fek-syen', {
    'id': 'kepuasan',
    'en': 'contentment',
  }),
  EVocab('exchange', 'iks-ceinj', {'id': 'menukar (barang)', 'en': 'swap'}),
  EVocab('courteous', 'ker-ti-es', {'id': 'sopan', 'en': 'polite'}),
  EVocab('prompt', 'prompt', {'id': 'cepat tanggap', 'en': 'quick'}),
  EVocab('troubleshoot', 'tra-bel-syut', {
    'id': 'mengatasi masalah',
    'en': 'find and fix problems',
  }),
  EVocab('FAQ', 'ef-ei-kyu', {
    'id': 'pertanyaan umum',
    'en': 'common questions list',
  }),
  EVocab('membership', 'mem-ber-syip', {
    'id': 'keanggotaan',
    'en': 'being a member',
  }),
  EVocab('toll-free', 'toul-fri', {'id': 'bebas pulsa', 'en': 'free to call'}),
  EVocab('deal with', 'dil wid', {'id': 'menangani', 'en': 'handle'}),
  EVocab('look into', 'luk in-tu', {'id': 'menyelidiki', 'en': 'investigate'}),
  EVocab('password', 'pes-werd', {
    'id': 'kata sandi',
    'en': 'secret login word',
  }),
  EVocab('log in', 'log in', {'id': 'masuk akun', 'en': 'sign in'}),
  EVocab('log out', 'log aut', {'id': 'keluar akun', 'en': 'sign out'}),
  EVocab('username', 'yu-zer-neim', {
    'id': 'nama pengguna',
    'en': 'account name',
  }),
  EVocab('update', 'ap-deit', {
    'id': 'memperbarui',
    'en': 'refresh with the latest version',
  }),
  EVocab('download', 'daun-loud', {
    'id': 'mengunduh',
    'en': 'transfer to your device',
  }),
  EVocab('upload', 'ap-loud', {'id': 'mengunggah', 'en': 'send to a server'}),
  EVocab('server', 'ser-ver', {
    'id': 'server (komputer)',
    'en': 'computer that hosts services',
  }),
  EVocab('backup', 'bek-ap', {'id': 'cadangan data', 'en': 'spare copy'}),
  EVocab('tech support', 'tek se-port', {
    'id': 'dukungan teknis',
    'en': 'computer help service',
  }),
  EVocab('software', 'soft-wer', {'id': 'perangkat lunak', 'en': 'programs'}),
  EVocab('hardware', 'hard-wer', {
    'id': 'perangkat keras',
    'en': 'physical computer parts',
  }),
  EVocab('keyboard', 'ki-bord', {'id': 'papan ketik', 'en': 'typing board'}),
  EVocab('scanner', 'ske-ner', {
    'id': 'pemindai',
    'en': 'image copying device',
  }),
  EVocab('inbox', 'in-boks', {
    'id': 'kotak masuk',
    'en': 'received mail folder',
  }),
  EVocab('cc', 'si-si', {
    'id': 'tembusan (email)',
    'en': 'copy to another person',
  }),
  EVocab('forward', 'for-werd', {'id': 'meneruskan', 'en': 'send on'}),
  EVocab('reply', 'ri-plai', {'id': 'membalas', 'en': 'answer'}),
  EVocab('crash', 'kresy', {
    'id': 'mogok total (komputer)',
    'en': 'sudden program failure',
  }),
  EVocab('reboot', 'ri-but', {'id': 'menyalakan ulang', 'en': 'restart'}),
  EVocab('video call', 'vi-di-ou kol', {
    'id': 'panggilan video',
    'en': 'face-to-face online call',
  }),
  EVocab('printout', 'print-aut', {'id': 'hasil cetak', 'en': 'printed copy'}),
  EVocab('up to date', 'ap tu deit', {'id': 'terkini', 'en': 'current'}),
  EVocab('out of date', 'aut ov deit', {'id': 'usang', 'en': 'old-fashioned'}),
  EVocab('keep track of', 'kip trek ov', {
    'id': 'terus memantau',
    'en': 'follow closely',
  }),
  EVocab('figure out', 'fi-ger aut', {'id': 'memahami', 'en': 'work out'}),
  EVocab('catch up', 'kec ap', {
    'id': 'mengejar ketinggalan',
    'en': 'get up to speed',
  }),
  EVocab('tenant', 'te-nent', {'id': 'penyewa', 'en': 'renter'}),
  EVocab('lease', 'lis', {'id': 'sewa (kontrak)', 'en': 'rental agreement'}),
  EVocab('renovation', 're-no-vei-syen', {
    'id': 'renovasi',
    'en': 'repair work',
  }),
  EVocab('property', 'pro-per-ti', {
    'id': 'properti',
    'en': 'land or buildings owned',
  }),
  EVocab('furnished', 'fer-nisyt', {
    'id': 'berperabot',
    'en': 'with furniture',
  }),
  EVocab('vacant', 'vei-kent', {
    'id': 'kosong (tak berpenghuni)',
    'en': 'unoccupied',
  }),
  EVocab('realtor', 'ri-el-tor', {
    'id': 'agen properti',
    'en': 'property agent',
  }),
  EVocab('floor space', 'flor speis', {
    'id': 'luas lantai',
    'en': 'area of rooms',
  }),
  EVocab('office space', 'o-fis speis', {
    'id': 'ruang kantor',
    'en': 'workplace area to rent',
  }),
  EVocab('move in', 'muv in', {
    'id': 'mulai menempati',
    'en': 'start living or working there',
  }),
  EVocab('move out', 'muv aut', {'id': 'pindah keluar', 'en': 'leave a place'}),
  EVocab('neighborhood', 'nei-ber-hud', {
    'id': 'lingkungan sekitar',
    'en': 'local area',
  }),
  EVocab('spacious', 'spei-syes', {'id': 'luas', 'en': 'roomy'}),
  EVocab('downtown', 'daun-taun', {'id': 'pusat kota', 'en': 'city center'}),
  EVocab('listing', 'lis-ting', {
    'id': 'daftar properti dijual',
    'en': 'property advertisement',
  }),
  EVocab('blueprint', 'blu-print', {
    'id': 'cetak biru',
    'en': 'technical plan',
  }),
  EVocab('plumber', 'pla-mer', {'id': 'tukang ledeng', 'en': 'pipe fixer'}),
  EVocab('electrician', 'i-lek-tri-syen', {
    'id': 'tukang listrik',
    'en': 'wiring worker',
  }),
  EVocab('leak', 'lik', {'id': 'bocor', 'en': 'escape of water'}),
  EVocab('repair', 'ri-per', {'id': 'memperbaiki', 'en': 'mend'}),
  EVocab('remodel', 'ri-mo-del', {'id': 'merombak', 'en': 'redesign a room'}),
  EVocab('refurbish', 'ri-fer-bisy', {
    'id': 'memperbarui bangunan',
    'en': 'renew a building',
  }),
  EVocab('downturn', 'daun-tern', {
    'id': 'kemerosotan',
    'en': 'decline in business',
  }),
  EVocab('outlook', 'aut-luk', {'id': 'prospek', 'en': 'future expectation'}),
  EVocab('benchmark', 'benc-mark', {
    'id': 'tolok ukur',
    'en': 'standard for comparison',
  }),
];

/// Judul grup untuk [phraseVocab].
const List<Map<String, String>> phraseVocabGroups = [
  {'id': 'Keputusan & berubah pikiran', 'en': 'Decisions & changing your mind'},
  {'id': 'Setuju & tidak setuju', 'en': 'Agreeing & disagreeing'},
  {
    'id': 'Minta tolong & menawarkan bantuan',
    'en': 'Asking for & offering help',
  },
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
    'id': 'Mengakhiri obrolan & berpamitan',
    'en': 'Ending a conversation & saying goodbye',
  },
  {
    'id': 'Menjaga obrolan: klarifikasi & jeda',
    'en': 'Keeping a conversation going: clarifying & pausing',
  },
  {'id': 'Belanja & restoran', 'en': 'Shopping & restaurants'},
  {'id': 'Telepon, janji & waktu', 'en': 'Phone calls, appointments & time'},
];

/// Ungkapan percakapan sehari-hari yang paling sering dipakai.
const List<EVocab> phraseVocab = [
  EVocab('I\'ve changed my mind', 'aiv ceinjd mai maind', {
    'id': 'aku berubah pikiran',
    'en': 'I now think or want something different',
  }, 0),
  EVocab('On second thought', 'on se-kend thot', {
    'id': 'setelah dipikir-pikir lagi',
    'en': 'after thinking again (introduces a new decision)',
  }, 0),
  EVocab('It\'s up to you', 'its ap tu yu', {
    'id': 'terserah kamu',
    'en': 'you can decide',
  }, 0),
  EVocab('I don\'t mind', 'ai dount maind', {
    'id': 'aku tidak keberatan; aku oke saja',
    'en': 'either option is OK for me',
  }, 0),
  EVocab('Either is fine', 'i-dher iz fain', {
    'id': 'yang mana saja boleh (dari dua pilihan)',
    'en': 'both of the two options are acceptable',
  }, 0),
  EVocab('Whatever you think is best', 'wot-e-ver yu think iz best', {
    'id': 'bagaimana baiknya menurutmu saja',
    'en': 'I trust your judgement on this',
  }, 0),
  EVocab('I\'m not sure yet', 'aim not syur yet', {
    'id': 'aku belum yakin',
    'en': 'I haven\'t decided at this point',
  }, 0),
  EVocab('Let me think about it', 'let mi think e-baut it', {
    'id': 'biar kupikirkan dulu',
    'en': 'give me time before I decide',
  }, 0),
  EVocab('I can\'t decide', 'ai kent di-said', {
    'id': 'aku bingung memilih',
    'en': 'I\'m unable to choose',
  }, 0),
  EVocab('I\'m leaning towards', 'aim li-ning te-wordz', {
    'id': 'aku condong ke (pilihan tertentu)',
    'en': 'I\'m starting to prefer one option',
  }, 0),
  EVocab('I\'ve made up my mind', 'aiv meid ap mai maind', {
    'id': 'aku sudah mantap memutuskan',
    'en': 'my decision is final',
  }, 0),
  EVocab('Let\'s go with that', 'lets gou widh dhet', {
    'id': 'kita pilih itu saja',
    'en': 'let\'s choose that option',
  }, 0),
  EVocab('Let\'s do it', 'lets du it', {
    'id': 'ayo kita lakukan',
    'en': 'I\'m ready to start, let\'s go ahead',
  }, 0),
  EVocab('Why not?', 'wai not', {
    'id': 'kenapa tidak? boleh juga',
    'en': 'casual yes, there\'s no reason to refuse',
  }, 0),
  EVocab('Count me in', 'kaunt mi in', {
    'id': 'aku ikut',
    'en': 'include me in the plan',
  }, 0),
  EVocab('Count me out', 'kaunt mi aut', {
    'id': 'aku tidak ikut',
    'en': 'don\'t include me',
  }, 0),
  EVocab('I\'ll pass', 'ail pes', {
    'id': 'aku lewat dulu; tidak usah, makasih',
    'en': 'polite way to decline an offer',
  }, 0),
  EVocab('Maybe next time', 'mei-bi nekst taim', {
    'id': 'mungkin lain kali',
    'en': 'not now, perhaps another time',
  }, 0),
  EVocab('I\'ll let you know', 'ail let yu nou', {
    'id': 'nanti kukabari',
    'en': 'I\'ll tell you my decision later',
  }, 0),
  EVocab('That settles it', 'dhet se-telz it', {
    'id': 'beres, sudah diputuskan',
    'en': 'now the decision is clear',
  }, 0),
  EVocab('I agree', 'ai e-gri', {
    'id': 'aku setuju',
    'en': 'I have the same opinion',
  }, 1),
  EVocab('I couldn\'t agree more', 'ai ku-dent e-gri mor', {
    'id': 'aku sangat setuju',
    'en': 'I agree completely',
  }, 1),
  EVocab('Exactly', 'ig-zekt-li', {
    'id': 'tepat sekali',
    'en': 'that\'s precisely right',
  }, 1),
  EVocab('Absolutely', 'eb-se-lut-li', {
    'id': 'tentu saja; jelas',
    'en': 'strong yes',
  }, 1),
  EVocab('You\'re right', 'yor rait', {
    'id': 'kamu benar',
    'en': 'what you said is correct',
  }, 1),
  EVocab('Good point', 'gud point', {
    'id': 'poin yang bagus',
    'en': 'that\'s a useful thing to mention',
  }, 1),
  EVocab('Fair enough', 'fer i-naf', {
    'id': 'masuk akal juga; oke deh',
    'en': 'I accept your reason',
  }, 1),
  EVocab('That makes sense', 'dhet meiks sens', {
    'id': 'itu masuk akal',
    'en': 'I understand and it seems logical',
  }, 1),
  EVocab('Sounds good', 'saundz gud', {
    'id': 'kedengarannya bagus; oke',
    'en': 'I like that idea',
  }, 1),
  EVocab('Sounds like a plan', 'saundz laik e plen', {
    'id': 'oke, sepakat begitu',
    'en': 'agreed, let\'s do it that way',
  }, 1),
  EVocab('It\'s a deal', 'its e dil', {
    'id': 'deal; sepakat',
    'en': 'we have an agreement',
  }, 1),
  EVocab('Me too', 'mi tu', {
    'id': 'aku juga',
    'en': 'the same is true for me (positive)',
  }, 1),
  EVocab('Me neither', 'mi ni-dher', {
    'id': 'aku juga tidak',
    'en': 'the same is true for me (negative)',
  }, 1),
  EVocab('I guess so', 'ai ges sou', {
    'id': 'kayaknya sih iya',
    'en': 'unenthusiastic yes',
  }, 1),
  EVocab('Not really', 'not ri-li', {
    'id': 'tidak juga; nggak terlalu',
    'en': 'soft no',
  }, 1),
  EVocab('I don\'t think so', 'ai dount think sou', {
    'id': 'kurasa tidak',
    'en': 'polite no; I believe that\'s wrong',
  }, 1),
  EVocab('I\'m not so sure about that', 'aim not sou syur e-baut dhet', {
    'id': 'aku kurang yakin soal itu',
    'en': 'I have doubts about what you said',
  }, 1),
  EVocab('I see your point, but...', 'ai si yor point, bat', {
    'id': 'aku paham maksudmu, tapi...',
    'en': 'I understand you, but I think differently',
  }, 1),
  EVocab('I\'m afraid I disagree', 'aim e-freid ai dis-e-gri', {
    'id': 'maaf, aku tidak setuju',
    'en': 'polite way to say I don\'t agree',
  }, 1),
  EVocab('Let\'s agree to disagree', 'lets e-gri tu dis-e-gri', {
    'id': 'ya sudah, kita beda pendapat saja',
    'en': 'let\'s accept that we have different opinions',
  }, 1),
  EVocab('Can you help me?', 'ken yu help mi', {
    'id': 'bisa bantu aku?',
    'en': 'basic request for help',
  }, 2),
  EVocab('Could you do me a favor?', 'kud yu du mi e fei-ver', {
    'id': 'boleh minta tolong?',
    'en': 'polite request for a personal favour',
  }, 2),
  EVocab('Can you give me a hand?', 'ken yu giv mi e hend', {
    'id': 'bisa bantu sebentar? (pekerjaan fisik)',
    'en': 'request for practical help with a task',
  }, 2),
  EVocab('Would you mind...?', 'wud yu maind', {
    'id': 'keberatan tidak kalau...?',
    'en': 'very polite way to ask someone to do something',
  }, 2),
  EVocab('Sorry to bother you', 'so-ri tu bo-dher yu', {
    'id': 'maaf mengganggu',
    'en': 'polite opener before asking for something',
  }, 2),
  EVocab('Do you have a minute?', 'du yu hev e mi-nit', {
    'id': 'ada waktu sebentar?',
    'en': 'asking if someone is free to talk or help',
  }, 2),
  EVocab('If it\'s not too much trouble', 'if its not tu mac tra-bel', {
    'id': 'kalau tidak merepotkan',
    'en': 'softener added to a request',
  }, 2),
  EVocab('I could use some help', 'ai kud yuz sam help', {
    'id': 'aku butuh sedikit bantuan nih',
    'en': 'indirect way to say I need help',
  }, 2),
  EVocab('I\'d really appreciate it', 'aid ri-li e-pri-syi-eit it', {
    'id': 'aku akan sangat berterima kasih',
    'en': 'said when asking a favour, to show gratitude in advance',
  }, 2),
  EVocab('Do you need any help?', 'du yu nid e-ni help', {
    'id': 'perlu bantuan?',
    'en': 'offering help',
  }, 2),
  EVocab('Is there anything I can do?', 'iz dher e-ni-thing ai ken du', {
    'id': 'ada yang bisa kubantu?',
    'en': 'offering any kind of support',
  }, 2),
  EVocab('Let me help you', 'let mi help yu', {
    'id': 'sini aku bantu',
    'en': 'offering help directly',
  }, 2),
  EVocab('Let me get that for you', 'let mi get dhet for yu', {
    'id': 'biar aku yang ambilkan/bawakan',
    'en': 'offering to fetch, carry or pay for something',
  }, 2),
  EVocab('Allow me', 'e-lau mi', {
    'id': 'mari, saya saja',
    'en': 'formal offer to do a small task for someone',
  }, 2),
  EVocab('Leave it to me', 'liv it tu mi', {
    'id': 'serahkan padaku',
    'en': 'I\'ll take responsibility for it',
  }, 2),
  EVocab('I\'ll see what I can do', 'ail si wot ai ken du', {
    'id': 'akan kuusahakan',
    'en': 'I\'ll try but can\'t promise',
  }, 2),
  EVocab('I\'d be happy to help', 'aid bi he-pi tu help', {
    'id': 'dengan senang hati aku bantu',
    'en': 'willing agreement to help',
  }, 2),
  EVocab('Help yourself', 'help yor-self', {
    'id': 'silakan ambil sendiri',
    'en': 'take what you want, no need to ask',
  }, 2),
  EVocab('I can manage', 'ai ken me-nij', {
    'id': 'aku bisa sendiri kok',
    'en': 'declining help, I can do it alone',
  }, 2),
  EVocab('I\'ve got it', 'aiv got it', {
    'id': 'sudah, biar aku saja',
    'en': 'I have it under control, no help needed',
  }, 2),
  EVocab('I\'m so sorry', 'aim sou so-ri', {
    'id': 'aku sungguh minta maaf',
    'en': 'sincere apology',
  }, 3),
  EVocab('I apologize', 'ai e-po-le-jaiz', {
    'id': 'saya mohon maaf',
    'en': 'formal apology',
  }, 3),
  EVocab('My bad', 'mai bed', {
    'id': 'salahku, sori',
    'en': 'very casual admission of a small mistake',
  }, 3),
  EVocab('It\'s my fault', 'its mai folt', {
    'id': 'ini salahku',
    'en': 'I\'m responsible for the problem',
  }, 3),
  EVocab('Sorry I\'m late', 'so-ri aim leit', {
    'id': 'maaf aku terlambat',
    'en': 'apology for arriving late',
  }, 3),
  EVocab('I didn\'t mean to', 'ai di-dent min tu', {
    'id': 'aku tidak sengaja',
    'en': 'it was an accident, not my intention',
  }, 3),
  EVocab('It won\'t happen again', 'it wount he-pen e-gen', {
    'id': 'tidak akan terulang lagi',
    'en': 'promise after a mistake',
  }, 3),
  EVocab('Sorry for the trouble', 'so-ri for dhe tra-bel', {
    'id': 'maaf sudah merepotkan',
    'en': 'apology for causing someone extra work',
  }, 3),
  EVocab('No worries', 'nou wa-riz', {
    'id': 'santai aja',
    'en': 'casual reply to thanks or an apology',
  }, 3),
  EVocab('Never mind', 'ne-ver maind', {
    'id': 'sudahlah, lupakan saja',
    'en': 'forget it, it\'s not important',
  }, 3),
  EVocab('Don\'t worry about it', 'dount wa-ri e-baut it', {
    'id': 'jangan dipikirkan',
    'en': 'reassuring reply to an apology',
  }, 3),
  EVocab('No harm done', 'nou harm dan', {
    'id': 'tidak apa-apa, tidak ada yang rusak',
    'en': 'nothing bad happened, so it\'s fine',
  }, 3),
  EVocab('Thank you so much', 'thenk yu sou mac', {
    'id': 'terima kasih banyak',
    'en': 'strong thanks',
  }, 3),
  EVocab('I owe you one', 'ai ou yu wan', {
    'id': 'aku utang budi sama kamu',
    'en': 'I\'ll return the favour one day',
  }, 3),
  EVocab('That\'s very kind of you', 'dhets ve-ri kaind ov yu', {
    'id': 'kamu baik sekali',
    'en': 'polite thanks for someone\'s kindness',
  }, 3),
  EVocab('You\'re welcome', 'yor wel-kem', {
    'id': 'sama-sama',
    'en': 'standard reply to thank you',
  }, 3),
  EVocab('No problem', 'nou pro-blem', {
    'id': 'tidak masalah',
    'en': 'it was easy for me',
  }, 3),
  EVocab('Anytime', 'e-ni-taim', {
    'id': 'kapan saja (siap bantu lagi)',
    'en': 'I\'m happy to help again whenever you need',
  }, 3),
  EVocab('My pleasure', 'mai ple-zyer', {
    'id': 'dengan senang hati (balasan terima kasih)',
    'en': 'warm, polite reply to thanks',
  }, 3),
  EVocab('Don\'t mention it', 'dount men-syen it', {
    'id': 'ah, bukan apa-apa',
    'en': 'it was nothing, no need to thank me',
  }, 3),
  EVocab('That\'s great!', 'dhets greit', {
    'id': 'bagus sekali!',
    'en': 'reaction to good news',
  }, 4),
  EVocab('Good for you!', 'gud for yu', {
    'id': 'selamat ya, ikut senang!',
    'en': 'I\'m pleased about your success',
  }, 4),
  EVocab('Well done!', 'wel dan', {
    'id': 'kerja bagus!',
    'en': 'praise for an achievement',
  }, 4),
  EVocab('Congratulations!', 'ken-gre-cu-lei-syenz', {
    'id': 'selamat!',
    'en': 'said for a success or special event',
  }, 4),
  EVocab('I\'m so happy for you', 'aim sou he-pi for yu', {
    'id': 'aku turut bahagia untukmu',
    'en': 'sharing someone\'s joy',
  }, 4),
  EVocab('Lucky you!', 'la-ki yu', {
    'id': 'beruntung banget kamu!',
    'en': 'you\'re fortunate (a bit envious)',
  }, 4),
  EVocab('I can\'t wait!', 'ai kent weit', {
    'id': 'aku sudah tidak sabar!',
    'en': 'I\'m very excited about something coming',
  }, 4),
  EVocab('What a relief!', 'wot e ri-lif', {
    'id': 'lega sekali!',
    'en': 'I\'m glad the worry is over',
  }, 4),
  EVocab('Thank goodness', 'thenk gud-nes', {
    'id': 'syukurlah',
    'en': 'I\'m grateful something bad didn\'t happen',
  }, 4),
  EVocab('Really?', 'ri-li', {
    'id': 'masa sih?',
    'en': 'showing interest or mild surprise',
  }, 4),
  EVocab('No way!', 'nou wei', {
    'id': 'masa?! nggak mungkin!',
    'en': 'strong surprise or disbelief',
  }, 4),
  EVocab('You\'re kidding!', 'yor ki-ding', {
    'id': 'kamu bercanda, kan!',
    'en': 'I can\'t believe what you just told me',
  }, 4),
  EVocab('I can\'t believe it', 'ai kent bi-liv it', {
    'id': 'aku tidak percaya',
    'en': 'this is too surprising to accept',
  }, 4),
  EVocab('Oh no!', 'ou nou', {
    'id': 'aduh! gawat!',
    'en': 'reaction to bad news or a problem',
  }, 4),
  EVocab('That\'s too bad', 'dhets tu bed', {
    'id': 'sayang sekali',
    'en': 'sympathy for a disappointing situation',
  }, 4),
  EVocab('What a shame', 'wot e syeim', {
    'id': 'sayang banget, ya',
    'en': 'it\'s unfortunate that it happened',
  }, 4),
  EVocab('I\'m sorry to hear that', 'aim so-ri tu hir dhet', {
    'id': 'aku ikut prihatin',
    'en': 'sympathy for someone\'s bad news',
  }, 4),
  EVocab('How awful!', 'hau o-ful', {
    'id': 'mengerikan sekali!',
    'en': 'reaction to very bad news',
  }, 4),
  EVocab('I\'m sick of it', 'aim sik ov it', {
    'id': 'aku sudah muak',
    'en': 'I\'m tired of this and want it to stop',
  }, 4),
  EVocab('That\'s so annoying', 'dhets sou e-noi-ing', {
    'id': 'nyebelin banget',
    'en': 'this irritates me',
  }, 4),
  EVocab('Long time no see', 'long taim nou si', {
    'id': 'lama tidak bertemu',
    'en': 'it\'s been a long time since we met',
  }, 5),
  EVocab('How\'s it going?', 'haus it gou-ing', {
    'id': 'gimana kabarnya? (santai)',
    'en': 'casual way to ask how someone is',
  }, 5),
  EVocab('What\'s up?', 'wots ap', {
    'id': 'ada apa? / apa kabar? (santai sekali)',
    'en': 'very casual greeting asking what\'s happening',
  }, 5),
  EVocab('How have you been?', 'hau hev yu bin', {
    'id': 'apa kabarmu selama ini?',
    'en': 'asking about someone\'s life since you last met',
  }, 5),
  EVocab('Nice to meet you', 'nais tu mit yu', {
    'id': 'senang berkenalan denganmu',
    'en': 'said when meeting someone for the first time',
  }, 5),
  EVocab('What do you do?', 'wot du yu du', {
    'id': 'apa pekerjaanmu?',
    'en': 'asking about someone\'s job',
  }, 5),
  EVocab('Where are you from?', 'wer ar yu from', {
    'id': 'kamu berasal dari mana?',
    'en': 'asking about someone\'s hometown or country',
  }, 5),
  EVocab('How\'s your day going?', 'haus yor dei gou-ing', {
    'id': 'bagaimana harimu sejauh ini?',
    'en': 'asking how someone\'s day is so far',
  }, 5),
  EVocab('Lovely weather, isn\'t it?', 'lav-li we-dher i-zent it', {
    'id': 'cuacanya cerah, ya?',
    'en': 'weather comment used to open small talk',
  }, 5),
  EVocab('Have we met before?', 'hev wi met bi-for', {
    'id': 'apa kita pernah bertemu sebelumnya?',
    'en': 'asking whether you already know each other',
  }, 5),
  EVocab('I don\'t think we\'ve met', 'ai dount think wiv met', {
    'id': 'sepertinya kita belum berkenalan',
    'en': 'polite opener to introduce yourself to a stranger',
  }, 5),
  EVocab('Mind if I join you?', 'maind if ai join yu', {
    'id': 'boleh saya bergabung?',
    'en': 'asking to sit with or join someone',
  }, 5),
  EVocab('What brings you here?', 'wot brings yu hir', {
    'id': 'apa yang membawamu ke sini?',
    'en': 'asking why someone has come to a place',
  }, 5),
  EVocab('How do you know each other?', 'hau du yu nou ic a-dher', {
    'id': 'bagaimana kalian bisa saling kenal?',
    'en': 'asking how two people became acquainted',
  }, 5),
  EVocab('What\'s new?', 'wots nyu', {
    'id': 'ada kabar terbaru apa?',
    'en': 'asking for recent news in someone\'s life',
  }, 5),
  EVocab('How was your weekend?', 'hau woz yor wik-end', {
    'id': 'bagaimana akhir pekanmu kemarin?',
    'en': 'asking about someone\'s past weekend',
  }, 5),
  EVocab('Any plans for the weekend?', 'e-ni plenz for dhe wik-end', {
    'id': 'ada rencana akhir pekan ini?',
    'en': 'asking about someone\'s upcoming weekend plans',
  }, 5),
  EVocab('Is this seat taken?', 'iz dhis sit tei-ken', {
    'id': 'kursi ini ada yang menempati?',
    'en': 'asking whether a seat is free',
  }, 5),
  EVocab('Good to see you', 'gud tu si yu', {
    'id': 'senang bertemu lagi denganmu',
    'en': 'greeting someone you already know',
  }, 5),
  EVocab('Fancy seeing you here', 'fen-si si-ing yu hir', {
    'id': 'wah, tak disangka ketemu di sini',
    'en': 'surprise at meeting someone unexpectedly',
  }, 5),
  EVocab('How\'s work?', 'haus werk', {
    'id': 'gimana kerjaanmu belakangan ini?',
    'en': 'asking how someone\'s job is going lately',
  }, 5),
  EVocab('I\'d better get going', 'aid be-ter get gou-ing', {
    'id': 'sebaiknya saya pergi sekarang',
    'en': 'signalling that you need to leave',
  }, 6),
  EVocab('It was nice talking to you', 'it woz nais to-king tu yu', {
    'id': 'senang mengobrol denganmu',
    'en': 'polite closing after a conversation',
  }, 6),
  EVocab('Take care', 'teik ker', {
    'id': 'jaga dirimu baik-baik',
    'en': 'friendly farewell wishing someone well',
  }, 6),
  EVocab('See you later', 'si yu lei-ter', {
    'id': 'sampai jumpa nanti',
    'en': 'common casual goodbye',
  }, 6),
  EVocab('See you around', 'si yu e-raund', {
    'id': 'sampai ketemu lagi kapan-kapan',
    'en': 'casual goodbye with no fixed next meeting',
  }, 6),
  EVocab('Catch you later', 'kec yu lei-ter', {
    'id': 'nanti ngobrol lagi ya (santai sekali)',
    'en': 'very casual goodbye between friends',
  }, 6),
  EVocab('Have a good one', 'hev e gud wan', {
    'id': 'semoga lancar harimu (santai)',
    'en': 'casual all-purpose farewell wish',
  }, 6),
  EVocab('Have a nice day', 'hev e nais dei', {
    'id': 'semoga harimu menyenangkan',
    'en': 'polite wish for someone\'s day when parting',
  }, 6),
  EVocab('Keep in touch', 'kip in tac', {
    'id': 'tetap berkabar ya',
    'en': 'asking someone to keep contacting you',
  }, 6),
  EVocab('Say hi to everyone for me', 'sei hai tu ev-ri-wan for mi', {
    'id': 'titip salam untuk semuanya',
    'en': 'asking someone to pass on your greetings',
  }, 6),
  EVocab('Let\'s catch up soon', 'lets kec ap sun', {
    'id': 'kapan-kapan kita ketemu dan ngobrol lagi ya',
    'en': 'suggesting meeting again to share news',
  }, 6),
  EVocab('I\'ve got to run', 'aiv got tu ran', {
    'id': 'saya harus buru-buru pergi',
    'en': 'saying you must leave quickly',
  }, 6),
  EVocab('Safe travels', 'seif tre-velz', {
    'id': 'selamat jalan, hati-hati di perjalanan',
    'en': 'wishing someone a safe journey',
  }, 6),
  EVocab('Get home safe', 'get houm seif', {
    'id': 'hati-hati sampai rumah',
    'en': 'wishing someone gets home safely',
  }, 6),
  EVocab('Until next time', 'an-til nekst taim', {
    'id': 'sampai jumpa di lain waktu',
    'en': 'farewell expecting a later meeting',
  }, 6),
  EVocab('Talk to you soon', 'tok tu yu sun', {
    'id': 'nanti kita bicara lagi',
    'en': 'closing a call or message expecting more contact',
  }, 6),
  EVocab('Don\'t be a stranger', 'dount bi e strein-jer', {
    'id': 'sering-sering kabari ya',
    'en': 'urging someone to stay in contact',
  }, 6),
  EVocab('It\'s getting late', 'its ge-ting leit', {
    'id': 'sudah larut nih',
    'en': 'hinting that it\'s time to leave',
  }, 6),
  EVocab('I\'ll let you go', 'ail let yu gou', {
    'id': 'ya sudah, saya tidak mau menahanmu lagi',
    'en': 'polite way to end a conversation, especially on the phone',
  }, 6),
  EVocab('Bye for now', 'bai for nau', {
    'id': 'dadah, sampai nanti',
    'en': 'light goodbye implying contact again soon',
  }, 6),
  EVocab('Could you say that again?', 'kud yu sei dhet e-gen', {
    'id': 'bisa diulangi?',
    'en': 'asking someone to repeat what they said',
  }, 7),
  EVocab('Pardon?', 'par-den', {
    'id': 'maaf, apa tadi? (sopan)',
    'en': 'polite one-word request for repetition',
  }, 7),
  EVocab('Come again?', 'kam e-gen', {
    'id': 'hah, apa tadi? (santai)',
    'en': 'casual or surprised request for repetition',
  }, 7),
  EVocab('I didn\'t catch that', 'ai di-dent kec dhet', {
    'id': 'saya kurang menangkap ucapanmu',
    'en': 'saying you didn\'t hear or understand something',
  }, 7),
  EVocab('What do you mean?', 'wot du yu min', {
    'id': 'apa maksudmu?',
    'en': 'asking for the meaning of what was said',
  }, 7),
  EVocab('Could you speak a bit slower?', 'kud yu spik e bit slou-er', {
    'id': 'bisa bicara sedikit lebih pelan?',
    'en': 'asking someone to slow down',
  }, 7),
  EVocab('How do you spell that?', 'hau du yu spel dhet', {
    'id': 'bagaimana ejaannya?',
    'en': 'asking how a word or name is spelled',
  }, 7),
  EVocab('Does that make sense?', 'daz dhet meik sens', {
    'id': 'apakah penjelasan saya bisa dipahami?',
    'en': 'checking whether the listener understands',
  }, 7),
  EVocab('You know what I mean?', 'yu nou wot ai min', {
    'id': 'kamu paham maksudku kan?',
    'en': 'checking the listener follows your idea',
  }, 7),
  EVocab('So what you\'re saying is', 'sou wot yur sei-ing iz', {
    'id': 'jadi maksudmu adalah',
    'en': 'paraphrasing to check understanding',
  }, 7),
  EVocab('Let me see', 'let mi si', {
    'id': 'coba saya ingat-ingat dulu',
    'en': 'filler while you think or look something up',
  }, 7),
  EVocab('Let me think', 'let mi think', {
    'id': 'biar saya pikir dulu',
    'en': 'asking for a moment to think',
  }, 7),
  EVocab('Good question', 'gud kwes-cen', {
    'id': 'pertanyaan bagus',
    'en': 'acknowledging a question while buying time',
  }, 7),
  EVocab('How can I put it?', 'hau ken ai put it', {
    'id': 'bagaimana ya bilangnya',
    'en': 'filler while searching for the right words',
  }, 7),
  EVocab('What\'s the word?', 'wots dhe word', {
    'id': 'apa ya istilahnya',
    'en': 'searching aloud for a word you forgot',
  }, 7),
  EVocab('You know', 'yu nou', {
    'id': 'kamu tahu kan (pengisi jeda)',
    'en': 'common filler in casual speech',
  }, 7),
  EVocab('I mean', 'ai min', {
    'id': 'maksud saya',
    'en': 'used to correct or clarify what you just said',
  }, 7),
  EVocab('Where was I?', 'wer woz ai', {
    'id': 'tadi sampai mana ya?',
    'en': 'trying to resume after an interruption',
  }, 7),
  EVocab('As I was saying', 'ez ai woz sei-ing', {
    'id': 'seperti yang tadi saya bilang',
    'en': 'returning to your point after an interruption',
  }, 7),
  EVocab('Hold on a sec', 'hould on e sek', {
    'id': 'tunggu sebentar',
    'en': 'casual request to wait a moment',
  }, 7),
  EVocab('Just looking, thanks', 'jast lu-king thenks', {
    'id': 'cuma lihat-lihat, terima kasih',
    'en': 'telling a shop assistant you don\'t need help',
  }, 8),
  EVocab('How much is this?', 'hau mac iz dhis', {
    'id': 'ini berapa harganya?',
    'en': 'asking the price of an item',
  }, 8),
  EVocab(
    'Do you have this in another size?',
    'du yu hev dhis in e-na-dher saiz',
    {
      'id': 'ada ukuran lain untuk yang ini?',
      'en': 'asking for a different size',
    },
    8,
  ),
  EVocab('Can I try this on?', 'ken ai trai dhis on', {
    'id': 'boleh saya coba pakai ini?',
    'en': 'asking to try on clothes',
  }, 8),
  EVocab('Where\'s the fitting room?', 'werz dhe fi-ting rum', {
    'id': 'kamar pas di mana?',
    'en': 'asking for the changing room',
  }, 8),
  EVocab('Is this on sale?', 'iz dhis on seil', {
    'id': 'ini sedang diskon?',
    'en': 'asking whether an item is discounted',
  }, 8),
  EVocab('Do you take cards?', 'du yu teik kardz', {
    'id': 'bisa bayar pakai kartu?',
    'en': 'asking whether card payment is accepted',
  }, 8),
  EVocab('I\'ll take it', 'ail teik it', {
    'id': 'saya ambil yang ini',
    'en': 'telling the seller you will buy it',
  }, 8),
  EVocab('Keep the change', 'kip dhe ceinj', {
    'id': 'kembaliannya ambil saja',
    'en': 'telling someone not to give you change',
  }, 8),
  EVocab('Can I get a receipt?', 'ken ai get e ri-sit', {
    'id': 'boleh minta struknya?',
    'en': 'asking for proof of payment',
  }, 8),
  EVocab('A table for two, please', 'e tei-bel for tu pliz', {
    'id': 'meja untuk dua orang',
    'en': 'asking a restaurant for a table',
  }, 8),
  EVocab('I have a reservation', 'ai hev e re-zer-vei-syen', {
    'id': 'saya sudah reservasi',
    'en': 'telling staff you booked a table',
  }, 8),
  EVocab('Can I see the menu?', 'ken ai si dhe me-nyu', {
    'id': 'boleh lihat menunya?',
    'en': 'asking for the menu',
  }, 8),
  EVocab('Are you ready to order?', 'ar yu re-di tu or-der', {
    'id': 'sudah siap memesan?',
    'en': 'waiter\'s question before taking an order',
  }, 8),
  EVocab('What do you recommend?', 'wot du yu re-ke-mend', {
    'id': 'apa yang Anda rekomendasikan?',
    'en': 'asking staff for a suggestion',
  }, 8),
  EVocab('I\'ll have the same', 'ail hev dhe seim', {
    'id': 'saya pesan yang sama',
    'en': 'ordering what someone else ordered',
  }, 8),
  EVocab('For here or to go?', 'for hir or tu gou', {
    'id': 'makan di sini atau dibawa pulang?',
    'en': 'asking whether food is eaten in or taken away',
  }, 8),
  EVocab('Anything else?', 'e-ni-thing els', {
    'id': 'ada lagi?',
    'en': 'staff asking whether you want more',
  }, 8),
  EVocab('That\'s all', 'dhets ol', {
    'id': 'itu saja',
    'en': 'saying your order is complete',
  }, 8),
  EVocab('Can I get the bill?', 'ken ai get dhe bil', {
    'id': 'boleh minta bonnya?',
    'en': 'asking to pay at a restaurant',
  }, 8),
  EVocab('Can we split the bill?', 'ken wi split dhe bil', {
    'id': 'bisa bayar sendiri-sendiri?',
    'en': 'asking to divide the payment',
  }, 8),
  EVocab('It\'s on me', 'its on mi', {
    'id': 'biar saya yang traktir',
    'en': 'saying you will pay for everyone',
  }, 8),
  EVocab('Who\'s calling, please?', 'huz ko-ling pliz', {
    'id': 'dengan siapa saya bicara?',
    'en': 'asking a caller\'s identity',
  }, 9),
  EVocab('Speaking', 'spi-king', {
    'id': 'ya, saya sendiri (di telepon)',
    'en': 'phone reply meaning the caller is talking to the right person',
  }, 9),
  EVocab('Can I take a message?', 'ken ai teik e me-sej', {
    'id': 'mau titip pesan?',
    'en': 'offering to note down a message for someone',
  }, 9),
  EVocab('Hold the line, please', 'hould dhe lain pliz', {
    'id': 'mohon tunggu, jangan ditutup dulu',
    'en': 'asking a caller to stay on the phone',
  }, 9),
  EVocab('You\'ve got the wrong number', 'yuv got dhe rong nam-ber', {
    'id': 'Anda salah sambung',
    'en': 'telling a caller they dialled the wrong number',
  }, 9),
  EVocab('I\'ll call you back', 'ail kol yu bek', {
    'id': 'nanti saya telepon balik',
    'en': 'promising to return a call',
  }, 9),
  EVocab('You\'re breaking up', 'yur brei-king ap', {
    'id': 'suaramu putus-putus',
    'en': 'saying the phone connection is bad',
  }, 9),
  EVocab('Can you hear me?', 'ken yu hir mi', {
    'id': 'suaraku terdengar?',
    'en': 'checking the call connection',
  }, 9),
  EVocab('Is now a good time?', 'iz nau e gud taim', {
    'id': 'apakah sekarang waktunya pas?',
    'en': 'checking whether someone can talk now',
  }, 9),
  EVocab('Sorry I missed your call', 'so-ri ai mist yor kol', {
    'id': 'maaf tadi tidak sempat angkat teleponmu',
    'en': 'explaining you didn\'t answer a call',
  }, 9),
  EVocab('Are you free on Friday?', 'ar yu fri on frai-dei', {
    'id': 'kamu kosong hari Jumat?',
    'en': 'asking about someone\'s availability',
  }, 9),
  EVocab('What time works for you?', 'wot taim works for yu', {
    'id': 'jam berapa yang cocok untukmu?',
    'en': 'asking someone\'s preferred time',
  }, 9),
  EVocab('How about Monday?', 'hau e-baut man-dei', {
    'id': 'bagaimana kalau hari Senin?',
    'en': 'suggesting a day to meet',
  }, 9),
  EVocab('Let me check my calendar', 'let mi cek mai ke-len-der', {
    'id': 'coba saya cek jadwal dulu',
    'en': 'checking your schedule before agreeing',
  }, 9),
  EVocab(
    'I\'d like to make an appointment',
    'aid laik tu meik en e-point-ment',
    {
      'id': 'saya ingin membuat janji temu',
      'en': 'booking a visit with a doctor, office, etc.',
    },
    9,
  ),
  EVocab('I need to reschedule', 'ai nid tu ri-ske-jul', {
    'id': 'saya perlu mengganti jadwal',
    'en': 'asking to move an appointment',
  }, 9),
  EVocab('Something came up', 'sam-thing keim ap', {
    'id': 'ada urusan mendadak',
    'en': 'excuse for cancelling or changing plans',
  }, 9),
  EVocab('I\'m running late', 'aim ra-ning leit', {
    'id': 'saya bakal agak terlambat',
    'en': 'warning that you will arrive late',
  }, 9),
  EVocab('I\'m on my way', 'aim on mai wei', {
    'id': 'saya sedang di jalan',
    'en': 'saying you are already coming',
  }, 9),
  EVocab('See you then', 'si yu dhen', {
    'id': 'sampai ketemu nanti sesuai janji',
    'en': 'goodbye confirming an arranged meeting',
  }, 9),
  EVocab('What time is it?', 'wot taim iz it', {
    'id': 'jam berapa sekarang?',
    'en': 'asking the current time',
  }, 9),
];

/// Judul grup untuk [phrasalVocab].
const List<Map<String, String>> phrasalVocabGroups = [
  {'id': 'Phrasal verb dengan GET', 'en': 'Phrasal verbs with GET'},
  {'id': 'Phrasal verb dengan GO', 'en': 'Phrasal verbs with GO'},
  {'id': 'Phrasal verb dengan COME', 'en': 'Phrasal verbs with COME'},
  {'id': 'Phrasal verb dengan TAKE', 'en': 'Phrasal verbs with TAKE'},
  {'id': 'Phrasal verb dengan PUT', 'en': 'Phrasal verbs with PUT'},
  {'id': 'Phrasal verb dengan LOOK', 'en': 'Phrasal verbs with LOOK'},
  {'id': 'Phrasal verb dengan TURN', 'en': 'Phrasal verbs with TURN'},
  {
    'id': 'Phrasal verb dengan GIVE & BRING',
    'en': 'Phrasal verbs with GIVE & BRING',
  },
  {
    'id': 'Phrasal verb dengan MAKE, SET, RUN & PICK',
    'en': 'Phrasal verbs with MAKE, SET, RUN & PICK',
  },
  {
    'id': 'Phrasal verb dengan KEEP, HOLD & CARRY',
    'en': 'Phrasal verbs with KEEP, HOLD & CARRY',
  },
  {
    'id': 'Phrasal verb dengan BREAK, CALL & CUT',
    'en': 'Phrasal verbs with BREAK, CALL & CUT',
  },
  {
    'id': 'Phrasal verb dengan SHOW, STAND & HANG',
    'en': 'Phrasal verbs with SHOW, STAND & HANG',
  },
  {
    'id': 'Phrasal verb dengan FALL, PASS, DROP & PULL',
    'en': 'Phrasal verbs with FALL, PASS, DROP & PULL',
  },
  {
    'id': 'Phrasal verb berpartikel UP',
    'en': 'Phrasal verbs with the particle UP',
  },
  {
    'id': 'Phrasal verb berpartikel DOWN',
    'en': 'Phrasal verbs with the particle DOWN',
  },
  {'id': 'Kata kerja lain', 'en': 'Other verbs'},
];

/// Phrasal verb yang paling sering dipakai.
const List<EVocab> phrasalVocab = [
  EVocab('get up', 'get ap', {
    'id': 'bangun (dari tidur)',
    'en': 'rise from bed',
  }, 0),
  EVocab('get back', 'get bek', {
    'id': 'kembali; pulang',
    'en': 'return; come home',
  }, 0),
  EVocab('get out', 'get aut', {
    'id': 'keluar (dari tempat)',
    'en': 'leave a place',
  }, 0),
  EVocab('get on', 'get on', {
    'id': 'naik (bus, kereta, pesawat)',
    'en': 'board a bus, train or plane',
  }, 0),
  EVocab('get off', 'get of', {
    'id': 'turun (dari kendaraan)',
    'en': 'leave a bus, train or plane',
  }, 0),
  EVocab('get in', 'get in', {
    'id': 'masuk (ke mobil); tiba',
    'en': 'enter a car; arrive',
  }, 0),
  EVocab('get along', 'get e-long', {
    'id': 'akur; rukun',
    'en': 'have a friendly relationship',
  }, 0),
  EVocab('get over', 'get ou-ver', {
    'id': 'pulih dari; melupakan',
    'en': 'recover from',
  }, 0),
  EVocab('get through', 'get thru', {
    'id': 'melewati (masa sulit)',
    'en': 'survive a difficult time',
  }, 0),
  EVocab('get away', 'get e-wei', {
    'id': 'kabur; pergi berlibur',
    'en': 'escape; go on holiday',
  }, 0),
  EVocab('get together', 'get tu-ge-dher', {
    'id': 'berkumpul; bertemu',
    'en': 'meet socially',
  }, 0),
  EVocab('get rid of', 'get rid ov', {
    'id': 'menyingkirkan; membuang',
    'en': 'remove something unwanted',
  }, 0),
  EVocab('get by', 'get bai', {
    'id': 'bertahan hidup (pas-pasan)',
    'en': 'manage with little money',
  }, 0),
  EVocab('get into', 'get in-tu', {
    'id': 'masuk ke; mulai menyukai',
    'en': 'enter; become interested in',
  }, 0),
  EVocab('go on', 'gou on', {
    'id': 'berlanjut; terjadi',
    'en': 'continue; happen',
  }, 1),
  EVocab('go back', 'gou bek', {
    'id': 'kembali (ke tempat semula)',
    'en': 'return to a place',
  }, 1),
  EVocab('go out', 'gou aut', {
    'id': 'keluar (bersenang-senang)',
    'en': 'leave home for fun',
  }, 1),
  EVocab('go down', 'gou daun', {
    'id': 'turun; menurun',
    'en': 'decrease; descend',
  }, 1),
  EVocab('go up', 'gou ap', {
    'id': 'naik; meningkat',
    'en': 'increase; rise',
  }, 1),
  EVocab('go through', 'gou thru', {
    'id': 'mengalami (hal berat)',
    'en': 'experience something difficult',
  }, 1),
  EVocab('go off', 'gou of', {
    'id': 'berbunyi (alarm); basi',
    'en': 'ring (alarm); go bad (food)',
  }, 1),
  EVocab('go away', 'gou e-wei', {
    'id': 'pergi; hilang',
    'en': 'leave; disappear',
  }, 1),
  EVocab('go for', 'gou for', {
    'id': 'memilih; mengejar (tujuan)',
    'en': 'choose; try to achieve',
  }, 1),
  EVocab('go along with', 'gou e-long widh', {
    'id': 'ikut menyetujui',
    'en': 'agree with; accept',
  }, 1),
  EVocab('go out with', 'gou aut widh', {
    'id': 'berpacaran dengan',
    'en': 'date someone',
  }, 1),
  EVocab('come back', 'kam bek', {
    'id': 'kembali (ke sini)',
    'en': 'return here',
  }, 2),
  EVocab('come on', 'kam on', {
    'id': 'ayo!; menyala',
    'en': 'hurry up!; start working (device)',
  }, 2),
  EVocab('come up', 'kam ap', {
    'id': 'muncul (topik, masalah)',
    'en': 'arise; be mentioned',
  }, 2),
  EVocab('come out', 'kam aut', {
    'id': 'keluar; terbit; dirilis',
    'en': 'be published; appear',
  }, 2),
  EVocab('come in', 'kam in', {
    'id': 'masuk (ke ruangan)',
    'en': 'enter a room',
  }, 2),
  EVocab('come along', 'kam e-long', {
    'id': 'ikut serta; berkembang',
    'en': 'accompany; make progress',
  }, 2),
  EVocab('come across', 'kam e-kros', {
    'id': 'menemukan secara kebetulan',
    'en': 'find by chance',
  }, 2),
  EVocab('come over', 'kam ou-ver', {
    'id': 'datang berkunjung (ke rumah)',
    'en': 'visit someone\'s home',
  }, 2),
  EVocab('come down', 'kam daun', {
    'id': 'turun (harga, dari atas)',
    'en': 'fall; come to a lower place',
  }, 2),
  EVocab('come down with', 'kam daun widh', {
    'id': 'jatuh sakit (terkena penyakit)',
    'en': 'catch an illness',
  }, 2),
  EVocab('take off', 'teik of', {
    'id': 'lepas landas; melepas (pakaian)',
    'en': 'leave the ground; remove clothes',
  }, 3),
  EVocab('take on', 'teik on', {
    'id': 'menerima (tugas); merekrut',
    'en': 'accept work; hire',
  }, 3),
  EVocab('take out', 'teik aut', {
    'id': 'mengeluarkan; mengajak keluar',
    'en': 'remove from inside; invite out',
  }, 3),
  EVocab('take up', 'teik ap', {
    'id': 'mulai menekuni (hobi); menyita',
    'en': 'start a hobby; occupy',
  }, 3),
  EVocab('take back', 'teik bek', {
    'id': 'mengembalikan (barang); menarik ucapan',
    'en': 'return goods; retract words',
  }, 3),
  EVocab('take in', 'teik in', {
    'id': 'memahami; menampung',
    'en': 'absorb information; give shelter',
  }, 3),
  EVocab('take away', 'teik e-wei', {
    'id': 'mengambil; membawa pergi',
    'en': 'remove; carry off',
  }, 3),
  EVocab('take down', 'teik daun', {
    'id': 'menurunkan; membongkar',
    'en': 'remove from a high place',
  }, 3),
  EVocab('take after', 'teik af-ter', {
    'id': 'mirip (orang tua)',
    'en': 'resemble a parent',
  }, 3),
  EVocab('put on', 'put on', {
    'id': 'memakai (pakaian)',
    'en': 'dress in; wear',
  }, 4),
  EVocab('put off', 'put of', {'id': 'menunda', 'en': 'postpone'}, 4),
  EVocab('put out', 'put aut', {
    'id': 'memadamkan (api)',
    'en': 'extinguish',
  }, 4),
  EVocab('put up', 'put ap', {
    'id': 'memasang; menaikkan',
    'en': 'erect; display',
  }, 4),
  EVocab('put down', 'put daun', {
    'id': 'meletakkan',
    'en': 'place on a surface',
  }, 4),
  EVocab('put away', 'put e-wei', {
    'id': 'menyimpan (ke tempatnya)',
    'en': 'store in its place',
  }, 4),
  EVocab('put back', 'put bek', {
    'id': 'mengembalikan ke tempat semula',
    'en': 'return to its original place',
  }, 4),
  EVocab('put up with', 'put ap widh', {
    'id': 'tahan menghadapi; menoleransi',
    'en': 'tolerate',
  }, 4),
  EVocab('put in', 'put in', {
    'id': 'memasang; mencurahkan (usaha)',
    'en': 'install; invest effort',
  }, 4),
  EVocab('look for', 'luk for', {'id': 'mencari', 'en': 'search for'}, 5),
  EVocab('look after', 'luk af-ter', {
    'id': 'merawat; menjaga',
    'en': 'take care of',
  }, 5),
  EVocab('look up', 'luk ap', {
    'id': 'mencari (di kamus/internet)',
    'en': 'search in a reference',
  }, 5),
  EVocab('look out', 'luk aut', {'id': 'hati-hati!', 'en': 'be careful!'}, 5),
  EVocab('look around', 'luk e-raund', {
    'id': 'melihat-lihat',
    'en': 'explore a place',
  }, 5),
  EVocab('look back', 'luk bek', {
    'id': 'mengenang (masa lalu)',
    'en': 'remember the past',
  }, 5),
  EVocab('look through', 'luk thru', {
    'id': 'menelusuri isi; membaca sekilas',
    'en': 'search through contents',
  }, 5),
  EVocab('look up to', 'luk ap tu', {
    'id': 'mengagumi; menghormati',
    'en': 'admire; respect',
  }, 5),
  EVocab('look down on', 'luk daun on', {
    'id': 'meremehkan; memandang rendah',
    'en': 'consider inferior',
  }, 5),
  EVocab('look out for', 'luk aut for', {
    'id': 'mewaspadai; menjaga',
    'en': 'watch for; protect',
  }, 5),
  EVocab('turn out', 'tern aut', {'id': 'ternyata', 'en': 'prove to be'}, 6),
  EVocab('turn on', 'tern on', {'id': 'menyalakan', 'en': 'switch on'}, 6),
  EVocab('turn off', 'tern of', {'id': 'mematikan', 'en': 'switch off'}, 6),
  EVocab('turn around', 'tern e-raund', {
    'id': 'berbalik; membaik',
    'en': 'face the other way; improve',
  }, 6),
  EVocab('turn into', 'tern in-tu', {
    'id': 'berubah menjadi',
    'en': 'transform into',
  }, 6),
  EVocab('turn up', 'tern ap', {
    'id': 'muncul; mengeraskan (volume)',
    'en': 'appear; increase volume',
  }, 6),
  EVocab('turn back', 'tern bek', {
    'id': 'putar balik',
    'en': 'return the way you came',
  }, 6),
  EVocab('turn over', 'tern ou-ver', {'id': 'membalik', 'en': 'flip'}, 6),
  EVocab('turn to', 'tern tu', {
    'id': 'beralih ke; meminta bantuan',
    'en': 'seek help from',
  }, 6),
  EVocab('give up', 'giv ap', {
    'id': 'menyerah; berhenti (kebiasaan)',
    'en': 'quit; stop trying',
  }, 7),
  EVocab('give back', 'giv bek', {
    'id': 'mengembalikan (ke pemiliknya)',
    'en': 'return to the owner',
  }, 7),
  EVocab('give away', 'giv e-wei', {
    'id': 'memberikan cuma-cuma; membocorkan',
    'en': 'give for free; reveal',
  }, 7),
  EVocab('give out', 'giv aut', {
    'id': 'habis; berhenti berfungsi',
    'en': 'become exhausted; stop working',
  }, 7),
  EVocab('give in', 'giv in', {'id': 'mengalah', 'en': 'yield'}, 7),
  EVocab('bring up', 'bring ap', {
    'id': 'mengangkat (topik); membesarkan (anak)',
    'en': 'mention; raise a child',
  }, 7),
  EVocab('bring back', 'bring bek', {
    'id': 'membawa kembali; mengingatkan',
    'en': 'return with; recall memories',
  }, 7),
  EVocab('bring in', 'bring in', {
    'id': 'mendatangkan; menghasilkan',
    'en': 'introduce; earn',
  }, 7),
  EVocab('bring about', 'bring e-baut', {
    'id': 'menyebabkan; mewujudkan',
    'en': 'cause to happen',
  }, 7),
  EVocab('bring out', 'bring aut', {
    'id': 'merilis; menonjolkan',
    'en': 'release a product; reveal a quality',
  }, 7),
  EVocab('bring down', 'bring daun', {
    'id': 'menurunkan; menjatuhkan',
    'en': 'reduce; cause to fall',
  }, 7),
  EVocab('make up', 'meik ap', {
    'id': 'berbaikan; mengarang',
    'en': 'reconcile; invent',
  }, 8),
  EVocab('make up for', 'meik ap for', {
    'id': 'menebus; mengganti',
    'en': 'compensate for',
  }, 8),
  EVocab('set up', 'set ap', {
    'id': 'mendirikan; menyiapkan',
    'en': 'establish; arrange',
  }, 8),
  EVocab('set out', 'set aut', {
    'id': 'memulai (usaha); memaparkan',
    'en': 'begin a task; present clearly',
  }, 8),
  EVocab('set off', 'set of', {
    'id': 'berangkat (perjalanan); memicu',
    'en': 'start a journey; trigger',
  }, 8),
  EVocab('set back', 'set bek', {
    'id': 'menghambat kemajuan',
    'en': 'delay progress',
  }, 8),
  EVocab('run into', 'ran in-tu', {
    'id': 'bertemu tak sengaja',
    'en': 'meet by chance',
  }, 8),
  EVocab('run away', 'ran e-wei', {
    'id': 'kabur; melarikan diri',
    'en': 'flee',
  }, 8),
  EVocab('run over', 'ran ou-ver', {
    'id': 'menabrak; melindas',
    'en': 'hit with a vehicle',
  }, 8),
  EVocab('pick out', 'pik aut', {'id': 'memilih', 'en': 'select'}, 8),
  EVocab('pick on', 'pik on', {
    'id': 'mengganggu; merundung',
    'en': 'bully; tease',
  }, 8),
  EVocab('keep up', 'kip ap', {
    'id': 'mempertahankan; terus (bagus)',
    'en': 'maintain; continue well',
  }, 9),
  EVocab('keep up with', 'kip ap widh', {
    'id': 'tidak ketinggalan; mengimbangi',
    'en': 'stay level with',
  }, 9),
  EVocab('keep on', 'kip on', {
    'id': 'terus-menerus melakukan',
    'en': 'continue repeatedly',
  }, 9),
  EVocab('keep away', 'kip e-wei', {
    'id': 'menjauh; menjauhkan',
    'en': 'stay at a distance',
  }, 9),
  EVocab('hold on', 'hould on', {
    'id': 'tunggu sebentar; berpegangan',
    'en': 'wait a moment; grip',
  }, 9),
  EVocab('hold up', 'hould ap', {
    'id': 'menunda; menahan; merampok',
    'en': 'delay; rob',
  }, 9),
  EVocab('hold back', 'hould bek', {
    'id': 'menahan (diri, emosi)',
    'en': 'restrain',
  }, 9),
  EVocab('carry on', 'ke-ri on', {
    'id': 'melanjutkan',
    'en': 'continue doing something',
  }, 9),
  EVocab('break down', 'breik daun', {
    'id': 'mogok; rusak; menangis',
    'en': 'stop working (machine)',
  }, 10),
  EVocab('break up', 'breik ap', {
    'id': 'putus (pacaran); bubar',
    'en': 'end a relationship',
  }, 10),
  EVocab('break into', 'breik in-tu', {
    'id': 'membobol (masuk paksa)',
    'en': 'enter by force',
  }, 10),
  EVocab('break out', 'breik aut', {
    'id': 'pecah (perang, wabah); kabur',
    'en': 'start suddenly; escape',
  }, 10),
  EVocab('call off', 'kol of', {'id': 'membatalkan', 'en': 'cancel'}, 10),
  EVocab('call for', 'kol for', {
    'id': 'memerlukan; menuntut',
    'en': 'require; demand',
  }, 10),
  EVocab('call on', 'kol on', {
    'id': 'meminta (seseorang bicara); mengunjungi',
    'en': 'ask to speak; visit briefly',
  }, 10),
  EVocab('cut off', 'kat of', {
    'id': 'memutus (aliran, sambungan)',
    'en': 'disconnect',
  }, 10),
  EVocab('cut down on', 'kat daun on', {
    'id': 'mengurangi konsumsi',
    'en': 'consume less of',
  }, 10),
  EVocab('show up', 'syou ap', {
    'id': 'datang; hadir',
    'en': 'arrive (often late)',
  }, 11),
  EVocab('show off', 'syou of', {'id': 'pamer', 'en': 'boast'}, 11),
  EVocab('stand up', 'stend ap', {
    'id': 'berdiri',
    'en': 'rise to your feet',
  }, 11),
  EVocab('stand out', 'stend aut', {
    'id': 'menonjol',
    'en': 'be noticeable',
  }, 11),
  EVocab('stand for', 'stend for', {
    'id': 'merupakan singkatan dari',
    'en': 'represent (abbreviation)',
  }, 11),
  EVocab('stand up for', 'stend ap for', {'id': 'membela', 'en': 'defend'}, 11),
  EVocab('hang out', 'heng aut', {
    'id': 'nongkrong',
    'en': 'spend time casually',
  }, 11),
  EVocab('hang on', 'heng on', {
    'id': 'tunggu dulu (santai)',
    'en': 'wait briefly (casual)',
  }, 11),
  EVocab('fall apart', 'fol e-part', {
    'id': 'hancur; berantakan',
    'en': 'break into pieces',
  }, 12),
  EVocab('fall behind', 'fol bi-haind', {
    'id': 'tertinggal',
    'en': 'fail to keep pace',
  }, 12),
  EVocab('fall for', 'fol for', {
    'id': 'jatuh cinta pada; tertipu',
    'en': 'fall in love with; be tricked',
  }, 12),
  EVocab('pass away', 'pes e-wei', {
    'id': 'meninggal dunia',
    'en': 'die (polite)',
  }, 12),
  EVocab('pass out', 'pes aut', {'id': 'pingsan', 'en': 'faint'}, 12),
  EVocab('drop out', 'drop aut', {
    'id': 'putus sekolah; keluar (dari kegiatan)',
    'en': 'leave school early',
  }, 12),
  EVocab('pull out', 'pul aut', {
    'id': 'menarik keluar; mundur',
    'en': 'withdraw',
  }, 12),
  EVocab('pull over', 'pul ou-ver', {
    'id': 'menepi (kendaraan)',
    'en': 'stop at the roadside',
  }, 12),
  EVocab('wake up', 'weik ap', {'id': 'terbangun', 'en': 'stop sleeping'}, 13),
  EVocab('grow up', 'grou ap', {
    'id': 'tumbuh dewasa',
    'en': 'become an adult',
  }, 13),
  EVocab('end up', 'end ap', {
    'id': 'akhirnya (berada/menjadi)',
    'en': 'finally be in a situation',
  }, 13),
  EVocab('clean up', 'klin ap', {
    'id': 'membersihkan; merapikan',
    'en': 'tidy up',
  }, 13),
  EVocab('hurry up', 'ha-ri ap', {
    'id': 'cepat-cepat; bergegas',
    'en': 'move faster',
  }, 13),
  EVocab('back up', 'bek ap', {
    'id': 'mencadangkan (data); mendukung',
    'en': 'make a copy; support',
  }, 13),
  EVocab('warm up', 'worm ap', {
    'id': 'pemanasan; menghangatkan',
    'en': 'prepare with light exercise; heat',
  }, 13),
  EVocab('cheer up', 'cir ap', {
    'id': 'menghibur; jadi ceria',
    'en': 'become happier',
  }, 13),
  EVocab('mix up', 'miks ap', {
    'id': 'tertukar; mencampuradukkan',
    'en': 'confuse two things',
  }, 13),
  EVocab('fill up', 'fil ap', {
    'id': 'mengisi penuh',
    'en': 'fill completely',
  }, 13),
  EVocab('sit down', 'sit daun', {'id': 'duduk', 'en': 'take a seat'}, 14),
  EVocab('calm down', 'kaam daun', {
    'id': 'tenang; menenangkan',
    'en': 'become relaxed',
  }, 14),
  EVocab('slow down', 'slou daun', {
    'id': 'melambat; memperlambat',
    'en': 'reduce speed',
  }, 14),
  EVocab('settle down', 'se-tel daun', {
    'id': 'menetap; hidup mapan',
    'en': 'start a stable life',
  }, 14),
  EVocab('write down', 'rait daun', {
    'id': 'mencatat',
    'en': 'record on paper',
  }, 14),
  EVocab('lie down', 'lai daun', {
    'id': 'berbaring',
    'en': 'rest horizontally',
  }, 14),
  EVocab('let down', 'let daun', {
    'id': 'mengecewakan',
    'en': 'disappoint',
  }, 14),
  EVocab('find out', 'faind aut', {
    'id': 'mencari tahu; mengetahui',
    'en': 'discover information',
  }, 15),
  EVocab('work out', 'werk aut', {
    'id': 'berolahraga; berhasil',
    'en': 'exercise; succeed',
  }, 15),
  EVocab('check out', 'cek aut', {
    'id': 'check-out (hotel); melihat-lihat',
    'en': 'leave a hotel; take a look at',
  }, 15),
  EVocab('check in', 'cek in', {
    'id': 'lapor kedatangan (check-in)',
    'en': 'register on arrival',
  }, 15),
  EVocab('work on', 'werk on', {
    'id': 'mengerjakan; memperbaiki',
    'en': 'spend time improving',
  }, 15),
  EVocab('sort out', 'sort aut', {
    'id': 'membereskan; menyelesaikan',
    'en': 'resolve; organize',
  }, 15),
  EVocab('move on', 'muv on', {
    'id': 'melanjutkan hidup; beralih',
    'en': 'start something new',
  }, 15),
  EVocab('hand out', 'hend aut', {'id': 'membagikan', 'en': 'distribute'}, 15),
  EVocab('throw away', 'throu e-wei', {'id': 'membuang', 'en': 'discard'}, 15),
  EVocab('try on', 'trai on', {
    'id': 'mencoba (pakaian)',
    'en': 'test clothes for fit',
  }, 15),
  EVocab('count on', 'kaunt on', {'id': 'mengandalkan', 'en': 'depend on'}, 15),
  EVocab('fit in', 'fit in', {
    'id': 'menyesuaikan diri; cocok',
    'en': 'be accepted in a group',
  }, 15),
  EVocab('watch out', 'woc aut', {'id': 'awas; waspadai', 'en': 'beware'}, 15),
];

/// Judul grup untuk [idiomVocab].
const List<Map<String, String>> idiomVocabGroups = [
  {'id': 'Mudah & sulit', 'en': 'Easy & difficult'},
  {'id': 'Waktu & kesempatan', 'en': 'Time & opportunity'},
  {'id': 'Uang & harga', 'en': 'Money & price'},
  {'id': 'Kerja & usaha', 'en': 'Work & effort'},
  {'id': 'Perasaan & suasana hati', 'en': 'Feelings & mood'},
  {'id': 'Kesehatan & tubuh', 'en': 'Health & body'},
  {'id': 'Hubungan & komunikasi', 'en': 'Relationships & communication'},
  {'id': 'Masalah & keputusan', 'en': 'Problems & decisions'},
  {'id': 'Sukses & gagal', 'en': 'Success & failure'},
  {'id': 'Rahasia & kejujuran', 'en': 'Secrets & honesty'},
  {'id': 'Sifat & perilaku', 'en': 'Personality & behaviour'},
  {'id': 'Lain-lain', 'en': 'Miscellaneous'},
];

/// Idiom yang umum dipakai.
const List<EVocab> idiomVocab = [
  EVocab('piece of cake', 'pis ov keik', {
    'id': 'sangat mudah',
    'en': 'something very easy',
  }, 0),
  EVocab('easier said than done', 'i-zi-er sed dhen dan', {
    'id': 'gampang diucapkan, sulit dilakukan',
    'en': 'harder to do than to talk about',
  }, 0),
  EVocab('a walk in the park', 'e wok in dhe park', {
    'id': 'pekerjaan enteng dan menyenangkan',
    'en': 'an easy, pleasant task',
  }, 0),
  EVocab('not rocket science', 'not ro-ket sai-ens', {
    'id': 'tidak serumit yang dibayangkan',
    'en': 'not complicated at all',
  }, 0),
  EVocab('get the hang of it', 'get dhe heng ov it', {
    'id': 'mulai terbiasa dan bisa melakukannya',
    'en': 'learn how to do something',
  }, 0),
  EVocab('smooth sailing', 'smudh sei-ling', {
    'id': 'berjalan lancar tanpa hambatan',
    'en': 'progress without problems',
  }, 0),
  EVocab('a tough nut to crack', 'e taf nat tu krek', {
    'id': 'masalah atau orang yang sulit ditaklukkan',
    'en': 'a hard problem or person to deal with',
  }, 0),
  EVocab('an uphill battle', 'en ap-hil be-tel', {
    'id': 'perjuangan berat melawan banyak rintangan',
    'en': 'a long struggle against difficulties',
  }, 0),
  EVocab('a tall order', 'e tol or-der', {
    'id': 'permintaan yang sulit dipenuhi',
    'en': 'a demand that is hard to meet',
  }, 0),
  EVocab('jump through hoops', 'jamp thru hups', {
    'id': 'harus melewati banyak prosedur ribet',
    'en': 'go through many tiresome steps',
  }, 0),
  EVocab('bite off more than you can chew', 'bait of mor dhen yu ken cu', {
    'id': 'mengambil tugas melebihi kemampuan',
    'en': 'take on more than you can handle',
  }, 0),
  EVocab('learn the hard way', 'lern dhe hard wei', {
    'id': 'belajar dari pengalaman pahit',
    'en': 'learn through a bad experience',
  }, 0),
  EVocab('once in a blue moon', 'wans in e blu mun', {
    'id': 'sangat jarang terjadi',
    'en': 'very rarely',
  }, 1),
  EVocab('in the nick of time', 'in dhe nik ov taim', {
    'id': 'tepat sebelum terlambat',
    'en': 'just before it is too late',
  }, 1),
  EVocab('at the eleventh hour', 'et dhi i-le-venth a-wer', {
    'id': 'di saat-saat terakhir',
    'en': 'at the last possible moment',
  }, 1),
  EVocab('in no time', 'in nou taim', {
    'id': 'dalam waktu singkat sekali',
    'en': 'very quickly',
  }, 1),
  EVocab('on the dot', 'on dhe dot', {
    'id': 'tepat pada jamnya',
    'en': 'at exactly the stated time',
  }, 1),
  EVocab('around the clock', 'e-raund dhe klok', {
    'id': 'siang malam tanpa henti',
    'en': 'all day and all night',
  }, 1),
  EVocab('kill time', 'kil taim', {
    'id': 'mengisi waktu sambil menunggu',
    'en': 'pass time while waiting',
  }, 1),
  EVocab('miss the boat', 'mis dhe bout', {
    'id': 'ketinggalan kesempatan',
    'en': 'miss an opportunity',
  }, 1),
  EVocab('strike while the iron is hot', 'straik wail dhi ai-ern iz hot', {
    'id': 'memanfaatkan kesempatan selagi ada',
    'en': 'act while conditions are good',
  }, 1),
  EVocab('a long shot', 'e long syot', {
    'id': 'peluang yang tipis',
    'en': 'something unlikely to succeed',
  }, 1),
  EVocab('once in a lifetime', 'wans in e laif-taim', {
    'id': 'hanya terjadi sekali seumur hidup',
    'en': 'happening only once ever',
  }, 1),
  EVocab('cost an arm and a leg', 'kost en arm end e leg', {
    'id': 'sangat mahal',
    'en': 'extremely expensive',
  }, 2),
  EVocab('break the bank', 'breik dhe benk', {
    'id': 'menguras isi dompet',
    'en': 'cost more than you can afford',
  }, 2),
  EVocab('pay through the nose', 'pei thru dhe nouz', {
    'id': 'membayar jauh lebih mahal dari wajar',
    'en': 'pay far too much',
  }, 2),
  EVocab('make ends meet', 'meik endz mit', {
    'id': 'mencukupkan penghasilan untuk hidup',
    'en': 'have just enough money to live',
  }, 2),
  EVocab('tighten your belt', 'tai-ten yor belt', {
    'id': 'berhemat ketat',
    'en': 'spend less money',
  }, 2),
  EVocab('on a shoestring', 'on e syu-string', {
    'id': 'dengan modal sangat minim',
    'en': 'with very little money',
  }, 2),
  EVocab('strapped for cash', 'strept for kesy', {
    'id': 'sedang kekurangan uang',
    'en': 'short of money',
  }, 2),
  EVocab('live from paycheck to paycheck', 'liv from pei-cek tu pei-cek', {
    'id': 'gaji habis sebelum gajian berikutnya',
    'en': 'spend all income before the next pay',
  }, 2),
  EVocab('foot the bill', 'fut dhe bil', {
    'id': 'menanggung biaya',
    'en': 'pay for something',
  }, 2),
  EVocab('go Dutch', 'gou dac', {
    'id': 'bayar sendiri-sendiri',
    'en': 'each person pays for themselves',
  }, 2),
  EVocab('worth every penny', 'werth ev-ri pe-ni', {
    'id': 'sepadan dengan harganya',
    'en': 'worth the money spent',
  }, 2),
  EVocab('a steal', 'e stil', {
    'id': 'barang murah sekali untuk kualitasnya',
    'en': 'a great bargain',
  }, 2),
  EVocab('call it a day', 'kol it e dei', {
    'id': 'berhenti bekerja untuk hari ini',
    'en': 'stop working for now',
  }, 3),
  EVocab('burn the midnight oil', 'bern dhe mid-nait oil', {
    'id': 'bekerja atau belajar sampai larut malam',
    'en': 'work late into the night',
  }, 3),
  EVocab('go the extra mile', 'gou dhi eks-tra mail', {
    'id': 'berusaha melebihi yang diminta',
    'en': 'do more than expected',
  }, 3),
  EVocab('hit the books', 'hit dhe buks', {
    'id': 'belajar dengan serius',
    'en': 'study hard',
  }, 3),
  EVocab('learn the ropes', 'lern dhe roups', {
    'id': 'mempelajari seluk-beluk pekerjaan',
    'en': 'learn how a job is done',
  }, 3),
  EVocab('pull your weight', 'pul yor weit', {
    'id': 'ikut bekerja sesuai porsinya',
    'en': 'do your fair share of work',
  }, 3),
  EVocab('cut corners', 'kat kor-nerz', {
    'id': 'mengambil jalan pintas dengan mengorbankan mutu',
    'en': 'do something cheaply or carelessly',
  }, 3),
  EVocab('back to the drawing board', 'bek tu dhe dro-ing bord', {
    'id': 'merancang ulang setelah rencana gagal',
    'en': 'start planning again after a failure',
  }, 3),
  EVocab('start from scratch', 'start from skrec', {
    'id': 'memulai dari nol',
    'en': 'begin from nothing',
  }, 3),
  EVocab('think outside the box', 'think aut-said dhe boks', {
    'id': 'berpikir kreatif di luar kebiasaan',
    'en': 'think creatively',
  }, 3),
  EVocab('get the ball rolling', 'get dhe bol rou-ling', {
    'id': 'memulai suatu kegiatan',
    'en': 'start something going',
  }, 3),
  EVocab('on the ball', 'on dhe bol', {
    'id': 'sigap dan cekatan',
    'en': 'alert and quick to act',
  }, 3),
  EVocab('wear many hats', 'weer me-ni hets', {
    'id': 'merangkap banyak peran',
    'en': 'have many different roles',
  }, 3),
  EVocab('on cloud nine', 'on klaud nain', {
    'id': 'sangat bahagia',
    'en': 'extremely happy',
  }, 4),
  EVocab('over the moon', 'ou-ver dhe mun', {
    'id': 'gembira luar biasa atas suatu kabar',
    'en': 'delighted about some news',
  }, 4),
  EVocab('down in the dumps', 'daun in dhe damps', {
    'id': 'sedang murung',
    'en': 'feeling sad and low',
  }, 4),
  EVocab('get cold feet', 'get kould fit', {
    'id': 'tiba-tiba ragu menjelang hari H',
    'en': 'become nervous and hesitate before an event',
  }, 4),
  EVocab('butterflies in your stomach', 'ba-ter-flaiz in yor sta-mek', {
    'id': 'deg-degan karena gugup',
    'en': 'a nervous feeling inside',
  }, 4),
  EVocab('on edge', 'on ej', {
    'id': 'gelisah dan tegang',
    'en': 'tense and nervous',
  }, 4),
  EVocab('fly off the handle', 'flai of dhe hen-del', {
    'id': 'tiba-tiba marah meledak',
    'en': 'suddenly lose your temper',
  }, 4),
  EVocab('see red', 'si red', {
    'id': 'naik pitam',
    'en': 'become very angry',
  }, 4),
  EVocab('blow off steam', 'blou of stim', {
    'id': 'melampiaskan emosi atau stres',
    'en': 'release pent-up stress',
  }, 4),
  EVocab('get on someone\'s nerves', 'get on sam-wanz nervz', {
    'id': 'membuat kesal',
    'en': 'annoy someone',
  }, 4),
  EVocab('at the end of your rope', 'et dhi end ov yor roup', {
    'id': 'sudah habis kesabaran',
    'en': 'out of patience',
  }, 4),
  EVocab('a weight off your shoulders', 'e weit of yor syoul-derz', {
    'id': 'rasa lega setelah beban hilang',
    'en': 'relief from a worry',
  }, 4),
  EVocab('keep your chin up', 'kip yor cin ap', {
    'id': 'tetap tabah, jangan putus asa',
    'en': 'stay positive in hard times',
  }, 4),
  EVocab('under the weather', 'an-der dhe we-dher', {
    'id': 'kurang enak badan',
    'en': 'slightly ill',
  }, 5),
  EVocab('hit the sack', 'hit dhe sek', {
    'id': 'pergi tidur',
    'en': 'go to bed',
  }, 5),
  EVocab('sleep like a log', 'slip laik e log', {
    'id': 'tidur sangat nyenyak',
    'en': 'sleep very deeply',
  }, 5),
  EVocab('get some shut-eye', 'get sam syat-ai', {
    'id': 'tidur sebentar',
    'en': 'get some sleep',
  }, 5),
  EVocab('fit as a fiddle', 'fit ez e fi-del', {
    'id': 'sangat sehat dan bugar',
    'en': 'in excellent health',
  }, 5),
  EVocab('on the mend', 'on dhe mend', {
    'id': 'mulai membaik',
    'en': 'getting better after illness',
  }, 5),
  EVocab('back on your feet', 'bek on yor fit', {
    'id': 'sudah pulih kembali',
    'en': 'fully recovered',
  }, 5),
  EVocab('sick as a dog', 'sik ez e dog', {
    'id': 'sakit parah sampai mual',
    'en': 'very ill',
  }, 5),
  EVocab('dead on your feet', 'ded on yor fit', {
    'id': 'capek setengah mati',
    'en': 'extremely tired',
  }, 5),
  EVocab('eat like a horse', 'it laik e hors', {
    'id': 'makan sangat banyak',
    'en': 'eat a lot',
  }, 5),
  EVocab('a clean bill of health', 'e klin bil ov helth', {
    'id': 'dinyatakan sehat',
    'en': 'official confirmation of good health',
  }, 5),
  EVocab('break the ice', 'breik dhi ais', {
    'id': 'mencairkan suasana kaku',
    'en': 'ease the first awkwardness',
  }, 6),
  EVocab('on the same page', 'on dhe seim peij', {
    'id': 'sepemahaman soal rencana',
    'en': 'in agreement about a plan',
  }, 6),
  EVocab('see eye to eye', 'si ai tu ai', {
    'id': 'punya pendapat yang sama',
    'en': 'agree completely',
  }, 6),
  EVocab('hit it off', 'hit it of', {
    'id': 'langsung akrab',
    'en': 'quickly become friends',
  }, 6),
  EVocab('get off on the wrong foot', 'get of on dhe rong fut', {
    'id': 'awal perkenalan yang kurang baik',
    'en': 'start badly with someone',
  }, 6),
  EVocab('in the loop', 'in dhe lup', {
    'id': 'terus diberi kabar terbaru',
    'en': 'kept informed',
  }, 6),
  EVocab('cut to the chase', 'kat tu dhe ceis', {
    'id': 'langsung ke pokok persoalan',
    'en': 'get to the main point',
  }, 6),
  EVocab('beat around the bush', 'bit e-raund dhe busy', {
    'id': 'berbelit-belit, tidak langsung ke inti',
    'en': 'avoid saying something directly',
  }, 6),
  EVocab('bite your tongue', 'bait yor tang', {
    'id': 'menahan diri untuk tidak bicara',
    'en': 'stop yourself from speaking',
  }, 6),
  EVocab('walk on eggshells', 'wok on eg-syelz', {
    'id': 'sangat berhati-hati agar tak menyinggung',
    'en': 'be very careful not to upset someone',
  }, 6),
  EVocab('give someone the cold shoulder', 'giv sam-wan dhe kould syoul-der', {
    'id': 'sengaja mengacuhkan seseorang',
    'en': 'deliberately ignore someone',
  }, 6),
  EVocab('bury the hatchet', 'be-ri dhe he-cet', {
    'id': 'berdamai setelah bertengkar',
    'en': 'make peace after a quarrel',
  }, 6),
  EVocab('tie the knot', 'tai dhe not', {
    'id': 'menikah',
    'en': 'get married',
  }, 6),
  EVocab('pop the question', 'pop dhe kwes-cen', {
    'id': 'melamar kekasih',
    'en': 'propose marriage',
  }, 6),
  EVocab('the last straw', 'dhe last stro', {
    'id': 'pemicu terakhir yang membuat habis sabar',
    'en': 'the final problem that makes you give up',
  }, 7),
  EVocab('in hot water', 'in hot wo-ter', {
    'id': 'sedang dalam masalah',
    'en': 'in trouble',
  }, 7),
  EVocab('get out of hand', 'get aut ov hend', {
    'id': 'jadi tak terkendali',
    'en': 'become uncontrollable',
  }, 7),
  EVocab('open a can of worms', 'ou-pen e ken ov wermz', {
    'id': 'memicu masalah rumit baru',
    'en': 'create complicated new problems',
  }, 7),
  EVocab('the elephant in the room', 'dhi e-le-fent in dhe rum', {
    'id': 'masalah besar yang sengaja tak dibahas',
    'en': 'an obvious problem nobody mentions',
  }, 7),
  EVocab(
    'make a mountain out of a molehill',
    'meik e maun-ten aut ov e moul-hil',
    {
      'id': 'membesar-besarkan masalah kecil',
      'en': 'exaggerate a small problem',
    },
    7,
  ),
  EVocab('between a rock and a hard place', 'bi-twin e rok end e hard pleis', {
    'id': 'serba salah',
    'en': 'facing two bad choices',
  }, 7),
  EVocab('bite the bullet', 'bait dhe bu-let', {
    'id': 'memberanikan diri menghadapi hal tak enak',
    'en': 'face something unpleasant bravely',
  }, 7),
  EVocab('face the music', 'feis dhe myu-zik', {
    'id': 'menanggung akibat perbuatan',
    'en': 'accept the consequences',
  }, 7),
  EVocab('jump the gun', 'jamp dhe gan', {
    'id': 'bertindak terlalu cepat',
    'en': 'act too soon',
  }, 7),
  EVocab('sit on the fence', 'sit on dhe fens', {
    'id': 'tidak mau memihak',
    'en': 'avoid taking sides',
  }, 7),
  EVocab('the ball is in your court', 'dhe bol iz in yor kort', {
    'id': 'sekarang giliranmu mengambil keputusan',
    'en': 'it is your turn to decide',
  }, 7),
  EVocab('a no-brainer', 'e nou-brei-ner', {
    'id': 'pilihan yang sangat jelas',
    'en': 'an obvious decision',
  }, 7),
  EVocab('play it by ear', 'plei it bai ir', {
    'id': 'lihat situasi saja nanti',
    'en': 'decide as things happen',
  }, 7),
  EVocab('hit the jackpot', 'hit dhe jek-pot', {
    'id': 'dapat rezeki atau untung besar',
    'en': 'have a big stroke of luck',
  }, 8),
  EVocab('pass with flying colors', 'pas widh flai-ing ka-lerz', {
    'id': 'lulus dengan gemilang',
    'en': 'succeed brilliantly in a test',
  }, 8),
  EVocab('make the cut', 'meik dhe kat', {
    'id': 'lolos seleksi',
    'en': 'be good enough to be chosen',
  }, 8),
  EVocab('beat the odds', 'bit dhi odz', {
    'id': 'berhasil meski peluangnya kecil',
    'en': 'succeed despite low chances',
  }, 8),
  EVocab('by the skin of your teeth', 'bai dhe skin ov yor tith', {
    'id': 'berhasil dengan susah payah, nyaris gagal',
    'en': 'only just succeed',
  }, 8),
  EVocab('a close call', 'e klous kol', {
    'id': 'nyaris celaka',
    'en': 'a narrow escape from danger',
  }, 8),
  EVocab('ahead of the game', 'e-hed ov dhe geim', {
    'id': 'selangkah lebih maju',
    'en': 'in a better position than others',
  }, 8),
  EVocab('the sky\'s the limit', 'dhe skaiz dhe li-mit', {
    'id': 'peluangnya tak terbatas',
    'en': 'there is no limit to success',
  }, 8),
  EVocab('a blessing in disguise', 'e bles-sing in dis-gaiz', {
    'id': 'hikmah di balik musibah',
    'en': 'a bad thing that turns out good',
  }, 8),
  EVocab('steal the show', 'stil dhe syou', {
    'id': 'jadi bintang yang paling menonjol',
    'en': 'attract the most attention',
  }, 8),
  EVocab('miss the mark', 'mis dhe mark', {
    'id': 'meleset dari sasaran',
    'en': 'fail to achieve the aim',
  }, 8),
  EVocab('go down in flames', 'gou daun in fleimz', {
    'id': 'gagal total secara memalukan',
    'en': 'fail spectacularly',
  }, 8),
  EVocab('throw in the towel', 'throu in dhe ta-wel', {
    'id': 'menyerah kalah',
    'en': 'admit defeat',
  }, 8),
  EVocab('spill the beans', 'spil dhe binz', {
    'id': 'membocorkan rahasia',
    'en': 'reveal a secret',
  }, 9),
  EVocab('let the cat out of the bag', 'let dhe ket aut ov dhe beg', {
    'id': 'keceplosan membuka rahasia',
    'en': 'accidentally reveal a secret',
  }, 9),
  EVocab('under wraps', 'an-der reps', {
    'id': 'dirahasiakan',
    'en': 'kept secret',
  }, 9),
  EVocab('an open secret', 'en ou-pen si-kret', {
    'id': 'rahasia umum',
    'en': 'a secret that everyone knows',
  }, 9),
  EVocab('hear it through the grapevine', 'hir it thru dhe greip-vain', {
    'id': 'dengar kabar dari mulut ke mulut',
    'en': 'learn something through rumour',
  }, 9),
  EVocab('straight from the horse\'s mouth', 'streit from dhe hor-siz mauth', {
    'id': 'langsung dari sumbernya',
    'en': 'directly from the source',
  }, 9),
  EVocab('talk behind someone\'s back', 'tok bi-haind sam-wanz bek', {
    'id': 'menggunjingkan orang diam-diam',
    'en': 'gossip about someone secretly',
  }, 9),
  EVocab('come clean', 'kam klin', {
    'id': 'mengaku terus terang',
    'en': 'confess the truth',
  }, 9),
  EVocab('put your cards on the table', 'put yor kardz on dhe tei-bel', {
    'id': 'berterus terang soal niat',
    'en': 'be honest about your intentions',
  }, 9),
  EVocab('pull someone\'s leg', 'pul sam-wanz leg', {
    'id': 'bercanda mengerjai seseorang',
    'en': 'tease someone jokingly',
  }, 9),
  EVocab(
    'take something with a grain of salt',
    'teik sam-thing widh e grein ov solt',
    {'id': 'tidak langsung percaya', 'en': 'be skeptical about something'},
    9,
  ),
  EVocab('smell a rat', 'smel e ret', {
    'id': 'curiga ada yang tidak beres',
    'en': 'suspect something is wrong',
  }, 9),
  EVocab('caught red-handed', 'kot red-hen-did', {
    'id': 'tertangkap basah',
    'en': 'caught in the act',
  }, 9),
  EVocab('sweep something under the rug', 'swip sam-thing an-der dhe rag', {
    'id': 'menutup-nutupi masalah',
    'en': 'hide a problem',
  }, 9),
  EVocab('couch potato', 'kauc pe-tei-tou', {
    'id': 'orang malas yang kerjanya rebahan nonton TV',
    'en': 'a lazy person who watches lots of TV',
  }, 10),
  EVocab('early bird', 'er-li berd', {
    'id': 'orang yang suka bangun atau datang pagi',
    'en': 'a person who gets up or arrives early',
  }, 10),
  EVocab('night owl', 'nait aul', {
    'id': 'orang yang suka begadang',
    'en': 'a person who stays up late',
  }, 10),
  EVocab('down to earth', 'daun tu erth', {
    'id': 'membumi, tidak sombong',
    'en': 'practical and humble',
  }, 10),
  EVocab('the black sheep', 'dhe blek syip', {
    'id': 'anggota keluarga yang dianggap memalukan',
    'en': 'the family member seen as a disgrace',
  }, 10),
  EVocab('a fish out of water', 'e fisy aut ov wo-ter', {
    'id': 'merasa canggung di lingkungan asing',
    'en': 'someone uncomfortable in a new setting',
  }, 10),
  EVocab('a pain in the neck', 'e pein in dhe nek', {
    'id': 'orang atau hal yang menjengkelkan',
    'en': 'an annoying person or thing',
  }, 10),
  EVocab('call the shots', 'kol dhe syots', {
    'id': 'memegang kendali',
    'en': 'be in charge',
  }, 10),
  EVocab('go with the flow', 'gou widh dhe flou', {
    'id': 'ikut arus saja',
    'en': 'accept things as they come',
  }, 10),
  EVocab('jump on the bandwagon', 'jamp on dhe bend-we-gen', {
    'id': 'ikut-ikutan tren',
    'en': 'join a popular trend',
  }, 10),
  EVocab('rain on someone\'s parade', 'rein on sam-wanz pe-reid', {
    'id': 'merusak kesenangan orang',
    'en': 'spoil someone\'s happy moment',
  }, 10),
  EVocab('cry over spilt milk', 'krai ou-ver spilt milk', {
    'id': 'menyesali hal yang sudah terjadi',
    'en': 'regret what can\'t be changed',
  }, 10),
  EVocab('hit the nail on the head', 'hit dhe neil on dhe hed', {
    'id': 'tepat sekali, kena sasaran',
    'en': 'describe something exactly right',
  }, 11),
  EVocab('kill two birds with one stone', 'kil tu berdz widh wan stoun', {
    'id': 'menyelesaikan dua urusan sekaligus',
    'en': 'achieve two things with one action',
  }, 11),
  EVocab('the best of both worlds', 'dhe best ov bouth werldz', {
    'id': 'mendapat keuntungan dari dua hal sekaligus',
    'en': 'the advantages of two things at once',
  }, 11),
  EVocab('in a nutshell', 'in e nat-syel', {
    'id': 'singkatnya',
    'en': 'in brief',
  }, 11),
  EVocab('out of the blue', 'aut ov dhe blu', {
    'id': 'tiba-tiba tanpa diduga',
    'en': 'unexpectedly',
  }, 11),
  EVocab('the tip of the iceberg', 'dhe tip ov dhi ais-berg', {
    'id': 'baru sebagian kecil dari masalah',
    'en': 'a small visible part of a bigger problem',
  }, 11),
  EVocab('a drop in the bucket', 'e drop in dhe ba-ket', {
    'id': 'jumlah yang terlalu kecil untuk berarti',
    'en': 'an amount too small to matter',
  }, 11),
  EVocab('the icing on the cake', 'dhi ai-sing on dhe keik', {
    'id': 'pelengkap yang membuat makin sempurna',
    'en': 'an extra good thing on top',
  }, 11),
  EVocab('on thin ice', 'on thin ais', {
    'id': 'dalam posisi berisiko',
    'en': 'in a risky situation',
  }, 11),
  EVocab('when pigs fly', 'wen pigz flai', {
    'id': 'mustahil terjadi',
    'en': 'something that will never happen',
  }, 11),
  EVocab('rain cats and dogs', 'rein kets end dogz', {
    'id': 'hujan sangat deras',
    'en': 'rain very heavily',
  }, 11),
  EVocab('break a leg', 'breik e leg', {
    'id': 'semoga sukses (sebelum tampil)',
    'en': 'good luck before a performance',
  }, 11),
];
