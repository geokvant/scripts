#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "запускать этот скрипт только под управлением ROOT или с правами SUDO"
  exit
fi
docker stop portainer
docker rm portainer
docker pull portainer/portainer-ce
docker run -d -p 9443:9443 -p 8000:8000 \
-v /var/run/docker.sock:/var/run/docker.sock \
-v portainer_data:/data \
--name portainer \
portainer/portainer-ce:latest
