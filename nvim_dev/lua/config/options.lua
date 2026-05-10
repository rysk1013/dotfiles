-- vim.opt を短く書けるように変数へ代入
local opt = vim.opt

-- =========================
-- Leader Key
-- =========================
-- LeaderキーをSpaceへ設定
vim.g.mapleader = " "
-- LocalLeaderキーをSpaceへ設定
vim.g.maplocalleader = "\\"
-- =========================
-- 行番号
-- =========================
-- 絶対行番号を表示
opt.number = true
-- カーソル行からの相対行番号を表示
opt.relativenumber = true
-- =========================
-- インデント
-- =========================
-- Tab入力をスペースへ変換
opt.expandtab = true
-- Tab文字の表示幅
opt.tabstop = 2
-- << や >> のインデント幅
opt.shiftwidth = 2
-- Tabキー押下時のスペース数
opt.softtabstop = 2
-- 自動インデントを有効化
opt.smartindent = true
-- =========================
-- 表示
-- =========================
-- 長い行を折り返さない
opt.wrap = false
-- カーソル行をハイライト
opt.cursorline = true
-- 常にサインカラムを表示
opt.signcolumn = "yes"
-- True Color を有効化
opt.termguicolors = true
-- 上下に最低8行の余白を確保
opt.scrolloff = 8
-- 左右スクロール時の余白
opt.sidescrolloff = 8
-- =========================
-- 検索
-- =========================
-- 検索時に大文字小文字を区別しない
opt.ignorecase = true
-- 検索語に大文字が含まれる場合のみ区別する
opt.smartcase = true
-- 検索結果をハイライト
opt.hlsearch = true
-- 入力中にインクリメンタル検索
opt.incsearch = true
-- =========================
-- 操作
-- =========================
-- マウス操作を有効化
opt.mouse = "a"
-- OSクリップボードと共有
opt.clipboard = "unnamedplus"
-- キーマップ待機時間（ms）
opt.timeoutlen = 2000
-- 更新イベント発火までの時間（ms）
opt.updatetime = 250
-- =========================
-- ウィンドウ分割
-- =========================
-- 垂直分割を右側に開く
opt.splitright = true
-- 水平分割を下側に開く
opt.splitbelow = true
-- =========================
-- ファイル管理
-- =========================
-- swapファイルを作成しない
opt.swapfile = false
-- バックアップファイルを作成しない
opt.backup = false
-- 保存前バックアップを無効化
opt.writebackup = false
-- undo履歴をファイル保存後も保持
opt.undofile = true
-- =========================
-- 補完
-- =========================
-- 補完メニューの表示設定
opt.completeopt = {
  "menu",      -- 補完メニューを表示
  "menuone",   -- 候補が1件でも表示
  "noselect",  -- 自動選択しない
}
-- =========================
-- コマンドライン
-- =========================
-- コマンドラインの高さ
opt.cmdheight = 1
-- INSERTモード表示 (-- INSERT --) を非表示
opt.showmode = false
-- =========================
-- 不可視文字
-- =========================
-- 不可視文字を表示
opt.list = true
-- 不可視文字の表示内容
opt.listchars = {
  tab = "» ",   -- Tab文字
  trail = "·",  -- 行末スペース
  nbsp = "␣",   -- ノーブレークスペース
}
