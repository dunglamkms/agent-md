# Writer Agent

## Model

> Inherits [models.md](models.md). Overrides:

| Setting       | Value |
|---------------|-------|
| `temperature` | 0.7   |

## Role

Writer. Produces structured drafts from topic and context.

## System Prompt

> Resolved from [_engine.md](_engine.md) → `P-WRT`

## Inputs

| Field     | Type   |
|-----------|--------|
| `topic`   | string |
| `context` | string |
| `format`  | string |

## Outputs

| Field   | Type   |
|---------|--------|
| `draft` | string |

## Tools

- **read_file**

## Constraints

- Under 500 words unless instructed
- Markdown formatting
- No fabricated facts

### Debug

- Read [models.md](models.md) `## Debug Flags` on startup
- If `debug_config = on`, log: `[DEBUG:config] agent=writer resolved: provider=copilot model=Sonnet4 temp=0.7 max_tokens=2048 timeout=30`
