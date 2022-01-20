#!/bin/bash

set -e

update_repo()
{
    pushd ~/.my_config && git pull && popd
    pushd ~/.my_config/oh-my-zsh && git pull && popd
    pushd ~/.my_config/home/.config/cheat && git pull && git submodule update && popd
    echo "-- update OK"
}

hello()
{
    echo "------------------------------------------"
    echo ""
    echo "      Welcome to use Cavalleria's Config"
    echo ""
    echo "------------------------------------------"
}

main()
{
    hello
    update_repo
}

main "$@"
