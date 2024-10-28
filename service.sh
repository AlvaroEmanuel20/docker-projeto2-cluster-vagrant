#!/bin/bash

sudo docker image pull nginx

sudo docker node update --availability drain master

sudo docker service create --name web-server \
    --replicas 4 --replicas-max-per-node 2 \
    -p 8080:80 \
    nginx

sudo docker service ps web-server