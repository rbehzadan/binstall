# k6

[k6](https://github.com/grafana/k6) is a modern open-source load testing tool built for developers, testers, and SREs.

## 🔧 Install

### Option 1: One-liner

Run this in your terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/rbehzadan/binstall/main/k6/install.sh | bash
````

### Option 2: Manual Copy & Paste

If you prefer to review the script before running it, copy and paste the following:

```bash
REPO_OWNER="grafana"
REPO_NAME="k6"
BINARY="k6"
GIT_SERVER="github.com"
REPO_URL="https://${GIT_SERVER}/${REPO_OWNER}/${REPO_NAME}"

# Detect OS and architecture
OS=$(uname | tr '[:upper:]' '[:lower:]')  # linux, darwin
ARCH=$(uname -m)
case "$ARCH" in
  x86_64) ARCH="amd64" ;;
  aarch64 | arm64) ARCH="arm64" ;;
  armv6l | armv7l) ARCH="armv6" ;;  # fallback
  *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

# Fetch latest version
VERSION=$(curl -s https://api.${GIT_SERVER}/repos/${REPO_OWNER}/${REPO_NAME}/releases/latest \
  | jq -r ".tag_name" | sed 's/^v//')

# Download and install
DIRNAME="${BINARY}-v${VERSION}-${OS}-${ARCH}"
PACKAGE="${DIRNAME}.tar.gz"
CWD=$(pwd)
TEMPDIR=$(mktemp -d)
cd "$TEMPDIR"
curl -fsSLO "${REPO_URL}/releases/download/v${VERSION}/${PACKAGE}"
tar xf "${PACKAGE}"
cd "${DIRNAME}"
sudo install "${BINARY}" /usr/local/bin
cd "$CWD"
rm -rf "$TEMPDIR"

# Confirm installation
echo -e "\nInstalled $BINARY version: $($BINARY --version | cut -d' ' -f2)"
```
