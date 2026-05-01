local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- move window
map("n", "<Leader>j", "<C-w>j", opts)
map("n", "<Leader>k", "<C-w>k", opts)
map("n", "<Leader>l", "<C-w>l", opts)
map("n", "<Leader>h", "<C-w>h", opts)

-- split window
map("n", "<Leader>s", ":<C-u>sp\n", { noremap = true })
map("n", "<Leader>v", ":<C-u>vs\n", { noremap = true })

-- close window
map("n", "<Leader>w", ":<C-u>w\n", { noremap = true })
map("n", "<Leader>q", ":<C-u>q\n", { noremap = true })
map("n", "<Leader>wq", ":<C-u>wq\n", { noremap = true })

-- open terminal
map("n", "<Leader>tt", ":terminal\n", { noremap = true })
map("i", "<C-k>", "<Up>", {})
map("i", "<C-j>", "<Down>", {})
map("i", "<C-h>", "<Left>", {})
map("i", "<C-l>", "<Right>", {})

-- show inspect
map("n", "<Leader>:", ":Inspect<CR>", { noremap = true })

-- rebind embeded command
map("n", "<C-_>", "gcc", { noremap = false })
map("v", "<C-_>", "gc", { noremap = false })

-- Copy File Path Shortcuts
-- コマンドラインに表示する通知関数（Hit ENTER防止）
local function soft_notify(msg)
  -- 'false' でヒットエンター抑止、ModeMsg ハイライトで控えめな色に
  vim.api.nvim_echo({ { msg, "ModeMsg" } }, false, {})
end

local copy_opts = { noremap = true, silent = true }

-- 絶対パスをコピー
vim.keymap.set("n", "<leader>fpa", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
  soft_notify("Copied absolute path")
end, vim.tbl_extend("force", copy_opts, { desc = "Copy absolute path" }))

-- 相対パスをコピー
vim.keymap.set("n", "<leader>fpr", function()
  vim.fn.setreg("+", vim.fn.expand("%:."))
  soft_notify("Copied relative path")
end, vim.tbl_extend("force", copy_opts, { desc = "Copy relative path" }))

-- ファイル名のみコピー
vim.keymap.set("n", "<leader>fpf", function()
  vim.fn.setreg("+", vim.fn.expand("%:t"))
  soft_notify("Copied filename")
end, vim.tbl_extend("force", copy_opts, { desc = "Copy filename" }))
