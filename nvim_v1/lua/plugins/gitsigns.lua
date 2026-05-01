return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" }, -- ファイル読み込み時に有効化
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "│" }, -- 追加行
				change = { text = "│" }, -- 変更行
				delete = { text = "_" }, -- 削除行
				topdelete = { text = "‾" }, -- 先頭削除
				changedelete = { text = "~" }, -- 変更＋削除
				untracked = { text = "┆" }, -- 未追跡ファイル
			},
			signcolumn = true, -- 左端のサインカラムにマークを表示
			numhl = false, -- 行番号を色付けしたい場合は true
			linehl = false, -- 行全体をハイライト
			word_diff = false, -- 単語単位で差分を表示（trueで有効）
			watch_gitdir = { interval = 1000, follow_files = true },
			attach_to_untracked = true,
			current_line_blame = true, -- blame（誰がいつ変更したか）を表示
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- eol / overlay / right_align
				delay = 1000,
				ignore_whitespace = false,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			sign_priority = 6,
			update_debounce = 200,
			status_formatter = nil, -- ステータスライン用のカスタム関数
		})

		----------------------------------------------------------------
		-- Keymaps
		----------------------------------------------------------------
		local gs = package.loaded.gitsigns
		vim.keymap.set("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true, desc = "Next Git hunk" })

		vim.keymap.set("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true, desc = "Prev Git hunk" })

		vim.keymap.set("n", "<leader>ghs", gs.stage_hunk, { desc = "Stage hunk" })
		vim.keymap.set("n", "<leader>ghr", gs.reset_hunk, { desc = "Reset hunk" })
		vim.keymap.set("n", "<leader>ghp", gs.preview_hunk, { desc = "Preview hunk" })
		vim.keymap.set("n", "<leader>ghb", gs.toggle_current_line_blame, { desc = "Toggle blame" })
		vim.keymap.set("n", "<leader>ghd", gs.diffthis, { desc = "Diff current file" })
	end,
}
