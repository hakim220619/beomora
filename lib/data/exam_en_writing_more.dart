/// Bank soal menulis tambahan untuk ujian bahasa Inggris:
/// - IELTS Academic Writing Task 1 (data disajikan sebagai tabel teks /
///   proses langkah demi langkah karena tidak ada gambar) & Task 2.
/// - TOEFL iBT 2026: Build a Sentence, Write an Email, Writing for an
///   Academic Discussion.
/// - PTE Academic: Summarize Written Text & Write Essay.
///
/// Setiap [EssayItem] membawa contoh jawaban (setara band 7.5–8) dan
/// daftar periksa kriteria penilaian dwibahasa. [OrderItem] Build a
/// Sentence menyimpan potongan dalam urutan BENAR (diacak saat tampil).
library;

import '../models/exam.dart';

// ===================================================================
// IELTS Academic Writing Task 1
// ===================================================================

const Map<String, String> _ieltsT1Title = {
  'id': 'IELTS Writing Task 1',
  'en': 'IELTS Writing Task 1',
};

const List<Map<String, String>> _ieltsT1Check = [
  {
    'id':
        'Ada overview yang jelas (tren/perbedaan utama) tanpa angka '
        'berlebihan',
    'en': 'A clear overview (main trends/differences) is included',
  },
  {
    'id': 'Fitur utama dipilih dan didukung data yang akurat',
    'en': 'Key features are selected and supported with accurate data',
  },
  {
    'id': 'Ada perbandingan yang relevan, bukan sekadar daftar angka',
    'en': 'Relevant comparisons are made, not just a list of numbers',
  },
  {
    'id':
        'Paragraf tertata logis dengan kata penghubung yang tepat '
        '(Coherence & Cohesion)',
    'en':
        'Logically organised paragraphs with appropriate linking '
        '(Coherence & Cohesion)',
  },
  {
    'id':
        'Kosakata tren/perbandingan bervariasi dan tepat (Lexical '
        'Resource)',
    'en':
        'Varied, precise vocabulary for trends and comparisons '
        '(Lexical Resource)',
  },
  {
    'id':
        'Struktur kalimat beragam dan minim kesalahan tata bahasa '
        '(Grammatical Range & Accuracy)',
    'en':
        'A range of sentence structures with few grammatical errors '
        '(Grammatical Range & Accuracy)',
  },
];

EssayItem _t1(String task, String model) => EssayItem(
  title: _ieltsT1Title,
  task: task,
  minWords: 150,
  modelAnswer: model,
  checklist: _ieltsT1Check,
);

final List<EssayItem> ieltsTask1 = [
  _t1(
    '''The table below shows the percentage of household waste that was recycled in four countries in 2005, 2015 and 2025.

Summarise the information by selecting and reporting the main features, and make comparisons where relevant. Write at least 150 words.

Household waste recycled (%)
Country         | 2005 | 2015 | 2025
Germany         |  56  |  64  |  68
South Korea     |  42  |  59  |  63
United Kingdom  |  27  |  44  |  45
Indonesia       |   5  |   9  |  16''',
    '''The table compares the proportion of household waste that was recycled in Germany, South Korea, the United Kingdom and Indonesia in 2005, 2015 and 2025.

Overall, recycling rates rose in all four countries over the twenty-year period, although the scale of improvement varied considerably. Germany recycled the highest share of household waste throughout, while Indonesia remained far behind the other three nations.

In 2005, Germany already recycled more than half of its household waste (56%), compared with 42% in South Korea. Over the following decade, South Korea made the most rapid progress, with its rate climbing by 17 percentage points to 59%, which narrowed the gap with Germany (64%). By 2025, the two countries stood at 68% and 63% respectively.

The United Kingdom started from a much lower base of 27%, but its figure jumped to 44% by 2015. After that, however, progress stalled, with only a one-point increase to 45% in 2025. Indonesia, by contrast, recycled just 5% of household waste in 2005. Although this figure more than tripled to 16% by 2025, it was still less than a quarter of the German rate.''',
  ),
  _t1(
    '''The line graph below shows the number of international students (in thousands) enrolled at universities in Australia, Canada and Japan between 2000 and 2020.

Summarise the information by selecting and reporting the main features, and make comparisons where relevant. Write at least 150 words.

International students (thousands)
Year | Australia | Canada | Japan
2000 |    105    |   60   |   64
2005 |    177    |   85   |  117
2010 |    243    |  112   |  141
2015 |    270    |  171   |  152
2020 |    330    |  260   |  160''',
    '''The line graph illustrates how many international students were studying at universities in Australia, Canada and Japan at five-year intervals from 2000 to 2020.

Overall, all three countries attracted more overseas students over the period, but Australia consistently hosted the largest number. The most striking change was the rapid growth in Canada after 2010, whereas enrolments in Japan levelled off.

In 2000, Australia had 105,000 international students, considerably more than Canada (60,000) and Japan (64,000). Australian numbers then rose steadily, reaching 270,000 in 2015 before accelerating to a peak of 330,000 in 2020, more than three times the initial figure.

Japan initially grew faster than Canada, almost doubling to 117,000 by 2005 and reaching 141,000 in 2010. After that, however, its growth slowed markedly, and the figure rose by only around 19,000 over the final decade to finish at 160,000.

Canada, on the other hand, saw modest increases in the first ten years, overtaking Japan only at some point between 2010 and 2015. From 2010 onwards, its enrolments surged from 112,000 to 260,000, making it the fastest-growing destination by the end of the period.''',
  ),
  _t1(
    '''The two pie charts below show how energy was used in an average household in one European country in 1990 and 2020.

Summarise the information by selecting and reporting the main features, and make comparisons where relevant. Write at least 150 words.

Household energy use (%)
Purpose                     | 1990 | 2020
Space heating               |  58  |  42
Water heating               |  18  |  17
Appliances and electronics  |  10  |  22
Cooling                     |   2  |  10
Lighting                    |   7  |   4
Cooking                     |   5  |   5''',
    '''The pie charts compare the ways in which an average household in a European country used energy in 1990 and in 2020.

Overall, space heating accounted for the largest share of household energy in both years, although its dominance declined. Meanwhile, appliances and cooling took up a much greater proportion of energy by 2020, while the shares for most other purposes changed relatively little.

In 1990, heating rooms consumed well over half of all household energy (58%), but this figure fell to 42% thirty years later. Water heating, the second-largest category in 1990, remained almost unchanged at around 17–18%.

The most significant increase was seen in appliances and electronics, whose share more than doubled from 10% to 22%, making it the second most important use of energy in 2020. Cooling showed an even more dramatic proportional rise, growing fivefold from a mere 2% to 10%.

By contrast, lighting became less significant, dropping from 7% to 4%, which may reflect the introduction of more efficient bulbs. Finally, cooking was the only category that stayed exactly the same, representing 5% of total household energy use in both years.''',
  ),
  _t1(
    '''The diagram below shows how used glass bottles are recycled. The stages are described in order.

Summarise the information by selecting and reporting the main features. Write at least 150 words.

Stage 1: Used glass bottles are placed in public recycling bins.
Stage 2: A truck collects the bottles and takes them to a cleaning plant.
Stage 3: The bottles are washed with high-pressure water jets.
Stage 4: The clean bottles are sorted by colour (green, brown and clear).
Stage 5: Each colour of glass is crushed into small pieces called cullet.
Stage 6: The cullet is mixed with sand, soda ash and limestone and melted in a furnace at about 1,500 degrees Celsius.
Stage 7: The molten glass is poured into moulds to form new bottles.
Stage 8: The new bottles are cooled, filled with drinks and delivered to shops, where they are bought and later returned to recycling bins.''',
    '''The diagram illustrates the process by which used glass bottles are recycled and turned into new bottles for sale.

Overall, the process is cyclical and consists of eight stages, beginning with the collection of used bottles and ending with new bottles being sold to consumers, who then return them for recycling. The main phases are collection, cleaning and sorting, reprocessing, and manufacturing.

At the first stage, consumers deposit their empty bottles in public recycling bins. These are then collected by truck and transported to a cleaning plant, where they are washed thoroughly using high-pressure water jets. Once clean, the bottles are separated according to their colour into green, brown and clear glass.

Next, each colour of glass is crushed into small fragments, known as cullet. This cullet is combined with raw materials, namely sand, soda ash and limestone, and the mixture is melted in a furnace at a temperature of approximately 1,500 degrees Celsius.

In the final stages, the molten glass is poured into moulds to create new bottles. After cooling, these are filled with drinks and delivered to shops, where they are purchased by customers, and the cycle begins again.''',
  ),
  _t1(
    '''The diagram below shows the stages in the production of black tea. The stages are described in order.

Summarise the information by selecting and reporting the main features. Write at least 150 words.

Stage 1 – Plucking: Workers pick the top two leaves and the bud from tea bushes by hand.
Stage 2 – Withering: The fresh leaves are spread on racks for 12–18 hours so that they lose about 30% of their moisture.
Stage 3 – Rolling: Machines roll and twist the soft leaves, breaking their cell walls.
Stage 4 – Oxidation: The rolled leaves are left in a cool, humid room for 1–3 hours and turn from green to dark brown.
Stage 5 – Drying: Hot air at around 120 degrees Celsius dries the leaves to stop oxidation.
Stage 6 – Sorting: The dried leaves are passed through sieves and graded by size.
Stage 7 – Packing: The graded tea is packed into bags or boxes and transported to market.''',
    '''The diagram outlines the seven stages involved in producing black tea, from harvesting the leaves to delivering the finished product to market.

Overall, the process combines manual and mechanical work, and it can be divided into three main phases: harvesting, transforming the leaves through withering, rolling and oxidation, and finally drying, grading and packaging.

The process begins when workers pluck the top two leaves and the bud from tea bushes by hand. These fresh leaves are then spread out on racks and left to wither for between 12 and 18 hours, during which time they lose roughly 30% of their moisture and become soft.

Following this, the leaves are rolled and twisted by machines, a step that breaks their cell walls. They are subsequently placed in a cool, humid room for one to three hours to oxidise, and it is at this point that their colour changes from green to dark brown. To halt oxidation, the leaves are dried with hot air at approximately 120 degrees Celsius.

Finally, the dried tea is passed through sieves so that it can be graded by size, after which it is packed into bags or boxes and transported to market.''',
  ),
  _t1(
    '''The table below shows the percentage of people in different age groups who used the internet every day in one country in 2010, 2015 and 2020.

Summarise the information by selecting and reporting the main features, and make comparisons where relevant. Write at least 150 words.

Daily internet users (% of age group)
Age group | 2010 | 2015 | 2020
16–24     |  82  |  95  |  99
25–44     |  65  |  86  |  96
45–64     |  38  |  64  |  85
65+       |  12  |  29  |  54''',
    '''The table compares the proportions of four age groups in one country who went online every day in 2010, 2015 and 2020.

Overall, daily internet use increased in every age group over the decade, and there was a clear inverse relationship between age and usage. However, the gap between younger and older people narrowed considerably, as the older groups recorded the largest gains.

The youngest group, aged 16 to 24, had the highest rate throughout. Already at 82% in 2010, the figure rose to 95% five years later and reached almost universal use (99%) by 2020. People aged 25 to 44 followed a similar pattern, climbing from 65% to 96%.

The changes were far more dramatic among older adults. The proportion of 45- to 64-year-olds using the internet daily more than doubled, from 38% to 85%. Meanwhile, the over-65s started from a very low base of just 12% in 2010, but this figure rose to 29% in 2015 and then to 54% in 2020, meaning that more than half of the oldest group were online every day by the end of the period. Even so, they remained well behind every other age group.''',
  ),
  _t1(
    '''The bar chart below shows the average number of hours per week that men and women in one country spent on unpaid activities in 2020.

Summarise the information by selecting and reporting the main features, and make comparisons where relevant. Write at least 150 words.

Average hours per week (2020)
Activity                   | Men | Women
Housework                  |  6  |  13
Childcare                  |  4  |   9
Shopping                   |  3  |   4
Voluntary work             |  2  |   2
Home repairs and gardening |  5  |   2
Total                      | 20  |  30''',
    '''The bar chart compares how many hours per week, on average, men and women in one country devoted to five types of unpaid work in 2020.

Overall, women spent considerably more time on unpaid activities than men, with a total of 30 hours a week compared with 20 hours. Women dominated domestic and caring tasks, whereas men spent more time on repairs and gardening.

The largest difference was found in housework. Women spent 13 hours a week on household chores, more than twice the figure for men, at 6 hours. Similarly, women devoted 9 hours a week to childcare, while men spent fewer than half as many hours (4) caring for children. Together, these two activities accounted for over two thirds of the total unpaid work done by women.

In contrast, home repairs and gardening was the only category in which men spent more time than women, at 5 hours against just 2 hours. The remaining activities showed little or no gender gap: women spent slightly more time shopping than men (4 hours compared with 3), and both sexes gave exactly 2 hours a week to voluntary work.''',
  ),
  _t1(
    '''The maps below show the town of Riverside in 2000 and today. The information is given in words.

Summarise the information by selecting and reporting the main features, and make comparisons where relevant. Write at least 150 words.

Riverside in 2000:
- A river runs from west to east through the middle of the town.
- North of the river: farmland.
- South of the river: houses, a small park and a factory near the main road.
- One road bridge crosses the river in the centre.
- East end of the river: a small fishing harbour.

Riverside today:
- North of the river: the farmland has been replaced by a housing estate and a primary school.
- South of the river: the houses and the park remain; the factory has been demolished and replaced by a shopping centre with a car park.
- The road bridge remains, and a new pedestrian bridge has been built to the west of it.
- East end of the river: the fishing harbour has become a marina with restaurants.''',
    '''The maps illustrate the changes that have taken place in the town of Riverside between 2000 and the present day.

Overall, Riverside has developed from a partly agricultural town into a more residential and commercial area. The most noticeable changes are the urbanisation of the land north of the river and the shift from industrial and fishing activities towards shopping and leisure.

In 2000, the area to the north of the river consisted entirely of farmland. Today, this land has been developed, and it is now occupied by a housing estate and a primary school. To improve access between the two sides of the town, a pedestrian bridge has been added to the west of the original road bridge, which is still in use.

South of the river, the residential area and the small park have remained unchanged. However, the factory that once stood near the main road has been demolished, and a shopping centre with its own car park has been built in its place.

Finally, at the eastern end of the river, the small fishing harbour has been transformed into a marina lined with restaurants, reflecting a growing focus on leisure.''',
  ),
];

