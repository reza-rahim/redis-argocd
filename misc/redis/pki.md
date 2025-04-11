
```
openssl genpkey -algorithm RSA -out private_key.pem
openssl rsa -pubout -in private_key.pem -out public_key.pem

export NS=prod

kubectl create secret generic -n $NS rsa-keys \
  --from-file=private_key.pem \
  --from-file=public_key.pem

kubectl get secret -n $NS  rsa-keys -o yaml
```

```
openssl pkeyutl  -encrypt -inkey public_key.pem -pubin -in secret.txt -out encrypted.bin
openssl rsa -pubout -in private_key.pem -out public_key.pem
```
