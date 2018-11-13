
all: backup load reset

lab: lab1 reset

.PHONY: lab1
lab1: backup load
	cp bashrc-append-lab ~/.bashrc-append

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
