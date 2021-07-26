#!/bin/bash
kubectl apply -f 01-p-efk-ns.yaml
kubectl apply -f 02-p-elasticsearch-svc.yaml
kubectl apply -f 03-p-elasticsearch-statefulset.yaml
kubectl apply -f 04-p-elasticsearch-pv.yaml
kubectl apply -f 05-p-kibana-deploy.yaml
kubectl apply -f 06-p-efk-ingress.yaml
# Filebeat
#kubectl apply -f 07-p-filebeat-k8s.yaml
#kubectl apply -f 08-p-metricbeat-k8s.yaml

# Fluentd
kubectl apply -f 09-p-fluentd-k8s.yaml
