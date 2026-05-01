return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim", -- null-ls successor
	},
	config = function()
		-- Mason UI 設定
		require("mason").setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- Mason-null-ls 設定
		require("mason-null-ls").setup({
			ensure_installed = {
				-- PHP
				"pint",
				-- Lua
				"stylua",
				-- JS/TS/HTML/CSS/JSON
				"prettier",
				-- Python
				"black",
				-- Go
				"gofumpt",
				-- SQL
				"sqlfluff",
			},
			automatic_installation = true, -- 自動インストールON
		})

		-- MasonのbinをPATHへ（Conformが利用できるように）
		local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
		if not string.find(vim.env.PATH or "", mason_bin, 1, true) then
			vim.env.PATH = mason_bin .. ":" .. (vim.env.PATH or "")
		end
	end,
}
