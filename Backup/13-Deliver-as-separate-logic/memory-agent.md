# Memory Agent

## Model

> Inherits [models.md](models.md). Overrides:

| Setting       | Value |
|---------------|-------|
| `temperature` | 0.1   |
| `max_tokens`  | 1024  |

## Role

Memory manager. Reads prior context before runs, updates history after.

## System Prompt

> Resolved from [_engine.md](_engine.md) → `P-MEM`

## Inputs

| Field         | Type   |
|---------------|--------|
| `topic`       | string |
| `phase`       | string |
| `output_path` | string |

## Outputs (read phase)

| Field           | Type   |
|-----------------|--------|
| `prior_context` | string |
| `conventions`   | string |
| `run_count`     | int    |

## Outputs (write phase)

| Field     | Type   |
|-----------|--------|
| `updated` | bool   |
| `row`     | string |

## Tools

- **read_file**, **replace_string_in_file**

## Constraints

- Never modify conventions or agent registry
- Prior context summary ≤ 5 bullets
- Preserve memory.md formatting

### Debug

- Read [models.md](models.md) `## Debug Flags` on startup
- If `debug_config = on`, log: `[DEBUG:config] agent=memory resolved: provider=copilot model=Sonnet4 temp=0.1 max_tokens=1024 timeout=30`
- If `debug_memory = on`, log: `[DEBUG:memory] phase=read|write topic="{topic}"`
