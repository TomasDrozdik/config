# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/drozt/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

### STARTUP
# Start in tmux
if [[ -z "$TMUX" ]]; then
	tmux
fi

### VISAUL
# Prompt
autoload -Uz promptinit
promptinit
autoload -U colors && colors
ps_user="%{$fg[red]%}%n%{$reset_color%}"
ps_host="%{$fg[cyan]%}%m%{$reset_color%}"
ps_dir="%{$fg[yellow]%}%~%{$reset_color%}"
ps_exitval="%{$fg[cyan]%}%?%{$reset_color%}"
ps_lb="%{$fg[white]%}[%{$reset_color%}"
ps_rb="%{$fg[white]%}]%{$reset_color%}"
ps_at="%{$fg[white]%}@%{$reset_color%}"
ps_colon="%{$fg[white]%}:%{$reset_color%}"
ps_gt="%{$fg[red]%}>%{$reset_color%}"

export PS1="
${ps_exitval} ${ps_lb}${ps_user}${ps_at}${ps_host}${ps_colon}${ps_dir}${ps_rb}${ps_git}
${ps_gt} "


#export PS1="
#%?[%n@%m:%~]
#%# "

#PS1="%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "


### ALIASES
alias histg="history | grep"	# Search history
alias myip="curl http://ipecho.net/plain; echo"		# Get your current IP
alias la="ls -lAFGH --color=auto"
alias ll="ls -lFGH --color=auto"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias rm="rm -i"
alias mv="mv -i"
alias man="man -a"

### BINDS
# Bind incremental search backward
bindkey '^R' history-incremental-search-backward
