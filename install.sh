#!/bin/bash

# 初期設定
AUTO_YES=false
ZSHRC_URL="https://raw.githubusercontent.com/MasaYan24/skel_zshrc/main/.zshrc"

# 引数に -y があれば AUTO_YES を true にする
if [[ "$1" == "-y" ]]; then
    AUTO_YES=true
fi

# 確認用関数
confirm_and_run() {
    local message=$1
    local command=$2

    if [ "$AUTO_YES" == true ]; then
        eval "$command"
    else
        echo -n "$message (y/N): "
        read -r answer
        if [[ "$answer" =~ ^[Yy]$ ]]; then
            eval "$command"
        else
            echo "Skipped: $command"
        fi
    fi
}

# --- 実行セクション ---

# install applications
sudo apt install -y build-essential g++ gcc libglvnd-dev libfuse2 make pkg-config waypipe  # 開発ツール
sudo apt install -y cifs-utils direnv file procps unzip  # システム管理・ユーティリティ
sudo apt install -y keychain openssh-server tmux zsh  # シェル・リモート
sudo apt install -y curl git imagemagick neovim ruby wget xclip  # エディタ・画像処理・一般ツール・言語

# install homebrew
confirm_and_run "Install Homebrew?" \
    "NONINTERACTIVE=1 /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""

# install starship
confirm_and_run "Install Starship via Homebrew?" \
    "/home/linuxbrew/.linuxbrew/bin/brew install starship"

# set user shell
confirm_and_run "Configure zsh as default shell and set /etc/skel/.zshrc?" \
    "sudo curl -fsSL $ZSHRC_URL -o /etc/skel/.zshrc && \
    cp /etc/skel/.zshrc ~/.zshrc && \
    sudo chsh -s \$(which zsh) \$(whoami)"

sudo apt update -y && sudo apt upgrade -y
echo "Require System Reboot: sudo reboot"