// ===================================================================
// IELTS Academic Writing Task 2
// ===================================================================

const Map<String, String> _ieltsT2Title = {
  'id': 'IELTS Writing Task 2',
  'en': 'IELTS Writing Task 2',
};

const List<Map<String, String>> _ieltsT2Check = [
  {
    'id':
        'Menjawab SEMUA bagian pertanyaan dengan posisi yang jelas dan '
        'konsisten (Task Response)',
    'en':
        'All parts of the question are answered with a clear, '
        'consistent position (Task Response)',
  },
  {
    'id': 'Ide utama dikembangkan dengan penjelasan dan contoh konkret',
    'en':
        'Main ideas are developed with explanations and concrete '
        'examples',
  },
  {
    'id':
        'Struktur paragraf jelas: pendahuluan, isi (satu ide pokok per '
        'paragraf), kesimpulan',
    'en':
        'Clear paragraphing: introduction, body paragraphs (one central '
        'idea each), conclusion',
  },
  {
    'id':
        'Kata penghubung dan rujukan dipakai secara alami, tidak '
        'berlebihan',
    'en':
        'Linking words and referencing are used naturally, not '
        'mechanically',
  },
  {
    'id': 'Kosakata akademik bervariasi dan tepat; kolokasi alami',
    'en': 'Varied, precise academic vocabulary with natural collocations',
  },
  {
    'id':
        'Kalimat kompleks beragam dengan sedikit kesalahan tata bahasa '
        'dan ejaan',
    'en':
        'A range of complex sentences with few grammar and spelling '
        'errors',
  },
];

const String _t2Footer =
    '\n\nGive reasons for your answer and include any relevant examples '
    'from your own knowledge or experience. Write at least 250 words.';

EssayItem _t2(String question, String model) => EssayItem(
  title: _ieltsT2Title,
  task: question + _t2Footer,
  minWords: 250,
  modelAnswer: model,
  checklist: _ieltsT2Check,
);

