#!/bin/bash
podman rm -f 'holo'
sleep 5
DISPLAY=${DISPLAY:-":0"}
podman create --name holo --net=host --userns=keep-id --entrypoint=/bin/bash -e DISPLAY="$DISPLAY" -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/deck:/home/deck -u deck -ti holo:latest
podman start 'holo'
