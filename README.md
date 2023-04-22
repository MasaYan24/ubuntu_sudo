# Ubuntu settings

Execute following.
```sh
install_dir=$(mktemp -d); echo install_dir: $install_dir
git clone https://github.com/MasaYan24/ubuntu_sudo.git $install_dir/ubuntu_sudo
sh $install_dir/ubuntu_sudo/install.sh
```

Or execute following steps one by one.

## Install shell and basic utilities
```sh
sudo apt install -y zsh unzip ruby openssh-server curl cifs-utils
sudo apt install -y gcc make pkg-config libglvnd-dev  # for NVIDIA driver
sudo apt install -y tmux
sudo apt install -y neovim
sudo chsh -s /bin/zsh $(whoami)  # this is optional

sudo apt update -y & sudo apt upgrade -y && echo "system restarting!" && sudo reboot
```
