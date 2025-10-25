return {
	-- 1) Installer: mason
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},

	-- 2) Bridge: mason-lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"html",
					"cssls",
					"eslint",
					"jsonls",
					"bashls",
					"gopls",
					"intelephense",
				},
				automatic_installation = true,
			})
		end,
	},

	-- 3) Core: nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local lspconfig = require("lspconfig")
			local util = require("lspconfig.util")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			----------------------------------------------------------------
			--  Hover / Diagnostic 用フロートウィンドウの共通設定
			----------------------------------------------------------------
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e2030" })
			vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#7aa2f7", bg = "#1e2030" })
			vim.api.nvim_set_hl(0, "FloatTitle", { fg = "#7aa2f7", bold = true })

			----------------------------------------------------------------
			-- Diagnostic（非推奨API不使用）
			----------------------------------------------------------------
			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.INFO] = " ",
						[vim.diagnostic.severity.HINT] = " ",
					},
				},
				virtual_text = { prefix = "●" },
				underline = true,
				signs = true,
				update_in_insert = false,
				severity_sort = true,
				float = { border = "rounded", source = "always" },
			})

			----------------------------------------------------------------
			-- トグル Hover 表示
			----------------------------------------------------------------
			local hover_win = nil

			local function toggle_hover()
				-- 既存ウィンドウがあれば閉じる
				if hover_win and vim.api.nvim_win_is_valid(hover_win) then
					vim.api.nvim_win_close(hover_win, true)
					hover_win = nil
					return
				end

				-- 新しく開く
				vim.lsp.buf.hover()
				-- 開いたウィンドウを特定して保持
				vim.defer_fn(function()
					for _, win in ipairs(vim.api.nvim_list_wins()) do
						local cfg = vim.api.nvim_win_get_config(win)
						if cfg.relative ~= "" then
							hover_win = win
							break
						end
					end
				end, 50)
			end

			----------------------------------------------------------------
			-- トグル Diagnostic Float
			----------------------------------------------------------------
			local diag_float_win = nil

			local function toggle_diagnostic_float()
				if diag_float_win and vim.api.nvim_win_is_valid(diag_float_win) then
					vim.api.nvim_win_close(diag_float_win, true)
					diag_float_win = nil
					return
				end

				vim.diagnostic.open_float(nil, {
					scope = "line",
					border = "rounded",
					focusable = true,
					close_events = { "CursorMoved", "BufHidden", "InsertEnter" },
				})

				for _, win in ipairs(vim.api.nvim_list_wins()) do
					local cfg = vim.api.nvim_win_get_config(win)
					if cfg.relative ~= "" then
						diag_float_win = win
						break
					end
				end
			end

			----------------------------------------------------------------
			-- Keymaps（LSP attach 時に登録）
			----------------------------------------------------------------
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local map = function(mode, lhs, rhs)
						vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, silent = true, noremap = true })
					end
					map("n", "gd", vim.lsp.buf.definition)
					map("n", "gr", vim.lsp.buf.references)
					map("n", "gi", vim.lsp.buf.implementation)
					map("n", "gy", vim.lsp.buf.type_definition)
					map("n", "K", toggle_hover) -- ← Hover トグル化
					map("n", "<leader>d", toggle_diagnostic_float) -- ← Diagnostic トグル化
					map("n", "<leader>rn", vim.lsp.buf.rename)
					map("n", "<leader>ca", vim.lsp.buf.code_action)
					map("n", "[d", vim.diagnostic.goto_prev)
					map("n", "]d", vim.diagnostic.goto_next)
				end,
			})

			-- バッファ切り替え時にウィンドウ情報をリセット
			vim.api.nvim_create_autocmd("BufLeave", {
				callback = function()
					hover_win = nil
					diag_float_win = nil
				end,
			})

			----------------------------------------------------------------
			-- LSP 起動ロジック
			----------------------------------------------------------------
			local function has_server(server)
				return pcall(require, "lspconfig.server_configurations." .. server)
			end

			local function filetypes_for(server)
				local ok, sc = pcall(require, "lspconfig.server_configurations." .. server)
				return (ok and sc.default_config.filetypes) or {}
			end

			local function start(server, overrides)
				local ok, sc = pcall(require, "lspconfig.server_configurations." .. server)
				if not ok then
					vim.notify("LSP: server not found: " .. server, vim.log.levels.WARN)
					return
				end
				overrides = overrides or {}

				local base = vim.tbl_deep_extend("force", {}, sc.default_config or {}, overrides)
				base.capabilities = vim.tbl_deep_extend("force", {}, capabilities, overrides.capabilities or {})

				local bufnr = vim.api.nvim_get_current_buf()
				local fname = vim.api.nvim_buf_get_name(bufnr)
				local root
				if type(base.root_dir) == "function" then
					root = base.root_dir(fname)
				elseif type(base.root_dir) == "string" then
					root = base.root_dir
				end
				if not root or root == "" then
					root = util.root_pattern("composer.json", "package.json", "go.mod", ".git")(fname) or vim.loop.cwd()
				end
				base.root_dir = root

				if not base.filetypes or #base.filetypes == 0 then
					base.filetypes = (sc.default_config and sc.default_config.filetypes) or {}
				end

				vim.lsp.start(base)
			end

			local function attach_by_ft(server, overrides)
				if not has_server(server) then
					return
				end
				local fts = filetypes_for(server)
				if #fts == 0 then
					return
				end
				vim.api.nvim_create_autocmd("FileType", {
					pattern = fts,
					callback = function()
						start(server, overrides)
					end,
				})
			end

			----------------------------------------------------------------
			-- 対応サーバ
			----------------------------------------------------------------
			local servers = {
				"lua_ls",
				"ts_ls",
				"html",
				"cssls",
				"eslint",
				"jsonls",
				"bashls",
				"gopls",
				"intelephense",
			}

			for _, s in ipairs(servers) do
				if s == "lua_ls" then
					attach_by_ft("lua_ls", {
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } },
								workspace = {
									library = vim.api.nvim_get_runtime_file("", true),
									checkThirdParty = false,
								},
								telemetry = { enable = false },
							},
						},
					})
				elseif s == "intelephense" then
					attach_by_ft("intelephense", {
						settings = {
							intelephense = {
								environment = { phpVersion = "8.3" },
								files = { maxSize = 5 * 1024 * 1024 },
							},
						},
					})
				else
					attach_by_ft(s)
				end
			end
		end,
	},
}
