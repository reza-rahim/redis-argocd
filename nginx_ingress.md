
```
helm install nginx-ingress ingress-nginx/ingress-nginx \
  --set controller.extraArgs.enable-ssl-passthrough=true
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
  
