#!/bin/bash
kubectl apply -f efk-ns.yaml
kubectl apply -f p-elasticsearch-svc.yaml
kubectl apply -f p-elasticsearch-statefulset.yaml
kubectl apply -f persistance-volume.yaml
kubectl apply -f p-kibana-dpy.yaml
kubectl apply -f p-ekf-ingress.yaml
kubectl apply -f filebeat-kubernetes.yaml
kubectl apply -f metricbeat-kubernetes.yaml
