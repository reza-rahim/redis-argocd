

## north/operator-chart

```
operator-chart/
├── Chart.yaml
├── dev-values.yaml
├── prod-values.yaml
├── templates/
│   ├── bundle.yaml
```

### ArgoCD application for dev env
north/helm-dev-redis-operator-argo.yaml
```
kubectl apply  -n argocd -f north/helm-dev-redis-operator-argo.yaml
```

### ArgoCD application for prod env
north/helm-prod-redis-operator-argo.yaml
```
kubectl apply  -n argocd -f north/helm-prod-redis-operator-argo.yaml
```


-------------------- Misc -----------------------
```
# Remove k8 finalizers for rec 
kubectl patch -n <namespace>  rec/rec --type=merge -p '{"metadata": {"finalizers":null}}'

# delete pvc 
kubectl delete  -n dev pvc redis-enterprise-storage-rec-0  redis-enterprise-storage-rec-1 redis-enterprise-storage-rec-2
```

## Upgrade

