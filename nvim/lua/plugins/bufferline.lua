return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = "BufAdd",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- アイコンは使わないが依存でOK
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
				show_buffer_icons = false, -- ← アイコン非表示
				color_icons = false,
				show_buffer_close_icons = true, -- ← 各タブの×は表示
				show_close_icon = false, -- 右端の×は非表示
				separator_style = "thin",
				always_show_bufferline = true,
				indicator = { style = "underline" },
				offsets = {
					{ filetype = "NvimTree", text = "File Explorer", highlight = "Directory", separator = true },
				},
				max_name_length = 20,
				truncate_names = true,
				modified_icon = "●", -- フォールバック
				-- 未保存時はファイル名の前に ● を付与
				name_formatter = function(buf)
					local name = buf.name ~= "" and vim.fn.fnamemodify(buf.name, ":t") or "[No Name]"
					return buf.modified and ("● " .. name) or name
				end,
			},
			highlights = {
				-- 視認性重視（アクティブを明色、非アクティブを暗色）
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

		-- 次のタブへ / 前のタブへ
		map("<S-l>", ":BufferLineCycleNext<CR>", "Next buffer")
		map("<S-h>", ":BufferLineCyclePrev<CR>", "Prev buffer")
		-- タブを右へ移動 / 左へ移動
		map("<A-l>", ":BufferLineMoveNext<CR>", "Move buffer right")
		map("<A-h>", ":BufferLineMovePrev<CR>", "Move buffer left")
		-- 番号で移動（<leader>1~9）
		for i = 1, 9 do
			map(("<leader>%d"):format(i), (":BufferLineGoToBuffer %d<CR>"):format(i), ("Go to buffer %d"):format(i))
		end
		-- ピック移動
		map("<leader>bp", ":BufferLinePick<CR>", "Pick buffer")
		-- 閉じる
		map("<leader>q", ":bdelete<CR>", "Close current buffer")
		-- ピック閉じる
		map("<leader>x", ":BufferLinePickClose<CR>", "Pick buffer to close")
	end,
}
