
### env path

# homebrew
set -x PATH /opt/homebrew/bin $PATH
# arm64 golang
set -x PATH $HOME/sdk/gotip/bin/darwin_arm64 $PATH
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin $PATH


### alias
alias ls='exa'
alias ll='exa -aal --git'
alias lt='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
alias lta='exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
# alias mode='~/.scripts/terminal_mode.sh'


# ### theme
# starship init fish | source


# ### function
# function attach_tmux_session_if_needed
#     set ID (tmux list-sessions)
#     if test -z "$ID"
#         tmux new-session
#         return
#     end

#     set new_session "Create New Session"
#     set ID (echo $ID\n$new_session | peco --on-cancel=error | cut -d: -f1)
#     if test "$ID" = "$new_session"
#         tmux new-session
#     else if test -n "$ID"
#         tmux attach-session -t "$ID"
#     end
# end

# if test -z $TMUX
#     attach_tmux_session_if_needed
# end

### initialize
# eval (anyenv init - | source)
eval (direnv hook fish | source)
