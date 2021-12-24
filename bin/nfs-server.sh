#!/bin/bash

export TARGET=${TARGET:-data}
export PORT=${PORT:-2049}
echo EXPOSE=$PORT
if [ ! -z $SQUASH ];
then
  echo SQUASHED
  export ANONUID=$(id -g)
  export ANONGID=$(id -u)
fi
export TARGET_DIR=${PWD}/${TARGET}
echo TARGET DIR=$TARGET_DIR
mkdir -p $TARGET_DIR

# NFS server run
docker run -it -d --name nfs-server --privileged --restart unless-stopped \
    -e SHARED_DIRECTORY=/shared -v $TARGET_DIR:/shared \
    -e SQUASH=$SQUASH -e ANONUID=$ANONUID -e ANONGID=$ANONGID \
    -p $PORT:2049 \
    ghcr.io/onetop21/nfs-server-alpine/nfs-server-alpine
