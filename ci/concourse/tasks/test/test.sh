#!/bin/sh

set -eu
uname -a

wget -O /tmp/scan.json --no-check-certificate  --header "Authorization: Basic ${HARBOR_PASSWORD}" --header "Content-Type: application/json" https://${HARBOR_HOST}/api/repositories/hemanth/pks-demo/tags/1.16.289

cat /tmp/scan.json

cat /tmp/scan.json | yq r - "scan_overview.*.severity"