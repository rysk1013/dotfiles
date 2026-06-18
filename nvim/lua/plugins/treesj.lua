return {
  {
    "Wansmer/treesj",

    keys = {
      { "<leader>m", function() require("treesj").toggle() end, mode = "n", desc = "TreeSJ toggle" },
      { "<leader>j", function() require("treesj").split() end, mode = "n", desc = "TreeSJ split" },
      { "<leader>s", function() require("treesj").join() end, mode = "n", desc = "TreeSJ join" },
    },

    dependencies = { "nvim-treesitter/nvim-treesitter" },

    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
      })
    end,
  }
}
