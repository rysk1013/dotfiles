# Keymaps

## Base

### ウィンドウ操作（移動）

| キー        | コマンド | 説明                 |
|-------------|----------|----------------------|
| `<Leader>j` | `<C-w>j` | 下のウィンドウへ移動 |
| `<Leader>k` | `<C-w>k` | 上のウィンドウへ移動 |
| `<Leader>l` | `<C-w>l` | 右のウィンドウへ移動 |
| `<Leader>h` | `<C-w>h` | 左のウィンドウへ移動 |

### ウィンドウ分割

| キー        | コマンド | 説明               |
|-------------|----------|--------------------|
| `<Leader>s` | `:sp`    | 横に分割（split）  |
| `<Leader>v` | `:vs`    | 縦に分割（vsplit） |

### ウィンドウの保存・終了

| キー         | コマンド | 説明           |
|--------------|----------|----------------|
| `<Leader>w`  | `:w`     | 保存           |
| `<Leader>q`  | `:q`     | 閉じる         |
| `<Leader>wq` | `:wq`    | 保存して閉じる |

### ターミナル操作

| キー         | モード | コマンド    | 説明             |
|--------------|--------|-------------|------------------|
| `<Leader>tt` | Normal | `:terminal` | ターミナルを開く |
| `<C-k>`      | Insert | 上に移動    |
| `<C-j>`      | Insert | 下に移動    |
| `<C-h>`      | Insert | 左に移動    |
| `<C-l>`      | Insert | 右に移動    |

### デバッグ・検査

| キー        | コマンド   | 説明                       |
|-------------|------------|----------------------------|
| `<Leader>:` | `:Inspect` | カーソル下の構文情報を表示 |

### コメントトグル（rebind）

| モード | キー    | コマンド | 説明                       |
|--------|---------|----------|----------------------------|
| Normal | `<C-_>` | `gcc`    | コメントトグル（行）       |
| Visual | `<C-_>` | `gc`     | コメントトグル（選択範囲） |

### ファイルパスコピー（Clipboard）

| キー          | コピー内容     | 説明                     |
|---------------|----------------|--------------------------|
| `<Leader>fpa` | 絶対パス       | `/Users/.../example.lua` |
| `<Leader>fpr` | 相対パス       | `./lua/example.lua`      |
| `<Leader>fpf` | ファイル名のみ | `example.lua`            |

## Bufferline

| キー                    | コマンド                    | 説明                                   |
|-------------------------|-----------------------------|----------------------------------------|
| `Shift + l`             | `:BufferLineCycleNext`      | 次のバッファへ移動（Mac風）            |
| `Shift + h`             | `:BufferLineCyclePrev`      | 前のバッファへ移動（Mac風）            |
| `Alt + l`               | `:BufferLineMoveNext`       | 現在のバッファを右へ移動               |
| `Alt + h`               | `:BufferLineMovePrev`       | 現在のバッファを左へ移動               |
| `<leader>1`~`<leader>9` | `:BufferLineGoToBuffer 1~9` | 指定番号のバッファへジャンプ           |
| `<leader>bp`            | `:BufferLinePick`           | バッファをピックして移動（文字で選択） |
| `<leader>x`             | `:BufferLinePickClose`      | バッファをピックして閉じる             |
| `<leader>q`             | `:bdelete`                  | 現在のバッファを閉じる                 |

## Cmp

| キー           | コマンド                                 | 説明                       |
|----------------|------------------------------------------|----------------------------|
| `Ctrl + n`     | `cmp.mapping.select_next_item()`         | 次の補完候補を選択         |
| `Ctrl + p`     | `cmp.mapping.select_prev_item()`         | 前の補完候補を選択         |
| `Ctrl + y`     | `cmp.mapping.confirm({ select = true })` | 補完を確定（Enter の代替） |
| `Ctrl + Space` | `cmp.mapping.complete()`                 | 手動で補完を呼び出す       |
| `q`            | `cmp.mapping.abort()`                    | 補完ウィンドウを閉じる     |

## Conform

| キー        | コマンド                                                                               | 説明                                   |
|-------------|----------------------------------------------------------------------------------------|----------------------------------------|
| `<leader>F` | `require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 3000 })` | 手動でコードを整形（フォーマット）する |

## CopilotChat

