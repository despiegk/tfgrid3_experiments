pushd $TF_VAR_name
export IPADDR=`./terraform output -raw ygg_ip`
ssh -A root@$IPADDR 
popd