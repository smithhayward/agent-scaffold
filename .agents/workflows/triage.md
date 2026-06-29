# Workflow: Issue Triage

Triage runs on every new GitHub issue — whether opened by a human or an agent. The goal is to make the issue agent-workable: classified, scoped, labeled, and either ready to route or returned to the opener with specific questions.

A triage agent plays the **analyst** role during triage. Do not begin implementation, design, or investigation during triage.

---

## Label taxonomy

Labels use two namespaces: **intent** (set by humans) and **state** (set by agents). Never overwrite an intent label; never let a human overwrite a state label without understanding the downstream effect.

### Intent labels — set by humans (or triage agent on first pass)

| Label | Meaning |
|---|---|
| `type:bug` | Something is broken or behaving incorrectly |
| `type:feature` | New capability or user-facing behavior |
| `type:tech-debt` | Internal improvement with no direct user impact |
| `type:question` | Needs an answer before work can be scoped |
| `type:docs` | Documentation gap or error |
| `epic:EP-01` … `epic:EP-07` | Which epic this issue belongs to |
| `blast:high` | Wrong assumption requires architectural rework |
| `blast:medium` | Wrong assumption requires feature-level rework |
| `blast:low` | Wrong assumption requires local fix only |

### State labels — set by agents

| Label | Meaning |
|---|---|
| `status:needs-info` | Triage found missing information; waiting on opener |
| `status:ready` | Fully scoped and ready for the assigned role to pick up |
| `status:in-progress` | An agent is actively working this issue |
| `status:blocked` | Work cannot proceed; blocker identified in comments |
| `status:human-required` | Contains a product decision; agent cannot proceed without human input |
| `status:sme-required` | Contains a domain knowledge gap; route to SME before implementation |
| `status:root-cause-confirmed` | Bug investigation complete; fix approved to proceed |
| `status:review-pending` | PR is open; reviewer agent or human needs to act |

### Role labels — set by triage agent

| Label | Meaning |
|---|---|
| `role:analyst` | Next action is feature definition or scope clarification |
| `role:architect` | Next action is design doc or ADR |
| `role:implementer` | Next action is code change |
| `role:tester` | Next action is test coverage |
| `role:reviewer` | Next action is diff review |

---

## Triage steps

### Step 1: Read the issue

Read the full issue body. If the issue was opened by an agent, also read the referenced context files or branch.

### Step 2: Classify

Apply one `type:*` label. If the issue could be more than one type, pick the dominant one and note the ambiguity in the triage comment.

### Step 3: Check for missing information

A workable issue must have:
- [ ] A clear description of the problem or desired outcome
- [ ] A "done when" condition (what does success look like?)
- [ ] For bugs: reproduction steps and observed vs. expected behavior
- [ ] For features: which epic it belongs to, or enough context to map it

If any of these are missing, apply `status:needs-info`, post the triage comment with specific questions (see template below), and stop. Do not proceed to step 4 until the opener responds.

### Step 4: Estimate blast radius

Apply one `blast:*` label based on: if the implementation assumption turns out to be wrong, how much work gets reworked?

- **high** — affects architecture, data model, API contract, or security
- **medium** — affects one feature's implementation but not its interface
- **low** — affects a local detail with no downstream impact

### Step 5: Map to epic

Apply the relevant `epic:EP-NN` label. If no existing epic fits, note this in the triage comment — a new epic may need to be defined by the analyst before work begins.

### Step 6: Detect product decisions and domain gaps

Scan the issue for questions that must be answered before implementation. Classify each:

- **Product decision** → apply `status:human-required`, call it out explicitly in the triage comment
- **Domain knowledge gap** → apply `status:sme-required`, describe the gap
- **Neither** → proceed to step 7

### Step 7: Assign role and set status

Based on type and blast radius, apply the appropriate `role:*` label for the next agent to act:

| Scenario | Role |
|---|---|
| Feature with no design doc yet | `role:analyst` → then `role:architect` |
| Feature with approved design doc | `role:implementer` |
| Bug with unknown root cause | `role:implementer` (investigation mode) |
| Bug with confirmed root cause | `role:implementer` (fix mode) |
| Code change needs test coverage | `role:tester` |
| PR open and needs review | `role:reviewer` |

Apply `status:ready` only if no `status:needs-info`, `status:human-required`, or `status:sme-required` labels are present.

---

## Triage comment template

Post this comment on every triaged issue. Fill in all fields; do not skip sections.

```
## Triage

**Type:** bug | feature | tech-debt | question | docs
**Blast radius:** high | medium | low — _<one sentence reason>_
**Epic:** EP-NN or _none matched — suggest new epic_

**Workability check:**
- [ ] Clear description
- [ ] Done-when condition
- [ ] Reproduction steps (bugs only)
- [ ] Epic mapping

**Missing information** _(if any):_
> <specific questions for the opener — one per bullet>

**Product decisions requiring human input** _(if any):_
> <what needs to be decided before an agent can proceed>

**Domain knowledge gaps** _(if any):_
> <what the SME should answer before implementation>

**Recommended next action:** <role> — <one sentence describing the first agent action>
```

---

## Routing after triage

```
Issue opened
    ↓
Triage agent reads + labels
    ↓
Missing info? ──yes──→ status:needs-info → wait for opener
    ↓ no
Product decision? ──yes──→ status:human-required → wait for human
    ↓ no
Domain gap? ──yes──→ status:sme-required → SME workflow → back to triage
    ↓ no
Apply role label + status:ready
    ↓
Feature? → role:analyst → role:architect → role:implementer → role:tester → role:reviewer
Bug?     → role:implementer (investigate) → status:root-cause-confirmed → role:implementer (fix) → role:reviewer
```

---

## Label setup

To apply this label taxonomy to a new GitHub repo, run the setup script:

```powershell
.github/setup-labels.ps1 -Repo "owner/repo-name"
```

See [`.github/setup-labels.ps1`](../../.github/setup-labels.ps1) for the full label definitions.
