return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		----------------------------------------------------------------
		-- Keymaps
		----------------------------------------------------------------
		{ "<leader>tt", "<cmd>TermBottom<CR>", desc = "Terminal: Bottom" },
		{ "<leader>tf", "<cmd>TermFloat<CR>", desc = "Terminal: Float" },
		{ "<leader>tr", "<cmd>TermRight<CR>", desc = "Terminal: Right" },
		{ "<leader>tn", "<cmd>TermNew<CR>", desc = "Terminal: New (bottom)" },
		{ "<leader>tN", "<cmd>TermNewRight<CR>", desc = "Terminal: New (right)" },
	},
	config = function()
		----------------------------------------------------------------
		-- プロジェクトルートでターミナルを起動
		----------------------------------------------------------------
		local get_root = function()
			local util = require("lspconfig.util")
			return util.root_pattern(".git")(vim.fn.expand("%:p")) or vim.fn.getcwd()
		end

		----------------------------------------------------------------
		-- toggleterm 基本設定（サイズ/方向など）
		----------------------------------------------------------------
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return math.floor(vim.o.lines * 0.45) -- 下パネルは画面高の45%
				elseif term.direction == "vertical" then
					return math.floor(vim.o.columns * 0.40) -- 右パネルは画面幅の40%
				end
			end,
			direction = "horizontal", -- 既定は下パネル
			shade_terminals = true,
			shading_factor = 1,
			start_in_insert = true,
			insert_mappings = false,
			persist_mode = false,
			persist_size = true,
			close_on_exit = true,
			shell = vim.o.shell,
			on_create = function(term)
				term.dir = get_root()
			end,
			on_open = function()
				-- <Esc> ノーマルモードへ
				vim.keymap.set(
					"t",
					"<Esc>",
					[[<C-\><C-n>]],
					{ buffer = 0, silent = true, desc = "Terminal: Normal mode" }
				)

				-- q で即終了（ウィンドウを閉じる）
				vim.keymap.set("t", "q", [[<C-\><C-n>:q<CR>]], { buffer = 0, silent = true, desc = "Terminal: Close" })
			end,
		})

		----------------------------------------------------------------
		-- ユーザーコマンド定義（E492 対策：常に存在）
		----------------------------------------------------------------
		local Terminal = require("toggleterm.terminal").Terminal

		-- 下パネル（固定: id=1）
		local bottom = Terminal:new({ id = 1, direction = "horizontal", dir = nil })
		vim.api.nvim_create_user_command("TermBottom", function()
			bottom:toggle()
		end, {})

		-- フロート（固定: id=2）
		local float = Terminal:new({
			id = 2,
			direction = "float",
			float_opts = {
				border = "rounded",
				row = 1,
			},
			dir = nil,
		})
		vim.api.nvim_create_user_command("TermFloat", function()
			float:toggle()
		end, {})

		-- 右パネル（固定: id=3）
		local right = Terminal:new({ id = 3, direction = "vertical", dir = nil })
		vim.api.nvim_create_user_command("TermRight", function()
			right:toggle()
		end, {})

		-- 新しい下ターミナルを追加生成
		vim.api.nvim_create_user_command("TermNew", function()
			Terminal:new({ direction = "horizontal", dir = nil }):toggle()
		end, {})

		-- 新しい右ターミナルを追加生成
		vim.api.nvim_create_user_command("TermNewRight", function()
			Terminal:new({ direction = "vertical", dir = nil }):toggle()
		end, {})
	end,
}
