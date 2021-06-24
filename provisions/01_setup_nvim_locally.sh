#!/bin/bash

DIR=$(cd .. && pwd)
echo $DIR 

# install neovim dependencies
# ============================================================= 

pip3 install neovim
pip3 install --upgrade pynvim
pip3 install --user jedi


# prepare ops directory
# ============================================================= 
appimages_dir=$HOME/ops/appimages
rm -rf $appimages_dir/nvim/
mkdir -p $appimages_dir/nvim/

# get nvim appimage
# ============================================================= 
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage \
  -O $appimages_dir/nvim/nvim.appimage
chmod a+x $appimages_dir/nvim/nvim.appimage

if [ -d $appimages_dir/nvim ]
then
  cd $appimages_dir/nvim/
  $appimages_dir/nvim/nvim.appimage --appimage-extract
  mkdir -p $HOME/.local/bin/
  echo "linking nvim to $HOME/.local/bin"
  chmod -R a+rwx $appimages_dir/nvim/
  ln -sf $appimages_dir/nvim/squashfs-root/usr/bin/nvim $HOME/.local/bin/
else
  echo "$appimages_dir does not exist!"
  exit 9999
fi

cd $DIR

# install vim-plug and copy neovim config from parent folder
# ============================================================= 
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p $HOME/.config/nvim/plugged
echo "linking init.vim"
ln -sfv $DIR/configs/nvim_config/init.vim $HOME/.config/nvim/
echo "linking vimrc.d"
ln -sfv $DIR/configs/nvim_config/vimrc.d $HOME/.config/nvim/


# install nvim plugins
# ============================================================= 
echo "installing nvim plugins..."
nvim +PlugInstall +qall >> /dev/null
echo "nvim updating remote plugins..."
nvim +UpdateRemotePlugins +qall >> /dev/null
echo "Done"
