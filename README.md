# binstall

**Minimal Bash-based installers for popular CLI tools from GitHub releases.**  
No package managers, no bloat—just copy, paste, and run.

---

## 🚀 Why?

This project provides simple and portable Bash scripts to install the latest versions of CLI tools directly from their GitHub releases.

- ✅ Zero dependencies (just `bash`, `curl`, `jq`, `tar`, and standard tools)
- ✅ Works on most Linux distros (and macOS with minimal tweaks)
- ✅ Easy to read, audit, and customize
- ✅ Great for scripting, CI, containers, or minimal systems

---

## 📦 Available Tools

| Tool       | Install Script          | Docs               |
|------------|-------------------------|--------------------|
| [k6](k6/)       | [install.sh](k6/install.sh)       | [README](k6/README.md)       |
| [restic](restic/)   | [install.sh](restic/install.sh)   | [README](restic/README.md)   |

---

## 🛠 Usage

To install `k6`:

```bash
curl -fsSL https://raw.githubusercontent.com/rbehzadan/binstall/main/k6/install.sh | bash
```

To install `restic`:

```bash
curl -fsSL https://raw.githubusercontent.com/rbehzadan/binstall/main/restic/install.sh | bash
```

Or visit each tool’s folder for:

* Usage instructions
* Optional flags
* Hardcoded install variants

---

## 🧩 Contributing

Got a favorite tool you'd like to add?
PRs welcome! Please follow the existing structure:

Each tool should include:

* `install.sh`: Platform-aware smart installer
* `variants/`: Optional hardcoded install snippets
* `README.md`: Usage documentation

---

## 📄 License

MIT © [Reza Behzadan](https://github.com/rbehzadan)

