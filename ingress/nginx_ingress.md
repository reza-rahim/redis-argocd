
### Set up nginx ingress controler
```
helm install nginx-ingress ingress-nginx/ingress-nginx \
  --set controller.extraArgs.enable-ssl-passthrough=true
```

### Setup ingress 
```
kubectl apply -f redis-ui.yaml -n dev
```

```
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: redis-ui
  namespace: dev
  annotations:
    nginx.ingress.kubernetes.io/ssl-passthrough: "true"  #
spec:
  ingressClassName: nginx
  rules:
  - host: redis.pki-redis.com
    http:
      paths:
        - path: /
          pathType: Prefix
          backend:
            service:
              name: rec-ui
              port:
                number: 8443
```
  
