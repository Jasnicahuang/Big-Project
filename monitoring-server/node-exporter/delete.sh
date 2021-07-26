#!/bin/bash
kubectl delete -f 01-pg-node-exporter-daemon.yaml
kubectl delete -f 02-pg-node-exporter-svc.yaml
