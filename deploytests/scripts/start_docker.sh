#   apt install curl gpg sudo -y

mkdir -p /etc/docker/
cp /tmp/scripts/docker_daemon.json /etc/docker/daemon.json

#start the docker engine
screen -admL -S docker dockerd
sleep 2

set -e

docker run hello-world

pkill dockerd

screen -S docker -X quit

sleep 2

mkdir -p /root/docker/
rsync -aP /var/lib/docker/ /root/docker/

rm -rf /var/lib/docker

sleep 3

#start the docker engine
screen -admL -S docker dockerd

