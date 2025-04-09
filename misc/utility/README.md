
```
kubectl apply -n prod -f redis-pod.yaml
kubectl logs -n prod redis-po
kubectl describe  -n prod po redis-pod

kubectl exec -n prod  -it redis-pod -- sh
```

```
curl -k -u "$USERNAME:$PASSWORD" https://rec:9443/v1/cluster
```
