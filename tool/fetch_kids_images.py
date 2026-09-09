#!/usr/bin/env python3
"""Unduh gambar mode anak dari Microsoft Fluent Emoji (lisensi MIT) dan
konversi ke WebP di assets/images/kids/.

    python3 tool/fetch_kids_images.py                 # hanya yang belum ada
    python3 tool/fetch_kids_images.py --force         # unduh & konversi ulang
    python3 tool/fetch_kids_images.py --check         # cek nama tanpa unduh
    python3 tool/fetch_kids_images.py --style 3d      # PNG 3D asli (256 px)
    python3 tool/fetch_kids_images.py --size 512      # ukuran render SVG

Gaya bawaan "color": SVG Fluent dirender ke PNG --size px (bawaan 768)
lewat `qlmanage` (bawaan macOS), lalu ke WebP — tajam di layar 3x.
Gaya "3d": PNG 3D asli yang hanya 256 px.

Daftar gambar: tool/kids_images.txt (nama folder Fluent, satu per baris,
"# kategori" sebagai pemisah). Nama file WebP = nama Fluent yang di-slug:
"Red apple" -> red_apple.webp. Aplikasi merujuk gambar lewat slug itu.

Hasil sampingan:
- assets/images/kids/manifest.json  {slug: kategori} untuk aplikasi
- assets/images/kids/LICENSE-fluentui-emoji.txt  wajib disertakan (MIT)

Butuh `cwebp` (brew install webp).
"""

from __future__ import annotations

import json
import re
import subprocess
import sys
import tempfile
import urllib.error
import urllib.parse
import urllib.request
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
LIST_FILE = ROOT / "tool" / "kids_images.txt"
OUT_DIR = ROOT / "assets" / "images" / "kids"
REPO = "https://raw.githubusercontent.com/microsoft/fluentui-emoji/main"
TREE_API = "https://api.github.com/repos/microsoft/fluentui-emoji/git/trees/main"
QUALITY = "80"
WORKERS = 8


def arg_value(flag: str, default: str) -> str:
    if flag in sys.argv:
        i = sys.argv.index(flag)
        if i + 1 < len(sys.argv):
            return sys.argv[i + 1]
    return default


def repo_slug(name: str) -> str:
    """Penamaan file di repo Fluent: huruf kecil, spasi jadi garis
    bawah, tanda hubung dipertahankan ("T-rex" -> "t-rex_3d.png")."""
    return re.sub(r"[^a-z0-9_\-]", "", name.lower().replace(" ", "_"))


def slugify(name: str) -> str:
    """Nama file lokal / id gambar di aplikasi: seperti [repo_slug] tapi
    tanda hubung juga jadi garis bawah ("T-rex" -> "t_rex")."""
    return repo_slug(name).replace("-", "_")


def read_list() -> list[tuple[str, str]]:
    """[(nama_fluent, kategori)] dari kids_images.txt, tanpa duplikat."""
    items: list[tuple[str, str]] = []
    seen: set[str] = set()
    category = "lainnya"
    for raw in LIST_FILE.read_text(encoding="utf-8").splitlines():
        line = raw.strip()
        if not line:
            continue
        if line.startswith("#"):
            label = line.lstrip("#").strip()
            # Komentar penjelasan (kalimat panjang) bukan kategori.
            if label and len(label.split()) == 1:
                category = label.lower()
            continue
        if line in seen:
            continue
        seen.add(line)
        items.append((line, category))
    return items


def fetch_folder_names() -> set[str] | None:
    """Daftar folder assets/ di repo, untuk validasi nama sebelum unduh."""
    try:
        with urllib.request.urlopen(TREE_API, timeout=20) as r:
            top = json.load(r)
        sha = next(t["sha"] for t in top["tree"] if t["path"] == "assets")
        with urllib.request.urlopen(
            f"https://api.github.com/repos/microsoft/fluentui-emoji/git/trees/{sha}",
            timeout=30,
        ) as r:
            return {t["path"] for t in json.load(r)["tree"]}
    except Exception as e:  # rate limit / offline: lanjut tanpa validasi
        print(f"  (validasi nama dilewati: {e})")
        return None


def candidate_urls(name: str, style: str) -> list[str]:
    slug = repo_slug(name)
    folder = urllib.parse.quote(name)
    if style == "3d":
        return [
            # Emoji biasa: assets/Deer/3D/deer_3d.png
            f"{REPO}/assets/{folder}/3D/{slug}_3d.png",
            # Emoji berwarna kulit: assets/Ear/Default/3D/ear_3d_default.png
            f"{REPO}/assets/{folder}/Default/3D/{slug}_3d_default.png",
        ]
    return [
        # Emoji biasa: assets/Deer/Color/deer_color.svg
        f"{REPO}/assets/{folder}/Color/{slug}_color.svg",
        # Emoji berwarna kulit: assets/Ear/Default/Color/ear_color_default.svg
        f"{REPO}/assets/{folder}/Default/Color/{slug}_color_default.svg",
    ]


def download(name: str, dest: Path, style: str) -> str | None:
    """Unduh sumber ke dest. Mengembalikan pesan galat, None jika sukses."""
    last = "tidak ditemukan"
    for url in candidate_urls(name, style):
        try:
            with urllib.request.urlopen(url, timeout=30) as r:
                dest.write_bytes(r.read())
            return None
        except urllib.error.HTTPError as e:
            last = f"HTTP {e.code}"
            if e.code != 404:
                return last
        except Exception as e:
            return str(e)
    return last


