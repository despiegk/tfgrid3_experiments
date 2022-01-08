

## download terraform from right location

...


## how to use

### getting started

specify which dir you work with

```bash
export TF_VAR_name=docker_test
export TF_VAR_secret=asecret
export TF_VAR_emailaddr=???@incubaid.com
export TF_VAR_mnemonics="todo"
```

### login over ssh

```
export IPADDR=`./terraform output -raw ygg_ip`
ssh -At root@$IPADDR "cd /root; mc"
```

### use planetary network

- wiki: http://[300:2589:76ee:f44e:7cc:b27c:762a:a150]:8001/info
- codeserver directly over planetary network:
  - crystal lib: https://[300:2589:76ee:f44e:7cc:b27c:762a:a150]:8000/?folder=/root/.vmodules/despiegk
  - root: https://[300:2589:76ee:f44e:7cc:b27c:762a:a150]:8000/?folder=/root

### work with chroot

```
set -ex

apt install --assume-yes debootstrap
cd /root
export name=chroot_min2
mkdir -p $name
debootstrap --include=ssh,language-pack-en-base --variant=minbase --components=main,universe impish $name
mount -t proc /proc $name/proc
mount --rbind /sys $name/sys
mount --rbind /dev $name/dev
chroot $name /bin/bash
#ncdu
```

```
export name=chroot-ubuntu
umount $name/proc
umount $name/sys
umount $name/dev
```