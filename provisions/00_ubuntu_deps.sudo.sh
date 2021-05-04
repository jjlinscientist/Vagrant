#/bin/bash

# ./00_ubuntu_bootstrap_use_sudo.sh
# ============================================================= 

# prepare environment
apt-get -y update
apt-get -y upgrade
apt-get -y install \
  software-properties-common \
  wget \
  python3-dev \
  python3-pip \
  xclip \
  tmux \
  curl \
  parallel \
  tree \
