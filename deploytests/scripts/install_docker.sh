#   apt install curl gpg sudo -y
apt-get update
apt-get install ca-certificates curl sudo gnupg lsb-release screen -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
apt-get install docker-ce docker-ce-cli containerd.io -y

# mkdir -p /etc/docker/
# cp /tmp/scripts/docker_daemon.json /etc/docker/daemon.json

# #start the docker engine
# screen -admL -S docker dockerd
# sleep 2

# set -e

# docker run hello-world

# pkill dockerd

# screen -S docker -X quit

# sleep 2

# mkdir -p /root/docker/
# rsync -aP /var/lib/docker/ /root/docker/

# rm -rf /var/lib/docker

# sleep 3

#start the docker engine
# screen -admL -S docker dockerd

