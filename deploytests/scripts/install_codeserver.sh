#!/bin/bash
set -ex
curl -fsSL https://code-server.dev/install.sh | sh
#if you want other passwd, change tfrocks
sed -i 's/password:.*/password: tfrocks/' ~/.config/code-server/config.yaml

mkdir -p /root/.config/code-server

cp codeserver_conf.yaml /root/.config/code-server/config.yaml

screen -admL -S codeserver code-server


