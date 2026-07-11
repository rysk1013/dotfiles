return {
  {
    "akinsho/bufferline.nvim",

    dependencies = { "nvim-mini/mini.icons" },

    event = "VeryLazy",

    keys = function()
      local keys = {
        { "<leader>bp", "<cmd>BufferLinePick<CR>", desc = "Pick buffer" },
        { "<leader>bh", "<cmd>BufferLineMovePrev<CR>", desc = "Move buffer left" },
        { "<leader>bl", "<cmd>BufferLineMoveNext<CR>", desc = "Move buffer right" },
      }

      for i = 1, 9 do
        table.insert(keys, {
          "<leader>" .. i,
          "<cmd>BufferLineGoToBuffer " .. i .. "<CR>",
          desc = "Go to buffer " .. i,
        })
      end

      return keys
    end,

    config = function()
      local bufferline = require("bufferline")

      bufferline.setup {
        options = {
          mode = "buffers",
          style_preset = bufferline.style_preset.default,
          diagnostics = "nvim_lsp",
          separator_style = "thin",
          show_buffer_close_icons = false,
          show_close_icon = false,
          always_show_bufferline = true,
          offsets = {
            {
              filetype = "SidebarNvim",
              text = "Workspace",
              text_align = "center",
              separator = true,
            },
          },
        },
      }
    end,
  }
}
