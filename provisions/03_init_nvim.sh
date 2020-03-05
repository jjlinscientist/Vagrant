#!/bin/bash

appimages_dir="$HOME/appimages"

source $HOME/.bashrc
$appimages_dir/nvim/squashfs-root/usr/bin/nvim +PlugInstall +qall >> /dev/null
$appimages_dir/nvim/squashfs-root/usr/bin/nvim +UpdateRemotePlugins +qall >> /dev/null
