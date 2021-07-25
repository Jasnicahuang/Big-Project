#!/bin/bash
kubectl delete -f 01-pg-grafana-configmap.yaml
kubectl delete -f 02-pg-grafana-deploy.yaml
kubectl delete -f 03-pg-grafana-svc.yaml
kubectl delete -f 04-pg-grafana-ingress.yaml

