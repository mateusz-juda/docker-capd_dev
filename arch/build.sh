#!/bin/bash

set -e

ver="1.9.6"
registry="registry.capdnet.ii.uj.edu.pl:5000/capd/dev:${ver}"
docker build . -t "${registry}"

path="/mnt/remote/capdnet_shared/cloud/singularity/"

if [ ! -e "$path" ]; then
   path="$PWD"
fi

sing_img="${path}/capd_dev-${ver}.img"
echo "Creating ${sing_img}"

#export SINGULARITY_LOCALCACHEDIR=$HOME/tmp 
#export SINGULARITY_TMPDIR=$HOME/tmp
#export DOCKER_TMPDIR=$HOME/tmp

singularity build ${sing_img} "docker-daemon://${registry}"

docker push  "${registry}"

