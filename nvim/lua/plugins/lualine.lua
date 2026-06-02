return {
  {
    "nvim-lualine/lualine.nvim",

    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
      local section_separator = { left = "", right = "" }
      local white_separator = {
        function() return "" end,
        padding = 0,
        color = { fg = "#ffffff", bg = "NONE" },
      }

      require("lualine").setup({
        options = {
          theme = "powerline_dark",
          component_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = {
            {
              "mode",
              separator = section_separator,
            },
          },
          lualine_b = {
            white_separator,
            {
              "branch",
              "diff",
              "diagnostics",
              separator = section_separator,
            },
          },
          lualine_c = {
            white_separator,
            {
              "filename",
              path = 1,
            },
          },
          lualine_x = {
            "encoding",
            {
              "fileformat",
              symbols = {
                unix = "LF",
                dos = "CRLF",
                mac = "CR",
              },
            },
            "filetype",
            white_separator,
          },
          lualine_y = {
            {
              "progress",
              separator = section_separator,
            },
            white_separator,
          },
          lualine_z = {
            {
              "location",
              separator = section_separator,
            },
          }
        }
      })
    end
  }
}
