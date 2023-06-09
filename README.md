# Ubuntu Super User Settings

## Installation
Execute following.
```sh
install_dir=$(mktemp -d); echo install_dir: $install_dir
git clone https://github.com/MasaYan24/ubuntu_sudo.git $install_dir/ubuntu_sudo
sh $install_dir/ubuntu_sudo/install.sh
```

Or execute following steps in the Manual Installation section.

### Note

#### proxy
If your computer is under a proxy, execute following before the installation.
```sh
# modify following and execute.
http_proxy="http://your/proxy/IP:PortNumber"
https_proxy="http://your/proxy/IP:PortNumber"
```

```sh
# apt configuration
sudo echo "Acquire::http::proxy \"$http_proxy\";" >> /etc/apt/apt.conf
sudo echo "Acquire::https::proxy \"$http_proxy\";" >> /etc/apt/apt.conf

# wget configuration
sudo echo "http_proxy = $http_proxy/" >> /etc/wgetrc
sudo echo "https_proxy = $https_proxy/" >> /etc/wgetrc
```

cf) [Ubuntu の Proxy 設定備忘録](https://qiita.com/daichi-ishida/items/b77c151067427806ede5)

#### nvidia-driver
Execute following for install nvidia's GPU driver.
```sh
sudo apt install ubuntu-drivers-common
sudo ubuntu-drivers devices
# check the recommended one and install
sudo apt install <recommended driver>
```
check if `nvidia-smi` works.

## Summary

This installation includes following subjects under assuming z-shell.

- install utilities
   - zsh build-essential procps file git unzip openssh-server curl cifs-utils
   - gcc make pkg-config libglvnd-dev
   - tmux
   - make g++ direnv ruby libfuse2
   - imagemagick
   - tiv (terminal image viewer)
   - neovim (latest)
   - homebrew
   - starship (user prompto)
- user setting
   - define default shell as zsh
- update all application

Then restart the computer.

## Manual Installation

### install shell and basic utilities
```sh
sudo apt install -y zsh build-essential procps file git unzip openssh-server curl cifs-utils
sudo apt install -y gcc make pkg-config libglvnd-dev  # for NVIDIA driver
sudo apt install -y tmux
```

### install developping tools
```sh
sudo apt install -y make g++ direnv ruby libfuse2
sudo apt install -y imagemagick
git clone https://github.com/stefanhaustein/TerminalImageViewer.git /tmp/TIV \
    && cd /tmp/TIV/src/main/cpp \
    && make \
    && sudo make install
sudo wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -O /usr/bin/nvim
sudo chmod a+x /usr/bin/nvim
```

### install homebrew
```sh
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### install starship
```sh
/home/linuxbrew/.linuxbrew/bin/brew install starship
```

### set user shell
```sh
sudo sed -i.bak "s%DSHELL=.*%DSHELL=$(which zsh)%" /etc/adduser.conf
sudo chsh -s /bin/zsh $(whoami)
```

### update and restart
```sh
sudo apt update -y && sudo apt upgrade -y && echo "system restarting!" && sudo reboot
```
