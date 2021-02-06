### env path

# homebrew
set -x PATH /opt/homebrew/bin $PATH

# golang arm64 (自前build)
set -x PATH $HOME/.packages/go-darwin-arm64-bootstrap/bin $PATH
set -x GOPATH $HOME/.go
set -x PATH $GOPATH/bin $PATH
# python3.9
set -x PATH /opt/homebrew/opt/python@3.9/libexec/bin $PATH

# gradle
set -x PATH /opt/gradle/bin $PATH
# flutter
set -x PATH $HOME/ghq/github.com/flutter/flutter/bin $PATH
