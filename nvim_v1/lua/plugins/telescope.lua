return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6", -- 安定版
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- 高速あいまい検索
			"nvim-telescope/telescope-ui-select.nvim", -- vim.ui.select を Telescope UI に
		},
		cmd = "Telescope",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep (rg)" },
			{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help" },
			{ "<leader>rf", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
			{ "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", desc = "LSP Symbols (doc)" },
			{ "<leader>fr", "<cmd>Telescope lsp_references<CR>", desc = "LSP References" },
			{ "<leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
			{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Git commits" },
			{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Git status" },
		},
		config = function()
			local actions = require("telescope.actions")
			local telescope = require("telescope")

			telescope.setup({
				defaults = {
					prompt_prefix = "  ",
					selection_caret = "❯ ",
					path_display = { "smart" },
					sorting_strategy = "ascending",
					scroll_strategy = "cycle",
					winblend = 0,
					dynamic_preview_title = true,
					file_ignore_patterns = {
						"%.git/",
						"node_modules/",
						"dist/",
						"build/",
						"vendor/",
						"%.venv/",
						"__pycache__/",
					},
					layout_config = {
						prompt_position = "top",
						width = 0.9,
						height = 0.85,
						preview_cutoff = 100,
					},
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-q>"] = function(...)
								actions.smart_send_to_qflist(...)
								actions.open_qflist(...)
							end,
							["<Esc>"] = actions.close,
						},
						n = {
							["q"] = actions.close,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-q>"] = function(...)
								actions.smart_send_to_qflist(...)
								actions.open_qflist(...)
							end,
						},
					},
					-- ripgrep を使う系で隠しファイルも対象に
					vimgrep_arguments = (function()
						local v = {
							"rg",
							"--color=never",
							"--no-heading",
							"--with-filename",
							"--line-number",
							"--column",
							"--smart-case",
							"--hidden",
						}
						-- .gitignore は尊重（--no-ignore を付けない）
						return v
					end)(),
				},
				pickers = {
					find_files = {
						hidden = true, -- .file も表示
						follow = true, -- symlink 追従
					},
					buffers = {
						sort_mru = true,
						ignore_current_buffer = true,
						mappings = {
							i = { ["<C-d>"] = actions.delete_buffer }, -- その場でバッファ削除
							n = { ["d"] = actions.delete_buffer },
						},
					},
					live_grep = {
						-- 追加の rg 引数（例: バイナリ除外はデフォルト / 隠しファイルは defaults で指定済）
						additional_args = function(_)
							return {}
						end,
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					["ui-select"] = require("telescope.themes").get_dropdown({
						previewer = false,
						sorting_strategy = "ascending",
						layout_config = { width = 0.5, height = 0.6, prompt_position = "top" },
					}),
				},
			})

			-- 推奨拡張をロード
			pcall(telescope.load_extension, "fzf")
			pcall(telescope.load_extension, "ui-select")
		end,
	},

	-- fzf-native を単体で lazy 管理したい場合は分離してもOK（上の deps で十分なら不要）
	-- {
	--   "nvim-telescope/telescope-fzf-native.nvim",
	--   build = "make",
	--   event = "VeryLazy",
	--   config = function() require("telescope").load_extension("fzf") end,
	-- },
}
