#!/bin/bash

# Task 1
kubectl create deployment --image docker.io/nginx:1.17.8-alpine --replicas 6 --save-config web-app
kubectl set image deployments web-app nginx=docker.io/nginx:1.23.1-alpine
kubectl annotate deployments.apps web-app kubernetes.io/change-cause='Changed to nginx:1.23.1'

# Task 2
kubectl create deployment --image docker.io/nginx:1.17.8-alpine --replicas 4 --dry-run=client biz-app -o yaml > biz-app.deploy.yml
kubectl rollout history deployment biz-app
kubectl rollout undo deployment biz-app
kubectl get pod -o yaml | grep 1.17