return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- アイコン表示用
	config = function()
		----------------------------------------------------------------
		-- 基本設定
		----------------------------------------------------------------
		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			view = {
				width = 35,
				side = "left",
				signcolumn = "yes",
				number = false,
				relativenumber = false,
				preserve_window_proportions = true,
			},
			renderer = {
				root_folder_label = false,
				highlight_opened_files = "none",
				highlight_git = true,
				indent_markers = { enable = true },
				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
					glyphs = {
						default = "󰈚",
						symlink = "",
						folder = {
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							arrow_closed = "",
							arrow_open = "",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			filters = {
				dotfiles = false,
				git_ignored = false,
				custom = { ".git", "node_modules", ".cache" },
			},
			git = {
				enable = true,
				ignore = false,
				timeout = 500,
			},
			actions = {
				open_file = {
					quit_on_open = false,
					resize_window = true,
				},
				remove_file = { close_window = false },
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
		})

		----------------------------------------------------------------
		-- Keymaps
		----------------------------------------------------------------
		local map = function(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { silent = true, noremap = true, desc = desc })
		end

		map("<leader>e", "<cmd>NvimTreeToggle<CR>", "Toggle file explorer")
		map("<leader>o", "<cmd>NvimTreeFocus<CR>", "Focus file explorer")
		map("<leader>r", "<cmd>NvimTreeRefresh<CR>", "Refresh file explorer")
		map("<leader>n", "<cmd>NvimTreeFindFile<CR>", "Locate current file in tree")
	end,
}