| キー          | モード     | コマンド                         | 説明                                         |
|---------------|------------|----------------------------------|----------------------------------------------|
| `<leader>co`  | ノーマル   | `:CopilotChatToggle`             | Copilot Chat ウィンドウの開閉                |
| `<leader>cex` | ビジュアル | `:CopilotChat prompt=ExplainJa`  | 選択範囲のコードを日本語で説明               |
| `<leader>cfx` | ビジュアル | `:CopilotChat prompt=FixJa`      | 選択範囲のコードの問題を修正                 |
| `<leader>ct`  | ビジュアル | `:CopilotChat prompt=TestsJa`    | 選択範囲のコードに対する単体テストを生成     |
| `<leader>coc` | ビジュアル | `:CopilotChat prompt=OptimizeJa` | 選択範囲のコードを最適化（リファクタリング） |
| `<leader>ccm` | ノーマル   | `:CopilotChat prompt=CommitJa`   | 日本語のコミットメッセージを生成             |
| `q`           | ノーマル   | -                                | チャットウィンドウを閉じる                   |
| `Enter`       | -          | ノーマル / 挿入                  | プロンプトを送信                             |

## Copilot

| キー         | コマンド           | 説明                   |
|--------------|--------------------|------------------------|
| `<leader>ce` | `:Copilot enable`  | Copilot を有効化       |
| `<leader>cd` | `:Copilot disable` | Copilot を無効化       |
| `<leader>cs` | `:Copilot status`  | 現在のステータスを表示 |
| `<leader>cp` | `:Copilot panel`   | Copilot パネルを開く   |

### In Copilot Suggestion

| キー       | 説明                                |
|------------|-------------------------------------|
| `[[`       | 前の提案へ移動                      |
| `]]`       | 次の提案へ移動                      |
| `Enter`    | 提案を確定（accept）                |
| `gr`       | 提案をリフレッシュ                  |
| `Alt + p`  | パネルを開く（open）                |
| `Tab`      | 提案を確定（accept）                |
| `Alt + w`  | 単語単位で受け入れる（accept word） |
| `Alt + l`  | 行単位で受け入れる（accept line）   |
| `Alt + ]`  | 次の提案に移動（next）              |
| `Alt + [`  | 前の提案に移動（prev）              |
| `Ctrl + ]` | 提案を非表示（dismiss）             |

## Gitsigns

| キー          | コマンド                         | 説明                             |
|---------------|----------------------------------|----------------------------------|
| `]c`          | `gs.next_hunk()`                 | 次の変更（hunk）へ移動           |
| `[c`          | `gs.prev_hunk()`                 | 前の変更（hunk）へ移動           |
| `<leader>ghs` | `gs.stage_hunk()`                | 現在の変更（hunk）をステージング |
| `<leader>ghr` | `gs.reset_hunk()`                | 現在の変更（hunk）をリセット     |
| `<leader>ghp` | `gs.preview_hunk()`              | 変更内容をプレビュー表示         |
| `<leader>ghb` | `gs.toggle_current_line_blame()` | 現在行の blame 表示をトグル      |
| `<leader>ghd` | `gs.diffthis()`                  | 現在ファイルの差分を表示         |

## Lazygit

| キー         | コマンド   | 説明                           |
|--------------|------------|--------------------------------|
| `<leader>gg` | `:LazyGit` | LazyGit を開く（常に新規起動） |

### In Lazygit Terminal

| モード            | キー    | 動作     | 説明                       |
|-------------------|---------|----------|----------------------------|
| `t`（ターミナル） | `<Esc>` | `:close` | LazyGit ウィンドウを閉じる |
| `t`（ターミナル） | `q`     | `:close` | LazyGit ウィンドウを閉じる |

## LSP

| キー         | コマンド                        | 説明                                       |
|--------------|---------------------------------|--------------------------------------------|
| `gd`         | `vim.lsp.buf.definition()`      | 定義へジャンプ                             |
| `gr`         | `vim.lsp.buf.references()`      | 参照を一覧表示                             |
| `gi`         | `vim.lsp.buf.implementation()`  | 実装へジャンプ                             |
| `gy`         | `vim.lsp.buf.type_definition()` | 型定義へジャンプ                           |
| `K`          | `toggle_hover()`                | Hover 情報をトグル表示（LSP ドキュメント） |
| `<leader>d`  | `toggle_diagnostic_float()`     | Diagnostic 情報（エラー等）をトグル表示    |
| `<leader>rn` | `vim.lsp.buf.rename()`          | シンボル名をリネーム                       |
| `<leader>ca` | `vim.lsp.buf.code_action()`     | コードアクション（修正候補など）を表示     |
| `[d`         | `vim.diagnostic.goto_prev()`    | 前の診断（エラー・警告）へ移動             |
| `]d`         | `vim.diagnostic.goto_next()`    | 次の診断（エラー・警告）へ移動             |

