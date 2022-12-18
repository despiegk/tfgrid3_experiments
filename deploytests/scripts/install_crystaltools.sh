#!/bin/bash
set -ex

export DIR_CODE=/root/code

mkdir -p $DIR_CODE/github/freeflowuniverse
pushd $DIR_CODE/github/freeflowuniverse 2>&1 >> /dev/null
if [[ -d "$DIR_CODE/github/freeflowuniverse/crystaltools" ]]
then
    # cd crystaltools   
    # git pull
    # cd ..
else
    git clone --depth 1 --no-single-branch git@github.com:freeflowuniverse/crystaltools.git    
fi
popd 2>&1 >> /dev/null

mkdir -p /root/.vmodules/despiegk
pushd /root/.vmodules/despiegk 2>&1 >> /dev/null
if [[ -d "/root/.vmodules/despiegk/crystallib" ]]
then
    # cd crystallib   
    # git pull
    # cd ..
else
    git clone --depth 1 --no-single-branch git@github.com:freeflowuniverse/crystallib.git
    
fi

popd 2>&1 >> /dev/null


curl https://raw.githubusercontent.com/freeflowuniverse/crystaltools/development/install.sh > /tmp/install.sh

bash /tmp/install.sh

rm -f /root/code/github/freeflowuniverse/crystallib 
ln -s /root/.vmodules/despiegk/crystallib /root/code/github/freeflowuniverse/crystallib 