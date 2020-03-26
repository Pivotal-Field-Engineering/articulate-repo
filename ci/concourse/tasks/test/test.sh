#!/bin/sh

set -eu
uname -a

wget -O /tmp/scan.json --user ${HARBOR_USERNAME} --password ${HARBOR_PASSWORD} --no-check-certificate  --header "Content-Type: application/json" -X GET https://${HARBOR_HOST}/api/repositories/hemanth/pks-demo/tags/1.16.289

apt-get install yq
cat /tmp/scan.json | yq r - "scan_overview.*.severity"