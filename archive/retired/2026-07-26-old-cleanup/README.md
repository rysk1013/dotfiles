# 2026-07-26 old cleanup

各ディレクトリに分散していた `old/` の設定と、旧Neovim・Sheldon・Starship設定を集約したスナップショットです。

## 収録元

| アーカイブ先 | 元のパス |
| --- | --- |
| `auto-hot-key/script.ahk` | `auto-hot-key/old/script.ahk` |
| `vscode-insiders/settings/settings.json` | `vscode-insiders/settings/old/settings.json` |
| `vscode/settings/settings.json` | `vscode/settings/old/settings.json` |
| `vscode/extensions/windows/base.ps1` | `vscode/extensions/whindows/old/base.ps1` |
| `vscode/extensions/mac/base.sh` | `vscode/extensions/mac/old/base.sh` |
| `zsh/.zshrc` | `zsh/old/.zshrc` |
| `nvim_v1/` | `nvim_v1/` |
| `sheldon/plugins-v1.toml` | `sheldon/plugins-v1.toml` |
| `starship/custom-v1.toml` | `starship/custom-v1.toml` |
| `starship/custom-v2.toml` | `starship/custom-v2.toml` |
| `starship/custom-v3.toml` | `starship/custom-v3.toml` |
| `starship/stellar.toml` | `starship/stellar.toml` |
| `starship/tokyo-night-left.toml` | `starship/tokyo-night-left.toml` |
| `starship/tokyonight.toml` | `starship/tokyonight.toml` |

## 復元方法

アーカイブ内のファイルは直接編集せず、現行ディレクトリへコピーして差分を確認します。

例:

```bash
cp archive/retired/2026-07-26-old-cleanup/zsh/.zshrc zsh/.zshrc.restored
diff -u zsh/.zshrc zsh/.zshrc.restored
```
