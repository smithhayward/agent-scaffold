# Workflow: Gap Resolution

Use this workflow whenever an agent hits a knowledge gap during an AFK development loop. The goal is to route the gap correctly — stopping for human input when the stakes are high, and using the SME to continue when they are not.

## Decision tree

### Step 1: Identify the gap

Write down the specific question in plain language. Vague gaps cannot be routed correctly. A well-formed gap statement has the form:

> "I don't know [X]. This matters because [Y]. If I assume [Z] and I'm wrong, the consequence is [W]."

---

### Step 2: Evaluate blast radius

Ask: if the assumption turns out to be wrong, how much work gets thrown away or needs rework?

| Blast radius | Description | Route |
|---|---|---|
| **High** | Affects architecture, data model, API contract, or security | → Stop, escalate to human |
| **Medium** | Affects one feature's implementation but not its interface | → SME if domain knowledge; human if product decision |
| **Low** | Affects a local implementation detail with no downstream impact | → SME or document assumption and continue |

---

### Step 3: Classify the question

**Is this a domain knowledge question?**
- Factual, verifiable, not specific to this product's trade-offs
- Examples: hardware limits, protocol behavior, industry conventions
- → Invoke SME role

**Is this a product decision in disguise?**
- Requires knowing what trade-offs this product intends to make
- Even if it sounds technical, the answer depends on product goals
- → Stop, escalate to human regardless of blast radius

**Is this trivially assumption-safe?**
- Low blast radius, reasonable default exists, easily reversed
- → Document the assumption in `.agents/context/assumptions.md` and continue

---

### Step 4: Act on the route

**Escalate to human:**
1. Stop the loop
2. Write a gap note to `.agents/context/assumptions.md` with status `BLOCKED`
3. Open a GitHub issue or leave a `<!-- SME-BLOCKED: <question> -->` comment at the point in the code or doc where the gap was hit
4. Do not continue work on anything that depends on this answer

**Invoke SME:**
1. Create or switch to a branch named `sme/<feature>-<YYYYMMDD>` if not already on one
2. Invoke the SME role with the gap statement and branch name
3. SME writes its answer to `.agents/context/assumptions.md`
4. Continue the loop using the SME answer; mark any code or doc that depends on it with `<!-- SME-ASSUMED: see assumptions.md -->`

**Document and continue:**
1. Write the assumption to `.agents/context/assumptions.md` with status `ASSUMED`
2. Continue the loop

---

## When the human returns

1. Review `.agents/context/assumptions.md` for all entries made during the loop
2. Review any `SME-BLOCKED` or `SME-ASSUMED` markers in code and docs
3. Resolve `BLOCKED` items and decide whether to merge, revise, or discard the SME branch
