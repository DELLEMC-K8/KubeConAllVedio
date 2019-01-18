
kubeadm init --config kubeadm.yaml

mkdir -p $HOME/.kube
cp /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

kubectl create secret -n kube-system generic weave-passwd --from-literal=weave-passwd=$(hexdump -n 16 -e '4/4 "%08x" 1 "\n"' /dev/random)
kubectl apply -n kube-system -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')&password-secret=weave-passwd"
kubectl taint nodes --all node-role.kubernetes.io/master-


curl -sSL https://git.io/kube-dashboard | sed "s|image:.*|image: luxas/kubernetes-dashboard:v1.6.3|" | kubectl apply -f -
kubectl apply -f demos/dashboard/ingress.yaml

kubectl apply -f https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/rbac/heapster-rbac.yaml
curl -sSL https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/influxdb/heapster.yaml | \
	sed "s|image:.*|image: luxas/heapster:v1.4.0|" | kubectl apply -f -

# TODO: Start using PVs/PVCs for influxdb and grafana
kubectl apply -f demos/monitoring/influx-grafana.yaml

kubectl apply -f demos/loadbalancing/traefik-common.yaml
kubectl apply -f demos/loadbalancing/traefik-ngrok.yaml

# Install the Rook and Prometheus operators
ROOK_BRANCH=${ROOK_BRANCH:-"release-0.5"}
kubectl apply -f https://raw.githubusercontent.com/rook/rook/${ROOK_BRANCH}/cluster/examples/kubernetes/rook-operator.yaml
kubectl apply -f demos/monitoring/prometheus-operator.yaml

echo "Waiting for the Rook and Prometheus operators to create the TPRs/CRDs"
while [[ $(kubectl get cluster; echo $?) == 1 ]]; do sleep 1; done
while [[ $(kubectl get prometheus; echo $?) == 1 ]]; do sleep 1; done

# Requires the Rook and Prometheus API groups
kubectl apply -f https://raw.githubusercontent.com/rook/rook/${ROOK_BRANCH}/cluster/examples/kubernetes/rook-cluster.yaml
kubectl apply -f https://raw.githubusercontent.com/rook/rook/${ROOK_BRANCH}/cluster/examples/kubernetes/rook-storageclass.yaml
kubectl patch storageclass rook-block -p '{"metadata":{"annotations": {"storageclass.kubernetes.io/is-default-class": "true"}}}'

# Demo the autoscaling based on custom metrics feature
kubectl apply -f demos/monitoring/sample-prometheus-instance.yaml
kubectl apply -f demos/monitoring/sample-metrics-app.yaml
kubectl apply -f demos/monitoring/custom-metrics.yaml
kubectl create clusterrolebinding allowall-cm --clusterrole custom-metrics-server-resources --user system:anonymous

echo "Waiting for rook to create a Secret"
while [[ $(kubectl get secret rook-rook-user; echo $?) == 1 ]]; do sleep 1; done

# Requires the rook-rook-user
kubectl get secret rook-rook-user -oyaml | sed "/resourceVer/d;/uid/d;/self/d;/creat/d;/namespace/d" | kubectl -n kube-system apply -f -
kubectl create ns wardle
kubectl get secret rook-rook-user -oyaml | sed "/resourceVer/d;/uid/d;/self/d;/creat/d;/namespace/d" | kubectl -n wardle apply -f -

# Setup helm and install tiller
helm init
kubectl -n kube-system create serviceaccount tiller
kubectl -n kube-system patch deploy tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccountName":"tiller"}}}}'
kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount kube-system:tiller
kubectl -n kube-system set image deploy/tiller-deploy tiller=luxas/tiller:v2.6.1

# Demo an aggregated API server
kubectl apply -f demos/sample-apiserver/wardle.yaml
while [[ $(kubectl get flunder; echo $?) == 1 ]]; do sleep 1; done
kubectl apply -f demos/sample-apiserver/my-flunder.yaml
