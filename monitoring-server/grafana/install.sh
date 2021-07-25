#!/bin/bash
kubectl apply -f 01-pg-grafana-configmap.yaml
kubectl apply -f 02-pg-grafana-deploy.yaml
kubectl apply -f 03-pg-grafana-svc.yaml
kubectl apply -f 04-pg-grafana-ingress.yaml

