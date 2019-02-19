#!/bin/bash

#minikube delete &&
# minikube start --kubernetes-version=v1.13.2 --cpus 4 --memory=6096 --bootstrapper=kubeadm --extra-config=kubelet.authentication-token-webhook=true --extra-config=kubelet.authorization-mode=Webhook --extra-config=scheduler.address=0.0.0.0 --extra-config=controller-manager.address=0.0.0.0
#
# minikube addons enable ingress
# minikube addons enable heapster
# minikube addons enable metrics-server


# cni + network policy
minikube start --kubernetes-version=v1.13.2 --network-plugin=cni --extra-config=kubelet.network-plugin=cni  --cpus 4 --memory=6096 --network-plugin=cni --bootstrapper=kubeadm --extra-config=kubelet.authentication-token-webhook=true --extra-config=kubelet.authorization-mode=Webhook --extra-config=scheduler.address=0.0.0.0 --extra-config=controller-manager.address=0.0.0.0

kubectl create -f https://raw.githubusercontent.com/cilium/cilium/1.4.0/examples/kubernetes/1.13/cilium-minikube.yaml

minikube addons enable ingress
minikube addons enable heapster
minikube addons enable metrics-server
