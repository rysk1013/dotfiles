-- keymap.set を短く書けるようにする
local keymap = vim.keymap.set
-- 共通オプション
local opts = { noremap = true, silent = true }
-- =========================
-- 基本操作
-- =========================
-- jj で INSERT モードを抜ける
keymap("i", "jj", "<Esc>", opts)
-- <Esc> で検索ハイライトを消す
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)
-- =========================
-- ウィンドウ移動
-- =========================
-- Ctrl+h で左のウィンドウへ移動
keymap("n", "<C-h>", "<C-w>h", opts)
-- Ctrl+j で下のウィンドウへ移動
keymap("n", "<C-j>", "<C-w>j", opts)
-- Ctrl+k で上のウィンドウへ移動
keymap("n", "<C-k>", "<C-w>k", opts)
-- Ctrl+l で右のウィンドウへ移動
keymap("n", "<C-l>", "<C-w>l", opts)
-- =========================
-- ウィンドウ分割
-- =========================
-- <leader>sv で縦分割
keymap("n", "<leader>sr", "<cmd>vsplit<CR>", opts)
-- <leader>sh で横分割
keymap("n", "<leader>sd", "<cmd>split<CR>", opts)
-- <leader>sx で現在の分割を閉じる
keymap("n", "<leader>sx", "<cmd>close<CR>", opts)
-- =========================
-- バッファ操作
-- =========================
-- <leader>bd で現在のバッファを閉じる
keymap("n", "<leader>bd", "<cmd>bdelete<CR>", opts)
-- <Tab> で次のバッファへ
keymap("n", "<Tab>", "<cmd>bnext<CR>", opts)
-- <S-Tab> で前のバッファへ
keymap("n", "<S-Tab>", "<cmd>bprevious<CR>", opts)
-- =========================
-- ファイル操作
-- =========================
-- <leader>w で保存
keymap("n", "<leader>w", "<cmd>write<CR>", opts)
-- <leader>q で終了
keymap("n", "<leader>q", "<cmd>quit<CR>", opts)
-- =========================
-- 行移動
-- =========================
-- Visualモードで選択行を下へ移動
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
-- Visualモードで選択行を上へ移動
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
-- =========================
-- 表示切り替え
-- =========================
-- <leader>tw でテキスト折り返しを切り替え
keymap("n", "<leader>tw", "<cmd>set wrap! wrap?<CR>", opts)
-- =========================
-- 便利操作
-- =========================
-- x で削除してもレジスタに入れない
keymap("n", "x", '"_x', opts)
-- <leader>y でシステムクリップボードへコピー
keymap({ "n", "v" }, "<leader>y", '"+y', opts)
-- <leader>Y で行全体をシステムクリップボードへコピー
keymap("n", "<leader>Y", '"+Y', opts)
-- <leader>d で削除してもレジスタに入れない
keymap({ "n", "v" }, "<leader>d", '"_d', opts)
