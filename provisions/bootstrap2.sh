#!/usr/bin/env bash

# install neovim, optional dependencies
# install other packages
pacman -S --noconfirm neovim python-neovim xclip
pacman -S --noconfirm docker git tmux parallel tree

# pull bash config from my github
cd
mkdir -p ~/.config/bash
git clone https://github.com/jjlinscientist/bash_profile ~/.config/bash
ln -sf ~/.config/bash/.bash* ~/
source ~/.bashrc

# install Vundle and pull neovim config from my github
cd
mkdir -p ~/.config/nvim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
git clone https://github.com/jjlinscientist/nvim ~/.config/nvim/

# pull tmux config from my github
cd
git clone https://github.com/jjlinscientist/tmux_config ~/.config/tmux
ln -sf ~/.config/tmux/.tmux.conf ~/
