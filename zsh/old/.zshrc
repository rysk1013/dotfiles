##### VSCode設定 #####
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin"
alias c='code'
alias ci='code-insiders'

# 設定ファイル
alias zshrc="c ~/.zshrc"
alias zshrci="ci ~/.zshrc"
alias rezshrc="source ~/.zshrc"

# ターミナルの再起動
alias restart="exec $SHELL -l"

# 階層移動
alias ..='cd ../'
alias ....='cd ../..'
alias ......='cd ../../..'
alias cdz='cd ~-'
alias desk='cd ~/Desktop'
alias dl='cd ~/Downloads'

# ディレクトリ詳細確認
alias la='ls -laF'

# ディレクトリの作成と移動を同時実行
function mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
# 第一引数の名前でディレクトリを作成移動し第二引数でファイルをVSCodeで開く
# mkopen test index.html
function mkopen(){ mkcd "$1" && touch "$2" && c "$2" && ls; }

# 階層表示
alias tree1='tree -L 1'
alias tree2='tree -L 2'
alias tree3='tree -L 3'

# 容量確認
alias w='du -h -s'

# 履歴
alias h='history'

# ファイル作成
alias t='touch'

# ファイルディレクトリ削除
alias r='rm -rf'

# ファイル検索
alias f='find . -name'

# ファイル内単語検索
alias g='grep --color=auto'
alias gr='grep -r --color=auto' # ディレクトリ以下を検索

alias fixer='php-cs-fixer fix' # PHPコードの整形

