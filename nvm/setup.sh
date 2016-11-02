#!/bin/zsh

dale_conf=$HOME/.dale-config
nvm_dir=$HOME/.nvm
nvm_conf=$HOME/.nvmrc
zsh_conf=$HOME/.zshrc

echo "setup nvm"

if [ ! -d "$nvm_dir"  ]; then
    git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && \
    git checkout `git describe --abbrev=0 --tags`
fi

export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node

[ -s $nvm_dir/nvm.sh ] && . $nvm_dir/nvm.sh
nvm install stable

if [ -f "$nvm_conf" ]; then
    rm "$nvm_conf"
fi

cp "$dale_conf/nvm/.nvmrc" "$nvm_conf" 

printf "\n\
# nvm \n\
export NVM_DIR=\"\$HOME/.nvm\" \n\
[ -s \"\$NVM_DIR/nvm.sh\" ] && . \"\$NVM_DIR/nvm.sh\" # This loads nvm\n" >> "$zsh_conf"

. "$zsh_conf"
