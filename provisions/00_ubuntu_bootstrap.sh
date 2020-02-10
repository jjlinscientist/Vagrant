#!/bin/bash

# perpare environment for neovim install
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install \
  software-properties-common \
  python-dev \
  python-pip \
  python-dev \
  python-pip \
  python3-dev \
  python3-pip \
  xclip \
  tmux \
  curl \
  parallel \
  tree \
  wget \
  docker.io

# install other packages
# sudo apt install -y \
  # docker.io \
  # awscli
  # r-base \
  # r-base-dev \
  # libssl-dev \
  # libcurl4-openssl-dev \
  # libxml2-dev \
