return {
  {
    "EdenEast/nightfox.nvim",

    lazy = false,

    priority = 1000,

    config = function()
     require("nightfox").setup({
        options = {
          transparent = true,
        },
     })

     vim.cmd.colorscheme("carbonfox")

     -- customize visual mode highlight
     vim.api.nvim_set_hl(0, 'Visual', { bg = '#5e6480', fg = '#ffffff' })
    end
  }
}
