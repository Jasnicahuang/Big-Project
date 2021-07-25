#!/bin/bash
kubectl delete -f 01-pg-monitoring-ns.yaml
kubectl delete -f 02-pg-monitoring-rbac.yaml
kubectl delete -f 03-pg-prometheus-configmap.yaml
kubectl delete -f 04-pg-prometheus-deploy.yaml
kubectl delete -f 05-pg-prometheus-svc.yaml
kubectl delete -f 06-pg-prometheus-ingress.yaml
