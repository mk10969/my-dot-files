!# /bin/sh

# Parameters
pwd=$(pwd)

# Functions


# Runs
### xcode install
echo "Setup install xcode..."
if ! type xcode-select > /dev/null; then
    xcode-select --install
fi

### brew
echo "Setup Homebrew and brew packages..."

if ! type brew > /dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [ -e $pwd/Brewfile ]; then
    brew tap Homebrew/bundle
    brew bundle
fi


### git
echo "Setup gitconfig create symlink..."

ln -sf $pwd/gitconfig $HOME/.gitconfig
ln -sf $pwd/gitignore_global $HOME/.gitignore_global

### install
echo "Setup install others..."
##### rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
##### alacritty
ghq get https://github.com/alacritty/alacritty.git



~/.anyenv/bin/anyenv init
set -Ux fish_user_paths $HOME/.cargo/bin $fish_user_paths
set -Ux fish_user_paths $HOME/.anyenv/bin $fish_user_paths