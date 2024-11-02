# fetch_label.ps1

param (
    [string]$GITHUB_TOKEN,
    [string]$REPO,
    [int]$PR_NUMBER
)

# Fetch the labels from the PR
$headers = @{
    Authorization = "token $GITHUB_TOKEN"
    Accept        = "application/vnd.github.v3+json"
}

$labels = Invoke-RestMethod -Uri "https://api.github.com/repos/$REPO/issues/$PR_NUMBER/labels" -Headers $headers -Method Get

# Increment API Version
$apiVersionLabel = $labels | Where-Object { $_.name -match 'SWG_API-VER-\d{4}-\d{2}-\d{2}' } | Select-Object -First 1 
$apiVersion = $apiVersionLabel.name 
$apiVersionDate = [datetime]::ParseExact($apiVersion.Substring(8), 'yyyy-MM-dd', $null) 
$updatedApiVersionDate = $apiVersionDate.AddMonths(2) 
$updatedApiVersion = "API-VER-" + $updatedApiVersionDate.ToString('yyyy-MM-dd') 

# Set API Version in ENV variable
echo "::set-output name=api_version::$updatedApiVersion"  
