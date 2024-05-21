#!/bin/bash

# Commande used for this exercises

# Task 1
kubectl create deployment --image docker.io/nginx:stable-alpine3.19-perl --replicas 4 --port 80 nginx-deploy
kubectl expose deployment nginx-deploy --port 9000 --target-port 80 --type NodePort --name=nginx-svc

# Task 3
kubectl set selector service public-service "role=green"