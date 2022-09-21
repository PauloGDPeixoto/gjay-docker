#!/bin/bash

docker run -it --rm -e DISPLAY \
           -u `id -u` \
	   -v /tmp/.X11-unix:/tmp/.X11-unix \
	   gjay
