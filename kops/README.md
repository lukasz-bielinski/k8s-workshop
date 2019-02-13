Kops
====

Creating the cluster:

```bash
source kops.env
kops create cluster --zones ${ZONE} ${NAME}
```

Connecting to an existing cluster:

```bash
touch kubeconfig-aws.yaml
export KUBECONFIG=`pwd`/kubeconfig-aws.yaml
echo export KUBECONFIG=`pwd`/kubeconfig-aws.yaml
kubectl config set-cluster aws-cluster --insecure-skip-tls-verify --server https://api-jwas-workshop-k8s-loc-tuitdd-916123474.us-west-1.elb.amazonaws.com >&2
kubectl config set-credentials aws-cluster-user --client-certificate kube-apiserver.pem --client-key kube-apiserver-key.pem >&2
kubectl config set-context aws --cluster aws-cluster --user aws-cluster >&2
kubectl config use-context aws >&2
```

Make sure `kube-apiserver.pem` and `kube-apiserver-key.pem` files exists.
