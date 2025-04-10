```

export NS=prod

kubectl apply -n $NS -f https://raw.githubusercontent.com/reza-rahim/redis-argocd/refs/heads/main/misc/redis/acl_configmap.yaml

kubectl get -n $NS ConfigMap redis-acl-config  

kubectl apply -n $NS -f https://raw.githubusercontent.com/reza-rahim/redis-argocd/refs/heads/main/misc/redis/redis-pod.yaml

kubectl logs  -n $NS redis-pod
kubectl describe   -n $NS po redis-pod

kubectl exec  -n $NS  -it redis-pod -- sh

kubectl delete  -n $NS -f redis-pod.yaml --grace-period=0 --force
```

```
curl -k -u "$USERNAME:$PASSWORD" https://rec:9443/v1/cluster
```

```
kubectl apply -n prod -f acl_configmap.yaml
```
