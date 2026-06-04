return {
  {
    "nvim-lualine/lualine.nvim",

    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
      local function is_git_repo()
        local name = vim.api.nvim_buf_get_name(0)
        if name == "" then
          return false
        end

        local dir = vim.fs.dirname(name)
        return vim.fs.root(dir, ".git") ~= nil
      end

      local section_separator = { left = "", right = "" }
      local white_separator = {
        function() return "" end,
        padding = 0,
        color = { fg = "#ffffff", bg = "NONE" },
      }
      local git_white_saparetor = vim.tbl_extend("force", white_separator, {
        cond = is_git_repo,
      })

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
            git_white_saparetor,
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
