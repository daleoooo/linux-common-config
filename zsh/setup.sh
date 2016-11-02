#!/bin/zsh

zsh_conf=$HOME/.zshrc
zsh_dir=$HOME/.oh-my-zsh
zsh_name=zsh

echo "setup zsh"

if [ ! -d "$zsh_dir" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [ -f "$zsh_conf" ]; then
    rm "$zsh_conf"
fi

cp "$common_conf/zsh/.zshrc" "$zsh_conf" 
. "$zsh_conf"