def render_svg(svg: Path, size: int) -> Path | None:
    """Render SVG ke PNG size x size lewat qlmanage. SVG Fluent memakai
    width/height 32 px, jadi atributnya ditimpa dulu supaya qlmanage
    tidak merender kecil di tengah kanvas."""
    text = svg.read_text(encoding="utf-8")
    text = re.sub(r'width="\d+(\.\d+)?"', f'width="{size}"', text, count=1)
    text = re.sub(r'height="\d+(\.\d+)?"', f'height="{size}"', text, count=1)
    big = svg.with_name(svg.stem + "_big.svg")
    big.write_text(text, encoding="utf-8")
    proc = subprocess.run(
        ["qlmanage", "-t", "-s", str(size), "-o", str(svg.parent), str(big)],
        capture_output=True, text=True,
    )
    png = svg.parent / (big.name + ".png")
    return png if proc.returncode == 0 and png.exists() else None


def to_webp(src: Path, dst: Path) -> str | None:
    proc = subprocess.run(
        ["cwebp", "-quiet", "-q", QUALITY, "-metadata", "none",
         str(src), "-o", str(dst)],
        capture_output=True, text=True,
    )
    return None if proc.returncode == 0 else proc.stderr.strip()


def process(name: str, tmp: Path, force: bool, style: str,
            size: int) -> tuple[str, str | None]:
    slug = slugify(name)
    out = OUT_DIR / f"{slug}.webp"
    if out.exists() and not force:
        return slug, "ada"
    if style == "3d":
        src = tmp / f"{slug}.png"
        err = download(name, src, style)
        if err:
            return slug, f"gagal unduh: {err}"
    else:
        svg = tmp / f"{slug}.svg"
        err = download(name, svg, style)
        if err:
            return slug, f"gagal unduh: {err}"
        rendered = render_svg(svg, size)
        if rendered is None:
            return slug, "gagal render SVG (qlmanage)"
        src = rendered
    err = to_webp(src, out)
    if err:
        return slug, f"gagal konversi: {err}"
    return slug, None


def write_license() -> None:
    dst = OUT_DIR / "LICENSE-fluentui-emoji.txt"
    if dst.exists():
        return
    try:
        with urllib.request.urlopen(f"{REPO}/LICENSE", timeout=20) as r:
            text = r.read().decode("utf-8")
        header = ("Gambar di folder ini berasal dari Microsoft Fluent Emoji "
                  "(https://github.com/microsoft/fluentui-emoji),\n"
                  "dirender/dikonversi ke WebP. Lisensi asli (MIT) di bawah "
                  "ini.\n\n")
        dst.write_text(header + text, encoding="utf-8")
    except Exception as e:
        print(f"  (LICENSE tidak terunduh: {e})")


def main() -> int:
    force = "--force" in sys.argv
    check = "--check" in sys.argv
    style = arg_value("--style", "color").lower()
    size = int(arg_value("--size", "768"))
    if style not in ("color", "3d"):
        print("--style harus 'color' atau '3d'")
        return 1
    items = read_list()
    print(f"{len(items)} gambar terdaftar di {LIST_FILE.relative_to(ROOT)} "
          f"(gaya {style}" + ("" if style == "3d" else f", {size} px") + ")")

    names = fetch_folder_names()
    if names is not None:
        unknown = [n for n, _ in items if n not in names]
        if unknown:
            print(f"  {len(unknown)} nama tidak ada di repo Fluent:")
            for n in unknown:
                print(f"    - {n}")
        items = [(n, c) for n, c in items if n in names]
    if check:
        return 0
    for tool in ["cwebp"] + (["qlmanage"] if style != "3d" else []):
        if subprocess.run(["which", tool], capture_output=True).returncode:
            print(f"{tool} tidak ditemukan." +
                  (" Instal: brew install webp" if tool == "cwebp" else
                   " (qlmanage hanya ada di macOS; pakai --style 3d)"))
            return 1

    OUT_DIR.mkdir(parents=True, exist_ok=True)
    ok = skipped = 0
    failed: list[tuple[str, str]] = []
    manifest: dict[str, str] = {}
    with tempfile.TemporaryDirectory() as tmpdir:
        tmp = Path(tmpdir)
        with ThreadPoolExecutor(max_workers=WORKERS) as pool:
            results = pool.map(
                lambda it: (it, process(it[0], tmp, force, style, size)),
                items)
            for (name, category), (slug, status) in results:
                if status is None:
                    ok += 1
                    manifest[slug] = category
                elif status == "ada":
                    skipped += 1
                    manifest[slug] = category
                else:
                    failed.append((name, status))

    (OUT_DIR / "manifest.json").write_text(
        json.dumps(manifest, indent=1, ensure_ascii=False, sort_keys=True)
        + "\n",
        encoding="utf-8",
    )
    write_license()

    total = sum(p.stat().st_size for p in OUT_DIR.glob("*.webp"))
    print(f"selesai: {ok} baru, {skipped} sudah ada, {len(failed)} gagal")
    print(f"{len(manifest)} WebP di {OUT_DIR.relative_to(ROOT)} "
          f"({total / 1024 / 1024:.2f} MB)")
    for name, why in failed:
        print(f"  - {name}: {why}")
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
