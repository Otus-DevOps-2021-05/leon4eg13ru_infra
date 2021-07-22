#!/bin/bash
s3cmd get s3://leon4eg13ru-storage-bucket/stage/terraform.tfstate terraform.tfstate --force
APPSERVER=$(cat terraform.tfstate | jq '.outputs.external_ip_address_app.value')
DBSERVER=$(cat terraform.tfstate | jq '.outputs.external_ip_address_db.value')
echo '{"all":{"children":{"app":{"hosts":{'$APPSERVER':null}},"db":{"hosts":{'$DBSERVER':null}}}}}' | jq '.' > inventory.json
rm terraform.tfstate
