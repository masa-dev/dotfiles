alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias II="/mnt/c/windows/explorer.exe ."
alias dp="docker ps"
alias dpname="docker ps -a | awk '{print \$NF}' | grep -v 'NAMES'"
alias dsall="docker stop \$(docker ps -a | awk '{print \$NF}' grep -v 'NAME')"
alias dcd="docker compose down"
alias dcu="docker compose up -d"
alias dcr="docker compose restart"
alias dsp="docker system prune -af"
alias ddp="docker compose down && docker system prune -af"
alias ddpu="docker compose down && docker system prune -af && docker compose up -d"
alias gs="git status"
alias gd="git diff"
alias gg="git log --graph --date-order -C -M --pretty=format:\"<%h> %ad [%an] %C(cyan)%d%Creset %s\" --all --date=short"

# bash history config
HISTCONTROL=ignoreboth
HISTSIZE=100000
HISTFILESIZE=100000
PROMPT_COMMAND='history -a'
# append to the history file, don't overwrite it
shopt -s histappend

# search history
peco-select-history() {
    local _cmd=$(HISTTIMEFORMAT= history | tac | sed -e 's/^\s*[0-9]\+\s\+//' | peco --query "$READLINE_LINE")
    READLINE_LINE="$_cmd"
    READLINE_POINT=${#_cmd}
}

bind -x '"\C-r": peco-select-history'

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
GIT_PS1_SHOWCOLORHINTS=true

source /usr/share/bash-completion/git-prompt.sh
source /usr/share/bash-completion/git-completion.bash

if [ "$color_prompt" = yes ]; then
    export PS1="\[\e[1;32m\]${debian_chroot:+($debian_chroot)}\u@\h\[\e[m\]:\[\e[1;33m\]\w\[\e[m\]\[\e[1;34m\]$(__git_ps1)\[\e[m\]\$ "

    # git
    # 必要ない項目はコメントアウトしてください
    # あるいは  HOGE=  のように右辺を空にしてください
    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWUNTRACKEDFILES=true
    GIT_PS1_SHOWSTASHSTATE=true
    GIT_PS1_SHOWUPSTREAM=auto

    HOST='\u@\h'
    PS1="\[\033]0;$HOST\007\]"     # set window title
    PS1="$PS1"'\n'                 # new line
    PS1="$PS1"'\[\033[32m\]'       # change color
    PS1="$PS1"'\u@UBUNTU '             # user@host<space>
    PS1="$PS1"'\[\033[33m\]'       # change color
    PS1="$PS1"'\w'                 # current working directory
    if test -z "$WINELOADERNOEXEC"
    then
        PS1="$PS1"'\[\033[36m\]'
        PS1="$PS1"'$(__git_ps1)'   # bash function
    fi
    PS1="$PS1"'\[\033[0m\]'        # change color
    PS1="$PS1"'\n'                 # new line
    PS1="$PS1"'$ '                 # prompt: always $
else
    PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$ "
fi

unset color_prompt force_color_prompt