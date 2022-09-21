#!/bin/bash
docker build -f Dockerfile \
             -t gjay \
	     --build-arg UID=$UID \
             .
