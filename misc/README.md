```
jq -c '.[]' config.json | while read -r item; do
  eval $(echo "$item" | jq -r 'to_entries | map("\(.key)=\(.value|@sh)") | .[]')
  
  echo "Region: $clusername, S3 Dir: $s3_dir, Primary: $primary"
done
```
