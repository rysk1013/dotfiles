# Neovim Keymap Cheat Sheet

## which-key

| キー | アクション |
|------|-------------|
| `<leader>wk` | which-key メニューを手動で開く |
| `<leader>?` | which-key メニューを手動で開く（同義） |
| `<C-Space>` | どのモードでも which-key を手動で開く |
| `:WhichKey <leader>` | Leader配下をコマンドで開く |
| `:WhichKeyPrefix` | 任意プレフィックスを入力してメニュー表示 |

---

## ファイル / 検索（Telescope）

| キー | アクション | プラグイン |
|------|-------------|-------------|
| `<leader>ff` | ファイル検索 | Telescope |
| `<leader>fg` | 文字列検索（live grep） | Telescope |
| `<leader>fb` | バッファ一覧 | Telescope |
| `<leader>fh` | ヘルプ検索 | Telescope |
| `<leader>fs` | ドキュメントシンボル検索 | Telescope + LSP |
| `<leader>frf` | 最近開いたファイル | Telescope |
| `<leader>frr` | LSP 参照一覧 | Telescope |

---

## LSP / 開発補助

| キー | アクション |
|------|-------------|
| `K` | ホバー（ドキュメント表示） |
| `gd` | 定義へジャンプ |
| `gr` | 参照一覧表示 |
| `gi` | 実装へジャンプ |
| `gy` | 型定義へジャンプ |
| `]d` / `[d` | 次 / 前の診断へ移動 |
| `]c` / `[c` | 次 / 前の Git hunk へ移動 |
| `<leader>d` | 診断フロート（トグル） |
| `<leader>rn` | シンボル名を変更 |
| `<leader>ca` | コードアクション |
| `<leader>F` | コード整形（Conform.nvim） |
| `<C-/>` or `<C-_>` | コメントトグル |

---

## Treesitter

| キー | アクション |
|------|-------------|
| `<leader>ts` | Treesitter パーサを更新 |
| `<leader>ti` | Treesitter 情報を表示 |

---

## Git / Gitsigns / LazyGit

| キー | アクション | プラグイン |
|------|-------------|-------------|
| `<leader>gg` | LazyGit を開く | LazyGit |
| `<leader>gc` | コミット履歴 | Telescope |
| `<leader>gs` | Git ステータス | Telescope |
| `<leader>hs` | Hunk をステージ | Gitsigns |
| `<leader>hr` | Hunk をリセット | Gitsigns |
| `<leader>hp` | Hunk をプレビュー | Gitsigns |
| `<leader>hb` | 行ブレーム切替 | Gitsigns |
| `<leader>hd` | diff 表示 | Gitsigns |

---

## バッファ / タブ操作（Bufferline）

| キー | アクション |
|------|-------------|
| `<leader>bp` | バッファピッカー |
| `<leader>x` | 閉じるバッファを選択（ピック） |
| `<leader>q` | 現在のバッファを閉じる |

---

## ファイルツリー

| キー | アクション | プラグイン |
|------|-------------|-------------|
| `<leader>e` | ファイルツリー開閉 | nvim-tree |

---

## ターミナル（ToggleTerm）

| キー | アクション | プラグイン |
|------|-------------|-------------|
| `<leader>tt` | ターミナル（下部） | ToggleTerm |
| `<leader>tf` | ターミナル（フロート） | ToggleTerm |

### ターミナルモード内
| キー | アクション |
|------|-------------|
| `<Esc>` | ノーマルモードへ戻る |
| `jk` | ノーマルモードへ戻る（任意設定） |
| `<C-h/j/k/l>` | 他のウィンドウへ移動 |

---

## 🤖 Copilot

| キー | アクション | プラグイン |
|------|-------------|-------------|
| `<leader>ce` | Copilot 有効化 | Copilot.lua |
| `<leader>cd` | Copilot 無効化 | Copilot.lua |
| `<leader>cs` | Copilot ステータス確認 | Copilot.lua |
| `<leader>cp` | Copilot パネルを開く | Copilot.lua |

---

## Copilot Chat

| キー | アクション | モード | プラグイン |
|------|-------------|---------|-------------|
| `<leader>co` | CopilotChat パネル開閉 | ノーマル | CopilotChat.nvim |
| `<leader>ccm` | コミットメッセージ生成 | ノーマル | CopilotChat.nvim |
| `<leader>cex` | 選択コードを説明 | ビジュアル | CopilotChat.nvim |
| `<leader>cfx` | 選択コードを修正 | ビジュアル | CopilotChat.nvim |
| `<leader>ct` | テスト生成 | ビジュアル | CopilotChat.nvim |
| `<leader>coc` | コードを最適化 | ビジュアル | CopilotChat.nvim |

---

## その他便利コマンド

| コマンド | 説明 |
|----------|------|
| `:WhichKey <leader>` | Leader配下のキー一覧を開く |
| `:WhichKey g` / `:WhichKey z` | `g` / `z` 系キーの一覧を開く |
| `:WhichKeyPrefix` | 任意の接頭辞を入力してメニュー表示 |
| `:Copilot enable / disable` | Copilot の有効・無効を切り替え |
| `:CopilotChat` | チャットウィンドウを開く |
| `:TSUpdate` | Treesitter のパーサを更新 |
| `:LazyGit` | LazyGit を起動 |

---

## Tips

- Leader キーは `<Space>`
- which-key の自動表示は無効 (`triggers = {}`)
- 手動表示キー: `<leader>wk` または `<C-Space>`
- `desc` 付きのマップは which-key に自動表示される
- ビジュアル選択中でも Copilot Chat のコード解析が可能
 `<leader>wk`  | which-key 表示       | which-key       |
