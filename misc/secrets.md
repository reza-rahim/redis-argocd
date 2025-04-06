```
usename=`kubectl get secret rec -n dev -o jsonpath="{.data.username}" | base64 --decode`
password=`kubectl get secret rec -n dev -o jsonpath="{.data.password}" | base64 --decode`
```

```
kubectl get secret rec-north -n north  -o jsonpath="{.data.username}" | base64 --decode
kubectl get secret rec-north -n north  -o jsonpath="{.data.password}" | base64 --decode
```
kubectl get secret rec-south -n south  -o jsonpath="{.data.username}" | base64 --decode
kubectl get secret rec-south -n south  -o jsonpath="{.data.password}" | base64 --decode
```

