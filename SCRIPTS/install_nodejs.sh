sudo apt update

sudo apt install nodejs

node -v

sudo apt install npm

------------------------------------------------------------------------------------
# Install from source
------------------------------------------------------------------------------------

cd ~
curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh

nano /tmp/nodesource_setup.sh

sudo bash /tmp/nodesource_setup.sh

sudo apt install nodejs

node -v

------------------------------------------------------------------------------------
# Installing Node Using the Node Version Manager
------------------------------------------------------------------------------------

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

source ~/.bashrc

nvm list-remote

nvm install 16

nvm list

------------------------------------------------------------------------------------
# Remove nodejs
------------------------------------------------------------------------------------

sudo apt remove nodejs

sudo apt purge nodejs

nvm current