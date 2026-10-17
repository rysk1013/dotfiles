#!/bin/sh

# インストールする拡張機能
extensions=(
  # Git・バージョン管理
  'eamodio.gitlens',
  'mhutchie.git-graph',
  'donjayamanne.githistory',
  'ryu1kn.partial-diff',
  # コンテナ・リモート開発
  'ms-vscode-remote.remote-containers',
  'ms-azuretools.vscode-docker',
  # コード品質・Lint・フォーマット
  'esbenp.prettier-vscode',
  'dbaeumer.vscode-eslint',
  'davidanson.vscode-markdownlint',
  'editorconfig.editorconfig',
  'clemenspeters.format-json',
  'eriklynd.json-tools',
  # パス補完・インポート支援
  'christian-kohler.path-intellisense',
  'ionutvmi.path-autocomplete',
  'steoates.autoimport',
  'trixnz.go-to-method',
  # UI・表示カスタマイズ
  'pkief.material-icon-theme',
  'johnpapa.vscode-peacock',
  'oderwat.indent-rainbow',
  'naumovs.color-highlight',
  'wayou.vscode-todo-highlight',
  # JSON・API・データ系
  'nickdemayo.vscode-json-editor',
  'nextfaze.json-parse-stringify',
  'quicktype.quicktype',
  'arjun.swagger-viewer',
  'redhat.vscode-yaml',
  # ユーティリティ
  'shardulm94.trailing-spaces',
  'mikestead.dotenv',
  'wmaurer.change-case',
  'sirtobi.code-clip-ring',
  'mrmlnc.vscode-duplicate',
  'sgryjp.japanese-word-handler',
  'mosapride.zenkaku',
)

for extension in "${extensions[@]}"; do
  code --install-extension $extension --force
done
