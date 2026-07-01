# Workflow: Feature Development

Standard multi-agent sequence for shipping a new feature or protocol adapter.

## Steps

1. **Analyst** — reads vision docs, notes, or the feature request; produces or updates the epic and feature stub in `docs/product/`; surfaces open questions before handing off
2. **Review feature** — human resolves open questions and approves the feature definition
3. **Architect** — reads the approved feature definition + relevant ADRs; produces a design doc in `docs/design/<feature>.md` and any new ADR in `docs/adr/`
4. **Review design** — human reviews and approves the design doc before implementation begins
5. **Implementer** — reads the approved design doc, writes code; no scope creep
6. **Tester** — writes tests against the new code; flags any gaps back to Implementer
7. **Reviewer** — reviews the full diff (code + tests); must pass before merge

## Hand-off conventions

- Each agent outputs a brief summary of what it did and what the next agent needs to know
- Blockers are surfaced immediately rather than worked around silently
- If the implementer discovers the design is wrong, they stop, add a `## Implementation Notes` section to the design doc describing the conflict, and the Architect is re-invoked to revise the spec before coding resumes
