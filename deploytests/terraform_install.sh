pushd /tmp
rm -f terraform-install.sh
curl -LO https://raw.github.com/robertpeteuil/terraform-installer/master/terraform-install.sh
chmod +x terraform-install.sh
bash terraform-install.sh
popd

pushd docker_test
terraform init
popd





# if ! unzip -h 2&> /dev/null; then
#   echo "aborting - unzip not installed and required"
#   exit 1
# fi

# if curl -h 2&> /dev/null; then
#   nettool="curl"
# elif wget -h 2&> /dev/null; then
#   nettool="wget"
# else
#   echo "aborting - wget or curl not installed and required"
#   exit 1
# fi

# if [[ "$OSTYPE" == "linux-gnu"* ]]; then 
#     export url="https://releases.hashicorp.com/terraform/1.1.3/terraform_1.1.3_linux_amd64.zip"
# elif [[ "$OSTYPE" == "darwin"* ]]; then
#     export url="https://releases.hashicorp.com/terraform/1.1.3/terraform_1.1.3_darwin_arm64.zip"
#     export url="https://releases.hashicorp.com/terraform/1.1.3/terraform_1.1.3_darwin_amd64.zip"

# fi