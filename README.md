# dotfiles

## Install

Before installation, please backup your existing dotfiles first, eg .vimrc, .zshrc, .gitconfig and so on, and install pre-required package or software.

via wget:
```bash
bash -c "$(wget https://raw.githubusercontent.com/cavalleria/dotfiles/main/install.sh -O -)"
```

via curl:
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/cavalleria/dotfiles/main/install.sh)"
```

## Requirements

- Install **Zsh**
```bash
sudo apt-get install -y zsh
```

- Change default shell
```bash
sudo chsh -s /bin/zsh
or
sudo usermod -s /usr/bin/zsh $(whoami)
```

- Install **Git**
```bash
sudo apt-get install -y git
```

- Install **Vim 8.2**
```bash
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update
sudo apt-get install vim
```

- Install **gcc/g++ 8**
```bash
sudo apt-get install gcc-8
sudo apt-get install g++-8
cd /usr/bin
sudo ln -sf gcc-8 gcc
sudo ln -sf g++-8 g++
```

- Install the newest **CMake** in Ubuntu 18.04
```bash
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | sudo apt-key add -
sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
sudo apt-get update
sudo apt-get install cmake
```

- Install **ripgrep**
```bash
sudo apt-get install ripgrep
```

- Install **node**
```bash
sudo apt update
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt policy nodejs
sudo apt install node[==v21.6.2-1nodesource1]

```

- vim-nox
如果是Debian 11系统, 安装vim-nox, sudo apt-get install vim-nox

## Useful tools

- **cheat**: create and view interactive cheatsheets on the command-line

To install it, download the executable from the [releases][Releases] page and place it on your `PATH`.


[Releases]: https://github.com/cheat/cheat/releases