# git系エイリアス
alias gcon='c ~/.gitconfig' # 設定ファイルをVSCodeで開く
alias gconi='ci ~/.gitconfig' # 設定ファイルをVSCodeで開く
alias gcfl='git config --global -l' # グローバルの設定ファイル一覧を表示
alias gcfu='git config --global user.name' # グローバルの設定済みユーザを表示
alias gcfe='git config --global user.email' # グローバルの設定済みメールを表示
alias g='git' # gitの単体コマンド
alias gi='git init' # ディレクトリをリポジトリに変換する初期化
alias gcl='git clone' # Githubからリポジトリ形式でダウンロード
alias ga='git add' # ワーキングエリアからステージングエリアへ追加
alias ga.='git add .' # 同階層の全ファイル群をステージングエリアに追加
alias gap='git add -p' # 変更行(ハンク)の差分を表示
alias gc='git commit' # コミットの単体コマンド(メッセージ後付け)
alias gcm='git commit -m' # メッセージオプションを追加したコミット
alias gacm='git add . && git commit -am' # 全ファイルをアドしてコミット
alias gcam='git commit -am' # 新規以外のaddしたファイルを全てコミット
function gacmp(){ git add . && git commit -am "$1" && git push origin main; } # 全ファイルをアドコミットメインをプッシュ
function gacmh(){ git add . && git commit -am "$1" && git push origin HEAD; } # 全ファイルをアドコミットカレントブランチをプッシュ
alias gcz='git commit --amend -m' # 直前のcommitメッセージを差し替え
alias gaz='git reset' # ステージングエリアのaddデータを取り消す
alias gz='git reset --hard HEAD' # commitを1つ前に戻す(現状態強制削除)
alias gz2='git reset --hard HEAD^' # commitを2つ前に戻す(現状態強制削除)
alias gzz='git reset --hard ORIG_HEAD' # コンフリクト解消作業の取り止め(現状態強制削除)
alias gzi='git reset --hard' # 指定idまで戻る(現状態強制削除)
alias gzf='git rm --cached' # ファイル名変更時に前の名前の誤認識を解除
alias grev='git revert' # commitを打ち消す
alias grb='git rebase' # 現ブランチを指定ブランチへ移動
alias grbi='git rebase -i' # 現ブランチの全コミットを指定IDのコミットに集約
alias grbo='git rebase origin' # 現ブランチをoriginの末尾に移動
alias gdf='git diff' # 単体の差分表示
alias gdfc='git diff --cached' # add前後の差分表示
alias gst='git status' # 現在の作業状態を確認
alias gsts='git status -s' # ステータスの省略表示
alias gl='git log' # コミット履歴を表示(qで離脱)
alias glo='git log --graph' # merge後などにcommitをアスキーグラフで表示
alias glo='git log --oneline' # 1行ごとのシンプルなログ一覧を表示
alias glp='git log -p' # 差分(変更点)のログを表示
alias gls='git log --stat' # 変更されたファイルの行数を表示
alias gln='git log --name-only' # 変更されたファイル名のみ表示
alias gg='git-foresta --all --style=2 | less -RSX' # 「git forest」を使って樹形図を可視化
alias gsh='git show' # ファイルの内容やコミットの差分を表示
alias gb='git branch' # ブランチを作成
alias gba='git branch -a' # 全ブランチを表示
alias gbm='git branch -m' # ブランチ名を変更
alias gbmain='git branch -M main' # ブランチ名をmainに変更
alias gbd='git branch -d' # ブランチを削除
alias gch='git checkout' # ブランチを切り変え / 一つ前の作業に戻る
alias gbc='git checkout -b' # ブランチ作成後と同時に切り変え
alias gchm='git checkout main' # 最新の状態に復元
alias gmg='git merge' # 指定ブランチを今いるブランチに統合
alias gtg='git tag' # ログIDにタグ付け
alias gtgd='git tag -d' # タグの削除
alias gsh='git show' # ログをタグで表示
alias grao='git remote add origin' # ローカルからリモートへ登録
alias grv='git remote -v' # リモートの紐付き状態を確認
alias gra='git remote add' # リモートへの紐付きを追加
alias grm='git remote rm' # 指定リモートの紐付きを削除
alias grs='git remote set-url origin' # 指定リモートの再設定
alias gp='git push' # Githubへリポジトリをアップロード
alias gpo='git push origin' # Githubのorginリポジトリへアップロード
alias gpom='git push origin main' # orginリポジトリのmainブランチへアップ
alias gpoh='git push origin HEAD' # 自身がいるブランチをアップ
alias gpoa='git push origin --all' # orginリポジトリの全てのブランチをアップ
alias gpuom='git push -u origin main' # orginリポジトリのmainブランチへアップ
alias gpoms='git push -u origin master' # orginリポジトリのmasterブランチへアップ
alias gpf='git push --force-with-lease origin main' # orginリポジトリに強制的にアップ
alias gpdo='git push -d origin' # リモートブランチの削除
alias gpl='git pull' # リモートリポジトリをダウンロード
alias gplo='git pull origin' # originリポジトリのダウンロード
alias gplom='git pull origin main' # originリポジトリのmainブランチにダウンロード
alias gpr='hub pull-request' # 「hub」を使ってgitからプルリクエスト
alias gf='git fetch' # 一時的にリモート追跡用のブランチにダウンロード
alias gfo='git fetch origin' # リモート追跡用のoriginブランチに一時的ダウンロード
alias gfom='git fetch origin main' # リモート追跡用のoriginのメインブランチのみ一時的ダウンロード
alias gfp='git fetch --prune' # リモートブランチの削除ブランチをローカルと同期
alias gsta='git stash' # 作業中の内容を一時退避
alias gstal='git stash list'	# 作業中の内容を一時退避
alias gstaa='git stash apply'	# 作業中の一時退避した内容を呼び戻す
alias gstad='git stash drop'	# 作業中の一時退避した内容を削除
alias gstap='git stash pop'	# 一時退避した内容を呼び戻し退避一覧から削除
alias gstac='git stash clear'	# 一時退避した内容を退避一覧から全て削除
alias gsw='git switch'	# ブランチの切り替え
alias gbsw='git switch -c'	# ブランチを切った後に切り替え
alias gmv='git mv' # Git上で管理しているファイル名を変更
alias gig='c .gitignore' # addの対象除外ファイルをVSCodeで開く
alias gign='touch .gitignore | echo -e "/node_modules/*\n/vendor\n.env" > .gitignore' # node_modulesをaddの除外対象に設定
alias gbsr='git browse-remote' # 現在のブランチをGithub上のブラウザで表示
alias gbsrp='git browse-remote -pr' # 現在のプルリクをGithub上のブラウザで表示

