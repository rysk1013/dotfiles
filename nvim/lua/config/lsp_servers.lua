return {
  -- Bash/Sh/Zsh
  bashls = {},
  -- Go
  gopls = {},
  -- JS/TS
  eslint = {},
  ts_ls = {},
   -- Lua
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },
  -- PHP
  intelephense = {},
  -- python
  basedpyright = {},
  ruff = {},
}
