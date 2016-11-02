#!/bin/zsh

vim_dir=$HOME/.vim
vim_conf=$HOME/.vimrc

echo "setup vim"

if [ ! -d "$vim_dir" ]; then
    mkdir "$vim_dir"
fi

if [ -e "$vim_conf" ]; then
    rm "$vim_conf"
fi

cp "$common_conf/vim/.vimrc" "$vim_conf"

if [ ! -d "$vim_dir/autoload/plug.vim" ]; then
    cd "$vim_dir"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "setup vim plugins"
# vim +PlugInstall >> /dev/null 2>&1
vim +PlugInstall +qall

cd "$vim_dir/plugged/tern_for_vim" 
nvm use stable && npm i
