#!/bin/bash
if [ "$1" == "--list" ] ; then
s3cmd get s3://leon4eg13ru-storage-bucket/prod/terraform.tfstate terraform.tfstate --force > /dev/null
APPSERVER=$(cat terraform.tfstate | jq '.outputs.external_ip_address_app.value')
DBSERVER=$(cat terraform.tfstate | jq '.outputs.external_ip_address_db.value')
rm terraform.tfstate
echo '{"app":{"hosts":['$APPSERVER']},"db":{"hosts":['$DBSERVER']}}' | jq '.'
elif [ "$1" == "--host" ]; then
s3cmd get s3://leon4eg13ru-storage-bucket/prod/terraform.tfstate terraform.tfstate --force > /dev/null
APPSERVER=$(cat terraform.tfstate | jq '.outputs.external_ip_address_app.value')
DBSERVER=$(cat terraform.tfstate | jq '.outputs.external_ip_address_db.value')
rm terraform.tfstate
echo '{"_meta": {"hostvars": {'$APPSERVER':{},'$DBSERVER': {}}}}' | jq '.'
else
  echo "{ }"
fi
