# k6

[k6](https://github.com/grafana/k6) is an open-source modern load testing tool built for developers and testers.

---

## 🔧 Installation Methods

You can install `k6` in two ways:

### ✅ Option 1: Smart Installer Script

This script auto-detects your platform and downloads the correct binary.

#### Usage

```bash
curl -fsSL https://raw.githubusercontent.com/rbehzadan/binstall/main/k6/install.sh | bash
```

#### Available Flags

* `--version <ver>`: Install a specific version (e.g. `--version 0.48.0`)
* `--quiet`: Suppress verbose output (only shows final result)
* `--help`: Show usage

Example:

```bash
curl -fsSL https://raw.githubusercontent.com/rbehzadan/binstall/main/k6/install.sh | bash -s -- --version 0.47.0
```

---

### ✅ Option 2: Hardcoded Variant Snippets

These are copy-paste-friendly, minimal install snippets that **do not rely on auto-detection**.  
Ideal for CI, Docker, or minimal systems.

> 📁 Located in: [`k6/variants/`](./variants/)

#### 📄 Variant Scripts (GitHub UI Friendly)

* [install-k6-linux-amd64](./variants/install-k6-linux-amd64)
* [install-k6-linux-arm64](./variants/install-k6-linux-arm64)
* [install-k6-darwin-amd64](./variants/install-k6-darwin-amd64)
* [install-k6-darwin-arm64](./variants/install-k6-darwin-arm64)

#### 📥 Raw Links (Direct Copy-Paste)

Use these one-liners if you're installing directly from this repo:

```bash
curl -fsSL https://raw.githubusercontent.com/rbehzadan/binstall/main/k6/variants/install-k6-linux-amd64 | bash
```

```bash
curl -fsSL https://raw.githubusercontent.com/rbehzadan/binstall/main/k6/variants/install-k6-linux-arm64 | bash
```

```bash
curl -fsSL https://raw.githubusercontent.com/rbehzadan/binstall/main/k6/variants/install-k6-darwin-amd64 | bash
```

```bash
curl -fsSL https://raw.githubusercontent.com/rbehzadan/binstall/main/k6/variants/install-k6-darwin-arm64 | bash
```

Or click to view the raw snippet and manually copy/paste into your terminal:

* [install-k6-linux-amd64](https://raw.githubusercontent.com/rbehzadan/binstall/main/k6/variants/install-k6-linux-amd64)
* [install-k6-linux-arm64](https://raw.githubusercontent.com/rbehzadan/binstall/main/k6/variants/install-k6-linux-arm64)
* [install-k6-darwin-amd64](https://raw.githubusercontent.com/rbehzadan/binstall/main/k6/variants/install-k6-darwin-amd64)
* [install-k6-darwin-arm64](https://raw.githubusercontent.com/rbehzadan/binstall/main/k6/variants/install-k6-darwin-arm64)

> 💡 Tip: If you’ve forked this repo, replace `rbehzadan` with your GitHub username in the links above.

---

## 📦 Installed Output

After installation, the script prints:

```bash
✅ Installed k6 version v0.48.0
```

---

## 🔐 Notes

* The script requires `sudo` to place the binary in `/usr/local/bin`
* You must have `curl`, `tar`, `jq`, and `install` on your system

