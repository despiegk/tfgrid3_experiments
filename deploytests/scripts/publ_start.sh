#!/bin/bash
set -ex
source /root/env.sh
export PUBSITE=https://github.com/threefoldfoundation/info_threefold_pub/tree/development/wiki_config
cd /root && publishtools flatten

