return {
  "akinsho/bufferline.nvim",

  dependencies = { "nvim-tree/nvim-web-devicons" },

  event = "VeryLazy",

  keys = function()
    local keys = {
      { "<leader>bp", "<CMD>BufferLinePick<CR>", desc = "Pick buffer" },
      { "<leader>bh", "<CMD>BufferLineMovePrev<CR>", desc = "Move buffer left" },
      { "<leader>bl", "<CMD>BufferLineMoveNext<CR>", desc = "Move buffer right" },
    }

    for i = 1, 9 do
      table.insert(keys, {
        "<leader>" .. i,
        "<CMD>BufferLineGoToBuffer " .. i .. "<CR>",
        desc = "Go to buffer " .. i,
      })
    end

    return keys
  end,

  config = function()
    -- Load the bufferline plugin
    local bufferline = require("bufferline")

    -- Configure bufferline
    bufferline.setup {
      -- Main configuration options
      options = {
        -- Display open buffers instead of Vim tab pages
        mode = "buffers",
        -- Use the default visual style preset
        style_preset = bufferline.style_preset.default,
        -- Show LSP diagnostics (errors/warnings) in the bufferline
        diagnostics = "nvim_lsp",
        -- Use thin separators between buffers
        separator_style = "thin",
        -- Show close icons on each buffer
        show_buffer_close_icons = false,
        -- Hide the global close icon on the right side
        show_close_icon = false,
        -- Always display the bufferline even with one buffer
        always_show_bufferline = true,
        -- Configure spacing/behavior for sidebar plugins
        offsets = {
          {
            -- Apply this offset when NvimTree is open
            filetype = "NvimTree",
            -- Display label text above the sidebar
            text = "File Explorer",
            -- Align the label text to the left
            text_align = "left",
            -- Show a separator between sidebar and buffers
            separator = true,
          },
        },
      },
    }
  end,
}
