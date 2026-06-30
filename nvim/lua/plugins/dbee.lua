return {
  {
    "kndndrj/nvim-dbee",

    dependencies = {
      "MunifTanjim/nui.nvim",
    },

    build = function()
      require("dbee").install("curl")
    end,

    keys = {
      { "<leader>tdb", function() require("dbee").toggle() end, mode = "n", desc = "Toggle dbee" },
    },

    config = function()
      require("dbee").setup()
    end,
  },
  {
    "hrsh7th/nvim-cmp",

    dependencies = {
      {
        "MattiasMTS/cmp-dbee",
        dependencies = {
          {"kndndrj/nvim-dbee"}
        },
        ft = "sql",
        opts = {},
      },
    },

    opts = {
      sources = {
        { "cmp-dbee" },
      },
    },
  },
}
