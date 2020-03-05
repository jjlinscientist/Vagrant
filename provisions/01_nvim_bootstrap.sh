#!/bin/bash

appimages_dir="$HOME/appimages"

# get nvim appimage
mkdir -p $appimages_dir/nvim/
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -O $appimages_dir/nvim.appimage
chmod a+x $appimages_dir/nvim.appimage
$appimages_dir/nvim.appimage --appimage-extract
mv -f squashfs-root $appimages_dir/nvim/
chmod a+x -R $appimages_dir/nvim/
sudo ln -sf $appimages_dir/nvim/squashfs-root/usr/bin/nvim /usr/local/bin

# install neovim dependencies
pip install neovim
pip3 install neovim
pip install pynvim
pip3 install pynvim
