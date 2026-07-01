# Workflow: Bug Investigation

All bugs enter through triage. Do not begin investigation until the issue has `status:ready` and `role:implementer`. See `.agents/workflows/triage.md` for the full triage process.

## Steps

1. **Triage** — classifies the bug, checks for missing reproduction steps, estimates blast radius, applies labels; see `triage.md`
2. **Investigator** (implementer role) — reproduces the bug, identifies root cause, posts findings as a GitHub issue comment, applies `status:root-cause-confirmed`
3. **Human** reviews findings comment and applies `status:approved-for-fix` (or closes if not a bug)
4. **Implementer** — applies the minimal fix on a branch named `fix/issue-NNN`; no opportunistic cleanup
5. **Reviewer** — verifies the fix is correct and does not regress anything; posts verdict as PR review comment

## Notes

- Do not jump to fixing before root cause is confirmed and human-approved
- If the bug is a protocol edge case, check `docs/protocols/` for expected behavior before assuming the code is wrong
- If investigation reveals a domain knowledge gap, follow the gap-resolution workflow before proceeding