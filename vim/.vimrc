"----------------------------------------
" 基本設定
"----------------------------------------
" 互換モードを無効にする
set nocompatible
" ファイルエンコーディングをUTF-8に設定
set encoding=utf-8
" 保存時のエンコーディングをUTF-8に設定
set fileencoding=utf-8
" 読み込み時のエンコーディング候補
set fileencodings=utf-8,cp932,euc-jp,sjis
" ファイルフォーマットを設定
set fileformats=unix,dos,mac
" 全角文字の幅を2に設定
set ambiwidth=double
" バックスペースキーの挙動を設定
set backspace=indent,eol,start
" システムクリップボードと共有
set clipboard=unnamed,unnamedplus

"----------------------------------------
" 表示設定
"----------------------------------------
" 行番号を表示
set number
" カーソル行を強調表示
set cursorline
" カーソルを行末の1文字分超えるように設定
set virtualedit=onemore
" スマートインデントを有効にする
set smartindent
" ビープ音を視覚ベルに変更
set visualbell
" 対応する括弧を強調表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドライン補完をリスト表示
set wildmode=list:longest
" シンタックスハイライトを有効にする
syntax enable

"----------------------------------------
" タブ設定
"----------------------------------------
" タブをスペースに変換
set expandtab
" タブ幅を4に設定
set tabstop=4
" 自動インデントの幅を4に設定
set shiftwidth=4

"----------------------------------------
" 検索設定
"----------------------------------------
" 検索時に大文字小文字を区別しない
set ignorecase
" 大文字を含む検索では区別する
set smartcase
" インクリメンタルサーチを有効にする
set incsearch
" 検索をファイル末尾で折り返す
set wrapscan
" 検索結果を強調表示
set hlsearch
" Escキーで検索結果の強調表示を解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"----------------------------------------
" キーマッピング
"----------------------------------------
" インサートモードでjjを押すとEscにマップ
inoremap jj <Esc>
" jで行が折り返されている場合、物理行に移動
nnoremap j gj
" kで行が折り返されている場合、物理行に移動
nnoremap k gk

"----------------------------------------
" カーソル移動の高速化
"----------------------------------------
" ページダウン後にカーソルを中央に配置
nnoremap <C-d> <C-d>zz
" ページアップ後にカーソルを中央に配置
nnoremap <C-u> <C-u>zz
" 次の検索結果に移動後、カーソルを中央に配置
nnoremap n nzzzv
" 前の検索結果に移動後、カーソルを中央に配置
nnoremap N Nzzzv

"----------------------------------------
" ヤンク・クリップボード
"----------------------------------------
" システムクリップボードと共有
set clipboard+=unnamedplus

"----------------------------------------
" Airline
"----------------------------------------
" タブラインを有効にする
let g:airline#extensions#tabline#enabled = 1
" タブの表示形式を設定
let g:airline#extensions#tabline#formatter = 'unique_tail'

"----------------------------------------
" バックアップファイルを作成しない
"----------------------------------------
set nobackup
set noswapfile

"----------------------------------------
" 行末の空白を可視化
"----------------------------------------
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
set list

"----------------------------------------
" ビジュアルベルを無効化
"----------------------------------------
set t_vb=
set visualbell t_vb=

"----------------------------------------
" マウス操作を有効化
"----------------------------------------
set mouse=a

"----------------------------------------
" 80文字目にラインを表示
"----------------------------------------
set colorcolumn=80

"----------------------------------------
" ファイルタイプごとのインデント設定
"----------------------------------------
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.js,*.html,*.css setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

"----------------------------------------
" 括弧の自動補完
"----------------------------------------
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>
