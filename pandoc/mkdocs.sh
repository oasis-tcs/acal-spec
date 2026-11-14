#! /bin/bash

CHROME_CONTAINER_IMAGE="ghcr.io/oasis-tcs/chrome-headless:latest"
usage() {
    echo "Usage: $(basename "$0") [--number-lines] [--pdf] [--official] [--output dir] <input.md> [extra pandoc arguments]"
    echo ""
    echo "  Generates an HTML document from the given markdown file."
    echo "  --number-lines   Number lines in code blocks."
    echo "  --pdf   Also produce a PDF via Chrome headless (requires Chrome)."
    echo "          PDF is generated from the HTML output, not directly from markdown."
    echo "  --official Uses the official container image (${CHROME_CONTAINER_IMAGE}) for PDF generation (requires Podman/Docker and read access to OASIS TCs' Github Package Registry)"
    echo "  --output dir: output directory (path). By default, it is the same directory as the input."
    exit 1
}

# --- parse arguments ---
NUMBER_LINES_IN_CODE_BLOCKS=false
MAKE_PDF=false
OUTPUT_DIR=""
SET_OUTPUT_DIR=false
POSITIONAL=()
for arg in "$@"; do
    case "$arg" in
        --help|-h) usage ;;
        --number-lines) NUMBER_LINES_IN_CODE_BLOCKS=true;;
        --pdf) MAKE_PDF=true ;;
        --official) USE_CHROME_CONTAINER_IMAGE=true ;;
        --output) SET_OUTPUT_DIR=true;;
        *) if $SET_OUTPUT_DIR; then OUTPUT_DIR="$arg"; SET_OUTPUT_DIR=false; else POSITIONAL+=("$arg"); fi;;
    esac
done

set -- "${POSITIONAL[@]}"
[ $# -lt 1 ] && usage

INPUT="$1"
[ ! -f "$INPUT" ] && echo "Error: input file '$INPUT' not found." && exit 1

EXTRA_PANDOC_ARGS=("${POSITIONAL[@]:1}")

# Script's directory — filters, templates, defaults, and draft output live here
# NOTE: must be resolved before OUTPUT_HTML/OUTPUT_PDF which reference it
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Resolve absolute paths so cd doesn't break relative references
INPUT_ABS="$(cd "$(dirname "$INPUT")" && pwd)/$(basename "$INPUT")"
INPUT_DIR="$(dirname "$INPUT_ABS")"
BASENAME="$(basename "$INPUT_ABS" .md)"
OUTPUT_DIR=${OUTPUT_DIR:-${INPUT_DIR}}
OUTPUT_HTML="${OUTPUT_DIR}/${BASENAME}.html"
OUTPUT_PDF="${OUTPUT_DIR}/${BASENAME}.pdf"

# --- locate Chrome (macOS app bundles and WSL/Git Bash Windows paths) ---
# TODO: remove find_chrome() and the --pdf flag once pandoc PDF generation
#       is reliable, or once the Playwright path below is adopted instead.
find_chrome() {
    # Check PATH first (covers Linux packages and some custom installs)
    for name in google-chrome google-chrome-stable chromium chromium-browser; do
        if command -v "$name" >/dev/null 2>&1; then
            echo "$(command -v "$name")"
            return
        fi
    done

    # macOS: standard and user-level app bundle locations
    local macos_paths=(
        "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
        "$HOME/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
        "/Applications/Chromium.app/Contents/MacOS/Chromium"
        "$HOME/Applications/Chromium.app/Contents/MacOS/Chromium"
    )
    for p in "${macos_paths[@]}"; do
        [ -x "$p" ] && echo "$p" && return
    done

    # WSL / Git Bash: standard Windows install locations
    local win_paths=(
        "/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"
        "/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe"
    )
    for p in "${win_paths[@]}"; do
        [ -x "$p" ] && echo "$p" && return
    done

    echo ""
}

find_container_command() {
    # Check PATH first (covers Linux packages and some custom installs)
    for name in podman docker; do
        if command -v "$name" >/dev/null 2>&1; then
            echo "$(command -v "$name")"
            return
        fi
    done

    # macOS: standard and user-level app bundle locations
    local macos_paths=(
        "/Applications/Podman Desktop.app/Contents/MacOS/Podman Desktop"
        "$HOME/Applications/Podman Desktop.app/Contents/MacOS/Podman Desktop"
        "/Applications/Docker.app/Contents/MacOS/Docker"
        "$HOME/Applications/Docker.app/Contents/MacOS/Docker"
    )
    for p in "${macos_paths[@]}"; do
        [ -x "$p" ] && echo "$p" && return
    done

    # WSL / Git Bash: standard Windows install locations
    local win_paths=(
        "/mnt/c/Program Files/RedHat/Podman/podman.exe"
        "/mnt/c/Program Files/Docker/Docker/docker.exe"
    )
    for p in "${win_paths[@]}"; do
        [ -x "$p" ] && echo "$p" && return
    done

    echo ""
}

# --- check dependencies ---
if ! command -v pandoc >/dev/null 2>&1; then
    echo "Error: cannot find pandoc. Exiting." && exit 1
fi
PANDOC=$(command -v pandoc)

if ! command -v git >/dev/null 2>&1; then
    echo "Error: cannot find git. Exiting." && exit 2
fi
GIT=$(command -v git)

# --- if PDF requested, resolve Chrome now before doing any work ---
CHROME=""
CONTAINER_COMMAND=""
CONTAINER_RUN_CUSTOM_ARGS=""
if $MAKE_PDF; then
    if $USE_CHROME_CONTAINER_IMAGE; then
        CONTAINER_COMMAND="$(find_container_command)"
        if [ -z "$CONTAINER_COMMAND" ]; then
            printf "Neither Podman nor Docker was found on this system.\nPDF generation with --official flag requires one of these two container engines to be installed.\n"
            exit 1
        fi
        if echo "$CONTAINER_COMMAND" | grep -iq "podman"; then CONTAINER_RUN_CUSTOM_ARGS="--userns=keep-id"; fi
        CHROME="(from Linux container image $CHROME_CONTAINER_IMAGE)"
    else
        CHROME="$(find_chrome)"
        if [ -z "$CHROME" ]; then
            printf "Chrome was not found on this system.\n"
            printf "PDF generation requires Chrome or Chromium to be installed.\n"
            printf "Proceed with HTML-only output? [y/N] "
            read -r answer
            case "$answer" in
                [yY]|[yY][eE][sS]) MAKE_PDF=false ;;
                *) echo "Aborted." && exit 4 ;;
            esac
        fi
    fi
