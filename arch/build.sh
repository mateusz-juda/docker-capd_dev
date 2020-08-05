#!/bin/bash

set -e

ver="1.10.0"
registry="registry.capdnet.ii.uj.edu.pl:5000/capd/dev:${ver}"
docker build --pull . -t "${registry}"

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
singularity build --sandbox  ${sing_img}.sandbox  ${sing_img}
tar cf ${sing_img}.sandbox.tar ${sing_img}.sandbox
rsync   ${sing_img}.sandbox.tar rm.c:/mnt/remote/capdnet_shared/cloud/singularity/

echo "ssh rm.c, cd singularity, tar xf ${sing_img}.sandbox.tar, singularity build ${sing_img} ${sing_img}.sandbox"
#docker push  "${registry}"

