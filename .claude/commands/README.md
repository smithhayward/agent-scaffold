# Project Skills

Custom slash commands available in Claude Code when working in this repo. Each `.md` file here becomes an invocable skill.

## Session management

- `/continue` — read STATUS.md and orient for the session; confirms next action before doing anything
- `/status-update` — update STATUS.md to reflect end-of-session state; always run before committing at the end of a session

## Project setup

- `/kickoff` — bootstrap a new project's docs via guided Q&A (interactive or async); produces docs/kick-off/kickoff-summary.md for /analyst and /architect to build on

## Agent role skills

- `/analyst` — run the analyst role against the current epic(s) in STATUS.md; surfaces open questions and MVP cuts before writing anything
- `/architect` — run the architect role against approved feature definitions; produces design doc stubs for human review
- `/triage` — process all untriaged GitHub issues; applies labels and posts triage comments

## Planned skills

- `/implementer` — run the implementer role against an approved design doc
- `/reviewer` — run the reviewer role against the current diff
- `/new-adr` — scaffold a new ADR with the correct format and next sequence number
- `/new-design` — scaffold a design spec in docs/design/ with status Draft
