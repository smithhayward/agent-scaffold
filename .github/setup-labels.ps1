# setup-labels.ps1
# Creates the standard agentic workflow label taxonomy on a GitHub repo.
# Requires the gh CLI to be authenticated.
#
# Usage: ./setup-labels.ps1 -Repo "smithhayward/repo-name"

param(
    [Parameter(Mandatory)]
    [string]$Repo
)

$labels = @(
    # --- Type (intent, set by humans or triage agent) ---
    @{ name = "type:bug";       color = "d73a4a"; description = "Something is broken or behaving incorrectly" },
    @{ name = "type:feature";   color = "0075ca"; description = "New capability or user-facing behavior" },
    @{ name = "type:tech-debt"; color = "e4e669"; description = "Internal improvement with no direct user impact" },
    @{ name = "type:question";  color = "d876e3"; description = "Needs an answer before work can be scoped" },
    @{ name = "type:docs";      color = "0052cc"; description = "Documentation gap or error" },

    # --- Epic (intent, set by humans) ---
    @{ name = "epic:EP-01"; color = "bfd4f2"; description = "Telemetry Ingestion" },
    @{ name = "epic:EP-02"; color = "bfd4f2"; description = "Variable Mapping" },
    @{ name = "epic:EP-03"; color = "bfd4f2"; description = "Layout Builder" },
    @{ name = "epic:EP-04"; color = "bfd4f2"; description = "Device Management" },
    @{ name = "epic:EP-05"; color = "bfd4f2"; description = "Display Protocol" },
    @{ name = "epic:EP-06"; color = "bfd4f2"; description = "Management UI" },
    @{ name = "epic:EP-07"; color = "bfd4f2"; description = "Hosted Service Foundation" },

    # --- Blast radius (intent, set by triage agent) ---
    @{ name = "blast:high";   color = "b60205"; description = "Wrong assumption requires architectural rework" },
    @{ name = "blast:medium"; color = "e99695"; description = "Wrong assumption requires feature-level rework" },
    @{ name = "blast:low";    color = "f9d0c4"; description = "Wrong assumption requires local fix only" },

    # --- Status (state, set by agents) ---
    @{ name = "status:needs-info";           color = "fef2c0"; description = "Missing information; waiting on opener" },
    @{ name = "status:ready";                color = "0e8a16"; description = "Scoped and ready for assigned role" },
    @{ name = "status:in-progress";          color = "006b75"; description = "An agent is actively working this issue" },
    @{ name = "status:blocked";              color = "b60205"; description = "Cannot proceed; blocker in comments" },
    @{ name = "status:human-required";       color = "e4e669"; description = "Product decision needed before agent can proceed" },
    @{ name = "status:sme-required";         color = "d876e3"; description = "Domain knowledge gap; route to SME" },
    @{ name = "status:root-cause-confirmed"; color = "006b75"; description = "Bug root cause identified; fix approved" },
    @{ name = "status:review-pending";       color = "0075ca"; description = "PR open; reviewer needs to act" },

    # --- Role (state, set by triage agent) ---
    @{ name = "role:analyst";     color = "c5def5"; description = "Next action: feature definition or scope clarification" },
    @{ name = "role:architect";   color = "c5def5"; description = "Next action: design doc or ADR" },
    @{ name = "role:implementer"; color = "c5def5"; description = "Next action: code change" },
    @{ name = "role:tester";      color = "c5def5"; description = "Next action: test coverage" },
    @{ name = "role:reviewer";    color = "c5def5"; description = "Next action: diff review" }
)

foreach ($label in $labels) {
    Write-Host "Creating label: $($label.name)"
    gh label create $label.name `
        --repo $Repo `
        --color $label.color `
        --description $label.description `
        --force  # updates if already exists
}

Write-Host "`nDone. $(($labels).Count) labels applied to $Repo"
