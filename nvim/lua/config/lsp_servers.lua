return {
  -- Go
  gopls = {},
  -- JS/TS
  eslint = {},
   -- Lua
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  }, ts_ls = {},
  -- PHP
  intelephense = {},
  -- python
  basedpyright = {},
  ruff = {},
}
