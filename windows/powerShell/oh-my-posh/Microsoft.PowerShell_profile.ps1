# oh-my-posh
oh-my-posh init pwsh --config $env:POSH_THEMES_PATH/custom_paradox.omp.json | Invoke-Expression
# テーマがインストールされているディレクトリを開く
function omp(){ii $env:POSH_THEMES_PATH}

# powershellの設定ファイルを開く
function profile(){code "D:\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"}
# AutoHotKeyのscriptファイルを開く
function ahk(){code "C:\Users\{user name}\AutoHotKey\script.ahk"}

# Alias
function home(){cd "C:\Users\{user name}"}
function d(){cd "D:"}
