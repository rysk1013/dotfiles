# find を使用して .git, vendor, node_modules を除外
export FZF_DEFAULT_COMMAND='find . -type f \
  ! -path "*/.git/*" \
  ! -path "*/vendor/*" \
  ! -path "*/node_modules/*"'

# Tokyo Night 風カラースキーム
export FZF_DEFAULT_OPTS='
  --height 40%
  --layout=reverse
  --border
  --info=inline
  --prompt="❯ "
  --pointer="▶"
  --marker="✓"
  --color=bg+:#1f2335,bg:#1a1b26,spinner:#bb9af7,hl:#7aa2f7
  --color=fg:#c0caf5,header:#7dcfff,info:#7aa2f7,pointer:#bb9af7
  --color=marker:#9ece6a,fg+:#c0caf5,prompt:#7dcfff,hl+:#7aa2f7
  --color=border:#3b4261,gutter:-1
'
