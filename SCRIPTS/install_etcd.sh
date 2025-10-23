## Docker installtion
------------------------------------------------------------------------------------

sudo apt install virt-what 

sudo virt-what

sudo apt install docker.io

sudo docker run -d --name etcd -p 2379:2379 -e ETCD_UNSUPPORTED_ARCH=arm64 -e ETCD_LISTEN_CLIENT_URLS=http://0.0.0.0:2379 -e ETCD_ADVERTISE_CLIENT_URLS=http://0.0.0.0:2379 gcr.io/etcd-development/etcd:v3.5.1-arm64

sudo docker ps -a

------------------------------------------------------------------------------------
## Normal Installation

ETCD_VERSION='3.6.4'
wget https://github.com/etcd-io/etcd/releases/download/v${ETCD_VERSION}/etcd-v${ETCD_VERSION}-linux-amd64.tar.gz
tar -xvf etcd-v${ETCD_VERSION}-linux-amd64.tar.gz && \
  cd etcd-v${ETCD_VERSION}-linux-amd64 && \
  sudo cp -a etcd etcdctl /usr/bin/
nohup etcd >/tmp/etcd.log 2>&1 &

------------------------------------------------------------------------------------

## Remove etcd installtion

ps aux | grep etcd
pkill etcd
sudo rm -f /usr/bin/etcd /usr/bin/etcdctl
rm -rf etcd-v3.6.4-linux-amd64 etcd-v3.6.4-linux-amd64.tar.gz
rm -f /tmp/etcd.log
ss -tulpn

------------------------------------------------------------------------------------

## Cluster Installation




