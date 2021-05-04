#!/bin/bash

DIR=$(cd .. && pwd)
echo $DIR

# copy_personal_config.sh
# ============================================================= 

# copy R config from parent folder
echo "linking .Rprofile"
ln -sfv $DIR/configs/r_config/.Rprofile $HOME/
