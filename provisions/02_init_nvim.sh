#!/bin/bash

$HOME/appimages/nvim/squashfs-root/usr/bin/nvim +PlugInstall +qall >> /dev/null
$HOME/appimages/nvim/squashfs-root/usr/bin/nvim +UpdateRemotePlugins +qall >> /dev/null
