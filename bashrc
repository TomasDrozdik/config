# ------------------------------------
# STARTUP
# ------------------------------------
# If not running interactively, don't do anything
[ -z "$PS1" ] && return
# Start in tmux
if [[ -z "$TMUX" ]]; then
	tmux
fi

# -----------------------------------
# Bash setup
# -----------------------------------
set editing-mode vi
#set keymap vi-command

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
ps1_user="$Red\u$NONE"
ps1_host="$Cyan\h$NONE"
ps1_dir="$Yellow\w$NONE"
ps1_git="$Cyan \$(parse_git_branch)$IRed \$(git_dirty)$NONE"
ps1_exitval="$Cyan\$?$NONE"
ps1_lb="$Green[$NONE"
ps1_rb="$Green]$NONE"
ps1_at="$Green@$NONE"
ps1_colon="$Green:$NONE"
ps1_gt="$Red>$NONE"


# Option 1 user@host:dir(branch)! $
export PS1="{ps1_exitval} ${ps1_user}@${ps1_host}:${ps1_dir}${ps1_git} \$ "

# Option 2 dir(branch)! $
#export PS1="${ps1_user}${BIPurple}@${ps1_host}${BIPurple}:${ps1_dir}${BIPurple} \$ ${NONE}"

# Option 3 retval [user@host: dir] branch >
# export PS1="\n${ps1_exitval} ${ps1_lb}${ps1_user}${ps1_at}${ps1_host}${ps1_colon} ${ps1_dir}${ps1_rb}${ps1_git} ${ps1_gt} "


# ------------------------------------
# Load non-generic .bashrc
# To use, create ~/.bashrc-append
# This is where you might put aliases, functions, etc.
# that are specific to your system
# ------------------------------------
if [ -f ~/.bashrc-append ]; then
   source ~/.bashrc-append
fi

if [ -f ~/.profile ]; then
   source ~/.profile
fi
