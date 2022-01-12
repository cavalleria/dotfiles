#!/bin/sh
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
        git clone git@github.com:cavalleria/dotfiles.git ~/.my_config
        git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.my_config/oh-my-zsh
        git clone https://github.com/zsh-users/zsh-autosuggestions ~/.my_config/oh-my-zsh/custom/plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.my_config/oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    fi
    echo "-- git clone OK"
}


# folders
link_directory_list()
{
    link_directory ~/.my_config/vim ~/.vim_runtime

    link_directory ~/.my_config/oh-my-zsh ~/.oh-my-zsh

    echo "-- link directories OK"
}

# files
link_file_list()
{
    link_file  ~/.my_config/home/.gitconfig ~/.gitconfig
    link_file  ~/.my_config/home/.vimrc ~/.vimrc
    link_file  ~/.my_config/home/.zshrc ~/.zshrc
    link_file  ~/.my_config/home/.pathrc ~/.pathrc
    echo "-- link files OK"
}
# pathrc
remind_pathrc()
{
    echo "Please create ~/.pathrc and put PATH related stuffs inside :-)"
}

hello()
{
    echo "------------------------------------------"
    echo ""
    echo "      Welcome to use Cavall's Config"
    echo ""
    echo "------------------------------------------"
}

main()
{
    hello
    git_clone
    link_directory_list
    link_file_list
    remind_pathrc
}

main "$@"
