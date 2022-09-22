#!/bin/bash
docker build -f Dockerfile \
             -t gjay \
             --network=host \
	         --build-arg UID=$UID \
             .
