# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# ------------------------------------
# Environment variables
# ------------------------------------
export VISUAL="vim"
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"
export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33"

# Update Path
export PATH="$PATH:~/bin"

# -----------------------------------
# Bash setup
# -----------------------------------
set editing-mode vi
#set keymap vi-command

# ------------------------------------
# ALIASES
# ------------------------------------
# Aliases for (1) quickly opening .bashrc and (2) have terminal recognize changes to it
alias histg="history | grep"				# Search history
alias myip="curl http://ipecho.net/plain; echo"		# Get your current IP
alias la="ls -lAFG --color=auto"
alias ll="ls -lFG --color=auto"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias rm="rm -i"
alias mv="mv -i"
alias man="man -a"

# Example alias for SSH'ing into a server
#alias myserver="ssh user@111.111.111.111"
alias sshlab="ssh drozdikt@u-pl8.ms.mff.cuni.cz"

# Example alias for quickly getting to a commonly used directory
#alias htdocs='cd /Applications/MAMP/htdocs'


# ------------------------------------
# Define color variables
# ------------------------------------
# Regular Colors
Black='\[\e[0;30m\]'        # Black
Red='\[\e[0;31m\]'          # Red
Green='\[\e[0;32m\]'        # Green
Yellow='\[\e[0;33m\]'       # Yellow
Blue='\[\e[0;34m\]'         # Blue
Purple='\[\e[0;35m\]'       # Purple
Cyan='\[\e[0;36m\]'         # Cyan
White='\[\e[0;37m\]'        # White
Light_Gray='\[\033[0;37m\]'

# Bold
BBlack='\[\e[1;30m\]'       # Black
BRed='\[\e[1;31m\]'         # Red
BGreen='\[\e[1;32m\]'       # Green
BYellow='\[\e[1;33m\]'      # Yellow
BBlue='\[\e[1;34m\]'        # Blue
BPurple='\[\e[1;35m\]'      # Purple
BCyan='\[\e[1;36m\]'        # Cyan
BWhite='\[\e[1;37m\]'       # White
BLight_Gray='\[\033[1;37m\]'

# High Intensity
IBlack='\[\e[0;90m\]'       # Black
IRed='\[\e[0;91m\]'         # Red
IGreen='\[\e[0;92m\]'       # Green
IYellow='\[\e[0;93m\]'      # Yellow
IBlue='\[\e[0;94m\]'        # Blue
IPurple='\[\e[0;95m\]'      # Purple
ICyan='\[\e[0;96m\]'        # Cyan
IWhite='\[\e[0;97m\]'       # White

# Bold High Intensity
BIBlack='\[\e[1;90m\]'      # Black
BIRed='\[\e[1;91m\]'        # Red
BIGreen='\[\e[1;92m\]'      # Green
BIYellow='\[\e[1;93m\]'     # Yellow
BIBlue='\[\e[1;94m\]'       # Blue
BIPurple='\[\e[1;95m\]'     # Purple
BICyan='\[\e[1;96m\]'       # Cyan
BIWhite='\[\e[1;97m\]'      # White

# Reset colors
NONE="\[\e[0m\]"


# ------------------------------------
# Configure prompt
# Includes special handling for git repos
# ------------------------------------

# When in a git repo, this method is used to determine the current branch
function parse_git_branch {
    git branch 2>/dev/null | grep '^*' | sed 's_^..__' | sed 's_\(.*\)_(\1)_'
}

# When in a git repo, this method is used to determine if there are changes
function git_dirty {
    git diff --quiet HEAD &>/dev/null
    [ $? == 1 ] && echo "!"
}

# Variables
ps1_user="$BIRed\u$NONE"
ps1_host="$BIYellow\h$NONE"
ps1_dir="$BIPurple\w$NONE"
ps1_git="$Cyan \$(parse_git_branch)$Red \$(git_dirty)$NONE"

# Option 1 user@host:dir(branch)! $
# export PS1="${ps1_user}@${ps1_host}:${ps1_dir}${ps1_git} \$ "

# Option 2 dir(branch)! $
#export PS1="${ps1_user}${BIPurple}@${ps1_host}${BIPurple}:${ps1_dir}${BIPurple} \$ ${NONE}"

export PS1="\n$BIGreen:\$?  \w$NONE\n$BIRed>$NONE \[$(tput sgr0)\]"


# ------------------------------------
# Load non-generic .bashrc
# To use, create ~/.bashrc-append
# This is where you might put aliases, functions, etc.
# that are specific to your system
# ------------------------------------
if [ -f ~/.bashrc-append ]; then
   source ~/.bashrc-append
   appended=true
fi




# ------------------------------------
# MOTD (Message of the Day)
# What you see when Terminal opens
# ------------------------------------
