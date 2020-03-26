#!/bin/sh

set -eu
uname -a

apt-get update
apt-get install wget -y
apt-get install yq -y

wget -O /tmp/scan.json --user ${HARBOR_USERNAME} --password ${HARBOR_PASSWORD} --no-check-certificate  --header "Content-Type: application/json" -X GET https://${HARBOR_HOST}/api/repositories/hemanth/pks-demo/tags/1.16.289
cat /tmp/scan.json

cat /tmp/scan.json | yq r - "scan_overview.*.severity"