#!/bin/sh

# インストールする拡張機能
extensions=(
  'formulahendry.auto-close-tag'
  'formulahendry.auto-rename-tag'
  'vincaslt.highlight-matching-tag'
  'pranaygp.vscode-css-peek'
  'xabikos.javascriptsnippets'
  'onecentlin.laravel5-snippets'
)

for extension in "${extensions[@]}"; do
  code --install-extension $extension --force
done
