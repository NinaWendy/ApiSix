-------------------------------------------------------------------------
# Global
-------------------------------------------------------------------------

sudo npm install -g yarn

yarn --version

-------------------------------------------------------------------------
# Project Level
-------------------------------------------------------------------------

mkdir my-project

cd my-project

yarn set version berry

#Remove --ignore-scripts in Makefile

# Switch yarn to the official npm registry
yarn config set registry https://registry.npmjs.org

# Clean any cached packages (removes taobao registry artifacts)
yarn cache clean

# Double-check that yarn is now pointing to npmjs.org
yarn config get registry
