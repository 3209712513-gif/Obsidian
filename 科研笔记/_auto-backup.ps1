$vaultPath = "D:\Desktop\research-vault"
$date = Get-Date -Format "yyyy-MM-dd"

Write-Output "[$(Get-Date)] Starting daily backup..."

Set-Location $vaultPath

git add -A

$status = git status --porcelain
if ([string]::IsNullOrWhiteSpace($status)) {
    Write-Output "[$(Get-Date)] No changes to commit."
    exit 0
}

git commit -m "daily backup $date"
git push origin master

Write-Output "[$(Get-Date)] Backup complete!"
