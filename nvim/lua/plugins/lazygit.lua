return {
	"kdheepak/lazygit.nvim",
	cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter" },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
  -- keymaps
	keys = {
		{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
	},
	config = function()
		-- LazyGit をフローティングウィンドウで表示する設定（任意）
		vim.g.lazygit_floating_window_winblend = 0 -- 透明度
		vim.g.lazygit_floating_window_scaling_factor = 0.9 -- サイズ縮小率
		-- vim.g.lazygit_floating_window_border_chars = { "╭", "╮", "╯", "╰", "│", "─", "│", "│" }

		-- git config 連携（optional）
		vim.g.lazygit_use_neovim_remote = 1
	end,
}
