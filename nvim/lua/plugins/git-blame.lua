return {
  {
    "f-person/git-blame.nvim",

    event = "VeryLazy",

    keys = {
      { "<leader>gb", "<cmd>GitBlameToggle<CR>", mode = "n", desc = "Tggole git blame" },
    },

    opts = {
        enabled = true,
        message_template = " <summary> • <date> • <author> • <<sha>>",
        date_format = "%m-%d-%Y %H:%M:%S",
        virtual_text_column = 1,
    },
  }
}
