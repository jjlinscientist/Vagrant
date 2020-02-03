#!/bin/bash

# install neovim, optional dependencies
mkdir -p $HOME/appimages/nvim/
mkdir -p $HOME/exec/
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -O $HOME/appimages/nvim.appimage
chmod a+x $HOME/appimages/nvim.appimage
$HOME/appimages/nvim.appimage --appimage-extract
mv squashfs-root $HOME/appimages/nvim/
ln -sf $HOME/appimages/nvim/squashfs-root/usr/bin/nvim $HOME/exec/
pip3 install neovim

# create github directory
cd
mkdir -p $HOME/git

# pull bash config from my github
cd $HOME/git
rm -rf bash_profile
git clone https://github.com/jjlinscientist/bash_profile
ln -sf $HOME/git/bash_profile/.bash* $HOME/
source $HOME/.bashrc

# install vim-plug and pull neovim config from my github
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cd $HOME/git
rm -rf config_nvim
git clone https://github.com/jjlinscientist/config_nvim
mkdir -p $HOME/.config/nvim/plugged
ln -sf $HOME/git/config_nvim/init.vim $HOME/.config/nvim/
ln -sf $HOME/git/config_nvim/vimrc.d $HOME/.config/nvim/

# pull tmux config from my github
cd $HOME/git
rm -rf tmux_config
git clone https://github.com/jjlinscientist/tmux_config
ln -sf $HOME/git/tmux_config/.tmux.conf $HOME/

# run nvim with :PlugInstall

# $HOME/appimages/nvim/squashfs-root/usr/bin/nvim +PlugInstall +qall >> /tmp/nvim_install.log
# $HOME/appimages/nvim/squashfs-root/usr/bin/nvim +UpdateRemotePlugins +qall >> /tmp/nvim_install.log
