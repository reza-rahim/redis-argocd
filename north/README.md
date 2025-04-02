## Deploying Redis Enterprise with ArgoCD

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

kubectl exec  -it -c redis-enterprise-node  -n dev rec-0 -- bash -c 'rladmin status'
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

```
db-2-chart/
├── Chart.yaml
├── dev-values.yaml
├── prod-values.yaml
├── templates/
│   ├── db-2.yaml
```

```
kubectl apply  -n argocd -f helm-dev-redis-db-1-argo.yaml
kubectl apply  -n argocd -f helm-dev-redis-db-2-argo.yaml
```

---
## Active Active database


### Deploy Active Active Redis Cluster
#### north/rec-aa-chart
```
rec-aa-chart/
├── Chart.yaml
├── dev-values.yaml
├── prod-values.yaml
├── templates/
│   ├── rec.yaml
```

[Prepare participating clusters](https://redis.io/docs/latest/operate/kubernetes/active-active/prepare-clusters/)

[Edit participating clusters for Active-Active database](https://redis.io/docs/latest/operate/kubernetes/active-active/edit-clusters/)

#### Collect REC credentials
[rec_secret.yaml](https://github.com/reza-rahim/redis-argocd/blob/main/north/aa/rec_secret.yaml)

#### Create RERC
[rec_remote.yaml](https://github.com/reza-rahim/redis-argocd/blob/main/north/aa/rec_remote.yaml)

```
kubectl create -f rec_secret.yaml
kubectl create -f rec_remote.yaml
```

### Deploy Redis Active Active Database
```
aa-db-chart/
├── Chart.yaml
├── dev-values.yaml
├── prod-values.yaml
├── templates/
│   ├── reaadb.yaml
```




---
## Upgrade

