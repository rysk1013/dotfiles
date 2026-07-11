return {
  {
    'stevearc/aerial.nvim',

    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-mini/mini.icons"
    },

    keys = {
      { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial" },
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
  }
}
