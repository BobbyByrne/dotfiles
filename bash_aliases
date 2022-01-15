alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias python='python3'
alias pip='pip3'
alias vi='nvim'
alias vim='nvim'

type exa >/dev/null 2>&1 && alias l='exa'
type exa >/dev/null 2>&1 && alias ls='exa'
type exa >/dev/null 2>&1 && alias ll='exa --header --long'
type exa >/dev/null 2>&1 && alias lll='exa --header --long --all'

