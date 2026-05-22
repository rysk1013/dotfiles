return {
  {
    "A7Lavinraj/fyler.nvim",

    dependencies = { "nvim-mini/mini.icons" },

    branch = "stable",

    lazy = false,

    keys = {
      { "<leader>e", "<CMD>Fyler<CR>", mode = "n", desc = "Open Fyler" },
    },

    opts = {
      views = {
        finder = {
          default_explorer = true,
          delete_to_trash = true,
        }
      }
    }
  }
}
