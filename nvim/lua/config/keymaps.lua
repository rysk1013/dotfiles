-- keymap.set を短く書けるようにする
local keymap = vim.keymap.set
-- 共通オプション
local opts = { noremap = true, silent = true }
-- Neovim起動時のディレクトリ
local nvim_start_dir = vim.fn.getcwd()
-- =========================
-- 基本操作
-- =========================
-- jj で INSERT モードを抜ける
keymap("i", "jj", "<Esc>", opts)
-- <Esc> で検索ハイライトを消す
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)
-- <leader>A で全選択
keymap("n", "<leader>A", "ggVG", opts)
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
-- <leader>sr で縦分割
keymap("n", "<leader>sr", "<cmd>vsplit<CR>", opts)
-- <leader>sd で横分割
keymap("n", "<leader>sd", "<cmd>split<CR>", opts)
-- <leader>sx で現在の分割を閉じる
keymap("n", "<leader>sx", "<cmd>close<CR>", opts)
-- =========================
-- バッファ操作
-- =========================
-- <leader>bd で現在のバッファを閉じる
keymap("n", "<leader>bd", "<cmd>bdelete<CR>", opts)
-- <leader>bD ですべてのバッファを閉じる
keymap("n", "<leader>bD", "<cmd>%bd<CR>", opts)
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
-- Insertモードで下に新しい行を追加
keymap("i", "<C-CR>", "<Esc>o", opts)
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
-- コピー
-- =========================
-- ファイル（絶対パス）
local function copy_absolute_file_path()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("Copied")
end

keymap("n", "<leader>cc", function() copy_absolute_file_path() end, opts)

-- 診断メッセージ
local function copy_diagnostics()
  local bufnr = 0
  local line = vim.api.nvim_win_get_cursor(0)[1] - 1
  local diagnostics = vim.diagnostic.get(bufnr, { lnum = line })

  if #diagnostics == 0 then
    vim.notify("No diagnostics found", vim.log.levels.INFO)
    return
  end

  local absolute_path = vim.api.nvim_buf_get_name(bufnr)
  local filename = vim.fs.relpath(nvim_start_dir, absolute_path) or absolute_path
  local messages = {}

  for _, diagnostic in ipairs(diagnostics) do
    local severity = vim.diagnostic.severity[diagnostic.severity]

    table.insert(
      messages,
      string.format(
        "%s:%d:%d [%s] %s",
        filename,
        diagnostic.lnum + 1,
        diagnostic.col + 1,
        severity,
        diagnostic.message
      )
    )
  end

  vim.fn.setreg("+", table.concat(messages, "\n"))
  vim.notify("Diagnostics copied to clipboard")
end

keymap("n", "<leader>dy", function() copy_diagnostics() end, opts)
-- =========================
-- コメントアウト
-- =========================
keymap("n", "<leader>/", "gcc", { remap = true, silent = true })
keymap("v", "<leader>/", "gc", { remap = true, silent = true })
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
