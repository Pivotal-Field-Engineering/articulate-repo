#!/bin/sh

set -eu
uname -a

curl -u ${HARBOR_USERNAME}:${HARBOR_PASSWORD} -k  --header "Content-Type: application/json" -X GET https://${HARBOR_HOST}/api/repositories/hemanth/pks-demo/tags/1.16.289 > /tmp/apple.json

cat /tmp/apple.json | yq r - "scan_overview.*.severity"