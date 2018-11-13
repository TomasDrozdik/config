
all: backup load reset

.PHONY: load
load:
	cp bashrc ~/.bashrc
	cp vimrc ~/.vimrc
	cp tmux.conf ~/.tmux.conf

.PHONY: backup
backup:
	-mkdir backup
	-cp ~/.bashrc backup
	-cp ~/.vimrc backup
	-cp ~/.tmux.conf backup

.PHONY: reset
reset:
	bash
	tmux kill-server 
