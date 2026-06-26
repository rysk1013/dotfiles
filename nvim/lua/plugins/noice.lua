return {
  {
    "folke/noice.nvim",

    event = "VeryLazy",

    opts = {
      views = {
        cmdline_popup = {
          position = {
            row = "20%",
            col = "50%",
          },
        },
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
    },

    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        opts = {
          background_colour = "#000000",
          top_down = false,
        },
      },
    },

    vim.keymap.set("n", "<leader>nd", function() require("noice").cmd("dismiss") end, { desc = "Dismiss Noice" })
  }
}
