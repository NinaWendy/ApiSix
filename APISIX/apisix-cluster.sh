#!/bin/bash

# amd64
wget -O - http://repos.apiseven.com/pubkey.gpg | sudo apt-key add -
echo "deb http://repos.apiseven.com/packages/debian bullseye main" | sudo tee /etc/apt/sources.list.d/apisix.list

#OR

# arm64
wget -O - http://repos.apiseven.com/pubkey.gpg | sudo apt-key add -
echo "deb http://repos.apiseven.com/packages/arm64/debian bullseye main" | sudo tee /etc/apt/sources.list.d/apisix.list

#Install APISIX
sudo apt update
sudo apt install -y apisix=3.14.0-0

#Once APISIX is installed, you can initialize the configuration file and etcd by running:
sudo apisix init

#Configure APISIX to Use etcd Cluster
#Edit /usr/local/apisix/conf/config.yaml:

deployment:
  role: data_plane
  role_data_plane:
    config_provider: etcd
etcd:
  host:
    - "http://x.x.x.x:2379"
    - "http://x.x.x.x:2379"
    - "http://x.x.x.x:2379"

#Start APISIX

sudo systemctl enable apisix

sudo systemctl start apisix

#Verify
curl http://127.0.0.1:9080
