# コマンド履歴を保存するファイル
HISTFILE=~/.zsh_history

# メモリ上で保持する履歴件数
HISTSIZE=10000

# 履歴ファイルに保存する件数
SAVEHIST=10000

# 複数のターミナル間で履歴を共有する
setopt share_history

# 直前と同じコマンドは履歴に保存しない
setopt hist_ignore_dups

# スペースで始まるコマンドは履歴に保存しない
setopt hist_ignore_space

# コマンド実行後すぐに履歴ファイルへ追記する
setopt inc_append_history

# ディレクトリ名だけ入力すると自動で cd する
setopt auto_cd

# エラー時や補完失敗時のビープ音を無効化
setopt no_beep

# 拡張グロブを有効化
# 例: **/*.go や ^*.log が使える
setopt extended_glob

# 補完システム(compinit)を遅延ロード
autoload -Uz compinit

# 補完システムを初期化
compinit

# 補完候補が複数ある場合に選択メニューを表示
zstyle ':completion:*' menu select

# 補完時に大文字小文字を区別しない
# 例: read<TAB> → README.md
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完結果をキャッシュして高速化
zstyle ':completion:*' use-cache on

# 補完キャッシュの保存先
zstyle ':completion:*' cache-path ~/.zsh/cache

# 補完候補に ls と同様の色付けを適用
# ディレクトリ、実行ファイル、シンボリックリンク等を色分け表示
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# git の補完を有効化
autoload -Uz bashcompinit
bashcompinit

# 補完時に説明文を表示
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

# プロセス一覧の補完を見やすくする
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,cmd'
