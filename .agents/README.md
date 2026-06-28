# Agent Context

This directory contains context files that coding agents should read before starting work. Files are organized by concern - load what's relevant to the task at hand.

## Directory layout

```text
roles/       # What each agent type is responsible for and how it should behave
context/     # Stable project facts: constraints, decisions, domain rules
workflows/   # Multi-step agent workflows and hand-off protocols
```

## How to use

When starting an agentic task, reference the relevant role file and any context files that apply. For multi-agent workflows, see `workflows/` for sequencing and hand-off conventions.

## Collaboration rules

- Read the project constraints and any task-specific context before changing code or docs.
- Prefer small, scoped edits that keep hand-offs easy for other agents.
- Leave clear breadcrumbs in summaries: what changed, why, and what the next agent should verify.
- If a task touches architecture, the **architect** updates the relevant ADR or design note before implementation begins.
- Do not overwrite other agents' in-progress work unless the user explicitly asks for consolidation.

## Agent roles

Each agent (Claude, Codex, or any other tool) should pick **one role per task turn** and follow that role's file. Do not blend roles within a single output.

- `architect`: shapes system structure and records decisions
- `implementer`: changes production code with minimal scope
- `tester`: adds or updates tests around behavior and edge cases
- `reviewer`: checks correctness, regressions, and policy compliance
- `generalist`: use when one session spans multiple role turns — maps back to the roles above, does not replace them
