#!/bin/sh

set -e

git_clone()
{
    if [ ! -d ~/.my_config ]; then
        git clone git@github.com:cavalleria/dotfiles.git ~/.my_config
    fi
    echo "-- git clone OK"
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

# files
link_file_list()
{
    link_file  ~/.my_config/home/.gitconfig ~/.gitconfig
    link_file  ~/.my_config/home/.zshrc ~/.zshrc
    echo "-- link files OK"
}

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

# folders
link_directory_list()
{
    link_directory ~/.my_config/vim ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh

    link_directory ~/.my_config/zsh ~/.oh-my-zsh

    echo "-- link directories OK"
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
