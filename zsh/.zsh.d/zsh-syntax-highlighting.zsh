# 文字色は彩度低めでコントラストを強調
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)

# 有効コマンド（緑寄り）
ZSH_HIGHLIGHT_STYLES[command]='fg=#9ece6a,bold'
# 不明コマンド（赤）
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#f7768e,bold'
# ビルトイン／関数／エイリアス（緑同系）
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#9ece6a'
ZSH_HIGHLIGHT_STYLES[function]='fg=#9ece6a'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#9ece6a'

# 予約語 if, then, do など（黄）
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#e0af68,bold'
# オプション (-l, --help)（黄）
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#e0af68'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#e0af68'

# パス・ファイル（青）
ZSH_HIGHLIGHT_STYLES[path]='fg=#7aa2f7'
# グロブ (* ? [])（シアン）
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#7dcfff'
# 数値（マゼンタ寄り）
ZSH_HIGHLIGHT_STYLES[number]='fg=#bb9af7'
# 文字列（ピンク）
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#c0caf5'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#c0caf5'
# 変数 ($HOME 等)（青緑）
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#7dcfff'
# コメント（グレー）
ZSH_HIGHLIGHT_STYLES[comment]='fg=#565f89,italic'
