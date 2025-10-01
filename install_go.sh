-----------------------------------------------------------------------------------------
# Source Installtion
-----------------------------------------------------------------------------------------

rm -rf /usr/local/go && tar -C /usr/local -xzf go1.25.1.linux-amd64.tar.gz

wget https://go.dev/dl/go1.25.1.linux-amd64.tar.gz

sudo tar -C /usr/local -xzf go1.25.1.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin

source $HOME/.profile.
source ~/.bashrc


go version

-----------------------------------------------------------------------------------------
# APT Installation
-----------------------------------------------------------------------------------------
#Disclaimer, this will not install the latest version
sudo apt update

sudo apt install golang-go

