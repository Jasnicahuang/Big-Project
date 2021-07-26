#!/bin/bash
kubectl delete -f 01-p-efk-ns.yaml
kubectl delete -f 02-p-elasticsearch-svc.yaml
kubectl delete -f 03-p-elasticsearch-statefulset.yaml
kubectl delete -f 04-p-elasticsearch-pv.yaml
kubectl delete -f 05-p-kibana-deploy.yaml
kubectl delete -f 06-p-efk-ingress.yaml
# Filebeat
#kubectl delete -f 07-p-filebeat-k8s.yaml
#kubectl delete -f 08-p-metricbeat-k8s.yaml

# Fluentd
kubectl delete -f 09-p-fluentd-k8s.yaml