final List<EssayItem> ieltsTask2 = [
  _t2(
    '''Some people believe that the main purpose of a university education is to prepare graduates for employment. Others think universities have wider functions.

To what extent do you agree that universities should focus mainly on providing the skills employers need?''',
    '''In an increasingly competitive job market, there is growing pressure on universities to produce graduates who are ready to work from their first day. While I accept that employability is an important goal of higher education, I disagree that it should be the main focus of universities.

Admittedly, there are strong arguments for a career-oriented approach. Students invest considerable time and money in their degrees, often taking out large loans, and they reasonably expect a return in the form of stable employment. Courses that include internships, industry projects and practical training can help graduates move smoothly into the workforce. Employers also benefit, since they spend less on training new staff, and the wider economy gains from a more productive labour force.

However, reducing universities to training centres for employers would be short-sighted. Firstly, the skills that companies demand today may be obsolete within a decade, as technologies such as artificial intelligence transform entire industries. A broad education that develops critical thinking, research ability and adaptability prepares students for jobs that do not yet exist. Secondly, universities play a vital role in producing knowledge for its own sake. Many breakthroughs, from the internet to mRNA vaccines, grew out of basic research that had no obvious commercial application at the time. Finally, universities help to shape informed citizens who can question authority, understand complex social issues and participate meaningfully in democracy.

In conclusion, although universities should certainly help students find meaningful work, focusing mainly on the immediate needs of employers would undermine their deeper purposes. The best institutions strike a balance, combining practical skills with the intellectual breadth that allows graduates to adapt and contribute to society throughout their lives.''',
  ),
  _t2(
    '''Some people think that governments should spend money on improving public transport, while others believe that building more and wider roads is the best way to reduce traffic congestion.

Discuss both views and give your own opinion.''',
    '''Traffic congestion has become a daily frustration in cities around the world, and governments disagree about how to tackle it. Some argue that the answer lies in expanding road networks, whereas others favour investment in public transport. In my view, the latter is a far more effective and sustainable solution.

Supporters of road building point out that most people still depend on private cars, especially in areas with limited bus or rail services. Wider roads and new highways can ease bottlenecks in the short term, reduce journey times and make it easier for goods to be delivered. In rapidly growing regions where public transport barely exists, building roads may also be the quickest way to connect communities to jobs and markets.

Nevertheless, there is considerable evidence that new roads tend to generate more traffic rather than less, a phenomenon known as induced demand. When driving becomes easier, more people choose to drive, and within a few years the new lanes are as congested as the old ones. Public transport, by contrast, can move far more people using far less space. A single metro line can carry tens of thousands of passengers per hour, as cities such as Singapore and Jakarta have shown with their mass rapid transit systems. Efficient trains and buses also reduce air pollution and carbon emissions, and they offer affordable mobility to those who cannot afford a car.

In conclusion, while road improvements may be necessary in certain areas, I believe that governments should prioritise public transport. Only by giving citizens fast, reliable and affordable alternatives to driving can cities achieve a lasting reduction in congestion while also protecting the environment.''',
  ),
  _t2(
    '''In many countries, young people are moving away from rural areas to live and work in cities.

What problems does this cause? What solutions can you suggest?''',
    '''Across the developing and developed world alike, villages are losing their younger residents to the attractions of urban life. This trend creates serious difficulties for both rural and urban areas, but a combination of economic and social measures could help to address them.

The most obvious problem is the decline of rural communities. When young adults leave, villages are left with an ageing population, and there are fewer people to farm the land, run local businesses or care for elderly relatives. Schools and health clinics may close because of falling demand, which in turn encourages even more families to leave. At the same time, cities struggle to absorb the new arrivals. Housing becomes expensive, informal settlements expand, and public services such as transport and hospitals become overcrowded. In some cases, rural migrants end up in insecure, low-paid jobs and live in worse conditions than they did at home.

To tackle these issues, governments should first make rural areas more economically attractive. Investment in reliable internet access, for example, would allow young people to work remotely or start online businesses without moving to the city. Agricultural modernisation and support for small enterprises, such as tourism or food processing, could also create skilled, better-paid jobs locally. Secondly, improving rural education and healthcare would give families a reason to stay. Finally, in cities, authorities need to plan ahead by building affordable housing and expanding public transport so that growth is managed rather than chaotic.

In conclusion, rural-to-urban migration weakens villages and puts heavy pressure on cities. However, by creating opportunities in the countryside and planning urban growth carefully, governments can reduce the negative effects of this movement.''',
  ),
  _t2(
    '''In recent years, more and more people have started working from home rather than travelling to an office.

Do the advantages of this development outweigh the disadvantages?''',
    '''Since the pandemic, working from home has changed from a rare privilege into a normal arrangement for millions of employees. Although remote work has some drawbacks, I believe that its advantages are more significant.

The most obvious benefit is the time and money saved on commuting. In large cities, workers can spend two or three hours a day travelling, and remote work allows them to use this time to rest, exercise or be with their families. This flexibility can improve both well-being and productivity, as many studies have found that employees who control their own schedules are more motivated. Remote work also widens opportunities: companies can recruit talented staff from different regions, and people with disabilities or caring responsibilities can participate more fully in the labour market. In addition, fewer commuters means less traffic congestion and lower carbon emissions.

That said, working from home is not without problems. Some employees feel isolated and miss the informal conversations that build relationships and generate new ideas. Younger staff in particular may find it harder to learn from experienced colleagues when they cannot observe them in person. There is also a risk that the boundary between work and private life becomes blurred, leading people to answer emails late at night and eventually suffer from burnout.

However, most of these disadvantages can be reduced through sensible management. Hybrid models, in which staff come to the office two or three days a week, preserve teamwork and mentoring, while clear rules about working hours protect employees' personal time.

In conclusion, although remote work brings challenges such as isolation and overwork, these can be managed effectively. The gains in flexibility, productivity and environmental impact therefore outweigh the drawbacks.''',
  ),
  _t2(
    '''Many people now get their news mainly from social media rather than from newspapers or television.

Why is this happening? Is this a positive or negative development?''',
    '''Over the past decade, platforms such as Facebook, X and TikTok have become the primary source of news for a large proportion of the population, especially young people. This essay will explain the reasons for this shift and argue that, overall, it is a negative development.

There are several reasons why social media has overtaken traditional news outlets. The first is convenience: most people carry a smartphone and can scroll through headlines at any moment, whereas newspapers must be bought and television news is broadcast at fixed times. Secondly, social media is free and offers instant updates, so users learn about breaking events within minutes. Finally, these platforms are personalised. Algorithms show people stories that match their interests, and content shared by friends often feels more relevant and trustworthy than reports from distant institutions.

Although this trend has some benefits, such as giving a voice to ordinary citizens and exposing events that mainstream media might ignore, I believe its drawbacks are more serious. Unlike professional journalists, most social media users do not check facts before sharing, which allows false information to spread rapidly. During elections and health crises, misinformation has caused real harm, for instance by discouraging people from getting vaccinated. Moreover, because algorithms reward content that provokes strong emotions, users are often shown sensational or one-sided stories, which can deepen political division and trap people in so-called echo chambers.

In conclusion, people increasingly rely on social media for news because it is convenient, free and personalised. However, its lack of editorial standards and tendency to spread misinformation make this a largely negative development, and it is essential that schools teach media literacy so that citizens can evaluate what they read.''',
  ),
  _t2(
    '''Some people think that children should begin learning a foreign language at primary school rather than at secondary school.

Do the advantages of this outweigh the disadvantages?''',
    '''In an increasingly interconnected world, the ability to speak a foreign language is a valuable asset, and many education systems are now introducing languages at an earlier age. In my opinion, the benefits of starting at primary school clearly outweigh the potential drawbacks.

The main advantage is that young children seem to acquire languages more naturally than teenagers or adults. They are generally less self-conscious about making mistakes and more willing to imitate new sounds, which helps them develop more accurate pronunciation. Starting early also gives learners more years of exposure, so by the time they finish school they can reach a much higher level of proficiency. Furthermore, research suggests that learning a second language can enhance cognitive skills such as memory, problem-solving and concentration, which may benefit children's performance in other subjects as well.

On the other hand, critics argue that primary pupils should concentrate on mastering their mother tongue and basic subjects like mathematics before taking on an additional language. There is a concern that an overloaded curriculum could leave children confused or stressed. Another practical problem is the shortage of qualified teachers. In many regions of Indonesia, for example, primary schools struggle to find staff who can teach English competently, and poor teaching may do more harm than good.

However, these disadvantages relate more to how languages are taught than to the age at which learning begins. If lessons are short, playful and based on songs, stories and games, young learners are unlikely to feel overwhelmed. Governments can also invest in teacher training and digital resources to overcome staff shortages.

In conclusion, while early language learning poses some practical challenges, its advantages for pronunciation, long-term proficiency and cognitive development make it a worthwhile policy.''',
  ),
  _t2(
    '''Some people believe that keeping animals in zoos is cruel and should be stopped. Others think that zoos play an important role in protecting wildlife.

Discuss both views and give your own opinion.''',
    '''Zoos have existed for centuries, but their role in modern society is increasingly controversial. While some regard them as prisons for animals, others see them as essential for conservation. I believe that well-managed zoos are justified, provided that animal welfare is their top priority.

Those who oppose zoos argue that no enclosure can replace an animal's natural habitat. Large or intelligent species such as elephants, orcas and great apes may travel long distances or live in complex social groups in the wild, and in captivity they often show signs of stress, such as pacing or self-harm. Critics also point out that some zoos, particularly small private ones, are run mainly for profit and keep animals in cramped, poorly maintained cages. From this perspective, exhibiting animals for human entertainment is morally unacceptable.

On the other hand, supporters claim that modern zoos do far more than entertain. Many run breeding programmes for endangered species, and some animals, such as the Arabian oryx and the California condor, survive today largely because of captive breeding and reintroduction into the wild. Zoos also fund field research and habitat protection, and they educate millions of visitors, especially children, about biodiversity and the threats it faces. Seeing a real orangutan can inspire a lifelong interest in protecting rainforests in a way that a documentary cannot.

In my view, the solution is not to close all zoos but to regulate them strictly. Facilities that cannot provide spacious, enriching environments should be shut down, and species that suffer badly in captivity should no longer be kept.

In conclusion, although the concerns about cruelty are valid, responsible zoos make a significant contribution to conservation and education, and they should therefore be reformed rather than abolished.''',
  ),
  _t2(
    '''The number of overweight children is increasing in many countries.

What are the causes of this problem? What measures could be taken to solve it?''',
    '''Childhood obesity has risen sharply in recent decades, and it is now a major public health concern in both wealthy and developing nations. This trend has several causes, but there are also practical steps that families, schools and governments can take to reverse it.

The first cause is a change in diet. Processed foods and sugary drinks are cheap, heavily advertised and widely available, and many families rely on fast food because parents work long hours and have little time to cook. These products are high in calories but low in nutrients, which makes it easy for children to consume more energy than they need. The second major cause is a lack of physical activity. Children today spend much of their free time on smartphones, tablets and video games instead of playing outside, and in crowded cities safe spaces for sport are often limited.

To address the problem, schools can play a central role. They should serve healthy, balanced meals, ban the sale of sugary snacks on their premises, and guarantee at least one hour of physical activity every day. Governments can also intervene through policy. A tax on sugary drinks, as introduced in the United Kingdom and Mexico, has been shown to reduce consumption, and restrictions on advertising junk food to children could weaken its appeal. Finally, parents need to set a good example by limiting screen time, cooking simple healthy meals and doing active things together as a family, such as cycling or walking.

In conclusion, unhealthy diets and inactive lifestyles are the main reasons why children are becoming overweight. A combined effort involving schools, governments and parents is necessary to help the next generation grow up healthier.''',
  ),
  _t2(
    '''Some people argue that the money spent on space exploration would be better spent on solving problems on Earth, such as poverty and disease.

To what extent do you agree or disagree?''',
    '''Governments and private companies now spend billions of dollars every year on rockets, satellites and missions to other planets. Some people believe this money should instead be used to tackle urgent problems on our own planet. I partly agree with this view, but I do not think space exploration should be abandoned.

It is easy to understand why critics question the cost of space programmes. Millions of people still lack clean water, adequate food and basic healthcare, and it may seem morally difficult to justify sending a robot to Mars while children die from preventable diseases. In countries with limited budgets, prioritising space projects over hospitals and schools could indeed be irresponsible, and politicians sometimes use high-profile missions for national prestige rather than genuine scientific benefit.

However, the claim that space research does nothing for life on Earth is misleading. Many technologies we now take for granted, including satellite weather forecasting, GPS navigation and water purification systems, were developed through space programmes. Earth-observation satellites allow scientists to monitor deforestation, track hurricanes and measure the effects of climate change, which directly helps governments protect their populations. Moreover, space budgets are relatively small: NASA receives less than half of one percent of the US federal budget, so cancelling it would hardly end global poverty.

In my opinion, the real issue is balance. Wealthy nations can afford to fund both space exploration and humanitarian aid, and they should be expected to do so. Developing countries, meanwhile, may benefit more from cooperating on international space projects than from building expensive programmes of their own.

In conclusion, although solving problems on Earth must remain the priority, space exploration produces valuable knowledge and technology, and a modest investment in it is fully justified.''',
  ),
  _t2(
    '''International tourism has grown rapidly in recent decades, and many developing countries now depend on it as a source of income.

Do the advantages of international tourism outweigh the disadvantages for these countries?''',
    '''Cheaper flights and rising incomes have made international travel accessible to millions of people, and destinations such as Bali, Vietnam and Kenya now receive huge numbers of foreign visitors. Although tourism brings certain problems, I believe that for most developing countries its advantages are greater.

The most significant benefit is economic. Tourism generates foreign currency, creates jobs in hotels, restaurants and transport, and supports small businesses such as local guides and craft makers. Because it is labour-intensive, it can provide employment for people with limited formal education, including women and young people in rural areas. Tourism revenue can also fund improvements in infrastructure, such as roads, airports and water supply, which benefit local residents as well as visitors. In addition, tourism can encourage communities to preserve their cultural heritage and natural environment, since these are precisely what attract visitors.

Nevertheless, there are clear disadvantages. Mass tourism can damage fragile ecosystems: coral reefs are harmed by careless divers, and popular islands struggle to manage waste and water shortages. Local culture may become commercialised, with traditional ceremonies performed mainly for tourists. Furthermore, a large share of the profits often goes to foreign-owned hotel chains and tour operators rather than to local people, and economies that rely heavily on tourism are extremely vulnerable to crises, as the collapse of visitor numbers during the pandemic showed.

However, these problems can be reduced through careful management, for example by limiting visitor numbers in sensitive areas, supporting community-based tourism and diversifying the economy.

In conclusion, although international tourism can harm the environment and local culture, the jobs, income and investment it brings make it, on balance, beneficial for developing countries, provided that it is managed sustainably.''',
  ),
  _t2(
    '''Plastic waste has become a serious environmental problem around the world.

Why is plastic still so widely used? What can individuals do to reduce plastic waste?''',
    '''Plastic pollution now affects every part of the planet, from city streets to the deepest oceans. Despite growing awareness of the damage it causes, plastic remains part of almost every product we buy. This essay will discuss the reasons for its continued popularity and suggest what ordinary people can do to reduce it.

The main reason plastic is so widely used is that it is extremely cheap and practical. It is light, strong, waterproof and can be moulded into almost any shape, which makes it ideal for packaging food and drinks, protecting goods during transport and manufacturing everything from phones to medical equipment. For businesses, switching to alternatives such as glass, metal or paper often means higher costs and heavier shipping. In addition, modern lifestyles depend on convenience. People increasingly buy takeaway meals, bottled drinks and goods delivered online, all of which generate large amounts of single-use packaging.

Although governments and companies have the greatest responsibility, individuals can still make a meaningful difference. The simplest step is to avoid single-use items by carrying a reusable bag, water bottle and coffee cup. Consumers can also choose products with less packaging, buy loose fruit and vegetables at traditional markets, and support shops that offer refills for products such as soap and detergent. Separating waste correctly at home makes recycling more effective. Finally, individuals can use their influence as citizens and customers, for example by joining clean-up campaigns or encouraging local businesses and politicians to adopt plastic-free policies.

In conclusion, plastic remains popular because it is inexpensive, versatile and convenient. While a lasting solution requires action from industry and government, everyday choices made by individuals can significantly reduce the amount of plastic waste we produce.''',
  ),
  _t2(
    '''Some people believe that unpaid community service, such as helping in hospitals or cleaning public parks, should be a compulsory part of high school programmes.

To what extent do you agree or disagree?''',
    '''In a number of countries, secondary students are required to complete a certain number of hours of voluntary work before they graduate. I strongly agree that community service should be part of the school curriculum, as it benefits both students and society.

Firstly, community service teaches valuable skills that cannot easily be learned in a classroom. When teenagers help to organise a food drive or assist elderly residents at a care home, they develop communication, teamwork and problem-solving abilities. They also learn to be punctual and reliable because other people depend on them. These are precisely the soft skills that employers and universities look for, so such experience can improve students' future prospects.

Secondly, compulsory service can broaden young people's perspectives. Many students live in relatively comfortable circumstances and rarely meet people from different backgrounds. Working in a hospital or a shelter exposes them to the realities of illness, disability and poverty, which can foster empathy and a lasting sense of social responsibility. Some students even discover a career path in this way, for example in nursing or social work.

Critics argue that forcing students to volunteer contradicts the very idea of volunteering and adds pressure to an already busy academic schedule. These concerns are understandable, but they can be addressed through sensible design. Schools could require a modest number of hours, perhaps forty per year, and allow students to choose activities that match their interests, which would make the experience feel meaningful rather than imposed.

In conclusion, I believe that the personal development and social benefits of community service clearly justify making it a compulsory element of high school education, provided that students are given flexibility in how they fulfil it.''',
  ),
  _t2(
    '''Some people think that artificial intelligence tools will soon make teachers unnecessary in schools.

To what extent do you agree or disagree?''',
    '''Artificial intelligence applications can now explain grammar, solve equations and even give feedback on essays within seconds. As a result, some people predict that human teachers will soon become unnecessary. Although AI will undoubtedly change education, I completely disagree that it can replace teachers.

It is true that AI tools offer impressive advantages. They are available at any time, never lose patience and can adapt to each learner's level, providing extra practice for weaker students and more challenging tasks for stronger ones. In regions where qualified teachers are scarce, such as remote islands in Indonesia, AI tutors could give children access to learning resources that would otherwise be unavailable.

However, teaching involves much more than delivering information. Firstly, teachers motivate students and build relationships with them. A good teacher notices when a child is anxious, bored or struggling at home and responds with encouragement or support, something that software cannot genuinely do. Secondly, schools are places where young people learn to cooperate, resolve conflicts and respect others. These social and emotional skills develop through human interaction guided by adults, not through screens. Thirdly, AI systems still make factual errors and can reproduce biases from the data they are trained on, so students need knowledgeable teachers to help them evaluate information critically. Finally, self-directed learning with technology demands a level of discipline that many children do not yet have.

For these reasons, the most likely future is one in which AI acts as a powerful assistant, reducing teachers' workload in areas such as marking, while teachers focus on mentoring, discussion and creativity.

In conclusion, AI will transform how teachers work, but it will not make them unnecessary, because education is fundamentally a human relationship.''',
  ),
];

