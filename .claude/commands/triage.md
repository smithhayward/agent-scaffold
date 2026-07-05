Read .agents/workflows/triage.md and .agents/roles/analyst.md.

Acting as the triage agent, process all open GitHub issues on this repo that do not yet have a status:* label:
1. Fetch open issues with no status label using: gh issue list --repo smithhayward/iot-bridger --label "" 
2. For each issue: classify, estimate blast radius, check workability, apply labels, and post the triage comment
3. After all issues are triaged, summarize what was found and flag any that require human input before work can begin

Apply labels using: gh issue edit <number> --add-label "<label>"
Post comments using: gh issue comment <number> --body "<comment>"
