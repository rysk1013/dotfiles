return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = "BufAdd",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local ok, bufferline = pcall(require, "bufferline")
		if not ok then
			return
		end

		local api = vim.api

		----------------------------------------------------------------
		-- 名前なしバッファ ([No Name]) を bufferline から隠す
		----------------------------------------------------------------
		local function hide_unnamed_buffers()
			for _, b in ipairs(api.nvim_list_bufs()) do
				if
					api.nvim_buf_is_valid(b)
					and vim.bo[b].buflisted
					and api.nvim_buf_get_name(b) == "" -- ← 名前なし
				then
					vim.bo[b].buflisted = false
				end
			end
		end

		----------------------------------------------------------------
		-- 「実バッファ」判定（NvimTree & [No Name] はカウントしない）
		----------------------------------------------------------------
		local function is_real_buffer(b)
			return api.nvim_buf_is_valid(b)
				and vim.bo[b].buflisted
				and vim.bo[b].filetype ~= "NvimTree"
				and api.nvim_buf_get_name(b) ~= "" -- ← [No Name] を除外
		end

		----------------------------------------------------------------
		-- smart_bdelete
		--「実バッファ」が複数 → バッファのみ削除（カーソル維持）
		--「実バッファ」が1つ → バッファ削除 + ウィンドウ閉じる
		-- [No Name] や NvimTree は対象外
		----------------------------------------------------------------
		local function smart_bdelete(target_bufnr)
			local cur_win = api.nvim_get_current_win()
			local cur_buf = api.nvim_get_current_buf()

			-- 対象バッファ
			local bufnr = target_bufnr ~= 0 and target_bufnr or cur_buf
			if not api.nvim_buf_is_valid(bufnr) then
				return
			end

			-- NvimTree は閉じない
			if vim.bo[bufnr].filetype == "NvimTree" then
				return
			end

			-- 現在存在する「実バッファ」を列挙
			local listed = {}
			for _, b in ipairs(api.nvim_list_bufs()) do
				if is_real_buffer(b) then
					table.insert(listed, b)
				end
			end

			--「実バッファ」が1つだけ → そのバッファ削除 + ウィンドウ閉じる
			if #listed <= 1 then
				pcall(vim.cmd, "bdelete " .. bufnr)

				if api.nvim_win_is_valid(cur_win) then
					api.nvim_set_current_win(cur_win)
					pcall(vim.cmd, "close")
				end

				-- [No Name] があっても bufferline に出さない
				hide_unnamed_buffers()
				return
			end

			-- 通常パターン：バッファだけ削除（ウィンドウは残す）
			if bufnr == cur_buf then
				vim.cmd("bprevious")
				if api.nvim_get_current_buf() == bufnr then
					vim.cmd("bnext")
				end
				if api.nvim_get_current_buf() == bufnr then
					vim.cmd("enew")
				end
			end

			pcall(vim.cmd, "bdelete " .. bufnr)

			-- 誤って NvimTree に飛んだ場合は、元ウィンドウにフォーカスを戻す
			if api.nvim_win_is_valid(cur_win) then
				api.nvim_set_current_win(cur_win)
			end

			-- 最後に [No Name] バッファを非表示化
			hide_unnamed_buffers()
		end

		----------------------------------------------------------------
		-- bufferline 設定
		----------------------------------------------------------------
		bufferline.setup({
			options = {
				mode = "buffers",
				numbers = "none",
				diagnostics = "nvim_lsp",
				show_buffer_icons = false,
				color_icons = false,
				show_buffer_close_icons = true,
				show_close_icon = false,
				separator_style = "thin",
				always_show_bufferline = true, -- 必要なら false にしてもOK
				indicator = { style = "underline" },

				offsets = {
					{
						filetype = "NvimTree",
						text = "",
						highlight = "Directory",
						separator = true,
					},
				},

				-- × ボタン/右クリックでも smart_bdelete
				close_command = function(bufnr)
					smart_bdelete(bufnr)
				end,
				right_mouse_command = function(bufnr)
					smart_bdelete(bufnr)
				end,

				-- 20文字超は省略、未保存は ● を先頭に付ける
				max_name_length = 20,
				truncate_names = true,
				modified_icon = "●",
				name_formatter = function(buf)
					local name = buf.name ~= "" and vim.fn.fnamemodify(buf.name, ":t") or "[No Name]"
					return buf.modified and ("● " .. name) or name
				end,
			},

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

		map("<S-l>", ":BufferLineCycleNext<CR>", "Next buffer")
		map("<S-h>", ":BufferLineCyclePrev<CR>", "Prev buffer")
		map("<A-l>", ":BufferLineMoveNext<CR>", "Move buffer right")
		map("<A-h>", ":BufferLineMovePrev<CR>", "Move buffer left")

		for i = 1, 9 do
			map(("<leader>%d"):format(i), (":BufferLineGoToBuffer %d<CR>"):format(i), ("Go to buffer %d"):format(i))
		end

		map("<leader>bp", ":BufferLinePick<CR>", "Pick buffer")
		map("<leader>x", ":BufferLinePickClose<CR>", "Pick buffer to close")

		-- smart_bdelete を <leader>q に割り当て
		map("<leader>q", function()
			smart_bdelete(0)
		end, "Close current buffer (smart)")
	end,
}