// ===================================================================
// TOEFL iBT 2026 – Build a Sentence
// ===================================================================

const Map<String, String> _bsPrompt = {
  'id': 'Susun kata-kata menjadi jawaban yang benar.',
  'en': 'Arrange the words to make a correct response.',
};

OrderItem _bs(String context, List<String> pieces) =>
    OrderItem(prompt: _bsPrompt, context: context, pieces: pieces);

final List<OrderItem> toeflBuildSentence = [
  _bs('Did you finish the lab report?', [
    'I',
    'still need',
    'to add',
    'the conclusion',
  ]),
  _bs('Where is the study group meeting today?', [
    'We are meeting',
    'in the room',
    'next to',
    'the cafeteria',
  ]),
  _bs('Why were you late for class this morning?', [
    'My bus',
    'broke down',
    'on the way',
    'to campus',
  ]),
  _bs('Have you chosen a topic for your essay?', [
    'I am thinking',
    'of writing',
    'about',
    'renewable energy',
  ]),
  _bs('Can you help me with the statistics homework?', [
    'Sure, I can',
    'meet you',
    'after',
    'my last lecture',
  ]),
  _bs('What did you think of the guest speaker?', [
    'Her talk was',
    'much more',
    'interesting than',
    'I expected',
  ]),
  _bs('Do you know when the library closes today?', [
    'I believe',
    'it closes',
    'an hour',
    'earlier than',
    'usual',
  ]),
  _bs('Are you going to the career fair tomorrow?', [
    'Yes, I want',
    'to talk',
    'to a few',
    'engineering companies',
  ]),
  _bs('How was your internship last summer?', [
    'It taught me',
    'a lot about',
    'working',
    'in a team',
  ]),
  _bs('Why did you drop the chemistry course?', [
    'The class schedule',
    'conflicted with',
    'the hours of',
    'my part-time job',
  ]),
  _bs('Could you lend me your notes from Monday?', [
    'I will send',
    'you a copy',
    'as soon as',
    'I get home',
  ]),
  _bs('Did the professor extend the deadline?', [
    'She gave us',
    'two more days',
    'to submit',
    'the final draft',
  ]),
  _bs('Where can I print my poster?', [
    'The media center',
    'has a printer',
    'that handles',
    'large paper sizes',
  ]),
  _bs('What should I bring on the field trip?', [
    'You should wear',
    'comfortable shoes',
    'and bring',
    'plenty of water',
  ]),
  _bs('Have you registered for next semester yet?', [
    'Not yet, because',
    'I am waiting',
    'for my advisor',
    'to approve',
    'my course plan',
  ]),
  _bs('Is the cafeteria open on Sundays?', [
    'No, but you can',
    'buy sandwiches',
    'at the coffee shop',
    'in the library',
  ]),
  _bs('Why is the lecture hall so crowded today?', [
    'The professor',
    'is reviewing',
    'what will be',
    'on the exam',
  ]),
  _bs('Did you understand the reading assignment?', [
    'Most of it,',
    'but the last chapter',
    'was quite',
    'confusing',
  ]),
  _bs('Who is preparing the slides for our presentation?', [
    'Maria agreed',
    'to take charge',
    'of designing',
    'them',
  ]),
  _bs('How do you usually prepare for exams?', [
    'I make',
    'flashcards and',
    'review them',
    'every evening',
  ]),
  _bs('Did you hear that the seminar was cancelled?', [
    'No, nobody',
    'told me',
    'about',
    'the change',
  ]),
  _bs('Do you want to join the hiking club?', [
    'I would love to,',
    'but I',
    'am too busy',
    'this semester',
  ]),
  _bs('Why did you choose this university?', [
    'It has',
    'one of the best',
    'marine biology programs',
    'in the country',
  ]),
  _bs('Have you met our new roommate?', [
    'Yes, she',
    'seems',
    'really friendly',
    'and easygoing',
  ]),
  _bs('How do I reserve a seat on the airport shuttle?', [
    'You need to',
    'book online',
    'at least',
    'a day in advance',
  ]),
  _bs('Can I borrow your calculator for the test?', [
    'Sorry, I',
    'need it',
    'for my own',
    'exam this afternoon',
  ]),
  _bs('Did you enjoy the art exhibition?', [
    'The paintings',
    'were',
    'more impressive',
    'than the sculptures',
  ]),
  _bs('Is it difficult to get a job on campus?', [
    'Not really,',
    'as long as',
    'you apply',
    'early in the semester',
  ]),
  _bs('Why are you studying in the library instead of at home?', [
    'My neighbors',
    'are renovating',
    'their apartment',
    'this week',
  ]),
  _bs('Where did you find those statistics?', [
    'They come from',
    'a report',
    'published by',
    'the World Bank',
  ]),
  _bs('Have you decided on your major?', [
    'I am leaning',
    'toward',
    'economics',
    'or political science',
  ]),
  _bs('How long did the experiment take?', [
    'It took',
    'almost',
    'three hours',
    'to complete',
  ]),
  _bs('Should we meet before the presentation?', [
    'That is',
    'a good idea',
    'because we',
    'need more practice',
  ]),
  _bs('Did you get any feedback on your essay?', [
    'My tutor said',
    'that my argument',
    'needs',
    'more evidence',
  ]),
  _bs("Do you know where Professor Lee's office is?", [
    'It is',
    'on the third floor',
    'of',
    'the science building',
  ]),
  _bs('Are you taking the bus to the conference?', [
    'No, I',
    'am getting',
    'a ride',
    'with my lab partner',
  ]),
  _bs("What did you learn in today's workshop?", [
    'We practiced',
    'how to write',
    'a strong',
    'thesis statement',
  ]),
  _bs('Why is the computer lab closed?', [
    'They are installing',
    'new software',
    'on all',
    'the machines',
  ]),
  _bs('Can you recommend a good book on climate change?', [
    'The one',
    'our professor mentioned',
    'is',
    'easy to follow',
  ]),
  _bs('Did you apply for the scholarship?', [
    'I submitted',
    'my application',
    'two days',
    'before the deadline',
  ]),
  _bs('How is your research project going?', [
    'We have collected',
    'most of the data',
    'but have not',
    'analyzed it yet',
  ]),
  _bs('Would you like to study together this weekend?', [
    'I would,',
    'but I have',
    'to work',
    'on Saturday morning',
  ]),
  _bs("Why didn't you answer my message?", [
    'My phone',
    'ran out',
    'of battery',
    'during the lecture',
  ]),
  _bs('Is the new dormitory better than the old one?', [
    'The rooms are',
    'bigger,',
    'but the rent',
    'is much higher',
  ]),
  _bs('What did the academic advisor ask you?', [
    'She wanted',
    'to know',
    'whether I',
    'had finished',
    'my thesis proposal',
  ]),
  _bs('Did Tom say why he missed the meeting?', [
    'He did not',
    'tell me',
    'why he',
    'was absent',
  ]),
  _bs('Where should I put the returned books?', [
    'Leave them',
    'on the cart',
    'beside',
    'the front desk',
  ]),
  _bs('Do you know if the exam will be online?', [
    'The professor',
    'has not told us',
    'how it',
    'will be held',
  ]),
];

