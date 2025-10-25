return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		version = "*",
		lazy = false,
		keys = {
			{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "TreeToggle" },
		},
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			-- nvim-tree バッファ専用のキーマップを定義
			local function my_on_attach(bufnr)
				local api = require("nvim-tree.api")
				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				-- Enter で新しいタブに開く
				vim.keymap.set("n", "<CR>", api.node.open.tab, opts("Open in Tab"))

				-- 分割で開きたい場合は以下を有効化
				-- vim.keymap.set("n", "v", api.node.open.vertical,   opts("Open Vertical Split"))
				-- vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open Horizontal Split"))
			end

			require("nvim-tree").setup({
				on_attach = my_on_attach,
				sort_by = "case_sensitive",
				view = {
					width = 30,
					side = "left",
					preserve_window_proportions = true,
				},
				renderer = {
					group_empty = true,
					highlight_git = true,
					icons = {
						show = {
							file = true,
							folder = true,
							folder_arrow = true,
							git = true,
						},
					},
				},
				filters = {
					dotfiles = false,
				},
				git = {
					enable = true,
				},
				actions = {
					open_file = {
						quit_on_open = false,
						-- window_picker を無効にしたい場合は有効化:
						-- window_picker = { enable = false },
					},
				},
				update_focused_file = {
					enable = true,
					update_root = true,
					ignore_list = {},
				},
			})
		end,
	},
}
