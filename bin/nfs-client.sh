#!/bin/bash

export IP=${IP:-127.0.0.1}
export PORT=${PORT:-2049}
export DIR=${DIR:-data}

mkdir -p $DIR
sudo mount -v -o port=$PORT,vers=4,loud ${IP}:/ $DIR
