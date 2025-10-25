-- Copilot Chat（チャットUI + 選択範囲アクションのキー）
return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
  cmd = {
    "CopilotChat", "CopilotChatOpen", "CopilotChatClose", "CopilotChatToggle",
    "CopilotChatExplain", "CopilotChatFix", "CopilotChatOptimize",
    "CopilotChatCommit", "CopilotChatTests", "CopilotChatModels",
  },
  keys = {
    -- 開閉（デフォルト）
    { "<leader>co", "<cmd>CopilotChatToggle<CR>", desc = "CopilotChat: Toggle" },
    -- 選択範囲に対するアクション（ビジュアル）
    { "<leader>cex", "<cmd>CopilotChatExplain<CR>",  mode = "v", desc = "Explain (visual)"  },
    { "<leader>cfx", "<cmd>CopilotChatFix<CR>",      mode = "v", desc = "Fix (visual)"      },
    { "<leader>ct",  "<cmd>CopilotChatTests<CR>",    mode = "v", desc = "Tests (visual)"    },
    { "<leader>coc", "<cmd>CopilotChatOptimize<CR>", mode = "v", desc = "Optimize (visual)" },
    -- コミットメッセージ生成（ノーマル）
    { "<leader>ccm", "<cmd>CopilotChatCommit<CR>", desc = "Commit message" },
  },
  opts = {
    window = {
      layout = "vertical", -- "float" / "vertical" / "horizontal"
      position = "right", -- "top" / "bottom" / "left" / "right"
      width = 0.30,
      -- floatの場合のサイズ指定
      -- width = 0.45,
      -- height = 0.65,
      border = "rounded",
    },
    mappings = { close = "q", submit = "<CR>" },

    -- 英語版プロンプト
    -- prompts = {
    --   explain  = { system = "You are a senior engineer. Explain the code simply." },
    --   fix      = { system = "Fix the issue in the selected code with minimal changes." },
    --   optimize = { system = "Refactor for readability and performance." },
    --   tests    = { system = "Write unit tests with clear Arrange-Act-Assert." },
    --   commit   = { system = "Generate a concise conventional commit message." },
    -- },

    -- 日本語版プロンプト
    prompts = {
      explain = {
        system = table.concat({
          "あなたは熟練のソフトウェアエンジニアです。",
          "以後、回答は日本語で、専門用語は必要に応じて補足し、具体例を交えて簡潔に説明してください。",
        }, " "),
      },
      fix = {
        system = table.concat({
          "以下のコードの問題を最小限の変更で修正してください。",
          "修正理由と影響範囲も日本語で簡潔に説明してください。",
        }, " "),
      },
      optimize = {
        system = table.concat({
          "以下のコードを可読性・保守性・パフォーマンスの観点からリファクタリングしてください。",
          "変更点と意図を日本語で説明してください。",
        }, " "),
      },
      tests = {
        system = table.concat({
          "対象コードに対する単体テストを生成してください。",
          "前提条件(Arrange)・手順(Act)・検証(Assert)の観点で日本語の解説を添えてください。",
        }, " "),
      },
      commit = {
        system = table.concat({
          "日本語で簡潔かつ要点の伝わるコミットメッセージを生成してください。",
          "可能であれば Conventional Commits に準拠してください。",
        }, " "),
      },
      -- 任意：自由質問の既定スタイル
      default = {
        system = "回答は日本語で、箇条書きと短い例を用いて、簡潔かつ実践的に説明してください。",
      },
    },
  },
}
