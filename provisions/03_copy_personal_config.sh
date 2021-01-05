#!/bin/bash
DIR=$(cd .. && pwd)/configs
echo $DIR

# copy bash config from parent folder
for FILE in $DIR/bash_config/.bash*; do
	echo "linking " $FILE
	ln -sfv $FILE $HOME/
done
source $HOME/.bashrc

# install vim-plug and copy neovim config from parent folder
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p $HOME/.config/nvim/plugged
ln -sfv $DIR/nvim_config/init.vim $HOME/.config/nvim/
ln -sfv $DIR/nvim_config/vimrc.d $HOME/.config/nvim/

# copy tmux config from parent folder
ln -sfv $DIR/tmux_config/.tmux.conf $HOME/
echo "Done!"
