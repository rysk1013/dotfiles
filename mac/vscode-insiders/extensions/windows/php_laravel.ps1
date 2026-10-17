# インストールする拡張機能
$extensions = @(
  'xdebug.php-debug'
  'neilbrayfield.php-docblocker'
  'bmewburn.vscode-intelephense-client'
  'ryannaddy.laravel-artisan'
  'onecentlin.laravel-blade'
  'amiralizadeh9480.laravel-extra-intellisense'
  'junstyle.php-cs-fixer'
  'mehedidracula.php-namespace-resolver'
  'brapifra.phpserver'
  'persoderlind.vscode-phpcbf'
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
