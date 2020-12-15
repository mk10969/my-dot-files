#!/bin/sh

##### Parameters #####
pwd=$(pwd)

##### Functions #####


##### Runs #####
# create symlink
echo "=================================================="
echo "Setup create symlink..."
echo "=================================================="
ln -sf $pwd/gitconfig $HOME/.gitconfig
ln -sf $pwd/gitignore_global $HOME/.gitignore_global
#ln -sf $pwd/tmux.conf $HOME/.tmux.conf

# if [ ! -d $HOME/.hammerspoon ]; then
#     mkdir -p $HOME/.hammerspoon
# fi
# ln -sf $pwd/hammerspoon_init.lua $HOME/.hammerspoon/init.lua

if [ ! -d $HOME/.config/alacritty ]; then
    mkdir -p $HOME/.config/alacritty
fi
ln -sf $pwd/.config/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml

if [ -e $HOME/.config/fish/config.fish ] ; then
    rm -fr $HOME/.config/fish/config.fish
fi
ln -sf $pwd/.config/fish/config.fish $HOME/.config/fish/config.fish

# ln -sfn $pwd/.scripts $HOME/.scripts

ln -sf $pwd/.config/iterm2/com.googlecode.iterm2.plist $HOME/.config/iterm2/com.googlecode.iterm2.plist

