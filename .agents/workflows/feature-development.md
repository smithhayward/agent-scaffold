# Workflow: Feature Development

Standard multi-agent sequence for shipping a new feature or protocol adapter.

## Steps

1. **Architect** — reads the feature request + relevant ADRs, produces a design doc in `docs/design/<feature>.md` and any new ADR in `docs/adr/`
2. **Review design** — human reviews and approves the design doc before implementation begins
3. **Implementer** — reads the approved design doc, writes code; no scope creep
4. **Tester** — writes tests against the new code; flags any gaps back to Implementer
5. **Reviewer** — reviews the full diff (code + tests); must pass before merge

## Hand-off conventions

- Each agent outputs a brief summary of what it did and what the next agent needs to know
- Blockers are surfaced immediately rather than worked around silently
- If the implementer discovers the design is wrong, they stop, add a `## Implementation Notes` section to the design doc describing the conflict, and the Architect is re-invoked to revise the spec before coding resumes
