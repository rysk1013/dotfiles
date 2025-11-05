# rm
alias rm="rm -iv --preserve-root"

# nvim
alias vim="nvim"

# Do not create .DS_Store files on network or USB volumes0
alias dsoff="defaults write com.apple.desktopservices DSDontWriteNetworkStores True"
alias dson="defaults write com.apple.desktopservices DSDontWriteNetworkStores False"

# Spotlight indexing
alias spotoff="sudo mdutil -a -i off"
alias spoton="sudo mdutil -a -i on"

# zshrc
alias zshrc="code ~/.zshrc"
alias zshrci="code-insiders ~/.zshrc"
alias rezshrc="source ~/.zshrc"

# zsh config files
alias al="code ~/.zsh.d/alias.zsh"
alias ev="code ~/.zsh.d/eval.zsh"
alias path="code ~/.zsh.d/path.zsh"
alias ss="code ~/.config/starship.toml"

# ディレクトリ詳細確認
alias la="ls -laF"

# 階層表示
alias tree1="tree -L 1"
alias tree2="tree -L 2"
alias tree3="tree -L 3"

# ファイル検索
alias f="find . -name"

# cd ~/Works
alias works="cd ~/Works"

# git
alias glo="git log --oneline"
alias glt="git log --pretty=format:'%H (%ai) %s'"

# docker
alias dcbnc="docker compose build --no-cache"
alias dcu="docker compose up"
alias dcud="docker compose up -d"
alias dcd="docker compose down"

# laravel
sail-create () {curl -s "https://laravel.build/$1" | bash}
alias sail="./vendor/bin/sail"

# UTM(To connect with Ubuntu)
alias ubuntu="ssh ryosuke@192.168.64.3"
# UTM(To connect with Kali)
alias kali="ssh kali@192.168.64.4"
