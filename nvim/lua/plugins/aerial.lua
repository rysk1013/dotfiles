return {
  {
    'stevearc/aerial.nvim',

    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },

    opts = {
      layout = {
        default_direction = "left",
        width = 30,
      },
      show_guides = true,
      autojump = false,
      filter_kind = false,
    },

    keys = {
      { "<leader>a", "<CMD>AerialToggle!<CR>", desc = "Toggle Aerial" },
    },
  }
}
