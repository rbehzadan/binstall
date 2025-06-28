# binstall

**Minimal Bash-based installers for popular CLI tools from GitHub releases.**  
No package managers, no bloat—just copy, paste, and run.

## 🚀 Why?

This project provides simple and portable Bash scripts to install the latest versions of CLI tools directly from their GitHub releases.

- ✅ Zero dependencies (just `bash`, `curl`, `jq`, and `tar`)
- ✅ Works on any modern Linux (and macOS with tweaks)
- ✅ Easy to read and customize
- ✅ Great for scripts, containers, or minimal systems

## 📦 Available Tools

| Tool | Install Script | Setup Docs |
|------|----------------|------------|
| [k6](k6/) | [install.sh](k6/install.sh) | – |

## 🛠 Usage

To install `k6`, run:

```bash
curl -fsSL https://raw.githubusercontent.com/rbehzadan/binstall/main/k6/install.sh | bash
````

Or visit the tool's folder for more details and a copy-pasteable version: [k6/README.md](k6/README.md)

## 🧩 Contributing

Have a favorite tool you install this way?
PRs welcome! Just follow the existing structure:
Each tool gets its own folder with at least:

* `install.sh` (automated Bash installer)
* `README.md` (usage and optional setup)

## 📄 License

MIT © Reza Behzadan

