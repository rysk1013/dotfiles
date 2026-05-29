return {
  {
    "nvim-lualine/lualine.nvim",

    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
      require("lualine").setup({
        options = {
          theme = "powerline_dark",
        },
        sections = {
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
        }
      })
    end
  }
}
