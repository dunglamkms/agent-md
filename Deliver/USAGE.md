# Usage Guide

## Prerequisites

- **VS Code** with **GitHub Copilot** subscription active
- **openssl** — pre-installed on macOS and most Linux distros
- **Passphrase** — get it from the project owner (never stored in git)

Verify openssl is available:

```bash
openssl version
```

---

## Starting a Session

```bash
cd Deliver/
./run.sh
```

1. You'll be prompted for the passphrase.
2. The engine decrypts automatically.
3. VS Code opens with the workspace ready.
4. You'll see a banner in terminal:

```
╔══════════════════════════════════════════════════╗
║  Agents are LIVE. Use Copilot normally.         ║
║  Press ENTER when done to wipe _engine.md.      ║
╚══════════════════════════════════════════════════╝
```

> **Do not close the terminal.** Keep it open until you're done.

---

## Running the Agents

Once VS Code is open and the engine is decrypted:

### 1. Open Copilot Chat

Press `Cmd+Shift+I` (macOS) or `Ctrl+Shift+I` (Windows/Linux) to open Copilot Agent chat.

### 2. Invoke the Orchestrator

Type your research topic. The orchestrator (`dryan-agent.md`) will:

- Dispatch to **Researcher**, **Writer**, and **Memory** agents in parallel
- Merge the results into a single structured response
- Save the output to `output/{topic-slug}-{YYYY-MM-DD}.md`

### 3. Example Prompts

```
Research "microservices observability patterns"
```

```
Research "React Server Components best practices"
```

```
Research "zero-trust security architecture"
```

### 4. Check the Output

After a run completes, find your artifact in:

```
output/
└── microservices-observability-patterns-2026-04-22.md
```

---

## Ending a Session

1. Go back to the terminal where `run.sh` is waiting.
2. Press **Enter**.
3. The plaintext engine file is deleted automatically.

```
Session ended.
[cleanup] _engine.md deleted.
```

> If you close the terminal or press `Ctrl+C`, the cleanup still runs — the trap handles it.

---

## Using a Passphrase File (Optional)

For convenience, store the passphrase in a local file (not in the repo):

```bash
# Create passphrase file (do this once)
echo "your-passphrase" > ~/.dryan-pass
chmod 600 ~/.dryan-pass

# Run with passphrase file
./run.sh --passfile ~/.dryan-pass
```

> **Never commit the passphrase file.** Keep it in your home directory with `600` permissions.

---

## Enabling Debug Logs

Edit `models.md` and set any flag to `on`:

| Flag             | What it logs |
|------------------|-------------|
| `debug_config`   | Resolved model config per agent |
| `debug_dispatch` | Subagent dispatch and timing |
| `debug_memory`   | Memory read/write operations |
| `debug_merge`    | Merge inputs and output path |

Debug output goes to `output/debug-{topic-slug}-{YYYY-MM-DD}.log` — never to the output artifact.

Set flags back to `off` when done.

---

## Checking Run History

Open `memory.md` → `## Run History` to see all past runs:

```markdown
| Date | Topic | Output |
|---|---|---|
| 2026-04-22 | microservices observability | `output/microservices-observability-2026-04-22.md` |
```

The Memory Agent updates this automatically after each run.

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| `ERROR: _engine.md.enc not found` | You're not in the `Deliver/` directory, or the encrypted file hasn't been committed yet. Ask the owner. |
| `bad decrypt` | Wrong passphrase. Try again or ask the owner for the current passphrase. |
| Agents produce empty/generic output | `_engine.md` may not have decrypted properly. End the session, re-run `./run.sh`. |
| `_engine.md` still on disk after session | Cleanup may have failed. Delete it manually: `rm _engine.md` |
| `openssl: command not found` | Install openssl — `brew install openssl` (macOS) or `apt install openssl` (Linux) |
| VS Code doesn't open | Install the `code` CLI: open VS Code → `Cmd+Shift+P` → "Shell Command: Install 'code' command in PATH" |
