return {
	"dhruvasagar/vim-table-mode",
	cmd = { "TableModeToggle", "TableModeRealign" },
	init = function()
		-- 表の整列（手動実行）
		vim.keymap.set("n", "<leader>ta", "<cmd>TableModeRealign<CR>", { desc = "Table Mode: Realign table" })
	end,
	config = function()
		vim.g.table_mode_corner = "|"
		vim.g.table_mode_border = "|"
		vim.g.table_mode_fillchar = "-"
		vim.g.table_mode_align_char = ":"
	end,
}
