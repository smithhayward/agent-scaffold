# Workflow: Bug Investigation

## Steps

1. **Investigator** (general-purpose agent) - reproduces the bug, identifies the root cause, and writes a short findings doc: what is wrong, where in the code, and why it happens
2. **Human** reviews findings and approves the fix approach
3. **Implementer** - applies the minimal fix; no opportunistic cleanup
4. **Reviewer** - verifies the fix is correct and does not regress anything

## Notes

- Do not jump to fixing before the root cause is confirmed
- If the bug is a protocol edge case, check `docs/protocols/` for expected behavior before assuming the code is wrong