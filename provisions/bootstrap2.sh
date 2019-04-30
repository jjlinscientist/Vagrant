#!/usr/bin/env bash

set -e
set -x

# install neovim, optional dependencies
# install other packages
pacman -S --noconfirm neovim python-neovim xclip
pacman -S --noconfirm docker git tmux parallel tree #gcc-libs

# create github directory
cd
mkdir -p /home/jjlin/git

# pull bash config from my github
cd /home/jjlin/git
rm -rf bash_profile
git clone https://github.com/jjlinscientist/bash_profile
ln -sf /home/jjlin/git/bash_profile/.bash* /home/jjlin/
source /home/jjlin/.bashrc

# install vim-plug and pull neovim config from my github
curl -fLo /home/jjlin/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cd /home/jjlin/git
rm -rf config_nvim
git clone https://github.com/jjlinscientist/config_nvim
mkdir -p /home/jjlin/.config/nvim/plugged
ln -sf /home/jjlin/git/config_nvim/init.vim /home/jjlin/.config/nvim/
ln -sf /home/jjlin/git/config_nvim/vimrc.d /home/jjlin/.config/nvim/

# pull tmux config from my github
cd /home/jjlin/git
rm -rf tmux_config
git clone https://github.com/jjlinscientist/tmux_config
ln -sf /home/jjlin/git/tmux_config/.tmux.conf /home/jjlin/

# run nvim with :PlugInstall
nvim +PlugInstall +qall > /dev/null
nvim +UpdateRemotePlugins +qall > /dev/null

# change ownership of /home/jjlin recursively
# cd /home/jjlin
# chown -hR jjlin:jjlin .
