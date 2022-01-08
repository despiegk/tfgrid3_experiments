

## download terraform from right location

...


## how to use

### getting started


```bash
#get this repository
mkdir ~/code
cd ~/code
git clone https://github.com/despiegk/tfgrid3_experiments
cd tfgrid3_experiments/deploytests
#nr of you machine, handy for you to see name on your prompt and make sure your terraform script is different
export TF_VAR_nr=1
#node to use in TFGrid
export TF_VAR_node=22
#name of the directory in deploytests
export TF_VAR_name="docker1"
#your secret e.g. for codeserver, can be used for more
export TF_VAR_secret=tfrocks
export TF_VAR_emailaddr=aaaa@incubaid.com
#your mnemonics of TFGrid
export TF_VAR_mnemonics="TODO"
#we set the bash prompt
export PS1="$TF_VAR_nr> "
#if its the first time, will install terraform
./install_terraform
```

you should see something like:

```bash
READY TO GO!

COMMANDS:

- ./install_terraform
# install the machine if not done yet
- ./reinstall
# connect over ssh to the chosen machine
- ./connect_ssh
- ./connect_codeserver
- ./destroy

```

- now do 
  - ./reinstall
  - ./connect_ssh

you should see:

```bash
1> ./connect_ssh
~/code2/tfgrid3_experiments/deploytests/docker1 ~/code2/tfgrid3_experiments/deploytests
Warning: Permanently added '300:2589:76ee:f44e:1842:9632:768d:7aa0' (ED25519) to the list of known hosts.
Welcome to Ubuntu 20.04.3 LTS (GNU/Linux 5.12.9 x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

This system has been minimized by removing packages and content that are
not required on a system that users do not log into.

To restore this content, you can run the 'unminimize' command.
Last login: Sat Jan  8 12:18:57 2022 from 200:314f:b5d8:49f2:f3ca:4261:cdc1:e036

```

you should see something like above

you can now further work with the machine

```bash
#on machine you can do following
cd /tmp/scripts
#to install docker on the machine, takes a while, idea to create flists
bash install_docker.sh
#to install codeserver
bash install_codeserver.sh
#you can also play with a chroot (not very well tested yet)
bash install_chroot.sh
#check what other goodies there are in the script directory
```

this approach allows you to create scripts in scripts dir under deploytests and you can use them in your machine, which is very handy

Note that you can edit the main.tf and choose which modules to install by default.

## advanced

### scripts

are installed in /tmp/scripts

### login over ssh manually

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

### use screen

we use screen to start commands in background

```bash
#list the sessions
screen -ls
#attach to a session
screen -r $nameofsession_partial_ok
#kill session
screen -S $nameofsession_partial_ok -X quit

```

once attached, to go out do ```ctrl a d```
