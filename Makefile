
all: backup
	mv .bashrc ~
	mv .vimrc ~
	mv .tmux.conf ~

backup:
	mv ~/.bashrc backup
	mv ~/.vimrc backup
	mv ~/.tmux.conf backup
