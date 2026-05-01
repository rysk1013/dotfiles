return {
	"kdheepak/lazygit.nvim",
	cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter" },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
	},
	config = function()
		-- LazyGit のフロート表示設定
		vim.g.lazygit_floating_window_winblend = 0 -- 透明度
		vim.g.lazygit_floating_window_scaling_factor = 0.9 -- サイズ縮小率
		-- vim.g.lazygit_floating_window_border_chars = { "╭", "╮", "╯", "╰", "│", "─", "│", "│" }

		-- git config 連携（optional）
		vim.g.lazygit_use_neovim_remote = 1

		-- <Esc> / q で LazyGit を閉じる処理
		-- LazyGit は filetype = "lazygit" の terminal buffer を使用する
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "lazygit",
			callback = function(ev)
				local opts = { noremap = true, silent = true, buffer = ev.buf }
				vim.keymap.set("t", "<Esc>", "<cmd>close<CR>", opts)
			end,
			desc = "LazyGit: close with <Esc>",
		})

		-- 念のため TermOpen 側でも設定（環境によって filetype イベントが遅れる場合あり）
		vim.api.nvim_create_autocmd("TermOpen", {
			pattern = "term://*lazygit*",
			callback = function(ev)
				local opts = { noremap = true, silent = true, buffer = ev.buf }
				vim.keymap.set("t", "<Esc>", "<cmd>close<CR>", opts)
			end,
			desc = "LazyGit(term): close with <Esc>",
		})

		-- Lazygit 終了時に gitsigns を更新
		vim.g.lazygit_on_exit_callback = function()
			local ok, gs = pcall(require, "gitsigns")
			if ok then
				-- 変更（ステージ/コミット/リセットなど）を即時反映
				gs.refresh()
			end
		end

		-- LazyGit 終了時に NvimTree を更新
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyGitExit",
			callback = function()
				-- 外部変更をチェック（stash/reset/rebase 対応）
				pcall(vim.cmd, "checktime")

				-- NvimTree の再読み込み
				local ok, api = pcall(require, "nvim-tree.api")
				if ok then
					pcall(api.tree.reload)
					pcall(vim.cmd, "redraw!") -- 画面反映
				end
			end,
			desc = "Auto refresh NvimTree after LazyGit commit/exit",
		})
	end,
}
