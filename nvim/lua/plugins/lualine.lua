return {
  {
    "nvim-lualine/lualine.nvim",

    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
      local section_separator = { left = "", right = "" }

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
            {
              "branch",
              "diff",
              "diagnostics",
              separator = section_separator,
            },
          },
          lualine_c = {
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
          },
          lualine_y = {
            {
              "progress",
              separator = section_separator,
            },
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
