#!/usr/bin/env bash
# perpare environment for neovim install
apt-get -y install software-properties-common
add-apt-repository -y ppa:neovim-ppa/stable
apt-get -y update
apt-get -y upgrade

# install neovim, optional dependencies
apt-get -y install python-dev python-pip python3-dev python3-pip
apt-get -y install neovim xclip tmux parallel tree 

# create github directory
cd
mkdir -p /root/git

# pull bash config from my github
cd /root/git
rm -rf bash_profile
git clone https://github.com/jjlinscientist/bash_profile
ln -sf /root/git/bash_profile/.bash* /root/
source /root/.bashrc

# install vim-plug and pull neovim config from my github
curl -fLo /root/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cd /root/git
rm -rf config_nvim
git clone https://github.com/jjlinscientist/config_nvim
mkdir -p /root/.config/nvim/plugged
ln -sf /root/git/config_nvim/init.vim /root/.config/nvim/
ln -sf /root/git/config_nvim/vimrc.d /root/.config/nvim/

# pull tmux config from my github
cd /root/git
rm -rf tmux_config
git clone https://github.com/jjlinscientist/tmux_config
ln -sf /root/git/tmux_config/.tmux.conf /root/

# run nvim with :PlugInstall
nvim +PlugInstall +qall > /dev/null
nvim +UpdateRemotePlugins +qall > /dev/null

# change ownership of /root recursively
# cd /root
# chown -hR ubuntu:ubuntu .

# install other packages
sudo apt install -y \
  # r-base \
  # r-base-dev \
  # libssl-dev \
  # libcurl4-openssl-dev \
  # libxml2-dev \
  docker.io \
  awscli
