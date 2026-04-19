# Agent Model Configuration Design

Standard model settings for all agents in the orchestrator system.

## Common Settings

| Setting       | Type   | Description                                        |
|---------------|--------|----------------------------------------------------|
| `provider`    | string | API provider (openai, anthropic, google, etc.)     |
| `model`       | string | Specific model ID                                  |
| `temperature` | float  | Creativity vs determinism (0.0–1.0)                |
| `max_tokens`  | int    | Response length limit                              |
| `top_p`       | float  | Nucleus sampling (optional)                        |
| `timeout`     | int    | Per-request timeout in seconds                     |
| `api_key_env` | string | Environment variable name holding the API key      |

## Per-Agent Configuration

### Orchestrator

| Setting       | Value            | Rationale                               |
|---------------|------------------|-----------------------------------------|
| `provider`    | openai           | Primary provider                        |
| `model`       | gpt-4o           | Best balance of speed and capability    |
| `temperature` | 0.3              | Low — deterministic coordination        |
| `max_tokens`  | 1024             | Merge output is structured, not long    |
| `timeout`     | 60               | Must wait for subagents + merge         |
| `api_key_env` | OPENAI_API_KEY   |                                         |

### Subagent A — Research

| Setting       | Value            | Rationale                               |
|---------------|------------------|-----------------------------------------|
| `provider`    | openai           | Primary provider                        |
| `model`       | gpt-4o           | Strong at factual retrieval             |
| `temperature` | 0.2              | Low — factual accuracy over creativity  |
| `max_tokens`  | 2048             | Room for detailed findings + sources    |
| `timeout`     | 30               | Per execution-rule timeout              |
| `api_key_env` | OPENAI_API_KEY   |                                         |

### Subagent B — Writer

| Setting       | Value            | Rationale                               |
|---------------|------------------|-----------------------------------------|
| `provider`    | openai           | Primary provider                        |
| `model`       | gpt-4o           | Strong at fluent generation             |
| `temperature` | 0.7              | Higher — creative, varied writing       |
| `max_tokens`  | 2048             | Room for full draft                     |
| `timeout`     | 30               | Per execution-rule timeout              |
| `api_key_env` | OPENAI_API_KEY   |                                         |

## Design Decisions

1. **Same provider/model across agents** — simplifies API key management and billing. Swap individual agents to different models as needed.
2. **Temperature varies by role** — research (0.2) favours precision; writing (0.7) favours variety; orchestrator (0.3) favours consistency.
3. **Timeouts align with orchestrator execution rules** — subagents get 30s each; orchestrator gets 60s to cover subagent time + merge.
4. **API key via env var** — no secrets in agent definition files.
