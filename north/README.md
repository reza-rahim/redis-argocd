

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

### ArgoCD application for prod env
north/helm-prod-redis-operator-argo.yaml


### k8 finalize 
```
kubectl patch -n <namespace>  rec/rec --type=merge -p '{"metadata": {"finalizers":null}}'
```
