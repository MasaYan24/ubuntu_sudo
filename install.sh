#!/bin/sh

# install applications
sudo apt install -y build-essential g++ gcc libglvnd-dev libfuse2 make pkg-config waypipe  # 開発ツール  
sudo apt install -y cifs-utils direnv file procps unzip  # システム管理・ユーティリティ
sudo apt install -y keychain openssh-server tmux zsh  # シェル・リモート
sudo apt install -y curl git imagemagick neovim ruby wget xclip  # エディタ・画像処理・一般ツール・言語

# install homebrew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install starship
/home/linuxbrew/.linuxbrew/bin/brew install starship

# set user shell
sudo sed -i.bak "s%DSHELL=.*%DSHELL=$(which zsh)%" /etc/adduser.conf
cat << 'EOF' >> /etc/skel/.zshrc
# Path
PATH=~/bin:$PATH

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt hist_ignore_all_dups

# Use modern completion system
autoload -Uz compinit
compinit

alias ls="ls --color"
# alias vi="nvim"
EOF

sudo chsh -s /bin/zsh $(whoami)

sudo apt update -y && sudo apt upgrade -y && echo "system restarting!" && sudo reboot
