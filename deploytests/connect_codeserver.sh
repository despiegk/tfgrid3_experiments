pushd $TF_VAR_name
export IPADDR=`terraform output -raw ygg_ip`

#kill all screens with name ssh
for scr in $(screen -ls | grep ssh | awk '{print $1}'); do screen -S $scr -X quit; done

sleep 0.5

screen -admL -S ssh1 ssh -L 8080:127.0.0.1:8080 root@$IPADDR
screen -admL -S ssh2 ssh -L 9998:127.0.0.1:9998 root@$IPADDR

# ssh -A root@$IPADDR screen -admL -S codeserver code-server

popd

sleep 3

open 'https://localhost:8080/?folder=%2Froot%2F.vmodules%2Fdespiegk'

screen -ls


#to attach:
# screen -R
# screen -r codeserver
# to go out: ctrl a d




