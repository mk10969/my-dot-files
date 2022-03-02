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
```
$ eval "$(/opt/homebrew/bin/brew shellenv)"
```

[option]
```
$ echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
```
or
```
$ echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.bash_profile
```


### homebrew packages
```
$ brew tap Homebrew/bundle
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
just link
```
```
exec $SHELL -l
```

### fish plugin manager ([fisher](https://github.com/jorgebucaran/fisher))
```
$ curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```

install fish-ghq ([fish-ghq](https://github.com/decors/fish-ghq))
```
$ fisher install decors/fish-ghq
```
