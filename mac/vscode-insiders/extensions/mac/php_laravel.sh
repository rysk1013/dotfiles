#!/bin/sh

# インストールする拡張機能
extensions=(
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

for extension in "${extensions[@]}"; do
  code-insiders --install-extension $extension --force
done
