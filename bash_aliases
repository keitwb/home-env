
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
if command -v xclip >/dev/null 2>&1; then
    alias pbcopy='xclip -in -selection clipboard'
    alias pbpaste='xclip -out -selection clipboard'
fi

# opens the arg with the associated app
alias ']'='xdg-open'

alias pu="pushd"
alias po="popd"

alias c="clear"
alias v="less"
alias j="jobs"

alias gitst="git status"
alias tmux="tmux -2"
alias vpn-on="sudo netcfg up server-vpn"
alias vpn-off="sudo netcfg down server-vpn"
_dbash() {
  docker exec -it $1 bash
}
alias dbash=_dbash
alias dbashrun="docker run --rm -it --entrypoint /bin/bash"
alias tmuxn="tmux new-sess -s"
alias vim="nvim"

alias act="source virtualenv/bin/activate"
