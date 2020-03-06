#!/bin/bash

source $HOME/.bashrc
nvim +PlugInstall +qall >> /dev/null
nvim +UpdateRemotePlugins +qall >> /dev/null
