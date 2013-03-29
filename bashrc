# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

DIRCOLORS=$HOME/.dircolors
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r $DIRCOLORS && eval "$(dircolors -b $DIRCOLORS)" || eval "$(dircolors -b)"
fi


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -e ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Custom Environmental Variables
export CLASSPATH=$(find /opt/javalib/ -name '*.jar' -printf '%p:' | sed 's/:$//')
#export JAVA_HOME=/usr/lib/jvm/java-6-sun
PATH=$PATH:$HOME/code/android/android-sdk-linux/tools:$HOME/code/android/android-sdk-linux/platform-tools
# PATH=$PATH:$HOME/code/gae/google_appengine
#PATH=$PATH:/var/lib/gems/1.8/bin
#PATH=$PATH:/usr/local/lib/mongodb-linux-i686-2.0.1/bin

set -o vi
export EDITOR="vim"

Memoria="~/code/projects/memoria"
shopt -s cdable_vars

#TERM=screen-256color

# RVM setup
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.

# VirtualEnvWrapper setup
vew_script=/usr/bin/virtualenvwrapper.sh
if [[ -x $vew_script ]]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/code/projects

    . $vew_script
fi

export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

# PythonBrew setup
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

# Perlbrew setup
if [ -f ~/.perlbrew/etc/bashrc ]; then
    export PERLBREW_ROOT=~/.perlbrew
    export PERLBREW_HOME=~/.perlbrew
    source ~/.perlbrew/etc/bashrc
fi

HISTIGNORE="[   ]*:&:bg:fg:cd"

# Groovy setup
GROOVY_HOME=/share/code/java/groovy/groovy-2.0.0/
PATH=$PATH:$GROOVY_HOME/bin

# Functions borrowed from bash examples
psgrep()
{
	ps aux | grep $1 | grep -v grep
}

pskill()
{
	local pid

	pid=$(ps -ax | grep $1 | grep -v grep | awk '{ print $1 }')
	echo -n "killing $1 (process $pid)..."
	kill -9 $pid
	echo "slaughtered."
}

path_append ()  { path_remove $1; export PATH="$PATH:$1"; }
path_prepend () { path_remove $1; export PATH="$1:$PATH"; }
path_remove ()  { export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`; }

# Source the local bashrc (.bashrc-local)
# This file should contain any local configuration that will not be shared
# between accounts (this bashrc is stored in a git repo).  This file, naturally
# should not be put in source control.  Put it last in .bashrc so that any
# settings in it will override settings here.
if [ -f ~/.bashrc-local ]; then
    . ~/.bashrc-local
fi

