# From Source Code
------------------------------------------------------------------------------------

git clone https://github.com/apache/apisix.git
cd apisix

# check latest release
git checkout release/3.13


sudo apt-get -y install --no-install-recommends wget gnupg ca-certificates
wget -O - https://openresty.org/package/pubkey.gpg | sudo apt-key add -

uname -m 

#For x86_64 or amd64 systems
echo "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main" \
    | sudo tee /etc/apt/sources.list.d/openresty.list

sudo apt-get update

sudo apt-get -y install openresty

---

sudo apt install wget sudo unzip

LUAROCKS_SERVER=https://luarocks.cn

bash utils/install-dependencies.sh

curl https://raw.githubusercontent.com/apache/apisix/master/utils/linux-install-luarocks.sh -sL | bash -

LUAROCKS_SERVER=https://luarocks.cn make deps

make install
# If you get an insufficient permissions message, use `sudo make install`

#Clean up
#rm -rf ~/.luarocks
#rm -rf deps
--- 
# confirm etcd is up and running

make deps

make install

#Increase file limit
ulimit -n 65536

apisix init

# start APISIX
apisix start

# stop APISIX
apisix stop

------------------------------------------------------------------------------------
# Docker Installation

git clone https://github.com/apache/apisix-docker.git
cd apisix-docker/example
docker-compose -p docker-apisix up -d

------------------------------------------------------------------------------------
# DEB Installation

# amd64
wget -O - http://repos.apiseven.com/pubkey.gpg | sudo apt-key add -
echo "deb http://repos.apiseven.com/packages/debian bullseye main" | sudo tee /etc/apt/sources.list.d/apisix.list

# arm64
wget -O - http://repos.apiseven.com/pubkey.gpg | sudo apt-key add -
echo "deb http://repos.apiseven.com/packages/arm64/debian bullseye main" | sudo tee /etc/apt/sources.list.d/apisix.list

sudo apt update
sudo apt install -y apisix=3.8.0-0

sudo apisix init
sudo apisix start


'!23@apisix*/'