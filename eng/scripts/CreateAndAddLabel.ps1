# create_and_add_label.ps1

param (
    [string]$GITHUB_TOKEN,
    [string]$REPO,
    [int]$PR_NUMBER,
    [string]$NEW_LABEL
)

# Create the new label
$headers = @{
    Authorization = "token $GITHUB_TOKEN"
    Accept        = "application/vnd.github.v3+json"
}

$labelPayload = @{
    name  = $NEW_LABEL
    color = "f29513"  # You can customize the color
} | ConvertTo-Json

Invoke-RestMethod -Uri "https://api.github.com/repos/$REPO/labels" -Headers $headers -Method Post -Body $labelPayload

# Add the new label to the PR
$addLabelPayload = @{
    labels = @($NEW_LABEL)
} | ConvertTo-Json

Invoke-RestMethod -Uri "https://api.github.com/repos/$REPO/issues/$PR_NUMBER/labels" -Headers $headers -Method Post -Body $addLabelPayload
