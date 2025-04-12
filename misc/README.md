```
aws s3 cp s3://redis-argocd-bank/config.json ./config.json

#!/bin/sh
jq -c '.[]' config.json | while read -r item; do
  eval $(echo "$item" | jq -r 'to_entries|map("\(.key)=\(.value|@sh)")|.[]')

  # Example usage:
  echo "Processing user: $username with dir: $s3_dir"
done
```