fi

# --- show what we're using ---
printf "Using %s\n" "$($PANDOC --version | head -1)"
printf "Using %s\n" "$($GIT --version)"
$MAKE_PDF && printf "Using Chrome: %s\n" "$CHROME"
printf "\n"

# --- capture git revision (non-fatal: warn and omit if not in a repo) ---
GIT_META=()
if $GIT -C "$INPUT_DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    GIT_REV="$($GIT -C "$INPUT_DIR" rev-parse --short HEAD) · $($GIT -C "$INPUT_DIR" branch --show-current) · $($GIT -C "$INPUT_DIR" log -1 --format='%ci' | cut -d' ' -f1)"
    GIT_META=(--metadata "git-revision=$GIT_REV")
else
    printf "Warning: not inside a git repository; revision metadata will be omitted.\n\n"
fi

# --- run pandoc from the input file's directory so CSS and image paths resolve ---
cd "$INPUT_DIR"

INPUT_FORMAT="gfm+definition_lists"
if $NUMBER_LINES_IN_CODE_BLOCKS; then
    INPUT_FORMAT="markdown+gfm_auto_identifiers+header_attributes+definition_lists+fenced_code_attributes"
fi

$PANDOC -f "$INPUT_FORMAT" -t html \
  -c "$SCRIPT_DIR/styles/markdown-styles-v1.7.3b.css" \
  -s \
  --template "$SCRIPT_DIR/templates/default.html" \
  --filter pandoc-include \
  --lua-filter "$SCRIPT_DIR/meta_vars.lua" \
  --defaults "$SCRIPT_DIR/defaults.yaml" \
  --embed-resources \
  "${GIT_META[@]}" "${EXTRA_PANDOC_ARGS[@]}" \
  -o "$OUTPUT_HTML" \
  "$INPUT_ABS"

printf "HTML: %s\n" "$OUTPUT_HTML"

# --- optionally produce PDF from the completed HTML via Chrome headless ---
#
# NOTE: --no-pdf-header-footer suppresses Chrome's running header (URL) and
#       footer (date, page N of M) under --headless=new. This is the correct
#       flag for the current headless engine; the older --print-to-pdf-no-header
#       flag is broken in all Chrome versions from 121 onwards.
#
if $MAKE_PDF; then
    if $USE_CHROME_CONTAINER_IMAGE; then
        printf "PDF:  generating via Chrome --headless=new... inside the official container image ('ghcr.io/oasis-tcs/chrome-headless')"
        $CONTAINER_COMMAND run $CONTAINER_RUN_CUSTOM_ARGS --rm -v ${OUTPUT_DIR}:/workspace "$CHROME_CONTAINER_IMAGE" --print-to-pdf="${BASENAME}.pdf" "file:///workspace/${BASENAME}.html"
    else
        printf "PDF:  generating via Chrome --headless=new... "
        "$CHROME" \
        --headless=new \
        --no-sandbox \
        --no-pdf-header-footer \
        --disable-gpu \
        --print-to-pdf="$OUTPUT_PDF" \
        "file://${OUTPUT_HTML}"
    fi

    if [ -f "$OUTPUT_PDF" ]; then
        printf "done\n"
        printf "PDF:  %s\n" "$OUTPUT_PDF"
    else
        printf "failed\n"
        printf "Error: PDF generation failed.\n" >&2
    fi
fi
