#!/usr/bin/env bash

# install neovim, optional dependencies
# install other packages
pacman -S --noconfirm neovim python-neovim xclip
pacman -S --noconfirm docker git tmux parallel tree #gcc-libs

# create github directory
cd
mkdir -p $HOME/git

# pull bash config from my github
cd $HOME/git
git clone https://github.com/jjlinscientist/bash_profile
ln -sf $HOME/git/bash_profile/.bash* $HOME/
source $HOME/.bashrc

# install vim-plug and pull neovim config from my github
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cd $HOME/git
git clone https://github.com/jjlinscientist/config_nvim
ln -sf $HOME/git/config_nvim/init.vim $HOME/.config/nvim/init.vim
ln -sf $HOME/git/config_nvim/vimrc.d $HOME/.config/nvim/vimrc.d

# pull tmux config from my github
cd $HOME/git
git clone https://github.com/jjlinscientist/tmux_config
ln -sf $HOME/git/tmux_config/.tmux.conf $HOME/
