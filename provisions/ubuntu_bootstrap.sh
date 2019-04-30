#!/usr/bin/env bash
# perpare environment for neovim install
sudo apt-get -y install software-properties-common
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt-get -y update
sudo apt-get -y upgrade

# install neovim, optional dependencies
sudo apt-get -y install python-dev python-pip python3-dev python3-pip
sudo apt-get -y install neovim xclip tmux parallel tree 

# create github directory
cd
mkdir -p /home/ubuntu/git

# pull bash config from my github
cd /home/ubuntu/git
rm -rf bash_profile
git clone https://github.com/jjlinscientist/bash_profile
ln -sf /home/ubuntu/git/bash_profile/.bash* /home/ubuntu/
source /home/ubuntu/.bashrc

# install vim-plug and pull neovim config from my github
curl -fLo /home/ubuntu/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cd /home/ubuntu/git
rm -rf config_nvim
git clone https://github.com/jjlinscientist/config_nvim
mkdir -p /home/ubuntu/.config/nvim/plugged
ln -sf /home/ubuntu/git/config_nvim/init.vim /home/ubuntu/.config/nvim/
ln -sf /home/ubuntu/git/config_nvim/vimrc.d /home/ubuntu/.config/nvim/

# pull tmux config from my github
cd /home/ubuntu/git
rm -rf tmux_config
git clone https://github.com/jjlinscientist/tmux_config
ln -sf /home/ubuntu/git/tmux_config/.tmux.conf /home/ubuntu/

# run nvim with :PlugInstall

nvim +PlugInstall +qall > /dev/null
nvim +UpdateRemotePlugins +qall > /dev/null

# change ownership of /home/ubuntu recursively
# cd /home/ubuntu
# chown -hR ubuntu:ubuntu .

# install other packages
sudo apt install -y r-base r-base-dev libssl-dev libcurl4-openssl-dev libxml2-dev
