return {
  {
    "f-person/git-blame.nvim",

    event = "VeryLazy",

    keys = {
      { "<leader>gb", "<cmd>GitBlameToggle<CR>", mode = "n", desc = "Toggole git blame" },
    },

    opts = {
        enabled = false,
        message_template = " <summary> • <date> • <author> • <<sha>>",
        date_format = "%m-%d-%Y %H:%M:%S",
        virtual_text_column = 1,
    },
  }
}
