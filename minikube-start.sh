#!/bin/bash

#minikube delete &&
minikube start --kubernetes-version=v1.13.2 --cpus 4 --memory=6096 --bootstrapper=kubeadm --extra-config=kubelet.authentication-token-webhook=true --extra-config=kubelet.authorization-mode=Webhook --extra-config=scheduler.address=0.0.0.0 --extra-config=controller-manager.address=0.0.0.0

#minikube addons enable ingress