// ===================================================================
// TOEFL iBT 2026 – Write an Email
// ===================================================================

const Map<String, String> _emailTitle = {
  'id': 'TOEFL Write an Email',
  'en': 'TOEFL Write an Email',
};

const List<Map<String, String>> _emailCheck = [
  {
    'id': 'Ketiga poin yang diminta dibahas dengan jelas',
    'en': 'All three required points are clearly addressed',
  },
  {
    'id':
        'Salam pembuka, penutup, dan nada sesuai penerima (formal/semi-'
        'formal/akrab)',
    'en':
        'Greeting, closing and tone suit the recipient '
        '(formal/semi-formal/friendly)',
  },
  {
    'id': 'Tujuan email disampaikan di awal dan isinya tertata',
    'en': 'The purpose is stated early and the content is well organised',
  },
  {
    'id': 'Detail dan alasan spesifik, bukan kalimat umum',
    'en': 'Specific details and reasons rather than general statements',
  },
  {
    'id':
        'Tata bahasa dan kosakata tepat; kalimat sopan (mis. "Could '
        'you…", "I would appreciate…")',
    'en':
        'Accurate grammar and vocabulary; polite forms (e.g. "Could '
        'you…", "I would appreciate…")',
  },
];

EssayItem _email(String task, String model) => EssayItem(
  title: _emailTitle,
  task:
      '$task\n\nWrite as much as you can and in complete sentences. '
      'Aim for at least 100 words.',
  minWords: 100,
  modelAnswer: model,
  checklist: _emailCheck,
);

final List<EssayItem> toeflEmail = [
  _email(
    '''You missed your Introduction to Psychology class yesterday because you were ill. Write an email to your professor, Dr. Martin.

In your email, do the following:
- Explain why you were absent.
- Ask what material you missed.
- Request extra time for the assignment that was due today.''',
    '''Dear Dr. Martin,

I am writing to apologize for missing yesterday's Introduction to Psychology class. Unfortunately, I had a high fever and the campus clinic advised me to rest at home. I have attached the doctor's note for your records.

I would like to make sure I do not fall behind. Could you please let me know which chapters and topics were covered in the lecture? If there were any handouts or slides, I would be very grateful if you could share them, and I will also ask a classmate for their notes.

In addition, I was not able to finish the case study assignment that was due today because of my illness. Would it be possible to submit it by Friday instead? I have already completed most of the research, so two extra days would be enough.

Thank you very much for your understanding.

Best regards,
Rina Putri''',
  ),
  _email(
    '''You borrowed a book from the university library, but you have lost it. Write an email to the library staff.

In your email, do the following:
- Explain what happened to the book.
- Suggest how you could solve the problem.
- Ask about any fees or penalties.''',
    '''Dear Library Staff,

I am writing about a book I borrowed on March 3, "Principles of Microeconomics" by Gregory Mankiw. I am sorry to report that I have lost it. I believe I left it on the train last Tuesday, and although I contacted the railway's lost-and-found office, it has not been returned.

I would like to resolve this as quickly as possible. One option would be for me to buy a new copy of the same edition and bring it to the library. Alternatively, if you prefer, I can pay the replacement cost directly.

Could you also tell me whether there are any late fees or administrative charges that I need to pay? I would also like to know whether my borrowing privileges will be affected in the meantime.

Thank you for your help, and I apologize for the inconvenience.

Sincerely,
Daniel Wong
Student ID: 2024-1187''',
  ),
  _email(
    '''You work part-time at the campus café. Next semester, one of your new classes is scheduled during your usual shift. Write an email to your manager, Ms. Clark.

In your email, do the following:
- Explain the scheduling problem.
- Suggest a different working schedule.
- Assure your manager that you want to keep the job.''',
    '''Dear Ms. Clark,

I hope you are doing well. I am writing because I have a scheduling problem for next semester. I have just registered for a required statistics course, and it meets on Tuesdays and Thursdays from 9:00 to 10:30 a.m., which overlaps with my usual morning shift.

I would like to suggest a new schedule. I could work on Monday, Wednesday and Friday mornings instead, or I could take the afternoon shift on Tuesdays and Thursdays from 1:00 p.m. I am also available on Saturdays if the café needs extra help on weekends.

I really enjoy working at the café, and I have learned a lot from you and the team. I definitely want to keep this job, and I will do my best to make the change as easy as possible for everyone.

Please let me know which option works best for you.

Kind regards,
Ahmad Fauzi''',
  ),
  _email(
    '''Your friend Jessica has invited you to her birthday dinner this Saturday, but you cannot attend. Write an email to Jessica.

In your email, do the following:
- Thank her for the invitation.
- Explain why you cannot come.
- Suggest another way to celebrate together.''',
    '''Hi Jessica,

Thank you so much for inviting me to your birthday dinner on Saturday! It was really kind of you to think of me, and the restaurant you chose sounds amazing.

Unfortunately, I won't be able to make it. My cousin is getting married in Bandung this weekend, and I promised my family months ago that I would help with the preparations. I'll be leaving on Friday evening and won't be back until Sunday night. I'm really disappointed to miss your celebration.

I'd love to celebrate with you another time, though. How about I take you out for lunch next week? There's a new café near campus that serves great desserts, and it would be my treat. Maybe Wednesday or Thursday after class would work?

I hope you have a wonderful birthday and enjoy every moment of it!

Love,
Maya''',
  ),
  _email(
    '''The heater in your dormitory room has stopped working. Write an email to the university housing office.

In your email, do the following:
- Describe the problem.
- Explain how it is affecting you.
- Request that it be repaired, and say when you are available.''',
    '''Dear Housing Office,

I am writing to report a problem in my dormitory room, Room 312 in Maple Hall. The heater stopped working on Sunday evening. It makes a clicking sound when I turn it on, but no warm air comes out, even when it is set to the highest temperature.

This is causing serious difficulties for me. Since temperatures at night have dropped below freezing this week, my room has become extremely cold, and I have had trouble sleeping. I have also been unable to study in my room, so I have had to stay in the library until late every evening.

Could you please send a technician to repair the heater as soon as possible? I am available on weekday mornings before 11 a.m. and on Friday afternoon. If no one is in, you have my permission to enter the room.

Thank you for your prompt attention to this matter.

Sincerely,
Kevin Tan''',
  ),
  _email(
    '''You recently attended a career skills workshop organized by the university's career center. Write an email to the workshop organizer, Mr. Rivera.

In your email, do the following:
- Say what you found most useful.
- Make one suggestion for improving the workshop.
- Ask about future events.''',
    '''Dear Mr. Rivera,

I am writing to thank you for organizing last Thursday's career skills workshop. I found it extremely valuable, especially the session on writing résumés. The examples of strong and weak résumés helped me understand how to describe my experience more effectively, and I have already rewritten mine using your advice.

If I could make one suggestion, it would be to include more time for practice. The mock interview activity was excellent, but each student only had about five minutes, which was not enough to receive detailed feedback. Perhaps future workshops could be divided into smaller groups or extended by an hour.

Finally, I would like to know whether the career center is planning any similar events this semester. I am particularly interested in workshops on networking or preparing for internship interviews. Could you let me know how I can register?

Thank you again for a very helpful workshop.

Best regards,
Siti Rahmawati''',
  ),
  _email(
    '''You ordered a laptop bag from an online store, but you received the wrong item. Write an email to the store's customer service department.

In your email, do the following:
- Describe your order and what you received.
- Explain what you would like the store to do.
- Ask how long the process will take.''',
    '''Dear Customer Service Team,

I am writing about my recent order, number 58321, which I placed on your website on October 2. I ordered a black waterproof laptop bag designed for 15-inch laptops. However, the package I received yesterday contained a small brown shoulder bag, which is far too small for my computer.

I would like to exchange the item for the bag I originally ordered. I need it for my daily commute to university, so I would prefer an exchange rather than a refund. If the black bag is no longer in stock, I would accept a full refund instead. Please also let me know how to return the incorrect item and whether you will provide a prepaid shipping label.

Finally, could you tell me how long the exchange process usually takes? I would appreciate receiving the correct bag within the next two weeks if possible.

Thank you for your assistance.

Yours sincerely,
Budi Santoso''',
  ),
  _email(
    '''You are applying for a summer research program and need a letter of recommendation. Write an email to your former biology professor, Dr. Nguyen.

In your email, do the following:
- Remind the professor who you are.
- Explain what the program is and why you are applying.
- Ask for a recommendation letter and mention the deadline.''',
    '''Dear Dr. Nguyen,

I hope this email finds you well. My name is Lina Hartono, and I took your Cell Biology course last spring. I sat in the front row and presented a project on antibiotic resistance, which you encouraged me to develop further.

I am now applying for the Summer Undergraduate Research Program at the National Institute of Health Sciences. It is a ten-week program in which students work in a laboratory under the supervision of experienced scientists. I am applying because I hope to pursue a career in microbiology, and this would be a valuable opportunity to gain hands-on research experience.

I would be very grateful if you could write a letter of recommendation for me. The deadline for submission is March 15, and the letter can be uploaded directly through the program's website. I would be happy to send you my résumé and personal statement to help you.

Thank you very much for considering my request.

Kind regards,
Lina Hartono''',
  ),
];

// ===================================================================
// TOEFL iBT – Writing for an Academic Discussion
// ===================================================================

const Map<String, String> _discTitle = {
  'id': 'TOEFL Diskusi Akademik',
  'en': 'TOEFL Academic Discussion',
};

const List<Map<String, String>> _discCheck = [
  {
    'id': 'Menjawab pertanyaan dosen dengan pendapat yang jelas',
    'en': "Directly answers the professor's question with a clear opinion",
  },
  {
    'id':
        'Menyumbang ide/alasan BARU, tidak sekadar mengulang mahasiswa '
        'lain',
    'en':
        'Contributes a NEW idea or reason, not just repeating the other '
        'students',
  },
  {
    'id': 'Merujuk atau menanggapi minimal satu unggahan mahasiswa lain',
    'en': "Refers to or responds to at least one classmate's post",
  },
  {
    'id': 'Alasan dikembangkan dengan contoh atau penjelasan spesifik',
    'en': 'Reasons are developed with a specific example or explanation',
  },
  {
    'id': 'Kalimat bervariasi, kosakata tepat, dan minim kesalahan',
    'en': 'Varied sentences, precise vocabulary and few errors',
  },
];

