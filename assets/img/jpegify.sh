#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
jpegify.sh: normalize images to optimized JPEG.

Usage:
  assets/img/jpegify.sh --width <px> --dpi <dpi> [options] <file>...

Inputs:
  - *.png -> converted to *.jpg (png is removed)
  - *.jpg / *.jpeg -> converted to *.jpg (overwritten)

Options:
  --width <px>           Target pixel width (e.g. 1600).
  --dpi <dpi>            Output DPI metadata to embed (e.g. 96).
  --quality <n>         JPEG quality (default: 85).
  --sampling-factor <f> Chroma subsampling (default: 4:2:0).
  --interlace <type>    JPEG interlace (default: Plane).
  --background <c>      Background for PNG alpha (default: white).
  --strip               Strip all metadata (default on).
  --no-strip            Don't strip metadata.
  --no-replace          Keep original files (except still writes output JPG).
  --replace             Replace original PNG with JPG output (default on).
  --no-stage            Don't run `git add` for modified outputs.
  --dry-run              Print what would happen, don't modify.
  -h, --help             Show this help.
EOF
}

width=""
dpi="96"
quality="85"
sampling_factor="4:2:0"
interlace="Plane"
background="white"
strip_meta=1
replace_png=1
stage=1
dry_run=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --width) width="${2:-}"; shift 2 ;;
    --dpi) dpi="${2:-}"; shift 2 ;;
    --quality) quality="${2:-}"; shift 2 ;;
    --sampling-factor) sampling_factor="${2:-}"; shift 2 ;;
    --interlace) interlace="${2:-}"; shift 2 ;;
    --background) background="${2:-}"; shift 2 ;;
    --strip) strip_meta=1; shift ;;
    --no-strip) strip_meta=0; shift ;;
    --replace) replace_png=1; shift ;;
    --no-replace) replace_png=0; shift ;;
    --no-stage) stage=0; shift ;;
    --dry-run) dry_run=1; shift ;;
    -h|--help) usage; exit 0 ;;
    --) shift; break ;;
    -*) echo "Unknown option: $1" >&2; usage; exit 2 ;;
    *) break ;;
  esac
done

if [[ -z "$width" ]]; then
  echo "Missing required option: --width <px>" >&2
  usage >&2
  exit 2
fi
if [[ $# -lt 1 ]]; then
  echo "No input files provided." >&2
  usage >&2
  exit 2
fi

if ! command -v magick >/dev/null 2>&1; then
  echo "Error: ImageMagick 'magick' not found in PATH." >&2
  exit 127
fi

git_root=""
if [[ "$stage" -eq 1 ]]; then
  # `git rev-parse` fails outside a git repo; in that case we just skip staging.
  if git_root="$(git rev-parse --show-toplevel 2>/dev/null || true)"; [[ -z "$git_root" ]]; then
    stage=0
  fi
fi

normalize_one() {
  local src="$1"
  if [[ ! -f "$src" ]]; then
    echo "Skipping (not a file): $src" >&2
    return 0
  fi

  local ext="${src##*.}"
  local ext_lc
  ext_lc="$(printf '%s' "$ext" | tr '[:upper:]' '[:lower:]')"

  local dir base_noext dst tmp
  dir="$(dirname "$src")"
  base_noext="$(basename "$src")"
  base_noext="${base_noext%.*}"
  dst="${dir}/${base_noext}.jpg"

  # PNGs commonly carry alpha; for JPEG we need a background + alpha removal.
  local alpha_remove=0
  local remove_src=0

  case "$ext_lc" in
    png)
      alpha_remove=1
      if [[ "$replace_png" -eq 1 ]]; then
        remove_src=1
      fi
      ;;
    jpg|jpeg)
      ;;
    *)
      echo "Skipping (unsupported extension): $src" >&2
      return 0
      ;;
  esac

  echo "Normalizing: $src -> $dst"

  if [[ "$dry_run" -eq 1 ]]; then
    return 0
  fi

  tmp="$(mktemp -p "$dir" ".jpegify.${base_noext}.XXXXXX.jpg")"

  # Build ImageMagick arguments.
  # Notes:
  # -resize <width> preserves aspect ratio while setting the exact output width.
  # -density/-units sets DPI metadata embedded in the output.
  # -auto-orient respects EXIF rotation.
  local -a cmd
  # ImageMagick v7 prefers: `magick <input> [ops] <output>`
  cmd=(magick "$src" -auto-orient)
  if [[ "$alpha_remove" -eq 1 ]]; then
    cmd+=(-background "$background" -alpha remove)
  fi
  cmd+=(
    -resize "${width}"
    -sampling-factor "$sampling_factor"
    -quality "$quality"
    -interlace "$interlace"
    -density "$dpi"
    -units PixelsPerInch
  )
  if [[ "$strip_meta" -eq 1 ]]; then
    cmd+=(-strip)
  fi
  cmd+=("$tmp")

  "${cmd[@]}"

  # Atomically replace/overwrite the destination.
  mv -f "$tmp" "$dst"

  if [[ "$remove_src" -eq 1 ]]; then
    rm -f -- "$src"
  fi

  if [[ "$stage" -eq 1 ]]; then
    # Ensure pre-commit sees the output changes without an extra `git add`.
    if [[ "$remove_src" -eq 1 ]]; then
      git add -u -- "$src" >/dev/null 2>&1 || true
    fi
    git add -f -- "$dst" >/dev/null 2>&1 || true
  fi
}

for f in "$@"; do
  normalize_one "$f"
done
