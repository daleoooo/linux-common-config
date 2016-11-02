#!/bin/zsh

dale_conf=$HOME/.dale-config
setups=( zsh nvm tmux tmuxinator vim )

if [ ! -x "/bin/tmux" ]; then
    each "/bin/tmux not found" && exit 1
fi

for setup in ${setups[@]}; do
    . $dale_conf/$setup/setup.sh
done

cp -r "$dale_conf/bin" $HOME/.bin
