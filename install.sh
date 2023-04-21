#!/bin/sh

# install shell and basic utilities
sudo apt install -y zsh build-essential procps file git unzip ruby openssh-server curl cifs-utils
sudo apt install -y gcc make pkg-config libglvnd-dev  # for NVIDIA driver
sudo apt install -y tmux
sudo apt install -y neovim
sudo chsh -s /bin/zsh $(whoami)  # this is optional

sudo apt update -y && upgrade -y && echo "system restarting!" && sudo reboot
