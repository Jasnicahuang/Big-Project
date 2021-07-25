#!/bin/bash
kubectl apply -f 01-pg-metric-sa.yaml
kubectl apply -f 02-pg-metric-rbac.yaml
kubectl apply -f 03-pg-metric-deploy.yaml
kubectl apply -f 04-pg-metric-svc.yaml
