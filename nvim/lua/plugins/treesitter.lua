return {
  -- ローカルに`tree-sitter-cli`をインストール

  'nvim-treesitter/nvim-treesitter',

  dependencies = {
    {
      'nvim-treesitter/nvim-treesitter-context',
      opts = {
        max_lines = 4,
        multiline_threshold = 2,
      },
    },
  },

  lazy = false,

  branch = 'main',

  build = ':TSUpdate',

  config = function()
    local ts = require('nvim-treesitter')

    -- 非同期パーサー読み込みのための状態追跡
    local parsers_loaded = {}
    local parsers_pending = {}
    local parsers_failed = {}

    local ns = vim.api.nvim_create_namespace('treesitter.async')

    -- ハイライトとインデントの開始を助ける関数
    local function start(buf, lang)
      local ok = pcall(vim.treesitter.start, buf, lang)
      if ok then
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
      return ok
    end

    -- lazy.nvimが全プラグインの読み込みを完了した後にコアパーサーをインストール
    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyDone',
      once = true,
      callback = function()
        ts.install({
          'bash',
          'comment',
          'css',
          'diff',
          'git_config',
          'git_rebase',
          'gitcommit',
          'gitignore',
          'go',
          'html',
          'javascript',
          'json',
          'lua',
          'luadoc',
          'markdown',
          'markdown_inline',
          'php',
          'python',
          'query',
          'regex',
          'svelte',
          'toml',
          'tsx',
          'typescript',
          'typst',
          'vim',
          'vimdoc',
          'xml',
        }, {
          max_jobs = 8,
        })
      end,
    })

    -- 非同期パーサー読み込みのための装飾プロバイダー
    vim.api.nvim_set_decoration_provider(ns, {
      on_start = vim.schedule_wrap(function()
        if #parsers_pending == 0 then
          return false
        end
        for _, data in ipairs(parsers_pending) do
          if vim.api.nvim_buf_is_valid(data.buf) then
            if start(data.buf, data.lang) then
              parsers_loaded[data.lang] = true
            else
              parsers_failed[data.lang] = true
            end
          end
        end
        parsers_pending = {}
      end),
    })

    local group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true })

    local ignore_filetypes = {
      'checkhealth',
      'cmp_docs',
      'cmp_menu',
      'lazy',
      'mason',
      'noice',
      'notify',
      'oil',
      'oil_preview',
      'SidebarNvimx',
      'snacks_dashboard',
      'snacks_layout_box',
      'snacks_notif',
      'snacks_picker_input',
      'snacks_picker_list',
      'snacks_win',
      'TelescopePrompt',
      'TelescopeResults',
    }

    -- FileTypeでのハイライト有効化とパーサーの自動インストール
    vim.api.nvim_create_autocmd('FileType', {
      group = group,
      desc = '非ブロッキングでtreesitterのハイライトとインデントを有効にする',
      callback = function(event)
        if vim.tbl_contains(ignore_filetypes, event.match) then
          return
        end

        local lang = vim.treesitter.language.get_lang(event.match) or event.match
        local buf = event.buf

        if parsers_failed[lang] then
          return
        end

        if parsers_loaded[lang] then
          -- すでにパーサーが読み込まれているので、すぐに開始（早道）
          start(buf, lang)
        else
          -- 非同期読み込みのためにキューに追加
          table.insert(parsers_pending, { buf = buf, lang = lang })
        end

        -- 足りないパーサーを自動インストール（非同期、すでにインストールされていれば無操作）
        ts.install({ lang })
      end,
    })
  end,
}
