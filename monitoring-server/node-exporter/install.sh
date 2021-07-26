#!/bin/bash
kubectl apply -f 01-pg-node-exporter-daemon.yaml
kubectl apply -f 02-pg-node-exporter-svc.yaml
