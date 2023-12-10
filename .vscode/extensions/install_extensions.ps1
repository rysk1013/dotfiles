# インストールする拡張機能
$extensions = @(
  'formulahendry.auto-close-tag'
  'formulahendry.auto-rename-tag'
  'naumovs.color-highlight'
  'pranaygp.vscode-css-peek'
  'ms-vscode-remote.remote-containers'
  'ms-azuretools.vscode-docker'
  'mikestead.dotenv'
  'eamodio.gitlens'
  'abusaidm.html-snippets'
  'sgryjp.japanese-word-handler'
  'xabikos.javascriptsnippets'
  'onecentlin.laravel5-snippets'
  'ms-vsliveshare.vsliveshare'
  'ms-vsliveshare.vsliveshare-pack'
  'davidanson.vscode-markdownlint'
  'pkief.material-icon-theme'
  'christian-kohler.path-intellisense'
  'xdebug.php-debug'
  'neilbrayfield.php-docblocker'
  'bmewburn.vscode-intelephense-client'
  'esbenp.prettier-vscode'
  'redhat.vscode-yaml'
  'coenraads.bracket-pair-colorizer-2'
  'steoates.autoimport'
  'hookyqr.beautify'
  'wmaurer.change-case'
  'sirtobi.code-clip-ring'
  'mrmlnc.vscode-duplicate'
  'editorconfig.editorconfig'
  'dbaeumer.vscode-eslint'
  'mhutchie.git-graph'
  'donjayamanne.githistory'
  'trixnz.go-to-method'
  'vincaslt.highlight-matching-tag'
  'oderwat.indent-rainbow'
  'nickdemayo.vscode-json-editor'
  'clemenspeters.format-json'
  'nextfaze.json-parse-stringify'
  'eriklynd.json-tools'
  'ryannaddy.laravel-artisan'
  'onecentlin.laravel-blade'
  'amiralizadeh9480.laravel-extra-intellisense'
  'ritwickdey.liveserver'
  'ryu1kn.partial-diff'
  'quicktype.quicktype'
  'ionutvmi.path-autocomplete'
  'johnpapa.vscode-peacock'
  'junstyle.php-cs-fixer'
  'mehedidracula.php-namespace-resolver'
  'brapifra.phpserver'
  'persoderlind.vscode-phpcbf'
  'arjun.swagger-viewer'
  'shardulm94.trailing-spaces'
  'mosapride.zenkaku'
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
  code --install-extension $extension --force
}
