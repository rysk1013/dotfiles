return {
  {
    "lunarvim/darkplus.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- テーマをロード
      vim.cmd([[colorscheme darkplus]])
      -- コメントの色を変更
      local comment_color = "#999999"

      -- treesitter対応（neovim 0.9以降）
      vim.api.nvim_set_hl(0, "@comment", { fg = comment_color, italic = true })
      -- 従来のcommentグループも上書き（互換用）
      vim.api.nvim_set_hl(0, "comment",   { fg = comment_color, italic = true })

      -- テーマ変更時にも再適用されるように設定
      vim.api.nvim_create_autocmd("colorscheme", {
        callback = function()
          vim.api.nvim_set_hl(0, "@comment", { fg = comment_color, italic = true })
          vim.api.nvim_set_hl(0, "comment",   { fg = comment_color, italic = true })
        end,
      })
    end,
  },
}

