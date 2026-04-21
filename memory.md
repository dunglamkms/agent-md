# Project Memory

## Conventions

- Agents defined as plain Markdown specs (not code)
- Runtime: GitHub Copilot in VS Code (no API keys needed)
- Orchestrator: Claude Opus 4.6 (copilot), temp 0.3
- Subagents: Claude Sonnet 4 (copilot)
- Output artifacts: `output/{topic-slug}-{YYYY-MM-DD}.md`
- Sources must include clickable URLs
- Traceback footer links back to agent specs

## Agents

| File | Role | Model | Temp |
|---|---|---|---|
| `dryan-agent.md` | Orchestrator | Opus 4.6 | 0.3 |
| `researcher.md` | Research | Sonnet 4 | 0.2 |
| `writer.md` | Writer | Sonnet 4 | 0.7 |
| `memory-agent.md` | Memory | Sonnet 4 | 0.1 |

## Run History

| Date | Topic | Output |
|---|---|---|
| 2026-04-19 | automation framework | `output/automation-framework-2026-04-19.md` |
| 2026-04-19 | AI agent memory architectures and patterns | `output/ai-agent-memory-architectures-and-patterns-2026-04-19.md` |
| 2026-04-21 | prompt engineering best practices | `output/prompt-engineering-best-practices-2026-04-21.md` |
