# Research Agent System

Multi-agent research and writing system powered by GitHub Copilot in VS Code.

## Usage

1. Open this folder in VS Code with GitHub Copilot enabled.
2. Invoke the orchestrator via `dryan-agent.md`.
3. Provide a topic — the system dispatches research, writing, and memory agents automatically.
4. Output artifacts are saved to `output/`.

## Files

| File | Purpose |
|------|---------|
| `dryan-agent.md` | Orchestrator — invoke this |
| `models.md` | Model configuration |
| `memory.md` | Run history and conventions |
| `_engine.md` | **Runtime engine — do not modify or remove** |

## Requirements

- VS Code with GitHub Copilot subscription
- No API keys needed — authentication via Copilot
