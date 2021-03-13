#!/bin/bash

DIR=$(cd .. && pwd)
echo $DIR

# ./03_copy_personal_config.sh
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

# install vim-plug and copy neovim config from parent folder
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p $HOME/.config/nvim/plugged
echo "linking init.vim"
ln -sfv $DIR/configs/nvim_config/init.vim $HOME/.config/nvim/
echo "linking vimrc.d"
ln -sfv $DIR/configs/nvim_config/vimrc.d $HOME/.config/nvim/

# ./04_init_nvim.sh
# ============================================================= 
# install nvim plugins
echo "installing nvim plugins..."
nvim +PlugInstall +qall >> /dev/null
echo "nvim updating remote plugins..."
nvim +UpdateRemotePlugins +qall >> /dev/null
echo "Done"
