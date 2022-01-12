# dotfiles

## Install

via wget:
```bash
sh -c "$(wget https://raw.githubusercontent.com/cavalleria/dotfiles/main/install.sh -O -)"
```

via curl:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/cavalleria/dotfiles/main/install.sh)"
```

## Before install

- Install **Zsh**
```bash
sudo apt-get install -y zsh
```

- Install **Git**
```bash
sudo apt-get install -y git
```

- Change default shell
```bash
sudo chsh -s /bin/zsh
```

- Backup dotfiles, eg .vimrc, .zshrc, .gitconfig and so on.