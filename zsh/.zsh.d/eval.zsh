#### starship ####
eval "$(starship init zsh)"

#### sheldon ####
eval "$(sheldon source)"

#### zoxide ####
eval "$(zoxide init zsh --cmd cd)"

#### mise ####
eval "$(mise activate zsh)"

#### kiro ####
[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

#### Ruby ####
eval "$(rbenv init - zsh)"
