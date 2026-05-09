return {
  {
    "bluz71/vim-moonfly-colors",

    lazy = false,

    priority = 1000,

    config = function()
      vim.g.moonflyTransparent = true
      vim.cmd.colorscheme("moonfly")
    end

    -- Other settings
    --opts = {
    --  transparent = true,
    --},

    -- config = function(_, opts)
    --   require("vscode").setup(opts)

    --   vim.cmd.colorscheme("vscode")
    -- end
  }
}
