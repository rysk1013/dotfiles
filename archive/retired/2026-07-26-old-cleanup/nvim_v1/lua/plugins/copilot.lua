return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	-- ここで定義したキーを押した時点でも自動ロードされます
	keys = {
		{ "<leader>ce", "<cmd>Copilot enable<CR>", desc = "Copilot: Enable" },
		{ "<leader>cd", "<cmd>Copilot disable<CR>", desc = "Copilot: Disable" },
		{ "<leader>cs", "<cmd>Copilot status<CR>", desc = "Copilot: Status" },
		{ "<leader>cp", "<cmd>Copilot panel<CR>", desc = "Copilot: Panel" },
	},
	config = function()
		require("copilot").setup({
			panel = {
				enabled = true,
				auto_refresh = true,
				keymap = {
					jump_prev = "[[",
					jump_next = "]]",
					accept = "<CR>",
					refresh = "gr",
					open = "<M-p>",
				},
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<C-CR>",
					accept_word = "<M-w>",
					accept_line = "<M-l>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			filetypes = {
				gitcommit = true,
				markdown = true,
				yaml = true,
				["*"] = true,
				["."] = false,
			},
			copilot_node_command = "node", -- 必要ならフルパスに
		})
	end,
}
