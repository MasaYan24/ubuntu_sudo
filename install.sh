#!/bin/sh

# install shell and basic utilities
sudo apt install -y zsh build-essential procps file git unzip openssh-server curl cifs-utils
sudo apt install -y gcc make pkg-config libglvnd-dev  # for NVIDIA driver
sudo apt install -y tmux

# install developping tools
sudo apt install -y make g++ ruby
sudo apt install -y neovim
sudo apt install -y imagemagick
git clone https://github.com/stefanhaustein/TerminalImageViewer.git /tmp/TIV \
    && cd /tmp/TIV/src/main/cpp \
    && make \
    && sudo make install

# install homebrew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# set user shell
sudo sed -i.bak "s%DSHELL=.*%DSHELL=$(which zsh)%" /etc/adduser.conf
sudo chsh -s /bin/zsh $(whoami)

sudo apt update -y && sudo apt upgrade -y && echo "system restarting!" && sudo reboot