EssayItem _disc(String task, String model) => EssayItem(
  title: _discTitle,
  task:
      'Your professor is teaching a class. Write a post responding to the '
      "professor's question. In your response, express and support your "
      'opinion and make a contribution to the discussion in your own '
      'words. An effective response will contain at least 100 words.\n\n'
      '$task',
  minWords: 100,
  modelAnswer: model,
  checklist: _discCheck,
);

final List<EssayItem> toeflDiscussion = [
  _disc(
    '''Professor Hassan (Environmental Policy):
Plastic pollution is one of the biggest environmental challenges we face. Some argue that governments should simply ban single-use plastics such as bags, straws and food containers. Others believe that education campaigns are a better approach because they change people's behavior without restricting choice. Which approach do you think is more effective, and why?

Kelly:
I support a ban. People have known for years that plastic harms the oceans, but most of them still use plastic bags because they are convenient. Education alone is too slow; a law changes behavior immediately.

Marcus:
I think education is better. Bans can hurt small businesses that cannot afford more expensive alternatives. If people understand the problem, they will choose reusable products on their own.''',
    '''I agree with Kelly that a ban is more effective, but I want to add a point that neither Kelly nor Marcus mentioned: bans create a strong incentive for innovation. When a government makes it clear that single-use plastics will disappear, companies start investing in cheaper alternatives, such as packaging made from seaweed or cassava starch. In Indonesia, for example, several start-ups began producing biodegradable bags after some cities banned plastic ones. As production increases, the price of these alternatives falls, which addresses Marcus's concern about small businesses. Of course, education still matters, since people need to understand why the rules exist. However, education works best as support for a ban, not as a replacement for it. Without legal pressure, convenience will almost always win over good intentions.''',
  ),
  _disc(
    '''Professor Lee (Education):
Since the pandemic, many universities offer both online and in-person versions of the same course. Which format do you think leads to better learning for most students: online or in-person classes? Explain your view.

Priya:
In-person classes are better. When I am in a classroom, I can ask questions immediately and discuss ideas with classmates. At home, I get distracted by my phone and lose focus.

Tom:
I prefer online classes. I can watch recorded lectures as many times as I need, and I save two hours a day on commuting, which I use for studying.''',
    '''Both Priya and Tom make valid points, but I believe in-person classes lead to better learning for most students, mainly because of accountability. When students attend a physical class, they have a fixed schedule, they are seen by the professor and they feel some pressure to prepare. In online courses, it is very easy to postpone watching lectures until the night before an exam, and research shows that dropout rates in online courses are much higher. Tom's point about recorded lectures is useful, but this benefit does not require the whole course to be online. Universities could simply record in-person lectures and post them afterwards. That way, students get the structure and interaction of a real classroom and can still review difficult material at their own pace.''',
  ),
  _disc(
    '''Professor Garcia (Urban Planning):
City budgets are limited. If a city government had extra money to spend, which should it prioritize: building more parks and green spaces, or improving public transportation? Explain why.

Amir:
Public transportation should come first. Many people waste hours in traffic every day, and better buses and trains would help them reach work and school more easily. It would also reduce pollution.

Sofia:
I would choose parks. Cities are becoming crowded and stressful, and green spaces give people a place to relax and exercise. They also make neighborhoods more attractive.''',
    '''I would side with Sofia and choose green spaces, but for an additional reason that has not been mentioned: climate adaptation. Many cities are becoming dangerously hot because concrete and asphalt absorb heat, a phenomenon called the urban heat island effect. Parks and tree-lined streets can lower local temperatures by several degrees, which protects elderly people and children during heat waves. Green spaces also absorb rainwater, reducing flooding, which is a serious problem in cities like Jakarta. While I agree with Amir that public transportation is important, transport projects are usually extremely expensive and often funded by national governments or loans. Parks, in contrast, are relatively cheap, can be built quickly, and benefit everyone in the neighborhood, regardless of whether they commute.''',
  ),
  _disc(
    '''Professor Wilson (Higher Education):
Many universities require students to take courses outside their major, for example, requiring engineering students to study history or art. Do you think these general education requirements are a good idea? Why or why not?

Hannah:
Yes, they are valuable. Taking a philosophy course helped me think more critically, and I use those skills in my biology classes. Students should have a broad education.

Jason:
I disagree. University is expensive, and students should spend their time and money on courses that prepare them for their careers. Extra courses just delay graduation.''',
    '''I think general education requirements are a good idea, and I would add a career-related argument to respond to Jason's concern. Most real-world problems require people from different fields to work together. An engineer designing a new dam, for example, must communicate with government officials, understand the history of the local community, and consider the environmental impact. Courses in writing, sociology or ethics prepare students for exactly this kind of collaboration. In fact, employers frequently say that communication and teamwork are the skills new graduates lack most. Therefore, these courses are not a waste of money; they make graduates more employable. That said, universities could reduce Jason's concern by limiting the number of required courses and letting students choose subjects that genuinely interest them.''',
  ),
  _disc(
    '''Professor Chen (Sociology):
Social media platforms promise to bring people together. However, some researchers argue that they actually make people feel more isolated. In your opinion, has social media made people more connected or less connected? Why?

Ryan:
More connected. I moved to a new country for university, and social media is how I stay in touch with my family and old friends every day.

Lucia:
Less connected. People spend hours scrolling through other people's lives instead of meeting friends face to face. Online interactions are shallow compared with real conversations.''',
    '''In my view, social media has made people more connected in quantity but less connected in quality. Ryan is right that it helps us maintain long-distance relationships, and Lucia is right about shallow interactions. However, I think the most important factor is comparison. On platforms like Instagram, people usually post only their best moments, such as holidays, achievements and parties. When users constantly see these idealized images, they often feel that their own lives are boring or unsuccessful, and this can lead to loneliness even when they have hundreds of online friends. Several studies have linked heavy social media use among teenagers to higher rates of anxiety. So the problem is not the technology itself but the way it encourages people to measure themselves against others.''',
  ),
  _disc(
    '''Professor Okafor (Business Management):
Several companies have experimented with a four-day work week, in which employees work four days but receive the same salary. Should more companies adopt this model? Why or why not?

Elena:
Yes. Employees who have a three-day weekend are more rested and motivated, so they work more efficiently. Trials in some countries showed that productivity stayed the same or even increased.

David:
I don't think it works for every business. Hospitals, shops and restaurants need staff every day, so a four-day week would force them to hire more people, which is expensive.''',
    '''I believe more companies should adopt the four-day week, although I agree with David that it cannot work identically everywhere. One benefit that Elena did not mention is recruitment and retention. Replacing an employee is very expensive, because companies must advertise, interview and train new staff. A four-day week is an extremely attractive benefit, so companies that offer it can attract talented workers and keep them longer, which saves money in the long run. As for David's concern, businesses that need staff every day could use rotating schedules, so that each employee works four days while the business stays open seven. Some hospitals in Europe have already tested this approach successfully. Therefore, the model needs flexibility, but it should not be rejected.''',
  ),
  _disc(
    '''Professor Novak (History of Technology):
Many inventions have changed daily life over the past hundred years, such as the airplane, the computer and antibiotics. Which invention from this period do you think has had the greatest impact on society? Explain your choice.

Grace:
I would choose the internet. It has changed how we work, study, shop and communicate. Almost every part of modern life depends on it.

Leo:
I think antibiotics are the most important. Before antibiotics, people could die from a simple infection. They have saved hundreds of millions of lives.''',
    '''Although the internet and antibiotics are both excellent choices, I would argue that the most influential invention is the refrigerator, together with modern refrigeration in general. It may seem ordinary, but it transformed food systems. Refrigeration allows food to be transported over long distances and stored for weeks, which dramatically reduced food poisoning and made fresh fruit, meat and dairy available all year round. It also changed family life: people no longer needed to shop every day, which saved time, especially for women, who traditionally did most of the household work. Moreover, refrigeration is essential for storing vaccines and many medicines, so Leo's antibiotics also depend on it in many cases. In short, refrigeration quietly supports health and modern lifestyles more than we realize.''',
  ),
  _disc(
    '''Professor Ramirez (Urban Studies):
In many growing cities, old buildings are demolished to make space for modern apartments and offices. Some people believe historic buildings should be protected, while others think cities need new housing more. What is your view?

Nadia:
Historic buildings should be protected. They are part of a city's identity and culture. Once they are destroyed, they can never be replaced.

Chris:
Cities need housing more. Rents are rising quickly, and many young people cannot afford a place to live. We cannot keep every old building if people need homes.''',
    '''I think both goals can be achieved through adaptive reuse, which is an option that neither Nadia nor Chris discussed. Instead of demolishing historic buildings, cities can convert them into apartments, offices or student housing while preserving their exterior and character. Old factories and warehouses, for example, have been turned into attractive homes in cities such as Amsterdam and Singapore. This approach keeps the city's identity, which Nadia values, and it also adds housing, which addresses Chris's concern. In addition, reusing a building is usually better for the environment, since constructing a new building produces enormous amounts of carbon emissions from cement and steel. Of course, not every old structure can be converted, but demolition should be the last option rather than the first.''',
  ),
];

// ===================================================================
// PTE Academic – Summarize Written Text
// ===================================================================

const Map<String, String> _swtTitle = {
  'id': 'PTE Summarize Written Text',
  'en': 'PTE Summarize Written Text',
};

const List<Map<String, String>> _swtCheck = [
  {
    'id': 'Hanya SATU kalimat (diawali huruf kapital, diakhiri satu titik)',
    'en':
        'Only ONE sentence (starts with a capital, ends with one full '
        'stop)',
  },
  {'id': 'Panjang 5–75 kata', 'en': 'Between 5 and 75 words'},
  {
    'id': 'Memuat gagasan utama dan poin-poin kunci bacaan',
    'en': 'Includes the main idea and the key supporting points',
  },
  {
    'id':
        'Memakai kata penghubung (while, because, and, although) untuk '
        'menggabungkan ide',
    'en':
        'Uses connectors (while, because, and, although) to combine '
        'ideas',
  },
  {
    'id':
        'Tata bahasa benar dan tidak menyalin detail kecil yang tidak '
        'perlu',
    'en': 'Grammatically correct and avoids copying minor details',
  },
];

EssayItem _swt(String passage, String model) => EssayItem(
  title: _swtTitle,
  task:
      'Read the passage below and summarize it using ONE sentence. Your '
      'response should be between 5 and 75 words.\n\n$passage',
  minWords: 5,
  maxWords: 75,
  modelAnswer: model,
  checklist: _swtCheck,
);

