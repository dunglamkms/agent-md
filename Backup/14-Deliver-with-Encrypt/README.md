# Research Agent System

Multi-agent research and writing system powered by GitHub Copilot in VS Code.

## Quick Start

```bash
# First time: make scripts executable
chmod +x run.sh encrypt.sh

# Start a session (decrypts engine, opens VS Code, cleans up on exit)
./run.sh
```

## How It Works

1. `run.sh` decrypts `_engine.md.enc` → `_engine.md` (plaintext)
2. VS Code opens with agents ready for Copilot
3. Use Copilot to invoke `dryan-agent.md` with any topic
4. Press Enter in the terminal when done → plaintext is deleted

## Files

| File | Purpose |
|------|---------|
| `run.sh` | **Start here** — decrypt, run, cleanup |
| `encrypt.sh` | Owner-only — encrypt after editing engine |
| `_engine.md.enc` | Encrypted engine (committed) |
| `dryan-agent.md` | Orchestrator agent |
| `researcher.md` | Research subagent |
| `writer.md` | Writing subagent |
| `memory-agent.md` | Memory subagent |
| `models.md` | Model configuration |
| `memory.md` | Run history |

## Requirements

- VS Code with GitHub Copilot subscription
- `openssl` (pre-installed on macOS/Linux)
- Engine passphrase (ask the project owner)

## For the Owner

```bash
# Edit the engine
openssl enc -aes-256-cbc -pbkdf2 -iter 100000 -d -in _engine.md.enc -out _engine.md
# ... make changes to _engine.md ...
./encrypt.sh
rm _engine.md
git add _engine.md.enc && git commit -m "update engine"
```

## When Someone Leaves

1. Change the passphrase: `./encrypt.sh` (enter new passphrase)
2. Commit the new `_engine.md.enc`
3. Share new passphrase only with remaining team members
