### cluster_config.json
```
[
  {
    "clusername": "south",
    "s3_dir": "south",
    "primary": true
  },
  {
    "clusername": "north",
    "s3_dir": "north",
    "primary": false
  }
]
```
```

aws s3 cp s3://redis-argocd-bank/cluster_config.json ./cluster_config.json

export REC=south
export S3_BUCKET=redis-argocd-bank
#!/bin/sh
jq -c '.[]' cluster_config.json | while read -r item; do
  eval $(echo "$item" | jq -r 'to_entries|map("\(.key)=\(.value|@sh)")|.[]')
  
  if [ "$clusername" = "$REC" ]; then
    # Example usage:
    echo "clusername: $clusername, s3_dir: $s3_dir, primary: $primary"
    echo "username" | openssl pkeyutl  -encrypt -inkey public_key.pem -pubin  -out username.bin
    echo "password" | openssl pkeyutl  -encrypt -inkey public_key.pem -pubin  -out passwd.bin

    aws s3 cp username.bin s3://$S3_BUCKET/$s3_dir/
    aws s3 cp passwd.bin s3://$S3_BUCKET/$s3_dir/
  fi
done

```

```
#!/bin/sh
jq -c '.[]' cluster_config.json | while read -r item; do
  eval $(echo "$item" | jq -r 'to_entries|map("\(.key)=\(.value|@sh)")|.[]')

  # Example usage:
  echo "clusername: $clusername, s3_dir: $s3_dir, primary: $primary"
  rm -f username.bin passwd.bin
  aws s3 cp  s3://$S3_BUCKET/$s3_dir/username.bin /tmp/username.bin
  aws s3 cp  s3://$S3_BUCKET/$s3_dir/passwd.bin /tmp/passwd.bin

  export USERNAME=$(openssl pkeyutl -decrypt -inkey private_key.pem -in /tmp/username.bin | base64 )
  export PASSWD=$(openssl pkeyutl -decrypt -inkey private_key.pem -in /tmp/passwd.bin | base64 )
  echo $USERNAME $PASSWD

  kubectl create secret generic -n $namespace $clusername\
  --from-literal=username="$USERNAME" \
  --from-literal=password="$PASSWD"

done
```

```
#!/bin/bash

while true; do
  all_found=true

  # Loop over each cluster item in the JSON
  while IFS= read -r item; do
    eval $(echo "$item" | jq -r 'to_entries | map("\(.key)=\(.value|@sh)") | .[]')

    echo "🔍 Checking: s3://$S3_BUCKET/$s3_dir/username.bin"

    if ! aws s3 ls "s3://$S3_BUCKET/$s3_dir/username.bin" > /dev/null 2>&1; then
      echo "Not found: $s3_dir/username.bin"
      all_found=false
    else
      echo " Found: $s3_dir/username.bin"
    fi
  done < <(jq -c '.[]' cluster_config.json)

  # Exit only if all files were found
  if [ "$all_found" = true ]; then
    echo "All required S3 files are present!"
    break
  fi

  echo " Some files not ready yet, retrying in 5 seconds..."
  sleep 30
done
```
