#!/usr/bin/env bash

# Install latest version of Grafana K6 from GitHub releases

# Tool metadata
REPO_OWNER="grafana"
REPO_NAME="k6"
BINARY="k6"
GIT_SERVER="github.com"
REPO_URL="https://${GIT_SERVER}/${REPO_OWNER}/${REPO_NAME}"

# Detect OS
OS=$(uname | tr '[:upper:]' '[:lower:]')  # linux, darwin

# Detect ARCH
ARCH=$(uname -m)
case "$ARCH" in
    x86_64) ARCH="amd64" ;;
    aarch64 | arm64) ARCH="arm64" ;;
    armv6l | armv7l) ARCH="armv6" ;;  # fallback, rarely used
    *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

# Fetch latest version
VERSION=$(curl -s https://api.${GIT_SERVER}/repos/${REPO_OWNER}/${REPO_NAME}/releases/latest \
  | jq -r ".tag_name" | sed 's/^v//')

# Construct filenames
DIRNAME="${BINARY}-v${VERSION}-${OS}-${ARCH}"
PACKAGE="${DIRNAME}.tar.gz"

# Download and install
CWD=$(pwd)
TEMPDIR=$(mktemp -d)
cd "$TEMPDIR"
curl -fsSLO "${REPO_URL}/releases/download/v${VERSION}/${PACKAGE}"
tar xf "${PACKAGE}"
cd "${DIRNAME}"
sudo install "${BINARY}" /usr/local/bin

# Clean up
cd "$CWD"
rm -rf "$TEMPDIR"

# Report installed version
echo -e "Installed $BINARY version: $($BINARY --version | cut -d' ' -f2)"

