#!/usr/bin/env bash

set -e
set -x

# set local time
ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
localectl set-keymap "us"
locale-gen
timedatectl set-ntp true

# set link to systemd-resolved
ln -sf /var/run/systemd/resolve/resolv.conf /etc/resolv.conf

# restore package cache if saved from previous install
if [ -e /vagrant/pkg.tgz ]
then
	cd /var/cache/pacman/pkg
	tar -xzvf /vagrant/pkg.tgz
	cd
fi

# update packages
pacman -Syu --noconfirm
pacman -S --noconfirm \
  python-dev \
  python-pip \
  python3-dev \
  python3-pip \
  xclip \
  tmux \
  parallel \
  tree \
  wget \
  docker.io

