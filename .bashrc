# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

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

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

#=========== custom ==========
export TERM="xterm-256color"

# my custom command
alias msb='source ~/.bashrc'
alias mvv='vi ~/.vimrc'
alias mvb='vi ~/.bashrc'

alias mf="find . -name"
alias mg='grep -Er' #-E : use Extended regular expression

export SVN_EDITOR=vim
export CSCOPE_EDITOR=vim
alias cs='cscope -d'
alias csd='cscope -d -f ~/cscope_files/cscope.out.$PRODUCT'
alias cs_file='cscope_create_file'
alias cs_top='cscope_create_file_top'
alias cs_bt='cscope_create_file_bt'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#========= repo&git ===========
alias gitk='gitk --all'
alias rupdate='repo forall -c git remote update'
alias rstash='repo forall -c git stash'
alias rpop='repo forall -c git stash pop'
alias rsync='rstash;repo sync;rpop;'

#========== BUILD ==========
export TOOLCHAINS=/opt/marvell-bg4ct-toolchain/gcc-linaro-5.3-2016.02-x86_64_aarch64-linux-gnu/bin:/opt/marvell-bg4ct-toolchain/gcc-linaro-5.3-2016.02-x86_64_aarch64-elf/bin:/opt/toolchains/armv5-marvell-eabi-softfp/bin:/opt/toolchains/armv5-marvell-linux-gnueabi-softfp/bin
#marshmallow
#export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
#export PATH=$JAVA_HOME/bin:$TOOLCHAINS:$PATH:~/script
export PATH=$TOOLCHAINS:~/script:$PATH

#oreo
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$JAVA_HOME/bin:$TOOLCHAINS:$PATH

#ccache
export USE_CCACHE=1
export CCACHE_DIR=/home/ryan.oh/.ccache
