return {
  {
    "stevearc/oil.nvim",

    lazy = false,

    dependencies = { { "nvim-mini/mini.icons", opts = {} } },

    keys = {
      { "<leader>e", "<CMD>Oil<CR>", mode = "n", desc = "Open Oil" },
    },

    opts = {
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
      }
    },
  }
}
