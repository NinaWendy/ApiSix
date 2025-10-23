
#You can configure your APISIX deployment in two ways:

# 1. By directly changing your configuration file (conf/config.yaml).

# 2. By using the --config or the -c flag to pass the path to your configuration file while starting APISIX.

nano conf/config.yaml

apisix start -c <path to config file>

#APISIX will use the configurations added in this configuration file and will fall back to the default configuration if anything is not configured. 
#The default configurations can be found in apisix/cli/config.lua and should not be modified.