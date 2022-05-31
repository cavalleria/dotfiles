#!/bin/bash
#adapted from https://github.com/zchrissirhcz/dotfiles/blob/master/install.sh

set -e

# functions
link_directory()
{
    SRC_DIR=$1
    DST_DIR=$2
    if [ ! -d $DST_DIR ]; then
        ln -s $SRC_DIR $DST_DIR
    else
        echo $DST_DIR "already exist, skip linking"
    fi
}
link_file()
{
    SRC_FILE=$1
    DST_FILE=$2
    if [ ! -f $DST_FILE ]; then
        ln -s $SRC_FILE $DST_FILE
    else
        echo $DST_FILE "already exist, skip linking"
    fi
}

# download
git_clone()
{
    if [ ! -d ~/.my_config ]; then
        git clone https://github.com/cavalleria/dotfiles.git ~/.my_config
    fi
    if [ ! -d ~/.my_config/oh-my-zsh ]; then
        git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.my_config/oh-my-zsh
    fi
    if [ ! -d ~/.my_config/oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions ~/.my_config/oh-my-zsh/custom/plugins/zsh-autosuggestions
    fi
    if [ ! -d ~/.my_config/oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.my_config/oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    fi
    if [ ! -d ~/soft/cheat ]; then
        sysnm="$(tr [A-Z] [a-z] <<< "$(uname)")"
        mkdir -p ~/soft/cheat
        wget -P ~/soft/cheat https://github.com/cheat/cheat/releases/download/4.2.3/cheat-${sysnm}-amd64.gz
        gzip -d ~/soft/cheat/cheat-${sysnm}-amd64.gz
        mv ~/soft/cheat/cheat-${sysnm}-amd64 ~/soft/cheat/cheat
        chmod +x ~/soft/cheat/cheat
    fi
    if [ ! -d ~/.my_config/home/.config/cheat ]; then
        git clone git@github.com:cavalleria/my_cheatsheets.git ~/.my_config/home/.config/cheat
        pushd ~/.my_config/home/.config/cheat
        git submodule update --init
        popd
    fi
    echo "-- git clone OK"
}


# folders
link_directory_list()
{
    # link_directory ~/.my_config/vim ~/.vim_runtime

    link_directory ~/.my_config/oh-my-zsh ~/.oh-my-zsh

    if [ ! -d ~/.config ]; then
        mkdir -p ~/.config
    fi
    link_directory ~/.my_config/home/.config/cheat ~/.config/cheat
    echo "-- link directories OK"
}

# files
link_file_list()
{
    link_file  ~/.my_config/home/.gitconfig ~/.gitconfig
    link_file  ~/.my_config/home/.gitmessage ~/.gitmessage
    link_file  ~/.my_config/home/.vimrc ~/.vimrc
    link_file  ~/.my_config/home/.zshrc ~/.zshrc
    link_file  ~/.my_config/home/.pathrc ~/.pathrc
    link_file  ~/.my_config/home/.condarc ~/.condarc
    echo "-- link files OK"
}

install()
{
    # install vim plugins
    if [[ "$(uname)" == "Linux" ]]; then
        sed -i 's/colorscheme\ gruvbox8/colorscheme\ default/g' ~/.my_config/vim/vimrcs/my_plugins_config.vim
    elif [[ "$(uname)"=="Darwin" ]]; then
        sed -i '' 's/colorscheme\ gruvbox8/colorscheme\ default/g' ~/.my_config/vim/vimrcs/my_plugins_config.vim
    fi
    vim +PlugInstall
    if [[ "$(uname)" == "Linux" ]]; then
        sed -i 's/colorscheme\ default/colorscheme\ gruvbox8/g' ~/.my_config/vim/vimrcs/my_plugins_config.vim
    elif [[ "$(uname)"=="Darwin" ]]; then
        sed -i '' 's/colorscheme\ default/colorscheme\ gruvbox8/g' ~/.my_config/vim/vimrcs/my_plugins_config.vim
    fi
    echo "-- install OK"
}

hello()
{
    echo "------------------------------------------"
    echo ""
    echo "   Welcome to use Cavalleria's Config     "
    echo ""
    echo "------------------------------------------"
}

main()
{
    hello
    git_clone
    link_directory_list
    link_file_list
    install
}

main "$@"
