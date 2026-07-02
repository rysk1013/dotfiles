return {
  {
    -- ビルドが失敗した場合、インストール後に下記コマンドを実行する
    -- :Lazy load markdown-preview.nvim
    -- :Lazy build markdown-preview.nvim

    "iamcco/markdown-preview.nvim",

    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },

    ft = { "markdown" },

    build = function() vim.fn["mkdp#util#install"]() end,

    keys = {
      { "<leader>mp", "<CMD>MarkdownPreviewToggle<CR>", mode = "n", desc = "Toggle markdown preview" },
    },
  }
}
