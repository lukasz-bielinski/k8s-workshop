etcdctl

```
mkdir -p  /tmp/etcd
curl -L https://storage.googleapis.com/etcd/v3.2.24/etcd-v3.2.24-linux-amd64.tar.gz -o  /tmp/etcd/etcd.tar.gz

docker pull lukaszbielinski/ubuntu
docker run -v /tmp/etcd:/tmp/etcd lukaszbielinski/ubuntu  tar xvzf  /tmp/etcd/etcd.tar.gz  -C  /tmp/etcd/ --strip=1

```

backup

```
sudo ETCDCTL_API=3  /tmp/etcd/etcdctl --endpoints=https://127.0.0.1:2379 --cacert=/var/lib/minikube/certs/etcd/ca.crt --cert=/var/lib/minikube/certs/etcd/peer.crt --key=/var/lib/minikube/certs/etcd/peer.key snapshot save /tmp/etcd-snapshot.db
```


restore
```
sudo docker rm -f $(docker ps |grep etcd | awk '{print $1}') && \
sudo rm -rf /data/minikube && \
sudo ETCDCTL_API=3 /tmp/etcd/etcdctl snapshot restore /tmp/etcd-snapshot.db \
  --data-dir=/data/minikube \
  --name minikube \
  --initial-cluster m1=http://192.168.99.105:2380,m2=http://127.0.0.1:2380 \
  --initial-cluster-token etcd-cluster-1 \
  --initial-advertise-peer-urls http://192.168.99.105:2380
```
