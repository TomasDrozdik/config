
all: backup load

lab: lab1 reset-bash

.PHONY: lab1
lab1: backup load
	cp bashrc-append-lab ~/.bashrc-append

.PHONY: load
load:
	cp -i bashrc ~/.bashrc
	cp -i vimrc ~/.vimrc
	cp -i tmux.conf ~/.tmux.conf
	cp -i profile ~/.profile
	cp -i bash_profile ~/.bash_profile

.PHONY: backup
backup:
	-mkdir backup
	-mv ~/.bashrc backup
	-mv ~/.vimrc backup
	-mv ~/.tmux.conf backup
	-mv ~/.bash_profile backup
	-mv ~/.profile backup

.PHONY: reset-zsh
reset-zsh:
	-tmux kill-server 
	source ~/.zshrc

.PHONY: reset-bash
reset-bash:
	-tmux kill-server 
	source ~/.bashrc
