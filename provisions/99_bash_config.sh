#!/bin/bash

DIR=$(cd .. && pwd)
echo $DIR

# copy_personal_config.sh
# ============================================================= 

# copy bash config from parent folder
for FILE in $DIR/configs/bash_config/.bash*; do
	echo "linking " $FILE
	ln -sfv $FILE $HOME/
done
source $HOME/.bashrc

# copy tmux config from parent folder
echo "linking .tmux.conf"
ln -sfv $DIR/configs/tmux_config/.tmux.conf $HOME/
