#!/usr/bin/env bash

set -e
set -x

# install neovim, optional dependencies
# install other packages
pacman -S --noconfirm neovim python-neovim xclip
pacman -S --noconfirm docker git tmux parallel tree #gcc-libs

# create github directory
cd
mkdir -p /home/vagrant/git

# pull bash config from my github
cd /home/vagrant/git
rm -rf bash_profile
git clone https://github.com/jjlinscientist/bash_profile
ln -sf /home/vagrant/git/bash_profile/.bash* /home/vagrant/
source /home/vagrant/.bashrc

# install vim-plug and pull neovim config from my github
curl -fLo /home/vagrant/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cd /home/vagrant/git
rm -rf config_nvim
git clone https://github.com/jjlinscientist/config_nvim
mkdir -p /home/vagrant/.config/nvim/plugged
ln -sf /home/vagrant/git/config_nvim/init.vim /home/vagrant/.config/nvim/
ln -sf /home/vagrant/git/config_nvim/vimrc.d /home/vagrant/.config/nvim/

# pull tmux config from my github
cd /home/vagrant/git
rm -rf tmux_config
git clone https://github.com/jjlinscientist/tmux_config
ln -sf /home/vagrant/git/tmux_config/.tmux.conf /home/vagrant/

# change ownership of /home/vagrant recursively
cd /home/vagrant
chown -hR vagrant:vagrant .
