# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


## SHELL VARIABLES ##
export PATH=/usr/local/bin:/archive/scripts/:$PATH
export DISPLAY=':0'
export EDITOR=vim
#export CCACHE_DIR="$HOME/.cache/ccache"
export CCACHE_DIR="~/.cache/ccache"
export SUDO_ASKPASS="/usr/bin/ssh-askpass-fullscreen"
export SSH_ENV="$HOME/.ssh/environment"
export TERM="xterm-256color"
export HISTCONTROL=ignoredups:erasedup
export DXVK_CONFIG_FILE="$HOME/.config/dxvk.conf"



# Ccache
export PATH="/usr/lib/ccache/bin${PATH:+:}$PATH"
export CCACHE_DIR="/var/cache/ccache"


## ALIASES ##
# Some private aliases that are no use to other people
if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

# Fix "Unable to set up transient service directory: XDG_RUNTIME_DIR "/run/user/1000" is owned by uid 1000, not our uid 0"
alias su='/bin/su -'

# Readable time in dmesg
alias dmesg='dmesg -T'

# Colorize the grep command output for ease of use
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Generate sha1 digest
alias sha1='openssl sha1'

# Create parent directories on demand
alias mkdir='mkdir -pv'

# Colorize diff output
alias diff='colordiff'

# Control output of ping
# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'

# Add safety nets
# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

# Preventing changing permissions on / 
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Resume wget by default
alias wget='wget -c'

## set some other defaults ##
alias df='df -H'
alias du='du -ch'


## OTHER SETTINGS ##
# Sudo bash completion
complete -cf sudo

# Auto cd to directory by simply writing its name
shopt -s autocd

# Infinite bash history.
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "


## AUTO EXECUTION #
# Start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
    echo succeeded
    chmod 600 ${SSH_ENV}
    . ${SSH_ENV} > /dev/null
    /usr/bin/ssh-add
}
if [ -f "${SSH_ENV}" ]; then
     . ${SSH_ENV} > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# Start keychain
keychain ~/.ssh/id_rsa
. ~/.keychain/$HOSTNAME-sh

# Start pfetch
/usr/bin/pfetch

# Start fancy prompt
. ~/.fancy-git/prompt.sh light

export PATH="/usr/lib/ccache/bin${PATH:+:}${PATH}"
export CCACHE_DIR="/tmp/ccache"
