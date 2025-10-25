#!/bin/sh

# インストールする拡張機能
extensions=(
  'naumovs.color-highlight'
  'ms-vscode-remote.remote-containers'
  'ms-azuretools.vscode-docker'
  'mikestead.dotenv'
  'eamodio.gitlens'
  'sgryjp.japanese-word-handler'
  'ms-vsliveshare.vsliveshare'
  'ms-vsliveshare.vsliveshare-pack'
  'davidanson.vscode-markdownlint'
  'pkief.material-icon-theme'
  'christian-kohler.path-intellisense'
  'esbenp.prettier-vscode'
  'redhat.vscode-yaml'
  'steoates.autoimport'
  'wmaurer.change-case'
  'sirtobi.code-clip-ring'
  'mrmlnc.vscode-duplicate'
  'editorconfig.editorconfig'
  'dbaeumer.vscode-eslint'
  'mhutchie.git-graph'
  'donjayamanne.githistory'
  'trixnz.go-to-method'
  'oderwat.indent-rainbow'
  'nickdemayo.vscode-json-editor'
  'clemenspeters.format-json'
  'nextfaze.json-parse-stringify'
  'eriklynd.json-tools'
  'ritwickdey.liveserver'
  'ryu1kn.partial-diff'
  'quicktype.quicktype'
  'ionutvmi.path-autocomplete'
  'johnpapa.vscode-peacock'
  'arjun.swagger-viewer'
  'shardulm94.trailing-spaces'
  'mosapride.zenkaku'
  'wayou.vscode-todo-highlight'
)

for extension in "${extensions[@]}"; do
  code-insiders --install-extension $extension --force
done
