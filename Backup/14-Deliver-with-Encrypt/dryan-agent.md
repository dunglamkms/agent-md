# Dryan Agent

## Model

> Inherits [models.md](models.md). Overrides:

| Setting      | Value                     |
|--------------|---------------------------|
| `model`      | Claude Opus 4.6 (copilot) |
| `max_tokens` | 1024                      |
| `timeout`    | 60                        |

## Role

Orchestrator. Coordinates subagents and merges results.

## System Prompt

> Resolved from [_engine.md](_engine.md) → `P-ORCH`

## Subagents

| Agent | Runs | Ref |
|-------|------|-----|
| Researcher | parallel | [researcher.md](researcher.md) |
| Writer | parallel | [writer.md](writer.md) |
| Memory | parallel | [memory-agent.md](memory-agent.md) |

## Execution

- Load system prompt from `_engine.md#P-ORCH`
- Load orchestration logic from `_engine.md#Orchestration Logic`
- Dispatch subagents per `_engine.md#Dispatch Order`
- Apply merge rules from `_engine.md#Merge Rules`
- Apply merge template from `_engine.md#Merge Template`
- Save output artifact per `_engine.md#Output Artifact`
- Apply timeout/error rules from `_engine.md#Timeout & Error`

## Inputs

| Field     | Type   |
|-----------|--------|
| `request` | string |

## Outputs

| Field      | Type   |
|------------|--------|
| `topic`    | string |
| `prior`    | string |
| `research` | string |
| `draft`    | string |
| `sources`  | list   |
| `merged`   | string |
| `file`     | string |

### Debug

- Read [models.md](models.md) `## Debug Flags` on startup
- If any flag `on`, create: `output/debug-{topic-slug}-{YYYY-MM-DD}.log`
- If `debug_config = on`, log: `[DEBUG:config] agent=dryan resolved: provider=copilot model=Opus4.6 temp=0.3 max_tokens=1024 timeout=60`
- If `debug_dispatch = on`, log subagent dispatch and completion timestamps
- If `debug_merge = on`, log merge inputs summary and output path
