return {
  {
    "Wansmer/treesj",

    dependencies = { "nvim-treesitter/nvim-treesitter" },

    keys = {
      { "<leader>tt", function() require("treesj").toggle() end, mode = "n", desc = "TreeSJ toggle" },
    },

    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
      })
    end,
  }
}
