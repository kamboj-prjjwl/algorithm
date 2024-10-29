# create_new_branch.ps1
param ( 
    [string]$API_VERSION 
)

$date = Get-Date -Format "yyyy-MM-dd"
$branchName = "network-release-$API_VERSION"

git config --global user.email "kamboj.prjwl@outlook.com"
git config --global user.name "kamboj-prjjwl"
git checkout -b $branchName
git push origin $branchName
