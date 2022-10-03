#!/bin/bash
VERSION=0.3.2

if [ -n "$1" ]; then MUSIC_FOLDER_MOUNT="-v $1:/home/gjay/Music"; fi
docker run -it --rm -e DISPLAY \
           -u `id -u` \
	       -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v ~/.gjay:/home/gjay/.gjay \
           $MUSIC_FOLDER_MOUNT \
	       gjay:$VERSION
