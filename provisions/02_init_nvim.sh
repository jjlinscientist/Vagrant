#!/bin/bash

# run nvim with :PlugInstall

$HOME/appimages/nvim/squashfs-root/usr/bin/nvim +PlugInstall +qall >> /tmp/nvim_install.log
$HOME/appimages/nvim/squashfs-root/usr/bin/nvim +UpdateRemotePlugins +qall >> /tmp/nvim_install.log
