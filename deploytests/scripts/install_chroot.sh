set -ex

apt install debootstrap -y
cd /root
export name=chroot_min
mkdir -p $name
debootstrap --include=ssh,language-pack-en-base --variant=minbase --components=main,universe impish $name
mount -t proc /proc $name/proc
mount --rbind /sys $name/sys
mount --rbind /dev $name/dev

mkdir -p /root/code/github/threefoldtech
export CODEBASE=/root/code/github/threefoldtech
cd $CODEBASE
git clone git@github.com:threefoldtech/tf-images.git
cp $CODEBASE/tf-images/grid3_ubuntu20.04/init.sh /root/$name/
chmod +x /root/$name/init.sh



