#####################
##### setup #########
#####################

set shell := ["bash", "-c"]
set positional-arguments



#####################
##### variables #####
#####################

pwd             := env_var("PWD")
home            := env_var("HOME")


#####################
##### commands ######
#####################
# test variables
test:
    @echo {{ pwd }}
    @echo {{ home }}
    @echo {{ env_var("HOME") }}


##### MacOS only #####
# xcode install
xcode:
    if [ "Darwin" == `uname` ]; then \
        echo 'install xcode.'; \
        xcode-select --install; \
    fi


##### brew package management #####
# brew version
brew-version:
    brew --version

# brew packages install
brew-pkg: brew-version
    brew bundle


##### rust ######
# rust install
rust-install:
    curl https://sh.rustup.rs -sSf | sh -s

# rust version
rust-version:
    cargo --version

# rust components install
rustup-component: rust-version
    rustup component add rustfmt
    rustup component add clippy
    rustup component add rls
    rustup component add rust-src
    rustup component add rust-analysis

# cargo packages install
cargo-pkg: rust-version
    cargo install cargo-edit
    cargo install xsv
    cargo install tv-cli
    cargo install clipivot
    cargo install cross
    cargo install du-dust
    cargo install wasm-pack
    cargo install wasmtime-cli
    cargo install wasm-bindgen-cli
    cargo install witx-codegen
    cargo install zellij

# cargo update all
cargo-update:
    rustup update
    @echo "======= check version! ======= "
    cargo --version
    rustc --version
    rustdoc --version


##### anyenv package management #####
# anyenv version
anyenv-version:
    anyenv --version

# anyenv packages
anyenv-pkg: anyenv-version
    anyenv install nodenv
    anyenv install jenv
    anyenv install goenv
    anyenv install pyenv
    anyenv install rbenv
    anyenv install jlenv

# anyenv plugin install
anyenv-plugin: anyenv-version
    if [ ! -d {{ home }}/.anyenv/plugins ] ; then \
        echo 'create directory.'; \
        mkdir -p ~/.anyenv/plugins; \
    fi
    git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update

# anyenv update all
anyenv-update:
    anyenv update


##### symbolic link #####
# https://github.com/casey/just#if-statements
# create all link
link: git-link fish-link iterm2-link

# git link
git-link:
    ln -sf {{ pwd }}/gitconfig {{ home }}/.gitconfig
    ln -sf {{ pwd }}/gitignore_global {{ home }}/.gitignore_global

# fish link
fish-link:
    if [ -e {{ home }}/.config/fish/config.fish ] ; then \
        echo 'remove default file.'; \
        rm -fr {{ home }}/.config/fish/config.fish; \
    fi
    ln -sf {{ pwd }}/.config/fish/config.fish {{ home }}/.config/fish/config.fish
    ln -sf {{ pwd }}/.config/fish/conf.d/000-env.fish {{ home }}/.config/fish/conf.d/000-env.fish
    ln -sf {{ pwd }}/.config/fish/conf.d/030-aliace.fish {{ home }}/.config/fish/conf.d/030-aliace.fish

# iterm2-link
iterm2-link:
    if [ ! -d {{ home }}/.config/iterm2 ]; then \
        echo 'create directory.'; \
        mkdir -p {{ home }}/.config/iterm2; \
    fi
    ln -sf {{ pwd }}/.config/iterm2/com.googlecode.iterm2.plist {{ home }}/.config/iterm2/com.googlecode.iterm2.plist