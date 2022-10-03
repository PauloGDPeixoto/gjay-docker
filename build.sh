#!/bin/bash
VERSION=0.3.2
#VERSION=0.4.0

docker build -f Dockerfile.$VERSION \
             -t gjay:$VERSION \
             --network=host \
	         --build-arg UID=$UID \
             .
