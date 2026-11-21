import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../data/ja_gloss_cards.dart';
import '../../l10n/app_strings.dart';
import '../../models/course.dart';
import '../../models/guide.dart';
import '../../providers/auth_provider.dart';
import '../../services/ja_gloss.dart';
import '../../services/tts_service.dart';
import '../../theme.dart';
import '../../widgets/ja_particle_text.dart';
import '../materials/vocab_detail_sheet.dart';

/// Warna garis kata isi (bergantian), partikel memakai warnanya sendiri.
const _wordColors = [Color(0xFF4DD0B5), Color(0xFFF08A8A), Color(0xFFB39DF5)];

/// "Kalimat Sehari-hari" (Jepang): daftar kartu situasi (Pagi hari, Di
/// sekolah, Belanja, …) dalam grid 3 kolom. Ketuk kartu → layar kalimat
/// ([SentenceCardScreen]) berisi 10–12 kalimat pendek dengan arti per kata.
class SentenceGlossScreen extends StatefulWidget {
  final Course course;
  const SentenceGlossScreen({super.key, required this.course});

  @override
  State<SentenceGlossScreen> createState() => _SentenceGlossScreenState();
}

class _SentenceGlossScreenState extends State<SentenceGlossScreen> {
  late final List<String> _levels = {
    for (final c in kJaGlossCards) c.level,
  }.toList();
  late String _level = _levels.first;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final cards = [
      for (final c in kJaGlossCards)
        if (c.level == _level) c,
    ];

    return Scaffold(
      appBar: AppBar(title: Text(l.t('gloss_title'))),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            sliver: SliverList.list(
              children: [
                if (_levels.length > 1)
                  Wrap(
                    spacing: 8,
                    children: [
                      for (final lv in _levels)
                        ChoiceChip(
                          label: Text(lv),
                          selected: _level == lv,
                          onSelected: (_) => setState(() => _level = lv),
                        ),
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 6, 4, 6),
                  child: Text(
                    l.t('gloss_pick_card'),
                    style: TextStyle(
                      fontSize: 12.5,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          for (final kind in GlossKind.values)
            if (cards.any((c) => c.kind == kind)) ...[
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 10, 16, 8),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    l.t('gloss_kind_${kind.name}'),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                sliver: SliverGrid.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.74,
                  children: [
                    for (final c in cards)
                      if (c.kind == kind)
                        _CardTile(
                          card: c,
                          title: c.title[l.code] ?? c.title['id']!,
                          subtitle: l
                              .t('gloss_card_count')
                              .replaceFirst('{n}', '${c.lines.length}'),
                          locked: false,
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => SentenceCardScreen(
                                course: widget.course,
                                card: c,
                              ),
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            ],
          const SliverPadding(padding: EdgeInsets.only(bottom: 24)),
        ],
      ),
    );
  }
}

/// Ubin kartu di grid: emoji, judul situasi, jumlah kalimat; 👑 = terkunci.
class _CardTile extends StatelessWidget {
  final GlossCardData card;
  final String title;
  final String subtitle;
  final bool locked;
  final VoidCallback onTap;

  const _CardTile({
    required this.card,
    required this.title,
    required this.subtitle,
    required this.locked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final hint = Theme.of(context).hintColor;
    final accent = _tileAccents[card.id.hashCode.abs() % _tileAccents.length];
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 14, 8, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Ikon dalam lingkaran berwarna, posisi tetap di atas.
                  Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: accent.withValues(alpha: locked ? 0.08 : 0.18),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Opacity(
                        opacity: locked ? 0.4 : 1,
                        child: Text(
                          card.emoji,
                          style: const TextStyle(fontSize: 26),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Judul selalu dua baris → semua ubin sejajar.
                  Expanded(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      // Judul panjang (cerita) → 3 baris, huruf sedikit kecil.
                      maxLines: title.length > 18 ? 3 : 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: title.length > 18 ? 11.5 : 13,
                        fontWeight: FontWeight.w900,
                        height: 1.2,
                        color: locked ? hint : null,
                      ),
                    ),
                  ),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11, color: hint),
                  ),
                ],
              ),
            ),
            if (locked)
              const Positioned(
                top: 6,
                right: 8,
                child: Text('👑', style: TextStyle(fontSize: 13)),
              ),
          ],
        ),
      ),
    );
  }
}

