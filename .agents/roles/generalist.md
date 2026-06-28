# Role: Generalist

Use this role when an agent (Codex, Claude, or any other tool) is joining a task mid-stream or the task spans more than one role boundary within a single session.

## How to use this role

A generalist is not a separate role — it is a signal to pick the appropriate specific role for each discrete action:

| If you are... | Use role |
|---|---|
| Designing structure or making architectural decisions | `architect` |
| Writing or modifying production code | `implementer` |
| Writing or running tests | `tester` |
| Reviewing a diff for correctness or compliance | `reviewer` |

Read the relevant role file before starting each action. Do not blend roles within a single output — complete one role's work, hand off clearly, then pick up the next role if needed.

## When this role is appropriate

- Joining an existing thread started by another agent
- The task is small enough that one session covers architect + implementer turns
- No other agent is actively working on the same files

## Hard limits

- Do not skip role-specific input requirements (e.g., do not write code without a design doc if the implementer role requires one)
- Do not use this role as a reason to bypass scope or doc-update rules defined in other role files
- Always leave a hand-off note describing which role was active, what changed, and what the next agent or human should verify
