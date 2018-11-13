
all: backup 
	cp bashrc ~/.bashrc
	cp vimrc ~/.vimrc
	cp tmux.conf ~/.tmux.conf

.PHONY: backup
backup:
	rm -Rf backup
	mkdir backup
	cp ~/.bashrc backup
	cp ~/.vimrc backup
	cp ~/.tmux.conf backup
