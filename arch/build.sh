#!/bin/bash

set -x

ver="1.8.0"
registry="registry.capdnet.ii.uj.edu.pl:5000/capd/dev:${ver}"
docker build . -t "${registry}"
docker push  "${registry}"

sing_img="/mnt/remote/capdnet_shared/cloud/singularity/capd_dev-${ver}.img"
SINGULARITY_TMPDIR=$HOME/tmp singularity build ${sing_img} "docker://${registry}"

