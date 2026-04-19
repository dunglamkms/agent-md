# Agent Model Configuration Design

Standard model settings for all agents in the orchestrator system.

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

## Per-Agent Configuration

### Dryan Agent

| Setting       | Value                    | Rationale                               |
|---------------|--------------------------|-----------------------------------------|
| `provider`    | copilot                  | GitHub Copilot in VS Code               |
| `model`       | Claude Opus 4.6 (copilot)| Best reasoning for coordination         |
| `temperature` | 0.3                      | Low — deterministic coordination        |
| `max_tokens`  | 1024                     | Merge output is structured, not long    |
| `timeout`     | 60                       | Must wait for subagents + merge         |

### Researcher Agent

| Setting       | Value                    | Rationale                               |
|---------------|--------------------------|-----------------------------------------|
| `provider`    | copilot                  | GitHub Copilot in VS Code               |
| `model`       | Claude Sonnet 4 (copilot) | Fast, strong at factual retrieval       |
| `temperature` | 0.2                      | Low — factual accuracy over creativity  |
| `max_tokens`  | 2048                     | Room for detailed findings + sources    |
| `timeout`     | 30                       | Per execution-rule timeout              |

### Writer Agent

| Setting       | Value                    | Rationale                               |
|---------------|--------------------------|-----------------------------------------|
| `provider`    | copilot                  | GitHub Copilot in VS Code               |
| `model`       | Claude Sonnet 4 (copilot) | Fast, strong at fluent generation       |
| `temperature` | 0.7                      | Higher — creative, varied writing       |
| `max_tokens`  | 2048                     | Room for full draft                     |
| `timeout`     | 30                       | Per execution-rule timeout              |

### Memory Agent

| Setting       | Value                    | Rationale                               |
|---------------|--------------------------|-----------------------------------------|
| `provider`    | copilot                  | GitHub Copilot in VS Code               |
| `model`       | Claude Sonnet 4 (copilot) | Fast, precise for memory read/write     |
| `temperature` | 0.1                      | Minimal — deterministic memory ops      |
| `max_tokens`  | 1024                     | Short prior context summaries           |
| `timeout`     | 30                       | Per execution-rule timeout              |

## Design Decisions

1. **GitHub Copilot as runtime** — no API keys needed; authentication via your GitHub subscription in VS Code.
2. **Opus for orchestrator, Sonnet for subagents** — Opus 4.6 excels at complex reasoning/coordination; Sonnet 4 is faster and well-suited for focused tasks.
3. **Temperature varies by role** — research (0.2) favours precision; writing (0.7) favours variety; memory (0.1) favours determinism; orchestrator (0.3) favours consistency.
4. **Timeouts align with orchestrator execution rules** — subagents get 30s each; orchestrator gets 60s to cover subagent time + merge.
5. **Copilot subagent dispatch** — the orchestrator uses Copilot's `runSubagent` capability to dispatch all subagents in parallel.
6. **Memory Agent** — reads `memory.md` in parallel with Researcher/Writer (read phase), then updates run history after merge (write phase).