## NvimTree

| キー        | コマンド            | 説明                                     |
|-------------|---------------------|------------------------------------------|
| `<leader>e` | `:NvimTreeToggle`   | ファイルツリーの開閉をトグル             |
| `<leader>o` | `:NvimTreeFocus`    | ファイルツリーにフォーカス               |
| `<leader>r` | `:NvimTreeRefresh`  | ファイルツリーを再読み込み               |
| `<leader>n` | `:NvimTreeFindFile` | 現在のファイルをツリー内でハイライト表示 |

## VimTableMode

| キー         | コマンド            | 説明                       |
|--------------|---------------------|----------------------------|
| `<leader>ta` | `:TableModeRealign` | 表（テーブル）を再整列する |

## Telescope

### Search / Navigation (Normal Mode)

| キー         | コマンド                          | 説明                                               |
|--------------|-----------------------------------|----------------------------------------------------|
| `<leader>ff` | `:Telescope find_files`           | ファイルを検索（隠しファイル含む）                 |
| `<leader>fg` | `:Telescope live_grep`            | ripgrep による全文検索（リアルタイム）             |
| `<leader>fb` | `:Telescope buffers`              | 開いているバッファを一覧表示                       |
| `<leader>fh` | `:Telescope help_tags`            | Vim/Neovim のヘルプを検索                          |
| `<leader>rf` | `:Telescope oldfiles`             | 最近開いたファイルの履歴を表示                     |
| `<leader>fs` | `:Telescope lsp_document_symbols` | 現在ドキュメント内のシンボル一覧（関数・変数など） |
| `<leader>fr` | `:Telescope lsp_references`       | シンボルの参照箇所を一覧表示                       |
| `<leader>fd` | `:Telescope diagnostics`          | LSP の診断（エラー・警告）を一覧表示               |
| `<leader>gc` | `:Telescope git_commits`          | Git コミット履歴を表示                             |
| `<leader>gs` | `:Telescope git_status`           | Git 変更ファイルを表示                             |

### In Telescope Prompt

#### Insert Mode

| キー       | 動作                                     |
|------------|------------------------------------------|
| `Ctrl + j` | 次の項目を選択                           |
| `Ctrl + k` | 前の項目を選択                           |
| `Ctrl + q` | 選択項目を quickfix リストに送信して開く |
| `Esc`      | Telescope を閉じる                       |

#### Normal Mode

| キー       | 動作                                         |
|------------|----------------------------------------------|
| `q`        | Telescope を閉じる                           |
| `Ctrl + j` | 次の項目を選択                               |
| `Ctrl + k` | 前の項目を選択                               |
| `Ctrl + q` | 選択項目を quickfix リストに送信して開く     |
| `d`        | （buffers ピッカー内）選択したバッファを削除 |

## ToggleTerm

| キー         | コマンド        | 説明                                              |
|--------------|-----------------|---------------------------------------------------|
| `<leader>tb` | `:TermBottom`   | 下パネルでターミナルを開閉（固定 ID=1）           |
| `<leader>tf` | `:TermFloat`    | フロートウィンドウでターミナルを開閉（固定 ID=2） |
| `<leader>tr` | `:TermRight`    | 右パネルでターミナルを開閉（固定 ID=3）           |
| `<leader>tn` | `:TermNew`      | 新しい下パネルターミナルを作成                    |
| `<leader>tN` | `:TermNewRight` | 新しい右パネルターミナルを作成                    |

### In ToggleTerm Terminal Mode

| キー  | 動作               | 説明                                     |
|-------|--------------------|------------------------------------------|
| `Esc` | `<C-\><C-n>`       | ノーマルモードに戻る（直感的操作）       |
| `q`   | `<C-\><C-n>:q<CR>` | ターミナルを即終了してウィンドウを閉じる |

## Treesitter

| キー           | モード                | 説明                                   |
|----------------|-----------------------|----------------------------------------|
| `Ctrl + Space` | ノーマル / ビジュアル | 選択を開始 or ノード（構文単位）を拡大 |
| `Ctrl + s`     | ノーマル / ビジュアル | スコープ（関数・ブロックなど）を拡大   |
| `Backspace`    | ノーマル / ビジュアル | ノード単位で選択を縮小                 |
