# dotfiles

## Install

Before installation, please backup your existing dotfiles first, eg .vimrc, .zshrc, .gitconfig and so on, and install pre-required package or software.

via wget:
```bash
sh -c "$(wget https://raw.githubusercontent.com/cavalleria/dotfiles/main/install.sh -O -)"
```

via curl:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/cavalleria/dotfiles/main/install.sh)"
```

## Requirements

- Install **Zsh**
```bash
sudo apt-get install -y zsh
```

- Install **Git**
```bash
sudo apt-get install -y git
```

- Install **ctags**
```bash
sudo apt-get install ctags
```

- Change default shell
```bash
sudo chsh -s /bin/zsh
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

- Install **ack**
```bash
sudo apt-get install ack-grep
```

## Useful tools

- **bat**: beautify cat command
```bash
sudo apt install bat
```

- **cheat**: create and view interactive cheatsheets on the command-line
```bash
pip install cheat
```
