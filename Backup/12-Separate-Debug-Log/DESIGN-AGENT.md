# Agent Model Configuration Design

Standard model settings for all agents in the orchestrator system.

## Defaults

> Shared baseline in [models.md](models.md). Agents inherit all values unless they declare an override in their own `## Model` section.

## Common Settings

| Setting       | Type   | Description                                            |
|---------------|--------|--------------------------------------------------------|
| `provider`    | string | Runtime provider — `copilot` (GitHub Copilot in VS Code) |
| `model`       | string | Model available in Copilot (Claude Opus 4.6, Claude Sonnet 4) |
| `temperature` | float  | Creativity vs determinism (0.0–1.0)                    |
| `max_tokens`  | int    | Response length limit                                  |
| `top_p`       | float  | Nucleus sampling (optional)                            |
| `timeout`     | int    | Per-request timeout in seconds                         |

> **Note:** No API key is needed. Authentication is handled by your GitHub Copilot subscription via VS Code.

## Resolved Configuration (read-only reference)

> Derived from [models.md](models.md) + per-agent overrides. **To change settings, edit `models.md` or the agent's `## Model` section — not this table.**

| Agent      | model                     | temp | max_tokens | timeout | Overrides from default         |
|------------|---------------------------|------|------------|---------|--------------------------------|
| Dryan      | Claude Opus 4.6 (copilot) | 0.3  | 1024       | 60      | model, max_tokens, timeout     |
| Researcher | Claude Sonnet 4 (copilot) | 0.2  | 2048       | 30      | temperature                    |
| Writer     | Claude Sonnet 4 (copilot) | 0.7  | 2048       | 30      | temperature                    |
| Memory     | Claude Sonnet 4 (copilot) | 0.1  | 1024       | 30      | temperature, max_tokens        |

## Design Decisions

1. **GitHub Copilot as runtime** — no API keys needed; authentication via your GitHub subscription in VS Code.
2. **Opus for orchestrator, Sonnet for subagents** — Opus 4.6 excels at complex reasoning/coordination; Sonnet 4 is faster and well-suited for focused tasks.
3. **Temperature varies by role** — research (0.2) favours precision; writing (0.7) favours variety; memory (0.1) favours determinism; orchestrator (0.3) favours consistency.
4. **Timeouts align with orchestrator execution rules** — subagents get 30s each; orchestrator gets 60s to cover subagent time + merge.
5. **Copilot subagent dispatch** — the orchestrator uses Copilot's `runSubagent` capability to dispatch all subagents in parallel.
6. **Memory Agent** — reads `memory.md` in parallel with Researcher/Writer (read phase), then updates run history after merge (write phase).
