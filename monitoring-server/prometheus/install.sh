#!/bin/bash
kubectl apply -f 01-pg-monitoring-ns.yaml
kubectl apply -f 02-pg-monitoring-rbac.yaml
kubectl apply -f 03-pg-prometheus-configmap.yaml
kubectl apply -f 04-pg-prometheus-deploy.yaml
kubectl apply -f 05-pg-prometheus-svc.yaml
kubectl apply -f 06-pg-prometheus-ingress.yaml
