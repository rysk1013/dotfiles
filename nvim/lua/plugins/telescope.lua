return {
  {
    "nvim-telescope/telescope.nvim",

     version = "*",

    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },

    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", mode = "n", desc = "Telescope find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", mode = "n", desc = "Telescope live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", mode = "n", desc = "Telescope buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", mode = "n", desc = "Telescope help tags" },
    },

    config = function()
      require("telescope").setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
            },
          },
          sorting_strategy = "ascending",
        },
      })
    end
  }
}
