#!/bin/bash

DIR=$(cd .. && pwd)
echo $DIR 
echo

# ./00_ubuntu_bootstrap_use_sudo.sh
# ============================================================= 

# prepare environment
apt-get -y update
apt-get -y upgrade
apt-get -y install \
  software-properties-common \
  wget \
  python3-dev \
  python3-pip \
  xclip \
  tmux \
  curl \
  parallel \
  tree \

# install other packages
# apt install -y \
  # docker.io \
  # awscli
  # r-base \
  # r-base-dev \
  # libssl-dev \
  # libcurl4-openssl-dev \
  # libxml2-dev \

# sudo ./01_get_nvim_deps.sh
# ============================================================= 
# install neovim dependencies

pip3 install neovim
pip3 install --upgrade pynvim
pip3 install --user jedi

# ./02_nvim_bootstrap.sh
# ============================================================= 

# prepare ops directory
appimages_dir="/ops/appimages"
mkdir -p $appimages_dir/nvim/
chmod -R a+rwx $appimages_dir/nvim/

cd $appimages_dir/nvim
rm -r ./*

# get nvim appimage
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod a+x nvim.appimage
./nvim.appimage --appimage-extract
mkdir -p $HOME/.local/bin/
echo "linking nvim to /usr/local/bin"
chmod -R a+rwx $appimages_dir/nvim/
ln -sf $appimages_dir/nvim/squashfs-root/usr/bin/nvim /usr/local/bin/
