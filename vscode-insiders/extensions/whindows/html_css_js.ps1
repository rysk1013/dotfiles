# インストールする拡張機能
$extensions = @(
    'formulahendry.auto-close-tag'
  'formulahendry.auto-rename-tag'
  'vincaslt.highlight-matching-tag'
  'pranaygp.vscode-css-peek'
  'xabikos.javascriptsnippets'
  'onecentlin.laravel5-snippets'
)

# カレントにパスが通っていない場合は通す
if (-not $env:path.Split(';').Contains('.\')) {
    $env:path = $env:path + ';.\'
}

# binへのパスが未登録ならカレントディレクトリ変更
$binPath = Join-Path ([Environment]::GetFolderPath('LocalApplicationData')) 'Programs\Microsoft VS Code\bin'
if ($env:path.IndexOf($binpath, [System.StringComparison]::OrdinalIgnoreCase) -eq -1) {
    cd $binPath
}

# 拡張機能のインストール実行
foreach ($extension in $extensions) {
  code-insiders --install-extension $extension --force
}
