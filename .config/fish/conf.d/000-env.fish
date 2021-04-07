### env path

# homebrew
set -x PATH /opt/homebrew/bin $PATH

# golang
set -x GOPATH $HOME/.go
set -x PATH $GOPATH/bin $PATH

# python3.9
set -x PATH /opt/homebrew/opt/python@3.9/libexec/bin $PATH

# gradle
set -x PATH /opt/gradle/bin $PATH
