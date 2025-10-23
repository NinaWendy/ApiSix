------------------------------------------------------------------------------------------
# Docker install
------------------------------------------------------------------------------------------
docker pull apache/apisix-dashboard
docker run -d --name dashboard \
           -p 9000:9000        \
           -v <CONFIG_FILE>:/usr/local/apisix-dashboard/conf/conf.yaml \
           apache/apisix-dashboard

docker run -d --name dashboard \
           -p 9000:9000        \
           -v /usr/local/apisix-dashboard.yaml:/usr/local/apisix-dashboard/conf/conf.yaml \
           apache/apisix-dashboard

docker run -d --name dashboard \
  --network host \
  -v /usr/local/apisix-dashboard.yaml:/usr/local/apisix-dashboard/conf/conf.yaml \
  apache/apisix-dashboard


# Config file : /usr/local/apisix/conf/config-default.yaml
------------------------------------------------------------------------------------------
# RPM install
------------------------------------------------------------------------------------------
# 1. install RPM package
sudo yum install -y https://github.com/apache/apisix-dashboard/releases/download/v3.0.1/apisix-dashboard-3.0.1-0.el7.x86_64.rpm

# run dashboard in the shell
sudo manager-api -p /usr/local/apisix/dashboard/

# or run dashboard as a service
systemctl start apisix-dashboard

------------------------------------------------------------------------------------------
# Or Build directly from source
------------------------------------------------------------------------------------------
#The Dashboard project contains both manager-api and web, but web is optional.
## Prerequiste

1. For manager-api: Golang 1.16+

2. For web: - Node.js current LTS (14.x+)
            - Yarn

git clone -b release/3.0 https://github.com/apache/apisix-dashboard.git && cd apisix-dashboard

cd apisix-dashboard

make build

#Build output is stored in cd ./output

------------------------------------------------------------------------------------------
# Run Dashboard
------------------------------------------------------------------------------------------

#cd ./output
#./manager-api

mkdir -p /usr/local/apisix-dashboard

cp -rf ./output/* /usr/local/apisix-dashboard

# copy service unit
cp ./api/service/apisix-dashboard.service /usr/lib/systemd/system/apisix-dashboard.service
systemctl daemon-reload

# or: If you need to modify the service unit, you can use the following command
echo "[Unit]
Description=apisix-dashboard
Conflicts=apisix-dashboard.service
After=network-online.target

[Service]
WorkingDirectory=/usr/local/apisix-dashboard
ExecStart=/usr/local/apisix-dashboard/manager-api -c /usr/local/apisix-dashboard/conf/conf.yaml" > /usr/lib/systemd/system/apisix-dashboard.service

# start apisix-dashboard
systemctl start apisix-dashboard

# stop apisix-dashboard
systemctl stop apisix-dashboard

# check apisix-dashboard status
systemctl status apisix-dashboard


------------------------------------------------------------------------------------------
# Alternative Install
------------------------------------------------------------------------------------------

wget https://github.com/apache/apisix-dashboard/releases/download/v3.0.1/apisix-dashboard-3.0.1-linux-amd64.tar.gz

wget https://github.com/apache/apisix-dashboard/archive/refs/tags/v3.0.1.tar.gz

tar -zxvf apisix-dashboard-3.0.1-linux-amd64.tar.gz

tar -zxvf v3.0.1.tar.gz

cd apisix-dashboard-3.0.1

./apisix-dashboard
