return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { "<leader>tt", "<cmd>TermBottom<cr>", desc = "Terminal (bottom)" },
    { "<leader>tf", "<cmd>TermFloat<cr>",  desc = "Terminal (float)"  },
  },
  opts = {
    size = 14,
    open_mapping = false,        -- グローバルの <C-\> などは使わない
    shade_terminals = true,
    start_in_insert = true,      -- 端末は挿入モード開始
    direction = "horizontal",
    float_opts = { border = "rounded" },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- ===== 端末バッファ専用のキーマップ =====
    local function set_term_keymaps(ev)
      local o = { buffer = ev.buf, silent = true }
      -- Escでノーマルモードに戻る
      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], o)
      -- お好みで "jk" でも離脱
      vim.keymap.set("t", "jk", [[<C-\><C-n>]], o)
      -- ウィンドウ移動も t モードからシームレスに
      vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], o)
      vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], o)
      vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], o)
      vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], o)
    end

    -- ToggleTerm の端末が開いたときだけ上のマップを適用（バッファローカル）
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*toggleterm#*",
      callback = set_term_keymaps,
      desc = "ToggleTerm: terminal-mode keymaps",
    })

    -- :TermBottom / :TermFloat ユーザーコマンド
    vim.api.nvim_create_user_command("TermBottom", function()
      require("toggleterm.terminal").Terminal:new({ direction = "horizontal" }):toggle()
    end, {})

    vim.api.nvim_create_user_command("TermFloat", function()
      require("toggleterm.terminal").Terminal:new({ direction = "float" }):toggle()
    end, {})
  end,
}

