# dotfiles (Debian/Ubuntu Linux CLI 環境)

Linux (Ubuntu / Debian系)のCLI環境設定。

ここでは以下の用途を想定します。

- SSH 前提運用
- tmux の利用を中心
- NeoVimを利用
- GUIは使わないmulti-user.target構成
- 動くか動かないかわからない怪しい端末環境

---

## Feature

- zsh + autosuggestion (history only)
    - complitionまで突っ込むと環境によっては遅くなるためhistoryのみでの運用
- fzfによる検索
- ezaによる視認性向上
- zoxideでのディレクトリジャンプ
- tmux によるセッション管理
- Neovim (lazy.nvimベース)
- NetworkManger + nmcli での無線LAN運用

---

## Requirements

必要なパッケージ一覧

```bash
sudo apt update

sudo apt install \
    zsh \
    tmux \
    neovim \ #(9以上、推奨10以上)
    git \
    curl \
    fzf \
    zsh-autosuggestions \
    zsh-syntax-highlighting \
    eza \
    zoxide \
    network-manager \
    avahi-deamon \
    starship #後述

```
## Setup

```bash
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

その後zshリロード

## Directory 構成

- homeにはホームディレクトリに貼るリンクのものがは入ります
- xdg_configを利用するものはxdg_configへ
  - shell にはzsh周りの設定
    - .zshrcで`.config/shell`を指すように指定
  - nvim 内部もまた機能に応じてファイルを分けています
    - `.config/`内にリンクを貼る

```text
 ~/dotfiles/
├── 󱂵 home
├──  README.md
└──  xdg_config
   ├──  nvim
   │  ├──  init.lua
   │  ├──  lazy-lock.json
   │  ├──  lua
   │  │  ├──  config
   │  │  │  └──  lazy.lua
   │  │  ├──  core
   │  │  │  ├──  autocmds.lua
   │  │  │  ├──  filetypes.lua
   │  │  │  ├──  keymaps.lua
   │  │  │  └──  options.lua
   │  │  ├──  plugins
   │  │  │  ├──  cmp.lua
   │  │  │  ├──  lsp
   │  │  │  └──  plugins_lazy.lua
   │  │  └──  user
   │  │     └──  ui.lua
   │  └──  old_init.vim
   └──  shell
      ├──  aliases.zsh
      ├──  completion.zsh
      ├──  exports.zsh
      ├──  functions.zsh
      └──  plugins.zsh
```

## 思想

- 設定ファイルはdotfiles配下に保持
- 実行環境はsymlinkを貼るスタイル
- install.shでは配置のみでパッケージは別管理にしようと思ってる

## NOTE

- neovimの設定類は前回作ってたいにしえのdotfileから丸パクリ

