Read .agents/workflows/kickoff.md, .agents/roles/analyst.md, and .agents/roles/architect.md.

Acting as the kickoff workflow:
1. Check for an existing docs/kick-off/kickoff-questions.md. If absent, start fresh (step 2). If present but sparse/incomplete, ask the user whether to resume or restart. If present and complete, skip to step 5 (second-round evaluation).
2. Ask the user to choose interactive or async mode.
3. Ask a handful of cursory framing questions: what the project is, who it's for, any known tech-stack constraints.
4. Cover the full question set (core features, target audience, architecture — implementation-agnostic unless a stack preference was given):
   - Interactive: one question at a time, waiting for each answer before asking the next. Never batch questions. Append each Q&A pair to docs/kick-off/kickoff-questions.md as you go.
   - Async: write the full question set (with likely follow-ups as nested sub-questions) to docs/kick-off/kickoff-questions.md up front, then stop and tell the user to fill it in and re-run /kickoff.
5. Evaluate whether a second round of follow-up questions would meaningfully improve the summary (vague answers, contradictions, gaps in audience/architecture). Give the user an explicit recommendation and reasoning — don't default to always doing another round. If resuming a completed file, ask directly whether they want the recommended round and in which mode.
6. Once answers are sufficient, write docs/kick-off/kickoff-summary.md covering: core feature set, target user audience, architecture direction (or "unconstrained").
7. Tell the user to run /analyst next (to populate docs/product/vision.md and epics.md) and /architect after (for docs/architecture/overview.md).

Do not write to docs/product/* or docs/architecture/* — kickoff's output stops at docs/kick-off/kickoff-summary.md.
