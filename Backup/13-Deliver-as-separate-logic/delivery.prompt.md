# Delivery Build Prompt

> Use this prompt with GitHub Copilot Agent to regenerate the `Deliver/` folder from source agent files.
> Run whenever source agents are updated and you need a fresh delivery build.

---

## Prompt

```
Build the Deliver/ folder from my source agent files using the two-layer IP protection architecture.

## Source files (read these first)

- DESIGN-AGENT.md
- dryan-agent.md
- researcher.md
- writer.md
- memory-agent.md
- memory.md
- models.md

## Rules

### 1. Two-layer split

Create a `Deliver/` folder with two layers:

- **Interface layer** (what the team gets): agent shell files that define role, model overrides, inputs, outputs, constraints, and debug — but NO system prompts, NO rationale, NO design decisions, NO workflow diagrams.
- **Engine layer** (`_engine.md`, private): contains ALL system prompts, orchestration logic, merge rules, timeout/error strategy, and design rationale.

### 2. Engine file (`_engine.md`)

- Header: `# ⛔ ENGINE — DO NOT DISTRIBUTE`
- Section `## Prompt Registry` with named prompt blocks: `P-ORCH`, `P-RES`, `P-WRT`, `P-MEM` — one per agent, containing the full system prompt text from each source agent.
- Section `## Orchestration Logic` with dispatch order, merge rules, timeout & error handling — extracted from dryan-agent.md workflow and execution rules.
- Section `## Design Rationale` with all "Rationale" column content, "Design Decisions" content, and architecture notes from DESIGN-AGENT.md. Keep as private notes.

### 3. Agent shell files

For each agent (dryan-agent.md, researcher.md, writer.md, memory-agent.md):

- Keep: `## Model` (overrides table only, NO rationale column), `## Role` (one-line summary), `## Inputs`, `## Outputs`, `## Tools`, `## Constraints`, `### Debug`.
- Replace `## System Prompt` content with: `> Resolved from [_engine.md](_engine.md) → \`P-XXX\``
- For the orchestrator, replace the `## Workflow` diagram and `## Execution Rules` with bullet references to `_engine.md` sections.
- Remove all comments, rationale columns, and design explanation text.

### 4. models.md

- Keep `## Defaults` table, `## Debug Flags` table, `## Debug Log` table.
- Remove `## Common Settings` description table (from DESIGN-AGENT.md).
- Remove all `Description` columns from Debug Flags.

### 5. memory.md

- Keep `## Conventions`, `## Agents` (but strip model/temp columns — only File and Role), `## Run History` (empty table header, no rows).
- Remove any model-specific or temperature info from conventions.

### 6. Supporting files

- `README.md`: Usage guide only — how to invoke, file list with one-line purpose, requirements. No architecture details.
- `.gitignore`: Block `_engine.md` and `output/` from being committed.

### 7. What must NOT appear in Deliver/ (except inside _engine.md)

- Actual system prompt text (the ``` blocks from source agents)
- Workflow ASCII diagrams
- "Rationale" or "Design Decisions" content
- DESIGN-AGENT.md file itself
- Temperature/model reasoning
- Merge conflict resolution logic
- Memory two-phase architecture explanation

## Output

Create all files in Deliver/. Confirm with a file tree and a table showing what was protected.
```

---

## When to re-run

- After modifying any source agent's system prompt
- After adding/removing a subagent
- After changing model config or debug flags
- After updating orchestration workflow or merge rules
- Before sharing with a new team member
