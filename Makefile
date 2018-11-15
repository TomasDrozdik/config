
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
	cp bash_profile ~/.bash_profile

.PHONY: backup
backup:
	-mkdir backup
	-cp ~/.bashrc backup
	-cp ~/.vimrc backup
	-cp ~/.tmux.conf backup
	-cp ~/.bash_profile

.PHONY: reset
reset:
	-tmux kill-server 
	source ~/.bashrc
