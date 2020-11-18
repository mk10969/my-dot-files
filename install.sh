#!/bin/sh

##### Parameters #####
pwd=$(pwd)

##### Functions #####


##### Runs #####
# xcode install
echo "=========================================="
echo "Setup install xcode..."
echo "=========================================="
if ! type xcode-select > /dev/null; then
    xcode-select --install
fi

# install brew packages
echo "=========================================="
echo "Setup Homebrew and brew packages..."
echo "=========================================="
if ! type brew > /dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [ -e $pwd/Brewfile ]; then
    brew tap Homebrew/bundle
    brew bundle
fi

# git config
echo "=========================================="
echo "Setup gitconfig create symlink..."
echo "=========================================="
ln -sf $pwd/gitconfig $HOME/.gitconfig
ln -sf $pwd/gitignore_global $HOME/.gitignore_global

# install
echo "=========================================="
echo "Setup install terminal and languages..."
echo "=========================================="
## alacritty
ghq get https://github.com/alacritty/alacritty.git
## rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
## anyenv
git clone https://github.com/anyenv/anyenv ~/.anyenv

if [ ! -d $HOME/.anyenv/plugins ]; then
    mkdir -p ~/.anyenv/plugins
fi

## anyenv plugins
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
