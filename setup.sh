#!/bin/zsh

common_conf=$HOME/.common-config

setups=( zsh nvm tmux tmuxinator vim )

if [ ! -x "/bin/tmux" ]; then
    each "/bin/tmux not found" && exit 1
fi

for setup in ${setups[@]}; do
    . $common_conf/$setup/setup.sh
done

cp -r "$common_conf/bin" $HOME/.bin
