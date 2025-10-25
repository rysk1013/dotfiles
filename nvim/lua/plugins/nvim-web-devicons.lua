return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,
  config = function()
    local devicons = require("nvim-web-devicons")

    devicons.setup({
      override = {
        -- ==========================
        -- ファイルアイコン（前回のもの + 必要に応じて追加）
        -- ==========================
        php = { icon = "", color = "#4F5D95", name = "Php", },
        go = { icon = "", color = "#00ADD8", name = "Go" },
        js = { icon = "", color = "#f7df1e", name = "Js" },
        jsx = { icon = "", color = "#61dafb", name = "Jsx" },
        ts = { icon = "", color = "#3178c6", name = "Ts" },
        tsx = { icon = "", color = "#3178c6", name = "Tsx", },
        lua = { icon = "", color = "#51a0cf", name = "Lua" },
        json = { icon = "", color = "#cbcb41", name = "Json" },
        dockerfile = { icon = "󰡨", color = "#2496ed", name = "Dockerfile" },
        md = { icon = "", color = "#519aba", name = "Markdown" },
        -- ==========================
        -- フォルダアイコン（Material Icon Theme風）
        -- ==========================
        folder = {
          icon = "󰉋",
          color = "#e7c547",
          name = "Folder",
        },
        folder_open = {
          icon = "󰝰",
          color = "#e7c547",
          name = "FolderOpen",
        },
        folder_symlink = {
          icon = "󱧶",
          color = "#00afff",
          name = "FolderSymlink",
        },
      },
      default = true,
    })
  end,
}
