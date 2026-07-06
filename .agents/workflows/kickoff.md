# Workflow: Kickoff

Bootstraps a new project's documentation before analyst/architect work begins. Interrogates the user (interactively or asynchronously) to surface the core feature set, target user audience, and architecture direction, then produces a summary doc that seeds `docs/product/` and `docs/architecture/`.

## Steps

0. **Resume check** — before asking anything, look for `docs/kick-off/kickoff-questions.md`.
   - Not found: fresh kickoff, go to step 1.
   - Found but sparse/incomplete (only a couple of questions answered, cuts off mid-section, no meaningful content): tell the user it looks like a prior session was interrupted or left unfinished; ask whether to resume answering that file or restart fresh.
   - Found and reasonably complete: this is a returning session — skip directly to step 3a.

1. **Choose mode** — ask the user to pick interactive or async.

2. **Cursory framing questions** (both modes) — a handful of quick questions: what the project is, who it's for, and any known tech-stack constraints.

3. **Full question set** — covering core features, target audience, and architecture (implementation-agnostic unless a stack preference was named in step 2).
   - **Interactive**: ask one question at a time, wait for the answer before asking the next — never batch multiple questions in one message. Append each Q&A pair to `docs/kick-off/kickoff-questions.md` as it happens.
   - **Async**: write the entire question set (including likely follow-ups, framed as nested sub-questions) to `docs/kick-off/kickoff-questions.md` up front, then stop. Tell the user to fill in answers inline and re-run `/kickoff` to resume.

3a. **Second-round evaluation** — once a round of answers is complete (fresh or resumed session), review them for vagueness, contradictions, or unaddressed gaps in audience/architecture. Give the user an explicit recommendation on whether another round of follow-up questions is worth doing, and explain why. Don't default to always running a second round.
   - If resuming an already-complete file, ask the user directly whether they want the recommended follow-up round, and if so, interactive or async (same mechanics as step 3).
   - If the user declines, proceed to step 4 with what's available.

4. **Summarize** — write `docs/kick-off/kickoff-summary.md` synthesizing the answers: core feature set, target user audience, architecture direction (or "unconstrained" if no stack preference was given).

5. **Hand off** — tell the user to run `/analyst` next to turn the summary into `docs/product/vision.md` and `docs/product/epics.md`, and `/architect` to turn it into `docs/architecture/overview.md`. Kickoff never edits those files itself — it stops at the summary so the handoff stays reviewable.

## Hand-off conventions

- Kickoff only ever writes inside `docs/kick-off/`; it does not touch `docs/product/*` or `docs/architecture/*`.
- Analyst and Architect should read `docs/kick-off/kickoff-summary.md` (if present) as additional input alongside their normal inputs.
