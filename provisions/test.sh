# prepare directory
appimages_dir="/ops/appimages"
mkdir -p $appimages_dir/nvim/
chmod -R a+rwx $appimages_dir
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
