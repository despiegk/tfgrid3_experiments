#!/bin/bash
pushd $TF_VAR_name
clear
echo
echo "THIS WILL TAKE 10-15 MINUTES !!!"
echo
terraform destroy  -auto-approve
terraform apply -parallelism=1  -auto-approve
popd