# GitHub設定
eval "$(gh completion -s zsh)" # ghコマンドの設定(事前インストールが必要)
function ghc(){ gh repo create "$1" --public; } # 自身のリモートリポジトリの作成
alias ghl='gh repo list' # リモートリポジトリの一覧
alias ghll='gh repo list -l' # リモートリポジトリの一覧を言語でフィルタリング
alias ghcl='gh repo clone' # リモートリポジトリのクローン
alias ghb='gh browse' # ブラウザでカレントリポジトリを表示
alias gha='gh auth refresh -h github.com -s delete_repo' # 管理者権限の設定(再認証)
alias ghd='gh repo delete --confirm' # 同期中のリモートリポジトリを削除
function ghccl(){ gh repo create "$1" --public --clone; }
# 引数の名前でリポジトリを作成、メインブランチに変換後READMEを作成しアドコミット後プッシュを行う
function ghcclp(){ gh repo create "$1" --public --clone && cd $1 && echo "# $1" > README.md && gacm "first commit" && gbmain && gpom && ls -la && cat README.md && glo; }
alias ghv='gh repo view' # 自身のリモートリポジトリのREADMEを表示
# リポジトリを削除し、自身のいるカレントディレクトリも削除
function ghdr(){ gh repo delete --confirm && var="${PWD##*/}" && cd ../ && rm -rf $var && ls; }
alias ghisc='gh issue create' # イシューの作成
alias ghisd='gh issue delete' # イシューの削除
alias ghisl='gh issue list' # イシューの一覧表示
alias ghprc='gh pr create' # プルリクの作成
alias ghprm='gh pr merge' # プルリクのマージ
alias ghprr='gh pr review' # プルリクのレビュー
alias ghprv='gh pr view' # プルリクの内容を閲覧

# mysqlのログイン
alias ms='cd ../../Library/bin'
alias msr='./mysql -uroot'
alias msrr='./mysql -uroot -proot'
alias mslogin='cd ../../Library/bin && ./mysql -uroot -proot'

# Laravel
alias pa='php artisan' # artisanコマンド
alias pav='php artisan --version'
alias pas='php artisan serve'
alias pamc='php artisan make:controller'
alias pamm='php artisan make:model'
alias pammg='php artisan make:migration'
alias pamg='php artisan migrate'
alias pams='php artisan make:seeder'
alias pads='php artisan db:seed'
alias parl='php artisan route:list'
alias pamp='php artisan make:provider'
alias pammd='php artisan make:middleware'
alias pamr='php artisan make:request'
alias pamt='php artisan make:test'
alias past='php artisan session:table'
alias pavp='php artisan vendor:publish'
alias pac='php artisan config:cache'
alias cda='composer dump-autoload'

# npmの起動
alias nin='npm init'
alias niy='npm init -y'
alias ni='npm install'
alias nui='npm uninstall'
alias nis='npm install --save'
alias niD='npm install --save-dev'
alias nig='npm install -g'
alias nr='npm run'
alias nrd='npm run dev'
alias nrs='npm run serve'
alias nrb='npm run build'
alias nrs='npm run start'

# yarnの起動
alias yi='yarn init'
alias yiy='yarn init -y'
alias ya='yarn add'
alias yrm='yarn remove'
alias yr='yarn run'
alias yb='yarn build'
alias yd='yarn dev'
alias ys='yarn start'
alias yad='yarn add --dev'
alias yaD='yarn add --save-dev'
alias yag='yarn add -g'

# Dockerのエイリアス
alias dv='docker --version'
alias dsi='docker system info'
alias dsd='docker system df'
alias dpl='docker pull'
alias dpu='docker push'
alias dtag='docker tag'
alias dins='docker inspect'
alias di='docker images'
alias dia='docker images -a'
alias dil='docker image ls'
alias dr='docker rmi'
alias drf='docker rmi -f'
# イメージ一括削除
alias drmia='docker rmi -f `docker images -aq`'
alias dp='docker ps'
alias dpa='docker ps -a'
alias dpf='docker ps -f "status=exited"'
alias dsts='docker stats'
alias dr='docker run'
alias drn='docker run --name'
alias drnd='docker run -d --name'
alias drdpn='docker run -d -p 8080:80 -name'
alias drdprn='docker run -d -p 8080:80 -rm -name'
alias dstt='docker start'
alias dstp='docker stop'
alias dstpa='docker stop $(docker ps -a -q)'
alias dcre='docker create'
alias drm='docker rm'
# コンテナの一括削除
alias drmp='docker rm `docker ps -a -q`'
# 停止コンテナの一括削除
alias drma='docker rm $(docker ps -qf "status=exited") $(docker ps -qf "status=created")'
# 全てのコンテナを停止削除
alias ddel='dcspa && dcrma'
alias dcm='docker commit'
alias dvo='docker volume'
alias dvol='docker volume ls'
# 全てのボリュームを削除
alias dvorm='docker volume rm $(docker volume ls -qf dangling=true)'
alias dbld='docker build'
alias dcp='docker cp'
alias dex='docker exec'
alias dlgn='docker login'
alias dlog='docker logs'
alias dlogf='docker logs -f'
alias dc='docker compose'
alias dcr='docker compose run'
alias dcu='docker compose up'
alias dcud='docker compose up -d'
# コンテナの一括停止&削除
alias dcdr='docker compose down --rmi all'

# Laravel Sail
alias sail='./vendor/bin/sail'