/// Warna lingkaran ikon ubin (bergantian per kartu).
const _tileAccents = [
  DuoColors.blue,
  DuoColors.green,
  DuoColors.orange,
  DuoColors.purple,
  DuoColors.red,
  DuoColors.yellow,
];

/// Isi satu kartu: semua kalimatnya, dengan mode tebak di AppBar.
class SentenceCardScreen extends StatefulWidget {
  final Course course;
  final GlossCardData card;
  const SentenceCardScreen({
    super.key,
    required this.course,
    required this.card,
  });

  @override
  State<SentenceCardScreen> createState() => _SentenceCardScreenState();
}

class _SentenceCardScreenState extends State<SentenceCardScreen> {
  /// Nama pengguna yang login (null bila belum login / tanpa provider).
  static String? _userName(BuildContext context) {
    try {
      return context.watch<AuthProvider>().name;
    } on ProviderNotFoundException {
      return null;
    }
  }

  bool _guess = false;

  /// Layar penuh: AppBar & bilah sistem disembunyikan, hanya kartu.
  bool _full = false;

  void _setFull(bool full) {
    setState(() => _full = full);
    SystemChrome.setEnabledSystemUIMode(
      full ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge,
    );
  }

  @override
  void dispose() {
    if (_full) SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  void _speak(String text) {
    HapticFeedback.selectionClick();
    TtsService.instance.speak(text, widget.course.ttsLocale);
  }

  void _openWord(GlossToken t) {
    final v = t.vocab;
    if (v == null) {
      _speak(t.text);
      return;
    }
    showVocabDetail(
      context,
      courseId: widget.course.id,
      ttsLocale: widget.course.ttsLocale,
      word: GuideExample(v.kana, v.meaning, romaji: v.romaji),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final c = widget.card;
    final title = c.title[l.code] ?? c.title['id']!;
    final userName = _userName(context);
    final guessButton = IconButton(
      tooltip: l.t('gloss_guess_mode'),
      isSelected: _guess,
      icon: const Icon(Icons.visibility_rounded),
      selectedIcon: const Icon(Icons.visibility_off_rounded),
      onPressed: () => setState(() => _guess = !_guess),
    );
    final board = _SentenceBoard(
      // Ganti mode tebak → kalimat mulai tertutup lagi.
      key: ValueKey(_guess),
      card: c,
      title: title,
      levelLabel: c.level,
      guess: _guess,
      userName: userName,
      uiLang: l.code,
      onSpeak: _speak,
      onWord: _openWord,
    );

    if (_full) {
      return PopScope(
        // Tombol kembali keluar dari layar penuh dulu.
        canPop: false,
        onPopInvokedWithResult: (didPop, _) {
          if (!didPop) _setFull(false);
        },
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                // Semua kalimat diperkecil seperlunya agar muat satu layar
                // (tanpa gulir), seperti kartu belajar.
                // Kartu memenuhi layar: ukuran huruf disesuaikan supaya
                // semua kalimat muat tanpa gulir, sisa ruang dibagi rata.
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 64),
                  child: LayoutBuilder(
                    builder: (context, box) => _FitBoard(
                      width: box.maxWidth,
                      height: box.maxHeight,
                      builder: (fill) => _SentenceBoard(
                        key: ValueKey('full|$_guess|${fill != null}'),
                        card: c,
                        title: title,
                        levelLabel: c.level,
                        guess: _guess,
                        compact: true,
                        fillHeight: fill,
                        userName: userName,
                        uiLang: l.code,
                        onSpeak: _speak,
                        onWord: _openWord,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 16,
                  child: Material(
                    color: Theme.of(context).cardColor.withValues(alpha: 0.9),
                    shape: const StadiumBorder(),
                    elevation: 2,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        guessButton,
                        IconButton(
                          tooltip: l.t('gloss_exit_full'),
                          icon: const Icon(Icons.fullscreen_exit_rounded),
                          onPressed: () => _setFull(false),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${c.emoji} $title'),
        actions: [
          guessButton,
          IconButton(
            tooltip: l.t('gloss_full'),
            icon: const Icon(Icons.fullscreen_rounded),
            onPressed: () => _setFull(true),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 32),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 6, 4, 0),
            child: Text(
              l.t(_guess ? 'gloss_hint_guess' : 'gloss_hint'),
              style: TextStyle(
                fontSize: 12.5,
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
          board,
        ],
      ),
    );
  }
}

/// Memuat kartu tepat satu layar ([width] × [height]) tanpa gulir:
/// kartu disusun pada lebar [width]/s lalu diperkecil utuh sebesar s,
/// sehingga hasilnya tetap selebar layar. s dicari dengan mengukur salinan
/// tak terlihat; sisa tinggi dibagi rata di antara kalimat.
class _FitBoard extends StatefulWidget {
  final double width;
  final double height;
  final Widget Function(double? fillHeight) builder;
  const _FitBoard({
    required this.width,
    required this.height,
    required this.builder,
  });

  @override
  State<_FitBoard> createState() => _FitBoardState();
}

class _FitBoardState extends State<_FitBoard> {
  final _measure = GlobalKey();
  double _s = 1;
  int _rounds = 0;

  /// Sudah diukur & muat → kartu boleh ditampilkan setinggi layar.
  bool _ready = false;

  @override
  void didUpdateWidget(_FitBoard old) {
    super.didUpdateWidget(old);
    if (old.width != widget.width || old.height != widget.height) {
      _s = 1;
      _rounds = 0;
      _ready = false;
    }
  }

  bool _fits = true;

  void _check() {
    final box = _measure.currentContext?.findRenderObject() as RenderBox?;
    if (!mounted || box == null || !box.hasSize) return;
    final scaled = box.size.height * _s;
    _fits = scaled <= widget.height + 0.5;
    // Makin lebar susunannya, makin pendek (lebih sedikit baris patah),
    // jadi s dikoreksi beberapa putaran sampai muat.
    if (scaled > widget.height && _rounds < 10) {
      _rounds++;
      setState(() => _s = (_s * widget.height / scaled * 0.99).clamp(0.4, 1));
    } else if (!_ready) {
      setState(() => _ready = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _check());
    final w = widget.width / _s;
    final h = widget.height / _s;
    return Stack(
      children: [
        // Salinan pengukur (tidak digambar).
        Offstage(
          child: OverflowBox(
            alignment: Alignment.topLeft,
            maxWidth: w,
            maxHeight: double.infinity,
            child: SizedBox(
              key: _measure,
              width: w,
              child: widget.builder(null),
            ),
          ),
        ),
        if (_ready)
          FittedBox(
            fit: BoxFit.contain,
            alignment: Alignment.topCenter,
            // Bila tetap kebesaran di skala terkecil, susun tanpa tinggi
            // tetap lalu perkecil utuh (tidak pernah terpotong).
            child: SizedBox(
              width: w,
              height: _fits ? h : null,
              child: widget.builder(_fits ? h : null),
            ),
          ),
      ],
    );
  }
}

/// Satu kartu belajar: judul tema + level, lalu kalimat-kalimatnya.
class _SentenceBoard extends StatefulWidget {
  final GlossCardData card;
  final String title;
  final String levelLabel;
  final bool guess;

  /// Layar penuh: tanpa terjemahan, keterangan & tombol 🔊 (ketuk baris
  /// untuk dengar), supaya semua kalimat muat satu layar.
  final bool compact;

  /// Layar penuh: tinggi kartu tetap (= layar), kalimat dibagi rata.
  final double? fillHeight;

  /// Nama pengguna untuk kalimat perkenalan ({name}).
  final String? userName;
  final String uiLang;
  final ValueChanged<String> onSpeak;
  final ValueChanged<GlossToken> onWord;

  const _SentenceBoard({
    super.key,
    required this.card,
    required this.title,
    required this.levelLabel,
    required this.guess,
    this.compact = false,
    this.fillHeight,
    this.userName,
    required this.uiLang,
    required this.onSpeak,
    required this.onWord,
  });

  @override
  State<_SentenceBoard> createState() => _SentenceBoardState();
}

class _SentenceBoardState extends State<_SentenceBoard> {
  /// "kalimat|kata" yang sudah dibuka di mode tebak.
  final Set<String> _revealed = {};
  final Set<int> _shownMeaning = {};

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final hint = Theme.of(context).hintColor;
    final c = widget.card;
    final lines = glossCardLines(c, userName: widget.userName);

    final compact = widget.compact;
    final header = Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Column(
        children: [
          Text(
            l.t('gloss_board_title').toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '${widget.title}  •  ${widget.levelLabel}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13.5, color: hint),
          ),
        ],
      ),
    );
    final fill = widget.fillHeight;
    if (compact && fill != null) {
      return Card(
        margin: EdgeInsets.zero,
        child: SizedBox(
          height: fill,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                header,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (var si = 0; si < lines.length; si++)
                        _sentenceRow(context, si, lines[si], hint, l),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Card(
      margin: EdgeInsets.only(top: compact ? 0 : 12),
      child: Padding(
        padding: EdgeInsets.only(bottom: compact ? 14 : 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            header,
            for (var si = 0; si < lines.length; si++) ...[
              if (si > 0 && !compact)
                Divider(
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                  color: hint.withValues(alpha: 0.15),
                ),
              _sentenceRow(context, si, lines[si], hint, l),
            ],
            // Keterangan partikel sekali saja untuk satu kartu.
            if (!widget.guess && !compact)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(12, 6, 12, 10),
                  decoration: BoxDecoration(
                    color: hint.withValues(alpha: 0.07),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ParticleLegend(
                    marks: [
                      for (final line in lines)
                        for (final t in line.tokens) t.particle,
                    ],
                    uiLang: widget.uiLang,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _sentenceRow(
    BuildContext context,
    int si,
    GlossedLine s,
    Color hint,
    L l,
  ) {
    final tokens = s.tokens;
    var wordIndex = 0;
    final hidden = widget.guess && !_shownMeaning.contains(si);
    final compact = widget.compact;
    final words = Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (var i = 0; i < tokens.length; i++)
          _TokenView(
            token: tokens[i],
            color:
                tokens[i].particle?.color ??
                _wordColors[wordIndex++ % _wordColors.length],
            uiLang: widget.uiLang,
            compact: compact,
            hidden:
                widget.guess &&
                tokens[i].gloss != null &&
                !_revealed.contains('$si|$i'),
            onTap: () {
              if (widget.guess &&
                  tokens[i].gloss != null &&
                  !_revealed.contains('$si|$i')) {
                setState(() => _revealed.add('$si|$i'));
              } else {
                widget.onWord(tokens[i]);
              }
            },
          ),
      ],
    );
    void revealAll() => setState(() {
      _shownMeaning.add(si);
      for (var i = 0; i < tokens.length; i++) {
        _revealed.add('$si|$i');
      }
    });
    final meaning = hidden
        ? GestureDetector(
            onTap: revealAll,
            child: Text(
              '👁 ${l.t('gloss_show_meaning')}',
              style: const TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w800,
                color: DuoColors.blue,
              ),
            ),
          )
        : Text(
            s.line.meaning[widget.uiLang] ?? s.line.meaning['id']!,
            style: TextStyle(
              fontSize: compact ? 12 : 13,
              fontStyle: FontStyle.italic,
              color: hint,
            ),
          );
    if (compact) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => widget.onSpeak(s.line.text.replaceAll(' ', '')),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [words, const SizedBox(height: 4), meaning],
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 4, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [words, const SizedBox(height: 8), meaning],
            ),
          ),
          IconButton(
            tooltip: l.t('gloss_listen'),
            visualDensity: VisualDensity.compact,
            padding: const EdgeInsets.only(top: 4),
            icon: const Icon(
              Icons.volume_up_rounded,
              color: DuoColors.blue,
              size: 22,
            ),
            onPressed: () => widget.onSpeak(s.line.text.replaceAll(' ', '')),
          ),
        ],
      ),
    );
  }
}

/// Satu kata: teks, garis warna, arti kecil di bawahnya.
class _TokenView extends StatelessWidget {
  final GlossToken token;
  final Color color;
  final String uiLang;
  final bool hidden;
  final VoidCallback onTap;

  /// Layar penuh: huruf sedikit lebih kecil supaya semua kalimat muat.
  final bool compact;

  const _TokenView({
    required this.token,
    required this.color,
    required this.uiLang,
    this.compact = false,
    required this.hidden,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final hint = Theme.of(context).hintColor;
    final gloss = token.gloss;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              token.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: compact ? 17 : 20,
                fontWeight: FontWeight.w900,
                color: token.particle?.color,
              ),
            ),
            const SizedBox(height: 3),
            Container(
              height: 3.5,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 4),
            if (gloss != null)
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 120),
                child: Text(
                  hidden ? '？' : gloss[uiLang] ?? gloss['id']!,
                  textAlign: TextAlign.center,
                  style: hidden
                      ? TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          color: color,
                        )
                      : TextStyle(fontSize: compact ? 10.5 : 11.5, color: hint),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
