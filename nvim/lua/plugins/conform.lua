return {
	"stevearc/conform.nvim",
	event = { "BufWritePre", "BufNewFile" },
	opts = {
		notify_on_error = true,
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			json = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			php = { "pint" },
			go = { "gofumpt" },
			python = { "black" },
			sql = { "sqlfluff" },
		},
		format_on_save = false, -- 明示的に手動トリガ
	},
	config = function(_, opts)
		require("conform").setup(opts)

		-- 新マッピング：<leader>F でフォーマット
		vim.keymap.set("n", "<leader>F", function()
			require("conform").format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 3000,
			})
		end, { desc = "Format (Conform)" })
	end,
}
