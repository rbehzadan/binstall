# restic

[restic](https://github.com/restic/restic) is a fast, secure, and efficient backup program.

---

## 🔧 Installation Methods

You can install `restic` in two ways:

### ✅ Option 1: Smart Installer Script

This script auto-detects your platform and downloads the correct binary.

#### Usage

```bash
curl -fsSL https://raw.githubusercontent.com/rbehzadan/binstall/main/restic/install.sh | bash
```

#### Available Flags

* `--version <ver>`: Install a specific version (e.g. `--version 0.18.0`)
* `--quiet`: Suppress verbose output (only shows final result)
* `--help`: Show usage

Example:

```bash
curl -fsSL https://raw.githubusercontent.com/rbehzadan/binstall/main/restic/install.sh | bash -s -- --version 0.16.4
```

---

### ✅ Option 2: Hardcoded Variant Snippets

These are copy-paste-friendly, minimal install snippets that **do not rely on auto-detection**.  
Ideal for CI, Docker, or minimal systems.

> 📁 Located in: [`restic/variants/`](./variants/)

#### 📄 Variant Scripts (GitHub UI Friendly)

* [install-restic-linux-amd64](./variants/install-restic-linux-amd64)
* [install-restic-linux-arm64](./variants/install-restic-linux-arm64)
* [install-restic-darwin-amd64](./variants/install-restic-darwin-amd64)
* [install-restic-darwin-arm64](./variants/install-restic-darwin-arm64)

#### 📥 Raw Links (Direct Copy-Paste)

Use these one-liners to download and install `restic` directly (without cloning the repo):

```bash
curl -fsSL https://raw.githubusercontent.com/rbehzadan/binstall/main/restic/variants/install-restic-linux-amd64 | bash
```

```bash
curl -fsSL https://raw.githubusercontent.com/rbehzadan/binstall/main/restic/variants/install-restic-linux-arm64 | bash
```

```bash
curl -fsSL https://raw.githubusercontent.com/rbehzadan/binstall/main/restic/variants/install-restic-darwin-amd64 | bash
```

```bash
curl -fsSL https://raw.githubusercontent.com/rbehzadan/binstall/main/restic/variants/install-restic-darwin-arm64 | bash
```

Or click to view the raw snippet and manually copy/paste into your terminal:

* [install-restic-linux-amd64](https://raw.githubusercontent.com/rbehzadan/binstall/main/restic/variants/install-restic-linux-amd64)
* [install-restic-linux-arm64](https://raw.githubusercontent.com/rbehzadan/binstall/main/restic/variants/install-restic-linux-arm64)
* [install-restic-darwin-amd64](https://raw.githubusercontent.com/rbehzadan/binstall/main/restic/variants/install-restic-darwin-amd64)
* [install-restic-darwin-arm64](https://raw.githubusercontent.com/rbehzadan/binstall/main/restic/variants/install-restic-darwin-arm64)

> 💡 Tip: If you’ve forked this repo, replace `rbehzadan` with your GitHub username in the links above.

---

## 📦 Installed Output

After installation, the script prints:

```bash
✅ Installed restic version 0.18.0
```

---

## 🔐 Notes

* The script requires `sudo` to place the binary in `/usr/local/bin`
* You must have `curl`, `bunzip2`, `jq`, and `install` on your system

