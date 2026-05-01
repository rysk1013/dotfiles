local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
if not string.find(vim.env.PATH or "", mason_bin, 1, true) then
	vim.env.PATH = mason_bin .. ":" .. (vim.env.PATH or "")
end

require("base")
require("keymaps")
require("config.lazy")
