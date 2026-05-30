return {
  "folke/tokyonight.nvim",

  lazy = false,

  priority = 1000,

  config = function()
    require("tokyonight").setup({
      transparent = true,
    })

    vim.cmd.colorscheme("tokyonight")

    -- customize visual mode highlight
    vim.api.nvim_set_hl(0, 'Visual', { bg = '#5e6480', fg = '#ffffff' })

  end
}
