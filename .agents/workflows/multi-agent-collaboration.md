# Workflow: Multi-Agent Collaboration

Use this workflow when more than one agent is contributing to the same task or when any agent joins an existing thread mid-stream.

## Steps

1. **Locate context** - read the task, relevant role file, and any applicable project constraints or design docs
2. **Check ownership** - identify what has already been done and avoid duplicating or clobbering another agent's work
3. **Select the next slice** - make the smallest change that advances the hand-off cleanly
4. **Verify locally** - run the project test suite (see verification commands in `CLAUDE.md`); if no suite exists yet, manually verify via the `/run` workflow and document what was tested in the hand-off note
5. **Hand off clearly** - summarize changes, known gaps, and the best next agent or reviewer for follow-up

## Collaboration rules

- If two agents propose conflicting approaches, pause and surface the tradeoff instead of merging them silently
- Keep docs in sync with code when the docs are part of the coordination contract
- Preserve existing worktree changes unless they directly block the current task
- Prefer explicit file references and concrete verification steps in summaries

## When to use

- A task is split across architect, implementer, tester, and reviewer
- Any agent (Codex, Claude, etc.) is asked to continue work started by another agent
- The repo needs a stable operating model for parallel or sequential agent assistance
