# my-dot-files

## Installation

### xcode (mac only)
```
$ xcode-select --install
```

### homebrew
```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

- case mac
```
$ eval "$(/opt/homebrew/bin/brew shellenv)"
$ echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
```

- case wsl2
```
$ eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
$ echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.profile
```


### homebrew packages
```
$ brew bundle
```


### change fish shell
```
$ which fish | sudo tee -a /etc/shells

Password:
/opt/homebrew/bin/fish
```
```
$ chsh -s /opt/homebrew/bin/fish
```

### create link
```
$ just link
```
```
$ exec $SHELL -l
```

### fish plugin manager ([fisher](https://github.com/jorgebucaran/fisher))
```
$ curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```

### install fish-ghq ([fish-ghq](https://github.com/decors/fish-ghq))
```
$ fisher install decors/fish-ghq
```

### anyenv init
```
$ anyenv install --init
```

### anyenv plugins install
```
$ just anyenv-plugins
```

### anyenv packages install
```
$ just anyenv-pkg
```