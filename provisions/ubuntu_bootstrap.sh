#!/usr/bin/env bash
# perpare environment for neovim install
sudo apt-get -y install software-properties-common
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt-get -y update
sudo apt-get -y upgrade

# install neovim, optional dependencies
sudo apt-get -y install python-dev python-pip python3-dev python3-pip
sudo apt-get -y install xclip tmux parallel tree wget
mkdir -p $HOME/exec/appimage
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -O $HOME/exec/appimage/nvim.appimage
.$HOME/exec/appimage/nvim.appimage --appimage-extract
ln -s $HOME/exec/nvim/squashfs-root/usr/bin/nvim $HOME/exec/nvim

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

nvim +PlugInstall +qall > /dev/null
nvim +UpdateRemotePlugins +qall > /dev/null

# change ownership of $HOME recursively
# cd $HOME
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
