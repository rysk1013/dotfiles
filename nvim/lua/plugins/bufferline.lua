return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = "BufAdd",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- アイコンは使わなくても依存でOK
	config = function()
		local ok, bufferline = pcall(require, "bufferline")
		if not ok then
			return
		end

		bufferline.setup({
			options = {
				mode = "buffers",
				numbers = "none",
				diagnostics = "nvim_lsp",
				show_buffer_icons = false, -- ← ファイルアイコン非表示
				color_icons = false,
				show_buffer_close_icons = true, -- ← 各タブの × を表示
				show_close_icon = false, -- 右端の全体 × は非表示
				separator_style = "thin",
				always_show_bufferline = true,
				indicator = { style = "underline" },

				-- NvimTree 連携：ツリー分のオフセットを自動で空ける
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true, -- 仕切り線を表示
					},
				},

				-- 20文字超は省略、未保存は ● を先頭に付ける
				max_name_length = 20,
				truncate_names = true,
				modified_icon = "●",
				name_formatter = function(buf)
					local name = buf.name ~= "" and vim.fn.fnamemodify(buf.name, ":t") or "[No Name]"
					return buf.modified and ("● " .. name) or name
				end,
			},

			-- 視認性重視の配色例
			highlights = {
				fill = { bg = "#181825" },
				background = { fg = "#a6adc8", bg = "#1e1e2e" },
				buffer_visible = { fg = "#a6adc8", bg = "#1e1e2e" },
				buffer_selected = { fg = "#1e1e2e", bg = "#cdd6f4", bold = true },
				close_button = { fg = "#a6adc8", bg = "#1e1e2e" },
				close_button_selected = { fg = "#1e1e2e", bg = "#cdd6f4", bold = true },
				separator = { fg = "#313244", bg = "#181825" },
				separator_selected = { fg = "#313244", bg = "#cdd6f4" },
				modified = { fg = "#f38ba8", bg = "#1e1e2e" },
				modified_selected = { fg = "#f38ba8", bg = "#cdd6f4" },
			},
		})

		----------------------------------------------------------------
		-- Keymaps
		----------------------------------------------------------------
		local map = function(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
		end

		-- 次/前へ移動（Mac風）
		map("<S-l>", ":BufferLineCycleNext<CR>", "Next buffer")
		map("<S-h>", ":BufferLineCyclePrev<CR>", "Prev buffer")

		-- タブの並び替え（Alt + h/l）
		map("<A-l>", ":BufferLineMoveNext<CR>", "Move buffer right")
		map("<A-h>", ":BufferLineMovePrev<CR>", "Move buffer left")

		-- 番号で移動（<leader>1~9）
		for i = 1, 9 do
			map(("<leader>%d"):format(i), (":BufferLineGoToBuffer %d<CR>"):format(i), ("Go to buffer %d"):format(i))
		end

		-- ピック移動/ピック閉じる
		map("<leader>bp", ":BufferLinePick<CR>", "Pick buffer")
		map("<leader>x", ":BufferLinePickClose<CR>", "Pick buffer to close")

		-- 現在バッファを閉じる
		map("<leader>q", ":bdelete<CR>", "Close current buffer")
	end,
}
