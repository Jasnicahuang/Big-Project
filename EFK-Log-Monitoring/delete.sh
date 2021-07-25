#!/bin/bash
kubectl delete -f efk-ns.yaml
kubectl delete -f p-elasticsearch-svc.yaml
kubectl delete -f p-elasticsearch-statefulset.yaml
kubectl delete -f persistance-volume.yaml
kubectl delete -f p-kibana-dpy.yaml
kubectl delete -f p-ekf-ingress.yaml
kubectl delete -f filebeat-kubernetes.yaml
kubectl delete -f metricbeat-kubernetes.yaml
