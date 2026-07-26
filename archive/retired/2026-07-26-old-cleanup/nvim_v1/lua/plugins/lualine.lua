return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      -- fileformat の変換関数
      local custom_fileformat = function()
        local fmt = vim.bo.fileformat
        if fmt == "unix" then
          return "LF"
        elseif fmt == "dos" then
          return "CRLF"
        elseif fmt == "mac" then
          return "CR"
        else
          return fmt
        end
      end

     require("lualine").setup({
        options = {
          theme = "auto",
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
          icons_enabled = true,
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = {
            {
              "filename",
              path = 3, -- "0: ファイル名のみ" / "1: 相対パス" / "2: 絶対パス" / "3: ホームを `~` に短縮したパス"
            },
          },
          lualine_x = { "encoding", custom_fileformat, "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { "nvim-tree", "lazy", "quickfix" },
      })
    end,
  },
}
