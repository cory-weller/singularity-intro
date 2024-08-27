#!/usr/bin/env bash

sudo apt-get update
DEBIAN_FRONTEND=noninteractive sudo apt-get install -y --no-install-recommends \
    build-essential \
    libssl-dev \
    uuid-dev \
    libgpgme11-dev \
    squashfs-tools \
    libseccomp-dev \
    wget \
    pkg-config \
    git \
    cryptsetup

sudo apt-get clean 
sudo rm -rf /var/lib/apt/lists/* 
export GOVERSION=1.17.3 OS=linux ARCH=amd64
sudo rm -rf /usr/local/go
wget -O /tmp/go${GOVERSION}.${OS}-${ARCH}.tar.gz https://dl.google.com/go/go${GOVERSION}.${OS}-${ARCH}.tar.gz
sudo tar -C /usr/local -xzf /tmp/go${GOVERSION}.${OS}-${ARCH}.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
. ~/.bashrc
git clone https://github.com/hpcng/singularity.git
cd singularity
git checkout v3.8.4
./mconfig
cd ./builddir
make
sudo make install
