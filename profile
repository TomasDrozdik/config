# Generic Exports
export PATH=${PATH}:~/bin
export PATH=$PATH:~/go/bin
export JAVA_HOME=/usr/lib/jvm/default/
export BROWSER=google-chrome-stable
export VISUAL="vim"
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"
export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33"

# Generic Aliases
alias open="xdg-open"
alias histg="history | grep"				# Search history
alias myip="curl http://ipecho.net/plain; echo"		# Get your current IP
alias la="ls -lAFG --color=auto"
alias ll="ls -lFG --color=auto"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias rm="rm -i"
alias mv="mv -i"
alias man="man -a"

# Pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Cmake
alias cmake-debug="cmake -B debug -DCMAKE_BUILD_TYPE=Debug"
alias cmake-release="cmake -B release -DCMAKE_BUILD_TYPE=Release"
alias cmake-build-debug="make -C ./debug"
alias cmake-build-release="make -C ./release"

# Docker
alias docker-prune="docker container prune -f"

docker-clean() {
	docker kill $(docker ps -q)
}

# lfcd - https://github.com/gokcehan/lf/blob/master/etc/lfcd.sh
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

