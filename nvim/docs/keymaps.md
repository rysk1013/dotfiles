# Neovim Keymaps

このファイルは、このNeovim設定で明示的に定義しているキーマップをまとめたものです。

- `<leader>`: `Space`
- `<localleader>`: `\`
- モード: `N` = Normal、`I` = Insert、`V` = Visual、`O` = Operator-pending、`C` = Command-line
- プラグイン固有のキーマップは、対象プラグインまたは対象バッファでのみ有効になる場合があります。

## グローバル

定義元: [`lua/config/keymaps.lua`](lua/config/keymaps.lua)

### 基本操作

| モード | キー | 動作 |
|---|---|---|
| I | `jj` | Normalモードへ戻る |
| N | `<Esc>` | 検索ハイライトを消す |
| N | `<leader>w` | ファイルを保存する |
| N | `<leader>q` | Neovimを終了する |
| I | `<C-CR>` | Insertモードを抜けて下に新しい行を追加する |

### ウィンドウ

| モード | キー | 動作 |
|---|---|---|
| N | `<C-h>` | 左のウィンドウへ移動する |
| N | `<C-j>` | 下のウィンドウへ移動する |
| N | `<C-k>` | 上のウィンドウへ移動する |
| N | `<C-l>` | 右のウィンドウへ移動する |
| N | `<leader>sr` | ウィンドウを垂直分割する |
| N | `<leader>sd` | ウィンドウを水平分割する |
| N | `<leader>sx` | 現在のウィンドウを閉じる |

### バッファ

| モード | キー | 動作 |
|---|---|---|
| N | `<leader>bd` | 現在のバッファを削除する |
| N | `<leader>bA` | すべてのバッファを削除する |
| N | `<Tab>` | 次のバッファへ移動する |
| N | `<S-Tab>` | 前のバッファへ移動する |

### 編集・クリップボード

| モード | キー | 動作 |
|---|---|---|
| V | `J` | 選択行を下へ移動する |
| V | `K` | 選択行を上へ移動する |
| N | `x` | レジスタを変更せずに1文字削除する |
| N / V | `<leader>y` | システムクリップボードへヤンクする |
| N | `<leader>Y` | 行全体をシステムクリップボードへヤンクする |
| N / V | `<leader>d` | レジスタを変更せずに削除する |
| N | `<leader>/` | 現在行のコメントを切り替える |
| V | `<leader>/` | 選択範囲のコメントを切り替える |
| N | `<leader>cc` | 現在のファイルの絶対パスをコピーする |
| N | `<leader>tw` | 行の折り返しを切り替える |

## プラグイン

### Bufferline

定義元: [`lua/plugins/bufferline.lua`](lua/plugins/bufferline.lua)

| モード | キー | 動作 |
|---|---|---|
| N | `<leader>bp` | バッファを選択する |
| N | `<leader>bh` | バッファを左へ移動する |
| N | `<leader>bl` | バッファを右へ移動する |
| N | `<leader>1` ～ `<leader>9` | 指定番号のバッファへ移動する |

### Oil

定義元: [`lua/plugins/oil.lua`](lua/plugins/oil.lua)

| モード | キー | 動作 |
|---|---|---|
| N | `<leader>e` | Oilを開く |
| N | `gy` | 選択中のエントリをヤンクする（Oil内） |

### Aerial

定義元: [`lua/plugins/aerial.lua`](lua/plugins/aerial.lua)

| モード | キー | 動作 |
|---|---|---|
| N | `<leader>a` | Aerialを切り替える |

### Sidebar

定義元: [`lua/plugins/sideber.lua`](lua/plugins/sideber.lua)

| モード | キー | 動作 |
|---|---|---|
| N | `<leader>S` | Sidebarを切り替える |

#### Sidebar内の既定キー

`sideber.lua`ではSidebarの既定キーバインドを有効にしています。

| モード | キー | 動作 |
|---|---|---|
| N | `q` | Sidebarを閉じる |
| N | `j` / `<Down>` | 下へ移動する |
| N | `k` / `<Up>` | 上へ移動する |
| N | `e` | GitまたはDiagnostics欄で対象ファイルを開く |
| N | `s` | Git欄でファイルをステージする |
| N | `u` | Git欄でファイルをアンステージする |
| N | `t` | Diagnostics欄のグループを展開・折り畳みする |

### Treesj

定義元: [`lua/plugins/treesj.lua`](lua/plugins/treesj.lua)

| モード | キー | 動作 |
|---|---|---|
| N | `<leader>tt` | Treesitterノードを結合・分割する |

### DBee

定義元: [`lua/plugins/dbee.lua`](lua/plugins/dbee.lua)

| モード | キー | 動作 |
|---|---|---|
| N | `<leader>tdb` | DBeeを切り替える |

### Markdown Preview

定義元: [`lua/plugins/markdown-preview.lua`](lua/plugins/markdown-preview.lua)

| モード | キー | 動作 |
|---|---|---|
| N | `<leader>mp` | Markdownプレビューを切り替える |

### Noice

定義元: [`lua/plugins/noice.lua`](lua/plugins/noice.lua)

| モード | キー | 動作 |
|---|---|---|
| N | `<leader>nd` | Noice通知を閉じる |

### Telescope

定義元: [`lua/plugins/telescope.lua`](lua/plugins/telescope.lua)

| モード | キー | 動作 |
|---|---|---|
| N | `<leader>ff` | ファイルを検索する |
| N | `<leader>fg` | テキストを全文検索する |
| N | `<leader>fb` | バッファを検索する |
| N | `<leader>fh` | Helpタグを検索する |

### Snacks

定義元: [`lua/plugins/snacks.lua`](lua/plugins/snacks.lua)

| モード | キー | 動作 |
|---|---|---|
| N | `gd` | 定義へ移動する |
| N | `gD` | 宣言へ移動する |
| N | `gr` | 参照一覧を表示する |
| N | `gI` | 実装へ移動する |
| N | `gy` | 型定義へ移動する |
| N | `gai` | Incoming callsを表示する |
| N | `gao` | Outgoing callsを表示する |
| N | `<leader>ss` | ファイル内のLSPシンボルを表示する |
| N | `<leader>sS` | ワークスペースのLSPシンボルを表示する |

`gy`は通常のバッファではLSP型定義、Oilバッファではエントリのヤンクとして動作します。

### Flash

定義元: [`lua/plugins/flash.lua`](lua/plugins/flash.lua)

| モード | キー | 動作 |
|---|---|---|
| N / V / O | `s` | Flash jumpを実行する |
| N / V / O | `S` | Treesitter Flashを実行する |
| O | `r` | Remote Flashを実行する |
| V / O | `R` | Treesitter検索を実行する |
| C | `<C-s>` | Flash検索を切り替える |

### Gitsigns

Gitsignsのキーマップは、Gitsignsがアタッチされたバッファ内でのみ有効です。

定義元: [`lua/plugins/gitsigns.lua`](lua/plugins/gitsigns.lua)

| モード | キー | 動作 |
|---|---|---|
| N | `]c` | 次のhunkへ移動する |
| N | `[c` | 前のhunkへ移動する |
| N / V | `<leader>hs` | hunkをステージする |
| N / V | `<leader>hr` | hunkをリセットする |
| N | `<leader>hS` | バッファ全体をステージする |
| N | `<leader>hR` | バッファ全体をリセットする |
| N | `<leader>hp` | hunkをプレビューする |
| N | `<leader>hi` | hunkをインライン表示する |
| N | `<leader>hb` | 現在行のblameを表示する |
| N | `<leader>hd` | indexとの差分を表示する |
| N | `<leader>hD` | 直前のコミットとの差分を表示する |
| N | `<leader>hQ` | リポジトリのhunkをQuickfixへ追加する |
| N | `<leader>hq` | 現在のバッファのhunkをQuickfixへ追加する |
| N | `<leader>tb` | 現在行のblame表示を切り替える |
| N | `<leader>tW` | word diffを切り替える |
| V / O | `ih` | hunkを選択する |

### Git Blame

定義元: [`lua/plugins/git-blame.lua`](lua/plugins/git-blame.lua)

| モード | キー | 動作 |
|---|---|---|
| N | `<leader>gb` | Git blame表示を切り替える |

### Diffview

定義元: [`lua/plugins/diffview.lua`](lua/plugins/diffview.lua)

| モード | キー | 動作 |
|---|---|---|
| N | `<leader>gd` | Diffviewを開く |
| N | `<leader>gh` | 現在のファイルの履歴を表示する |
| N | `<leader>gH` | プロジェクト全体の履歴を表示する |
| N | `<leader>gc` | Diffviewを閉じる |

#### Diffview内

| 対象 | モード | キー | 動作 |
|---|---|---|---|
| Diff表示 | N | `q` | Diffviewを閉じる |
| Diff表示 | N | `<Tab>` | 次のファイルへ移動する |
| Diff表示 | N | `<S-Tab>` | 前のファイルへ移動する |
| File panel | N | `q` | Diffviewを閉じる |
| File panel | N | `<CR>` | エントリを開く |
| File history panel | N | `q` | Diffviewを閉じる |

### nvim-dap

定義元: [`lua/plugins/dap.lua`](lua/plugins/dap.lua)

| モード | キー | 動作 |
|---|---|---|
| N | `<leader>db` | ブレークポイントを切り替える |
| N | `<leader>dc` | デバッグを開始・続行する |
| N | `<leader>di` | Step Into |
| N | `<leader>do` | Step Over |
| N | `<leader>dO` | Step Out |
| N | `<leader>dr` | REPLを開く |
| N | `<leader>dl` | 前回のデバッグを再実行する |
| N | `<leader>dq` | デバッグを終了する |
| N | `<leader>du` | DAP UIを切り替える |

### Laravel

定義元: [`lua/plugins/laravel.lua`](lua/plugins/laravel.lua)

| モード | キー | 動作 |
|---|---|---|
| N | `<leader>ll` | Laravel Pickerを開く |
| N | `<leader>la` | Artisan Pickerを開く |
| N | `<leader>lr` | Routes Pickerを開く |
| N | `<leader>lm` | Make Pickerを開く |
| N | `<leader>lc` | Custom Commands Pickerを開く |
| N | `<leader>lo` | Resources Pickerを開く |
| N | `<leader>lh` | Laravelドキュメントを開く |
| N | `<leader>lt` | Laravel Code Actionsを開く |
| N | `<leader>lu` | Artisan Hubを開く |
| N | `<leader>lp` | Command Centerを開く |
| N | `<C-g>` | View Finderを開く |
| N | `gf` | Laravelリソースへ移動する。対象外では通常の`gf`として動作する |

### Blink

[`lua/plugins/blink.lua`](lua/plugins/blink.lua)で`keymap.preset = "default"`を選択しています。

| モード | キー | 動作 |
|---|---|---|
| I | `<C-Space>` | 補完・ドキュメント表示を切り替える |
| I | `<C-e>` | 補完をキャンセルする |
| I | `<C-y>` | 選択中の候補を確定する |
| I | `<Up>` / `<C-p>` | 前の候補へ移動する |
| I | `<Down>` / `<C-n>` | 次の候補へ移動する |
| I | `<C-b>` | ドキュメントを上へスクロールする |
| I | `<C-f>` | ドキュメントを下へスクロールする |
| I | `<Tab>` | 次のスニペット位置へ移動する |
| I | `<S-Tab>` | 前のスニペット位置へ移動する |
| I | `<C-k>` | シグネチャ表示を切り替える |

## 無効化されているプラグイン

以下は設定ファイルに定義されていますが、プラグインが`enabled = false`のため現在は有効ではありません。

### Fyler

定義元: [`lua/plugins/fyler.lua`](lua/plugins/fyler.lua)

| モード | キー | 動作 |
|---|---|---|
| N | `<leader>e` | Fylerを開く |

### nvim-cmp

定義元: [`lua/plugins/cmp.lua`](lua/plugins/cmp.lua)

| モード | キー | 動作 |
|---|---|---|
| I | `<C-b>` | ドキュメントを上へスクロールする |
| I | `<C-f>` | ドキュメントを下へスクロールする |
| I | `<C-Space>` | 補完を開く |
| I | `<C-e>` | 補完を閉じる |
| I | `<CR>` | 候補を確定する |

## 補足

- `<leader>tw`は行の折り返し、`<leader>tW`はGitsignsのword diffに分離されています。
- OilやDiffviewなどがプラグイン内部で提供する既定キーマップのうち、この設定で上書き・追加していないものは一覧の対象外です。
- プラグインの更新により、BlinkやSidebarの既定キーマップが変化する可能性があります。
