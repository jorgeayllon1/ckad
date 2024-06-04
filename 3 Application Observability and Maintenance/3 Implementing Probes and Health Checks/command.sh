#!/bin/bash

# Building image
docker build -f health-probes/dockerfile -t health-probes:v1 health-probes/
# Creating deployement
kubectl create deployment --image health-probes:v1 health-probes-deployment --dry-run=client -o yaml > health-probes-deployment.yml