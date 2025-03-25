## ArgoCD

![Alt text](images/argoCD.png)
---
## Deploy Redis Operator
### north/operator-chart

[Redis Enterprise Cluster API](https://github.com/RedisLabs/redis-enterprise-k8s-docs/blob/master/redis_enterprise_cluster_api.md)


```
operator-chart/
├── Chart.yaml
├── dev-values.yaml
├── prod-values.yaml
├── templates/
│   ├── bundle.yaml
```

### ArgoCD Operator application for dev env
north/helm-dev-redis-operator-argo.yaml
```
kubectl apply  -n argocd -f north/helm-dev-redis-operator-argo.yaml
```

### ArgoCD Operator application for prod env
north/helm-prod-redis-operator-argo.yaml
```
kubectl apply  -n argocd -f north/helm-prod-redis-operator-argo.yaml
```
---

## Deploy Redis Cluster
### north/rec-chart
```
rec-chart/
├── Chart.yaml
├── dev-values.yaml
├── prod-values.yaml
├── templates/
│   ├── rec.yaml
```

### ArgoCD cluster application for dev env
north/helm-dev-redis-rec-argo.yaml
```
kubectl apply  -n argocd -f north/helm-dev-redis-rec-argo.yaml
```

### ArgoCD cluster application for prod env
north/helm-prod-redis-rec-argo.yaml
```
kubectl apply  -n argocd -f north/helm-prod-redis-rec-argo.yaml
```
---
## Misc cluster mgmt
```
kubectl delete  -n dev rec rec --grace-period=0 --force

# Remove k8 finalizers for rec 
kubectl patch -n dev  rec/rec --type=merge -p '{"metadata": {"finalizers":null}}'

# delete pvc 
kubectl delete  -n dev pvc redis-enterprise-storage-rec-0  redis-enterprise-storage-rec-1 redis-enterprise-storage-rec-2

#log into a pod
kubectl exec  -it -c redis-enterprise-node  -n dev rec-0 -- bash  
```

---
## Deploy Redis Database
[Redis Enterprise Database API](https://github.com/RedisLabs/redis-enterprise-k8s-docs/blob/master/redis_enterprise_database_api.md)

```
db-1-chart/
├── Chart.yaml
├── dev-values.yaml
├── prod-values.yaml
├── templates/
│   ├── db-1.yaml
```

---
## Upgrade

