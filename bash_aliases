
alias ls='ls --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias webshare="python -m SimpleHTTPServer"

# Borrow some Mac commands (must install xsel package first)
if command -v xsel >/dev/null 2>&1; then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi

# opens the arg with the associated app
alias ']'='xdg-open'

alias pu="pushd"
alias po="popd"

alias c="clear"
alias v="less"
alias j="jobs"

alias gitst="git status"
