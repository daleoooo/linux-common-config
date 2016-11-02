#!/bin/zsh

dale_conf=$HOME/.dale-config
tmux_conf=$HOME/.tmux.conf

echo "setup tmux"

if [ -f "$tmux_conf" ]; then
    rm "$tmux_conf"
fi

cp "$dale_conf/tmux/.tmux.conf" "$tmux_conf" 
