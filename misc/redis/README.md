```

export NS=prod

kubectl apply -n $NS  -f https://raw.githubusercontent.com/reza-rahim/redis-argocd/refs/heads/main/misc/redis/acl_configmap.yaml

kubectl get -n $NS ConfigMap redis-acl-config  

kubectl apply -n $NS -f https://raw.githubusercontent.com/reza-rahim/redis-argocd/refs/heads/main/misc/redis/redis-pod.yaml

kubectl logs  -n $NS redis-pod
kubectl describe   -n $NS po redis-pod

kubectl exec  -n $NS  -it redis-pod -- sh

kubectl delete  -n $NS po  redis-pod --grace-period=0 --force
```

```
curl -k -u "$USERNAME:$PASSWORD" https://rec:9443/v1/cluster
```

```
kubectl apply -n prod -f acl_configmap.yaml
```

### AWK key
```
kubectl create secret generic -n $NS --rm aws-credentials \
  --from-literal=AWS_ACCESS_KEY_ID=your-access-key-id \
  --from-literal=AWS_SECRET_ACCESS_KEY=your-secret-access-key
  -- sh
```
