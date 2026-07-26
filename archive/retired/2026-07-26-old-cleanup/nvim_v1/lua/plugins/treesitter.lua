return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",   -- 選択/移動/入替などの拡張
      "windwp/nvim-ts-autotag",                        -- HTML/TSX のタグ自動閉じ
      "JoosepAlviste/nvim-ts-context-commentstring",   -- コメント記法をファイル/コンテキスト別に
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "lua",
          "luadoc",
          "vim",
          "vimdoc",
          "query",
          "json",
          "jsonc",
          "yaml",
          "toml",
          "regex",
          "markdown",
          "markdown_inline",
          "html",
          "css",
          "scss",
          "javascript",
          "typescript",
          "tsx",
          "php",
          "phpdoc",
          "blade",
          "python",
          "go",
          "gomod",
          "gosum",
          "gotmpl",
          "sql",
          "dockerfile",
          "gitcommit",
          "gitignore",
          "gitattributes",
          "git_config",
          "git_rebase",
        },
        sync_install = false,
        auto_install = true, -- 未インストール言語を自動取得

        -- ハイライト/インデント
        highlight = { enable = true, additional_vim_regex_highlighting = false },
        indent    = { enable = true,  disable = { "yaml" } },

        -- インクリメンタル選択（ノード/スコープを伸縮）
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection    = "<C-Space>", -- 開始
            node_incremental  = "<C-Space>", -- ノード拡大
            scope_incremental = "<C-s>",     -- スコープ拡大
            node_decremental  = "<BS>",      -- 縮小
          },
        },

        -- タグ自動閉じ（HTML/TSX/JSX など）
        autotag = { enable = true },

        -- Textobjects（関数/クラス/引数などの選択・移動・入替）
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- 次の対象へ自動ジャンプ
            keymaps = {
              ["af"] = "@function.outer",  ["if"] = "@function.inner",
              ["ac"] = "@class.outer",     ["ic"] = "@class.inner",
              ["aa"] = "@parameter.outer", ["ia"] = "@parameter.inner",
            },
          },
          move = {
            enable = true, set_jumps = true,
            goto_next_start =     { ["]m"] = "@function.outer", ["]]"] = "@class.outer" },
            goto_previous_start = { ["[m"] = "@function.outer", ["[["] = "@class.outer" },
          },
          swap = {
            enable = true,
            swap_next     = { ["]a"] = "@parameter.inner" },
            swap_previous = { ["[a"] = "@parameter.inner" },
          },
        },
      })

      -- 折りたたみ（必要なら有効化）
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr   = "nvim_treesitter#foldexpr()"
      vim.opt.foldenable = false -- 起動時は閉じない（必要に応じて true）
    end,
  },
}
