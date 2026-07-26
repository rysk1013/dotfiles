# タブタイトルの再設定

autoload -Uz add-zsh-hook

set_wezterm_tab_title() {
	[[ "$TERM_PROGRAM" == "WezTerm" ]] || return

	local shell_name="${SHELL:t}"
	[[ -z "$shell_name" ]] && shell_name="shell"

	printf '\e]2;%s\a' "$shell_name"
}

add-zsh-hook precmd set_wezterm_tab_title
