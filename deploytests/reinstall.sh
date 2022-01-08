#!/bin/bash
set -ex
clear
pushd $TF_VAR_name
echo
echo "THIS WILL TAKE 10-15 MINUTES !!!"
echo
terraform destroy  -auto-approve
terraform apply -parallelism=1  -auto-approve
popd