final List<EssayItem> pteSummarizeWritten = [
  _swt(
    '''Cities are often several degrees warmer than the surrounding countryside, a phenomenon known as the urban heat island effect. The main cause is the replacement of natural vegetation with materials such as concrete, asphalt and brick, which absorb sunlight during the day and release it slowly at night. In addition, tall buildings trap heat and reduce wind flow, while vehicles, air conditioners and factories release waste heat directly into the air. As a result, the temperature difference between urban and rural areas is often greatest after sunset.

The consequences are significant. Higher temperatures increase demand for air conditioning, which raises energy consumption and, in turn, greenhouse gas emissions. Heat waves are also more dangerous in cities, where elderly residents and people with chronic illnesses are particularly at risk of heatstroke. Furthermore, warmer conditions can accelerate the formation of ground-level ozone, worsening air quality.

Fortunately, there are effective ways to reduce the effect. Planting trees and creating parks provides shade and cools the air through evaporation. Green roofs, which are covered with plants, can lower the temperature of buildings, and so-called cool roofs, painted in light, reflective colours, bounce sunlight back into the atmosphere. Some cities have also begun using permeable pavements that retain water and stay cooler than conventional asphalt. Urban planners increasingly argue that these measures should be included in all new developments, since they not only reduce heat but also improve residents' health and quality of life.''',
    '''Cities are warmer than rural areas mainly because heat-absorbing materials, tall buildings and waste heat from human activity raise temperatures, which increases energy use, health risks and air pollution, although planting trees, installing green or reflective roofs and using permeable pavements can significantly reduce this urban heat island effect.''',
  ),
  _swt(
    '''For many years, sleep was regarded simply as a period of rest during which the brain was largely inactive. Research over the past few decades, however, has shown that sleep plays a crucial role in learning and memory. During the day, new information is stored temporarily in a region of the brain called the hippocampus. While we sleep, particularly during the deep, slow-wave stage, this information is replayed and gradually transferred to the cortex, where it can be stored for the long term. This process, known as memory consolidation, helps explain why people who sleep after learning remember more than those who stay awake.

Rapid eye movement (REM) sleep, the stage associated with vivid dreaming, appears to serve a different function. Studies suggest that REM sleep helps the brain integrate new memories with existing knowledge, which may support creativity and problem-solving. In one well-known experiment, participants who slept were more than twice as likely to discover a hidden shortcut in a mathematical task as those who remained awake.

These findings have important practical implications, especially for students. Staying up all night before an examination may provide extra hours of study, but it deprives the brain of the very process that turns short-term learning into lasting knowledge. Sleep deprivation also impairs attention and decision-making the following day. Educators therefore recommend spreading study sessions over several days and ensuring sufficient sleep, rather than relying on last-minute cramming.''',
    '''Research shows that sleep is essential for learning because deep sleep transfers new information from the hippocampus to the cortex for long-term storage while REM sleep links new memories with existing knowledge to support creativity, so students should spread their studying over several days and sleep well instead of cramming all night.''',
  ),
  _swt(
    '''Microplastics are plastic fragments smaller than five millimetres in length. Some are manufactured deliberately at this size, such as the tiny beads once common in cosmetics, but most are formed when larger plastic items, including bottles, bags and fishing nets, break down under the influence of sunlight, waves and heat. Synthetic clothing is another major source: every time polyester or nylon garments are washed, thousands of microscopic fibres are released into wastewater, and many of these pass through treatment plants and into rivers and seas.

Once in the environment, microplastics are extremely difficult to remove. They have been found in the deepest ocean trenches, in Arctic ice and in the soil of agricultural land. Marine organisms ranging from plankton to whales ingest them, often mistaking them for food, and the particles can then move up the food chain. Scientists have also detected microplastics in drinking water, salt and even human blood.

The health effects on humans are not yet fully understood. Researchers are concerned that the particles may cause inflammation and that chemicals attached to them could disrupt hormones, but long-term studies are still limited. What is clear is that the quantity of microplastics in the environment is increasing. Experts argue that the most effective response is to reduce plastic production and waste at the source, for example by improving waste management, designing filters for washing machines and restricting single-use plastics.''',
    '''Microplastics, which come mainly from the breakdown of larger plastic items and from synthetic clothing fibres, have spread throughout the environment and food chain and even into human bodies, and although their health effects remain uncertain, experts recommend reducing plastic at the source through better waste management, washing-machine filters and limits on single-use plastics.''',
  ),
  _swt(
    '''It was once widely believed that raising children with two languages would confuse them and slow their development. Early studies conducted in the first half of the twentieth century appeared to support this view, reporting that bilingual children scored lower on intelligence tests. However, these studies were seriously flawed: they often compared children from different social and economic backgrounds and tested bilingual children in a language they did not fully understand.

More recent and carefully designed research has produced a very different picture. Although bilingual children may initially have a slightly smaller vocabulary in each individual language, their total vocabulary across both languages is typically equal to or greater than that of monolingual children, and the gap usually disappears by school age. Moreover, many studies suggest that managing two languages strengthens executive function, the set of mental skills that includes attention control, task switching and working memory. Because bilingual speakers must constantly select one language while suppressing the other, they appear to gain regular practice in controlling their attention.

Some researchers have even suggested that lifelong bilingualism may help protect against the symptoms of dementia, delaying their onset by several years, although this finding remains debated. Overall, the scientific consensus has shifted considerably, and specialists now encourage families to maintain their home language rather than abandon it, since bilingualism offers cultural, social and economic advantages in addition to possible cognitive benefits.''',
    '''Although early flawed studies claimed that bilingualism harmed children's development, modern research shows that bilingual children catch up in vocabulary and may develop stronger executive function and possibly protection against dementia, so experts now encourage families to maintain their home language for its cognitive, cultural and economic benefits.''',
  ),
  _swt(
    '''Coral reefs cover less than one percent of the ocean floor, yet they support around a quarter of all marine species. They also provide food and income for hundreds of millions of people and protect coastlines from storms by reducing the energy of waves. Despite their importance, reefs around the world are in serious decline, and the main threat is rising ocean temperatures.

Corals live in a close partnership with microscopic algae that inhabit their tissues. The algae produce food through photosynthesis and give corals their bright colours. When water temperatures stay even one or two degrees above the normal summer maximum for several weeks, this relationship breaks down: the stressed corals expel the algae and turn white, a process known as bleaching. Bleached corals are not immediately dead, and they can recover if temperatures return to normal quickly. However, if the stress continues, they starve and die. Mass bleaching events, once rare, have become far more frequent, and the Great Barrier Reef has experienced several since 2016.

Local pressures make the situation worse. Pollution from farms, overfishing and destructive fishing methods weaken reefs and reduce their ability to recover. Scientists are experimenting with solutions such as breeding heat-tolerant corals and restoring damaged areas, but they emphasise that these measures can only buy time. Without significant global reductions in greenhouse gas emissions, most of the world's reefs could disappear within this century.''',
    '''Coral reefs, which support a quarter of marine species and protect coastlines, are declining mainly because rising ocean temperatures cause corals to expel their algae and bleach, a problem worsened by pollution and overfishing, and although scientists are developing heat-tolerant corals, reefs can only survive if global greenhouse gas emissions are significantly reduced.''',
  ),
  _swt(
    '''The gig economy refers to a labour market in which short-term, flexible jobs are arranged through digital platforms rather than permanent employment contracts. Ride-hailing drivers, food delivery couriers and freelance designers who find clients online are typical examples. Over the past decade, the number of people earning at least part of their income in this way has grown rapidly, particularly in large cities across Asia, Europe and the Americas.

Supporters argue that gig work offers valuable flexibility. Workers can choose when and how much they work, which suits students, parents with young children and people seeking a second source of income. Platforms also lower the barriers to entering the labour market, allowing individuals with limited qualifications or work experience to start earning quickly. For consumers, the gig economy provides convenient services at competitive prices.

Critics, however, point to significant disadvantages. Because gig workers are usually classified as independent contractors, they often lack the protections that employees receive, such as a minimum wage, sick pay, health insurance and pension contributions. Their income can be unpredictable, since platforms may change payment rates or algorithms without warning. Some studies have found that, after expenses such as fuel and vehicle maintenance are deducted, drivers earn less than the legal minimum wage. In response, several governments have begun introducing regulations that require platforms to provide basic benefits, attempting to preserve flexibility while ensuring that workers are treated fairly.''',
    '''While the rapidly growing gig economy offers workers flexibility, easy entry into the labour market and convenient services for consumers, it often leaves workers without basic protections such as a minimum wage, sick pay and insurance and with unpredictable incomes, which is why some governments are now introducing regulations to balance flexibility with fair treatment.''',
  ),
];

// ===================================================================
// PTE Academic – Write Essay
// ===================================================================

const Map<String, String> _pteEssayTitle = {
  'id': 'PTE Write Essay',
  'en': 'PTE Write Essay',
};

const List<Map<String, String>> _pteEssayCheck = [
  {
    'id': 'Panjang 200–300 kata (di luar rentang ini skor turun tajam)',
    'en':
        'Between 200 and 300 words (scores drop sharply outside this '
        'range)',
  },
  {
    'id': 'Isi menjawab topik secara langsung dengan posisi yang jelas',
    'en': 'Content addresses the prompt directly with a clear position',
  },
  {
    'id': 'Struktur: pendahuluan, 2 paragraf isi, kesimpulan',
    'en': 'Structure: introduction, two body paragraphs, conclusion',
  },
  {
    'id': 'Argumen didukung alasan dan contoh yang relevan',
    'en': 'Arguments are supported with relevant reasons and examples',
  },
  {
    'id': 'Kosakata akademik dan kalimat kompleks yang beragam',
    'en': 'Academic vocabulary and a variety of complex sentences',
  },
  {
    'id': 'Ejaan, tanda baca dan tata bahasa akurat',
    'en': 'Accurate spelling, punctuation and grammar',
  },
];

EssayItem _pte(String prompt, String model) => EssayItem(
  title: _pteEssayTitle,
  task:
      'You will have 20 minutes to plan, write and revise an essay about '
      'the topic below. Your response will be judged on how well you '
      'develop a position, organize your ideas, present supporting details, '
      'and control the elements of standard written English. You should '
      'write 200–300 words.\n\n$prompt',
  minWords: 200,
  maxWords: 300,
  modelAnswer: model,
  checklist: _pteEssayCheck,
);

