```
usename=`kubectl get secret rec -n dev -o jsonpath="{.data.username}" | base64 --decode`
password=`kubectl get secret rec -n dev -o jsonpath="{.data.password}" | base64 --decode`
```
