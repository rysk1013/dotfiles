# PowerShellにgitブランチを表示させる
# ファイルパス
# C:\Users\ユーザ名\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

function prompt {
  $branch = ""
  if (git branch) {
    (git branch | select-string "^\*").ToString() | set-variable -name branch
    $branch = $branch.trim() -replace "^\* *", ""
  }
  Write-Host("[") -NoNewline -ForegroundColor White
  Write-Host($(get-location)) -NoNewline -ForegroundColor Cyan
  Write-Host("]") -NoNewline -ForegroundColor White
  if ($branch -ne "") {
    Write-Host(" (") -NoNewline -ForegroundColor White
    Write-Host($branch) -NoNewline -ForegroundColor Yellow
    Write-Host(")") -NoNewline -ForegroundColor White
  }
  return "`n$ "
}
