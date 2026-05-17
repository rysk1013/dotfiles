return {
  "neovim/nvim-lspconfig",

  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    "mason-org/mason-lspconfig.nvim",
  },

  config = function()
    local servers = require("config.lsp_servers")

    for server, config in pairs(servers) do
      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    end
  end
}
