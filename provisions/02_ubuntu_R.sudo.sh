#/bin/bash

# ./03_setup_R.sh
# ============================================================= 

# prepare environment
apt-get -y update
apt install -y \
  r-base \
  r-base-dev \
  libssl-dev \
  libcurl4-openssl-dev \
  libxml2-dev \
  # docker.io \
  # awscli
