return {
  "folke/tokyonight.nvim",

  lazy = false,

  priority = 1000,

  config = function()
    require("tokyonight").setup({
      transparent = true,

      on_highlights = function(highlights, colors)
        highlights.LineNr = { fg = "#808080" }
        highlights.LineNrAbove = { fg = "#808080" }
        highlights.LineNrBelow = { fg = "#808080" }
        highlights.CursorLineNr = { fg = "#00bfff" }
        highlights.Visual = { bg = "#5e6480", fg = "#ffffff" }
        highlights.Comment = { fg = "#7a88cf", italic = true }
        highlights.DiagnosticUnnecessary = { fg = "#708090" }
      end,
    })

    vim.cmd.colorscheme("tokyonight")
  end
}
