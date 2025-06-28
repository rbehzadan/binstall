#!/usr/bin/env bash
set -euo pipefail

# === Config ===
REPO_OWNER="restic"
REPO_NAME="restic"
BINARY="restic"
GIT_SERVER="github.com"
REPO_URL="https://${GIT_SERVER}/${REPO_OWNER}/${REPO_NAME}"

# === Logging helpers ===
QUIET=false

say() {
  $QUIET || echo -e "$@"
}

err() {
  echo -e "❌ $@" >&2
}

# === Parse CLI args ===
TOOL_VERSION=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    -v|--version)
      TOOL_VERSION="$2"
      shift 2
      ;;
    -q|--quiet)
      QUIET=true
      shift
      ;;
    -h|--help)
      echo "Usage: $0 [--version <ver>] [--quiet]"
      exit 0
      ;;
    *)
      err "Unknown option: $1"
      exit 1
      ;;
  esac
done

# === Check requirements ===
for cmd in sudo curl jq bunzip2 install; do
  command -v $cmd >/dev/null 2>&1 || {
    err "Required command '$cmd' not found."
    exit 1
  }
done

# === Sudo sanity check ===
# Inform user if 'sudo' will prompt for a password (non-interactive check).
# This is useful in CI or automation contexts to prevent unexpected hangs.
if ! sudo -n true 2>/dev/null; then
  say "🔐 'sudo' will prompt for a password during install."
fi

# === Detect OS and ARCH ===
OS=$(uname | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)
case "$ARCH" in
  x86_64) ARCH="amd64" ;;
  aarch64 | arm64) ARCH="arm64" ;;
  armv6l | armv7l) ARCH="armv6" ;;
  *) err "Unsupported architecture: $ARCH"; exit 1 ;;
esac

# === Determine version ===
if [[ -z "$TOOL_VERSION" ]]; then
  say "📦 Fetching latest version of $BINARY..."
  TOOL_VERSION=$(curl --fail --silent --show-error --max-time 10 \
    "https://api.${GIT_SERVER}/repos/${REPO_OWNER}/${REPO_NAME}/releases/latest" \
    | jq -r ".tag_name" | sed 's/^v//')
  [[ -z "$TOOL_VERSION" ]] && err "Could not detect latest version." && exit 1
fi

# === Prepare paths ===
TEMPDIR=$(mktemp -d)
CWD=$(pwd)

cleanup() { rm -rf "$TEMPDIR"; }
trap cleanup EXIT

# === Download & install ===
cd "$TEMPDIR"
say "⬇️ Downloading ${BINARY}_${TOOL_VERSION}_${OS}_${ARCH}.bz2..."
if $QUIET; then
  curl -fsSL "${REPO_URL}/releases/download/v${TOOL_VERSION}/${BINARY}_${TOOL_VERSION}_${OS}_${ARCH}.bz2" | bunzip2 > "$BINARY"
else
  curl -fSL "${REPO_URL}/releases/download/v${TOOL_VERSION}/${BINARY}_${TOOL_VERSION}_${OS}_${ARCH}.bz2" | bunzip2 > "$BINARY"
fi

say "🔧 Installing $BINARY to /usr/local/bin..."
sudo install "$BINARY" /usr/local/bin

VERSION_INSTALLED=$($BINARY version | cut -d' ' -f2)
$QUIET || echo ""
echo "✅ Installed $BINARY version $VERSION_INSTALLED"

