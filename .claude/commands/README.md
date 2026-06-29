# Project Skills

Custom slash commands available in Claude Code when working in this repo. Each `.md` file here becomes a `/command-name` skill.

## Conventions

- Filename = command name (e.g., `new-feature.md` → `/new-feature`)
- Each file should open with a one-line description of what the skill does
- Skills should reference agent roles and workflows from `.agents/` rather than re-defining behavior inline

## Available skills

<!-- Skills will be listed here as they are added -->

## Planned skills

- `new-feature.md` — walk the feature-development workflow for a given epic and feature ID
- `new-adr.md` — scaffold a new ADR file with the correct format and next sequence number
- `new-protocol.md` — scaffold a protocol reference doc in `docs/protocols/`
- `new-design.md` — scaffold a design spec in `docs/design/` with status Draft
- `review-feature.md` — invoke the reviewer role against the current diff with feature context
