#!/bin/bash
kubectl delete -f 01-pg-metric-sa.yaml
kubectl delete -f 02-pg-metric-rbac.yaml
kubectl delete -f 03-pg-metric-deploy.yaml
kubectl delete -f 04-pg-metric-svc.yaml
