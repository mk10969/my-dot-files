#!/bin/sh

##### Parameters #####
pwd=$(pwd)

##### Functions #####


##### Runs #####
# xcode install
echo "=================================================="
echo "Setup install xcode..."
echo "=================================================="
if ! type xcode-select > /dev/null; then
    xcode-select --install
fi


# install brew packages
echo "=================================================="
echo "Setup Homebrew and brew packages..."
echo "=================================================="
if ! type brew > /dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [ -e $pwd/Brewfile ]; then
    brew tap Homebrew/bundle
    brew bundle
fi


# create symlink
echo "=================================================="
echo "Setup create symlink..."
echo "=================================================="
ln -sf $pwd/gitconfig $HOME/.gitconfig
ln -sf $pwd/gitignore_global $HOME/.gitignore_global
if [ ! -d $HOME/.hammerspoon ]; then
    mkdir -p $HOME/.hammerspoon
fi
ln -sf $pwd/hammerspoon_init.lua $HOME/.hammerspoon/init.lua
ln -sf $pwd/tmux.conf $HOME/.tmux.conf


# install other packages
echo "=================================================="
echo "Setup install terminal and languages..."
echo "=================================================="
ghq get https://github.com/alacritty/alacritty.git
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
git clone https://github.com/anyenv/anyenv ~/.anyenv

if [ ! -d $HOME/.anyenv/plugins ]; then
    mkdir -p $HOME/.anyenv/plugins
fi
git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update
git clone https://github.com/znz/anyenv-git.git ~/.anyenv/plugins/anyenv-git

## init
anyenv install --init

## install **envs
anyenv install nodenv
anyenv install jenv
anyenv install goenv
anyenv install jlenv

## rust packages
cargo install xsv
cargo install clipivot
