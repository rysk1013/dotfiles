#################
# zsh設定ファイル（.zshrc）を分割する
#################

ZSHHOME="${HOME}/.zsh.d"

if [[ -d "$ZSHHOME" && -r "$ZSHHOME" && -x "$ZSHHOME" ]]; then
  for conf in "$ZSHHOME"/*.zsh(N-.); do
    [[ -r "$conf" ]] && source "$conf"
  done
fi
