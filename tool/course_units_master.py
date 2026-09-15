# -*- coding: utf-8 -*-
"""Data induk unit 5-16 kursus jalur Belajar (assets/content/*.json).

Semua kursus non-Jepang (en, id, de, ko) memakai tema & kata yang sama,
dikunci ke kata Inggris di sini. Terjemahan Jerman/Korea ada di
course_units_de.py / course_units_ko.py; kursus Indonesia diturunkan
langsung dari kolom `id` di bawah. Dipakai oleh gen_course_units.py.

Format:
  UNITS = [ (uid, icon, color, title_id, title_en, [lesson, ...]), ... ]
  lesson = (title_id, title_en, [word x6], [sentence x2])
  word   = (en, id, en_gloss, emoji, en_pron[, 'v'])   'v' = kata kerja
  sentence = (en, id, en_gloss, en_pron)

Aturan (dicek gen_course_units.py):
- kata Inggris & Indonesia unik di seluruh kursus;
- tidak ada token yang sama (abaikan huruf besar) dalam satu kalimat.
"""

W = lambda *a: a
S = lambda *a: a

UNITS = [
 ('u5', '🔢', '#FF4B4B', 'Angka Lanjutan', 'More Numbers', [
  ('Angka 6-9 & Ratusan', 'Numbers 6-9 & Hundreds', [
    W('six', 'enam', 'the number 6', '6️⃣', 'siks'),
    W('seven', 'tujuh', 'the number 7', '7️⃣', 'se-ven'),
    W('eight', 'delapan', 'the number 8', '8️⃣', 'eit'),
    W('nine', 'sembilan', 'the number 9', '9️⃣', 'nain'),
    W('hundred', 'seratus', 'the number 100', '💯', 'han-dred'),
    W('zero', 'nol', 'the number 0', '0️⃣', 'zi-rou'),
  ], [
    S('I have six apples', 'Saya punya enam apel', 'say how many apples you own', 'ai hev siks e-pels'),
    S('Nine plus one is ten', 'Sembilan tambah satu sama dengan sepuluh', 'a simple sum', 'nain plas wan is ten'),
  ]),
  ('Puluhan & Ribuan', 'Tens & Thousands', [
    W('twenty', 'dua puluh', 'the number 20', '🔟', 'twen-ti'),
    W('thirty', 'tiga puluh', 'the number 30', '🧮', 'ter-ti'),
    W('fifty', 'lima puluh', 'the number 50', '🎯', 'fif-ti'),
    W('thousand', 'seribu', 'the number 1000', '💵', 'tau-zend'),
    W('million', 'sejuta', 'the number 1,000,000', '💰', 'mil-yen'),
    W('number', 'angka', 'a figure like 1, 2, 3', '🔢', 'nam-ber'),
  ], [
    S('Twenty people live here', 'Dua puluh orang tinggal di sini', 'tell how many live in a place', 'twen-ti pi-pel liv hir'),
    S('The number is fifty', 'Angkanya lima puluh', 'state a figure', 'de nam-ber is fif-ti'),
  ]),
  ('Umur & Urutan', 'Age & Order', [
    W('age', 'umur', 'how old someone is', '🎂', 'eij'),
    W('year', 'tahun', 'twelve months', '📆', 'yir'),
    W('first', 'pertama', 'number one in order', '🥇', 'ferst'),
    W('second', 'kedua', 'number two in order', '🥈', 'se-kend'),
    W('last', 'terakhir', 'at the end of the order', '🏁', 'last'),
    W('old', 'tua', 'having lived many years', '👴', 'old'),
  ], [
    S('I am twenty years old', 'Umur saya dua puluh tahun', 'tell your age', 'ai em twen-ti yirs old'),
    S('She is the first student', 'Dia murid pertama', 'say who comes first', 'syi is de ferst styu-dent'),
  ]),
 ]),

 ('u6', '🎨', '#2B70C9', 'Warna', 'Colors', [
  ('Warna Dasar', 'Basic Colors', [
    W('red', 'merah', 'the color of blood', '🔴', 'red'),
    W('blue', 'biru', 'the color of the sky', '🔵', 'blu'),
    W('yellow', 'kuning', 'the color of the sun', '🟡', 'ye-lou'),
    W('green', 'hijau', 'the color of leaves', '🟢', 'grin'),
    W('black', 'hitam', 'the darkest color', '⚫', 'blek'),
    W('white', 'putih', 'the color of snow', '⚪', 'wait'),
  ], [
    S('The sky is blue', 'Langit itu biru', 'describe the color of the sky', 'de skai is blu'),
    S('My car is red and white', 'Mobil saya merah dan putih', 'describe two colors of a car', 'mai kar is red end wait'),
  ]),
  ('Warna Lain', 'More Colors', [
    W('orange', 'oranye', 'the color of the fruit orange', '🟠', 'o-renj'),
    W('purple', 'ungu', 'a mix of red and blue', '🟣', 'per-pel'),
    W('pink', 'merah muda', 'a light red color', '🌸', 'pingk'),
    W('brown', 'cokelat', 'the color of wood', '🟤', 'braun'),
    W('gray', 'abu-abu', 'a mix of black and white', '🩶', 'grei'),
    W('color', 'warna', 'red, blue, green, etc.', '🎨', 'ka-ler'),
  ], [
    S('The cat is brown', 'Kucing itu cokelat', 'describe the color of a cat', 'de ket is braun'),
    S('What color do you like', 'Warna apa yang kamu suka', 'ask about a favorite color', 'wat ka-ler du yu laik'),
  ]),
  ('Terang & Suka', 'Bright & Favorite', [
    W('bright', 'terang', 'full of light', '💡', 'brait'),
    W('dark', 'gelap', 'with little light', '🌑', 'dark'),
    W('favorite', 'favorit', 'liked the most', '⭐', 'fei-vo-rit'),
    W('like', 'suka', 'to enjoy something', '👍', 'laik', 'v'),
    W('beautiful', 'indah', 'very pleasing to see', '🌺', 'byu-ti-ful'),
    W('ugly', 'jelek', 'not nice to look at', '🙈', 'ag-li'),
  ], [
    S('Green is my favorite color', 'Hijau warna favorit saya', 'name the color you like most', 'grin is mai fei-vo-rit ka-ler'),
    S('The room is dark', 'Kamarnya gelap', 'say a room has little light', 'de rum is dark'),
  ]),
 ]),

 ('u7', '🐾', '#FFC800', 'Hewan', 'Animals', [
  ('Hewan Peliharaan', 'Pets', [
    W('cat', 'kucing', 'a small pet that says meow', '🐱', 'ket'),
    W('dog', 'anjing', 'a pet that barks', '🐶', 'dog'),
    W('bird', 'burung', 'an animal with wings', '🐦', 'berd'),
    W('rabbit', 'kelinci', 'a long-eared animal', '🐰', 're-bit'),
    W('hamster', 'hamster', 'a small furry pet', '🐹', 'hem-ster'),
    W('pet', 'hewan peliharaan', 'an animal kept at home', '🏠', 'pet'),
  ], [
    S('I have a small dog', 'Saya punya anjing kecil', 'talk about your pet', 'ai hev e smol dog'),
    S('The cat sleeps on a chair', 'Kucing itu tidur di kursi', 'say where the cat sleeps', 'de ket slips on e cer'),
  ]),
  ('Hewan Besar', 'Big Animals', [
    W('elephant', 'gajah', 'a huge animal with a trunk', '🐘', 'e-le-fant'),
    W('lion', 'singa', 'the king of the jungle', '🦁', 'lai-en'),
    W('tiger', 'harimau', 'a big striped cat', '🐯', 'tai-ger'),
    W('horse', 'kuda', 'an animal people ride', '🐴', 'hors'),
    W('cow', 'sapi', 'a farm animal that gives milk', '🐮', 'kau'),
    W('monkey', 'monyet', 'an animal that climbs trees', '🐵', 'mang-ki'),
  ], [
    S('The elephant is very big', 'Gajah itu sangat besar', 'describe an elephant', 'de e-le-fant is ve-ri big'),
    S('Lions eat meat', 'Singa makan daging', 'say what lions eat', 'lai-ens it mit'),
  ]),
  ('Hewan Air & Serangga', 'Water Animals & Insects', [
    W('frog', 'katak', 'a green jumping animal', '🐸', 'frog'),
    W('turtle', 'kura-kura', 'a slow animal with a shell', '🐢', 'ter-tel'),
    W('shark', 'hiu', 'a big fish with sharp teeth', '🦈', 'syark'),
    W('butterfly', 'kupu-kupu', 'an insect with colorful wings', '🦋', 'ba-ter-flai'),
    W('ant', 'semut', 'a tiny insect that works hard', '🐜', 'ent'),
    W('mosquito', 'nyamuk', 'a small insect that bites', '🦟', 'mos-ki-tou'),
  ], [
    S('The butterfly is beautiful', 'Kupu-kupu itu indah', 'admire a butterfly', 'de ba-ter-flai is byu-ti-ful'),
    S('There are many ants here', 'Ada banyak semut di sini', 'say there are lots of ants', 'der ar me-ni ents hir'),
  ]),
 ]),

 ('u8', '📅', '#A560E8', 'Hari & Pekan', 'Days & Weeks', [
  ('Hari Senin-Jumat', 'Monday to Friday', [
    W('Monday', 'Senin', 'the first weekday', '1️⃣', 'man-dei'),
    W('Tuesday', 'Selasa', 'the second weekday', '2️⃣', 'tyus-dei'),
    W('Wednesday', 'Rabu', 'the middle of the week', '3️⃣', 'wens-dei'),
    W('Thursday', 'Kamis', 'the day before Friday', '4️⃣', 'ters-dei'),
    W('Friday', 'Jumat', 'the last weekday', '5️⃣', 'frai-dei'),
    W('day', 'hari', '24 hours', '☀️', 'dei'),
  ], [
    S('Today is Monday', 'Hari ini Senin', 'say what day it is', 'tu-dei is man-dei'),
    S('I work from Monday to Friday', 'Saya bekerja dari Senin sampai Jumat', 'tell your working days', 'ai werk from man-dei tu frai-dei'),
  ]),
  ('Akhir Pekan', 'Weekend', [
    W('Saturday', 'Sabtu', 'the first weekend day', '🎉', 'se-ter-dei'),
    W('Sunday', 'Minggu', 'the last day of the week', '⛪', 'san-dei'),
    W('weekend', 'akhir pekan', 'Saturday and Sunday', '🏖️', 'wik-end'),
    W('week', 'pekan', 'seven days', '🗓️', 'wik'),
    W('month', 'bulan', 'about thirty days', '🌙', 'mants'),
    W('holiday', 'hari libur', 'a day off from work', '🎈', 'ho-li-dei'),
  ], [
    S('On Sunday we rest', 'Hari Minggu kita istirahat', 'say what you do on Sunday', 'on san-dei wi rest'),
    S('The weekend is fun', 'Akhir pekan itu menyenangkan', 'say weekends are enjoyable', 'de wik-end is fan'),
  ]),
  ('Rutinitas', 'Routine', [
    W('always', 'selalu', 'every single time', '♾️', 'ol-weis'),
    W('usually', 'biasanya', 'most of the time', '🔁', 'yu-zyu-e-li'),
    W('sometimes', 'kadang-kadang', 'now and then', '🎲', 'sam-taims'),
    W('never', 'tidak pernah', 'not at any time', '🚫', 'ne-ver'),
    W('every day', 'setiap hari', 'on all days', '📆', 'ev-ri dei'),
    W('often', 'sering', 'many times', '🔄', 'o-fen'),
  ], [
    S('I usually drink coffee', 'Saya biasanya minum kopi', 'describe a habit', 'ai yu-zyu-e-li dringk ko-fi'),
    S('She never eats meat', 'Dia tidak pernah makan daging', 'say someone avoids meat', 'syi ne-ver its mit'),
  ]),
 ]),

 ('u9', '⛅', '#58CC02', 'Cuaca & Musim', 'Weather & Seasons', [
  ('Cuaca', 'Weather', [
    W('weather', 'cuaca', 'sun, rain, wind, etc.', '🌤️', 'we-der'),
    W('sunny', 'cerah', 'with lots of sun', '☀️', 'sa-ni'),
    W('cloudy', 'berawan', 'with many clouds', '☁️', 'klau-di'),
    W('windy', 'berangin', 'with strong wind', '🌬️', 'win-di'),
    W('rain', 'hujan', 'water falling from clouds', '🌧️', 'rein'),
    W('snow', 'salju', 'white frozen flakes', '❄️', 'snou'),
  ], [
    S('The weather is sunny today', 'Cuacanya cerah hari ini', 'describe today\'s weather', 'de we-der is sa-ni tu-dei'),
    S('It is raining now', 'Sekarang sedang hujan', 'say rain is falling', 'it is rei-ning nau'),
  ]),
  ('Musim', 'Seasons', [
    W('season', 'musim', 'a part of the year', '🍂', 'si-zen'),
    W('spring', 'musim semi', 'the season of flowers', '🌸', 'spring'),
    W('summer', 'musim panas', 'the hot season', '🏝️', 'sa-mer'),
    W('autumn', 'musim gugur', 'the season of falling leaves', '🍁', 'o-tem'),
    W('winter', 'musim dingin', 'the cold season', '⛄', 'win-ter'),
    W('dry season', 'musim kemarau', 'the season with little rain', '🌵', 'drai si-zen'),
  ], [
    S('I like spring', 'Saya suka musim semi', 'name your favorite season', 'ai laik spring'),
    S('It snows in winter', 'Salju turun di musim dingin', 'say when it snows', 'it snous in win-ter'),
  ]),
  ('Suhu', 'Temperature', [
    W('hot', 'panas', 'very warm', '🔥', 'hot'),
    W('cold', 'dingin', 'low temperature', '🧊', 'kold'),
    W('warm', 'hangat', 'nicely a bit hot', '☕', 'worm'),
    W('cool', 'sejuk', 'nicely a bit cold', '🍃', 'kul'),
    W('temperature', 'suhu', 'how hot or cold it is', '🌡️', 'tem-pre-cer'),
    W('umbrella', 'payung', 'protects you from rain', '☂️', 'am-bre-la'),
  ], [
    S('It is cold outside', 'Di luar dingin', 'describe the outdoor temperature', 'it is kold aut-said'),
    S('Bring an umbrella', 'Bawa payung', 'remind someone about rain', 'bring en am-bre-la'),
  ]),
 ]),

 ('u10', '💪', '#1CB0F6', 'Tubuh & Kesehatan', 'Body & Health', [
  ('Wajah & Kepala', 'Face & Head', [
    W('head', 'kepala', 'the top part of the body', '🗣️', 'hed'),
    W('eye', 'mata', 'you see with it', '👁️', 'ai'),
    W('ear', 'telinga', 'you hear with it', '👂', 'ir'),
    W('nose', 'hidung', 'you smell with it', '👃', 'nous'),
    W('mouth', 'mulut', 'you eat and talk with it', '👄', 'maut'),
    W('hair', 'rambut', 'it grows on your head', '💇', 'her'),
  ], [
    S('My eyes are brown', 'Mata saya cokelat', 'describe your eye color', 'mai ais ar braun'),
    S('Her hair is long', 'Rambutnya panjang', 'describe someone\'s hair', 'her her is long'),
  ]),
  ('Anggota Tubuh', 'Body Parts', [
    W('hand', 'tangan', 'you hold things with it', '✋', 'hend'),
    W('finger', 'jari', 'one of five on a hand', '☝️', 'fing-ger'),
    W('foot', 'kaki', 'you stand on it', '🦶', 'fut'),
    W('arm', 'lengan', 'from shoulder to hand', '💪', 'arm'),
    W('stomach', 'perut', 'where food goes', '🫃', 'sta-mek'),
    W('back', 'punggung', 'the rear of the body', '🧍', 'bek'),
  ], [
    S('Wash your hands', 'Cuci tanganmu', 'tell someone to clean their hands', 'wosy yor hends'),
    S('My back hurts', 'Punggung saya sakit', 'complain about pain', 'mai bek herts'),
  ]),
  ('Kesehatan', 'Health', [
    W('sick', 'sakit', 'not healthy', '🤒', 'sik'),
    W('healthy', 'sehat', 'in good condition', '💚', 'hel-ti'),
    W('doctor', 'dokter', 'a person who treats the sick', '👨‍⚕️', 'dok-ter'),
    W('medicine', 'obat', 'you take it to get better', '💊', 'me-di-sin'),
    W('hospital', 'rumah sakit', 'a place for sick people', '🏥', 'hos-pi-tel'),
    W('pain', 'nyeri', 'a hurting feeling', '😣', 'pein'),
  ], [
    S('I am sick today', 'Saya sakit hari ini', 'say you are unwell', 'ai em sik tu-dei'),
    S('The doctor gives medicine', 'Dokter memberi obat', 'describe what a doctor does', 'de dok-ter givs me-di-sin'),
  ]),
 ]),

 ('u11', '👕', '#CE82FF', 'Pakaian', 'Clothing', [
  ('Pakaian Sehari-hari', 'Everyday Clothes', [
    W('shirt', 'kemeja', 'worn on the upper body', '👔', 'syert'),
    W('pants', 'celana', 'worn on the legs', '👖', 'pents'),
    W('dress', 'gaun', 'a one-piece garment', '👗', 'dres'),
    W('skirt', 'rok', 'hangs from the waist', '🩳', 'skert'),
    W('jacket', 'jaket', 'keeps you warm outside', '🧥', 'je-ket'),
    W('clothes', 'pakaian', 'things you wear', '👚', 'klods'),
  ], [
    S('I wear a blue shirt', 'Saya memakai kemeja biru', 'describe what you wear', 'ai wer e blu syert'),
    S('The dress is beautiful', 'Gaun itu indah', 'compliment a dress', 'de dres is byu-ti-ful'),
  ]),
  ('Aksesori', 'Accessories', [
    W('hat', 'topi', 'worn on the head', '🧢', 'het'),
    W('shoes', 'sepatu', 'worn on the feet', '👟', 'syus'),
    W('socks', 'kaus kaki', 'worn inside shoes', '🧦', 'soks'),
    W('bag', 'tas', 'carries your things', '👜', 'beg'),
    W('watch', 'jam tangan', 'tells time on your wrist', '⌚', 'wocc'),
    W('glasses', 'kacamata', 'help you see clearly', '👓', 'gla-ses'),
  ], [
    S('Where are my shoes', 'Di mana sepatu saya', 'ask where your shoes are', 'wer ar mai syus'),
    S('She wears glasses', 'Dia memakai kacamata', 'say someone uses glasses', 'syi wers gla-ses'),
  ]),
  ('Memakai Pakaian', 'Wearing Clothes', [
    W('wear', 'memakai', 'to have clothes on', '🙆', 'wer', 'v'),
    W('take off', 'melepas', 'to remove clothes', '🙅', 'teik of', 'v'),
    W('size', 'ukuran', 'small, medium, or large', '📏', 'saiz'),
    W('new', 'baru', 'not old', '✨', 'nyu'),
    W('clean', 'bersih', 'not dirty', '🧼', 'klin'),
    W('dirty', 'kotor', 'not clean', '🧹', 'der-ti'),
  ], [
    S('This shirt is new', 'Kemeja ini baru', 'say a shirt was just bought', 'dis syert is nyu'),
    S('My socks are dirty', 'Kaus kaki saya kotor', 'say socks need washing', 'mai soks ar der-ti'),
  ]),
 ]),

 ('u12', '🏫', '#FF9600', 'Sekolah', 'School', [
  ('Alat Tulis', 'Stationery', [
    W('book', 'buku', 'pages you read', '📕', 'buk'),
    W('pen', 'pena', 'writes with ink', '🖊️', 'pen'),
    W('pencil', 'pensil', 'writes and can be erased', '✏️', 'pen-sil'),
    W('paper', 'kertas', 'you write on it', '📄', 'pei-per'),
    W('eraser', 'penghapus', 'removes pencil marks', '🩹', 'i-rei-ser'),
    W('notebook', 'buku catatan', 'a book for notes', '📓', 'not-buk'),
  ], [
    S('I need a pencil', 'Saya perlu pensil', 'ask for something to write with', 'ai nid e pen-sil'),
    S('My book is on the table', 'Buku saya di atas meja', 'say where the book is', 'mai buk is on de tei-bel'),
  ]),
  ('Di Kelas', 'In the Classroom', [
    W('school', 'sekolah', 'a place to learn', '🏫', 'skul'),
    W('class', 'kelas', 'a group lesson', '🧑‍🏫', 'klas'),
    W('classroom', 'ruang kelas', 'the room for lessons', '🪑', 'klas-rum'),
    W('homework', 'pekerjaan rumah', 'schoolwork done at home', '📝', 'hom-werk'),
    W('test', 'ujian', 'checks what you learned', '📋', 'test'),
    W('question', 'pertanyaan', 'something you ask', '❓', 'kwes-cen'),
  ], [
    S('I have homework today', 'Saya ada pekerjaan rumah hari ini', 'talk about your homework', 'ai hev hom-werk tu-dei'),
    S('The test is tomorrow', 'Ujiannya besok', 'say when the test is', 'de test is tu-mo-rou'),
  ]),
  ('Belajar', 'Studying', [
    W('learn', 'mempelajari', 'to gain knowledge', '🧠', 'lern', 'v'),
    W('understand', 'mengerti', 'to know the meaning', '💡', 'an-der-stend', 'v'),
    W('remember', 'mengingat', 'to keep in mind', '🔖', 'ri-mem-ber', 'v'),
    W('forget', 'melupakan', 'to lose from memory', '🌫️', 'for-get', 'v'),
    W('answer', 'menjawab', 'to reply to a question', '💬', 'en-ser', 'v'),
    W('ask', 'bertanya', 'to request information', '🙋', 'ask', 'v'),
  ], [
    S('I understand the question', 'Saya mengerti pertanyaannya', 'say the question is clear', 'ai an-der-stend de kwes-cen'),
    S('Please answer in English', 'Tolong jawab dalam bahasa Inggris', 'ask for an English reply', 'plis en-ser in ing-lisy'),
  ]),
 ]),

 ('u13', '💼', '#FF4B4B', 'Pekerjaan', 'Work & Jobs', [
  ('Profesi 1', 'Jobs 1', [
    W('job', 'pekerjaan', 'the work you do for money', '💼', 'job'),
    W('nurse', 'perawat', 'cares for patients', '👩‍⚕️', 'ners'),
    W('police officer', 'polisi', 'keeps people safe', '👮', 'po-lis o-fi-ser'),
    W('farmer', 'petani', 'grows crops', '👩‍🌾', 'far-mer'),
    W('cook', 'juru masak', 'prepares food', '👨‍🍳', 'kuk'),
    W('driver', 'sopir', 'drives a vehicle', '🚖', 'drai-ver'),
  ], [
    S('My father is a farmer', 'Ayah saya seorang petani', 'tell a parent\'s job', 'mai fa-der is e far-mer'),
    S('The nurse is kind', 'Perawat itu baik hati', 'describe a nurse', 'de ners is kaind'),
  ]),
  ('Profesi 2', 'Jobs 2', [
    W('engineer', 'insinyur', 'designs and builds things', '👷', 'en-ji-nir'),
    W('lawyer', 'pengacara', 'works with the law', '⚖️', 'lo-yer'),
    W('singer', 'penyanyi', 'performs songs', '🎤', 'sing-er'),
    W('artist', 'seniman', 'makes art', '🎨', 'ar-tist'),
    W('businessman', 'pengusaha', 'runs a business', '👔', 'bis-nes-men'),
    W('pilot', 'pilot', 'flies a plane', '👨‍✈️', 'pai-let'),
  ], [
    S('She wants to be a pilot', 'Dia ingin menjadi pilot', 'talk about a dream job', 'syi wonts tu bi e pai-let'),
    S('The singer is famous', 'Penyanyi itu terkenal', 'describe a well-known singer', 'de sing-er is fei-mes'),
  ]),
  ('Di Kantor', 'At the Office', [
    W('office', 'kantor', 'where office work happens', '🏢', 'o-fis'),
    W('meeting', 'rapat', 'people talking about work', '🤝', 'mi-ting'),
    W('computer', 'komputer', 'a machine for work and internet', '💻', 'kom-pyu-ter'),
    W('boss', 'bos', 'the person in charge', '🧑‍💼', 'bos'),
    W('salary', 'gaji', 'money paid for work', '💵', 'se-le-ri'),
    W('busy', 'sibuk', 'having a lot to do', '⏳', 'bi-zi'),
  ], [
    S('The meeting is at nine', 'Rapatnya jam sembilan', 'say when the meeting starts', 'de mi-ting is et nain'),
    S('I am busy at the office', 'Saya sibuk di kantor', 'say you have lots of work', 'ai em bi-zi et de o-fis'),
  ]),
 ]),

 ('u14', '🚗', '#2B70C9', 'Transportasi', 'Transportation', [
  ('Kendaraan', 'Vehicles', [
    W('car', 'mobil', 'a vehicle with four wheels', '🚗', 'kar'),
    W('bus', 'bus', 'a big vehicle for many people', '🚌', 'bas'),
    W('train', 'kereta', 'runs on rails', '🚆', 'trein'),
    W('bicycle', 'sepeda', 'two wheels, you pedal it', '🚲', 'bai-si-kel'),
    W('motorcycle', 'sepeda motor', 'two wheels with an engine', '🏍️', 'mo-tor-sai-kel'),
    W('airplane', 'pesawat', 'flies in the sky', '✈️', 'er-plein'),
  ], [
    S('I go to work by bus', 'Saya pergi bekerja naik bus', 'tell how you commute', 'ai gou tu werk bai bas'),
    S('The train is fast', 'Kereta itu cepat', 'describe a train', 'de trein is fast'),
  ]),
  ('Stasiun & Tiket', 'Station & Tickets', [
    W('station', 'stasiun', 'where trains stop', '🚉', 'stei-syen'),
    W('ticket', 'tiket', 'you need it to ride', '🎫', 'ti-ket'),
    W('airport', 'bandara', 'where planes take off', '🛫', 'er-port'),
    W('platform', 'peron', 'where you wait for the train', '🛤️', 'plet-form'),
    W('schedule', 'jadwal', 'the timetable', '🕐', 'ske-jul'),
    W('late', 'terlambat', 'after the expected time', '⏰', 'leit'),
  ], [
    S('Where is the station', 'Di mana stasiunnya', 'ask for the station', 'wer is de stei-syen'),
    S('The bus is late', 'Bus itu terlambat', 'say the bus is not on time', 'de bas is leit'),
  ]),
  ('Naik & Turun', 'Getting On & Off', [
    W('get on', 'naik', 'to board a vehicle', '🚏', 'get on', 'v'),
    W('get off', 'turun', 'to leave a vehicle', '🚶', 'get of', 'v'),
    W('drive', 'mengemudi', 'to control a car', '🚙', 'draiv', 'v'),
    W('ride', 'mengendarai', 'to travel on a bike or horse', '🚴', 'raid', 'v'),
    W('stop', 'berhenti', 'to no longer move', '🛑', 'stop', 'v'),
    W('turn', 'belok', 'to change direction', '↪️', 'tern', 'v'),
  ], [
    S('Get off at the next stop', 'Turun di halte berikutnya', 'give directions on a bus', 'get of et de nekst stop'),
    S('Turn left here', 'Belok kiri di sini', 'give a driving direction', 'tern left hir'),
  ]),
 ]),

 ('u15', '🏙️', '#FFC800', 'Kota & Tempat', 'City & Places', [
  ('Fasilitas Umum', 'Public Places', [
    W('city', 'kota', 'a big town', '🏙️', 'si-ti'),
    W('bank', 'bank', 'where money is kept', '🏦', 'bengk'),
    W('post office', 'kantor pos', 'where you send letters', '📮', 'post o-fis'),
    W('market', 'pasar', 'where people buy food', '🧺', 'mar-ket'),
    W('library', 'perpustakaan', 'a place full of books', '📚', 'lai-bre-ri'),
    W('park', 'taman', 'a green public space', '🌳', 'park'),
  ], [
    S('Our bank is near the market', 'Bank kami dekat pasar', 'say where the bank is', 'aur bengk is nir de mar-ket'),
    S('I read at the library', 'Saya membaca di perpustakaan', 'say where you read', 'ai rid et de lai-bre-ri'),
  ]),
  ('Tempat Hiburan', 'Fun Places', [
    W('cinema', 'bioskop', 'where you watch movies', '🎬', 'si-ne-ma'),
    W('restaurant', 'restoran', 'where you eat out', '🍽️', 'res-to-ran'),
    W('cafe', 'kafe', 'where you drink coffee', '☕', 'ka-fei'),
    W('museum', 'museum', 'shows art and history', '🏛️', 'myu-zi-em'),
    W('beach', 'pantai', 'sand by the sea', '🏖️', 'bic'),
    W('mall', 'mal', 'a big shopping building', '🏬', 'mol'),
  ], [
    S('We watch a movie at the cinema', 'Kita nonton film di bioskop', 'talk about going to the movies', 'wi wocc e mu-vi et de si-ne-ma'),
    S('Let\'s go to the beach', 'Ayo pergi ke pantai', 'invite someone to the beach', 'lets gou tu de bic'),
  ]),
  ('Arah', 'Directions', [
    W('left', 'kiri', 'the opposite of right', '⬅️', 'left'),
    W('right', 'kanan', 'the opposite of left', '➡️', 'rait'),
    W('straight', 'lurus', 'without turning', '⬆️', 'streit'),
    W('near', 'dekat', 'a short distance away', '📍', 'nir'),
    W('far', 'jauh', 'a long distance away', '🗺️', 'far'),
    W('here', 'di sini', 'in this place', '🧭', 'hir'),
  ], [
    S('Go straight and turn right', 'Jalan lurus lalu belok kanan', 'give directions', 'gou streit end tern rait'),
    S('The school is far from here', 'Sekolahnya jauh dari sini', 'say a place is not close', 'de skul is far from hir'),
  ]),
 ]),

 ('u16', '🛍️', '#A560E8', 'Belanja & Uang', 'Shopping & Money', [
  ('Membeli', 'Buying', [
    W('buy', 'membeli', 'to get something with money', '🛒', 'bai', 'v'),
    W('sell', 'menjual', 'to give something for money', '🏷️', 'sel', 'v'),
    W('shop', 'toko', 'a place that sells things', '🏪', 'syop'),
    W('money', 'uang', 'coins and bills', '💰', 'ma-ni'),
    W('price', 'harga', 'how much something costs', '💲', 'prais'),
    W('pay', 'membayar', 'to give money for something', '💳', 'pei', 'v'),
  ], [
    S('I want to buy bread', 'Saya mau membeli roti', 'say what you want to buy', 'ai wont tu bai bred'),
    S('How much is the price', 'Berapa harganya', 'ask the cost', 'hau mac is de prais'),
  ]),
  ('Mahal & Murah', 'Expensive & Cheap', [
    W('expensive', 'mahal', 'costing a lot', '💎', 'eks-pen-siv'),
    W('cheap', 'murah', 'costing little', '🪙', 'cip'),
    W('discount', 'diskon', 'a lower price', '🔖', 'dis-kaunt'),
    W('free', 'gratis', 'costing nothing', '🎁', 'fri'),
    W('more', 'lebih banyak', 'a bigger amount', '➕', 'mor'),
    W('less', 'lebih sedikit', 'a smaller amount', '➖', 'les'),
  ], [
    S('This bag is too expensive', 'Tas ini terlalu mahal', 'complain about a price', 'dis beg is tu eks-pen-siv'),
    S('The shoes are cheap today', 'Sepatunya murah hari ini', 'mention a good price', 'de syus ar cip tu-dei'),
  ]),
  ('Di Kasir', 'At the Cashier', [
    W('cashier', 'kasir', 'the person who takes payment', '🧑‍💻', 'ke-syir'),
    W('receipt', 'struk', 'proof of payment', '🧾', 'ri-sit'),
    W('card', 'kartu', 'plastic used to pay', '💳', 'kard'),
    W('cash', 'uang tunai', 'paper money and coins', '💵', 'kesy'),
    W('change', 'kembalian', 'money you get back', '🪙', 'ceinj'),
    W('wallet', 'dompet', 'holds your money and cards', '👛', 'wo-let'),
  ], [
    S('Can I pay by card', 'Bisa bayar dengan kartu', 'ask about card payment', 'ken ai pei bai kard'),
    S('Here is your change', 'Ini kembalian Anda', 'hand back money', 'hir is yor ceinj'),
  ]),
 ]),
]
