
### env path


### alias
alias ll='exa -al'
alias mode='~/.scripts/terminal_mode.sh'


### theme
starship init fish | source


### function
function attach_tmux_session_if_needed
    set ID (tmux list-sessions)
    if test -z "$ID"
        tmux new-session
        return
    end

    set new_session "Create New Session"
    set ID (echo $ID\n$new_session | peco --on-cancel=error | cut -d: -f1)
    if test "$ID" = "$new_session"
        tmux new-session
    else if test -n "$ID"
        tmux attach-session -t "$ID"
    end
end

if test -z $TMUX
    attach_tmux_session_if_needed
end


eval (anyenv init - | source)
eval (direnv hook fish | source)