final List<EssayItem> pteEssay = [
  _pte(
    '''Modern technology allows companies and governments to collect huge amounts of personal data. Some people think this is necessary for better services and security, while others see it as a serious threat to privacy. Discuss both views and give your opinion.''',
    '''In the digital age, almost every online action, from searching the web to paying for coffee, generates personal data. While this information can improve services and public safety, I believe its uncontrolled collection poses a serious threat to privacy that requires stronger regulation.

On the one hand, data collection brings undeniable benefits. Companies use customer information to personalise recommendations, detect fraudulent transactions and design products that better meet people's needs. Governments, meanwhile, rely on data to plan transport networks, track the spread of diseases and prevent crime. During the pandemic, for instance, location data helped health authorities identify outbreaks quickly and allocate medical resources where they were most needed.

On the other hand, the scale of data collection has grown far beyond what most citizens understand or have consented to. Personal information is frequently sold to third parties, used to manipulate consumer behaviour or exposed in large-scale security breaches. In the wrong hands, detailed records of people's movements, health and political views could be used for discrimination or surveillance, undermining fundamental freedoms. Moreover, once data has been leaked, it is almost impossible to retrieve.

In my view, the solution is not to stop collecting data altogether but to regulate it strictly. Organisations should be required to collect only what is necessary, explain clearly how it will be used and face heavy penalties for misuse, as is the case under the European Union's data protection law.

In conclusion, although data collection can make services more efficient and societies safer, privacy must be protected through transparent rules and meaningful accountability.''',
  ),
  _pte(
    '''University education should be free for all students. To what extent do you agree or disagree with this statement? Support your opinion with reasons and examples.''',
    '''The cost of higher education has risen dramatically in many countries, leaving graduates with heavy debts. Consequently, some people argue that university should be free for everyone. While I agree that financial barriers to education must be reduced, I do not believe that completely free tuition for all students is the best approach.

Admittedly, free university education has clear advantages. It allows talented students from low-income families to study without worrying about debt, which promotes social mobility and ensures that ability, rather than wealth, determines who receives higher education. Countries such as Germany and Finland, where tuition is free or very low, also benefit from a highly educated workforce that drives innovation and economic growth.

However, making university free for everyone is extremely expensive, and the cost must ultimately be paid by taxpayers, including many people who never attend university themselves. In countries with limited public budgets, such funding might be better spent on primary schools, healthcare or vocational training, which benefit a larger share of the population. Furthermore, free tuition often benefits wealthier families most, because their children are already more likely to go to university.

A fairer solution would be a targeted system. Governments could provide full scholarships to students from low-income backgrounds and offer income-contingent loans to others, which are repaid only when graduates earn above a certain salary. This approach protects access while sharing costs fairly.

In conclusion, although no capable student should be excluded from university because of cost, a well-designed system of scholarships and fair loans is more sustainable and equitable than free education for all.''',
  ),
  _pte(
    '''Some people believe that individuals can do little to address climate change and that only governments and large companies can make a real difference. To what extent do you agree or disagree?''',
    '''Climate change is a global problem caused largely by industrial activity, which leads some people to conclude that individual actions are meaningless. While I agree that governments and corporations bear the greatest responsibility, I disagree that individuals can do little.

It is true that the most significant changes must come from those with power and resources. A relatively small number of companies are responsible for a large share of global emissions, and only governments can introduce carbon taxes, invest in renewable energy and set binding targets for industry. Compared with the closure of a single coal-fired power station, one person's decision to stop using plastic straws has a negligible effect on emissions.

Nevertheless, individuals influence climate policy in several important ways. First, collective consumer choices shape markets. When millions of people choose electric vehicles, plant-based food or energy-efficient appliances, companies respond by expanding these products and reducing their prices. Second, individuals are also voters and employees. Citizens who demand climate action can push politicians to adopt stronger policies, as the global youth climate strikes inspired by Greta Thunberg demonstrated. Similarly, employees can pressure their own organisations to reduce emissions. Finally, personal behaviour spreads socially; when people see their neighbours installing solar panels, they are more likely to do the same.

In conclusion, although governments and corporations have the greatest capacity to reduce emissions, individuals are far from powerless. Through their consumption, votes and influence on others, ordinary people play an essential role in driving the changes needed to address climate change.''',
  ),
  _pte(
    '''Advertising aimed at children should be banned. Do you agree or disagree? Support your argument with reasons and relevant examples.''',
    '''Children today are exposed to thousands of advertisements every year, not only on television but also on video platforms, games and social media. I strongly agree that advertising directed at children should be banned, as young audiences are particularly vulnerable to persuasion.

The main reason for a ban is that children cannot properly understand the purpose of advertising. Research suggests that children under the age of about eight struggle to distinguish adverts from entertainment and tend to accept their messages as true. Online, this problem is even more serious because advertising is often disguised as content, for example when popular young influencers promote toys or snacks in their videos. Exploiting this lack of critical awareness to sell products is ethically questionable.

Furthermore, much of the advertising aimed at children promotes unhealthy products. Fast food, sugary drinks and confectionery are among the most heavily advertised items, and studies have linked exposure to such marketing with higher consumption of junk food and rising rates of childhood obesity. Advertising also encourages materialism and creates pressure on parents, who face constant demands for the latest toys or gadgets.

Opponents argue that a ban would reduce funding for children's television and limit commercial freedom. However, countries such as Norway and Sweden have restricted advertising to children for decades without any collapse in children's programming, which shows that alternative funding models are possible.

In conclusion, because children are easily influenced and often targeted with unhealthy products, a ban on advertising aimed at them is a justified measure to protect their health and well-being.''',
  ),
  _pte(
    '''Some people think museums and art galleries should be free for everyone, while others believe visitors should pay an entrance fee. Discuss both sides and give your own opinion.''',
    '''Museums and art galleries preserve a society's history and creativity, but maintaining them is costly. There is therefore ongoing debate about whether visitors should be charged for entry. In my opinion, public museums should be free, at least for their permanent collections.

Those who support entrance fees make a practical argument. Museums must pay for staff, security, conservation and climate control, and admission charges provide a reliable source of income, reducing the burden on public budgets. Fees can also limit overcrowding at popular sites, protecting fragile artworks and improving the visitor experience. In addition, some people argue that those who use a service should contribute to its cost, rather than expecting all taxpayers to pay.

However, I believe the benefits of free access outweigh these concerns. Museums are educational institutions, and charging for entry discourages precisely the people who could benefit most, such as low-income families, students and young people who have never visited a museum before. When the United Kingdom abolished entrance fees to its national museums in 2001, visitor numbers increased dramatically, with some museums seeing their attendance more than double. Free museums also strengthen social cohesion by giving everyone equal access to their shared heritage.

Funding concerns can be addressed in other ways. Museums can charge for special exhibitions, encourage voluntary donations and earn income from shops, cafés and events.

In conclusion, although entrance fees provide useful revenue, free admission ensures that culture and history remain accessible to all citizens, and this public value justifies the cost.''',
  ),
  _pte(
    '''More and more students choose to study abroad. Do the advantages of studying in another country outweigh the disadvantages? Support your answer with examples.''',
    '''The number of students pursuing degrees overseas has grown rapidly, with destinations such as Australia, the United Kingdom and Japan attracting hundreds of thousands of international learners each year. Although studying abroad presents real challenges, I believe its advantages are considerably greater.

The most important benefit is access to high-quality education and resources. Many students go abroad to attend leading universities, learn from experts in their field and use advanced laboratories that may not be available in their home country. Studying in a foreign language also accelerates language learning far more effectively than classroom lessons alone. Beyond academic gains, living independently in a new culture develops maturity, adaptability and problem-solving skills, while friendships with classmates from different countries create international networks that can prove valuable throughout a career.

Nevertheless, there are significant disadvantages. Tuition fees and living costs abroad are often extremely high, placing a heavy financial burden on families, and scholarships are limited. Many students also experience homesickness, loneliness and culture shock, particularly during their first year, which can affect both their well-being and their academic performance. In addition, some countries worry about a brain drain, as talented graduates may choose to remain overseas rather than return home.

However, these drawbacks can often be managed. Students can apply for scholarships, choose more affordable destinations, and use university support services to adjust to their new environment, while governments can offer incentives for graduates to return.

In conclusion, despite the financial and emotional challenges, studying abroad offers academic, personal and professional benefits that make it a worthwhile investment for many students.''',
  ),
  _pte(
    '''In the past, many people worked for the same company for their whole career. Today, people change jobs much more frequently. What are the reasons for this change, and is it a positive or negative trend?''',
    '''A generation ago, it was common for employees to join a company after leaving school and stay there until retirement. Today, by contrast, many workers change jobs every few years. This essay will examine why this shift has occurred and argue that it is largely a positive development.

Several factors explain the trend. Firstly, the economy has become far less stable. Technological change and global competition mean that companies restructure frequently, so employers no longer offer the lifelong security they once did, and workers in turn feel less loyalty. Secondly, changing jobs is often the fastest way to increase salary and gain promotion, since external candidates can negotiate better terms than internal staff. Finally, younger generations tend to value personal growth, meaningful work and work-life balance, and they are willing to move if their current position does not meet these expectations. Online job platforms such as LinkedIn have also made it much easier to find new opportunities.

In my view, this trend is mostly beneficial. Moving between organisations allows workers to develop a broader range of skills, build wider professional networks and adapt to a rapidly changing labour market. Companies also benefit from new employees who bring fresh ideas and experience from elsewhere. Admittedly, frequent job changes can create insecurity, and employers may hesitate to invest in training staff who might leave soon. However, these disadvantages are outweighed by the flexibility and opportunities that mobility provides.

In conclusion, people change jobs more often because of economic instability, financial incentives and changing values, and overall, this greater mobility benefits both workers and the economy.''',
  ),
  _pte(
    '''Many countries are moving towards a cashless society in which almost all payments are made electronically. Do the benefits of this development outweigh the drawbacks?''',
    '''In many countries, digital wallets, bank cards and QR code payments have rapidly replaced cash. In Indonesia, for instance, systems such as QRIS now allow customers to pay at small street stalls using their phones. Although a cashless society offers clear advantages, I believe its drawbacks are serious enough that cash should not disappear completely.

The benefits of electronic payments are considerable. They are fast and convenient, since consumers no longer need to carry money or wait for change. Digital transactions also leave a record, which makes it harder to hide income, reduces tax evasion and helps authorities detect money laundering and corruption. For businesses, cashless systems lower the risk of theft and eliminate the cost of handling and transporting cash. During the pandemic, contactless payments were also seen as more hygienic.

However, a fully cashless society would create new problems. Many elderly people, rural residents and low-income citizens lack smartphones, stable internet access or bank accounts, so eliminating cash could exclude them from basic economic activities. Electronic systems are also vulnerable to technical failures and cyberattacks; when a payment network goes down, people may be unable to buy food or medicine. Furthermore, every digital payment can be tracked, raising concerns about privacy and the possible misuse of financial data by companies or governments.

Therefore, I believe the best approach is to encourage digital payments while legally guaranteeing that cash remains accepted for essential goods and services.

In conclusion, although cashless payments bring efficiency and transparency, the risks of exclusion, system failure and surveillance mean that their benefits do not fully outweigh the drawbacks unless cash remains available as an alternative.''',
  ),
];
