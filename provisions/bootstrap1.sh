#!/usr/bin/env bash

# set local time
ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
mv /etc/locale.gen /etc/locale.gen.backup
locale-gen

# restore package cache if saved from previous install
if [ -e /vagrant/pkg.tgz ]
then
	cd /var/cache/pacman/pkg
	tar -xzvf /vagrant/pkg.tgz
	cd
fi

# update packages
pacman -Syu --noconfirm
