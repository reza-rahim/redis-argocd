```
usename=`kubectl get -n dev secret rec -o json  | jq .data.usename |  tr -d '"' | base64 -d`
password=`kubectl get -n dev secret rec -o json  | jq .data.password |  tr -d '"' | base64 -d`
```
