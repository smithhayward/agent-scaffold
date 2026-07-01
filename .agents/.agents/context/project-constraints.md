# Project Constraints

Stable facts about this project that all agents should treat as fixed unless explicitly told otherwise.

## Non-negotiables

- Preserve existing in-progress work unless the user explicitly asks for a rewrite or cleanup pass
- Keep agent hand-offs explicit so another agent can resume without guessing
- Treat markdown docs in `.agents/` as part of the project contract, not disposable notes
- During AFK loops, follow the gap-resolution workflow before making any assumption with medium or high blast radius
- SME answers are provisional — they do not become product decisions until a human reviews `context/assumptions.md`

## Performance targets

<!-- Add: latency, throughput, message size limits -->

## Security requirements

<!-- Add: auth model, credential handling rules, network isolation expectations -->

## Deployment environment

<!-- Add: target OS/hardware, container vs bare-metal, update mechanism -->