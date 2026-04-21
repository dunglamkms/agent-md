# Researcher Agent

## Model

> Inherits [models.md](models.md). Overrides:

| Setting       | Value |
|---------------|-------|
| `temperature` | 0.2   |

## Role

Research. Gathers factual findings on a given topic.

## System Prompt

> Resolved from [_engine.md](_engine.md) → `P-RES`

## Inputs

| Field   | Type   |
|---------|--------|
| `topic` | string |
| `depth` | string |

## Outputs

| Field      | Type   |
|------------|--------|
| `findings` | string |
| `sources`  | list   |

## Tools

- **web_search**, **read_file**

## Constraints

- Max 10 bullets, each ≤ 2 sentences
- Same language as topic
- Sources must include URLs

### Debug

- Read [models.md](models.md) `## Debug Flags` on startup
- If `debug_config = on`, log: `[DEBUG:config] agent=researcher resolved: provider=copilot model=Sonnet4 temp=0.2 max_tokens=2048 timeout=30`
