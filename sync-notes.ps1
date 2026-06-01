# Obsidian notes auto-sync script
$REPO_DIR = "D:\ObsidianRepo"
$LOG_FILE = "D:\ObsidianRepo\sync-log.txt"
$SOURCE_A1 = "D:\Obsidian\A_1"
$SOURCE_RESEARCH = "D:\Desktop\科研笔记"

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

Set-Location $REPO_DIR

git pull origin main 2>&1 | Out-Null

Copy-Item $SOURCE_A1 "$REPO_DIR\A_1\" -Recurse -Force
Copy-Item $SOURCE_RESEARCH "$REPO_DIR\科研笔记\" -Recurse -Force

$status = git status --porcelain
if ($status) {
    git add -A
    git commit -m "auto sync notes $timestamp"
    git push origin main 2>&1 | Out-Null
    "$timestamp [OK] synced $($status.Count) files" | Out-File $LOG_FILE -Append
} else {
    "$timestamp [--] no changes, skipped" | Out-File $LOG_FILE -Append
}
