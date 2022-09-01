#/bin/bash

# remove old docker (if present)
apt-get -y remove docker docker-engine docker.io containerd runc

# get new dependencies
apt-get -y install \
	ca-certificates \
	curl \
	gnupg \
	lsb-release

# add official GPG key
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# set up the repo
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" \
  | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# add read privileges to docker gpg
chmod a+r /etc/apt/keyrings/docker.gpg

# install docker engine
apt-get -y update
apt-get -y install \
	docker-ce \
	docker-ce-cli \
	containerd.io \
	docker-compose-plugin

# check correct install
docker run hello-world
