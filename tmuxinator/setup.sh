#!/bin/zsh

tmuxinator_dir=$HOME/.tmuxinator
tmuxinator_conf=$HOME/.tmuxinator.zsh
zsh_conf=$HOME/.zshrc

echo "setup tmuxinator"

printf "\n\
# ruby \n\
export PATH=\"\$(ruby -e 'print Gem.user_dir')/bin:\$PATH\"\n" >> "$zsh_conf"

. "$zsh_conf"

if [ ! -x "tmuxinator"  ]; then
    gem install tmuxinator
fi

tmuxinator doctor

if [ -f "$tmuxinator_conf" ]; then
    rm "$tmuxinator_conf"
fi

if [ -d "$tmuxinator_dir" ]; then
    rm -rf "$tmuxinator_dir"
fi

mkdir "$tmuxinator_dir"

cp "$common_conf/tmuxinator/.tmuxinator.zsh" "$tmuxinator_conf" 
cp "$common_conf/tmuxinator/template.yml" "$tmuxinator_dir/template.yml"

printf "\n\
# tmuxinator \n\
. \$HOME/.tmuxinator.zsh \n" >> "$zsh_conf"

. "$zsh_conf"

