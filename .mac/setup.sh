# homebrewのインストール
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'export PATH="$PATH:/opt/homebrew/bin"' >> ~/.zsh.d/path.zsh
source ~/.zshrc

# キーボードの反応速度の修正(PC再起動後に有効化される)
defaults write -g InitialKeyRepeat -int 11
defaults write -g KeyRepeat -int 1

# アプリインストール
# 入力
brew install --cask google-japanese-ime
# タッチパッドカスタマイズ
brew install --cask bettertouchtool
# キーボードカスタマイズ
brew install --cask karabiner-elements
# アプリアンインストール
brew install --cask appcleaner
# ランチャー
brew install --cask raycast
# ブラウザ
brew install --cask google-chrome
brew install --cask brave-browser
# エディタ
brew install --cask visual-studio-code
brew install --cask visual-studio-code@insiders
# メモ
brew install --cask notion
# ビデオミーティング
brew install --cask zoom
# vpn
brew install --cask protonvpn
# パスワードマネージャ
brew install --cask bitwarden

# Apple StoreのアプリをCLIで管理
brew install mas
# Xcode
mas install 497799835
# LINE
mas install 539883307
# Spark
mas install 1176895641
# Activity Bar
mas install 6447080018
