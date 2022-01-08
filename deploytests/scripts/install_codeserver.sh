#!/bin/bash
set -ex
curl -fsSL https://code-server.dev/install.sh | sh

mkdir -p /root/.config/code-server
cp codeserver_conf.yaml /root/.config/code-server/config.yaml

# #if you want other passwd, change tfrocks, no longer needed because comes now from example config file
# sed -i 's/password:.*/password: tfrocks/' ~/.config/code-server/config.yaml

screen -admL -S codeserver code-server


