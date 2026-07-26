return {
  "folke/which-key.nvim",
  version = false,
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    if vim.o.timeoutlen == 0 then vim.o.timeoutlen = 300 end
  end,
  opts = {
    win = { border = "rounded" },
    triggers = {},
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    wk.add({
      -- ===== Find / Telescope =====
      { "<leader>f",  group = "Find / File" },
      { "<leader>ff", desc  = "Find files (Telescope)" },
      { "<leader>fg", desc  = "Live grep (Telescope)" },
      { "<leader>fb", desc  = "Buffers (Telescope)" },
      { "<leader>fh", desc  = "Help (Telescope)" },
      { "<leader>fs", desc  = "Doc Symbols (LSP/Telescope)" },
      { "<leader>fr",  group = "Recent/Refs" },
      { "<leader>frf", desc  = "Recent files" },
      { "<leader>frr", desc  = "LSP References" },

      -- ===== Git / Gitsigns =====
      { "<leader>g",  group = "Git" },
      { "<leader>gg", desc  = "LazyGit" },
      { "<leader>gc", desc  = "Commits (Telescope)" },
      { "<leader>gs", desc  = "Status (Telescope)" },
      { "<leader>h",  group = "Git hunk" },
      { "<leader>hs", desc  = "Stage hunk" },
      { "<leader>hr", desc  = "Reset hunk" },
      { "<leader>hp", desc  = "Preview hunk" },
      { "<leader>hb", desc  = "Toggle blame" },
      { "<leader>hd", desc  = "Diff current file" },

      -- ===== Bufferline / Tabs =====
      { "<leader>b",  group = "Buffer / Tabs" },
      { "<leader>bp", desc  = "Pick buffer" },
      { "<leader>x",  desc  = "Pick buffer to close" },
      { "<leader>q",  desc  = "Close current buffer" },

      -- ===== Tree / Explorer =====
      { "<leader>e",  desc  = "NvimTree Toggle" },

      -- ===== Terminal (toggleterm) =====
      { "<leader>t",  group = "Terminal" },
      { "<leader>tt", desc  = "Terminal (bottom)" },
      { "<leader>tf", desc  = "Terminal (float)" },

      -- ===== LSP / Diagnostics =====
      { "<leader>d",  desc  = "Diagnostics Float (toggle)" },
      { "<leader>rn", desc  = "LSP Rename" },
      { "<leader>ca", desc  = "LSP Code Action" },
      { "<leader>F",  desc  = "Format (Conform)" },

      -- ===== non-leader（表示だけ）=====
      { "K",     desc = "Hover (toggle)" },
      { "gd",    desc = "Go to definition" },
      { "gr",    desc = "List references" },
      { "gi",    desc = "Go to implementation" },
      { "gy",    desc = "Type definition" },
      { "]d",    desc = "Next diagnostic" },
      { "[d",    desc = "Prev diagnostic" },
      { "]c",    desc = "Next Git hunk" },
      { "[c",    desc = "Prev Git hunk" },
      { "<C-_>", desc = "Comment (gcc/gc)" },

      -- === Copilot Core / Copilot Chat ===
      { "<leader>c",  group = "Copilot" },
      { "<leader>ce", desc  = "Copilot: Enable" },
      { "<leader>cd", desc  = "Copilot: Disable" },
      { "<leader>cs", desc  = "Copilot: Status" },
      { "<leader>cp", desc  = "Copilot: Panel" },
      { "<leader>co",  desc  = "Toggle Chat window" },
      { "<leader>ccm", desc  = "Generate commit message" },
      { "<leader>cex", desc  = "Explain selected code (visual)" },
      { "<leader>cfx", desc  = "Fix selected code (visual)" },
      { "<leader>ct",  desc  = "Generate tests (visual)" },
      { "<leader>coc", desc  = "Optimize selected code (visual)" },
    })

    -- <leader>wk: which-key 表示
    vim.keymap.set("n", "<leader>wk", "<cmd>WhichKey <leader><CR>",
      { desc = "Show which-key (<leader>)" })
  end,
}
